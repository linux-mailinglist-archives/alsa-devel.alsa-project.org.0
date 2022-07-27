Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 569DE58289A
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Jul 2022 16:28:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E21761664;
	Wed, 27 Jul 2022 16:27:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E21761664
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658932114;
	bh=+GXRVjd//X4JfnkXdOdAjEpCe4lEilhbMqfcqloMjO8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gxBm14C1kj1h2lh61bPfXN+lgN0rCO0Bu+crjyXjd4M0fqRLHAkQEQKJs3m66aRrp
	 llzkHZZcxcK7GT8P5y97HAAeSnu8aXYTCUNhOQcZqmuSnKrY3MtfpwI3XtFgDdSIlO
	 kmlt2LUtuJ7MReceBry61IbL/2ZzRQoR11S2SGLk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CE796F80552;
	Wed, 27 Jul 2022 16:27:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6CE34F80551; Wed, 27 Jul 2022 16:26:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2051.outbound.protection.outlook.com [40.107.102.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7B6EFF800FA
 for <alsa-devel@alsa-project.org>; Wed, 27 Jul 2022 16:26:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7B6EFF800FA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com
 header.b="DoA0WsLj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fEhU951Ofy4O6CrtKA+ajEIGOKzR/nWqzFIWprAkPNkguyzLeziPjkXg6eRpH7m3NFj8Qi5ln81uv5J9erEFEgNajqFYhTO3jU0H5D0WIM7uRoTWbdwR79sq08blanmiPN3f+rg5EcbhliCu9XUM5W4HosPOhFsvnHevIxWTXUHypYUNAF3egT0PRgL567M8kgUvJCugMQUMsAXsuQJrDh2sw5R9pvIvXwo9FtlaeAYTaa7BzWPNcXuvDrZl35o5xbLinsCXqtuMLy+UYTqNKCLkOmkOqBZuNpcAyfQFNVeVVTaE5tKpyH3doniZIQ+C+9vUP7BX4jubxjYXC4PKBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yYll37jJ/5ARnWpURdJ9bZ9HIaGmaIfC4gshWatZxFg=;
 b=Pp9XlgNe+ZlpyIfDgx8jQwFseDiULXTWeR4JfM+VV3I0qKuZs28LTWPTlVBTZkmDCRZ2Ng6TL+tNBCYvtekg4XwDy3+zLf1v+7fLbbyHw6dyWxZPckDYoAFHPuREWjPdXvybyeu4EVgYDF2KRmgO178fnUqd0txvMj8XIRyMgRH4uPm1lLAxcSLKNSrJ9xfwwRJARwhd8rBhNVDaYQSnwjsEu0heUQ5BrQnTx+2jtiTnEm6/wT8Z+zZL/En0N4yy1XGhPcs3OHkxRgpC7rP0GMl4hrZOv9nd6z79YsiPMDKmX/r0lMP8D2to0DQM8cvyZLa4K29xACHNZzqBJYohyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.234) smtp.rcpttodomain=renesas.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yYll37jJ/5ARnWpURdJ9bZ9HIaGmaIfC4gshWatZxFg=;
 b=DoA0WsLj8Fg94PaGtaAq2ANPTVs00cK/Z1xLk2IuJw936YcMW3EqwtNeWWECTZZzTs1kh6fTaJKQXsEdf7BU2AiKfVwAqTIMD/iktxfosy54OrI+6T4TGFwJMs26GFP46u+Nt62UEqbhZ7DmVdnhu++sB/BGaukpmY9Aihe7mjdvlrwHjWnAC0SiD6JhD1NbovPyVA/4xnjg03SPT8Pj7/cXD8ZwLB5slD3FfoHZcZqbLm30tJfeRu60xIo76Fy8tM1fdzVOW7R/AA8gdmUJ/AYBVyyPRVjQBx0OYptmas9y2Bqa+r4T1/R6dDet3M+27ZnnDUUonSKbRE/HPy+qUg==
Received: from MW2PR16CA0062.namprd16.prod.outlook.com (2603:10b6:907:1::39)
 by BN6PR12MB1410.namprd12.prod.outlook.com (2603:10b6:404:18::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.20; Wed, 27 Jul
 2022 14:26:46 +0000
Received: from CO1NAM11FT066.eop-nam11.prod.protection.outlook.com
 (2603:10b6:907:1:cafe::3a) by MW2PR16CA0062.outlook.office365.com
 (2603:10b6:907:1::39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.19 via Frontend
 Transport; Wed, 27 Jul 2022 14:26:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.234)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.234; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (12.22.5.234) by
 CO1NAM11FT066.mail.protection.outlook.com (10.13.175.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5482.10 via Frontend Transport; Wed, 27 Jul 2022 14:26:45 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 DRHQMAIL101.nvidia.com (10.27.9.10) with Microsoft SMTP Server (TLS) id
 15.0.1497.32; Wed, 27 Jul 2022 14:26:45 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.26; Wed, 27 Jul 2022 07:26:44 -0700
Received: from audio.nvidia.com (10.127.8.10) by mail.nvidia.com
 (10.126.190.181) with Microsoft SMTP Server id 15.2.986.26 via Frontend
 Transport; Wed, 27 Jul 2022 07:26:41 -0700
From: Sameer Pujar <spujar@nvidia.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <robh+dt@kernel.org>,
 <krzysztof.kozlowski+dt@linaro.org>, <perex@perex.cz>, <tiwai@suse.com>,
 <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 2/2] ASoC: simple-card-utils: Fixup DAI sample format
Date: Wed, 27 Jul 2022 19:56:23 +0530
Message-ID: <1658931983-31647-3-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1658931983-31647-1-git-send-email-spujar@nvidia.com>
References: <1658931983-31647-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3c01a366-85a3-430b-2457-08da6fdc08b3
X-MS-TrafficTypeDiagnostic: BN6PR12MB1410:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kZlGXnhMfZZ8c+F8jPYmO6uw2HFfmbVnPH4Rd0C0v4vwkwaVtJYFuZISIEyF6ZxSaQgkl2VaQhYZSaoOp7NooGPtX8tYTl596rjq0wY723ELV7/n4E6yHrTG1HkUWPytNlG6n+hth3AOZsYL/qmTybCHATFF1psfK+wdDXRle0MsLszdICWmACFbUlAhjkHBYdY+dPkP332KI7z8qWmiFEqRmq31qNgapXV80jeKhUrClHFvGjlVE7RwMT7XFZmUByxLvHYYs/fe5rZyZQZQuyja9/P4Q7NvZ0UdUbsgaqHJVoQ22n4wor1hEnV9E07EfmYIaPXWudmGO521wOq4By8MGoOsfaDXp2Ll8qiCAYcdXWbm05iCBIYlZ3jvjnw/Wq+efvVm3RB3S1IKTyhKBqZTcUZKclWp6FIk+Z8D1CmGjOrwBqJCo0g04dBqp28e4sCfezH/OvWFZrdPPd4K2VHBwnV4HZa4jAbC3G9kG3/Zm4hHhUDP/21XDdJAOGq1UNWx9Q2QXm0ELiucGokldoTDB4ngbtYRWDb6aj39oV6T0AfUljrqto+OISqv7zmXMbj17QC/KTILAB4zEZuc/3zUVj8iw4vQ4Udp25k7r8JTyQBj/eonuUeyMx8DEr7wBBdiNa/+HX8fIEiN89OTZqG/Jli3juYeuEPig/m8pGJ2HN5VNRZHqPWqxMWmoUkA3GPii33MI+e8be9iUfhJqHAPedPp7ow1vZpDq8NVIkiHYsUkiOHw6iDwnyJsxm6PzRGfQTT3LEWLP89MXm4cgHf1ZbUOJwRs6zPrtFck8wzBPUYwrXighgEi2M8UDCblE7JJLW83fqxBStT3zOzSCg==
X-Forefront-Antispam-Report: CIP:12.22.5.234; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:InfoNoRecords; CAT:NONE;
 SFS:(13230016)(4636009)(39860400002)(376002)(136003)(346002)(396003)(46966006)(36840700001)(40470700004)(5660300002)(82740400003)(110136005)(8676002)(8936002)(4326008)(7416002)(316002)(54906003)(7696005)(70206006)(86362001)(26005)(478600001)(40480700001)(41300700001)(47076005)(36756003)(2616005)(356005)(82310400005)(81166007)(426003)(336012)(70586007)(186003)(6666004)(107886003)(40460700003)(36860700001)(2906002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2022 14:26:45.4542 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c01a366-85a3-430b-2457-08da6fdc08b3
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[12.22.5.234];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT066.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1410
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
 sound/soc/generic/simple-card-utils.c | 12 ++++++++++++
 2 files changed, 13 insertions(+)

diff --git a/include/sound/simple_card_utils.h b/include/sound/simple_card_utils.h
index ab55f40..39ea57d 100644
--- a/include/sound/simple_card_utils.h
+++ b/include/sound/simple_card_utils.h
@@ -39,6 +39,7 @@ struct asoc_simple_dai {
 struct asoc_simple_data {
 	u32 convert_rate;
 	u32 convert_channels;
+	int convert_sample_format;
 };
 
 struct asoc_simple_jack {
diff --git a/sound/soc/generic/simple-card-utils.c b/sound/soc/generic/simple-card-utils.c
index 4a29e31..6ce5102 100644
--- a/sound/soc/generic/simple-card-utils.c
+++ b/sound/soc/generic/simple-card-utils.c
@@ -22,6 +22,8 @@ void asoc_simple_convert_fixup(struct asoc_simple_data *data,
 						SNDRV_PCM_HW_PARAM_RATE);
 	struct snd_interval *channels = hw_param_interval(params,
 						SNDRV_PCM_HW_PARAM_CHANNELS);
+	struct snd_mask *mask = hw_param_mask(params,
+						SNDRV_PCM_HW_PARAM_FORMAT);
 
 	if (data->convert_rate)
 		rate->min =
@@ -30,6 +32,11 @@ void asoc_simple_convert_fixup(struct asoc_simple_data *data,
 	if (data->convert_channels)
 		channels->min =
 		channels->max = data->convert_channels;
+
+	if (data->convert_sample_format >= 0) {
+		snd_mask_none(mask);
+		snd_mask_set(mask, data->convert_sample_format);
+	}
 }
 EXPORT_SYMBOL_GPL(asoc_simple_convert_fixup);
 
@@ -49,6 +56,11 @@ void asoc_simple_parse_convert(struct device_node *np,
 	/* channels transfer */
 	snprintf(prop, sizeof(prop), "%s%s", prefix, "convert-channels");
 	of_property_read_u32(np, prop, &data->convert_channels);
+
+	/* convert sample format */
+	data->convert_sample_format = -EINVAL;
+	snprintf(prop, sizeof(prop), "%s%s", prefix, "convert-sample-format");
+	of_property_read_u32(np, prop, &data->convert_sample_format);
 }
 EXPORT_SYMBOL_GPL(asoc_simple_parse_convert);
 
-- 
2.7.4

