Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C3A67CDEBD
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Oct 2023 16:13:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 12AB2868;
	Wed, 18 Oct 2023 16:13:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 12AB2868
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697638437;
	bh=PGU5RXOZhOt5LYy0vSoNrEETnzSuECwk6gEwQQVoNY0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=kb5SgdOhKJZt6ZwbK6ifFzi2ziHEFflO4a2/tIA05LGiMWSB3iTOZy4DC09yA7N6k
	 MTq1wGNZNmKUNqbROHlmteWSQlOwEY4W6WPa3Zhj3EDGB/xrolMUk+EIl9mYbGJ7eK
	 /57HUChDSDIezxB3IH9eitGBHkQRMcILpCAFZ2VQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 40D2AF80571; Wed, 18 Oct 2023 16:12:17 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 04909F8055C;
	Wed, 18 Oct 2023 16:12:17 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2893EF8027B; Wed, 18 Oct 2023 16:12:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 70038F8024E
	for <alsa-devel@alsa-project.org>; Wed, 18 Oct 2023 16:12:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 70038F8024E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=QYzd7Zcu
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B3887617F3;
	Wed, 18 Oct 2023 14:12:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF095C433C7;
	Wed, 18 Oct 2023 14:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697638323;
	bh=PGU5RXOZhOt5LYy0vSoNrEETnzSuECwk6gEwQQVoNY0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QYzd7Zcuph3fdf5dv8AZb3LPsbVa2XB+WM60Gn0ZpznDcTJLCSmJZvaqikeGCihRc
	 hRNDt5kFUu+i0Tq9ZM6FbqkunFUm2CSuSo0XcphjjFI3qSXYiLbrZhD/fi+KBpK8Mn
	 G7t9hgrMYW14HGuSqs/vJ9zQlYlvei3shqH6Lz8+iyDJ2Gbd6PNJHzE1EA6PzAYJ7U
	 zWKeBURnTSsNDoSTGEk7LyrGhOpEpuQ9oy5W+IMTTUXmgHa7crO11SaqpDhG4n/SUB
	 6/l/WPeycBl+t3kv+ic/e7YJWJPfePtFCu07Lmm6B/G+HnVKQcoyGXO+PmwKdiek0R
	 g4oJXmJDRgyEw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Chao Song <chao.song@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Mark Brown <broonie@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	cezary.rojewski@intel.com,
	liam.r.girdwood@linux.intel.com,
	peter.ujfalusi@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	perex@perex.cz,
	tiwai@suse.com,
	ckeepax@opensource.cirrus.com,
	gongjun.song@intel.com,
	uday.m.bhat@intel.com,
	alsa-devel@alsa-project.org
Subject: [PATCH AUTOSEL 6.5 03/31] ASoC: Intel: sof_sdw: add support for SKU
 0B14
Date: Wed, 18 Oct 2023 10:11:20 -0400
Message-Id: <20231018141151.1334501-3-sashal@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231018141151.1334501-1-sashal@kernel.org>
References: <20231018141151.1334501-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.5.7
Content-Transfer-Encoding: 8bit
Message-ID-Hash: Y6IBC2KWLNVEL7QB3OLREXVC4NBQWZOW
X-Message-ID-Hash: Y6IBC2KWLNVEL7QB3OLREXVC4NBQWZOW
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
Archived-At: <>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

[ Upstream commit fb0b8d299781be8d46b3612aa96cef28da0d93f4 ]

One more missing SKU in the list.

Closes: https://github.com/thesofproject/linux/issues/4543
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Chao Song <chao.song@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Link: https://lore.kernel.org/r/20230919092125.1922468-1-yung-chuan.liao@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/intel/boards/sof_sdw.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index c86f8f9a61003..7d9b3a07945d7 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -366,6 +366,16 @@ static const struct dmi_system_id sof_sdw_quirk_table[] = {
 		/* No Jack */
 		.driver_data = (void *)SOF_SDW_TGL_HDMI,
 	},
+	{
+		.callback = sof_sdw_quirk_cb,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "0B14"),
+		},
+		/* No Jack */
+		.driver_data = (void *)SOF_SDW_TGL_HDMI,
+	},
+
 	{
 		.callback = sof_sdw_quirk_cb,
 		.matches = {
-- 
2.40.1

