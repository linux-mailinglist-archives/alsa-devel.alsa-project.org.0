Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 90C3D443C7A
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Nov 2021 06:08:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3A0801687;
	Wed,  3 Nov 2021 06:07:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3A0801687
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635916104;
	bh=LTDBfC6TZTUDk7MhP8NienszKKIRGQ/8NSl8FsOd5C4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vYeCW1iS8hE8TxypwWEzvPGJBtFnq1E/Irc3aKS6jha8QFlgRwreeEV+bNxiYXFaP
	 mq5O0KGuuZiii7nwRykmnjX0Vv032dPq3YSZd3mIJgSuZ4o5bVqLCXZwMe6AMFBbgV
	 jAsodqXKz209K0gAmhVL673suhw2h/w+3rlueE3Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 12207F804FB;
	Wed,  3 Nov 2021 06:06:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3DE61F804F3; Wed,  3 Nov 2021 06:06:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08on2048.outbound.protection.outlook.com [40.107.100.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 05727F80224
 for <alsa-devel@alsa-project.org>; Wed,  3 Nov 2021 06:06:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 05727F80224
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com
 header.b="gsgcCjLq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZanBOCsSWHn6on8feXioCc2IUBN1kUKXL0bPq09JYQM81hLdnZTWofCY9lV7zRXpTwnwPZzH7cT7cWZ008jeW2xuBqzbtRdPib0+ZxX1Lk3g5m3xQEY2rvJaseZF8AUC07YvgMrowh7fusYVrv2JBV8/+sFndGV+kfbcySOoj9Mx+y49qv26wQ95CsbCEwXIIyU8QHEY8mUM+fgY1uVfSgsLU6VvP5SQY5N6OEoYbACA2rSiLxC5ecKHDqxA7FlwLalhCGk38CkzsepuzUc7lSzbtTB2Z0n4JTqUtc0nCyPqZ0ZIx4ptaKgh9zlaeLQxuftukOhK36A0ywMIMWsplA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lv9qTG8Mk4JCkjZXIyqN+guo67FWeKDFErBSmO0HKNc=;
 b=cv/h0UwT2aaeU4WjHFIma0GrwPDaWD0+Qotyw04FW1o0YI9iJIGwzXFuTRtmKImultumWNkeDRpjQlFG2NgADVHPggMhdUZC6E4t9thNhIYRRjRYWgq5mwlfiLV+qTsP918eRmudefypk45Wv8rufTetqtGGDkOVFjGuvwbzffQJ9ZLgQf4oOGHhAfjS8sqFLeM0WypotWFdYCKs67qIHDqv9AogMuH30bFN8UaZEQorErS1K0r31zIwQpu9ubAy0IX/dYadx8/BilvS2jVETIWZByCrPmK2aPHtxJQnUr/5tahYQ7LM/12wlNNMv+4EbOgPtbU4BT17PE9YUHFXsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.35) smtp.rcpttodomain=alsa-project.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lv9qTG8Mk4JCkjZXIyqN+guo67FWeKDFErBSmO0HKNc=;
 b=gsgcCjLqifFyuLFKY94uiw3/5AeI+RX8XCM6F4tdGONOTvX42E/hrtGRGT79hspbdgfYSVuxiozrRtwMgwF2IbCPpEnlg5fM6la9fO7q1iH7yrg5a/a79V/WpgA6eKoo5B7MGJB2bKs7hUnWnPP5e05AH9wuyZ3Y67+b7wM+UDhI09G2JvLRdNaa8gHWToVvKYwG26herP5kM1TcRkYRsGV8JoQwZmbSV7TU/k4teYakj5Zm8kgRWxu65mmoao558pATHv8dtYRqrhOwFsZrH3pj3Y6q483x0bYtZiU5mjDfbI7GwBRHbf7pt6QNy2CB7M8/s78BLCEOYYbyGd7zmQ==
Received: from DM6PR06CA0080.namprd06.prod.outlook.com (2603:10b6:5:336::13)
 by DM6PR12MB4976.namprd12.prod.outlook.com (2603:10b6:5:1ba::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15; Wed, 3 Nov
 2021 05:06:07 +0000
Received: from DM6NAM11FT051.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:336:cafe::f4) by DM6PR06CA0080.outlook.office365.com
 (2603:10b6:5:336::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15 via Frontend
 Transport; Wed, 3 Nov 2021 05:06:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.35)
 smtp.mailfrom=nvidia.com; alsa-project.org; dkim=none (message not signed)
 header.d=none;alsa-project.org; dmarc=pass action=none
 header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.35 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.35; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.35) by
 DM6NAM11FT051.mail.protection.outlook.com (10.13.172.243) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4669.10 via Frontend Transport; Wed, 3 Nov 2021 05:06:06 +0000
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Wed, 3 Nov
 2021 05:06:00 +0000
Received: from audio.nvidia.com (172.20.187.5) by mail.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server id 15.0.1497.18 via Frontend
 Transport; Wed, 3 Nov 2021 05:05:58 +0000
From: Sameer Pujar <spujar@nvidia.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <perex@perex.cz>,
 <tiwai@suse.com>
Subject: [PATCH 3/4] ASoC: tegra: Fix kcontrol put callback in DMIC
Date: Wed, 3 Nov 2021 10:34:56 +0530
Message-ID: <1635915897-32313-4-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1635915897-32313-1-git-send-email-spujar@nvidia.com>
References: <1635915897-32313-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3aa8b012-a37a-44d4-17f4-08d99e87a45e
X-MS-TrafficTypeDiagnostic: DM6PR12MB4976:
X-Microsoft-Antispam-PRVS: <DM6PR12MB49763D66DDF45F7445702D83A78C9@DM6PR12MB4976.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0WUvdoxzWrPpbKzSFW7TJavW2yQH3gSsKD20ZjdfqY4pUGYxMkEGwVJKKZWSZ7j1stfMr2PoA3gKXqyuvMAHSBYe9INJv+Z8odaOs+dGtd/aWoFH7tzP02b1Bis53oHDY99Kil8bS5JrIZGzo6wmVB2mZGnK0PY6vnrOV9m/vBPH6Y6YumfL5YsAxyeOuboSNwL/vUlk3XFYkj5k6l/0ukV+xruRI5f4nIqBNZ0tBE9/U+bV/5Hy8GvK6Db9MzJp8qzeYlNwk1kUo0pwOHjxrqMRt29YmdWmYhCGvvmYAnXHcjce2he3JggI3zuj4MpcVtD+r/uoKgKhWjPOZZ7SJFLtiMXXnMr/sScygyVuRSTeKWscTjuYDDfMj/adLTgMovM2DWhZfB42+936Iu+qHWdIQ7IcTsBs5WB3XiQBnRQf0RMPC0YTQ8YmQQ76DSKx28uYNQR+ouBKoohNiYjvB9XuHjdj5jkW7ictcUW7zQscl+4l+qOLm+1D7iWUVQQGNXvkQEZe6bieK9Ph+oVysuuZltW9KRuHkOKI25BvEGVr3gGacy2q9umT6QYHKU3ywE8CHK4pUmjLMRRzU14cQrDDzs7Cda+i3Lt3ps3moknrjMhaN3xbLX2tZleMESoqBfdxPGbnVPt7zpOhsDrugNDQJGX+qQ0Hit3ol6di2ldFykAy7V1wKel9BN8WQYIuXHdB57RNAEqUTfjKlC2AWg==
X-Forefront-Antispam-Report: CIP:216.228.112.35; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid02.nvidia.com; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(336012)(4326008)(426003)(2906002)(36756003)(186003)(8936002)(36860700001)(26005)(107886003)(86362001)(82310400003)(7696005)(508600001)(70206006)(47076005)(54906003)(316002)(7636003)(2616005)(36906005)(5660300002)(356005)(83380400001)(8676002)(70586007)(110136005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2021 05:06:06.3620 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3aa8b012-a37a-44d4-17f4-08d99e87a45e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.35];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT051.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4976
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
that change notifications are sent to subscribed applications. Update
the DMIC driver accordingly.

Fixes: 8c8ff982e9e2 ("ASoC: tegra: Add Tegra210 based DMIC driver")
Suggested-by: Jaroslav Kysela <perex@perex.cz>
Suggested-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sameer Pujar <spujar@nvidia.com>
---
 sound/soc/tegra/tegra210_dmic.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/soc/tegra/tegra210_dmic.c b/sound/soc/tegra/tegra210_dmic.c
index b096478..133509f 100644
--- a/sound/soc/tegra/tegra210_dmic.c
+++ b/sound/soc/tegra/tegra210_dmic.c
@@ -197,8 +197,10 @@ static int tegra210_dmic_put_control(struct snd_kcontrol *kcontrol,
 		dmic->osr_val = value;
 	else if (strstr(kcontrol->id.name, "LR Polarity Select"))
 		dmic->lrsel = value;
+	else
+		return 0;
 
-	return 0;
+	return 1;
 }
 
 static const struct snd_soc_dai_ops tegra210_dmic_dai_ops = {
-- 
2.7.4

