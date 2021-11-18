Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 64F4B45553A
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Nov 2021 08:10:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 086A318A6;
	Thu, 18 Nov 2021 08:09:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 086A318A6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637219415;
	bh=zHWP1ApygB2X35SYSRxdWP66XTHpopMj2Idhkvxi+EQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ypu6VV9a/cmdj/GCe5dJvqolSmjsk0BFFp6bkFGOIhFdioJRbB2NYhZqR6cWJLVHn
	 ArJhYrt0Pp9IMj0AjH11d9XIUTXl1SsfYQ1z3Y0KcycgcafCC9UUDU+2aC6HtbNHcd
	 eXcLVdFUrV6/qt2HtmNsUveN52DFO/io/0xGrVgo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 51744F80510;
	Thu, 18 Nov 2021 08:08:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 51E91F80507; Thu, 18 Nov 2021 08:07:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2074.outbound.protection.outlook.com [40.107.94.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C3170F80115
 for <alsa-devel@alsa-project.org>; Thu, 18 Nov 2021 08:07:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C3170F80115
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com
 header.b="RUpYTkF1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bwVAEf2U3qII/jGdApytODATtMpdu4M6LXOin0xBJcsPR706fu2m0SrCnXifmVrPyCr/SzrEAuSwsr3AauFAjEILby6PjWCy4ALlkS33hqZHoNYIjyWY0UWLZfX4DXjVoQ4WTYKjqA0wZ+rU1yyrwoVBgOm31korrWFiEDMkQc8hGQTj8oJjEjqDw3ZegHhINIPHrnzT3fabK7TXTjNp/3fVtpsINDiuoIkM+fT7pV+8/npVdzfbkCTstvFzxiKcBM5abxFXJ8foxlwWwP5yMCYOAc+6oY0lh+lz9est/1DPXveDdwxCBu9OPHF53dkiN44nKZaUCcURr8QCQXqYFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sM15j5fzhraL0w4q+XcwRI6QqWGkPBkP5384VGUNAKA=;
 b=i5KSQ8BXOr9/fUVeltMkESwKgRjyG8yCL402Rghz1dHuu+H/JKws2kry9ZxY3yO4yoqhWxV6dsD4qgmdTJPvOQDbrBPzPdFvX85a0rwE/a6yWMkhWWisUGOuTZ1rs4ebCtnkrUFh+ffNY4k+x9srDBb4QggLpP+4uqdwqpawzGxBShdW05DUK8tjNcLcuueFUT72lYLVAyPHw7/QE2AL2BEarHAG2zjnvYKS5Hkf1vu2F/foAM7UlqAeYtKOAHIp9Dr3GK+aZDT412yW6FD5YB3RI2oMNcbyFO4hBebdMOl39VT1gElpH/S1RV5eoqH6sc5vgY0XJXhHvQkYaq8SqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=perex.cz smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sM15j5fzhraL0w4q+XcwRI6QqWGkPBkP5384VGUNAKA=;
 b=RUpYTkF1mmQV8FG7zeV6zU5UmUusWF4ut3835dDW6gZsuURIU1GbBIjGfnfj6rw5OB/WHdkySVQfv/jlaZiTgYeABBFFTjfBPKR3s7raeQXF3ueiUd/GvkH2fHZDd4dA/iTWK/Up4jhLvDfO7o+81OVWKUDVlgPj6cYaH7h77Sogb6cLCRMTlsUZjX97kKU2XtfTYJBiIrcChKgD/Esk5nh55RlJ/eqrzN8+lrWTe585x310MPqAuZEwkQPP0NUAV1kJP699eUcfihfBrNRWj1cQf9NqejMuOACAAWEIpbGQnwtnT6UBG7qNL8kgK+wfNdmKI5JJhPSum8+Ps8kswg==
Received: from MW2PR2101CA0023.namprd21.prod.outlook.com (2603:10b6:302:1::36)
 by DM6PR12MB3882.namprd12.prod.outlook.com (2603:10b6:5:149::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.27; Thu, 18 Nov
 2021 07:07:38 +0000
Received: from CO1NAM11FT005.eop-nam11.prod.protection.outlook.com
 (2603:10b6:302:1:cafe::26) by MW2PR2101CA0023.outlook.office365.com
 (2603:10b6:302:1::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.11 via Frontend
 Transport; Thu, 18 Nov 2021 07:07:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 CO1NAM11FT005.mail.protection.outlook.com (10.13.174.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4713.20 via Frontend Transport; Thu, 18 Nov 2021 07:07:37 +0000
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Thu, 18 Nov
 2021 07:07:30 +0000
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Thu, 18 Nov
 2021 07:07:30 +0000
Received: from audio.nvidia.com (172.20.187.5) by mail.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server id 15.0.1497.18 via Frontend
 Transport; Thu, 18 Nov 2021 07:07:27 +0000
From: Sameer Pujar <spujar@nvidia.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <perex@perex.cz>,
 <tiwai@suse.com>
Subject: [PATCH v3 02/16] ASoC: tegra: Fix wrong value type in I2S
Date: Thu, 18 Nov 2021 12:36:57 +0530
Message-ID: <1637219231-406-3-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1637219231-406-1-git-send-email-spujar@nvidia.com>
References: <1637219231-406-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 598ccb96-473f-4338-0993-08d9aa621a70
X-MS-TrafficTypeDiagnostic: DM6PR12MB3882:
X-Microsoft-Antispam-PRVS: <DM6PR12MB388226D408CDF4CFEAFDF2D9A79B9@DM6PR12MB3882.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:854;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yvcHil9Ye2PFtpnftZya1JeZk5IZBo07KkXIpUrJO23r509eUwmDSlTEGZltxAiLfUoZiCF2shNvFI7X2jwnOfsBS+hEVMHJldzZhKvmRITGQImTGMb44v6HdQWhaj5aFfus0BEq2pJzG68vsEAX6Tqg4p+KCO4OMb5x6tioomCcQPb6G0CBxwrS+x5BAT3OAvmbRoSIAGKksPqAp7PysOor3PzmJiaPwi0AtGXlCwjrbkKpF/eKhkFp3GpXY7XArMpeQuZIUMgVfv6ITX+m6pJu5j9rC2C5dzHUmgK4t2JzGJJHcooqwnCnmlBN6i+KuRjHUITYETMLe1YnEosKaz9WwPXN6+2L7vfkfnATRanrCtV0HHiyEaPYKASPv4JHFKLtC5fS8TGHD2wHtKx1I5v14xu0QQKiUU2F8LJxVqaNinmMCIkWByItn0TmWHXsiKOiRwrmYHXDZKVEnzrjIzM7WFjojDt/jJzRB9mrh2UFLkq0+wS4BQX6jYhtHqrx8kx7Ex07QOXo+RwKZWjlaYBEYH8xKS3J2ope7UtIu7TYV61iJw7oIrlUG76CTQpJ7DE1EX7KhdyTcjF5dlsHGBzLB0/uuZZmyP021OBAGknmaVaCdEe+SQO8BrorrMji6tcRZ0pqwZ1rgZ1/XxSz7Ot9f0jBqU8KJPIV7GZTUqT6PmN8pOFTBNxsiiq0lR5FcBRM80XZWKiFRDB/ZyjOxg==
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(6666004)(83380400001)(36906005)(8676002)(86362001)(107886003)(356005)(54906003)(316002)(47076005)(186003)(70586007)(26005)(70206006)(36756003)(508600001)(4326008)(110136005)(2906002)(426003)(2616005)(8936002)(336012)(5660300002)(7636003)(82310400003)(7696005)(36860700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2021 07:07:37.5013 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 598ccb96-473f-4338-0993-08d9aa621a70
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT005.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3882
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

The enum controls are expected to use enumerated value type.
Update relevant references in control get/put callbacks.

Fixes: c0bfa98349d1 ("ASoC: tegra: Add Tegra210 based I2S driver")
Suggested-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Sameer Pujar <spujar@nvidia.com>
---
 sound/soc/tegra/tegra210_i2s.c | 42 ++++++++++++++++++++++++------------------
 1 file changed, 24 insertions(+), 18 deletions(-)

diff --git a/sound/soc/tegra/tegra210_i2s.c b/sound/soc/tegra/tegra210_i2s.c
index 45f31cc..5c30461 100644
--- a/sound/soc/tegra/tegra210_i2s.c
+++ b/sound/soc/tegra/tegra210_i2s.c
@@ -317,24 +317,27 @@ static int tegra210_i2s_get_control(struct snd_kcontrol *kcontrol,
 {
 	struct snd_soc_component *compnt = snd_soc_kcontrol_component(kcontrol);
 	struct tegra210_i2s *i2s = snd_soc_component_get_drvdata(compnt);
-	long *uctl_val = &ucontrol->value.integer.value[0];
 
 	if (strstr(kcontrol->id.name, "Loopback"))
-		*uctl_val = i2s->loopback;
+		ucontrol->value.integer.value[0] = i2s->loopback;
 	else if (strstr(kcontrol->id.name, "FSYNC Width"))
-		*uctl_val = i2s->fsync_width;
+		ucontrol->value.integer.value[0] = i2s->fsync_width;
 	else if (strstr(kcontrol->id.name, "Capture Stereo To Mono"))
-		*uctl_val = i2s->stereo_to_mono[I2S_TX_PATH];
+		ucontrol->value.enumerated.item[0] =
+			i2s->stereo_to_mono[I2S_TX_PATH];
 	else if (strstr(kcontrol->id.name, "Capture Mono To Stereo"))
-		*uctl_val = i2s->mono_to_stereo[I2S_TX_PATH];
+		ucontrol->value.enumerated.item[0] =
+			i2s->mono_to_stereo[I2S_TX_PATH];
 	else if (strstr(kcontrol->id.name, "Playback Stereo To Mono"))
-		*uctl_val = i2s->stereo_to_mono[I2S_RX_PATH];
+		ucontrol->value.enumerated.item[0] =
+			i2s->stereo_to_mono[I2S_RX_PATH];
 	else if (strstr(kcontrol->id.name, "Playback Mono To Stereo"))
-		*uctl_val = i2s->mono_to_stereo[I2S_RX_PATH];
+		ucontrol->value.enumerated.item[0] =
+			i2s->mono_to_stereo[I2S_RX_PATH];
 	else if (strstr(kcontrol->id.name, "Playback FIFO Threshold"))
-		*uctl_val = i2s->rx_fifo_th;
+		ucontrol->value.integer.value[0] = i2s->rx_fifo_th;
 	else if (strstr(kcontrol->id.name, "BCLK Ratio"))
-		*uctl_val = i2s->bclk_ratio;
+		ucontrol->value.integer.value[0] = i2s->bclk_ratio;
 
 	return 0;
 }
@@ -344,10 +347,9 @@ static int tegra210_i2s_put_control(struct snd_kcontrol *kcontrol,
 {
 	struct snd_soc_component *compnt = snd_soc_kcontrol_component(kcontrol);
 	struct tegra210_i2s *i2s = snd_soc_component_get_drvdata(compnt);
-	int value = ucontrol->value.integer.value[0];
 
 	if (strstr(kcontrol->id.name, "Loopback")) {
-		i2s->loopback = value;
+		i2s->loopback = ucontrol->value.integer.value[0];
 
 		regmap_update_bits(i2s->regmap, TEGRA210_I2S_CTRL,
 				   I2S_CTRL_LPBK_MASK,
@@ -362,24 +364,28 @@ static int tegra210_i2s_put_control(struct snd_kcontrol *kcontrol,
 		 * cases mixer control is used to update custom values. A value
 		 * of "N" here means, width is "N + 1" bit clock wide.
 		 */
-		i2s->fsync_width = value;
+		i2s->fsync_width = ucontrol->value.integer.value[0];
 
 		regmap_update_bits(i2s->regmap, TEGRA210_I2S_CTRL,
 				   I2S_CTRL_FSYNC_WIDTH_MASK,
 				   i2s->fsync_width << I2S_FSYNC_WIDTH_SHIFT);
 
 	} else if (strstr(kcontrol->id.name, "Capture Stereo To Mono")) {
-		i2s->stereo_to_mono[I2S_TX_PATH] = value;
+		i2s->stereo_to_mono[I2S_TX_PATH] =
+			ucontrol->value.enumerated.item[0];
 	} else if (strstr(kcontrol->id.name, "Capture Mono To Stereo")) {
-		i2s->mono_to_stereo[I2S_TX_PATH] = value;
+		i2s->mono_to_stereo[I2S_TX_PATH] =
+			ucontrol->value.enumerated.item[0];
 	} else if (strstr(kcontrol->id.name, "Playback Stereo To Mono")) {
-		i2s->stereo_to_mono[I2S_RX_PATH] = value;
+		i2s->stereo_to_mono[I2S_RX_PATH] =
+			ucontrol->value.enumerated.item[0];
 	} else if (strstr(kcontrol->id.name, "Playback Mono To Stereo")) {
-		i2s->mono_to_stereo[I2S_RX_PATH] = value;
+		i2s->mono_to_stereo[I2S_RX_PATH] =
+			ucontrol->value.enumerated.item[0];
 	} else if (strstr(kcontrol->id.name, "Playback FIFO Threshold")) {
-		i2s->rx_fifo_th = value;
+		i2s->rx_fifo_th = ucontrol->value.integer.value[0];
 	} else if (strstr(kcontrol->id.name, "BCLK Ratio")) {
-		i2s->bclk_ratio = value;
+		i2s->bclk_ratio = ucontrol->value.integer.value[0];
 	}
 
 	return 0;
-- 
2.7.4

