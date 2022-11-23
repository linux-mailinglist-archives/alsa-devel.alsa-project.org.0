Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A966D635D60
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Nov 2022 13:46:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3ED39168D;
	Wed, 23 Nov 2022 13:45:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3ED39168D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669207565;
	bh=bmkuTam4/eCjQTwar69n3SQbEsGd/IeoaR1YFjfpgrM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SExX2QSVKe8M0m+VFaeUUMEgkt21oHgsP2740CfqEPoVCWYpdJpSWDnrstm/e+CPd
	 6dxSlkN2xGVDSWEdhrSHmRvdJlD2uGH1DCyouRHyWFeFyLxnb7vtfXF2Cm4HG9tE5v
	 70vWqpjOr8/AYtRMJGwipNJ1LkYwzSSGB3xfMpcM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E5148F80149;
	Wed, 23 Nov 2022 13:44:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9FA0EF8052E; Wed, 23 Nov 2022 13:44:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5C1E1F80149
 for <alsa-devel@alsa-project.org>; Wed, 23 Nov 2022 13:44:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5C1E1F80149
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="nunV72uz"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1F99C61CB4;
 Wed, 23 Nov 2022 12:44:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CF59C433D6;
 Wed, 23 Nov 2022 12:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669207474;
 bh=bmkuTam4/eCjQTwar69n3SQbEsGd/IeoaR1YFjfpgrM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=nunV72uzXVnkS5jRI+nCWVaUc31gNWz0BNpvdWsV448Dv5hlj8LKoOgGb3OeYeHD1
 5CnZl/aiSANij9G/cssfRkERS1/U0cRK9+C7z0ecYKeyBgdWFBYdwzA1jHLQoap3+y
 E4P+WxduJizofnfoyK3DHcTJ7NslQvg1xrvaFQzE3bINd3uwzRN/Y7hiJ85dE4laGM
 cbht6r+nkxXFvZ6mi1mYfLm/WdsmiWLmnH3rlGprTYCPWNvE1BSY/ZYAdTP4CxLpsa
 bbaC8SssI6orq06p0qyMDMnJZyvN5149jDPtTmuT31gvoeTapuH8X/X2U0ly6XdDbA
 3Ny7SDVkt6TtA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 02/15] ASoC: Intel: bytcht_es8316: Add quirk for
 the Nanote UMPC-01
Date: Wed, 23 Nov 2022 07:44:12 -0500
Message-Id: <20221123124427.266286-2-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221123124427.266286-1-sashal@kernel.org>
References: <20221123124427.266286-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, fred.oh@linux.intel.com,
 cezary.rojewski@intel.com, ckeepax@opensource.cirrus.com,
 kai.vehmanen@linux.intel.com, yung-chuan.liao@linux.intel.com, tiwai@suse.com,
 alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 ranjani.sridharan@linux.intel.com, liam.r.girdwood@linux.intel.com,
 Hans de Goede <hdegoede@redhat.com>, Mark Brown <broonie@kernel.org>,
 akihiko.odaki@gmail.com, peter.ujfalusi@linux.intel.com
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

[ Upstream commit 8bb0ac0e6f64ebdf15d963c26b028de391c9bcf9 ]

The Nanote UMPC-01 mini laptop has stereo speakers, while the default
bytcht_es8316 settings assume a mono speaker setup. Add a quirk for this.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20221025140942.509066-1-hdegoede@redhat.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/intel/boards/bytcht_es8316.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/intel/boards/bytcht_es8316.c b/sound/soc/intel/boards/bytcht_es8316.c
index ed332177b0f9..57d6d0b48068 100644
--- a/sound/soc/intel/boards/bytcht_es8316.c
+++ b/sound/soc/intel/boards/bytcht_es8316.c
@@ -446,6 +446,13 @@ static const struct dmi_system_id byt_cht_es8316_quirk_table[] = {
 					| BYT_CHT_ES8316_INTMIC_IN2_MAP
 					| BYT_CHT_ES8316_JD_INVERTED),
 	},
+	{	/* Nanote UMPC-01 */
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "RWC CO.,LTD"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "UMPC-01"),
+		},
+		.driver_data = (void *)BYT_CHT_ES8316_INTMIC_IN1_MAP,
+	},
 	{	/* Teclast X98 Plus II */
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TECLAST"),
-- 
2.35.1

