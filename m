Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 52EF8C3820B
	for <lists+alsa-devel@lfdr.de>; Wed, 05 Nov 2025 22:58:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BC7D1601D8;
	Wed,  5 Nov 2025 22:58:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BC7D1601D8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1762379927;
	bh=4XfEzJMFTsQsv2VHiliqUmWShtKHaSIuU5ICfF4L5d0=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=hePyVPf89/u06vQi2Q0E8lYevE1sDeV6EjuT614pOTb6Kjhya6VdBcUHVQpK3LKLN
	 35e2Yx3RmkOXFTcRvFuSQX1i4twm6i+PmiXhw8DCzKMWQCeX+QQ7uRwMLr/jusqcKM
	 +FFx0XJpbNv3G8rLkNvPH4UFrS/xwKAs+hn/PpW8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CBECDF805D5; Wed,  5 Nov 2025 22:58:13 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 81216F805C2;
	Wed,  5 Nov 2025 22:58:13 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 89672F8020D; Wed,  5 Nov 2025 22:55:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=BAYES_00,KHOP_HELO_FCRDNS,
	MISSING_DATE,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id D7F9AF800FA
	for <alsa-devel@alsa-project.org>; Wed,  5 Nov 2025 22:55:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D7F9AF800FA
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <18753b096ae79d00-webhooks-bot@alsa-project.org>
In-Reply-To: <18753b09659aec00-webhooks-bot@alsa-project.org>
References: <18753b09659aec00-webhooks-bot@alsa-project.org>
Subject: MOTU UltraLight mk5 USB mode switching
Date: Wed,  5 Nov 2025 22:55:45 +0100 (CET)
Message-ID-Hash: PLTATM2V6ZOTDCV6RMFS3F4TE2IR2UXJ
X-Message-ID-Hash: PLTATM2V6ZOTDCV6RMFS3F4TE2IR2UXJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PLTATM2V6ZOTDCV6RMFS3F4TE2IR2UXJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf issue #635 was opened from TeeTeufel:

Hi,

I am currently stuck getting higher sample rates work with the MOTU UltraLight mk5.
Automatic switching between 44.1 and 48khz works fine, but anything higher not.

For 88.2/96 khz and 176.4/192 khz the USB mode must be switched, but nothing happens.

When setting the sample rate on the audio interface itself, audio output stays silent.

**System**:
- Fedora 43
- Pipewire
- Latest firmware on the interface

What do you need from me?

Could this be an issue with pipewire rather than alsa or ucm?
If yes, do you maybe have any resources that could give me some hints?
Consulting existing issues, forums, chatgpt and perplexity did not result in any improvement.

Thank you very much for anything that could help.

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/635
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
