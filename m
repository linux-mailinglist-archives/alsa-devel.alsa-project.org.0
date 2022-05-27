Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 104C7535E41
	for <lists+alsa-devel@lfdr.de>; Fri, 27 May 2022 12:28:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A9777172D;
	Fri, 27 May 2022 12:27:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A9777172D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653647314;
	bh=9VR/b9lQ/IJgt8T/cH+co1tovv+QXxmxr2p9zKKEXX4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=L3nUaqHtVJEjlUKn6Qb2Y/GBC79xPQ834vWF1MiTIGfYae+SbZoSvgKVLBPUHXjdH
	 +s7nCFLsh1DDZRGvie7VdU9tn+dtw5Db8Qzd7AokJ7+rv+pjLi9jHbljwzMY6pw06E
	 E/T4QpmwI8cLIsE4SAQGmT8+eJoi+vxLik+Tl3yw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 84F53F80528;
	Fri, 27 May 2022 12:26:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D19DEF8051C; Fri, 27 May 2022 12:26:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on20609.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eb2::609])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 51F2AF80517
 for <alsa-devel@alsa-project.org>; Fri, 27 May 2022 12:26:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 51F2AF80517
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com
 header.b="f42EwroF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DegHRzZKqDIPx6CdkyPWej1e9HwZRMYvvu8SA1esQNU79Z+DwX1DOnaVh3lIGgj0hE6XN+dwXYF7gxA5/dDrxAeHVDvpjUV/CJq6x5fpJOl5NXjLdgitujbiAyp4EF9gcho7J32QAw5cJ0YH1VjCtrsoRekynwDKnKUoSH/dpi/EE/t+NrNuUyQnV7ptcUTL3W02P5fP/2zK7FHX2ah0f7zBr3OlpNBHtEJXDwsaqfrRAXjMO+VLNePRde/0+KAjZdhLfEj4uoHVEtTodKxsfYg5x49QfcrplaRsvOD/4fE3eoAlkoAFU5XVITpk7zV2p+eyZlcpf7uNjgReVPxNzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l2OB4KP4HPqBeNN7TQwLpJSiJbmDC/7/zpPMKNArzKE=;
 b=YXJPXMwUmxySrWi/tT/Y9R/cwZEHlqaNlQrYOHxzRmlvENWMfXIm/vsjXdTrIOT9E2wvb0fQHGO/G79qe7i8b6HpEBool+6Kcv9HnGweu0PT+EZuxKgDFxEa73wBredFS8eV+Kql/OaySj534YpuzY57vX7LzsFU6UbKfoSlK+NawVs1PcSWD2UORLqtbXFdslozJuebsk8hDy0yNlJEy9drvDjEEkt9g81WuV6edAFzTbAgLAKzrBZCNQO51CB56eHxu5f1vVhkIFXTEioQ4Waj4vBI+uyCUzf1cyBhmBp9v0SLBdtZQOZ76z4jEfCVxpPjiBC6gE9XPKemeuivlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.234) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l2OB4KP4HPqBeNN7TQwLpJSiJbmDC/7/zpPMKNArzKE=;
 b=f42EwroF9N03Dag72121GPc7kYyGuPkGlHLAXYeTxgkLG6yFvrXJVcduTktXfLllDMkamHcfl5ct1CdXDAjMbHY5D97qB8AKq5bPvmE0jC2AZDXU47RuvB71elMpN4pJlEe4CRuh8uJVdfrHHP1oOeWjFU6SkUJ6SJL3uKqzSoZrWUHhdDmAUDQrlj/4+IAqFSIXa+P5nfztgl/eDi3Iw9WEnX2lEBUdW62rIjtgjjweFvmhlHjTBPxf8aoofIVSgTFd5MEujnSIEYg9GFjSwJnmKeRNiYeEDdheQgDDdZx8jouRPJBNFuChNJsUXVav6bGUXaspA3BG2dkMEAr6cQ==
Received: from BN0PR04CA0182.namprd04.prod.outlook.com (2603:10b6:408:e9::7)
 by BN9PR12MB5147.namprd12.prod.outlook.com (2603:10b6:408:118::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Fri, 27 May
 2022 10:26:40 +0000
Received: from BN8NAM11FT057.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e9:cafe::a6) by BN0PR04CA0182.outlook.office365.com
 (2603:10b6:408:e9::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13 via Frontend
 Transport; Fri, 27 May 2022 10:26:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.234)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.234; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (12.22.5.234) by
 BN8NAM11FT057.mail.protection.outlook.com (10.13.177.49) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5293.13 via Frontend Transport; Fri, 27 May 2022 10:26:40 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by DRHQMAIL101.nvidia.com
 (10.27.9.10) with Microsoft SMTP Server (TLS) id 15.0.1497.32;
 Fri, 27 May 2022 10:26:39 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Fri, 27 May
 2022 03:26:38 -0700
Received: from audio.nvidia.com (10.127.8.10) by mail.nvidia.com (10.129.68.8)
 with Microsoft SMTP Server id 15.2.986.22 via Frontend Transport;
 Fri, 27 May 2022 03:26:34 -0700
From: Sameer Pujar <spujar@nvidia.com>
To: <broonie@kernel.org>, <robh+dt@kernel.org>,
 <krzysztof.kozlowski+dt@linaro.org>, <thierry.reding@gmail.com>,
 <catalin.marinas@arm.com>, <will@kernel.org>, <perex@perex.cz>,
 <tiwai@suse.com>
Subject: [PATCH v2 4/6] arm64: defconfig: Build Tegra OPE module
Date: Fri, 27 May 2022 15:56:10 +0530
Message-ID: <1653647172-2569-5-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1653647172-2569-1-git-send-email-spujar@nvidia.com>
References: <1653647172-2569-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 96876b0c-3456-4a8b-d51b-08da3fcb6347
X-MS-TrafficTypeDiagnostic: BN9PR12MB5147:EE_
X-Microsoft-Antispam-PRVS: <BN9PR12MB514717962B50AEA90F94A920A7D89@BN9PR12MB5147.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TorqRFwzhkiolnQLvufFyeujyoWp6Xp22hVx65tYdF5XhxkBis8ZyXRJ6Tm3Yt6vsRhbJITa6yDVJsVYNOkx95Cz1oNjrXLiiC1Kv2Hw6wkqKLB1pFhgF2EYUq8kFtMvV8sDRsYzc6MbFlN+s3Hd0Q5GxUrrMSEMZ9GQ33m+CSVqouy+cxDLyObasv9S/AAJ+Jq3lRxFaSnkcobwUiSFOTStsSCIqhisDoxrVeSyJrLi/RuhTuGkjmZwrBS/hjBiiyZnhqlhnAz4Tb6V3Wii51O8LVvKvjGGkAQ6aVi1qA1ZEPdZtYW+hR3/7nvV1PgL1QMnL9SI0yG99+j+uj7bccylJ6SZwTpO8pIPMzGIn/c+4W8fn7C19bmrcimix33VoF1l1e5zRjaOXxJ6cW0xejA0xqXO1xCMukWvXnPI9LUMOQ8jCGt4i4lh2MMMjFqUqlwps12IMlbXWFd9bTOTX4FiT9FOR/TaQ7ZCFaAnXPQpfIgA13UC7X1kJz3r4JfXaJt3qF+VUXtxsAxj1uR5bs8GD0FIhzkZO+xQ6C8mGVuJw/aznIGOco0L+NrM6bzo61ttQXRp8KEQiTflDB2UB4uk/Wq7RJpjvDTZmZtUtwIdcYBbox/m5cAlbUjXMW2eQV/aFEBf3tjLdtzHaIDSPmEf0UnLGkpV7QUuSHCO+qTC+qwXgnEAlNwf3ILkhYlaPTEFTtwszSpAtEpBom4W+Q==
X-Forefront-Antispam-Report: CIP:12.22.5.234; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:InfoNoRecords; CAT:NONE;
 SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(4744005)(81166007)(8676002)(2616005)(4326008)(70206006)(70586007)(356005)(107886003)(508600001)(8936002)(36860700001)(7416002)(86362001)(7696005)(40460700003)(5660300002)(54906003)(110136005)(36756003)(2906002)(316002)(47076005)(186003)(336012)(426003)(82310400005)(26005)(6666004)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2022 10:26:40.1190 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 96876b0c-3456-4a8b-d51b-08da3fcb6347
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[12.22.5.234];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT057.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5147
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Sameer Pujar <spujar@nvidia.com>, linux-kernel@vger.kernel.org,
 jonathanh@nvidia.com, linux-tegra@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
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

Output Processing Engine (OPE) module is a client of AHUB on Tegra210
and later generations of Tegra SoCs. Enable the driver build to use
this in audio path.

Signed-off-by: Sameer Pujar <spujar@nvidia.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 7d11053..3e154cb 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -808,6 +808,7 @@ CONFIG_SND_SOC_TEGRA=m
 CONFIG_SND_SOC_TEGRA210_AHUB=m
 CONFIG_SND_SOC_TEGRA210_DMIC=m
 CONFIG_SND_SOC_TEGRA210_I2S=m
+CONFIG_SND_SOC_TEGRA210_OPE=m
 CONFIG_SND_SOC_TEGRA186_ASRC=m
 CONFIG_SND_SOC_TEGRA186_DSPK=m
 CONFIG_SND_SOC_TEGRA210_ADMAIF=m
-- 
2.7.4

