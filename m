Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 255FE732E17
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Jun 2023 12:29:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 446DC86E;
	Fri, 16 Jun 2023 12:28:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 446DC86E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686911354;
	bh=9/v84xVX9Fh50n5P16H8hP2KaHmXMwGYY7S3patTJbk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=JRpm1li0+k4Tgnm/EL36eY4/d0o91BRoEGnHc7KiQ0nLbGHZ1tgJhuPrhSl8cAZuz
	 FEpmUvmXJODbCMQK/Qju3hHc+aW2NI0kBye/lHlEXB2UoGD8T5KV48ZwMNmL2il1Wx
	 b5x/zWxgQhmcrgonl6ja6BJ8VALMu/b/2tVHETXU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 276DCF80155; Fri, 16 Jun 2023 12:26:43 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 85726F80130;
	Fri, 16 Jun 2023 12:26:43 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D2ADDF80155; Fri, 16 Jun 2023 12:26:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7123DF80130
	for <alsa-devel@alsa-project.org>; Fri, 16 Jun 2023 12:26:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7123DF80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=oVJRXV5U
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5C2D8611D8;
	Fri, 16 Jun 2023 10:26:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96C14C433C0;
	Fri, 16 Jun 2023 10:26:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686911196;
	bh=9/v84xVX9Fh50n5P16H8hP2KaHmXMwGYY7S3patTJbk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oVJRXV5UWWZb4WPpDOiCJzBUPwb2TnUZlaVGm8gzx9pyGvIrSeSfBgGaDoFkosiMC
	 kaqW2PUDTvIQwA+mFqXI2rwFfTwddCOs/h80CaiNcNG4DdU7KbY5X4/2Ln4bs6oCor
	 6yw9do/PVzQmJe97Qj2jR9LFc9vDDwV5xQR7XM8Q/N3IBh9lorq1N2ojByWSmautQn
	 Gg5tJodDEivcARM2+/7L1+uj1S2naFJN44TWjLfz/i+QOsdA2lvQiY7ybBru0lgDyF
	 icgELBrHTGyD/pn+GaEvGQEOxPZumiJFnlmvjsNxXqkqLILiqmuNnalXF7aHyD8Pxg
	 iSArXdzfyPwUQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Mark Brown <broonie@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	krzysztof.kozlowski@linaro.org,
	pierre-louis.bossart@linux.intel.com,
	alsa-devel@alsa-project.org
Subject: [PATCH AUTOSEL 6.1 06/26] ASoC: codecs: wcd938x-sdw: do not set
 can_multi_write flag
Date: Fri, 16 Jun 2023 06:26:03 -0400
Message-Id: <20230616102625.673454-6-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230616102625.673454-1-sashal@kernel.org>
References: <20230616102625.673454-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.34
Content-Transfer-Encoding: 8bit
Message-ID-Hash: O6KRVCGCEX5Q2GVAY4JFF7V54M6CBW5N
X-Message-ID-Hash: O6KRVCGCEX5Q2GVAY4JFF7V54M6CBW5N
X-MailFrom: sashal@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/O6KRVCGCEX5Q2GVAY4JFF7V54M6CBW5N/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

[ Upstream commit 2d7c2f9272de6347a9cec0fc07708913692c0ae3 ]

regmap-sdw does not support multi register writes, so there is
no point in setting this flag. This also leads to incorrect
programming of WSA codecs with regmap_multi_reg_write() call.

This invalid configuration should have been rejected by regmap-sdw.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Link: https://lore.kernel.org/r/20230523165414.14560-1-srinivas.kandagatla@linaro.org
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/codecs/wcd938x-sdw.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/codecs/wcd938x-sdw.c b/sound/soc/codecs/wcd938x-sdw.c
index 402286dfaea44..9c10200ff34b2 100644
--- a/sound/soc/codecs/wcd938x-sdw.c
+++ b/sound/soc/codecs/wcd938x-sdw.c
@@ -1190,7 +1190,6 @@ static const struct regmap_config wcd938x_regmap_config = {
 	.readable_reg = wcd938x_readable_register,
 	.writeable_reg = wcd938x_writeable_register,
 	.volatile_reg = wcd938x_volatile_register,
-	.can_multi_write = true,
 };
 
 static const struct sdw_slave_ops wcd9380_slave_ops = {
-- 
2.39.2

