Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 524126E04C3
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Apr 2023 04:42:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A2758F9D;
	Thu, 13 Apr 2023 04:41:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A2758F9D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681353735;
	bh=8aLaGvCxyMHhpuSJf95pFB+rwa37xHUxg58lShunst0=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=MG4Qe+tu3Np6weIEIscvVf/zReprQV06VQuvZ242VHGzHZ5YG6pOnMip0+OHEvcEo
	 7J1o0F1j2Vlh7CrSPgcT6VgmWdw4hKYiut6eCdOQxM0yWTHArwMWcwu9O8j67oh77y
	 c72PWgd71sQ0nejrO4Fq21vNySmMIrQru5fXPPQk=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 06368F80524;
	Thu, 13 Apr 2023 04:38:13 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 80B65F80534; Thu, 13 Apr 2023 04:38:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B23D1F8049C
	for <alsa-devel@alsa-project.org>; Thu, 13 Apr 2023 04:38:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B23D1F8049C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=DglylogN
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7DEF363A8C;
	Thu, 13 Apr 2023 02:38:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16543C433AA;
	Thu, 13 Apr 2023 02:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681353485;
	bh=8aLaGvCxyMHhpuSJf95pFB+rwa37xHUxg58lShunst0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DglylogNXYCLqKt49G4r6kLqtM3aSL+H7Tt8JFye5LbwL6nykLavJOTOeUgWYKq3F
	 0Xi4UOKYolRk+rusfWQVVvc4YnrGNnmLMNpDpphPPpSMrpX91yJVYsyzUcVClLFhz0
	 rSRIPpZhCWHa9iz62tw/2iHWxOSoX2AOON0oBXmZaKesUPxW92HgvVQlwJjtwXCVsm
	 F8FqApydZtftJllMJBJVjYRIveO7r9/yO4uRIrorpMtG6a2Xbbb1I59swWHMR/MpnK
	 1iOaVAU8OLZbjmRaakQUu/OjEmTKtB0sfF1UQffwsNufVovzuVI02DnXm8361XFmT/
	 /TWcfBTuhf5pw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 2/3] ASoC: Intel: bytcr_rt5640: Add quirk for the
 Acer Iconia One 7 B1-750
Date: Wed, 12 Apr 2023 22:37:57 -0400
Message-Id: <20230413023759.75048-2-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230413023759.75048-1-sashal@kernel.org>
References: <20230413023759.75048-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 2KCZ36JB6666BWP552V77JQNVNLM23TC
X-Message-ID-Hash: 2KCZ36JB6666BWP552V77JQNVNLM23TC
X-MailFrom: sashal@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Hans de Goede <hdegoede@redhat.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, Sasha Levin <sashal@kernel.org>,
 cezary.rojewski@intel.com, liam.r.girdwood@linux.intel.com,
 peter.ujfalusi@linux.intel.com, yung-chuan.liao@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 tiwai@suse.com, andriy.shevchenko@linux.intel.com, moisesmcardona@gmail.com,
 oder_chiou@realtek.com, amadeuszx.slawinski@linux.intel.com,
 akihiko.odaki@gmail.com, alsa-devel@alsa-project.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2KCZ36JB6666BWP552V77JQNVNLM23TC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Hans de Goede <hdegoede@redhat.com>

[ Upstream commit e38c5e80c3d293a883c6f1d553f2146ec0bda35e ]

The Acer Iconia One 7 B1-750 tablet mostly works fine with the defaults
for an Bay Trail CR tablet. Except for the internal mic, instead of
an analog mic on IN3 a digital mic on DMIC1 is uses.

Add a quirk with these settings for this tablet.

Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
Link: https://lore.kernel.org/r/20230322145332.131525-1-hdegoede@redhat.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/intel/boards/bytcr_rt5640.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/sound/soc/intel/boards/bytcr_rt5640.c b/sound/soc/intel/boards/bytcr_rt5640.c
index 6a8edb0a559de..df3b370fe7292 100644
--- a/sound/soc/intel/boards/bytcr_rt5640.c
+++ b/sound/soc/intel/boards/bytcr_rt5640.c
@@ -391,6 +391,18 @@ static int byt_rt5640_aif1_hw_params(struct snd_pcm_substream *substream,
 
 /* Please keep this list alphabetically sorted */
 static const struct dmi_system_id byt_rt5640_quirk_table[] = {
+	{	/* Acer Iconia One 7 B1-750 */
+		.matches = {
+			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Insyde"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "VESPA2"),
+		},
+		.driver_data = (void *)(BYT_RT5640_DMIC1_MAP |
+					BYT_RT5640_JD_SRC_JD1_IN4P |
+					BYT_RT5640_OVCD_TH_1500UA |
+					BYT_RT5640_OVCD_SF_0P75 |
+					BYT_RT5640_SSP0_AIF1 |
+					BYT_RT5640_MCLK_EN),
+	},
 	{	/* Acer Iconia Tab 8 W1-810 */
 		.matches = {
 			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Acer"),
-- 
2.39.2

