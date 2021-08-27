Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BAB73F9758
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Aug 2021 11:41:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EEE9B16DF;
	Fri, 27 Aug 2021 11:40:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EEE9B16DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1630057282;
	bh=xh3PpNmfJA5mHjjTHzHBux9531jBW3iQjLFz1BkQsTM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DIrDfE2hdteertOc42VN9IntLcegI467HR/b5zbdy8iP6IGp/XIm1pLhBWsmAe7oc
	 8me+jFG6RK5RiCRqTYNFHjSof411f5uFxVMXKmVKWcLe5XQNclOPLZzZ6C6WQ4Urki
	 5+r1YQsYGjcslPywYMtuO1zYZfe7TCzX9ZWOtBvc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3B8ABF804FF;
	Fri, 27 Aug 2021 11:38:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7C36CF804FA; Fri, 27 Aug 2021 11:38:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,UPPERCASE_50_75,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20617.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e88::617])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 71A5AF804F3
 for <alsa-devel@alsa-project.org>; Fri, 27 Aug 2021 11:38:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 71A5AF804F3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com
 header.b="LV9L7AV1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RaSzJXNHnsWhVa2SjxMQDBnr9dBv8mNipIRgj05VHlibwxDlNrL6px/vuHBYhlSD71XWWui8YoSI7dMavNvHoESNNyjI7jSAvQx22TSUO8LuhCTkz2aI7SaFPEXQ9JZpFwud2dslBt9M2ngd4notkMyw5iI0Qqd9Yk+RTSgW1ODb2+GqpP5+bWp4+nRJ8o8DHrbMCFnMbCmerjzH/vW0vd3+cA0gQerPrmbnjEK6mAJeiTk44h6j24Z5nv1OlCFthAHxpaHaHu+x1H1RK13Oy0cdk91NRkdxo0N3QtNJtfGnzMiZEdl8jM9MjnXWXfOAazIGvfoIY3i9ozlPZ5AifA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WCZ49zKrwezlXIuBq8zSrYOUlsqhZ/g5FKfjWaG6wdE=;
 b=Ps3/whdyI4MoOX2wVyXxN3JE9c2fknr7kZxhLW6d/ThmqeqMC5NBhCkoy+8Ydk9gzOnclcmRauDPanXkxdsPg9hDSV6ERXIhPskbazvaYlIUjjWQtJGfPDv8PqXqn0oWymk8wwlVeMiIBCA923N1z6bISiyLBrNS1HLwNmYnXu6IaIYEOeyAmVAok+QXs+I5M04ccYuYyK7hQCISFL4eZIrAKznRKi8V9mO8Ony5QWy+bvY6rjlvts2Tb+DWP3zQTqpioj1HLUaWdvgfT8IXkl9cL8Lq0fM4BBW833bnrLytoRxY84IdCOh7yi1DFMoPDVJeCapgLMHorq1GIBLf1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.36) smtp.rcpttodomain=alsa-project.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com; 
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WCZ49zKrwezlXIuBq8zSrYOUlsqhZ/g5FKfjWaG6wdE=;
 b=LV9L7AV1XpncTkWMWYs+9mcpkob/vMR+ZLeOF7TyntchFzLDyTg80+GXY2Z8YGrp/7ASpuNsMYqnsoLYmLnJdwuRc90R7O/txxKP3+4rda5e+J0ciFBJF/B8YQGEjppDOJ4Z7OINvsUvAVVx74fz+2pk93V10LqZtKZyM+kTC7RyQ+fjIvBYnJdtVN6uN4HQGj0may0g8pYBUWqX7bUCjhKglmdhd7HfR9neI0mcpMaIBuVWDGR5O9aa6JnIjJvfETMCnzI0FCh55mYKExigauZTIgMxox/2KQ23xsFa5/9pQzBbECmk2we3Iny8s8uJAi/qmvNazQxIQDQ3pttxTw==
Received: from DM5PR19CA0002.namprd19.prod.outlook.com (2603:10b6:3:151::12)
 by BYAPR12MB3509.namprd12.prod.outlook.com (2603:10b6:a03:13b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.22; Fri, 27 Aug
 2021 09:38:26 +0000
Received: from DM6NAM11FT031.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:151:cafe::fc) by DM5PR19CA0002.outlook.office365.com
 (2603:10b6:3:151::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.20 via Frontend
 Transport; Fri, 27 Aug 2021 09:38:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.36)
 smtp.mailfrom=nvidia.com; alsa-project.org; dkim=none (message not signed)
 header.d=none;alsa-project.org; dmarc=pass action=none
 header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.36 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.36; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.36) by
 DM6NAM11FT031.mail.protection.outlook.com (10.13.172.203) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4457.17 via Frontend Transport; Fri, 27 Aug 2021 09:38:26 +0000
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 27 Aug
 2021 09:38:25 +0000
Received: from audio.nvidia.com (172.20.187.5) by mail.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 27 Aug 2021 09:38:21 +0000
From: Sameer Pujar <spujar@nvidia.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <robh+dt@kernel.org>,
 <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
 <catalin.marinas@arm.com>, <will@kernel.org>, <perex@perex.cz>,
 <tiwai@suse.com>, <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 05/13] ASoC: tegra: Add routes for few AHUB modules
Date: Fri, 27 Aug 2021 15:03:51 +0530
Message-ID: <1630056839-6562-6-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1630056839-6562-1-git-send-email-spujar@nvidia.com>
References: <1630056839-6562-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0e609d01-5959-4ace-dc8e-08d9693e6b97
X-MS-TrafficTypeDiagnostic: BYAPR12MB3509:
X-Microsoft-Antispam-PRVS: <BYAPR12MB3509AAC0219199DF2B17B3E4A7C89@BYAPR12MB3509.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QJcij3uAJk+PevaCCjF+1z8WU/IUyo4IrEiQIo5GUFAOjEk6Byj+bJj75NyF1dElO5WG5JuBw97fCh01vhT0+vM6I0Q9Q9Ui/1c+YNf/Ak5eUdAUGF4NM9paFqiUm7nQTAvK5rRyG57HMtIeMaDPvTNIENoasd2oQUtTTXWukQYanTYx+EE5nNBXCsxVpPtJgewZrwbNQegSSdNYBiKfdhqVVHR+KiIw6w37+dUUzavkjxPR0CEThGbLQ7r/e2ecOKXXAqFQZQuhNWxSiVOlhcL1s5cUtEfqCdKuNhWwLnd0s/ycXwZinu/1zB7XKkFFzu6MQUUOqANgfRrDU5GJ+OX54BuesqK585HoYAyw1ccCvdimUjAWxHI/IBjpkA2bskKwP/SrfaFTZ7EPD9sMjaE/DL8lcIES7LfxS0cx3yTo2T0Tbv9Dqwohc0wSCo1tOO4MO/13tOq9GntQ50/ytqGYj/cMKCsfjviY/LuvxZZcj+XfOhnG20UlG8hYWyVS8rFAbp6OEK9DNepV0DwZ5GNUeX1oOxQrA2Bb182R/I4wdzG4lgWbqd1MK3pB5WvC6AP4kBaWpzphzAOChOapoznACcfB/Tpc57CCpKnXaZhdQO4XhNwM4gMda4xmbayd45En5xlsfhI6hx8rZapXop3OvxCcisbgzeTFMbO2LHVdJlqEbfIMEPplBwUn0tmNGOD+7+kjuszRE6hibzx0R6lTiJJcdCkjhJuxbPmlf3Y=
X-Forefront-Antispam-Report: CIP:216.228.112.36; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid05.nvidia.com; CAT:NONE;
 SFS:(4636009)(346002)(376002)(396003)(39860400002)(136003)(36840700001)(46966006)(70206006)(7636003)(316002)(7696005)(107886003)(82310400003)(54906003)(921005)(36906005)(70586007)(2906002)(2616005)(110136005)(86362001)(30864003)(8676002)(5660300002)(8936002)(7416002)(356005)(478600001)(336012)(36860700001)(47076005)(83380400001)(82740400003)(26005)(36756003)(186003)(426003)(4326008)(6666004);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2021 09:38:26.2409 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e609d01-5959-4ace-dc8e-08d9693e6b97
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.36];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT031.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3509
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
index 66287a7..44a1ee0 100644
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
+	DAI(MIXER RX1),
+	DAI(MIXER RX2),
+	DAI(MIXER RX3),
+	DAI(MIXER RX4),
+	DAI(MIXER RX5),
+	DAI(MIXER RX6),
+	DAI(MIXER RX7),
+	DAI(MIXER RX8),
+	DAI(MIXER RX9),
+	DAI(MIXER RX10),
+	DAI(MIXER TX1),
+	DAI(MIXER TX2),
+	DAI(MIXER TX3),
+	DAI(MIXER TX4),
+	DAI(MIXER TX5),
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
+	/* XBAR -> MIXER(10:5) -> XBAR */
+	DAI(MIXER RX1),
+	DAI(MIXER RX2),
+	DAI(MIXER RX3),
+	DAI(MIXER RX4),
+	DAI(MIXER RX5),
+	DAI(MIXER RX6),
+	DAI(MIXER RX7),
+	DAI(MIXER RX8),
+	DAI(MIXER RX9),
+	DAI(MIXER RX10),
+	DAI(MIXER TX1),
+	DAI(MIXER TX2),
+	DAI(MIXER TX3),
+	DAI(MIXER TX4),
+	DAI(MIXER TX5),
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
+	"MIXER TX1",
+	"MIXER TX2",
+	"MIXER TX3",
+	"MIXER TX4",
+	"MIXER TX5",
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
+	"MIXER TX1",
+	"MIXER TX2",
+	"MIXER TX3",
+	"MIXER TX4",
+	"MIXER TX5",
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
+	WIDGETS("MIXER RX1", t210_mixer11_tx),
+	WIDGETS("MIXER RX2", t210_mixer12_tx),
+	WIDGETS("MIXER RX3", t210_mixer13_tx),
+	WIDGETS("MIXER RX4", t210_mixer14_tx),
+	WIDGETS("MIXER RX5", t210_mixer15_tx),
+	WIDGETS("MIXER RX6", t210_mixer16_tx),
+	WIDGETS("MIXER RX7", t210_mixer17_tx),
+	WIDGETS("MIXER RX8", t210_mixer18_tx),
+	WIDGETS("MIXER RX9", t210_mixer19_tx),
+	WIDGETS("MIXER RX10", t210_mixer110_tx),
+	TX_WIDGETS("MIXER TX1"),
+	TX_WIDGETS("MIXER TX2"),
+	TX_WIDGETS("MIXER TX3"),
+	TX_WIDGETS("MIXER TX4"),
+	TX_WIDGETS("MIXER TX5"),
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
+	WIDGETS("MIXER RX1", t186_mixer11_tx),
+	WIDGETS("MIXER RX2", t186_mixer12_tx),
+	WIDGETS("MIXER RX3", t186_mixer13_tx),
+	WIDGETS("MIXER RX4", t186_mixer14_tx),
+	WIDGETS("MIXER RX5", t186_mixer15_tx),
+	WIDGETS("MIXER RX6", t186_mixer16_tx),
+	WIDGETS("MIXER RX7", t186_mixer17_tx),
+	WIDGETS("MIXER RX8", t186_mixer18_tx),
+	WIDGETS("MIXER RX9", t186_mixer19_tx),
+	WIDGETS("MIXER RX10", t186_mixer110_tx),
+	TX_WIDGETS("MIXER TX1"),
+	TX_WIDGETS("MIXER TX2"),
+	TX_WIDGETS("MIXER TX3"),
+	TX_WIDGETS("MIXER TX4"),
+	TX_WIDGETS("MIXER TX5"),
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
+	{ name " Mux",		"MIXER TX1",	"MIXER TX1 XBAR-RX" },	\
+	{ name " Mux",		"MIXER TX2",	"MIXER TX2 XBAR-RX" },	\
+	{ name " Mux",		"MIXER TX3",	"MIXER TX3 XBAR-RX" },	\
+	{ name " Mux",		"MIXER TX4",	"MIXER TX4 XBAR-RX" },	\
+	{ name " Mux",		"MIXER TX5",	"MIXER TX5 XBAR-RX" },
 
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
+	TEGRA210_MUX_ROUTES("MIXER RX1")
+	TEGRA210_MUX_ROUTES("MIXER RX2")
+	TEGRA210_MUX_ROUTES("MIXER RX3")
+	TEGRA210_MUX_ROUTES("MIXER RX4")
+	TEGRA210_MUX_ROUTES("MIXER RX5")
+	TEGRA210_MUX_ROUTES("MIXER RX6")
+	TEGRA210_MUX_ROUTES("MIXER RX7")
+	TEGRA210_MUX_ROUTES("MIXER RX8")
+	TEGRA210_MUX_ROUTES("MIXER RX9")
+	TEGRA210_MUX_ROUTES("MIXER RX10")
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
+	TEGRA186_MUX_ROUTES("MIXER RX1")
+	TEGRA186_MUX_ROUTES("MIXER RX2")
+	TEGRA186_MUX_ROUTES("MIXER RX3")
+	TEGRA186_MUX_ROUTES("MIXER RX4")
+	TEGRA186_MUX_ROUTES("MIXER RX5")
+	TEGRA186_MUX_ROUTES("MIXER RX6")
+	TEGRA186_MUX_ROUTES("MIXER RX7")
+	TEGRA186_MUX_ROUTES("MIXER RX8")
+	TEGRA186_MUX_ROUTES("MIXER RX9")
+	TEGRA186_MUX_ROUTES("MIXER RX10")
 };
 
 static const struct snd_soc_component_driver tegra210_ahub_component = {
-- 
2.7.4

