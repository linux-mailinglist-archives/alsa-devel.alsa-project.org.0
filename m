Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 12B9778C59F
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Aug 2023 15:34:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5053A84B;
	Tue, 29 Aug 2023 15:33:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5053A84B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693316066;
	bh=24D+O0ROl68RuyCISL7V7d9L9V1jcNP9honW3jJuhUs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=fRmRGIhU0Zs50Hu2fNIO/co1DvqeDXzKzfO5KH3O62mM+67A1lCUJVxQZaCrA/lZH
	 EY9nW6g3Uh1pc/as+ZLLalUHPiuCGjq4CPnfuz/LVJXtnQCK2jgHWgQYuMsu5bETYc
	 BRRYx/aaKdrlk02HXDGI2ACN7atLuoUzxdJ2gv0o=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F3FE2F8032D; Tue, 29 Aug 2023 15:32:49 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AA2C7F80527;
	Tue, 29 Aug 2023 15:32:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 42487F80158; Tue, 29 Aug 2023 15:32:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 389CEF800F5
	for <alsa-devel@alsa-project.org>; Tue, 29 Aug 2023 15:32:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 389CEF800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Qgm5eoM4
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3D16B65751;
	Tue, 29 Aug 2023 13:32:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CB00C433CB;
	Tue, 29 Aug 2023 13:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693315954;
	bh=24D+O0ROl68RuyCISL7V7d9L9V1jcNP9honW3jJuhUs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Qgm5eoM4cTdmz4vncnGIMyHoqPInDfSPCKHJr5e/3bGWaAysFZj5Z9ErvuZqIIyt/
	 JKSwe3v1z+oFEfmC/KoakXVqivDtAXTlQXXNRYwOWkr9Yl5kCKXJ52+pVuEvSWqMCS
	 zvg5JJtPWv4E2uHo0c/o9wDMMSk4nehC6alsABAWe3pFBpFQouFYSvSpKP62KgjPjO
	 IshuOYxxkyHltHtSSSP0sB1tvwgJiWawUYwlo4zMJ904aAIA4cP57l6Uyo3Ouur0WP
	 H9RkgaUxN/8ziesGvwpu5Bgy6Ox6At3KhmqhaokOJclEe/9Pxx5rJuZfbL3zlKwZYH
	 AULC9OdoIdmgQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Shuming Fan <shumingf@realtek.com>,
	Sasha Levin <sashal@kernel.org>,
	oder_chiou@realtek.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org
Subject: [PATCH AUTOSEL 6.4 12/17] ASoC: rt1308-sdw: fix random louder sound
Date: Tue, 29 Aug 2023 09:31:59 -0400
Message-Id: <20230829133211.519957-12-sashal@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230829133211.519957-1-sashal@kernel.org>
References: <20230829133211.519957-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.4.12
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 6P6QEWCZ2VLJTVXDO3O2RXYAXEX7A4Z6
X-Message-ID-Hash: 6P6QEWCZ2VLJTVXDO3O2RXYAXEX7A4Z6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6P6QEWCZ2VLJTVXDO3O2RXYAXEX7A4Z6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Shuming Fan <shumingf@realtek.com>

[ Upstream commit 37aba3190891d4de189bd5192ee95220e295f34d ]

This patch uses a vendor register to check whether the system hibernated ever.
The driver will only set the preset when the driver brings up or the system hibernated.
It will avoid the unknown issue that makes the speaker output louder and can't control the volume.

Signed-off-by: Shuming Fan <shumingf@realtek.com
Link: https://lore.kernel.org/r/20230811093822.37573-1-shumingf@realtek.com
Signed-off-by: Mark Brown <broonie@kernel.org
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/codecs/rt1308-sdw.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/rt1308-sdw.c b/sound/soc/codecs/rt1308-sdw.c
index 1797af824f60b..e2699c0b117be 100644
--- a/sound/soc/codecs/rt1308-sdw.c
+++ b/sound/soc/codecs/rt1308-sdw.c
@@ -52,6 +52,7 @@ static bool rt1308_volatile_register(struct device *dev, unsigned int reg)
 	case 0x300a:
 	case 0xc000:
 	case 0xc710:
+	case 0xcf01:
 	case 0xc860 ... 0xc863:
 	case 0xc870 ... 0xc873:
 		return true;
@@ -213,7 +214,7 @@ static int rt1308_io_init(struct device *dev, struct sdw_slave *slave)
 {
 	struct rt1308_sdw_priv *rt1308 = dev_get_drvdata(dev);
 	int ret = 0;
-	unsigned int tmp;
+	unsigned int tmp, hibernation_flag;
 
 	if (rt1308->hw_init)
 		return 0;
@@ -242,6 +243,10 @@ static int rt1308_io_init(struct device *dev, struct sdw_slave *slave)
 
 	pm_runtime_get_noresume(&slave->dev);
 
+	regmap_read(rt1308->regmap, 0xcf01, &hibernation_flag);
+	if ((hibernation_flag != 0x00) && rt1308->first_hw_init)
+		goto _preset_ready_;
+
 	/* sw reset */
 	regmap_write(rt1308->regmap, RT1308_SDW_RESET, 0);
 
@@ -282,6 +287,12 @@ static int rt1308_io_init(struct device *dev, struct sdw_slave *slave)
 	regmap_write(rt1308->regmap, 0xc100, 0xd7);
 	regmap_write(rt1308->regmap, 0xc101, 0xd7);
 
+	/* apply BQ params */
+	rt1308_apply_bq_params(rt1308);
+
+	regmap_write(rt1308->regmap, 0xcf01, 0x01);
+
+_preset_ready_:
 	if (rt1308->first_hw_init) {
 		regcache_cache_bypass(rt1308->regmap, false);
 		regcache_mark_dirty(rt1308->regmap);
-- 
2.40.1

