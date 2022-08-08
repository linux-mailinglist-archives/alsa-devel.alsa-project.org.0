Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 586A558C2DA
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Aug 2022 07:29:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DD96115C2;
	Mon,  8 Aug 2022 07:29:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DD96115C2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1659936590;
	bh=BTAJ/Pbd0FMo1Kk0QD0LcqOThSfZTyyWvEPzq0s0hj0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nJLxUVH4W8piP+bh/823kta/UZ1AHYTlSOnSbKsa2tc7uXH+UAKCW609Ps/lfyKAo
	 nz8qJdhcrXSbzJkWcshBe55OfUnaS01MLeL4G1JDrv5GoAzT8k5EWOYrPSCBgYR3dw
	 oJYyuuxB2FQvvvKMoCc2lJtUke8oAHRzz5Sw93o4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EA311F80557;
	Mon,  8 Aug 2022 07:28:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9C337F80557; Mon,  8 Aug 2022 07:28:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NO_DNS_FOR_FROM,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2062.outbound.protection.outlook.com [40.107.94.62])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 12A56F80551
 for <alsa-devel@alsa-project.org>; Mon,  8 Aug 2022 07:28:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 12A56F80551
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com
 header.b="n3G0Bekp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KcpDsNRS2kvSn0lET8mkrZqotT/IjJOvAynreW3eqP+XKV3KlbVRu1HFryQMN0yYcFWjbgSUkVn/gIX4V+2aYNFsKfa/CgNYSH/a9jAIboGqTE/KDMMPOhPvCN/sFHQwPtrfZBef6cTNGWYhFslP6BwO4LQ5RF7E7phHc3O/FsEpTLKu1CCwaleg5gZIEDoH2TznBv5g33vrJ/5WXy8ZhVQps138w9hGB8gkJ487mMVBsGsiGYeQRAImgXOmve+J7+dESKtUIPYlrLLkijYpqDq0cD5k4xROIMjoeOgYt/0HU5WP4wQliS8iECXbsI+FZmjqFlGF2yhaGkJWJe2oQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cfNcRFaISfDrIFhYwQbPhX7g6U7B0ezGsuFF8+x9Fsc=;
 b=fFDzNE/Kit4b6h1SN1HLGg16q5YKh0AT2uK6p66s75cSjd22mWOSdSiafLltkudChbid/XW8EAjLEft49glr5IJRQx7P83FKkI61lAXNR0bU84hcHtMEJL00QMtzcXQ2/0TT1aRt7lUda7k3ZPWVnPTGXKaivJygCEMLh9v2rF3YoJKpiJ0/eGJq6g0ZXcIIosmqn39DGPAZpxiqLyrjj5/R4KelertV9Eg5nzDPl3Ni4SWRjxvMTRfrhox9fvzgSyQmKEn0O2KXp5j3rtgDFUhgEjk/is7StVYIgEy6/pJpm5MOaZbxugzUYnymTF0QqyIdW8TK9kMLCfM2xgx5PA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.238) smtp.rcpttodomain=renesas.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cfNcRFaISfDrIFhYwQbPhX7g6U7B0ezGsuFF8+x9Fsc=;
 b=n3G0BekpwXoBjXRVQhPFf92EyauoPU3hrKXgQAKuCS/hN/n0D8ilPIpTJS+ohBeR7sqsbb9uUHiUIHqoMukOW3hLNL/YEgl2Nsp3ESt+4Zt8r4k9D2Q/oDl9BMRKS01kqfHbXhhjsJAt2dN7p0raN6R9xtzSZuAWjtofH5poeuKe3dauVhep9YubpoJ2CngRh8T0S+AmcT+yNfXcJpJ+gS8cJXDGUi8h5/KVlZ8G43udDEPqE3hpHF2XcmkoEEr89rcaHft53e2MMW+mERFrLA1B/Ef1ohcyBNemn8nWmz52KXaRkoZtACpQ8b4rmc3J+qsmJcW70OkNq/M3DJCd7g==
Received: from DM6PR07CA0131.namprd07.prod.outlook.com (2603:10b6:5:330::19)
 by BN6PR12MB1137.namprd12.prod.outlook.com (2603:10b6:404:1c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Mon, 8 Aug
 2022 05:27:54 +0000
Received: from DM6NAM11FT034.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:330:cafe::b7) by DM6PR07CA0131.outlook.office365.com
 (2603:10b6:5:330::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14 via Frontend
 Transport; Mon, 8 Aug 2022 05:27:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.238)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.238 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.238; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (12.22.5.238) by
 DM6NAM11FT034.mail.protection.outlook.com (10.13.173.47) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5504.14 via Frontend Transport; Mon, 8 Aug 2022 05:27:54 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by DRHQMAIL105.nvidia.com
 (10.27.9.14) with Microsoft SMTP Server (TLS) id 15.0.1497.32;
 Mon, 8 Aug 2022 05:27:53 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.26; Sun, 7 Aug 2022
 22:27:53 -0700
Received: from audio.nvidia.com (10.127.8.10) by mail.nvidia.com (10.129.68.9)
 with Microsoft SMTP Server id 15.2.986.26 via Frontend Transport;
 Sun, 7 Aug 2022 22:27:50 -0700
From: Sameer Pujar <spujar@nvidia.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <robh+dt@kernel.org>,
 <krzysztof.kozlowski+dt@linaro.org>, <perex@perex.cz>, <tiwai@suse.com>,
 <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 3/3] ASoC: simple-card-utils: Fixup DAI sample format
Date: Mon, 8 Aug 2022 10:57:32 +0530
Message-ID: <1659936452-2254-4-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1659936452-2254-1-git-send-email-spujar@nvidia.com>
References: <1659936452-2254-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 135f38e2-0dbd-4b01-1d68-08da78febee9
X-MS-TrafficTypeDiagnostic: BN6PR12MB1137:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zY6WA1lV22RsxBPOj5gNP6ObIGccebEPN5luwv+5nO0UqWz+/4oPUZ00EvFGzNnxHm2UD5BEuVNiGNs9ZanE6GphVauhE9hxkjnqj5E5uisb86msTBEZ5GWANU55i2SXGMaqZNgqy9bN/7mJgxH4mv/49ZC2TM+l9ox2gYkbzLe0BqpaEC7WlYXuQU1bKFUGnQMWK7ZZcw2+3Q1yjvOBaDfW9UHKGq8bIyG7eO4cPq9bUiyjAoh0WwYle8wpHLgZ+zjaVgh/G5fv/2/BQ9Z3e6mgjwSNYVL84Z1npcfJTbtFSoRC/j87tT0yXWjHnUJNJzTJ07zxc+VH/eKPiFiC1TbQzsmNW/mMF79qPB9+1aqsVz+pfu5eVRAWn3zYfpb0GwF5vqm5kS/5IuXBap/L3bukVFileFJaIBt4REgIIy0s3MvxaZ+qLGSjqBh/Op98nW8zFMvhSSjTr7xAcjjwIkwNiheM0hVLBTNTki6zMQlB4mEofKxfM808uqB8El30d7B92djJkkYmYbndc6jIDzs5hf2OPJVnhrMnf5Gnx+bMmjcjgenPjZbJ+kiZj/17v35wV6ZGZQ1OIDBLpLf+qIPUABfTvNcHNFQVG/HgAAKoV3ZVyfcrZrQHnPW8+c7UGMeapqjxBbc809eACI4yfYgvNFVUilgd8euouuz5fKfZmJDd4iXwAEdceYvaJXTJcnxqaTMHzT/gIfJZ8csd/QPvFAUwlWgutfGZj+CusSjWfCaaFFLSoMVhFUGEd96jlP0X/jJ3kWCd+a5suhQeBA3yV+rwigMPzYdvbADilueS8DoGECUmUhtqoEqJuCxTmQxTPEEya4Ysqe4TQ9e36A==
X-Forefront-Antispam-Report: CIP:12.22.5.238; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:InfoNoRecords; CAT:NONE;
 SFS:(13230016)(4636009)(376002)(39860400002)(346002)(136003)(396003)(40470700004)(36840700001)(46966006)(40460700003)(86362001)(36756003)(82310400005)(2906002)(356005)(81166007)(7416002)(5660300002)(36860700001)(8936002)(478600001)(8676002)(70206006)(4326008)(40480700001)(6666004)(7696005)(70586007)(41300700001)(107886003)(110136005)(47076005)(426003)(336012)(54906003)(82740400003)(26005)(2616005)(316002)(186003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2022 05:27:54.5071 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 135f38e2-0dbd-4b01-1d68-08da78febee9
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[12.22.5.238];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT034.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1137
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

