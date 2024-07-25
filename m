Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ACF2994297D
	for <lists+alsa-devel@lfdr.de>; Wed, 31 Jul 2024 10:46:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 04DF21948;
	Wed, 31 Jul 2024 10:46:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 04DF21948
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722415617;
	bh=J0UpM5Bj3eNkwzorIQa07O7OnSNlm4+XiTCMxbvKN5Y=;
	h=Date:From:To:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=JVe1nKgDi5+msbZqPTSwz06Tw3MbYfM/v+w1V3jqxn8VL1jnakQTKAVJ3FMRryH1m
	 394cgvNhifLTlJsEhAHmhX7TX/fZ/vuC67cN6HUG0Z+Xfg9Qt9MJxpnUznU35ymKJ9
	 PsPl0JPBHtfOdietc1SFRlZaKRwkIlhZCPd+FFpM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7E868F805B0; Wed, 31 Jul 2024 10:46:07 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3903EF805B4;
	Wed, 31 Jul 2024 10:46:06 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EB366F8026D; Thu, 25 Jul 2024 13:32:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.3 required=5.0 tests=RDNS_NONE,SPF_HELO_PASS,
	SPF_PASS shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from legeek.net (unknown
 [IPv6:2a01:e0a:d77:fcd0:ba27:ebff:fe50:cb42])
	by alsa1.perex.cz (Postfix) with ESMTP id 3B74CF8007E
	for <alsa-devel@alsa-project.org>; Thu, 25 Jul 2024 13:32:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3B74CF8007E
Date: Thu, 25 Jul 2024 11:08:20 +0000
From: Sylvain BERTRAND <sylvain.bertrand@legeek.net>
To: alsa-devel@alsa-project.org
Subject: [PATCH][LINUX][ALSA][USB AUDIO CLASS 1] wrong channel ids for
 surround
Message-ID: <ZqIyJD8lhd8hFhlC@freedom>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
X-MailFrom: sylvain.bertrand@legeek.net
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: CIU7WSMS4BMIOLYXI5GP4OOWPSGCUT4W
X-Message-ID-Hash: CIU7WSMS4BMIOLYXI5GP4OOWPSGCUT4W
X-Mailman-Approved-At: Wed, 31 Jul 2024 08:46:02 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CIU7WSMS4BMIOLYXI5GP4OOWPSGCUT4W/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

In the USB audio class 1 specifications, page 33 (3.7.2.3 Audio Channel Cluster Format):

Surround is spatially defined as [rear], hence left surround should be SNDRV_CHMAP_RL and not SND_CHMAP_SL (Side).
Same for right surround channel.

Right?

I am not a mailing list subscriber, CC me please.

regards,

-- 
Sylvain BERTRAND


--- a/sound/usb/stream.c
+++ b/sound/usb/stream.c
@@ -244,8 +244,8 @@ static struct snd_pcm_chmap_elem *convert_chmap(int channels, unsigned int bits,
 		SNDRV_CHMAP_FR,		/* right front */
 		SNDRV_CHMAP_FC,		/* center front */
 		SNDRV_CHMAP_LFE,	/* LFE */
-		SNDRV_CHMAP_SL,		/* left surround */
-		SNDRV_CHMAP_SR,		/* right surround */
+		SNDRV_CHMAP_RL,		/* left surround */
+		SNDRV_CHMAP_RR,		/* right surround */
 		SNDRV_CHMAP_FLC,	/* left of center */
 		SNDRV_CHMAP_FRC,	/* right of center */
 		SNDRV_CHMAP_RC,		/* surround */

