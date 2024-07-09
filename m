Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 20F9692BFC3
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Jul 2024 18:25:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 956CCF51;
	Tue,  9 Jul 2024 18:25:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 956CCF51
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1720542338;
	bh=nLWJVFLnUTBOHp+Zg4qjHCWvREOSbRepbVtkv3TIICw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jBVp0q6EkO/wfKjva/pVzWOkGwDqLTAnxBfJq3FySvC95nlu2PrKEJHxjham29QPC
	 mPzWKb2JujQZxPBbf6yoVg0xVB+zKl9UeNx34Yacc7r74eCyUrP2snb7C+Xayoo9PV
	 WJ/JX7SnINwZ6wXzggEWNNHCJ1AvHdWT4MB/29iU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0F73AF80610; Tue,  9 Jul 2024 18:24:36 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2F5DFF805FB;
	Tue,  9 Jul 2024 18:24:36 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 75F93F801F5; Tue,  9 Jul 2024 18:23:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5A32EF8013D
	for <alsa-devel@alsa-project.org>; Tue,  9 Jul 2024 18:22:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5A32EF8013D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=M1OFwLGx
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 96D41CE12BF;
	Tue,  9 Jul 2024 16:22:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C5D6C3277B;
	Tue,  9 Jul 2024 16:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720542164;
	bh=nLWJVFLnUTBOHp+Zg4qjHCWvREOSbRepbVtkv3TIICw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=M1OFwLGxMAzzV/6ZGoh5RZBnxVDQFldZoBihdDhUegOCI90U6YmrcWU0vx2hbilOC
	 XT1Byr/QE2xHhYGinY7yiqjd3iSrDds2rWzdZQWCDbsfw3TTe7ud2voCi3FcJ5paml
	 5QPsKaivw18c+jDPni/qKta0CaxxxMUEIQaLkWdMZR6cMC8PABAQZJOLwWuAXFeQ1c
	 HtiIaVGOFba6otwqBC1beST1LsGYn6a5I7UlJqR1KAdkDl8P4MekMewXDOlWSKSSW2
	 ZOEaiOMfo9oRNcRHXDTD5/yfSWx1glUoffHh+vWfBstqKC3SQGiZFxwWuaW4voL4v/
	 SSbZhv85NSZXQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Thomas GENTY <tomlohave@gmail.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Mark Brown <broonie@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	cezary.rojewski@intel.com,
	liam.r.girdwood@linux.intel.com,
	peter.ujfalusi@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	perex@perex.cz,
	tiwai@suse.com,
	alban.boye@protonmail.com,
	kuninori.morimoto.gx@renesas.com,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org
Subject: [PATCH AUTOSEL 6.6 08/33] bytcr_rt5640 : inverse jack detect for
 Archos 101 cesium
Date: Tue,  9 Jul 2024 12:21:34 -0400
Message-ID: <20240709162224.31148-8-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240709162224.31148-1-sashal@kernel.org>
References: <20240709162224.31148-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.38
Content-Transfer-Encoding: 8bit
Message-ID-Hash: SKR5R2B3222ETUGQ5IECYHGYLT2W6W5L
X-Message-ID-Hash: SKR5R2B3222ETUGQ5IECYHGYLT2W6W5L
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SKR5R2B3222ETUGQ5IECYHGYLT2W6W5L/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Thomas GENTY <tomlohave@gmail.com>

[ Upstream commit e3209a1827646daaab744aa6a5767b1f57fb5385 ]

When headphones are plugged in, they appear absent; when they are removed,
they appear present.
Add a specific entry in bytcr_rt5640 for this device

Signed-off-by: Thomas GENTY <tomlohave@gmail.com>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20240608170251.99936-1-tomlohave@gmail.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/intel/boards/bytcr_rt5640.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/sound/soc/intel/boards/bytcr_rt5640.c b/sound/soc/intel/boards/bytcr_rt5640.c
index 651408c6f399d..5b8b21ade9cfe 100644
--- a/sound/soc/intel/boards/bytcr_rt5640.c
+++ b/sound/soc/intel/boards/bytcr_rt5640.c
@@ -610,6 +610,17 @@ static const struct dmi_system_id byt_rt5640_quirk_table[] = {
 					BYT_RT5640_SSP0_AIF1 |
 					BYT_RT5640_MCLK_EN),
 	},
+	{
+		.matches = {
+			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "ARCHOS"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "ARCHOS 101 CESIUM"),
+		},
+		.driver_data = (void *)(BYTCR_INPUT_DEFAULTS |
+					BYT_RT5640_JD_NOT_INV |
+					BYT_RT5640_DIFF_MIC |
+					BYT_RT5640_SSP0_AIF1 |
+					BYT_RT5640_MCLK_EN),
+	},
 	{
 		.matches = {
 			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "ARCHOS"),
-- 
2.43.0

