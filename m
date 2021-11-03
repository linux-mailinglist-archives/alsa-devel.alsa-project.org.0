Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D1D54442EC
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Nov 2021 14:57:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 990D2167E;
	Wed,  3 Nov 2021 14:56:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 990D2167E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635947851;
	bh=xRGdEPIqUQEvT3bTbr95CdZloeK+ukgEiI7qUaabQXs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kINg4zghIH8MZ0alvGaeKaK8vIUg7BLPUyt39LGUTYKb5TekF31+LtWQRLCEG6+/q
	 C9YcYAm/LK7h13bi+6VGhf+svSPMx2nefrZYozekJrEpLitquMbDuofRoodw9v+Aej
	 kPg/NfOHHl8zbEdJpLFf7aNexCJyYT6cmvQ8AiZs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B1F35F80535;
	Wed,  3 Nov 2021 14:53:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BA854F80520; Wed,  3 Nov 2021 14:53:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2043.outbound.protection.outlook.com [40.107.236.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 22CCBF80224
 for <alsa-devel@alsa-project.org>; Wed,  3 Nov 2021 14:53:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 22CCBF80224
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com
 header.b="YOgPzSTw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LXtWUab2D/MAopXoWnHhtqMploUvyPfnyuwZv9W49sU2TwWz8/1Z2lx4UBmomkxA14Uh7M+QiOhQKamkGfFnDOi2ziSieECaMpMByQAfmbeqHJdLbeq8Dyja9RrVvgzANML2RxMdWU+mzd4XiK6yU8Lq1jIsa8YbJnismNccmwrHVmgLNEvlU+9akTSnH3ZEWX/XrPNHX6Ts975jFldSYUeCTdyYLei0eex1MfIHTYPDwn5p+SvEa+ChSAksOoy5PIp0jES2fdXaMTRwPAFDs64afSyZuxUukf7BBWnGK9xcuu3AxRw/Ie9zauuwehrrN2t6SZnOjAIEdaVB+YECWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ugxmlf/o55vAjvWrVe9GahbKf/lSIhQJpc3KN9DrvFo=;
 b=fJI8UmCOIylFLdyCJxaJUn18G3VFERksVtH8eYuLh/5hxmNiNhwJnZc42po+qt4GI7uC7MNyBHKRcCgUMvRiCEy3FVj90k2/p0izUytR4fHZ531+Mx4fIWMC8k4BSS1jILMqoRjawCIJuvSLSUAxRLavVbSwahri3vWa0Cc1jFhkzcKMCFeBzDNC00ZZ1jOIirrivzh8+TlbC3gWYv5YsV0hkWRkscG0VcyaQ1CHKF016q+pl22gC4bfQXw2nfAcp1G420yUYX0wAix0Q86JsAdXN0XIgpMaWHvaCoEhgAIG4EAUb3ZF/NZKBXCz03+3FNJ38ZAkGqbpnzQZN/xqPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=alsa-project.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ugxmlf/o55vAjvWrVe9GahbKf/lSIhQJpc3KN9DrvFo=;
 b=YOgPzSTwDQgQpwk0zzjfgGt0dNSKIPborMyW2cEeN+YALVn66nvXpMebwIJH8WigDnwl9R3b5Amar+ZjPl8QHzX/9Iv+IU8cZknSGdwy4cSp5qaJJxpCooea4/TFT28k9XtxShXuuTrxYZzbeWg3Vekv/pvFWWegE6MDiGkEjGbY5n/1JVnD4pSUZPtzXicWDd2yN5R5FUxaI/Rep6HOz+nuyzFAykfaaDv8tEUrhCwFU9VLioEogM/jfL6LJ3y8Ir/iz+c3oFIN72zebCi7g+185yD2JJhmyeX23SHXyEQ69Xpinm0PN2x4DZ6NyKvWW2bakIzMcTRMZGT9yDNP1A==
Received: from BN0PR02CA0013.namprd02.prod.outlook.com (2603:10b6:408:e4::18)
 by BN6PR12MB1603.namprd12.prod.outlook.com (2603:10b6:405:b::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11; Wed, 3 Nov
 2021 13:53:09 +0000
Received: from BN8NAM11FT023.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e4:cafe::98) by BN0PR02CA0013.outlook.office365.com
 (2603:10b6:408:e4::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.17 via Frontend
 Transport; Wed, 3 Nov 2021 13:53:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; alsa-project.org; dkim=none (message not signed)
 header.d=none;alsa-project.org; dmarc=pass action=none
 header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 BN8NAM11FT023.mail.protection.outlook.com (10.13.177.103) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4669.10 via Frontend Transport; Wed, 3 Nov 2021 13:53:08 +0000
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Wed, 3 Nov
 2021 13:53:06 +0000
Received: from audio.nvidia.com (172.20.187.6) by mail.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server id 15.0.1497.18 via Frontend
 Transport; Wed, 3 Nov 2021 06:53:04 -0700
From: Sameer Pujar <spujar@nvidia.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <perex@perex.cz>,
 <tiwai@suse.com>
Subject: [PATCH v2 09/10] ASoC: tegra: Fix kcontrol put callback in ADX
Date: Wed, 3 Nov 2021 19:22:25 +0530
Message-ID: <1635947547-24391-10-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1635947547-24391-1-git-send-email-spujar@nvidia.com>
References: <1635947547-24391-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6dd8037d-cc78-4400-bd1a-08d99ed144a0
X-MS-TrafficTypeDiagnostic: BN6PR12MB1603:
X-Microsoft-Antispam-PRVS: <BN6PR12MB16035740F96ADE4E051A6704A78C9@BN6PR12MB1603.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bb2iVKtwfTGLnB6apgKz7PARO9HDQpSWVug+Quq0CL/6e+s25kbYsvnuwkp8RKeGNkoY7fbTW2T3W5jTOznPIJlX1wfAYleVg5TvWGQxLmapdGABlS+kDCWgN0ctlJZ+x2hP8508HhTMORtoe94VukENvcF9+btrw2fw2UP4lyLRctLlJEdLlXokoQ94S+kkKwG1rH9pF6SWmIAb7Q+Nxx7P2/vdi5YCbrEvn9Wlve+D+/kck/NdPtpDrbN6GcJUZ17sfREJdlUK9iwMvymKy33kP0G8BqZ6gTrK8XJSJCC9Yuamn7Nyh2Rox8pxDcn5bYllDnSOpvnujSKc+WH51YJNbdxWiKtSLe6TCJO853EJqNJuOJLhWFmqwJtG6Y0gXnePX2p4DN197goJVOozLDsLNp51iaCI1LUcka/C4p+KVUSR74BJt7XD/E74wh6s8ihTaJogVHLpA8VUN6TGiFf2IkMERuL/my0tA9KrFWyfT8RRjVM8mQi6iYXTUJlCDQatJ7e3J0TQlTSBWu3JDoYbUmeQobkQIJT842wp8Kb8yusfH0bxMysNiBayAhhyhyBrS6D43B80Q7rkbvA94FdkaZe19Ufw/C/H6x/P9YMMGCExL05G21x0pReo3tFPw1tjYPi4kiBC1pRvCyFYxGMJ52oUR8dNWcWNr0egrz8URrFUVSbQdUcbzVhSA790Mc9Y7Cf213cKreu8ENbt/g==
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(70586007)(26005)(36756003)(316002)(70206006)(107886003)(36906005)(6666004)(36860700001)(5660300002)(2906002)(356005)(7636003)(8676002)(82310400003)(7696005)(186003)(8936002)(508600001)(54906003)(110136005)(336012)(426003)(2616005)(47076005)(4326008)(86362001)(83380400001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2021 13:53:08.4695 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6dd8037d-cc78-4400-bd1a-08d99ed144a0
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT023.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1603
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

The kcontrol put callback is expected to return 1 when there is change
in HW or when the update is acknowledged by driver. This would ensure
that change notifications are sent to subscribed applications. Filter
out duplicate updates in ADX driver.

Fixes: a99ab6f395a9 ("ASoC: tegra: Add Tegra210 based ADX driver")
Signed-off-by: Sameer Pujar <spujar@nvidia.com>
Suggested-by: Jaroslav Kysela <perex@perex.cz>
Suggested-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/tegra/tegra210_adx.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/tegra/tegra210_adx.c b/sound/soc/tegra/tegra210_adx.c
index d7c7849..933c450 100644
--- a/sound/soc/tegra/tegra210_adx.c
+++ b/sound/soc/tegra/tegra210_adx.c
@@ -193,6 +193,9 @@ static int tegra210_adx_put_byte_map(struct snd_kcontrol *kcontrol,
 	struct soc_mixer_control *mc =
 		(struct soc_mixer_control *)kcontrol->private_value;;
 
+	if (value == bytes_map[mc->reg])
+		return 0;
+
 	if (value >= 0 && value <= 255) {
 		/* update byte map and enable slot */
 		bytes_map[mc->reg] = value;
-- 
2.7.4

