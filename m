Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 12160455557
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Nov 2021 08:14:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A567E18F9;
	Thu, 18 Nov 2021 08:13:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A567E18F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637219685;
	bh=E6AhRpqQbQd65CYE2LXCq5rhy4XbPfDm/ZibikuaNGU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=B4T9uq+f53tmC1Aj93LLvTNZpxL2L/FuVeCjaz3c3iO8spEZCQX27ElVy/yC0KKVP
	 jKvt4bmnJv2gZiZzPFkYn7eV3AsPTjLQimXs852Ahor79eq/sU6avW8R9v9rcfcRpX
	 ANN55uK6/hYzi/ENKBSFbTQcP/FkZt5QbGnbYAC0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 60EB3F8050F;
	Thu, 18 Nov 2021 08:10:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4E958F8010B; Thu, 18 Nov 2021 08:09:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.6 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
 FORGED_SPF_HELO,KHOP_HELO_FCRDNS,SPF_HELO_PASS,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2070.outbound.protection.outlook.com [40.107.244.70])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 28366F804EC
 for <alsa-devel@alsa-project.org>; Thu, 18 Nov 2021 08:07:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 28366F804EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com
 header.b="MmidvVk2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AQMGw3vgKGErqf91glFTEEftoXQY9rTBOA6Sw9R8/YuEAaLGf2uoU7uKetATuNdmcFE8Inhow+AGwjMdVKqMwsCptK0HdrCNfiMmQVHNlxa35oJX1EnWCtFRw6rrx+DaVuf1iec8newC2d1YTyvi9MffHnfXCnQn2ENph1iYTIuYLKNA6WZwIWl4gzBQTdOaosJszyzOtCS6t7KzTIau+wB4H4t9hDzE52qsNS5AS1yGFqFzwGw238Kvz+HvPWG2DjTagbgQM43jyS4fstg1W8R//INuMBQgecVSTAgnppTp5phqxxmLa2Jfnf+fjkD9d4WIPADkSVjZ/73uudARLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NysmW/bYkHMp5jSpr73mAkiNXPnkdpZRKkpN5nWiwI4=;
 b=cWoJlnk5gkkpG9VLrExeDNaqo7mxAsHNPLwGS3CCxu4bTWeO/lv9gpcBmYkLIUSmveqdSA5lvvs7JxfQZpuJuBk5qQwid1H7cwdZEuM61x7o/H++88fiYybaTTTymnCqByc25s1LzUUGaLgzkwe2ivlhzeS0R7TVwwno+JXM10U5h8KrHTJRIig/Ad8wHjWqV660muaMZT4url9xl4nUzE3vdw5c0/WZXGDm1mvYWrY2M0EWRH7+oAorminF/dV5oeESjN+phNXWBG7Jb60k5eCJe9YCY05v0EkGMEoEDbj5GApp0JcpQtB899+bEY+g+EH1IZfu6U2W6qDM7YdN6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=alsa-project.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NysmW/bYkHMp5jSpr73mAkiNXPnkdpZRKkpN5nWiwI4=;
 b=MmidvVk2YI+w/n2CI3FaKd0wQmPzIeDs5BlaxbgEYdtrDxXiaX50sRV5voixot4W5awqAwP0L6d9Eor2d5oHRpN6sC7/PIdXSm05t8afEAUFJVZA2NgCAAGtATu4dpjAr1SnY44y+cXUdPzxeIb0J34bghe9ltQcEIrgrhnZ0C/NsPhD/Z7DwnDy1OrnRlNfS762vFuTgvCdyfYHz6MiIQRNnBxblXKbH03/D5258Y3t6Qb4H0/6fNpVLPFLhXiynPYyg8n1Dy2DPlZQwLWizIZXZb0qChMJBdbbsYNb37Lp24yEvERmGYEFoofIT8PSoz5P346O8N++peQd95JZbg==
Received: from MW2PR2101CA0016.namprd21.prod.outlook.com (2603:10b6:302:1::29)
 by DM6PR12MB4529.namprd12.prod.outlook.com (2603:10b6:5:2ab::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.21; Thu, 18 Nov
 2021 07:07:42 +0000
Received: from CO1NAM11FT005.eop-nam11.prod.protection.outlook.com
 (2603:10b6:302:1:cafe::4b) by MW2PR2101CA0016.outlook.office365.com
 (2603:10b6:302:1::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.11 via Frontend
 Transport; Thu, 18 Nov 2021 07:07:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 CO1NAM11FT005.mail.protection.outlook.com (10.13.174.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4713.20 via Frontend Transport; Thu, 18 Nov 2021 07:07:40 +0000
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Thu, 18 Nov
 2021 07:07:39 +0000
Received: from audio.nvidia.com (172.20.187.5) by mail.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server id 15.0.1497.18 via Frontend
 Transport; Thu, 18 Nov 2021 07:07:36 +0000
From: Sameer Pujar <spujar@nvidia.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <perex@perex.cz>,
 <tiwai@suse.com>
Subject: [PATCH v3 05/16] ASoC: tegra: Fix wrong value type in SFC
Date: Thu, 18 Nov 2021 12:37:00 +0530
Message-ID: <1637219231-406-6-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1637219231-406-1-git-send-email-spujar@nvidia.com>
References: <1637219231-406-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ce036a89-e927-4dd3-f971-08d9aa621c34
X-MS-TrafficTypeDiagnostic: DM6PR12MB4529:
X-Microsoft-Antispam-PRVS: <DM6PR12MB4529162838C0254B85641D6AA79B9@DM6PR12MB4529.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1751;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2PsYRA2ET/TWIXD08bJxTZ2SxtPhS9nSlwePdKeiHc3OoSfqQISt0tb+HgsM5aq/qZbW1huJ21IIXz+Eo/Q68/R8Jzg62UsNrlZTLY4nlvxJgCCHbzvPKYk39EalujqNC6PRUPA9WkvtKQ5TfVyRIrFDyhhIvsNP21/o+M4KnBHUGC0ePVlKBTzyN1FME253fYokIp+qg39YMIIGFyYjhVwzrmzzFkOcFyORQtX4keljRLi7w3bVwUbu0KUQuvudpMA4P+iO0Qpm/wiWZkq/3bTE7IiKUFtKNiTMMylg16WhaSWe6qu0Q/m9hWfjR+K9rJf53k+EUxNMb+NfZPwH4Uoh84c7+VmPHPjAogdn7WQa9Zao6BrdgIJeX6LRGerz2odoEmCAC0JSbMELfCAGBCx93NG+ScOjyXBzPjWu7vz77fEkh30bcZczw+ExFQ7MWBh3uBsNX65xYmN/m9LgoD51YPKdomApjIOWkdhtP/EiHUy/IWAX0W9/TYJQTVMF1lfNDizle0iGqWFzUrCXL5IsnFo1toATCnk02DeFEs3qeRa5xs7X+NNYpUn16q+sfyjhaECaaXNKNBNQ2PPcppIv1jitD2J5R5YHG9wPpbBvbGpor6lEFlBShxXK2JFcZLrha+YS+EYKaeEtnNy8qkIiXT5C+s/W79yYP0NqBkr8ZhjjbhEeU0mwsk1MUGH7RC8DeMxhh07/OM0XsdFbQw==
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(426003)(86362001)(26005)(8676002)(508600001)(36906005)(8936002)(2616005)(2906002)(316002)(47076005)(83380400001)(356005)(110136005)(7636003)(54906003)(5660300002)(36860700001)(7696005)(107886003)(4326008)(186003)(70586007)(336012)(82310400003)(70206006)(6666004)(36756003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2021 07:07:40.5227 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ce036a89-e927-4dd3-f971-08d9aa621c34
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT005.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4529
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

Fixes: b2f74ec53a6c ("ASoC: tegra: Add Tegra210 based SFC driver")
Suggested-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Sameer Pujar <spujar@nvidia.com>
---
 sound/soc/tegra/tegra210_sfc.c | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/sound/soc/tegra/tegra210_sfc.c b/sound/soc/tegra/tegra210_sfc.c
index dc477ee..cb592ef 100644
--- a/sound/soc/tegra/tegra210_sfc.c
+++ b/sound/soc/tegra/tegra210_sfc.c
@@ -3251,16 +3251,16 @@ static int tegra210_sfc_get_control(struct snd_kcontrol *kcontrol,
 	struct tegra210_sfc *sfc = snd_soc_component_get_drvdata(cmpnt);
 
 	if (strstr(kcontrol->id.name, "Input Stereo To Mono"))
-		ucontrol->value.integer.value[0] =
+		ucontrol->value.enumerated.item[0] =
 			sfc->stereo_to_mono[SFC_RX_PATH];
 	else if (strstr(kcontrol->id.name, "Input Mono To Stereo"))
-		ucontrol->value.integer.value[0] =
+		ucontrol->value.enumerated.item[0] =
 			sfc->mono_to_stereo[SFC_RX_PATH];
 	else if (strstr(kcontrol->id.name, "Output Stereo To Mono"))
-		ucontrol->value.integer.value[0] =
+		ucontrol->value.enumerated.item[0] =
 			sfc->stereo_to_mono[SFC_TX_PATH];
 	else if (strstr(kcontrol->id.name, "Output Mono To Stereo"))
-		ucontrol->value.integer.value[0] =
+		ucontrol->value.enumerated.item[0] =
 			sfc->mono_to_stereo[SFC_TX_PATH];
 
 	return 0;
@@ -3271,16 +3271,19 @@ static int tegra210_sfc_put_control(struct snd_kcontrol *kcontrol,
 {
 	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
 	struct tegra210_sfc *sfc = snd_soc_component_get_drvdata(cmpnt);
-	int value = ucontrol->value.integer.value[0];
 
 	if (strstr(kcontrol->id.name, "Input Stereo To Mono"))
-		sfc->stereo_to_mono[SFC_RX_PATH] = value;
+		sfc->stereo_to_mono[SFC_RX_PATH] =
+			ucontrol->value.enumerated.item[0];
 	else if (strstr(kcontrol->id.name, "Input Mono To Stereo"))
-		sfc->mono_to_stereo[SFC_RX_PATH] = value;
+		sfc->mono_to_stereo[SFC_RX_PATH] =
+			ucontrol->value.enumerated.item[0];
 	else if (strstr(kcontrol->id.name, "Output Stereo To Mono"))
-		sfc->stereo_to_mono[SFC_TX_PATH] = value;
+		sfc->stereo_to_mono[SFC_TX_PATH] =
+			ucontrol->value.enumerated.item[0];
 	else if (strstr(kcontrol->id.name, "Output Mono To Stereo"))
-		sfc->mono_to_stereo[SFC_TX_PATH] = value;
+		sfc->mono_to_stereo[SFC_TX_PATH] =
+			ucontrol->value.enumerated.item[0];
 	else
 		return 0;
 
-- 
2.7.4

