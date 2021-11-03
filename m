Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 220464442E1
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Nov 2021 14:56:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A81F41674;
	Wed,  3 Nov 2021 14:55:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A81F41674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635947765;
	bh=29UH+agiG+X5gC5QwxL1+UQGBRi57ixVPttfE4rnrvE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lfnBl3dCKKLl5vnax50P5J6cmFNIsHCHMdninWWRLV3f2hZDIrO4OpH4UXu1w531o
	 3GPryrZ5sFH22hMI5ODQkIYKiFczkfEXN1rOrJJcWV8z2FRDykdSMEtUZQXCOIAizy
	 KNsuHl6WaGGYWLbrCtNBxB9S6kgLS9+ZgYYOuNl4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F2639F80517;
	Wed,  3 Nov 2021 14:53:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1B6BDF804EB; Wed,  3 Nov 2021 14:53:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2054.outbound.protection.outlook.com [40.107.236.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 69409F80224
 for <alsa-devel@alsa-project.org>; Wed,  3 Nov 2021 14:52:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 69409F80224
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com
 header.b="B+WOfCG+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gt9B00QpDeDmeOjhJWvVzI5Rj+KwKEx1b9U48Nd6LgqwXSY0KWRQbwIYrHRLVofd5fzWEX1U3rw7Zq9xL9RVMDQ0lYfVEJZNRFKqCnRndVWt7ObKVZNQXfv5SjBIdCZJyR2FXscITIrFdxvwabkhTBO9SnQV/b1yCqVpAWGUKps7weD7HzSsZCogXl1NP5Yr/HYcf63atWl5bb2Psk5pmUILhYRHMZNme9nzmCVbYgC+XVmk/j8KGqHM4M9CCTrd4MhWMu3h9JuEJ/wztOiBKhhgAba0pj23nhOsYYRAU5Uut6lw1W8cWmGwmQDZ6ojl63Eappb0kkz7shmOdNEUug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=seKJXWAwKPt0HlTyQtw9cWNRWo8z3o3zV5fHVffk/V0=;
 b=RpvjCGrRLAEeXzJYvtTUOqLL3h2MsgMQVRWjXvc+zHX/ZZds93KkL/lkgoThfPJJi2VKhf5mFuRaUma5iymOBo6f/4Uek+4GDhvGF5MMGp2NfqFArmZ6huqe0QXBhO2vVRr6bU72xeJnXV718TBlQVK3Xz1cpx4lS+cZVUzg7xAxRrJ4VFwuagOTdKE6QB1BIMInjU2JmXFsGCWp3rlLWipdYYuiH0z5oZ/p5ALdNOP5TP+xK73bxHPmBv3tFSuQaomuIsmQ20B/bi9c9njuhVP0N18I9lqyjRzCRggWOtn5/uCrRUosUXrLFcMqx6WIfgGLr2TMC4wcu4wqFLeMQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.35) smtp.rcpttodomain=alsa-project.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=seKJXWAwKPt0HlTyQtw9cWNRWo8z3o3zV5fHVffk/V0=;
 b=B+WOfCG+i9qJJMjIcl3RPUsQAkdvxCqMJ/71TQS51cC/wb2ZCKtkhcHpTnpJd8jWzlWwqSF7LwQ2phURt7mDuV38Lid0WLZ5D/rxDYUSqFLcDeLuMc61q3N/fJV/AdgyCgSs693fXpfZUZ3pCjkQ4ODyJJufDZH7J4sHqA+Ash1JDReZRw0/JtHJzuFECtueSGHUlLYTRy6mXdxNWLLM5IC7clhzr3ouhB236yWvSD+dL8+oLd6KzazO2fCAGW9xHNHFaBHEhDwREOHmx1RU7zKJybQGjZA1QX5HtXCER/oNUeUB5YQQTE0hW4RZ3QB0f/OlkNOj/POMwOF/SxxV5w==
Received: from BN9PR03CA0711.namprd03.prod.outlook.com (2603:10b6:408:ef::26)
 by BL0PR12MB5538.namprd12.prod.outlook.com (2603:10b6:208:1c9::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11; Wed, 3 Nov
 2021 13:52:56 +0000
Received: from BN8NAM11FT042.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:ef:cafe::61) by BN9PR03CA0711.outlook.office365.com
 (2603:10b6:408:ef::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11 via Frontend
 Transport; Wed, 3 Nov 2021 13:52:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.35)
 smtp.mailfrom=nvidia.com; alsa-project.org; dkim=none (message not signed)
 header.d=none;alsa-project.org; dmarc=pass action=none
 header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.35 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.35; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.35) by
 BN8NAM11FT042.mail.protection.outlook.com (10.13.177.85) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4669.10 via Frontend Transport; Wed, 3 Nov 2021 13:52:56 +0000
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Wed, 3 Nov
 2021 13:52:55 +0000
Received: from audio.nvidia.com (172.20.187.6) by mail.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server id 15.0.1497.18 via Frontend
 Transport; Wed, 3 Nov 2021 06:52:52 -0700
From: Sameer Pujar <spujar@nvidia.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <perex@perex.cz>,
 <tiwai@suse.com>
Subject: [PATCH v2 05/10] ASoC: tegra: Fix kcontrol put callback in AHUB
Date: Wed, 3 Nov 2021 19:22:21 +0530
Message-ID: <1635947547-24391-6-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1635947547-24391-1-git-send-email-spujar@nvidia.com>
References: <1635947547-24391-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 146634ce-22d5-4c99-7ba4-08d99ed13d6f
X-MS-TrafficTypeDiagnostic: BL0PR12MB5538:
X-Microsoft-Antispam-PRVS: <BL0PR12MB5538F538F1F0741F1085D62CA78C9@BL0PR12MB5538.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 77myj5ntfHvOY7PJVPHLgxyB5sXjltjZswKprh3JsoCXxLgmNweg0UhAt0j7afilKZ6XEtEFDB6wtPo6kHhI8yk25zOhwZQ/K0ZuSoPiOXvdA+zB6MlM8Oe0S+KEYlTHg5zx4pn+bqb0Dwuqvj83A90EIu80rnsRrE5+72d2j70Riy6JBv48JLrGoyGNQ2Z6MgTrEOCpBYBPiIzgx/71NJ18b8Xmyphy/Gjsjs8ate5m/fIpGpxUnYSG3A8E9Iv9Ko0REtzEdJGA8hi2lQEbtXlIZNZ6jOOPxrC/28DIlBJ4+L6/b05tOgOCZdTwZ7YLPqkTCmLQd5Qn/yutFpU9YtK2e72x/i3KXgwqp+dic6+nA8UtHkTGi/XSQTBzAfI1zLOGAhelP2wo6fKtb3w6R3S4ruPeGpH7Ip5CFCWgpKbTXMyqjhYZrLxQNPkAP+JBPfrdloVdZNcI7ESD4/8eg4SYyKd4S6pimKqglpn5tdM393Jmj6oHsSB4shkLtLF6ebrwCoxIykqGlSkFlKSCT+I8lExlqZKV/NLmMqyV23xI4l99VHWPGePESrR7hSnfzFAJMMqYuKlUUEngFcdCg/H3hxrKvvQn9KeQESUi1piXZjpqgqVioHRkoRmOpfAdpKKRFKYo9+YkDOLVZBUaoKi5pxa2Mk5aj3T6n0h+EQAF+bCFC9W1aHUMglYLDU9/muKNK7Ol5+xme5GwOep6fA==
X-Forefront-Antispam-Report: CIP:216.228.112.35; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid04.nvidia.com; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(7636003)(4326008)(5660300002)(70206006)(508600001)(356005)(316002)(54906003)(110136005)(70586007)(2906002)(426003)(2616005)(336012)(36906005)(82310400003)(26005)(186003)(8936002)(8676002)(6666004)(36860700001)(47076005)(83380400001)(107886003)(7696005)(36756003)(86362001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2021 13:52:56.4206 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 146634ce-22d5-4c99-7ba4-08d99ed13d6f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.35];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT042.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB5538
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
the AHUB driver accordingly.

Fixes: 16e1bcc2caf4 ("ASoC: tegra: Add Tegra210 based AHUB driver")
Signed-off-by: Sameer Pujar <spujar@nvidia.com>
Suggested-by: Jaroslav Kysela <perex@perex.cz>
Suggested-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/tegra/tegra210_ahub.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/sound/soc/tegra/tegra210_ahub.c b/sound/soc/tegra/tegra210_ahub.c
index a1989ea..388b815 100644
--- a/sound/soc/tegra/tegra210_ahub.c
+++ b/sound/soc/tegra/tegra210_ahub.c
@@ -62,6 +62,7 @@ static int tegra_ahub_put_value_enum(struct snd_kcontrol *kctl,
 	unsigned int *item = uctl->value.enumerated.item;
 	unsigned int value = e->values[item[0]];
 	unsigned int i, bit_pos, reg_idx = 0, reg_val = 0;
+	int change = 0;
 
 	if (item[0] >= e->items)
 		return -EINVAL;
@@ -86,12 +87,14 @@ static int tegra_ahub_put_value_enum(struct snd_kcontrol *kctl,
 
 		/* Update widget power if state has changed */
 		if (snd_soc_component_test_bits(cmpnt, update[i].reg,
-						update[i].mask, update[i].val))
-			snd_soc_dapm_mux_update_power(dapm, kctl, item[0], e,
-						      &update[i]);
+						update[i].mask,
+						update[i].val))
+			change |= snd_soc_dapm_mux_update_power(dapm, kctl,
+								item[0], e,
+								&update[i]);
 	}
 
-	return 0;
+	return change;
 }
 
 static struct snd_soc_dai_driver tegra210_ahub_dais[] = {
-- 
2.7.4

