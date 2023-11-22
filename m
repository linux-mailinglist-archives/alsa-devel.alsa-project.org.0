Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BBFF07F4867
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Nov 2023 15:00:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4FCBDA4E;
	Wed, 22 Nov 2023 15:00:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4FCBDA4E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1700661632;
	bh=+Gctn5RcbWIHkH8nEd2PHUOHVP1grCHFopzLFhwfZj8=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=JvGLient+gmPdp15TSwvO/X+5UWwgHEa8DDu/ZwK5OnWSgJq72cN3uloPRiiph+Cq
	 w2K7g0YOifb6GAdCKaW/uRb1mieP736gEAJwt4/gpTbIwpqvrpdaiWGvBgnhUZdFDf
	 r1+J4JqxP+I9OH0//eOVSTeQdYRmMC0tjZeFAv7k=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 716F8F80563; Wed, 22 Nov 2023 15:00:11 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9D995F80578;
	Wed, 22 Nov 2023 15:00:10 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B4D4AF802E8; Wed, 22 Nov 2023 15:00:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 3CA25F80166
	for <alsa-devel@alsa-project.org>; Wed, 22 Nov 2023 14:59:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3CA25F80166
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1700661597727613926-webhooks-bot@alsa-project.org>
References: <1700661597727613926-webhooks-bot@alsa-project.org>
Subject: ucm2: Add support for MT8186 Corsola Steelix Chromebook with SOF
Message-Id: <20231122140006.B4D4AF802E8@alsa1.perex.cz>
Date: Wed, 22 Nov 2023 15:00:06 +0100 (CET)
Message-ID-Hash: 2BSLQH5UEZBHGDVRVSWPBWL2V33PANMD
X-Message-ID-Hash: 2BSLQH5UEZBHGDVRVSWPBWL2V33PANMD
X-MailFrom: github@alsa-project.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2BSLQH5UEZBHGDVRVSWPBWL2V33PANMD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf pull request #368 was opened from kholk:

Add support for the Lenovo 300e Yoga Chromebook Gen4, powered by MediaTek Kompanio 520 (MT8186) with a HiFi4 Audio DSP running SoundOpenFirmware.
This machine uses the MT6366 PMIC, with RT1019 and RT5862s as headphones and speaker codecs/amps.

This configuration has been successfully tested on ArchLinux with PipeWire 0.3.83 + WirePlumber.

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/368
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/368.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
