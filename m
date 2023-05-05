Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 156596F86CB
	for <lists+alsa-devel@lfdr.de>; Fri,  5 May 2023 18:33:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E726A2D50;
	Fri,  5 May 2023 18:33:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E726A2D50
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683304438;
	bh=SZFrIi/mOGwhwb/18p4pmKbmEqWyigomjlijbnUNvcE=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jLGFnDkKpGSZh0wjszF/Hps6XI8QRYPDOWJLov4SsoIDOXCvRXK1yaePrchDAvn9y
	 7JRZtfnwUHTY05Nhx0csZKV1tcn5BcvMmxJsE6bZBxRdtCEILT6DR8segNQpd3Zh22
	 ErJStyXd54FAeEpaPyoYQU7WgexaLHX2jofjrSNE=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 66F6CF80529;
	Fri,  5 May 2023 18:33:07 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4E56EF8052D; Fri,  5 May 2023 18:33:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from bluemchen.kde.org (bluemchen.kde.org [209.51.188.41])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C9D30F80520
	for <alsa-devel@alsa-project.org>; Fri,  5 May 2023 18:32:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C9D30F80520
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id 9B8182008A;
	Fri,  5 May 2023 12:32:40 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1puyMK-iJ4-00; Fri, 05 May 2023 18:32:40 +0200
Date: Fri, 5 May 2023 18:32:40 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH 2/7] ALSA: pcm: fix playback silence - use the actual
 new_hw_ptr for the threshold mode
Message-ID: <ZFUvqPdpx/kzG5Ny@ugly>
Mail-Followup-To: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org,
	Jaroslav Kysela <perex@perex.cz>
References: <20230505103140.2285622-1-oswald.buddenhagen@gmx.de>
 <20230505103140.2285622-2-oswald.buddenhagen@gmx.de>
 <877ctmiyzy.wl-tiwai@suse.de>
 <ZFUmK+J76OuuAUmY@ugly>
 <871qjuiw94.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <871qjuiw94.wl-tiwai@suse.de>
Message-ID-Hash: QX6OCSVEEDUWX3M2OHODIIXZQKPCUGHZ
X-Message-ID-Hash: QX6OCSVEEDUWX3M2OHODIIXZQKPCUGHZ
X-MailFrom: ossi@kde.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QX6OCSVEEDUWX3M2OHODIIXZQKPCUGHZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, May 05, 2023 at 06:22:15PM +0200, Takashi Iwai wrote:
>On Fri, 05 May 2023 17:52:11 +0200, Oswald Buddenhagen wrote:
>> however, there is no need to add SOB to patches which i only reviewed
>> or suggested.
>
>SOB is needed by a person who submitted, no matter whether any other
>tags are present.  So, it's still mandatory in this case.
>
pedantically, yes. you can link to perex' patch instead, as it's 
literally the same one, sans the reviewed-by.

(i don't think any of this really matters for re-posts of patches that 
have been publicly posted to the same list a few hours prior, as any 
legal challenge could be resolved within minutes anyway.)

regards
