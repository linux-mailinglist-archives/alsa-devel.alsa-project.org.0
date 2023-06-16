Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CEAA3732AF4
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Jun 2023 11:04:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CE693850;
	Fri, 16 Jun 2023 11:03:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CE693850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686906265;
	bh=42cOD8sz+eZUMd05BlQRxt1PSMlj4opjLa8x0yA5QWM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=t7CjiLz2CrDJE2iVvB5p1klxHAm3OkVLAuMoND4+y22l32BkccsH7yvw+QehvU/F9
	 HdLyotTNPW40godTvw30coxjc2QJ8VOjSIel/2FZchrL7VpdEbn5u7u+jjXd9zXg/m
	 92Mh1hDCcLsba2CBSQctVrQZ9YqVUQlQ5i4C5CP8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 601F1F8057E; Fri, 16 Jun 2023 11:02:44 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 23D05F8055B;
	Fri, 16 Jun 2023 11:02:44 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 81EF5F80579; Fri, 16 Jun 2023 11:02:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 15C13F80578
	for <alsa-devel@alsa-project.org>; Fri, 16 Jun 2023 11:02:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 15C13F80578
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=iJXuogqa
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id BDF946117F;
	Fri, 16 Jun 2023 09:02:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4186AC433C0;
	Fri, 16 Jun 2023 09:02:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686906157;
	bh=42cOD8sz+eZUMd05BlQRxt1PSMlj4opjLa8x0yA5QWM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iJXuogqaG3pv8w5YBkzuy6w/IMARU40BcnF+lxrWkGc/JB4SdZjvJJOcZdkV4p2Ik
	 vu0A4ay0HhMJPCfnUvyg5jEWm9IyaNmk9Syv+COU4crsF5D984lMHNJo/n3vdnSoen
	 y9sT1rAPEjXpIkhFkx8r02RxTDNh6ACIptapPE7+7Muf8D6GKpV18zNnrYtzCltXU9
	 /MkJd0fXODF6REfxs6R5/SnxPtIAobq/BQec2KAeJojrAjtzE+DNjLOQxiiUTFrUL6
	 iawgZ8PNzdctrsWcXopE0hKxjHT3hgio17OiHDV0Xdou4BaNHXH3FikiJMX8IRpYs3
	 dpahOeAN2yxCA==
From: Arnd Bergmann <arnd@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Yingkun Meng <mengyingkun@loongson.cn>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] ASoC: loongson: fix compile testing on 32-bit
Date: Fri, 16 Jun 2023 11:00:40 +0200
Message-Id: <20230616090156.2347850-4-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230616090156.2347850-1-arnd@kernel.org>
References: <20230616090156.2347850-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: KKJ2MUVOWHXDWCIVCEYZWL63SKEYITLP
X-Message-ID-Hash: KKJ2MUVOWHXDWCIVCEYZWL63SKEYITLP
X-MailFrom: arnd@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KKJ2MUVOWHXDWCIVCEYZWL63SKEYITLP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Arnd Bergmann <arnd@arndb.de>

DIV_ROUND_CLOSEST() does not work on 64-bit variables when building for
a 32-bit target:

ld.lld: error: undefined symbol: __udivdi3
>>> referenced by loongson_i2s.c
>>>               sound/soc/loongson/loongson_i2s.o:(loongson_i2s_hw_params) in archive vmlinux.a

Use DIV_ROUND_CLOSEST_ULL() instead.

Fixes: d24028606e764 ("ASoC: loongson: Add Loongson ASoC Sound Card Support")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 sound/soc/loongson/loongson_i2s.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/loongson/loongson_i2s.c b/sound/soc/loongson/loongson_i2s.c
index f73b6d6f16c23..b919f0fe83615 100644
--- a/sound/soc/loongson/loongson_i2s.c
+++ b/sound/soc/loongson/loongson_i2s.c
@@ -89,7 +89,7 @@ static int loongson_i2s_hw_params(struct snd_pcm_substream *substream,
 		bclk_ratio = DIV_ROUND_CLOSEST(sysclk,
 					       (bits * chans * fs * 2)) - 1;
 		mclk_ratio = clk_rate / sysclk;
-		mclk_ratio_frac = DIV_ROUND_CLOSEST(((u64)clk_rate << 16),
+		mclk_ratio_frac = DIV_ROUND_CLOSEST_ULL(((u64)clk_rate << 16),
 						    sysclk) - (mclk_ratio << 16);
 
 		regmap_read(i2s->regmap, LS_I2S_CFG, &val);
-- 
2.39.2

