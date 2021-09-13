Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F5BE4099D0
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Sep 2021 18:46:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 074DD17BA;
	Mon, 13 Sep 2021 18:45:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 074DD17BA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631551567;
	bh=fBEkO915CxT2RQaOoNXdZuii996aB26ntuQkKjbqgK4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pW3l5NL/DMbq1Q+oWHRgq4BdnTRqMCQufA9O/QhlJxw0up6lzNpFf+JkhUdD9R4hm
	 /QD0QQpigPkX7EmegjIE/kzm12UpfsFS+WuGmJk+AyTs/yFHJr0o0iDB3oWrA8Rqi4
	 RJD8udEIYNJlgmf34kFmcbg2etmksjp1AlI1iQMw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EC79BF8050F;
	Mon, 13 Sep 2021 18:43:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AA823F80516; Mon, 13 Sep 2021 18:43:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,UPPERCASE_50_75,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2077.outbound.protection.outlook.com [40.107.94.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 30820F80510
 for <alsa-devel@alsa-project.org>; Mon, 13 Sep 2021 18:43:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 30820F80510
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com
 header.b="foJ2tbon"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WEFARtrxQIjMDh5yvCuxZ1Tw3yWzwP1LJrbaOI5LE+SDrX/Yt/Jtbf3wq0dAbOnVcw5Nd+f0X7S09i/iOM5SqYbTfjC3owCK3DeaOicuh9H/PlQywPp783PED9BNusZEEJOWKkVOFR4JLey9qnYD+vUkqSp/yHWllvnByOPMvGoBOoLXp9Zc7xvdEyYrUuek0gcx3e1PypEXCpAbvJJvtQAJ4xE0JPooZ909Q7DhxhbEJX5A/Ue3vzumqVxBDnW6czTsQs3irJjx/78bKNDqcCrkwszdFF18Tohbm6qlfbVbdNJcfhBGpsSM7BK6mN3dq+EJd7JeUFzleXe/TXqcyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=pz13t2lgr0cegkiYwphwb6NAYu/Q/+Y442E7ncMYrww=;
 b=CwO0hpx4vsYwf0T3Sl2Hy7YlFNBMY4m8uF09Uot32fKXJjgd49WAd3Fvz1L7Er5ZWQR/ZgcF8F2mRpOlxoLwK7GdyiwcwtjbQG08cu5P2kJVw5JDjRg4O/YcQ9OEfpLjpU/+HESPO4Ybgq/5sBkmnr+GfBlCzGGT0cUb9M5G81dx1gLwvaZsjMF5f+CLGDoSYRhXyKKXhU2YaWRBqMLDSuPiibtoqk46XUZc1EHtswwfDgva/9/59Ecun/qeSNBRc1L4UNxAMTWP0gO/A7+AgqSkI+ypW8Kc6oOOlJivy+YB+0DmEo1gEYqBIlDvA1xibp+4tYBYdn99k3hdrElsrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=alsa-project.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com; 
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pz13t2lgr0cegkiYwphwb6NAYu/Q/+Y442E7ncMYrww=;
 b=foJ2tbonkZ7dVceybOKi2CJCnATcjr/cWQDCNR9nLpvoWUHjiFYeISpbUxQy9QImi0pFuNzURRywhqdxpF54VsNCYBrWAtXxMKRcbOJV6HbfG92QpMx5MsFeyVz8P8SCREY8QxF0z/U02DK/yKrN6Q+oIXvPR4i4E1itMoJ/cL6ICClcFc5+Q6br6BA/mij0juoBZjCWYE9MUgf9co881JCjT+R8HOtnZ2MGmAROW1yfs52gua9BTsU1IbNn8fsz4tHU6cAhfHVbqlIMoGpyTIWNauU1G+eMXK2MRcdXsIxD6CAmbhMdtTCpUUSm+PZAJ0cCNGCKHQ3P9xSkgn6ifg==
Received: from BN8PR04CA0019.namprd04.prod.outlook.com (2603:10b6:408:70::32)
 by BN7PR12MB2756.namprd12.prod.outlook.com (2603:10b6:408:29::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Mon, 13 Sep
 2021 16:43:06 +0000
Received: from BN8NAM11FT013.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:70:cafe::2d) by BN8PR04CA0019.outlook.office365.com
 (2603:10b6:408:70::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14 via Frontend
 Transport; Mon, 13 Sep 2021 16:43:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; alsa-project.org; dkim=none (message not signed)
 header.d=none;alsa-project.org; dmarc=pass action=none
 header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 BN8NAM11FT013.mail.protection.outlook.com (10.13.176.182) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4500.14 via Frontend Transport; Mon, 13 Sep 2021 16:43:05 +0000
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Mon, 13 Sep
 2021 16:43:04 +0000
Received: from audio.nvidia.com (172.20.187.6) by mail.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server id 15.0.1497.18 via Frontend
 Transport; Mon, 13 Sep 2021 16:43:00 +0000
From: Sameer Pujar <spujar@nvidia.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <robh+dt@kernel.org>,
 <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
 <catalin.marinas@arm.com>, <will@kernel.org>, <perex@perex.cz>,
 <tiwai@suse.com>, <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 05/13] ASoC: tegra: Add routes for few AHUB modules
Date: Mon, 13 Sep 2021 22:12:13 +0530
Message-ID: <1631551342-25469-6-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1631551342-25469-1-git-send-email-spujar@nvidia.com>
References: <1631551342-25469-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 57ea761d-dec9-4ad0-b46d-08d976d58f40
X-MS-TrafficTypeDiagnostic: BN7PR12MB2756:
X-Microsoft-Antispam-PRVS: <BN7PR12MB2756B349FB6FAD57A421E3A4A7D99@BN7PR12MB2756.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8wVK5vNGmKmrPUjjGCwG2436nsVeCz3j4vx2ZkPYviZHby/bFzzKneoSaREh1bkcSCOb9xCodWZruuakq83wpP69/HAxGblKu6Nja1DEvDKDMhVX+PgxRLs1BY2QdfrMe2aCLepTF4gBPINqGcU53RQLU2fkFz+/Qv6AvjL2Wq6lEHXMiUD2/uOCp92opxkH1zHr9QGOp7nkGYGCs/uCAUzRXNuv4PkfhP9dDYEGz5hYxvMNoRuDeFQKP+algLzF57WRQjpu6av7XsroIVGN7OGdE+yuSTxtWqQSNHFyqVzDhaMvD+VGkbTlT3urBVArhCPS/dRvBif42ex7xZk077KxhQWjbwdTOxn4wiD9CadVE0abDVDqw05ALlDWWHD93uQ5XDf13n/5jH+HMkfThyxcLNK6LxoNMA9xShGSppAZHbZ+IL+hFhu4IR1Ep40xswU981MtaeqLoHpgUEuIlBQ/4YlxMi6ikDW0ujZIqaVbsGwlQdhEj8FoDmNazeTLAVBLOsh7LqfD8Mi76A8nU84+R3NVRqKZ0cxEyHAuLn+5W9nQ8tSQb69OOKZKI9CO7pgTjHH1iwiq3ebnRoUFePpIVUO8TMz03y+lSLN4nJuXAD4DSjldVr6/JJeZl6/2z2Ev0eTKqLrPWx4ryxCnRKFVxIuUjXig5yRHW65UmTCoqR+py/m46NsOMJdL2ChgOBE+IQ/lq3c83rBqQufo3+JJebkVrbQRN128BIubyFE=
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(5660300002)(186003)(316002)(47076005)(36906005)(82310400003)(7416002)(30864003)(4326008)(921005)(110136005)(336012)(36860700001)(8936002)(426003)(54906003)(36756003)(7636003)(2906002)(26005)(70586007)(2616005)(508600001)(6666004)(356005)(83380400001)(7696005)(8676002)(107886003)(70206006)(86362001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2021 16:43:05.1470 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 57ea761d-dec9-4ad0-b46d-08d976d58f40
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT013.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR12MB2756
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

Add routing support for following modules of AHUB:
 * SFC (Sampling Frequency Converter)
 * MVC (Master Volume Control)
 * AMX (Audio Multiplexer)
 * ADX (Audio Demultiplexer)
 * Mixer

These modules can be plugged into audio path as per the need using
routing controls similar to the already existing routes to I/O modules
such as I2S, DMIC and DSPK.

Signed-off-by: Sameer Pujar <spujar@nvidia.com>
---
 sound/soc/tegra/tegra210_ahub.c | 511 +++++++++++++++++++++++++++++++++++++++-
 1 file changed, 509 insertions(+), 2 deletions(-)

diff --git a/sound/soc/tegra/tegra210_ahub.c b/sound/soc/tegra/tegra210_ahub.c
index 66287a7..a1989ea 100644
--- a/sound/soc/tegra/tegra210_ahub.c
+++ b/sound/soc/tegra/tegra210_ahub.c
@@ -105,14 +105,68 @@ static struct snd_soc_dai_driver tegra210_ahub_dais[] = {
 	DAI(ADMAIF8),
 	DAI(ADMAIF9),
 	DAI(ADMAIF10),
+	/* XBAR <-> I2S <-> Codec */
 	DAI(I2S1),
 	DAI(I2S2),
 	DAI(I2S3),
 	DAI(I2S4),
 	DAI(I2S5),
+	/* XBAR <- DMIC <- Codec */
 	DAI(DMIC1),
 	DAI(DMIC2),
 	DAI(DMIC3),
+	/* XBAR -> SFC -> XBAR */
+	DAI(SFC1 RX),
+	DAI(SFC1 TX),
+	DAI(SFC2 RX),
+	DAI(SFC2 TX),
+	DAI(SFC3 RX),
+	DAI(SFC3 TX),
+	DAI(SFC4 RX),
+	DAI(SFC4 TX),
+	/* XBAR -> MVC -> XBAR */
+	DAI(MVC1 RX),
+	DAI(MVC1 TX),
+	DAI(MVC2 RX),
+	DAI(MVC2 TX),
+	/* XBAR -> AMX(4:1) -> XBAR */
+	DAI(AMX1 RX1),
+	DAI(AMX1 RX2),
+	DAI(AMX1 RX3),
+	DAI(AMX1 RX4),
+	DAI(AMX1),
+	DAI(AMX2 RX1),
+	DAI(AMX2 RX2),
+	DAI(AMX2 RX3),
+	DAI(AMX2 RX4),
+	DAI(AMX2),
+	/* XBAR -> ADX(1:4) -> XBAR */
+	DAI(ADX1),
+	DAI(ADX1 TX1),
+	DAI(ADX1 TX2),
+	DAI(ADX1 TX3),
+	DAI(ADX1 TX4),
+	DAI(ADX2),
+	DAI(ADX2 TX1),
+	DAI(ADX2 TX2),
+	DAI(ADX2 TX3),
+	DAI(ADX2 TX4),
+	/* XBAR -> MIXER(10:5) -> XBAR */
+	DAI(MIXER1 RX1),
+	DAI(MIXER1 RX2),
+	DAI(MIXER1 RX3),
+	DAI(MIXER1 RX4),
+	DAI(MIXER1 RX5),
+	DAI(MIXER1 RX6),
+	DAI(MIXER1 RX7),
+	DAI(MIXER1 RX8),
+	DAI(MIXER1 RX9),
+	DAI(MIXER1 RX10),
+	DAI(MIXER1 TX1),
+	DAI(MIXER1 TX2),
+	DAI(MIXER1 TX3),
+	DAI(MIXER1 TX4),
+	DAI(MIXER1 TX5),
 };
 
 static struct snd_soc_dai_driver tegra186_ahub_dais[] = {
@@ -136,18 +190,93 @@ static struct snd_soc_dai_driver tegra186_ahub_dais[] = {
 	DAI(ADMAIF18),
 	DAI(ADMAIF19),
 	DAI(ADMAIF20),
+	/* XBAR <-> I2S <-> Codec */
 	DAI(I2S1),
 	DAI(I2S2),
 	DAI(I2S3),
 	DAI(I2S4),
 	DAI(I2S5),
 	DAI(I2S6),
+	/* XBAR <- DMIC <- Codec */
 	DAI(DMIC1),
 	DAI(DMIC2),
 	DAI(DMIC3),
 	DAI(DMIC4),
+	/* XBAR -> DSPK -> Codec */
 	DAI(DSPK1),
 	DAI(DSPK2),
+	/* XBAR -> SFC -> XBAR */
+	DAI(SFC1 RX),
+	DAI(SFC1 TX),
+	DAI(SFC2 RX),
+	DAI(SFC2 TX),
+	DAI(SFC3 RX),
+	DAI(SFC3 TX),
+	DAI(SFC4 RX),
+	DAI(SFC4 TX),
+	/* XBAR -> MVC -> XBAR */
+	DAI(MVC1 RX),
+	DAI(MVC1 TX),
+	DAI(MVC2 RX),
+	DAI(MVC2 TX),
+	/* XBAR -> AMX(4:1) -> XBAR */
+	DAI(AMX1 RX1),
+	DAI(AMX1 RX2),
+	DAI(AMX1 RX3),
+	DAI(AMX1 RX4),
+	DAI(AMX1),
+	DAI(AMX2 RX1),
+	DAI(AMX2 RX2),
+	DAI(AMX2 RX3),
+	DAI(AMX2 RX4),
+	DAI(AMX2),
+	DAI(AMX3 RX1),
+	DAI(AMX3 RX2),
+	DAI(AMX3 RX3),
+	DAI(AMX3 RX4),
+	DAI(AMX3),
+	DAI(AMX4 RX1),
+	DAI(AMX4 RX2),
+	DAI(AMX4 RX3),
+	DAI(AMX4 RX4),
+	DAI(AMX4),
+	/* XBAR -> ADX(1:4) -> XBAR */
+	DAI(ADX1),
+	DAI(ADX1 TX1),
+	DAI(ADX1 TX2),
+	DAI(ADX1 TX3),
+	DAI(ADX1 TX4),
+	DAI(ADX2),
+	DAI(ADX2 TX1),
+	DAI(ADX2 TX2),
+	DAI(ADX2 TX3),
+	DAI(ADX2 TX4),
+	DAI(ADX3),
+	DAI(ADX3 TX1),
+	DAI(ADX3 TX2),
+	DAI(ADX3 TX3),
+	DAI(ADX3 TX4),
+	DAI(ADX4),
+	DAI(ADX4 TX1),
+	DAI(ADX4 TX2),
+	DAI(ADX4 TX3),
+	DAI(ADX4 TX4),
+	/* XBAR -> MIXER1(10:5) -> XBAR */
+	DAI(MIXER1 RX1),
+	DAI(MIXER1 RX2),
+	DAI(MIXER1 RX3),
+	DAI(MIXER1 RX4),
+	DAI(MIXER1 RX5),
+	DAI(MIXER1 RX6),
+	DAI(MIXER1 RX7),
+	DAI(MIXER1 RX8),
+	DAI(MIXER1 RX9),
+	DAI(MIXER1 RX10),
+	DAI(MIXER1 TX1),
+	DAI(MIXER1 TX2),
+	DAI(MIXER1 TX3),
+	DAI(MIXER1 TX4),
+	DAI(MIXER1 TX5),
 };
 
 static const char * const tegra210_ahub_mux_texts[] = {
@@ -170,6 +299,27 @@ static const char * const tegra210_ahub_mux_texts[] = {
 	"DMIC1",
 	"DMIC2",
 	"DMIC3",
+	"SFC1",
+	"SFC2",
+	"SFC3",
+	"SFC4",
+	"MVC1",
+	"MVC2",
+	"AMX1",
+	"AMX2",
+	"ADX1 TX1",
+	"ADX1 TX2",
+	"ADX1 TX3",
+	"ADX1 TX4",
+	"ADX2 TX1",
+	"ADX2 TX2",
+	"ADX2 TX3",
+	"ADX2 TX4",
+	"MIXER1 TX1",
+	"MIXER1 TX2",
+	"MIXER1 TX3",
+	"MIXER1 TX4",
+	"MIXER1 TX5",
 };
 
 static const char * const tegra186_ahub_mux_texts[] = {
@@ -204,10 +354,42 @@ static const char * const tegra186_ahub_mux_texts[] = {
 	"DMIC2",
 	"DMIC3",
 	"DMIC4",
+	"SFC1",
+	"SFC2",
+	"SFC3",
+	"SFC4",
+	"MVC1",
+	"MVC2",
+	"AMX1",
+	"AMX2",
+	"AMX3",
+	"AMX4",
+	"ADX1 TX1",
+	"ADX1 TX2",
+	"ADX1 TX3",
+	"ADX1 TX4",
+	"ADX2 TX1",
+	"ADX2 TX2",
+	"ADX2 TX3",
+	"ADX2 TX4",
+	"ADX3 TX1",
+	"ADX3 TX2",
+	"ADX3 TX3",
+	"ADX3 TX4",
+	"ADX4 TX1",
+	"ADX4 TX2",
+	"ADX4 TX3",
+	"ADX4 TX4",
+	"MIXER1 TX1",
+	"MIXER1 TX2",
+	"MIXER1 TX3",
+	"MIXER1 TX4",
+	"MIXER1 TX5",
 };
 
 static const unsigned int tegra210_ahub_mux_values[] = {
 	0,
+	/* ADMAIF */
 	MUX_VALUE(0, 0),
 	MUX_VALUE(0, 1),
 	MUX_VALUE(0, 2),
@@ -218,18 +400,47 @@ static const unsigned int tegra210_ahub_mux_values[] = {
 	MUX_VALUE(0, 7),
 	MUX_VALUE(0, 8),
 	MUX_VALUE(0, 9),
+	/* I2S */
 	MUX_VALUE(0, 16),
 	MUX_VALUE(0, 17),
 	MUX_VALUE(0, 18),
 	MUX_VALUE(0, 19),
 	MUX_VALUE(0, 20),
+	/* DMIC */
 	MUX_VALUE(2, 18),
 	MUX_VALUE(2, 19),
 	MUX_VALUE(2, 20),
+	/* SFC */
+	MUX_VALUE(0, 24),
+	MUX_VALUE(0, 25),
+	MUX_VALUE(0, 26),
+	MUX_VALUE(0, 27),
+	/* MVC */
+	MUX_VALUE(2, 8),
+	MUX_VALUE(2, 9),
+	/* AMX */
+	MUX_VALUE(1, 8),
+	MUX_VALUE(1, 9),
+	/* ADX */
+	MUX_VALUE(2, 24),
+	MUX_VALUE(2, 25),
+	MUX_VALUE(2, 26),
+	MUX_VALUE(2, 27),
+	MUX_VALUE(2, 28),
+	MUX_VALUE(2, 29),
+	MUX_VALUE(2, 30),
+	MUX_VALUE(2, 31),
+	/* MIXER */
+	MUX_VALUE(1, 0),
+	MUX_VALUE(1, 1),
+	MUX_VALUE(1, 2),
+	MUX_VALUE(1, 3),
+	MUX_VALUE(1, 4),
 };
 
 static const unsigned int tegra186_ahub_mux_values[] = {
 	0,
+	/* ADMAIF */
 	MUX_VALUE(0, 0),
 	MUX_VALUE(0, 1),
 	MUX_VALUE(0, 2),
@@ -246,20 +457,59 @@ static const unsigned int tegra186_ahub_mux_values[] = {
 	MUX_VALUE(0, 13),
 	MUX_VALUE(0, 14),
 	MUX_VALUE(0, 15),
+	/* I2S */
 	MUX_VALUE(0, 16),
 	MUX_VALUE(0, 17),
 	MUX_VALUE(0, 18),
 	MUX_VALUE(0, 19),
 	MUX_VALUE(0, 20),
 	MUX_VALUE(0, 21),
+	/* ADMAIF */
 	MUX_VALUE(3, 16),
 	MUX_VALUE(3, 17),
 	MUX_VALUE(3, 18),
 	MUX_VALUE(3, 19),
+	/* DMIC */
 	MUX_VALUE(2, 18),
 	MUX_VALUE(2, 19),
 	MUX_VALUE(2, 20),
 	MUX_VALUE(2, 21),
+	/* SFC */
+	MUX_VALUE(0, 24),
+	MUX_VALUE(0, 25),
+	MUX_VALUE(0, 26),
+	MUX_VALUE(0, 27),
+	/* MVC */
+	MUX_VALUE(2, 8),
+	MUX_VALUE(2, 9),
+	/* AMX */
+	MUX_VALUE(1, 8),
+	MUX_VALUE(1, 9),
+	MUX_VALUE(1, 10),
+	MUX_VALUE(1, 11),
+	/* ADX */
+	MUX_VALUE(2, 24),
+	MUX_VALUE(2, 25),
+	MUX_VALUE(2, 26),
+	MUX_VALUE(2, 27),
+	MUX_VALUE(2, 28),
+	MUX_VALUE(2, 29),
+	MUX_VALUE(2, 30),
+	MUX_VALUE(2, 31),
+	MUX_VALUE(3, 0),
+	MUX_VALUE(3, 1),
+	MUX_VALUE(3, 2),
+	MUX_VALUE(3, 3),
+	MUX_VALUE(3, 4),
+	MUX_VALUE(3, 5),
+	MUX_VALUE(3, 6),
+	MUX_VALUE(3, 7),
+	/* MIXER */
+	MUX_VALUE(1, 0),
+	MUX_VALUE(1, 1),
+	MUX_VALUE(1, 2),
+	MUX_VALUE(1, 3),
+	MUX_VALUE(1, 4),
 };
 
 /* Controls for t210 */
@@ -278,6 +528,32 @@ MUX_ENUM_CTRL_DECL(t210_i2s2_tx, 0x11);
 MUX_ENUM_CTRL_DECL(t210_i2s3_tx, 0x12);
 MUX_ENUM_CTRL_DECL(t210_i2s4_tx, 0x13);
 MUX_ENUM_CTRL_DECL(t210_i2s5_tx, 0x14);
+MUX_ENUM_CTRL_DECL(t210_sfc1_tx, 0x18);
+MUX_ENUM_CTRL_DECL(t210_sfc2_tx, 0x19);
+MUX_ENUM_CTRL_DECL(t210_sfc3_tx, 0x1a);
+MUX_ENUM_CTRL_DECL(t210_sfc4_tx, 0x1b);
+MUX_ENUM_CTRL_DECL(t210_mvc1_tx, 0x48);
+MUX_ENUM_CTRL_DECL(t210_mvc2_tx, 0x49);
+MUX_ENUM_CTRL_DECL(t210_amx11_tx, 0x50);
+MUX_ENUM_CTRL_DECL(t210_amx12_tx, 0x51);
+MUX_ENUM_CTRL_DECL(t210_amx13_tx, 0x52);
+MUX_ENUM_CTRL_DECL(t210_amx14_tx, 0x53);
+MUX_ENUM_CTRL_DECL(t210_amx21_tx, 0x54);
+MUX_ENUM_CTRL_DECL(t210_amx22_tx, 0x55);
+MUX_ENUM_CTRL_DECL(t210_amx23_tx, 0x56);
+MUX_ENUM_CTRL_DECL(t210_amx24_tx, 0x57);
+MUX_ENUM_CTRL_DECL(t210_adx1_tx, 0x58);
+MUX_ENUM_CTRL_DECL(t210_adx2_tx, 0x59);
+MUX_ENUM_CTRL_DECL(t210_mixer11_tx, 0x20);
+MUX_ENUM_CTRL_DECL(t210_mixer12_tx, 0x21);
+MUX_ENUM_CTRL_DECL(t210_mixer13_tx, 0x22);
+MUX_ENUM_CTRL_DECL(t210_mixer14_tx, 0x23);
+MUX_ENUM_CTRL_DECL(t210_mixer15_tx, 0x24);
+MUX_ENUM_CTRL_DECL(t210_mixer16_tx, 0x25);
+MUX_ENUM_CTRL_DECL(t210_mixer17_tx, 0x26);
+MUX_ENUM_CTRL_DECL(t210_mixer18_tx, 0x27);
+MUX_ENUM_CTRL_DECL(t210_mixer19_tx, 0x28);
+MUX_ENUM_CTRL_DECL(t210_mixer110_tx, 0x29);
 
 /* Controls for t186 */
 MUX_ENUM_CTRL_DECL_186(t186_admaif1_tx, 0x00);
@@ -308,6 +584,42 @@ MUX_ENUM_CTRL_DECL_186(t186_admaif17_tx, 0x68);
 MUX_ENUM_CTRL_DECL_186(t186_admaif18_tx, 0x69);
 MUX_ENUM_CTRL_DECL_186(t186_admaif19_tx, 0x6a);
 MUX_ENUM_CTRL_DECL_186(t186_admaif20_tx, 0x6b);
+MUX_ENUM_CTRL_DECL_186(t186_sfc1_tx, 0x18);
+MUX_ENUM_CTRL_DECL_186(t186_sfc2_tx, 0x19);
+MUX_ENUM_CTRL_DECL_186(t186_sfc3_tx, 0x1a);
+MUX_ENUM_CTRL_DECL_186(t186_sfc4_tx, 0x1b);
+MUX_ENUM_CTRL_DECL_186(t186_mvc1_tx, 0x48);
+MUX_ENUM_CTRL_DECL_186(t186_mvc2_tx, 0x49);
+MUX_ENUM_CTRL_DECL_186(t186_amx11_tx, 0x50);
+MUX_ENUM_CTRL_DECL_186(t186_amx12_tx, 0x51);
+MUX_ENUM_CTRL_DECL_186(t186_amx13_tx, 0x52);
+MUX_ENUM_CTRL_DECL_186(t186_amx14_tx, 0x53);
+MUX_ENUM_CTRL_DECL_186(t186_amx21_tx, 0x54);
+MUX_ENUM_CTRL_DECL_186(t186_amx22_tx, 0x55);
+MUX_ENUM_CTRL_DECL_186(t186_amx23_tx, 0x56);
+MUX_ENUM_CTRL_DECL_186(t186_amx24_tx, 0x57);
+MUX_ENUM_CTRL_DECL_186(t186_amx31_tx, 0x58);
+MUX_ENUM_CTRL_DECL_186(t186_amx32_tx, 0x59);
+MUX_ENUM_CTRL_DECL_186(t186_amx33_tx, 0x5a);
+MUX_ENUM_CTRL_DECL_186(t186_amx34_tx, 0x5b);
+MUX_ENUM_CTRL_DECL_186(t186_amx41_tx, 0x64);
+MUX_ENUM_CTRL_DECL_186(t186_amx42_tx, 0x65);
+MUX_ENUM_CTRL_DECL_186(t186_amx43_tx, 0x66);
+MUX_ENUM_CTRL_DECL_186(t186_amx44_tx, 0x67);
+MUX_ENUM_CTRL_DECL_186(t186_adx1_tx, 0x60);
+MUX_ENUM_CTRL_DECL_186(t186_adx2_tx, 0x61);
+MUX_ENUM_CTRL_DECL_186(t186_adx3_tx, 0x62);
+MUX_ENUM_CTRL_DECL_186(t186_adx4_tx, 0x63);
+MUX_ENUM_CTRL_DECL_186(t186_mixer11_tx, 0x20);
+MUX_ENUM_CTRL_DECL_186(t186_mixer12_tx, 0x21);
+MUX_ENUM_CTRL_DECL_186(t186_mixer13_tx, 0x22);
+MUX_ENUM_CTRL_DECL_186(t186_mixer14_tx, 0x23);
+MUX_ENUM_CTRL_DECL_186(t186_mixer15_tx, 0x24);
+MUX_ENUM_CTRL_DECL_186(t186_mixer16_tx, 0x25);
+MUX_ENUM_CTRL_DECL_186(t186_mixer17_tx, 0x26);
+MUX_ENUM_CTRL_DECL_186(t186_mixer18_tx, 0x27);
+MUX_ENUM_CTRL_DECL_186(t186_mixer19_tx, 0x28);
+MUX_ENUM_CTRL_DECL_186(t186_mixer110_tx, 0x29);
 
 /*
  * The number of entries in, and order of, this array is closely tied to the
@@ -333,6 +645,47 @@ static const struct snd_soc_dapm_widget tegra210_ahub_widgets[] = {
 	TX_WIDGETS("DMIC1"),
 	TX_WIDGETS("DMIC2"),
 	TX_WIDGETS("DMIC3"),
+	WIDGETS("SFC1", t210_sfc1_tx),
+	WIDGETS("SFC2", t210_sfc2_tx),
+	WIDGETS("SFC3", t210_sfc3_tx),
+	WIDGETS("SFC4", t210_sfc4_tx),
+	WIDGETS("MVC1", t210_mvc1_tx),
+	WIDGETS("MVC2", t210_mvc2_tx),
+	WIDGETS("AMX1 RX1", t210_amx11_tx),
+	WIDGETS("AMX1 RX2", t210_amx12_tx),
+	WIDGETS("AMX1 RX3", t210_amx13_tx),
+	WIDGETS("AMX1 RX4", t210_amx14_tx),
+	WIDGETS("AMX2 RX1", t210_amx21_tx),
+	WIDGETS("AMX2 RX2", t210_amx22_tx),
+	WIDGETS("AMX2 RX3", t210_amx23_tx),
+	WIDGETS("AMX2 RX4", t210_amx24_tx),
+	TX_WIDGETS("AMX1"),
+	TX_WIDGETS("AMX2"),
+	WIDGETS("ADX1", t210_adx1_tx),
+	WIDGETS("ADX2", t210_adx2_tx),
+	TX_WIDGETS("ADX1 TX1"),
+	TX_WIDGETS("ADX1 TX2"),
+	TX_WIDGETS("ADX1 TX3"),
+	TX_WIDGETS("ADX1 TX4"),
+	TX_WIDGETS("ADX2 TX1"),
+	TX_WIDGETS("ADX2 TX2"),
+	TX_WIDGETS("ADX2 TX3"),
+	TX_WIDGETS("ADX2 TX4"),
+	WIDGETS("MIXER1 RX1", t210_mixer11_tx),
+	WIDGETS("MIXER1 RX2", t210_mixer12_tx),
+	WIDGETS("MIXER1 RX3", t210_mixer13_tx),
+	WIDGETS("MIXER1 RX4", t210_mixer14_tx),
+	WIDGETS("MIXER1 RX5", t210_mixer15_tx),
+	WIDGETS("MIXER1 RX6", t210_mixer16_tx),
+	WIDGETS("MIXER1 RX7", t210_mixer17_tx),
+	WIDGETS("MIXER1 RX8", t210_mixer18_tx),
+	WIDGETS("MIXER1 RX9", t210_mixer19_tx),
+	WIDGETS("MIXER1 RX10", t210_mixer110_tx),
+	TX_WIDGETS("MIXER1 TX1"),
+	TX_WIDGETS("MIXER1 TX2"),
+	TX_WIDGETS("MIXER1 TX3"),
+	TX_WIDGETS("MIXER1 TX4"),
+	TX_WIDGETS("MIXER1 TX5"),
 };
 
 static const struct snd_soc_dapm_widget tegra186_ahub_widgets[] = {
@@ -368,6 +721,67 @@ static const struct snd_soc_dapm_widget tegra186_ahub_widgets[] = {
 	TX_WIDGETS("DMIC4"),
 	WIDGETS("DSPK1", t186_dspk1_tx),
 	WIDGETS("DSPK2", t186_dspk2_tx),
+	WIDGETS("SFC1", t186_sfc1_tx),
+	WIDGETS("SFC2", t186_sfc2_tx),
+	WIDGETS("SFC3", t186_sfc3_tx),
+	WIDGETS("SFC4", t186_sfc4_tx),
+	WIDGETS("MVC1", t186_mvc1_tx),
+	WIDGETS("MVC2", t186_mvc2_tx),
+	WIDGETS("AMX1 RX1", t186_amx11_tx),
+	WIDGETS("AMX1 RX2", t186_amx12_tx),
+	WIDGETS("AMX1 RX3", t186_amx13_tx),
+	WIDGETS("AMX1 RX4", t186_amx14_tx),
+	WIDGETS("AMX2 RX1", t186_amx21_tx),
+	WIDGETS("AMX2 RX2", t186_amx22_tx),
+	WIDGETS("AMX2 RX3", t186_amx23_tx),
+	WIDGETS("AMX2 RX4", t186_amx24_tx),
+	WIDGETS("AMX3 RX1", t186_amx31_tx),
+	WIDGETS("AMX3 RX2", t186_amx32_tx),
+	WIDGETS("AMX3 RX3", t186_amx33_tx),
+	WIDGETS("AMX3 RX4", t186_amx34_tx),
+	WIDGETS("AMX4 RX1", t186_amx41_tx),
+	WIDGETS("AMX4 RX2", t186_amx42_tx),
+	WIDGETS("AMX4 RX3", t186_amx43_tx),
+	WIDGETS("AMX4 RX4", t186_amx44_tx),
+	TX_WIDGETS("AMX1"),
+	TX_WIDGETS("AMX2"),
+	TX_WIDGETS("AMX3"),
+	TX_WIDGETS("AMX4"),
+	WIDGETS("ADX1", t186_adx1_tx),
+	WIDGETS("ADX2", t186_adx2_tx),
+	WIDGETS("ADX3", t186_adx3_tx),
+	WIDGETS("ADX4", t186_adx4_tx),
+	TX_WIDGETS("ADX1 TX1"),
+	TX_WIDGETS("ADX1 TX2"),
+	TX_WIDGETS("ADX1 TX3"),
+	TX_WIDGETS("ADX1 TX4"),
+	TX_WIDGETS("ADX2 TX1"),
+	TX_WIDGETS("ADX2 TX2"),
+	TX_WIDGETS("ADX2 TX3"),
+	TX_WIDGETS("ADX2 TX4"),
+	TX_WIDGETS("ADX3 TX1"),
+	TX_WIDGETS("ADX3 TX2"),
+	TX_WIDGETS("ADX3 TX3"),
+	TX_WIDGETS("ADX3 TX4"),
+	TX_WIDGETS("ADX4 TX1"),
+	TX_WIDGETS("ADX4 TX2"),
+	TX_WIDGETS("ADX4 TX3"),
+	TX_WIDGETS("ADX4 TX4"),
+	WIDGETS("MIXER1 RX1", t186_mixer11_tx),
+	WIDGETS("MIXER1 RX2", t186_mixer12_tx),
+	WIDGETS("MIXER1 RX3", t186_mixer13_tx),
+	WIDGETS("MIXER1 RX4", t186_mixer14_tx),
+	WIDGETS("MIXER1 RX5", t186_mixer15_tx),
+	WIDGETS("MIXER1 RX6", t186_mixer16_tx),
+	WIDGETS("MIXER1 RX7", t186_mixer17_tx),
+	WIDGETS("MIXER1 RX8", t186_mixer18_tx),
+	WIDGETS("MIXER1 RX9", t186_mixer19_tx),
+	WIDGETS("MIXER1 RX10", t186_mixer110_tx),
+	TX_WIDGETS("MIXER1 TX1"),
+	TX_WIDGETS("MIXER1 TX2"),
+	TX_WIDGETS("MIXER1 TX3"),
+	TX_WIDGETS("MIXER1 TX4"),
+	TX_WIDGETS("MIXER1 TX5"),
 };
 
 #define TEGRA_COMMON_MUX_ROUTES(name)					\
@@ -389,7 +803,28 @@ static const struct snd_soc_dapm_widget tegra186_ahub_widgets[] = {
 	{ name " Mux",		"I2S5",		"I2S5 XBAR-RX" },	\
 	{ name " Mux",		"DMIC1",	"DMIC1 XBAR-RX" },	\
 	{ name " Mux",		"DMIC2",	"DMIC2 XBAR-RX" },	\
-	{ name " Mux",		"DMIC3",	"DMIC3 XBAR-RX" },
+	{ name " Mux",		"DMIC3",	"DMIC3 XBAR-RX" },	\
+	{ name " Mux",		"SFC1",		"SFC1 XBAR-RX" },	\
+	{ name " Mux",		"SFC2",		"SFC2 XBAR-RX" },	\
+	{ name " Mux",		"SFC3",		"SFC3 XBAR-RX" },	\
+	{ name " Mux",		"SFC4",		"SFC4 XBAR-RX" },	\
+	{ name " Mux",		"MVC1",		"MVC1 XBAR-RX" },	\
+	{ name " Mux",		"MVC2",		"MVC2 XBAR-RX" },	\
+	{ name " Mux",		"AMX1",		"AMX1 XBAR-RX" },	\
+	{ name " Mux",		"AMX2",		"AMX2 XBAR-RX" },	\
+	{ name " Mux",		"ADX1 TX1",	"ADX1 TX1 XBAR-RX" },	\
+	{ name " Mux",		"ADX1 TX2",	"ADX1 TX2 XBAR-RX" },	\
+	{ name " Mux",		"ADX1 TX3",	"ADX1 TX3 XBAR-RX" },	\
+	{ name " Mux",		"ADX1 TX4",	"ADX1 TX4 XBAR-RX" },	\
+	{ name " Mux",		"ADX2 TX1",	"ADX2 TX1 XBAR-RX" },	\
+	{ name " Mux",		"ADX2 TX2",	"ADX2 TX2 XBAR-RX" },	\
+	{ name " Mux",		"ADX2 TX3",	"ADX2 TX3 XBAR-RX" },	\
+	{ name " Mux",		"ADX2 TX4",	"ADX2 TX4 XBAR-RX" },	\
+	{ name " Mux",		"MIXER1 TX1",	"MIXER1 TX1 XBAR-RX" },	\
+	{ name " Mux",		"MIXER1 TX2",	"MIXER1 TX2 XBAR-RX" },	\
+	{ name " Mux",		"MIXER1 TX3",	"MIXER1 TX3 XBAR-RX" },	\
+	{ name " Mux",		"MIXER1 TX4",	"MIXER1 TX4 XBAR-RX" },	\
+	{ name " Mux",		"MIXER1 TX5",	"MIXER1 TX5 XBAR-RX" },
 
 #define TEGRA186_ONLY_MUX_ROUTES(name)					\
 	{ name " Mux",		"ADMAIF11",	"ADMAIF11 XBAR-RX" },	\
@@ -403,7 +838,17 @@ static const struct snd_soc_dapm_widget tegra186_ahub_widgets[] = {
 	{ name " Mux",		"ADMAIF19",	"ADMAIF19 XBAR-RX" },	\
 	{ name " Mux",		"ADMAIF20",	"ADMAIF20 XBAR-RX" },	\
 	{ name " Mux",		"I2S6",		"I2S6 XBAR-RX" },	\
-	{ name " Mux",		"DMIC4",	"DMIC4 XBAR-RX" },
+	{ name " Mux",		"DMIC4",	"DMIC4 XBAR-RX" },	\
+	{ name " Mux",		"AMX3",		"AMX3 XBAR-RX" },	\
+	{ name " Mux",		"AMX4",		"AMX4 XBAR-RX" },	\
+	{ name " Mux",		"ADX3 TX1",	"ADX3 TX1 XBAR-RX" },	\
+	{ name " Mux",		"ADX3 TX2",	"ADX3 TX2 XBAR-RX" },	\
+	{ name " Mux",		"ADX3 TX3",	"ADX3 TX3 XBAR-RX" },	\
+	{ name " Mux",		"ADX3 TX4",	"ADX3 TX4 XBAR-RX" },	\
+	{ name " Mux",		"ADX4 TX1",	"ADX4 TX1 XBAR-RX" },	\
+	{ name " Mux",		"ADX4 TX2",	"ADX4 TX2 XBAR-RX" },	\
+	{ name " Mux",		"ADX4 TX3",	"ADX4 TX3 XBAR-RX" },	\
+	{ name " Mux",		"ADX4 TX4",	"ADX4 TX4 XBAR-RX" },
 
 #define TEGRA210_MUX_ROUTES(name)						\
 	TEGRA_COMMON_MUX_ROUTES(name)
@@ -450,6 +895,32 @@ static const struct snd_soc_dapm_route tegra210_ahub_routes[] = {
 	TEGRA210_MUX_ROUTES("I2S3")
 	TEGRA210_MUX_ROUTES("I2S4")
 	TEGRA210_MUX_ROUTES("I2S5")
+	TEGRA210_MUX_ROUTES("SFC1")
+	TEGRA210_MUX_ROUTES("SFC2")
+	TEGRA210_MUX_ROUTES("SFC3")
+	TEGRA210_MUX_ROUTES("SFC4")
+	TEGRA210_MUX_ROUTES("MVC1")
+	TEGRA210_MUX_ROUTES("MVC2")
+	TEGRA210_MUX_ROUTES("AMX1 RX1")
+	TEGRA210_MUX_ROUTES("AMX1 RX2")
+	TEGRA210_MUX_ROUTES("AMX1 RX3")
+	TEGRA210_MUX_ROUTES("AMX1 RX4")
+	TEGRA210_MUX_ROUTES("AMX2 RX1")
+	TEGRA210_MUX_ROUTES("AMX2 RX2")
+	TEGRA210_MUX_ROUTES("AMX2 RX3")
+	TEGRA210_MUX_ROUTES("AMX2 RX4")
+	TEGRA210_MUX_ROUTES("ADX1")
+	TEGRA210_MUX_ROUTES("ADX2")
+	TEGRA210_MUX_ROUTES("MIXER1 RX1")
+	TEGRA210_MUX_ROUTES("MIXER1 RX2")
+	TEGRA210_MUX_ROUTES("MIXER1 RX3")
+	TEGRA210_MUX_ROUTES("MIXER1 RX4")
+	TEGRA210_MUX_ROUTES("MIXER1 RX5")
+	TEGRA210_MUX_ROUTES("MIXER1 RX6")
+	TEGRA210_MUX_ROUTES("MIXER1 RX7")
+	TEGRA210_MUX_ROUTES("MIXER1 RX8")
+	TEGRA210_MUX_ROUTES("MIXER1 RX9")
+	TEGRA210_MUX_ROUTES("MIXER1 RX10")
 };
 
 static const struct snd_soc_dapm_route tegra186_ahub_routes[] = {
@@ -501,6 +972,42 @@ static const struct snd_soc_dapm_route tegra186_ahub_routes[] = {
 	TEGRA186_MUX_ROUTES("I2S6")
 	TEGRA186_MUX_ROUTES("DSPK1")
 	TEGRA186_MUX_ROUTES("DSPK2")
+	TEGRA186_MUX_ROUTES("SFC1")
+	TEGRA186_MUX_ROUTES("SFC2")
+	TEGRA186_MUX_ROUTES("SFC3")
+	TEGRA186_MUX_ROUTES("SFC4")
+	TEGRA186_MUX_ROUTES("MVC1")
+	TEGRA186_MUX_ROUTES("MVC2")
+	TEGRA186_MUX_ROUTES("AMX1 RX1")
+	TEGRA186_MUX_ROUTES("AMX1 RX2")
+	TEGRA186_MUX_ROUTES("AMX1 RX3")
+	TEGRA186_MUX_ROUTES("AMX1 RX4")
+	TEGRA186_MUX_ROUTES("AMX2 RX1")
+	TEGRA186_MUX_ROUTES("AMX2 RX2")
+	TEGRA186_MUX_ROUTES("AMX2 RX3")
+	TEGRA186_MUX_ROUTES("AMX2 RX4")
+	TEGRA186_MUX_ROUTES("AMX3 RX1")
+	TEGRA186_MUX_ROUTES("AMX3 RX2")
+	TEGRA186_MUX_ROUTES("AMX3 RX3")
+	TEGRA186_MUX_ROUTES("AMX3 RX4")
+	TEGRA186_MUX_ROUTES("AMX4 RX1")
+	TEGRA186_MUX_ROUTES("AMX4 RX2")
+	TEGRA186_MUX_ROUTES("AMX4 RX3")
+	TEGRA186_MUX_ROUTES("AMX4 RX4")
+	TEGRA186_MUX_ROUTES("ADX1")
+	TEGRA186_MUX_ROUTES("ADX2")
+	TEGRA186_MUX_ROUTES("ADX3")
+	TEGRA186_MUX_ROUTES("ADX4")
+	TEGRA186_MUX_ROUTES("MIXER1 RX1")
+	TEGRA186_MUX_ROUTES("MIXER1 RX2")
+	TEGRA186_MUX_ROUTES("MIXER1 RX3")
+	TEGRA186_MUX_ROUTES("MIXER1 RX4")
+	TEGRA186_MUX_ROUTES("MIXER1 RX5")
+	TEGRA186_MUX_ROUTES("MIXER1 RX6")
+	TEGRA186_MUX_ROUTES("MIXER1 RX7")
+	TEGRA186_MUX_ROUTES("MIXER1 RX8")
+	TEGRA186_MUX_ROUTES("MIXER1 RX9")
+	TEGRA186_MUX_ROUTES("MIXER1 RX10")
 };
 
 static const struct snd_soc_component_driver tegra210_ahub_component = {
-- 
2.7.4

