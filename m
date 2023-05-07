Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BE47A6F95B8
	for <lists+alsa-devel@lfdr.de>; Sun,  7 May 2023 02:37:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C93F51F9B;
	Sun,  7 May 2023 02:36:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C93F51F9B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683419827;
	bh=GSH1WL7d6ax872BdSh/1lBGN59BcBO0z4UmRbu6g+BQ=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=W2x1CzBvLerreoX8/k6EBfXyx7OtfEVIKXi/odQvaUKiVZAdvUBLInt2N2SErUq/k
	 lQaJjdKbMAUsUVp9dJuMTfHnjAsmN+/YWVATdy/GEJd2SweNtSdWzprKOlj8GKpALx
	 jpb6FvoQAusrXvH6qCoPYWELLwEGGy1kg6lITIMc=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 439FBF80552;
	Sun,  7 May 2023 02:35:26 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 03855F8057B; Sun,  7 May 2023 02:35:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 267FDF80548
	for <alsa-devel@alsa-project.org>; Sun,  7 May 2023 02:35:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 267FDF80548
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=sOR1grem
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 18BCB61500;
	Sun,  7 May 2023 00:35:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E8A5C433EF;
	Sun,  7 May 2023 00:35:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683419720;
	bh=GSH1WL7d6ax872BdSh/1lBGN59BcBO0z4UmRbu6g+BQ=;
	h=From:To:Cc:Subject:Date:From;
	b=sOR1gremD5wAmz8An2aJEQWfweTqf/vfLxqnUjA/DgVqSg86drVcMgOwRMFQ9aMTy
	 k6bQ/OdHTNnMim5SIomYlSHn0ORsbu1hz8fKR9lHcW7l5DKRcstGgRfKBc/AwV/byy
	 qqf0+Re/csaWK7sPGe/aG6Mf7nz+lSl1QUNDMVubijhjNEj/Dtnx8IX3UE5DtkHlZ9
	 CAqf3lLL0sW6V2OpGG+FSKB6osFt9af3SQ32Iwt5CRV0HX+b0xkLsWhpP343XLmVxv
	 Bc0YdvmenIO0SIWWeiNCjQm4N/JZaxUfq2tiO7Nmcm/PuxCvRMbOu5wtmM77AUG/rN
	 aMiI2ZCRH3Dvg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 01/10] ASoC: jack: allow multiple interrupt per
 gpio
Date: Sat,  6 May 2023 20:35:07 -0400
Message-Id: <20230507003517.4078384-1-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Message-ID-Hash: RG2OCJZJRC5JPX6SRHBV7RPNHWZBSSNR
X-Message-ID-Hash: RG2OCJZJRC5JPX6SRHBV7RPNHWZBSSNR
X-MailFrom: sashal@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Svyatoslav Ryhel <clamor95@gmail.com>, Mark Brown <broonie@kernel.org>,
 Sasha Levin <sashal@kernel.org>, lgirdwood@gmail.com, tiwai@suse.com,
 alsa-devel@alsa-project.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RG2OCJZJRC5JPX6SRHBV7RPNHWZBSSNR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Svyatoslav Ryhel <clamor95@gmail.com>

[ Upstream commit a2d4051b0bd6dffcd736888ae89a550d6f60b060 ]

This feature is required for coupled hp-mic quirk used
by some Nvidia Tegra 3 based devices work properly.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Link: https://lore.kernel.org/r/20230221183211.21964-3-clamor95@gmail.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/soc-jack.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/soc-jack.c b/sound/soc/soc-jack.c
index d798765d168c4..a7256ad49b243 100644
--- a/sound/soc/soc-jack.c
+++ b/sound/soc/soc-jack.c
@@ -367,6 +367,7 @@ int snd_soc_jack_add_gpios(struct snd_soc_jack *jack, int count,
 
 		ret = request_any_context_irq(gpiod_to_irq(gpios[i].desc),
 					      gpio_handler,
+					      IRQF_SHARED |
 					      IRQF_TRIGGER_RISING |
 					      IRQF_TRIGGER_FALLING,
 					      gpios[i].name,
-- 
2.39.2

