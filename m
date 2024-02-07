Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4609284D3A6
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Feb 2024 22:22:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B5B7B822;
	Wed,  7 Feb 2024 22:22:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B5B7B822
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707340960;
	bh=I6ACf0rheCfaTgMnCYw/5BfgrO0NFpeYQB8WyEw7xzQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=AcXb/+19T9vttfY+FHw2MKHiV1IU0nbk/2EBQvWOQJB4M2no7dmVSSuo0OlBjHdRQ
	 BgwjHaSUD+jOi3Zmjdk3v3MeWdG2LniBaeRIiTV5G2QsIm5+t4E+8kOPT4tHjas1WO
	 2cBkhSbCiy6XlKiL8BQ5LWRwydG+MdOfB9LLDaIc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A3407F801D5; Wed,  7 Feb 2024 22:22:08 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0D927F805A0;
	Wed,  7 Feb 2024 22:22:08 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 48F86F801EB; Wed,  7 Feb 2024 22:22:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AFE59F800E3
	for <alsa-devel@alsa-project.org>; Wed,  7 Feb 2024 22:21:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AFE59F800E3
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=p6G92GWT
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 50AD261ACA;
	Wed,  7 Feb 2024 21:21:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D479C433C7;
	Wed,  7 Feb 2024 21:21:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707340916;
	bh=I6ACf0rheCfaTgMnCYw/5BfgrO0NFpeYQB8WyEw7xzQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=p6G92GWTlBVh1F8qfOiGV7r824mxZPaXEeaGCqRsua6EsOVaMqZll1HUCLZiZ9kyy
	 gVf16Lz/5L6d4GTAeZ9TTpmxWdCLoLkLSUItJIi1Ya29D2IVN44duSjRPkeC0Nnheg
	 BGCX/+TPoVUWgqk3v/NdfXtiWMw9VS23F5VHoVyEds1GBsjCe8UBzFOAnVrJ9W2c7S
	 ZBcrcE7bVtlX9iOx2FIHF3R63SsG7nMiCdUoea5vKaKlwHwlQnz6qDouCxe5TdmfrG
	 Bx1mgydhy4yaHh0fLx2dPkXOh4Xa5deYihkYbP+frpfGe3X3ZDAymxQfZl+f5j8p+l
	 XyAVtkmnCgX+w==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Mark Brown <broonie@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	srinivas.kandagatla@linaro.org,
	bgoswami@quicinc.com,
	lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org
Subject: [PATCH AUTOSEL 6.7 07/44] ASoC: codecs: wcd934x: drop unneeded
 regulator include
Date: Wed,  7 Feb 2024 16:20:34 -0500
Message-ID: <20240207212142.1399-7-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240207212142.1399-1-sashal@kernel.org>
References: <20240207212142.1399-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.7.4
Content-Transfer-Encoding: 8bit
Message-ID-Hash: JX2PFXIS7OVLKNWVRWTKYJX2QIRXNZLE
X-Message-ID-Hash: JX2PFXIS7OVLKNWVRWTKYJX2QIRXNZLE
X-MailFrom: sashal@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JX2PFXIS7OVLKNWVRWTKYJX2QIRXNZLE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

[ Upstream commit 35314e39dabcfb256832654ad0e856a9fba744bd ]

Driver does not use any regulator code, so drop redundant include of
regulator/consumer.h header.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Link: https://msgid.link/r/20240117151208.1219755-3-krzysztof.kozlowski@linaro.org
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/codecs/wcd934x.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/codecs/wcd934x.c b/sound/soc/codecs/wcd934x.c
index 1b6e376f3833..6813268e6a19 100644
--- a/sound/soc/codecs/wcd934x.c
+++ b/sound/soc/codecs/wcd934x.c
@@ -13,7 +13,6 @@
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
-#include <linux/regulator/consumer.h>
 #include <linux/slab.h>
 #include <linux/slimbus.h>
 #include <sound/pcm_params.h>
-- 
2.43.0

