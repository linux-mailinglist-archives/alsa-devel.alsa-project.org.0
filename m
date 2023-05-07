Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 432C76F954A
	for <lists+alsa-devel@lfdr.de>; Sun,  7 May 2023 02:31:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 05F4D170D;
	Sun,  7 May 2023 02:30:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 05F4D170D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683419491;
	bh=Gi/XeeeFJGaxdykTW9TYbF0cQECHu1dUcrdCmjj4qbA=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=J7lnoxT/1VmY9RPAj4Mea0cm9r9uGX0anbXdn31lp9ZzUplYDlfmBHc0FBaLjXGud
	 JQ/0wQGksCKAvLNEr/FQeoq3dLNIqjAcKagWOdKqOJ9hPzN/Y+K+Saiou0thFAY+Dm
	 uViIlokeEuFC8ZbTGImdCja/275O+jCt0krAXoSk=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3AE35F80310;
	Sun,  7 May 2023 02:30:40 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7E4EEF8032D; Sun,  7 May 2023 02:30:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1D8ACF80217
	for <alsa-devel@alsa-project.org>; Sun,  7 May 2023 02:30:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1D8ACF80217
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=KUw0hvhH
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C509760AAE;
	Sun,  7 May 2023 00:30:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34F32C433D2;
	Sun,  7 May 2023 00:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683419426;
	bh=Gi/XeeeFJGaxdykTW9TYbF0cQECHu1dUcrdCmjj4qbA=;
	h=From:To:Cc:Subject:Date:From;
	b=KUw0hvhH3QF0pFpUm20Soa/9FVUWSDNmjIa8j7DvOnmnINMsgrsenv1li57a67dtw
	 yEWJkhi+V11zBKMoAbkWk+2jDzlDbmMWRwNj1lmRTDHPsa97WP9mqTaamFjLWe7Rhd
	 69fcJ3EGj6yGSEzZgRs3rdIBEMmZnodA84YVkJiPOUcsAIvlnLhbSAFJpiYNzdsCRu
	 moIdVyF4QHw2yWZLUp5W9sQZauqwU7RyrB95AP1OiLib9EO1QPc3fYWypUkR2brcui
	 V3DauSfFnDOjOlJpSMsRqV8na3CnUw3LF1P1kWGQ9h1sUIgaDKoVQpCQXvut17DO3g
	 EAdKuSVd2k7Og==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.3 01/24] ASoC: jack: allow multiple interrupt per
 gpio
Date: Sat,  6 May 2023 20:29:57 -0400
Message-Id: <20230507003022.4070535-1-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Message-ID-Hash: EVAJYGAYMKFO5TUWDK6RZYV4T4GZKBTD
X-Message-ID-Hash: EVAJYGAYMKFO5TUWDK6RZYV4T4GZKBTD
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EVAJYGAYMKFO5TUWDK6RZYV4T4GZKBTD/>
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
index fcece5ca38c69..f951acb2ce362 100644
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

