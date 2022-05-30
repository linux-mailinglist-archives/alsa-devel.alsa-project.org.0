Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 38AF3537D0D
	for <lists+alsa-devel@lfdr.de>; Mon, 30 May 2022 15:41:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 733F91EF7;
	Mon, 30 May 2022 15:41:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 733F91EF7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653918115;
	bh=nIeNS3nPNX4XFLAZBfUHpdLm/8M/6eMTyEZRt0zosCE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rfxsqQN3G9WIK7rwZ1g28MtxoJcVRCxGnoCVNBAKFiFKaXHSclrnFg30M0idsMIts
	 1oN7kgTTPCGKoSabCo3iIzmh4CjucKZlpO8+5+ful8t/zAPb/E/KaMVtpUuK7qvGao
	 vnQFNTP8RY4nbIidEl5eXko2spC/e7fFSSAry6m0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1A6B1F800E5;
	Mon, 30 May 2022 15:41:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 17A30F8019D; Mon, 30 May 2022 15:41:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A3E7AF800E5
 for <alsa-devel@alsa-project.org>; Mon, 30 May 2022 15:41:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A3E7AF800E5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="I06o5gHO"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7968160F14;
 Mon, 30 May 2022 13:40:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34BC5C385B8;
 Mon, 30 May 2022 13:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653918058;
 bh=nIeNS3nPNX4XFLAZBfUHpdLm/8M/6eMTyEZRt0zosCE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=I06o5gHOIPXfaZSVhI1xWMa1i0c11sKwK1W4TpZIiEuZ1Ko6I2/spMXRCWx5obbAj
 Kz96V6aNNlJyMzFHhRSs2JRql6k1PvJEFVjVjTWpaUi+LIfpZdi8n0pMnq+M86tmAq
 ijgeW9Aw4mrjjbL4XgcsxCh2nZRbveXXKwVDW9n8Z99LUOEv6ZckX5aaunqAjl8WbO
 xmP/kgrIOBxL/4XunLAzvNQ6bmV1D/MDB05vJBNqmcc8YpqKVs94QbRIrzaqVc0Jbt
 y4aGA41x2Srd5u26nxgivP5oy57gRTs+1af97VUr1pu64bEyVHQdBrOl7JE96MpMXm
 hK6Zw9cGJQ8VQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 045/109] ASoC: Intel: bytcr_rt5640: Add quirk for
 the HP Pro Tablet 408
Date: Mon, 30 May 2022 09:37:21 -0400
Message-Id: <20220530133825.1933431-45-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220530133825.1933431-1-sashal@kernel.org>
References: <20220530133825.1933431-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, cezary.rojewski@intel.com,
 alsa-devel@alsa-project.org, tiwai@suse.com, yang.jie@linux.intel.com,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 liam.r.girdwood@linux.intel.com, Hans de Goede <hdegoede@redhat.com>,
 Mark Brown <broonie@kernel.org>, akihiko.odaki@gmail.com,
 andriy.shevchenko@linux.intel.com, peter.ujfalusi@linux.intel.com
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Hans de Goede <hdegoede@redhat.com>

[ Upstream commit ce216cfa84a4e1c23b105e652c550bdeaac9e922 ]

Add a quirk for the HP Pro Tablet 408, this BYTCR tablet has no CHAN
package in its ACPI tables and uses SSP0-AIF1 rather then SSP0-AIF2 which
is the default for BYTCR devices.

It also uses DMIC1 for the internal mic rather then the default IN3
and it uses JD2 rather then the default JD1 for jack-detect.

BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=211485
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20220427134918.527381-1-hdegoede@redhat.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/intel/boards/bytcr_rt5640.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/sound/soc/intel/boards/bytcr_rt5640.c b/sound/soc/intel/boards/bytcr_rt5640.c
index a6e837290c7d..f9c82ebc552c 100644
--- a/sound/soc/intel/boards/bytcr_rt5640.c
+++ b/sound/soc/intel/boards/bytcr_rt5640.c
@@ -759,6 +759,18 @@ static const struct dmi_system_id byt_rt5640_quirk_table[] = {
 					BYT_RT5640_OVCD_SF_0P75 |
 					BYT_RT5640_MCLK_EN),
 	},
+	{	/* HP Pro Tablet 408 */
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Hewlett-Packard"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "HP Pro Tablet 408"),
+		},
+		.driver_data = (void *)(BYT_RT5640_DMIC1_MAP |
+					BYT_RT5640_JD_SRC_JD2_IN4N |
+					BYT_RT5640_OVCD_TH_1500UA |
+					BYT_RT5640_OVCD_SF_0P75 |
+					BYT_RT5640_SSP0_AIF1 |
+					BYT_RT5640_MCLK_EN),
+	},
 	{	/* HP Stream 7 */
 		.matches = {
 			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Hewlett-Packard"),
-- 
2.35.1

