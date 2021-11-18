Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 31899455555
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Nov 2021 08:14:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D0D5318DB;
	Thu, 18 Nov 2021 08:13:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D0D5318DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637219663;
	bh=Y3wh1IweUUvqFj9O9aqGU+JHvZ7kAguFSMj7yvIADqs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=J+SBObhrEP6s+qdBWUR1e5d6aGbuLRAHB+Z+LUvsIHZHpRt+92gLMnAnjQsd7hA+A
	 Mm9gQ7xm9RDFjkTj+h6vXznpe38szAlXljy86LSkmDRzwiJMmfOpWBuknIuIkmEdMn
	 yQSZqAYknkDpXqMD5TISf7QT3N6VmG2noQgfcAaQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6858EF804FE;
	Thu, 18 Nov 2021 08:10:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 24F01F80423; Thu, 18 Nov 2021 08:09:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.6 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
 FORGED_SPF_HELO,KHOP_HELO_FCRDNS,SPF_HELO_PASS,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2058.outbound.protection.outlook.com [40.107.93.58])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 18655F804FE
 for <alsa-devel@alsa-project.org>; Thu, 18 Nov 2021 08:07:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 18655F804FE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com
 header.b="XCrP5Qxk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JtKYL6Tie75wOgYcX5/XHWH342gNMl/iG7sLmxCNeaO8I6Gp3/wl1nuJ3mXLahu0MM86siszUezwne7OkvAv51sh0Cj9x6YwJn3WQnnMOmstCFk19EotzFLSbQFT9/lNvKvNc+Auj5fOcRdAXlZ3G66LGPN5/Axa41WTugbjnxXpmO50USO3pfKrkhCGO2rmjdtNRv5TSnvoRtLMsiK5BdBrsNqNboaAdu2ILYPCfI55tusKbf/YlRS0pMpJGfD6s1h7Gk84/XjFj+zjMJxqD5w0kG1yssCRtSMqttM6iwL63h9BwLP8TZjGbMFiuDHDRUVQ3wVfYDLgL2YYlIISsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=191Q6XSEun4VNne3at/RyZO5r8kHGp0iRg/Sz8UD2VI=;
 b=X7MjLeQuJGqcyKAYKkCAT+n3PUoG3E1MlMAdVv/xBan4tpPu435L5SwMLK1V/vqLfWXQiJ+KU371o8BQaa5Px7r2BmNyen3WHBb5hehX0631xnce43JJl7nSbINJlD8NP8+QG/QW6ZVHUKd65OM/rRFFlnn/uRLJJJ7bmHSegbzBBpCIHfTz5Nr6ALKsx94vL9B3rghWrO8WNTCkA+lI81a1uyWJIbO9hycrE2kS6AxyQGlLH1MloJ2ye86M27Mgc5Bs+QvGRsJu5ESP1rZey/N/HHVcy1Wbhy78QtfIBql721EyYQ9lgxo9N4px9m5piGGOJBdyLYBjTIDFjhM/bA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.32) smtp.rcpttodomain=alsa-project.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=191Q6XSEun4VNne3at/RyZO5r8kHGp0iRg/Sz8UD2VI=;
 b=XCrP5QxkaNwbhZZOkZC+sw27da0w9LWh3Mk/hMs9GT5IeZaHZbjqAculPoa5k1raXi5UidudljAqV+RRdX3+93tLWEGXM+GV1D8EvHUw6nKfxD7otuAHmWkGIqiBEQzZ1Q7CugMp3JoPaSiEGePLbHuZp/LQKgjjEfmLc8dQ3P0glQbWyX0X7hpYldrcTFkWsKP2Fs6500XQdW01SGwWFu/TguAFWDYqrys0A+Srz4NPeMlhUsi36fBZvpX6/mVCAdnQ5S/ggj2hAJAv0fJc1KIaGbGzZ/nY67+VFAokyV7VuH/SdJLm907k7T2B/+dbVK8hKRaI7XmIAjEMuq5A/g==
Received: from BN6PR2001CA0044.namprd20.prod.outlook.com
 (2603:10b6:405:16::30) by BYAPR12MB3414.namprd12.prod.outlook.com
 (2603:10b6:a03:aa::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.15; Thu, 18 Nov
 2021 07:07:52 +0000
Received: from BN8NAM11FT025.eop-nam11.prod.protection.outlook.com
 (2603:10b6:405:16:cafe::8d) by BN6PR2001CA0044.outlook.office365.com
 (2603:10b6:405:16::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.21 via Frontend
 Transport; Thu, 18 Nov 2021 07:07:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.32)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.32 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.32; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.32) by
 BN8NAM11FT025.mail.protection.outlook.com (10.13.177.136) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4713.20 via Frontend Transport; Thu, 18 Nov 2021 07:07:51 +0000
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Wed, 17 Nov
 2021 23:07:50 -0800
Received: from audio.nvidia.com (172.20.187.5) by mail.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server id 15.0.1497.18 via Frontend
 Transport; Thu, 18 Nov 2021 07:07:48 +0000
From: Sameer Pujar <spujar@nvidia.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <perex@perex.cz>,
 <tiwai@suse.com>
Subject: [PATCH v3 09/16] ASoC: tegra: Fix kcontrol put callback in DMIC
Date: Thu, 18 Nov 2021 12:37:04 +0530
Message-ID: <1637219231-406-10-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1637219231-406-1-git-send-email-spujar@nvidia.com>
References: <1637219231-406-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2417427d-dfc2-45db-7ad7-08d9aa622307
X-MS-TrafficTypeDiagnostic: BYAPR12MB3414:
X-Microsoft-Antispam-PRVS: <BYAPR12MB3414ACF13E21D5613BE6967EA79B9@BYAPR12MB3414.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 18lyeGlrx73/gckPfg0GYCcLvFpbGIVZasTr6KRXWMB/4JnfIPThms0Y0evrl82QYj+pwGmiLZb/p44wkDfwpHwlwBZTPEGbPVNZwrnIMOhCi+fg8/t7SsGfVh3eKPcb2iOAcQUHxhJlQ2upcme/y9WF4s7McXNIeH99hai0Izgv2GfF8OysFc69lFq301U8VL/liU7cnYK8SVkgJBP6giBLq/aycvGgt8vJ0Ry1RH9rY9FAiv3EuaUldfh3rLwexEAl0qC8iSOOETKoaRaR7S1UpdUZNtRBqVfG5pzoTmZnaOlIGEuGqGM8G55VIsXOiF1Nb5whLZ16iQCNnYDpj5K/WwWXoz5BnAwQXFFKOxYwYNLXcx6zBmeiPLMII2k2oQojoDlvVZQDdUQCPS0RR0LurjTx39A1NXwAHJDzdFEy/IYfMPmv93Xp9cclzK0zq4pzZfyMrMcOMrCaghcKtexCUyIbwWzdP+tX5MyK40e24WOH28lHCnce5JkiLuFXPVNV/MMBGgK1QszEkI+LeM3ARU/LrmsC1HLPig+F9tikjn5ZmzvHd3jAUdxQambzdKqOkdu8kunajYKWQ/EJ+duEwK4Sz28UrxMtn2vRfIRKJtxc0+zHtO+WEr+pAyH2l6Oa8TnDp7vJo2e9xY8H7lN+jiLFNjnGeEY4nhw/cuYjPlwXjf5UV/ZE+jWEQSLb/XzE6YnctxFlgT8LbQvt9w==
X-Forefront-Antispam-Report: CIP:216.228.112.32; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid01.nvidia.com; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(26005)(2906002)(107886003)(54906003)(86362001)(70586007)(5660300002)(4326008)(316002)(70206006)(82310400003)(7636003)(7696005)(83380400001)(6666004)(36756003)(186003)(36860700001)(47076005)(426003)(8676002)(110136005)(356005)(2616005)(508600001)(8936002)(336012);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2021 07:07:51.8596 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2417427d-dfc2-45db-7ad7-08d9aa622307
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.32];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT025.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3414
Cc: alsa-devel@alsa-project.org, Sameer Pujar <spujar@nvidia.com>,
 linux-kernel@vger.kernel.org, jonathanh@nvidia.com, thierry.reding@gmail.com,
 linux-tegra@vger.kernel.org
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

The kcontrol put callback is expected to return 1 when there is change
in HW or when the update is acknowledged by driver. This would ensure
that change notifications are sent to subscribed applications. Update
the DMIC driver accordingly.

Fixes: 8c8ff982e9e2 ("ASoC: tegra: Add Tegra210 based DMIC driver")
Suggested-by: Jaroslav Kysela <perex@perex.cz>
Suggested-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sameer Pujar <spujar@nvidia.com>
---
 sound/soc/tegra/tegra210_dmic.c | 183 ++++++++++++++++++++++++++++++++--------
 1 file changed, 149 insertions(+), 34 deletions(-)

diff --git a/sound/soc/tegra/tegra210_dmic.c b/sound/soc/tegra/tegra210_dmic.c
index ee2aedb..db95794 100644
--- a/sound/soc/tegra/tegra210_dmic.c
+++ b/sound/soc/tegra/tegra210_dmic.c
@@ -156,50 +156,162 @@ static int tegra210_dmic_hw_params(struct snd_pcm_substream *substream,
 	return 0;
 }
 
-static int tegra210_dmic_get_control(struct snd_kcontrol *kcontrol,
+static int tegra210_dmic_get_boost_gain(struct snd_kcontrol *kcontrol,
+					struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *comp = snd_soc_kcontrol_component(kcontrol);
+	struct tegra210_dmic *dmic = snd_soc_component_get_drvdata(comp);
+
+	ucontrol->value.integer.value[0] = dmic->boost_gain;
+
+	return 0;
+}
+
+static int tegra210_dmic_put_boost_gain(struct snd_kcontrol *kcontrol,
+					struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *comp = snd_soc_kcontrol_component(kcontrol);
+	struct tegra210_dmic *dmic = snd_soc_component_get_drvdata(comp);
+	int value = ucontrol->value.integer.value[0];
+
+	if (value == dmic->boost_gain)
+		return 0;
+
+	dmic->boost_gain = value;
+
+	return 1;
+}
+
+static int tegra210_dmic_get_ch_select(struct snd_kcontrol *kcontrol,
+				       struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *comp = snd_soc_kcontrol_component(kcontrol);
+	struct tegra210_dmic *dmic = snd_soc_component_get_drvdata(comp);
+
+	ucontrol->value.enumerated.item[0] = dmic->ch_select;
+
+	return 0;
+}
+
+static int tegra210_dmic_put_ch_select(struct snd_kcontrol *kcontrol,
+				       struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *comp = snd_soc_kcontrol_component(kcontrol);
+	struct tegra210_dmic *dmic = snd_soc_component_get_drvdata(comp);
+	unsigned int value = ucontrol->value.enumerated.item[0];
+
+	if (value == dmic->ch_select)
+		return 0;
+
+	dmic->ch_select = value;
+
+	return 1;
+}
+
+static int tegra210_dmic_get_mono_to_stereo(struct snd_kcontrol *kcontrol,
+					    struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *comp = snd_soc_kcontrol_component(kcontrol);
+	struct tegra210_dmic *dmic = snd_soc_component_get_drvdata(comp);
+
+	ucontrol->value.enumerated.item[0] = dmic->mono_to_stereo;
+
+	return 0;
+}
+
+static int tegra210_dmic_put_mono_to_stereo(struct snd_kcontrol *kcontrol,
+					    struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *comp = snd_soc_kcontrol_component(kcontrol);
+	struct tegra210_dmic *dmic = snd_soc_component_get_drvdata(comp);
+	unsigned int value = ucontrol->value.enumerated.item[0];
+
+	if (value == dmic->mono_to_stereo)
+		return 0;
+
+	dmic->mono_to_stereo = value;
+
+	return 1;
+}
+
+static int tegra210_dmic_get_stereo_to_mono(struct snd_kcontrol *kcontrol,
+					    struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *comp = snd_soc_kcontrol_component(kcontrol);
+	struct tegra210_dmic *dmic = snd_soc_component_get_drvdata(comp);
+
+	ucontrol->value.enumerated.item[0] = dmic->stereo_to_mono;
+
+	return 0;
+}
+
+static int tegra210_dmic_put_stereo_to_mono(struct snd_kcontrol *kcontrol,
+					    struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *comp = snd_soc_kcontrol_component(kcontrol);
+	struct tegra210_dmic *dmic = snd_soc_component_get_drvdata(comp);
+	unsigned int value = ucontrol->value.enumerated.item[0];
+
+	if (value == dmic->stereo_to_mono)
+		return 0;
+
+	dmic->stereo_to_mono = value;
+
+	return 1;
+}
+
+static int tegra210_dmic_get_osr_val(struct snd_kcontrol *kcontrol,
 				     struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_soc_component *comp = snd_soc_kcontrol_component(kcontrol);
 	struct tegra210_dmic *dmic = snd_soc_component_get_drvdata(comp);
 
-	if (strstr(kcontrol->id.name, "Boost Gain Volume"))
-		ucontrol->value.integer.value[0] = dmic->boost_gain;
-	else if (strstr(kcontrol->id.name, "Channel Select"))
-		ucontrol->value.enumerated.item[0] = dmic->ch_select;
-	else if (strstr(kcontrol->id.name, "Mono To Stereo"))
-		ucontrol->value.enumerated.item[0] = dmic->mono_to_stereo;
-	else if (strstr(kcontrol->id.name, "Stereo To Mono"))
-		ucontrol->value.enumerated.item[0] = dmic->stereo_to_mono;
-	else if (strstr(kcontrol->id.name, "OSR Value"))
-		ucontrol->value.enumerated.item[0] = dmic->osr_val;
-	else if (strstr(kcontrol->id.name, "LR Polarity Select"))
-		ucontrol->value.enumerated.item[0] = dmic->lrsel;
+	ucontrol->value.enumerated.item[0] = dmic->osr_val;
 
 	return 0;
 }
 
-static int tegra210_dmic_put_control(struct snd_kcontrol *kcontrol,
+static int tegra210_dmic_put_osr_val(struct snd_kcontrol *kcontrol,
+				     struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *comp = snd_soc_kcontrol_component(kcontrol);
+	struct tegra210_dmic *dmic = snd_soc_component_get_drvdata(comp);
+	unsigned int value = ucontrol->value.enumerated.item[0];
+
+	if (value == dmic->osr_val)
+		return 0;
+
+	dmic->osr_val = value;
+
+	return 1;
+}
+
+static int tegra210_dmic_get_pol_sel(struct snd_kcontrol *kcontrol,
 				     struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_soc_component *comp = snd_soc_kcontrol_component(kcontrol);
 	struct tegra210_dmic *dmic = snd_soc_component_get_drvdata(comp);
 
-	if (strstr(kcontrol->id.name, "Boost Gain Volume"))
-		dmic->boost_gain = ucontrol->value.integer.value[0];
-	else if (strstr(kcontrol->id.name, "Channel Select"))
-		dmic->ch_select = ucontrol->value.enumerated.item[0];
-	else if (strstr(kcontrol->id.name, "Mono To Stereo"))
-		dmic->mono_to_stereo = ucontrol->value.enumerated.item[0];
-	else if (strstr(kcontrol->id.name, "Stereo To Mono"))
-		dmic->stereo_to_mono = ucontrol->value.enumerated.item[0];
-	else if (strstr(kcontrol->id.name, "OSR Value"))
-		dmic->osr_val = ucontrol->value.enumerated.item[0];
-	else if (strstr(kcontrol->id.name, "LR Polarity Select"))
-		dmic->lrsel = ucontrol->value.enumerated.item[0];
+	ucontrol->value.enumerated.item[0] = dmic->lrsel;
 
 	return 0;
 }
 
+static int tegra210_dmic_put_pol_sel(struct snd_kcontrol *kcontrol,
+				     struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *comp = snd_soc_kcontrol_component(kcontrol);
+	struct tegra210_dmic *dmic = snd_soc_component_get_drvdata(comp);
+	unsigned int value = ucontrol->value.enumerated.item[0];
+
+	if (value == dmic->lrsel)
+		return 0;
+
+	dmic->lrsel = value;
+
+	return 1;
+}
+
 static const struct snd_soc_dai_ops tegra210_dmic_dai_ops = {
 	.hw_params	= tegra210_dmic_hw_params,
 };
@@ -286,19 +398,22 @@ static const struct soc_enum tegra210_dmic_lrsel_enum =
 
 static const struct snd_kcontrol_new tegra210_dmic_controls[] = {
 	SOC_SINGLE_EXT("Boost Gain Volume", 0, 0, MAX_BOOST_GAIN, 0,
-		       tegra210_dmic_get_control, tegra210_dmic_put_control),
+		       tegra210_dmic_get_boost_gain,
+		       tegra210_dmic_put_boost_gain),
 	SOC_ENUM_EXT("Channel Select", tegra210_dmic_ch_enum,
-		     tegra210_dmic_get_control, tegra210_dmic_put_control),
+		     tegra210_dmic_get_ch_select, tegra210_dmic_put_ch_select),
 	SOC_ENUM_EXT("Mono To Stereo",
-		     tegra210_dmic_mono_conv_enum, tegra210_dmic_get_control,
-		     tegra210_dmic_put_control),
+		     tegra210_dmic_mono_conv_enum,
+		     tegra210_dmic_get_mono_to_stereo,
+		     tegra210_dmic_put_mono_to_stereo),
 	SOC_ENUM_EXT("Stereo To Mono",
-		     tegra210_dmic_stereo_conv_enum, tegra210_dmic_get_control,
-		     tegra210_dmic_put_control),
+		     tegra210_dmic_stereo_conv_enum,
+		     tegra210_dmic_get_stereo_to_mono,
+		     tegra210_dmic_put_stereo_to_mono),
 	SOC_ENUM_EXT("OSR Value", tegra210_dmic_osr_enum,
-		     tegra210_dmic_get_control, tegra210_dmic_put_control),
+		     tegra210_dmic_get_osr_val, tegra210_dmic_put_osr_val),
 	SOC_ENUM_EXT("LR Polarity Select", tegra210_dmic_lrsel_enum,
-		     tegra210_dmic_get_control, tegra210_dmic_put_control),
+		     tegra210_dmic_get_pol_sel, tegra210_dmic_put_pol_sel),
 };
 
 static const struct snd_soc_component_driver tegra210_dmic_compnt = {
-- 
2.7.4

