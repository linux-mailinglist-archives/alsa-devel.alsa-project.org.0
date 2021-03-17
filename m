Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3476033F9DE
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Mar 2021 21:18:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BA83816BE;
	Wed, 17 Mar 2021 21:17:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BA83816BE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616012316;
	bh=kouDSZzChPRjWHDy+ubNJ0hWKc/Ut2/sMRiNtpAAEe8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SBeA+CMi0QbYrd7hMD33JuPzP2ubzT3wvMzh/AyZSAOOgn69ds78kycqi5Y83w+fJ
	 wHn79vA29vlD6Y5WRleoQtwujDedXiGgHx3ejLhOlUJtH9j3N4SC1j4TJSb1Q+yKQO
	 556kLZJKpSVbDK8TEawp8ZahsuL9U8xHeePQICR8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6F90EF8021C;
	Wed, 17 Mar 2021 21:17:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 15DA4F8021C; Wed, 17 Mar 2021 21:17:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2044.outbound.protection.outlook.com [40.107.237.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9A3AFF80124
 for <alsa-devel@alsa-project.org>; Wed, 17 Mar 2021 21:16:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9A3AFF80124
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="S2Hk3aD4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=odvOusFEz7Sfw+5iuadFc/n8RR03fPOL+WbBHf76ENro7/5hqIN7N/B81k+rEflB29BBbyiOQ5x4Cpqi0RdOrUdv6PpsHXsoio9Zo6xn+GGHoWBd/J0dBy3dF1ejNzBwSQHiQZ/eFqQP23bWuXR7f0v129bp9gjGaTvjbu332s848/rWcBk3wrzvGglzDP7u3tfFMcuhNyp7TEk31X3zxzwHsTRo0PmYmCDPx/aVfkJprRJmblBaztMII3ccgmyoNIzovbCypfZdzfyP7o0s2FBrZ7AzKnlul5arp3WSzoVrt1DlrhO8HtxqKefZTzQRbsbtSQFspB3hFqHbdWGj4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3x41Rb2I6orly7EQDa5DfFOmjXOnn5NIBnDb4DBxO9A=;
 b=fqAeyz5PPXP+5xg21+O4UPhqgM8hYjrKATVWUv4kN2lOfBKZJdaL9/IMfyZQk1p4BlKBCvldjHmF1pbwbVGU07RxZJWNI0SOXt5Gol5JH89/2yv77XqEiOVkqXjpJc9cV4QVSUgmoTLLR8UHhd/DGLhiDuQsFv9HCjm+6JU6a3B9hRzQgXm1X48J7Jampdl2RydEceL+bFFADplZG/ebZObq8dyytMjlmjr7WRnngE7d9A/3iEcJ2lYa6Ad176JyF500jrhjgj6iktkVQdYIOq2wFY0jJbvDuQE1RxjC+KKP04AzLHMflXzSSU70i6ZmJ5jfSyYjWIzO4FQZH1HOTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=amd.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3x41Rb2I6orly7EQDa5DfFOmjXOnn5NIBnDb4DBxO9A=;
 b=S2Hk3aD4yFEbqjUPrA2nKp9WX8+xbVTNGcLmJLbfdAWvWSiH82VftjIvSOEzI29JJCyKYxl0uC6sEswKThMpAxeboc6DMZDoBVibnNmnGpu4XyLV6WSDtpZwu8dgUjnqqjEvpgJaCJXEsS+Av4+4rgo3eQExAmamntcPFTWhjQ8=
Received: from DM5PR07CA0108.namprd07.prod.outlook.com (2603:10b6:4:ae::37) by
 CH2PR12MB3880.namprd12.prod.outlook.com (2603:10b6:610:2b::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3933.32; Wed, 17 Mar 2021 20:16:53 +0000
Received: from DM6NAM11FT052.eop-nam11.prod.protection.outlook.com
 (2603:10b6:4:ae:cafe::f7) by DM5PR07CA0108.outlook.office365.com
 (2603:10b6:4:ae::37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18 via Frontend
 Transport; Wed, 17 Mar 2021 20:16:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB01.amd.com;
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 DM6NAM11FT052.mail.protection.outlook.com (10.13.172.111) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3955.18 via Frontend Transport; Wed, 17 Mar 2021 20:16:53 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Wed, 17 Mar
 2021 15:16:52 -0500
Received: from LinuxHost.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2106.2 via Frontend
 Transport; Wed, 17 Mar 2021 15:16:48 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH v1 2/2] ASoC: amd: fix multiple definition error
Date: Thu, 18 Mar 2021 02:03:47 +0530
Message-ID: <1616013238-12254-2-git-send-email-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1616013238-12254-1-git-send-email-Vijendar.Mukunda@amd.com>
References: <1616013238-12254-1-git-send-email-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a6cae124-3933-4f46-0828-08d8e9819b1c
X-MS-TrafficTypeDiagnostic: CH2PR12MB3880:
X-Microsoft-Antispam-PRVS: <CH2PR12MB38805A1AF5AF8881244452D4976A9@CH2PR12MB3880.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:376;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Kzrbnm81qso/fHXwFcSKWLJ2dz6S0zfviIHSZgyy15JKnmlxdk0nEtGrGdgwD5ZZhOU1f1pcmDIPdod2WjiefelUl7XA+oxeO6TjWA1T/UUbeQn4uWx9MByaH1EMb9NbfEZ23niausID9BDo7Xx9/Jzc4dwGTKEE6/QVQkoUR7fXjoGutTCpo+dZLry7hZs4cGPlEPETCEK+EBmSYU+ZGpR3cVszsGO8LO9Czl9ewwuO7s84hPvfK1FsTZuRjLJSonVq8txMjsFAuyFRjYedZHysQbCtiA3/iOcZbUi1/lcbNfELx2cZcqAhMZFyqLUVnTxHc+X/fFFRDA1OIx3/xa7OiLy9xsM95IwCDZxYaKvvGrp+REpyfsuBTGdl6Ui9Bm0ax3YiMUqBRfyzYSFHCXV2zAYb3fYA/xE6eB0/7uiD6zwfT73NUlgQ6jIKAy4oT4mRqJVpHMOE3O92FNMespn6ZSgu7ec0GHVjyUVyzPmor7bcXUbx7CQBqXS0ZMf55tXUc0n5zoBY/GQys6pPYKGgr1H2ZDtkjhZVfUhux9oLoWIyILkahKNzNgqN5DAlfBm7rH8CSCHdVkcXC/0huSk88T/XZopFXh/0CjNBXtswWEfyZ67P5lP95JBAg+lErfoChNEj7IzX+Up7PemL0k5yYyxJ9WB/EeXTWFwfe3/Bc6G0XhfX2q8OkCLB4C1l
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SATLEXMB01.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(376002)(136003)(346002)(396003)(39860400002)(46966006)(36840700001)(4326008)(82310400003)(2906002)(186003)(47076005)(54906003)(83380400001)(2616005)(82740400003)(110136005)(7696005)(356005)(5660300002)(81166007)(426003)(36756003)(316002)(7416002)(8936002)(336012)(8676002)(36860700001)(26005)(86362001)(478600001)(70206006)(70586007)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2021 20:16:53.4284 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a6cae124-3933-4f46-0828-08d8e9819b1c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT052.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB3880
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Sunil-kumar.Dommati@amd.com,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 open list <linux-kernel@vger.kernel.org>, Basavaraj.Hiregoudar@amd.com,
 Takashi Iwai <tiwai@suse.com>, Chuhong Yuan <hslester96@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Alexander.Deucher@amd.com,
 derek.fang@realtek.com, Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
 shumingf@realtek.com, flove@realtek.com
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

make W=1 ARCH=x86_64 error:
acp3x-rt5682-max9836.c:(.text+0x840): multiple definition of
`soc_is_rltk_max';
sound/soc/amd/acp-da7219-max98357a.o:acp-da7219-max98357a.c:
(.text+0xd00):first defined here

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/acp-da7219-max98357a.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/amd/acp-da7219-max98357a.c b/sound/soc/amd/acp-da7219-max98357a.c
index 7fca4e78..458d9fdca 100644
--- a/sound/soc/amd/acp-da7219-max98357a.c
+++ b/sound/soc/amd/acp-da7219-max98357a.c
@@ -34,7 +34,7 @@ static struct clk *da7219_dai_bclk;
 static struct clk *rt5682_dai_wclk;
 static struct clk *rt5682_dai_bclk;
 extern bool bt_uart_enable;
-void *soc_is_rltk_max(struct device *dev);
+void *acp_soc_is_rltk_max(struct device *dev);
 
 static int cz_da7219_init(struct snd_soc_pcm_runtime *rtd)
 {
@@ -666,7 +666,7 @@ static struct snd_soc_card cz_rt5682_card = {
 	.num_controls = ARRAY_SIZE(cz_mc_controls),
 };
 
-void *soc_is_rltk_max(struct device *dev)
+void *acp_soc_is_rltk_max(struct device *dev)
 {
 	const struct acpi_device_id *match;
 
@@ -715,7 +715,7 @@ static int cz_probe(struct platform_device *pdev)
 	struct regulator_dev *rdev;
 	struct device *dev = &pdev->dev;
 
-	card = (struct snd_soc_card *)soc_is_rltk_max(dev);
+	card = (struct snd_soc_card *)acp_soc_is_rltk_max(dev);
 	if (!card)
 		return -ENODEV;
 	if (!strcmp(card->name, "acpd7219m98357")) {
-- 
2.7.4

