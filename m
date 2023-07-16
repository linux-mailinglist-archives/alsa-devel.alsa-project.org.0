Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D0EBE754EC4
	for <lists+alsa-devel@lfdr.de>; Sun, 16 Jul 2023 15:14:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CB94BDE5;
	Sun, 16 Jul 2023 15:13:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CB94BDE5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689513250;
	bh=suDSaRAHGjk+FpCXP/HObr2WS4K47egdVLbnNsdxaZk=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=IF641LW9wYa0r0oQwGAWcpPBL4Y91fEYAs8y0dfQFysvsT9eQ58BMsLXUEBXw27mI
	 aHOwzbseU2r47+1lMlLr/PIJ83A6q0Vm3RTw7cvc0P0fBa47UfC7RE5jLOZRZjmihI
	 R9BoKPuXAG61xyt7M3ScckCHgdCmPj4h6qDj0M9A=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2C951F80544; Sun, 16 Jul 2023 15:13:20 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CC21CF8032D;
	Sun, 16 Jul 2023 15:13:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 49FA0F8047D; Sun, 16 Jul 2023 15:13:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id E0C2DF80153
	for <alsa-devel@alsa-project.org>; Sun, 16 Jul 2023 15:13:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E0C2DF80153
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1689513193832679987-webhooks-bot@alsa-project.org>
References: <1689513193832679987-webhooks-bot@alsa-project.org>
Subject: Pass through encoded audio in the AC3 profile
Message-Id: <20230716131316.49FA0F8047D@alsa1.perex.cz>
Date: Sun, 16 Jul 2023 15:13:16 +0200 (CEST)
Message-ID-Hash: QP7LQ236VQ6RW3CVMDFOXCQEWPHGUXKS
X-Message-ID-Hash: QP7LQ236VQ6RW3CVMDFOXCQEWPHGUXKS
X-MailFrom: github@alsa-project.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QP7LQ236VQ6RW3CVMDFOXCQEWPHGUXKS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-plugins issue #53 was opened from AndrewAmmerlaan:

Is there any technical reason why it is not possible to `pactl set-sink-formats X "pcm dts-iec61937 ac3-iec61937"` when the `Digital Surround 5.1 IEC958/AC3 Output` profile is selected?

It would be convenient to not have to switch profiles when watching a movie with audio that is already encoded AC3.

I noticed the `dcaenc` plug-in for DTS encoding does the same thing. So maybe there is a good reason for this I'm not seeing.

Issue URL     : https://github.com/alsa-project/alsa-plugins/issues/53
Repository URL: https://github.com/alsa-project/alsa-plugins
