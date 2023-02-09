Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 11794690C08
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Feb 2023 15:39:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DC81ADF6;
	Thu,  9 Feb 2023 15:38:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DC81ADF6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675953576;
	bh=ZDVBhVgjP2swMKgVumpjhsY3AnR1J1UuP/nXsLuyA58=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=sV33NzddEzLsmSedR8KM2P2r/G07kxjpIzzIknN/AbDDOYX1CeQ4a6/XEjIQEJSju
	 6lnA1e1zF5f/yjQphdRKNDECdRI+GUErgkuUgKOIlCT+cgsI2f8hlHibC3i2lNijvp
	 rXZjXtN7kB7BxUhXfarehGtsyZGzPQjXk2wvyeLU=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 639BDF804F2;
	Thu,  9 Feb 2023 15:37:58 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9E515F8018A; Thu,  9 Feb 2023 15:37:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2061e.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5a::61e])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 43B95F80094
	for <alsa-devel@alsa-project.org>; Thu,  9 Feb 2023 15:37:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 43B95F80094
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256
 header.s=selector2 header.b=qXB609Mi
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gv2VDPSC4PRsW18k88FmpStB8t1u4WeNLMs1oM2av2A4YU1bWIUCtMiHHiFljCivBW9Wlz29TR2OGW2gXaiKuH2dK/7iFT/hWlIJwt8/UaHWmg9XxtkXKs7pTCdhuMycZ0nIYUHyRjXdAfhmGqqnzQHFXCyeCwXmWM3g44Co/N+uhu9WNH9eUK+sM1WbTXQdE/lHpchNufYuFECgpfPnALWirsiSqdJPRZW8n/1zsWHOaA34vhRZzdmxIrKvTqi/x+golvmBcbxKK3GlbDdPHzv5EI39jy9eOuTe3U4Vp33ARML1orhqDv1YAjWmGnT7AtdZxHQ1Ysa6IkU0TUkRWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A1Vrw+KmgrBuYN8RiEbxbcp9/YV4AyN28BkvaDqU5xc=;
 b=bNX0IvwRHV4ifnabgWbJwRP+Ylg0XWBaXIeOLxI/dUT3XYefeWX+8BTyN0L7mUeyq4tgyPSkzwUdkEhaajrFqenXHYdrZ4CpQbwZqPCcHic8bAW2HeXmOzTMrpMjCxyzzTWr4BS2NtuqeC90KqLgTcNEg1O0hm0QjSd+E34jMyPA+zbFhjrSBj/+eFz7TkhVh8Ng6bnkz8YQw1oNnOAobA8XffToVcB6d4CjSsJMhIFn74fSD5ULkg2jKNSMq3l5Nso4xPk6KUdg8CEmvRLn2AK5xXZn4pnYmMHKjoUidlrbU/iBYCXAfHnmd0TjS6y8XC7jvbfciYLZavbsra/CLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A1Vrw+KmgrBuYN8RiEbxbcp9/YV4AyN28BkvaDqU5xc=;
 b=qXB609MiCbwpRWdYluKU5AQhTjQnFDdWULxzn/Sg3zR61f5RyqGX51OPf1qQUd1BJm3JYmVKVazwIeE/nU2tgwf3MF7ooaqNuF/Y/W0aKkIlXy1AjEJwuxpb7mtQ4ESmD5WmJ2hY+w90XcJ8q5PzFKKu4eJuCFbEkYhj+w1lvzQrGyWLK/afZX6DcbIVxh/+vg9mX4RizPvTXQ3WlGHElKGYysIc4T9+h7D2OjoZ37hVizTKFwTNMovwOM5yqcjtEh+teaO60xHzXRVdrr1X1H6Hf/wkuu3DxpE0Gq1GfPzdvUnAIDy3KCU5TZ1ofJqTuWXpmXfLR4u56SlSKVjBZQ==
Received: from MW4PR04CA0253.namprd04.prod.outlook.com (2603:10b6:303:88::18)
 by CH2PR12MB4103.namprd12.prod.outlook.com (2603:10b6:610:7e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.17; Thu, 9 Feb
 2023 14:37:34 +0000
Received: from CO1NAM11FT081.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:88:cafe::cb) by MW4PR04CA0253.outlook.office365.com
 (2603:10b6:303:88::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.19 via Frontend
 Transport; Thu, 9 Feb 2023 14:37:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CO1NAM11FT081.mail.protection.outlook.com (10.13.174.80) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6086.19 via Frontend Transport; Thu, 9 Feb 2023 14:37:34 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Thu, 9 Feb 2023
 06:37:29 -0800
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Thu, 9 Feb 2023
 06:37:29 -0800
Received: from audio.nvidia.com (10.127.8.10) by mail.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server id 15.2.986.36 via Frontend
 Transport; Thu, 9 Feb 2023 06:37:25 -0800
From: Sameer Pujar <spujar@nvidia.com>
To: <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<thierry.reding@gmail.com>, <jonathanh@nvidia.com>, <oder_chiou@realtek.com>,
	<broonie@kernel.org>
Subject: [PATCH 1/2] ASoC: rt5640: Update MCLK rate in set_sysclk()
Date: Thu, 9 Feb 2023 20:06:56 +0530
Message-ID: <1675953417-8686-2-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1675953417-8686-1-git-send-email-spujar@nvidia.com>
References: <1675953417-8686-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT081:EE_|CH2PR12MB4103:EE_
X-MS-Office365-Filtering-Correlation-Id: 4da1e8e1-5550-4743-6739-08db0aab2f06
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	h3mdkD8plsMGpl9ihB9tw46/F778T+AMFCXUMv3XEtj2EAI4G/Fl6bYW1sBFirSi+jQcJ/gBxPKObl/vTctc6C9UWDvAv8dhnmRojpUOaHEVB/yeM3LUb8j5URV6LwjQ4n+765Ckw+DVZHXwm6O2FZoqKGb4dFfWmiEmlKZBu4PPMutAs8nYXxtIZee1NhEssdiG7gGhuqRqtyojs3f3SJSiGcwPVmtTtA7vTvBAhVTijTqZbMdDWL47B+vq8OJ4F3xqY9wdvi78BjOkWIG6o55R0AjH9MNgiQNWSmGVPptnchwXDD/FxUJyMuKj+EIgBOvLjMQQz0hLG9okeUuxZhTqszS6epTPysOmHiyy+aMpUOVMHmqy4uWYhSKNz0Fg1tq7eKoZd4a27yFaQG6IGYsW9U6k5Foezxy26usAsh8Tl9fhxCGvXrRWlUzy4aqnpjUIBwJtpmnbqljCsSZ4tb/Vqh8jo28uTKtoON7e9kvxBqNgMZDdQC39xX08yQVp5Mblh9nNM9uHnjKV8nOl2ZPMfDlq3nnF8sBSdnpscxRKZFaPedB5o2SzsMPt3qJTzi0ScPZ9F8wcFGL7hxTNgh6QI4+Si9ZUPMcruN5C8jbDIFje2RXkY+FDfV12euZWPFv10/xeaFA4tGzcY009nIUt6yPskVQLXkmSpuDywanXmUGy5SnUrUGuVsc4hDXPlV8yyGeTf+iLzjskWt1hQg==
X-Forefront-Antispam-Report: 
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230025)(4636009)(376002)(39860400002)(346002)(136003)(396003)(451199018)(46966006)(36840700001)(40470700004)(186003)(26005)(2906002)(15650500001)(36756003)(6666004)(107886003)(7416002)(5660300002)(356005)(478600001)(82740400003)(82310400005)(8936002)(41300700001)(7696005)(40480700001)(2616005)(47076005)(8676002)(36860700001)(336012)(70586007)(70206006)(4326008)(83380400001)(86362001)(426003)(110136005)(54906003)(40460700003)(316002)(7636003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2023 14:37:34.6597
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 4da1e8e1-5550-4743-6739-08db0aab2f06
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1NAM11FT081.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4103
Message-ID-Hash: 77Q5JUSGIXASMFBP7G4TTW25FWRV6FDN
X-Message-ID-Hash: 77Q5JUSGIXASMFBP7G4TTW25FWRV6FDN
X-MailFrom: spujar@nvidia.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: tiwai@suse.com, lgirdwood@gmail.com, kuninori.morimoto.gx@renesas.com,
 devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 Sameer Pujar <spujar@nvidia.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/77Q5JUSGIXASMFBP7G4TTW25FWRV6FDN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Simple-card/audio-graph-card drivers do not handle MCLK clock when it
is specified in the codec device node. The expectation here is that,
the codec should actually own up the MCLK clock and do necessary setup
in the driver.

This is inspired from,
commit dbf54a953435 ("ASoC: rt5659: Update MCLK rate in set_sysclk()").

Cc: Oder Chiou <oder_chiou@realtek.com>
Signed-off-by: Sameer Pujar <spujar@nvidia.com>
---
 sound/soc/codecs/rt5640.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/sound/soc/codecs/rt5640.c b/sound/soc/codecs/rt5640.c
index 9e6341a..1392570 100644
--- a/sound/soc/codecs/rt5640.c
+++ b/sound/soc/codecs/rt5640.c
@@ -1838,9 +1838,14 @@ static int rt5640_set_dai_sysclk(struct snd_soc_dai *dai,
 	struct rt5640_priv *rt5640 = snd_soc_component_get_drvdata(component);
 	unsigned int reg_val = 0;
 	unsigned int pll_bit = 0;
+	int ret;
 
 	switch (clk_id) {
 	case RT5640_SCLK_S_MCLK:
+		ret = clk_set_rate(rt5640->mclk, freq);
+		if (ret)
+			return ret;
+
 		reg_val |= RT5640_SCLK_SRC_MCLK;
 		break;
 	case RT5640_SCLK_S_PLL1:
-- 
2.7.4

