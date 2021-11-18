Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FAEF45554D
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Nov 2021 08:13:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3CA4D18E3;
	Thu, 18 Nov 2021 08:12:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3CA4D18E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637219605;
	bh=xRGdEPIqUQEvT3bTbr95CdZloeK+ukgEiI7qUaabQXs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=czOvecHkNcRYKnlb5IgHTNJlFC87x5OVemFN9U+nAmuNa3HGAgjsDq3hwNE0h2rC9
	 gvlvldfbiHYFoLqTWrppPearmmFQpI9Io+WZCtXow9QviyPdMhk8OrrYzOOK1+ArhR
	 TI+Q3+BD98J5VZ64Prya16MpY+Q0n0JTbk5RCqA8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D9F01F8054A;
	Thu, 18 Nov 2021 08:09:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 247E9F80552; Thu, 18 Nov 2021 08:08:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2088.outbound.protection.outlook.com [40.107.244.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 97051F8052E
 for <alsa-devel@alsa-project.org>; Thu, 18 Nov 2021 08:08:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 97051F8052E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com
 header.b="ecDKtw2U"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PJeHa9o9zoGW8m9JooLOLo3d9Abrj8WhuJ12iMnj3Cl+U79JvIvAIULs0OsEqKV6MJLBPP3c+3HWA7BTK1DuwrjfUeJOisLpPnvSzAQtMPTZuJxpFeZSQaMk/uRDqI0GSgJuIaxPRrybUYXsjqDu1XxkryVGvNUF0+zHs0dTQ9yrQTHPZhdDIFCDAxnRPTvDdvQteH+BloQMmTYEmsn2JbYadJtIHXKa6CJjgHavrRfEcIQ2IEjK9dZLrXVbW7sMYhM0B83rmJk/dZVKQXqh/AUlT2hF6GywnhG+OTrinKev2O4+D03GZQkGhRiCeN2FS1TzgVodLGe0XVZI0FMMPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ugxmlf/o55vAjvWrVe9GahbKf/lSIhQJpc3KN9DrvFo=;
 b=LgK5hbAi5Ke7TFNHj1g8AjM06eyHyNRpC80ar0ya1+nxbWOrI2GpF2XfnJXYqYe+PZn0zwn53oDlVGbpdM1le4uPlJ8YCSj6KdPfV08FQthQ+1PtVl30Tc4ExH/xWKzbx+26lUBVnDuP/iW9Xtu+J46lrpwy1/ey4NL+sOzmNQ0ovpvVYMEhFuwIyFnevSiIyaM0f21ugVDo9NhJcUw74PMiy6I4HEmS5eXyJbdk5azjoVwfi9VCjY5pvJJQLRVNdP1e1u8/IhdT/xBoQmCF/mGVrnLJXHsKmeflZ7ZXtRSUto3TI9yWXBkp9hQU1H4XBJcVwzy58+8butVACWH5Gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.36) smtp.rcpttodomain=alsa-project.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ugxmlf/o55vAjvWrVe9GahbKf/lSIhQJpc3KN9DrvFo=;
 b=ecDKtw2U0RHHoLw27rjaDTTb+igss6K5btHWs3G6EY5cBqTltcB36JtkrRXLdjlDWyOQydNAjn3S0w8llU4cddySHlZSIiTeFLJci6Gas1ziG7ggiICSJvfdtFO2O1GVNuS9jqtb+G6FDdMOLYSOXWEHLrE6nKreyLCdJcHusysuzIt7WjjbYb+qjAIrba7jhc+9IUUUIWe0AgEXnQNpJnyti0i+Mmz1yCaPXkOlgsK6ct4nq2nI3bfLwIqALYzEgYp42PEqDF1wuyxg5gtl1x0fbwz0lFRHtjaSomljDveB5B36Wui5G5Qadn4um1oKwDr6pJgoVifT4XqId0XE3g==
Received: from BN0PR04CA0029.namprd04.prod.outlook.com (2603:10b6:408:ee::34)
 by BYAPR12MB3431.namprd12.prod.outlook.com (2603:10b6:a03:da::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22; Thu, 18 Nov
 2021 07:08:14 +0000
Received: from BN8NAM11FT039.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:ee:cafe::d6) by BN0PR04CA0029.outlook.office365.com
 (2603:10b6:408:ee::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.21 via Frontend
 Transport; Thu, 18 Nov 2021 07:08:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.36)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.36 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.36; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.36) by
 BN8NAM11FT039.mail.protection.outlook.com (10.13.177.169) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4713.20 via Frontend Transport; Thu, 18 Nov 2021 07:08:13 +0000
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Thu, 18 Nov
 2021 07:08:09 +0000
Received: from audio.nvidia.com (172.20.187.5) by mail.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server id 15.0.1497.18 via Frontend
 Transport; Thu, 18 Nov 2021 07:08:06 +0000
From: Sameer Pujar <spujar@nvidia.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <perex@perex.cz>,
 <tiwai@suse.com>
Subject: [PATCH v3 15/16] ASoC: tegra: Fix kcontrol put callback in ADX
Date: Thu, 18 Nov 2021 12:37:10 +0530
Message-ID: <1637219231-406-16-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1637219231-406-1-git-send-email-spujar@nvidia.com>
References: <1637219231-406-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 23043389-b77f-4831-530b-08d9aa622fee
X-MS-TrafficTypeDiagnostic: BYAPR12MB3431:
X-Microsoft-Antispam-PRVS: <BYAPR12MB3431A97E02943464C93A5596A79B9@BYAPR12MB3431.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hd7ZURJL7Fdn/qSjIZpDx1wWY3LPzDkr6QAlTc9vRzuZ8o6OoEDSmAqOnD0hyfLxLaxPLA3xSfqHzv7NXgThrS6YuHxi19dKvwCXIRZn+1agS0lbqx/G8xR+Bb3tbw5I0X40rqLPhbGJ+lMO5I4TOB9cNxbNs0EoWW47ZpB4PgvbupxnbITzUUa95/sJKGGFBPB1/AqIy0tgXWlla+XUcYNNAb2/EFfjMs2VhWeIA379Svq30qYEduwlJqxsdY/8g5wpITwHBjxJZrpL7HmcHelcVfWLgUzXLsiOtBqS3hXnF3FyOEW31Hh2+4fOi2nYDcu1zlktHMTcZyibExqQsBpc0gSQi8P51y9yCurD5t8pPc8fq3iztLodaJwyLjh+09J6xyA/IIUrh8qQ4NJjMUHePbknOLyocVy411TZIp11SkzQuqrRkndmqGmUeVK8sA0AAlGZVJW0i9H0h4iE9qWvxYC2UU0Rt4vraAZQdj8/wTv0A1vJ9x0WbD5vaof54wSXmmgwd4oPK/T3lgF9cjB5IXuvatecmVx+U53mESYRSFPXlxDFl0rxIK0LvtxqKrsv64aTEncyGEEGheQkKzxuXx4qgRTElAM6DJLt6Y4u8GpOXehtSEuQjD/QjX5C21QqyQZ3k/N1m2rxBn7dYzPPxBrXfulyif/Es6BK7BvBSEK+88OIPzJvzC74X8gR/Ez/k2IDCxuBnTyAOPhTAg==
X-Forefront-Antispam-Report: CIP:216.228.112.36; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid05.nvidia.com; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(82310400003)(4326008)(5660300002)(2616005)(186003)(47076005)(426003)(107886003)(336012)(36756003)(70206006)(83380400001)(70586007)(8936002)(508600001)(8676002)(2906002)(110136005)(6666004)(54906003)(316002)(36860700001)(7636003)(7696005)(86362001)(26005)(356005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2021 07:08:13.1863 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 23043389-b77f-4831-530b-08d9aa622fee
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.36];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT039.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3431
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

