Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D787C76A5
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Oct 2023 21:23:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BDFFCE12;
	Thu, 12 Oct 2023 21:22:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BDFFCE12
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697138625;
	bh=MF8UBOB+RPE0pevjlqdlPzoxbZCXJJU1HHFY/SxZI4k=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=IKILiVBV+DnhH8ICKGCQqn+gTyW/wRZqfHVXdjce0JL97MBOuMxlPYxZ5+wVUNoQ/
	 pPqSi26mi+DfiJcSYHqraeqRF2Fo3JWsdBtCvr41SG1q2nQyLX/YFL1UtvhvZcAy6b
	 47jNJvmDowwqWDEsPlO7ScxLtLtQWP8W6y2TfWIk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F3CF8F802E8; Thu, 12 Oct 2023 21:22:35 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AF1E2F8027B;
	Thu, 12 Oct 2023 21:22:35 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A5F3EF802BE; Thu, 12 Oct 2023 21:22:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 248FEF8019B
	for <alsa-devel@alsa-project.org>; Thu, 12 Oct 2023 21:22:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 248FEF8019B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=t3WBVe0K
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 97112B826AD;
	Thu, 12 Oct 2023 19:22:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3C38C433C8;
	Thu, 12 Oct 2023 19:22:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697138547;
	bh=MF8UBOB+RPE0pevjlqdlPzoxbZCXJJU1HHFY/SxZI4k=;
	h=From:To:Cc:Subject:Date:From;
	b=t3WBVe0Kz1NyMj9SaVq+OxmMJKYeJHubR9/Ls9IDo/l4bjOajqO6UNd3Ajp3VfcKj
	 eub6+1W6z9XCCsI4c1sFekcl1FAVPhTOUtEdDEtWDp00WlTJqNO6v3f8NYnQEcekLP
	 PZmutOGGzl2NwdX0CueZQ5ARlcPbv13GySqtL5jSu3EdjI+u0RZR/dTFRyqsU0OWHy
	 spEQl65b7D5CNAkOS1fcaW/8bYvqooEZrh7Alt5z++rjvJ9XdtWfS5DeQAsCD2zJrb
	 pNq8cuBTEgL916C/DDIknT35QkbHgtRwiRTrp7P3Q7pHgiyHmJUtv+jFJXR5Do4Za5
	 ka23mTmfDo6tQ==
Received: (nullmailer pid 1547085 invoked by uid 1000);
	Thu, 12 Oct 2023 19:22:25 -0000
From: Rob Herring <robh@kernel.org>
To: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Heiko Stuebner <heiko@sntech.de>
Cc: kernel test robot <lkp@intel.com>, linux-rockchip@lists.infradead.org,
 alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: rockchip: Fix unused rockchip_i2s_tdm_match warning for
 !CONFIG_OF
Date: Thu, 12 Oct 2023 14:22:00 -0500
Message-ID: <20231012192201.1546607-1-robh@kernel.org>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: JG7EVSRAKZSWGS5HF5H63JS7IIISM2AL
X-Message-ID-Hash: JG7EVSRAKZSWGS5HF5H63JS7IIISM2AL
X-MailFrom: robh@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JG7EVSRAKZSWGS5HF5H63JS7IIISM2AL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Commit 9958d85968ed ("ASoC: Use device_get_match_data()") dropped the
unconditional use of rockchip_i2s_tdm_match resulting in this warning:

sound/soc/rockchip/rockchip_i2s_tdm.c:1315:34: warning: 'rockchip_i2s_tdm_match' defined but not used [-Wunused-const-variable=]

The fix is to drop of_match_ptr() which is not necessary because DT is
always used for this driver.

Fixes: 9958d85968ed ("ASoC: Use device_get_match_data()")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202310121802.CDAGVdF2-lkp@intel.com/
Signed-off-by: Rob Herring <robh@kernel.org>
---
 sound/soc/rockchip/rockchip_i2s_tdm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/rockchip/rockchip_i2s_tdm.c b/sound/soc/rockchip/rockchip_i2s_tdm.c
index 7e996550d1df..7e1625ad70c6 100644
--- a/sound/soc/rockchip/rockchip_i2s_tdm.c
+++ b/sound/soc/rockchip/rockchip_i2s_tdm.c
@@ -1759,7 +1759,7 @@ static struct platform_driver rockchip_i2s_tdm_driver = {
 	.remove = rockchip_i2s_tdm_remove,
 	.driver = {
 		.name = DRV_NAME,
-		.of_match_table = of_match_ptr(rockchip_i2s_tdm_match),
+		.of_match_table = rockchip_i2s_tdm_match,
 		.pm = &rockchip_i2s_tdm_pm_ops,
 	},
 };
-- 
2.42.0

