Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A0C94442ED
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Nov 2021 14:58:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BABD41674;
	Wed,  3 Nov 2021 14:57:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BABD41674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635947879;
	bh=U1qKSGKQ7T8MGOy8DjhdSkpwe/0UXhdTilYxhVCghzU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dPZQ4DvwrPsXMvyUyXt48RX+fegTVUXTZ/uEVunxtyUfp2msAPDUZMlhKcWU2M1xZ
	 KTLAzkI+y5JNpdqFFFRr45++Hy3hKE02oPkU0IEW9jw9dFwrKN6Nuh7X89uEMEPKiZ
	 zNNG7PaSpk/5W7uRWsYqrMcrLD/Z1DXL9iR8n7+0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DF6A7F8053C;
	Wed,  3 Nov 2021 14:53:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 22E81F80524; Wed,  3 Nov 2021 14:53:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam07on2056.outbound.protection.outlook.com [40.107.95.56])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2FD11F80510
 for <alsa-devel@alsa-project.org>; Wed,  3 Nov 2021 14:53:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2FD11F80510
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com
 header.b="jfP7/dyK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HnYVPJoc9Y4BAdLUjaSQLa3IR2vuVJ9gt8995NIOt9jlMSRh71Oc7eabBuZO3f5EP4BUOmiPg7fMRdM7I6Y/nuCH848OhCISO7IwQHf79SJLhEjqHSBfZw9peOy6WWIPloEIDchn0y7gPkjaF9xs9v2Hzv1zl9QkRK6WBGEJ51Ca7lR6//WXkSxr7j/apq9JtdKA7Q7Em4K+UkMAfA4pdCANsqtgQ37/wfw+GuuVTXe1RAkxJ2r0b5IUu0lft5euGGuV1BPSAJ5nbMLuwTOliICD1cIbDW0g8KpF4nEnnK8cG3ZOgcY18dng7m6bo7/i0FoEIO2dqZLhbPaHU4IpWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WgUJ9s87Od92IhYOLI48pQMKrFUKSuJ7BIUwtBHCr7Y=;
 b=W6VSgp1pre/ZfOwYLmLNW7rYAfAUUnZgHj82ewRgc8DYM6lhUh9hy6SpJ3EZNKZuH5G+Y92YJu+aORrkwumzDYTNc7aQIOC+ukEMfxDuEpBI/hJZHizz2lAiW3M6CurDkgLdg92st5oySLVdDJ3Y7fLFbCJW9si9+3qJoqApSGVLSFkna7LAxf0VRWfN3xq+bbTLUibBqhakGsp5BG279RAS4FrtIqUic5O4j7Ivb47b0EH0VpHvB3oJfsVEu8lRsfKledjzHX9+eiXWLzSgBR7rGvZjwuAqnz69fGNKCnNEjSfjTDYZYYKgvhlaePskx1BaE5xVBJRMD3fd2szQFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.35) smtp.rcpttodomain=alsa-project.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WgUJ9s87Od92IhYOLI48pQMKrFUKSuJ7BIUwtBHCr7Y=;
 b=jfP7/dyK8diy6USb1+EhPcuvJ2uJi3GTG1Se1UXJz/AhU9muJZRlYXU++1siSsgqr6Uafcy+zMmsjS6p0Uo+waJ/wPtke0NrPJsQx10jkAVeY65DfmgQ4kzYh4LU8ReQ1iykkFsVxpVlZxING08ej/NMgtdhUXJIWCrfn7Dny+awHFaUxeF4MMesfGnWpNc3gxEUj8pPIz6VwTCugYVhBSg43NeRfMf9MfPe6IeiLnwzSWeib0VDo521XcowWvSTwfeMbMWuuLzmrH3WaoD9VqX4Skh03qN8Avy+CHuywApAnZ3uop67mENihgxJZFca9iD2vcjbyFsb5zBYX5e4VQ==
Received: from BN9PR03CA0035.namprd03.prod.outlook.com (2603:10b6:408:fb::10)
 by CO6PR12MB5444.namprd12.prod.outlook.com (2603:10b6:5:35e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.14; Wed, 3 Nov
 2021 13:53:12 +0000
Received: from BN8NAM11FT065.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:fb:cafe::81) by BN9PR03CA0035.outlook.office365.com
 (2603:10b6:408:fb::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.18 via Frontend
 Transport; Wed, 3 Nov 2021 13:53:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.35)
 smtp.mailfrom=nvidia.com; alsa-project.org; dkim=none (message not signed)
 header.d=none;alsa-project.org; dmarc=pass action=none
 header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.35 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.35; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.35) by
 BN8NAM11FT065.mail.protection.outlook.com (10.13.177.63) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4669.10 via Frontend Transport; Wed, 3 Nov 2021 13:53:10 +0000
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Wed, 3 Nov
 2021 13:53:09 +0000
Received: from audio.nvidia.com (172.20.187.6) by mail.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server id 15.0.1497.18 via Frontend
 Transport; Wed, 3 Nov 2021 06:53:07 -0700
From: Sameer Pujar <spujar@nvidia.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <perex@perex.cz>,
 <tiwai@suse.com>
Subject: [PATCH v2 10/10] ASoC: tegra: Fix kcontrol put callback in Mixer
Date: Wed, 3 Nov 2021 19:22:26 +0530
Message-ID: <1635947547-24391-11-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1635947547-24391-1-git-send-email-spujar@nvidia.com>
References: <1635947547-24391-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a7e3791f-d016-4562-52ef-08d99ed14628
X-MS-TrafficTypeDiagnostic: CO6PR12MB5444:
X-Microsoft-Antispam-PRVS: <CO6PR12MB5444FE92F1CC4C42AAA2053FA78C9@CO6PR12MB5444.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VX510ZvckgkQPCoaHluPCKub7Yf8HV+nT0bwS4QD2CY3183/JP/C8Xlplxlh37pvBlEErgdamHgTfbg9i3lacV+SyXawQiCSdITNmAkQ0c5q/ocOhOy3fJWCqLY34nMJEAfvUj99pIXMhej7X250/WGfTz21+D9+wQNwqCAPjAx5ouPXoO1FOorBdX0GXLNoFK23CNnEjHvSKOly4qp88e4dOdjAzgEt8dEprfaW6wjV0U+v5XGKuQkASbAizdhySfj6QTdd84LEZl5RrqK0gBvrWm3HlsVzNr1cEKcEfRp/MAOB0KjyHtIEn/R0dI1X34IdSWvb+z4LPP81YgAsDKgcE0cgXHfbIn765Co/FI4/uaL00GvsN85Qh+iJlAZzPBi8RFPEuNRbmm1OPztMHSOq4eyAV487zFP9OqIcWHwmtYVIpbf4rGrjba0Afx7gHPWFnguPKd4AVUn7PFhLorQNrFUVypS/SgBioy2bQZC1ARkQQKr0x4Oee8BC5ekjERJU8heZh7k0uY7Mrimo+sVmwUS5IEciOCfwKzKZ2x4QA53ea3IYKF3rv5Hi5sUQvrpZxmQkpsS3oZfP+snTAAdguVq2T9vocKAqfQXW9y9gcTQToqSzeL/AEK5M/qfM9LKPUCyvhvVicGcHE2YVknvRta0tv484pV9wq/PPurwzggQFvlBa7XmuMFZapqdYmyECizsoAYHC8l5QX3LLPw==
X-Forefront-Antispam-Report: CIP:216.228.112.35; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid02.nvidia.com; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(83380400001)(7696005)(2616005)(36906005)(2906002)(316002)(82310400003)(86362001)(6666004)(426003)(7636003)(36860700001)(4326008)(8936002)(54906003)(107886003)(26005)(8676002)(36756003)(110136005)(356005)(47076005)(336012)(70586007)(186003)(5660300002)(508600001)(70206006);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2021 13:53:10.7669 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a7e3791f-d016-4562-52ef-08d99ed14628
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.35];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT065.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR12MB5444
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
out duplicate updates in Mixer driver.

Fixes: 05bb3d5ec64a ("ASoC: tegra: Add Tegra210 based Mixer driver")
Signed-off-by: Sameer Pujar <spujar@nvidia.com>
Suggested-by: Jaroslav Kysela <perex@perex.cz>
Suggested-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/tegra/tegra210_mixer.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/tegra/tegra210_mixer.c b/sound/soc/tegra/tegra210_mixer.c
index 55e6177..d2d1946 100644
--- a/sound/soc/tegra/tegra210_mixer.c
+++ b/sound/soc/tegra/tegra210_mixer.c
@@ -210,6 +210,9 @@ static int tegra210_mixer_put_gain(struct snd_kcontrol *kcontrol,
 	id = (reg - TEGRA210_MIXER_GAIN_CFG_RAM_ADDR_0) /
 	     TEGRA210_MIXER_GAIN_CFG_RAM_ADDR_STRIDE;
 
+	if (mixer->gain_value[id] == ucontrol->value.integer.value[0])
+		return 0;
+
 	mixer->gain_value[id] = ucontrol->value.integer.value[0];
 
 	err = tegra210_mixer_configure_gain(cmpnt, id, instant_gain);
-- 
2.7.4

