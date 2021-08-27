Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 57F923F9756
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Aug 2021 11:40:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E620716D7;
	Fri, 27 Aug 2021 11:40:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E620716D7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1630057253;
	bh=a0bQyLhXUgl9kC3iQf+uATVY5s/R39NaJff6/UWVEV0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OtS3hfkznxNrW7OO44AfpiWYNmyPu9kI8lBff/Q80Jx0GgL14ZPzoRQd8S0uGkTln
	 SKKCu1b/itt9Ww0rk1y5kRzeIok/Xx+If5qwj9KimXav6ehU/D/Ogk8PKUrsVibBlx
	 Jcsk2fmwqEL445OMl3fl7BRbP9DDvmes/DA2+nlI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 10D16F804E2;
	Fri, 27 Aug 2021 11:38:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CDE86F804E2; Fri, 27 Aug 2021 11:38:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2088.outbound.protection.outlook.com [40.107.92.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BE1D7F80107
 for <alsa-devel@alsa-project.org>; Fri, 27 Aug 2021 11:38:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BE1D7F80107
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com
 header.b="rL1vj7uz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YuW/trfpKMD5K5h8E+xbpAQ2ILtXTum4d6zmrBJOSvqWG7iGICr6a2fOocKsEQNRrkwAhV3d95/yYQBsZKB2GT/8yPT8QVL9DTcdddDDpeUEH/8s8tit5nyT3ngOj7iRaLgruPtxGtTNONqHMMOPaT5qVbkZHB7lrgxMOYnZumwgJkbE1r19/sdiraO2PXwWJUdyToC22Hrh5Jdc9cp652mIP1lO7/jJ5uZIxoOlGdVttVNijAPql9e4pOJ4xQE1AB+qT6TWc90MiA1th8e9UvWGFro/RMJpAMUC6KIwQPwHfW/86ucwe7J8lZu4Rsq9yEvPLUCnc51sPVAT2WmKWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OrSZKOWs4rdh5mBwsUT+O1TBA0O0LBuknJBdn/YJ/u0=;
 b=QChjLVSTVI+v+cwUpC0AyLoc3cNeIn2EB9cG3m+NugYAVVn7REXdjTZZ1FsOD6zN3RSxmsEUFVPyrWoUOgFvFNRQeVxCt/boj7ebZI2o20unnrXGU/sqTY9y5PbFzMIeofjh82/YBZ+nffOitmAv+y8ivIs7RprXxxYjCyJcTWZhWXMVuQp9gj7T9fUF1CquH41D3jq0257V4zWcUb5dxmnmcjP8VbtTGnjYjDMvyK2KM6jk36Bxu2fPqzwJNCyuWrRzZpc/nInnWFAGac9jqnPG/Dal6WPVUv6GA4spVK4Eumu4AC02pG/N9iZqWpwsL6EqtClm9aB51GfAnkY86g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.35) smtp.rcpttodomain=alsa-project.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com; 
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OrSZKOWs4rdh5mBwsUT+O1TBA0O0LBuknJBdn/YJ/u0=;
 b=rL1vj7uzB5MH3SAKIQMABtM5ghwft8I+9tJHVzrABfPajdhtsjrSyrdCwMTUwZ1fNhnz2qS/WQJGzGrRkMr5Suku4jokMrO4XZY8REnZU+d1bFbQnXMmZVXtK9lABr1si9KG1edf8p0cSY8jSDhZVREQUqIrBrdaGyca6+PK/4atPj1S3f96tK2LCM2qSF0dlUfiv+vSOWyRtnDFPk7gj++AEgM5NcRV3r30OTMJretvPeGMOG/h302Y0gKQwRfy5Zm3dQAiHMSjZckfdZbsC7np7G0tTjDDhbrWnOmq7QwBU9Ct1bhavvAi87ZcSWXCtEQobERKIKo53V5Jz/CZ3w==
Received: from DM6PR06CA0003.namprd06.prod.outlook.com (2603:10b6:5:120::16)
 by BL1PR12MB5062.namprd12.prod.outlook.com (2603:10b6:208:313::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.20; Fri, 27 Aug
 2021 09:38:15 +0000
Received: from DM6NAM11FT029.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:120:cafe::15) by DM6PR06CA0003.outlook.office365.com
 (2603:10b6:5:120::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.18 via Frontend
 Transport; Fri, 27 Aug 2021 09:38:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.35)
 smtp.mailfrom=nvidia.com; alsa-project.org; dkim=none (message not signed)
 header.d=none;alsa-project.org; dmarc=pass action=none
 header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.35 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.35; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.35) by
 DM6NAM11FT029.mail.protection.outlook.com (10.13.173.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4457.17 via Frontend Transport; Fri, 27 Aug 2021 09:38:13 +0000
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 27 Aug
 2021 09:38:12 +0000
Received: from audio.nvidia.com (172.20.187.5) by mail.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 27 Aug 2021 09:38:08 +0000
From: Sameer Pujar <spujar@nvidia.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <robh+dt@kernel.org>,
 <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
 <catalin.marinas@arm.com>, <will@kernel.org>, <perex@perex.cz>,
 <tiwai@suse.com>, <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 02/13] ASoC: simple-card-utils: Increase maximum DAI links
 limit to 512
Date: Fri, 27 Aug 2021 15:03:48 +0530
Message-ID: <1630056839-6562-3-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1630056839-6562-1-git-send-email-spujar@nvidia.com>
References: <1630056839-6562-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9e6c08b2-0c81-4f43-1f7f-08d9693e6402
X-MS-TrafficTypeDiagnostic: BL1PR12MB5062:
X-Microsoft-Antispam-PRVS: <BL1PR12MB50625591FBAD5522BDE31D50A7C89@BL1PR12MB5062.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xJiTrVvMPiCqrKXqrPwl5lk+0wiAzFLgXmHJvqSDmAiLPa9EUi//TcPTGMLE1KuVxn3dhY2gv5NmGzYA34XI8I0pfVDVDpa0qnXCv36APb/u1u0XPd1YBB3nBUhKDlQ/9g8HKZWwhxzIGDJTjYoGPpnr0KUylThyanxHbx7At6vZp1fsy39CHfQwA8nP7B3lMPxRZiIoJ9/ZGDmopxu42SW1XgrbIMl5xjdRwyR1dx2y0FrwgtsS6wqCtMyEQ+qZAYEHA0g8qc8AaPVAGlGPp+4g7KqEJR36xCLU3+L8vs4W7ne79zCBuA+O/VExgBERb19Wn1gCEz7LTlyTsYnxDgfJEg1C7OgsMpSYRLPyn1RF5r1v6mo9Di9MO9s2gdAfHcjhTi/mlp2+LqrXbG4h6lAZw/XnqV6LBu1anAkrVCzAORlItsgJnydiFBUW5PikBO2Hnc7aJTrmKhDszPTyshAAd1bg3wTSacL6Ljetl+oFh+TQYNzsy8WaooUmSpv8F/3xD9HOQJKu2OvEYCXo4bS4UXU/ryXMNU9lvDLoK8AoLSenYC6nsHtxQex3HLKiuYiRHueLXRkzuvRYqPUU6XJjOeS7bAoJZNS70929/8IchAru+adx988lxhUM3gTZQmxruZL+HVgRuT9kbLhCH2DuyBQahWGwRi/vjTI6RTw8ZLrozm3RuzZGMc9LsjnEEhvAiZNDgBwvy9f/iJPdq5iuu7kZIqJeJiDESPKyA9s=
X-Forefront-Antispam-Report: CIP:216.228.112.35; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid04.nvidia.com; CAT:NONE;
 SFS:(4636009)(346002)(376002)(396003)(136003)(39860400002)(36840700001)(46966006)(36860700001)(110136005)(54906003)(107886003)(86362001)(82740400003)(2616005)(4326008)(2906002)(36906005)(921005)(7416002)(316002)(36756003)(426003)(26005)(83380400001)(336012)(478600001)(6666004)(7696005)(5660300002)(8936002)(356005)(186003)(82310400003)(47076005)(8676002)(70206006)(70586007)(7636003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2021 09:38:13.5116 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e6c08b2-0c81-4f43-1f7f-08d9693e6402
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.35];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT029.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5062
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Sameer Pujar <spujar@nvidia.com>, linux-kernel@vger.kernel.org,
 linux-tegra@vger.kernel.org, sharadg@nvidia.com,
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

The current limit of 128 is not sufficient when more components are
added to the audio map on Tegra210 and later platforms. Thus it is
resulting in probe failure.

The requirement is of nearly ~200 DAI links. To give sufficient room
for future additions the maximum limit is increased to 512 DAI links.
This is a preparatory patch to add more components like resampler,
mixer, multiplexers, demultiplexers and volume controllers to Tegra210
and later platforms.

Signed-off-by: Sameer Pujar <spujar@nvidia.com>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/simple_card_utils.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/sound/simple_card_utils.h b/include/sound/simple_card_utils.h
index 51b3b48..6b78034 100644
--- a/include/sound/simple_card_utils.h
+++ b/include/sound/simple_card_utils.h
@@ -115,7 +115,7 @@ struct asoc_simple_priv {
 		     ((codec) = simple_props_to_dai_codec(props, i));	\
 	     (i)++)
 
-#define SNDRV_MAX_LINKS 128
+#define SNDRV_MAX_LINKS 512
 
 struct link_info {
 	int link; /* number of link */
-- 
2.7.4

