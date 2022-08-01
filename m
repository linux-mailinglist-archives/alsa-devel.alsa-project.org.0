Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 30858586E50
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Aug 2022 18:10:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D5B9785D;
	Mon,  1 Aug 2022 18:09:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D5B9785D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1659370217;
	bh=BTAJ/Pbd0FMo1Kk0QD0LcqOThSfZTyyWvEPzq0s0hj0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZJ2bWSq//vt+Heu9QPOvPyJJMOJqXHVsNjs6djAmnc4TGX+oR5RVxRoCGkeln1qfQ
	 zuFjemcMLtcUvlz3SJ2u+ezoGgqTRYiOhRwm3X1D3iJKi6+UGsIU2E1e4/cfnyg3Yr
	 o8B+fWy6alaA9Mfjv31gMnl8mJvphm81MUHIzxi0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 31C4FF8055A;
	Mon,  1 Aug 2022 18:08:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 110B9F8054A; Mon,  1 Aug 2022 18:08:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NO_DNS_FOR_FROM,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 486C0F804FA
 for <alsa-devel@alsa-project.org>; Mon,  1 Aug 2022 18:08:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 486C0F804FA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com
 header.b="NHCgvxkO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WgoDaUXnX7PGheMfv/XGYdu3Yinu0LTiCe6JN9hbTHgwja1Vqez6v2j/2blQFbs3tiwJJN2T8VovmkJcNFBIdOqRj/1yPtQ44CHiIFso/pSDzviInOe5eAFarpQCvgv9WEAEim5paXkD5/qERiU9QXDfdxTOBveo0XYbwBxAk5ch0bQQIhHkLaBAzZdJ/vWdaBuLHIu4PDdxEMPaBvuZzAiA8RvZfd3Dqawf4TVQEIxhT5UGiqPlhbX9DF9dUpxmueLvV/Z4hrtdsd8M/BgTP1t8FnPySBVfd2SdbUDWJuXhEDtSqdBJEf7iOT2L16jyYFFDtyDZMnILgh3V9LAs0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cfNcRFaISfDrIFhYwQbPhX7g6U7B0ezGsuFF8+x9Fsc=;
 b=ZGEhaRoWkJUpTWAfODEhUe8mHf5TZujSoXjxu6j7tZkD9qFhoRYHPS8D+QutMioC6/sBmWBK5v9t5TQLux/1evDWLIzsmwRcL5RsXVUh1S7iyMF6UCWJp6Q0LDvk/TCpR69vUeHBIXaVK7do8QvDxBVBlTGhMYoZ20lAnfZUtYXg+j1+/vRI1cfrxNtrlcCzv1qmkvnsy+GZ62v4EeO2nlVCkkKg9pEO9wiJYrucK7C+/aXHYO+zEg7AlTf5Hm8i5twH+THCQGwdEWFXjQhIinfNJxfOkk7L+6OtCnEVDYALxausHJOH2R8WBapCrJe5aSGUJ2bJxh1c9SY31HB6Hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.236) smtp.rcpttodomain=renesas.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cfNcRFaISfDrIFhYwQbPhX7g6U7B0ezGsuFF8+x9Fsc=;
 b=NHCgvxkOcClc59EjIPwYqIn18GJZokezHovm+YURjU5biyXLqqYXlSfBH0lLFPnKI6GW9VceNi80FTkUzRI34HOGqi4oox9cVE7ZhME7r2G164+XniKXkV4rOZONZwN3D00L4FlRJ+mW2HDqTzCWTjRDvX5FRQhlnPM0zf46JdTrNqC7xX2NseuSgg9fQZfKr2/hGh28jTuDXIcPN9SjgLz15zYJTVQ75ZIoBQHmNGVoiEK5yR2mb6vjuVPOXaMm1SHLX1kC7j1QbtnerFAuSxL27kD8egW3F9LMjWSsiYJGvYADxXCdomYxMyoRsjfd5Mu0KdK5QJ99COKo+ZKKzQ==
Received: from BN9PR03CA0088.namprd03.prod.outlook.com (2603:10b6:408:fc::33)
 by BN6PR12MB1842.namprd12.prod.outlook.com (2603:10b6:404:fb::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.11; Mon, 1 Aug
 2022 16:08:18 +0000
Received: from BN8NAM11FT019.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:fc:cafe::b) by BN9PR03CA0088.outlook.office365.com
 (2603:10b6:408:fc::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.16 via Frontend
 Transport; Mon, 1 Aug 2022 16:08:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.236)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.236 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.236; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (12.22.5.236) by
 BN8NAM11FT019.mail.protection.outlook.com (10.13.176.158) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5482.10 via Frontend Transport; Mon, 1 Aug 2022 16:08:17 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 DRHQMAIL109.nvidia.com (10.27.9.19) with Microsoft SMTP Server (TLS) id
 15.0.1497.32; Mon, 1 Aug 2022 16:08:16 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.26; Mon, 1 Aug 2022 09:08:16 -0700
Received: from audio.nvidia.com (10.127.8.10) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server id 15.2.986.26 via Frontend
 Transport; Mon, 1 Aug 2022 09:08:13 -0700
From: Sameer Pujar <spujar@nvidia.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <robh+dt@kernel.org>,
 <krzysztof.kozlowski+dt@linaro.org>, <perex@perex.cz>, <tiwai@suse.com>,
 <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 3/3] ASoC: simple-card-utils: Fixup DAI sample format
Date: Mon, 1 Aug 2022 21:37:32 +0530
Message-ID: <1659370052-18966-4-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1659370052-18966-1-git-send-email-spujar@nvidia.com>
References: <1659370052-18966-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 08325247-eed8-46b3-4edc-08da73d80c13
X-MS-TrafficTypeDiagnostic: BN6PR12MB1842:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 93/Y91Yb5L4RQjgcyeMrIGxdE2mWRtSJ2RthzMpsdaZaPIFDKyUjmiUX679rx6IjhQdc/DGO7lhUVhHNtO9GLQ2H+U34II6uDwRK3dNlvHghZ1CxiysTV6XU7Y51EMHQPCf+5xUHivo/lhPRC6LkDVyiPr8ZVsc91URxJ7Bm7xBFVQ7OsmcyR1IT+hBERasCqirsEU5epVwpJcT37uClIr0psHa/hEOXfcgTnDhaMa2OVfyGyJn7KkNTAfq9+NsHfcMofAexGd5n7ZKllbILLQqL4f0/i8tVg7nkl4nO05NOQQJ1mrw1vkRCSCdGq3X7pabUO6AjMg1okgoBcA6AKT8T5j53FofQIaOeJ/FEv82rBGMyHG0lKoh05Kci0+qWTuBpMFUrgf+LAVHmmYtK6c9SRmC2AFu3UXIf+514jBUHE3WXVC8QgclQ4sUhduU9jxs3rQPdQFPQu1RLqnik+kLH1ewlvYt1K6b2N7SJExpWR+uc1mTAkygFgukBtV9NJufsctcrLhQDbp/h725w85byODP8kMn03D4yvWXTQNNAQWjdrRSITccvJGeayoChGkVKNHmRlG+gp/eMt1ZtJ+BtTab6LEO+SEqC/Gn4v+rOqJU/VsBVO4kdmcpJSceQ2XACf2VEhH5R3BkfSyCoA4t3OjnWZr0deNAugc+8vQwAij2a146NA9dNAnZ2QFk5CE+Go5VoaGbUDUfa5x1M0yXpQRTdHIAhQOaz6CjQNuiRmdcKCZKXYywv/9Ex0Exryx+kOeHren91TAHyLgoFpEtacqZXVdSVOcynMTc0bNH8wXxijPQHoj7EZEG0uyFbJ1AjtGj3ShJQjDGX3NJNuw==
X-Forefront-Antispam-Report: CIP:12.22.5.236; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:InfoNoRecords; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(376002)(136003)(39860400002)(396003)(40470700004)(36840700001)(46966006)(7696005)(6666004)(47076005)(426003)(336012)(41300700001)(186003)(2616005)(26005)(107886003)(82740400003)(81166007)(356005)(36860700001)(5660300002)(7416002)(8936002)(40480700001)(82310400005)(36756003)(40460700003)(478600001)(86362001)(70586007)(70206006)(4326008)(8676002)(316002)(54906003)(2906002)(110136005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2022 16:08:17.7193 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 08325247-eed8-46b3-4edc-08da73d80c13
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[12.22.5.236];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT019.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1842
Cc: Sameer Pujar <spujar@nvidia.com>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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

Parse "convert-sample-format" DT binding and fixup the sample format
as applicable. This is similar to the existing "convert-channels" and
"convert-rate" properties for channels and rate fixup respectively.

Signed-off-by: Sameer Pujar <spujar@nvidia.com>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/simple_card_utils.h     |  1 +
 sound/soc/generic/simple-card-utils.c | 34 ++++++++++++++++++++++++++++++++++
 2 files changed, 35 insertions(+)

diff --git a/include/sound/simple_card_utils.h b/include/sound/simple_card_utils.h
index ab55f40..a0b827f 100644
--- a/include/sound/simple_card_utils.h
+++ b/include/sound/simple_card_utils.h
@@ -39,6 +39,7 @@ struct asoc_simple_dai {
 struct asoc_simple_data {
 	u32 convert_rate;
 	u32 convert_channels;
+	const char *convert_sample_format;
 };
 
 struct asoc_simple_jack {
diff --git a/sound/soc/generic/simple-card-utils.c b/sound/soc/generic/simple-card-utils.c
index 4a29e31..1b201dd 100644
--- a/sound/soc/generic/simple-card-utils.c
+++ b/sound/soc/generic/simple-card-utils.c
@@ -15,6 +15,33 @@
 #include <sound/pcm_params.h>
 #include <sound/simple_card_utils.h>
 
+static void asoc_simple_fixup_sample_fmt(struct asoc_simple_data *data,
+					 struct snd_pcm_hw_params *params)
+{
+	int i;
+	struct snd_mask *mask = hw_param_mask(params,
+					      SNDRV_PCM_HW_PARAM_FORMAT);
+	struct {
+		char *fmt;
+		u32 val;
+	} of_sample_fmt_table[] = {
+		{ "s8",		SNDRV_PCM_FORMAT_S8},
+		{ "s16_le",	SNDRV_PCM_FORMAT_S16_LE},
+		{ "s24_le",	SNDRV_PCM_FORMAT_S24_LE},
+		{ "s24_3le",	SNDRV_PCM_FORMAT_S24_3LE},
+		{ "s32_le",	SNDRV_PCM_FORMAT_S32_LE},
+	};
+
+	for (i = 0; i < ARRAY_SIZE(of_sample_fmt_table); i++) {
+		if (!strcmp(data->convert_sample_format,
+			    of_sample_fmt_table[i].fmt)) {
+			snd_mask_none(mask);
+			snd_mask_set(mask, of_sample_fmt_table[i].val);
+			break;
+		}
+	}
+}
+
 void asoc_simple_convert_fixup(struct asoc_simple_data *data,
 			       struct snd_pcm_hw_params *params)
 {
@@ -30,6 +57,9 @@ void asoc_simple_convert_fixup(struct asoc_simple_data *data,
 	if (data->convert_channels)
 		channels->min =
 		channels->max = data->convert_channels;
+
+	if (data->convert_sample_format)
+		asoc_simple_fixup_sample_fmt(data, params);
 }
 EXPORT_SYMBOL_GPL(asoc_simple_convert_fixup);
 
@@ -49,6 +79,10 @@ void asoc_simple_parse_convert(struct device_node *np,
 	/* channels transfer */
 	snprintf(prop, sizeof(prop), "%s%s", prefix, "convert-channels");
 	of_property_read_u32(np, prop, &data->convert_channels);
+
+	/* convert sample format */
+	snprintf(prop, sizeof(prop), "%s%s", prefix, "convert-sample-format");
+	of_property_read_string(np, prop, &data->convert_sample_format);
 }
 EXPORT_SYMBOL_GPL(asoc_simple_parse_convert);
 
-- 
2.7.4

