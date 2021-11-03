Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0809E4442EA
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Nov 2021 14:56:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 88E0816AC;
	Wed,  3 Nov 2021 14:56:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 88E0816AC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635947811;
	bh=og/kH9vK5xWax+RDT4g1/B+KP4y5sTVyd9VoKd6VJ6A=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ptcsgctKZZRTwthei4usmXJ1yWymz6kHSlP7cOaSoGcpXYn9dW6h+C48FHspoDX82
	 iTBIB0Cs5SMnsxZkP62KY3Yvw5Ia35WMKdWbP4Fi7qTQ+B293y1akh9KF52e7SdOKq
	 p5lmb62ZdoOMEtuPiV+d4Pbkw6px7l4Kaz/C+imQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 52AD1F80510;
	Wed,  3 Nov 2021 14:53:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D4AEFF80506; Wed,  3 Nov 2021 14:53:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2057.outbound.protection.outlook.com [40.107.223.57])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2DC9FF80224
 for <alsa-devel@alsa-project.org>; Wed,  3 Nov 2021 14:53:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2DC9FF80224
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com
 header.b="oqCUKWRk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RrwdMpTK64XIcmL5VocW10co5jk45IcZBFlsAspByqHeMK1rLWLCJHR6DDyUx1OfUpOUDB5FLP4mBOFPE6BsX2JUrZcLeQ7B0uyCgnPLJQbfrpKjng6hJqIa09WXAY+Yb4wt5/HRDxVJwt/svKFjEiGQzUu6nkcpEpQhbtqI9adUK86wCmXuVUDg+yUWbWptpzygVDdktv4zfqLKk2YpyK4qTe8u3jE3+MNSZvSoWeCwP5KGN5WXdZywCz9gLCjrmWRhGEMSkt8CStETHbpKzFeUFTii910GPINGWlES1DibJOHtg3NzYwO+8VweDrkGhY0rTyiK0M9pmIRubs2mkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PktcI9cavefHccx9wJ7xoNYt427yPivaSQDVB9VDtMs=;
 b=K4YNB7w7eZtrc1uWceVuO882vfh1VvE6In5WOC8f51Ref8T7LJGxVf9Ob0A35npmzJuKZmAigoWinw+572NnJtnBH/Zt5GcCj5csAQiRzTIIoKv2dEbGAA9s833Gyi0ds4eXbTcHkiZ+6aRKPH7tYCJvJFt8464DO33XdKHrIu+NHN8UdMoSeQSF5KwFetx6uFlXnS9af7zAWfcEUqFhMHhbyUwnPaujyEyKhFsQ5Ym+vo5zYf3bss52qps/VPyZbayn1TzAjOBnS8tAAAUb3/53inz9/pmX2pr0y+sdur2kfbhdTZ+NuqKtyiSqZb9/Sn4mjaalGOdLN2tCn5sSYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.35) smtp.rcpttodomain=alsa-project.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PktcI9cavefHccx9wJ7xoNYt427yPivaSQDVB9VDtMs=;
 b=oqCUKWRky1Yj8uhsrTBw5fiI3NjEV5kWTkq4nLureN/UyFcgtNv3vrXZpsetCM0haWm7TUwPOimcsCb0G3OyJR5tiwdIQ1G1bAVUaQzpW3RNXRsU1lHJeyq9KjpeUNYqWuM99MdYoJPnsKSG2UT+ucgvS6SIZ2uttpFOz8it6n6r0YASbSLWbJ4VLybEQzFvuPsQ2Ev8HF8wfBO2D+vinvsMecS+owHfDpBAAViNndXBKUDZMYQRkIYyUK89iBmqZnyZNqcrftIeQMMH+jOZt+fYuaGSIIRjZeJzXSZoOjcfI+68FhBYzYg9fUFyq1moaXDauc4KvorBvlcV6Ok5tw==
Received: from BN8PR03CA0035.namprd03.prod.outlook.com (2603:10b6:408:94::48)
 by CH2PR12MB4216.namprd12.prod.outlook.com (2603:10b6:610:a8::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.10; Wed, 3 Nov
 2021 13:53:05 +0000
Received: from BN8NAM11FT010.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:94:cafe::68) by BN8PR03CA0035.outlook.office365.com
 (2603:10b6:408:94::48) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.10 via Frontend
 Transport; Wed, 3 Nov 2021 13:53:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.35)
 smtp.mailfrom=nvidia.com; alsa-project.org; dkim=none (message not signed)
 header.d=none;alsa-project.org; dmarc=pass action=none
 header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.35 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.35; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.35) by
 BN8NAM11FT010.mail.protection.outlook.com (10.13.177.53) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4669.10 via Frontend Transport; Wed, 3 Nov 2021 13:53:04 +0000
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Wed, 3 Nov
 2021 13:53:03 +0000
Received: from audio.nvidia.com (172.20.187.6) by mail.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server id 15.0.1497.18 via Frontend
 Transport; Wed, 3 Nov 2021 06:53:01 -0700
From: Sameer Pujar <spujar@nvidia.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <perex@perex.cz>,
 <tiwai@suse.com>
Subject: [PATCH v2 08/10] ASoC: tegra: Fix kcontrol put callback in AMX
Date: Wed, 3 Nov 2021 19:22:24 +0530
Message-ID: <1635947547-24391-9-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1635947547-24391-1-git-send-email-spujar@nvidia.com>
References: <1635947547-24391-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 528882f1-4c88-44a9-ad7f-08d99ed14286
X-MS-TrafficTypeDiagnostic: CH2PR12MB4216:
X-Microsoft-Antispam-PRVS: <CH2PR12MB42169C829232AFF7C7600217A78C9@CH2PR12MB4216.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PABPoNHmBXhqUcltldXH6SzjOftf4FS5G3ZoACXqp4LIFB0/eHIr3Amv9CmrxxEFNxFgA/1yTLf1urBsgHsiYfoPaZgOMIwMISjDyFabTgIn+Z8lL3ulzytkdsGEOfrw1A/jEfEYeUl+JukcxBAl9NzQkzD7Kj+EzrYUGqLah8ySy2dUzibUP0ZoBhgbCQzDY/fS8zvbedH4FJ0T8/6eKaBGCzQg4R+vPmKEE60d5M8bo11A0FkQHQqr1Q6iiymEoH2lG1e6zrYS7ml7CMtmthqgRlRSTC3dmPqBsvoWKP5sXb9MJ3BXByxzBc+nTrNPn0LmBGtLerTxFPrz6g7EgkWmYBZmR7nw+LyJcKalObTpPCBXZJIS5e8+HuVDScRA1B2OD7El1LjZrjHMCo74mnMpdaRofsZocPu4VarDElUFa0F0zg+8/3bzeKsIVgeJj0BG5ApmVC1UGpJDdRKbnbnE4np9vz+vonGy/z7KOS5WSDDlO1n1mIG1kQTQQeNq0ryAboztJLL8nt0l6sB9sO4UvOxCZ/TD6lx9KquMIJsSFzTN97Fomf2uogBhJsbjjFVQCaHiQyL70uGDm24IvTJNswLeHwjBDz7wNZtUY52bRZQhWLpg4LLjK+GkrbE7HOGeshbHzrzuhFrr8sZWnKTu8/c1BvupDuzyV1kKc7pkX86W6dpTG7TRCoU/PI+wlmvUpbE00pB/lcIHsxiziA==
X-Forefront-Antispam-Report: CIP:216.228.112.35; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid02.nvidia.com; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(7636003)(36756003)(508600001)(356005)(6666004)(110136005)(54906003)(4326008)(36906005)(107886003)(316002)(2616005)(47076005)(426003)(336012)(2906002)(36860700001)(26005)(86362001)(70206006)(82310400003)(8676002)(5660300002)(8936002)(7696005)(70586007)(83380400001)(186003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2021 13:53:04.9322 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 528882f1-4c88-44a9-ad7f-08d99ed14286
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.35];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT010.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4216
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
out duplicate updates in AMX driver.

Fixes: 77f7df346c45 ("ASoC: tegra: Add Tegra210 based AMX driver")
Signed-off-by: Sameer Pujar <spujar@nvidia.com>
Suggested-by: Jaroslav Kysela <perex@perex.cz>
Suggested-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/tegra/tegra210_amx.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/tegra/tegra210_amx.c b/sound/soc/tegra/tegra210_amx.c
index af9bddf..6895763 100644
--- a/sound/soc/tegra/tegra210_amx.c
+++ b/sound/soc/tegra/tegra210_amx.c
@@ -222,6 +222,9 @@ static int tegra210_amx_put_byte_map(struct snd_kcontrol *kcontrol,
 	int reg = mc->reg;
 	int value = ucontrol->value.integer.value[0];
 
+	if (value == bytes_map[reg])
+		return 0;
+
 	if (value >= 0 && value <= 255) {
 		/* Update byte map and enable slot */
 		bytes_map[reg] = value;
-- 
2.7.4

