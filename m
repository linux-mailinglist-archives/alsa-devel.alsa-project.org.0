Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F41C72E41D
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Jun 2023 15:30:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4ECB8E73;
	Tue, 13 Jun 2023 15:29:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4ECB8E73
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686663009;
	bh=2dgO6aOYmED13N2sr0Qd1XFANwhQLDifQhtAECMMgCY=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=rosOwVuyxReQjknl9Djg6rqbcLsBD/ZpxahtT9BNqWOtaH6MStZU5Y0Py8TedE6bM
	 IGVzz0IgcZQQktlrnI1BGSrXcHm9F0MzqOWShqdimvytiPzJkQvgjTcIOeFjCCB63w
	 i4zH9OMgzRJtk8qaYzne9YR5P1smG5h0lTxVeBCw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CF7CFF8055C; Tue, 13 Jun 2023 15:29:07 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4731DF80563;
	Tue, 13 Jun 2023 15:29:07 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BF800F80149; Tue, 13 Jun 2023 14:28:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=DATE_IN_FUTURE_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eae::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5327BF800ED
	for <alsa-devel@alsa-project.org>; Tue, 13 Jun 2023 14:28:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5327BF800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=Kg59ikpA
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ivoDcP2yxX+hJwW9R96/LRrhEdoRyonlHaiJ6/4/6dVok03fCvKtqBKgNafUvETDajuz+kNdZghje8GVpV3C9+w1yqMfNTJipkXxR8N4mlUsyyZCpETqTMu43EcLsPhzqrrzadX+pcZeRvWISlcl+ZjuKEfzUBfRdBK07dlbqWqrTssrMN8veTzf+v58B5V6joDkUhRdCfeYXUmrYxQ2jOKOOmQUhRiKR4q85+opF0BQG8ejPaOK01kGVDYJ6D0VBig3gJRcaA/nbiP/1dCNivx/ozkoGjbWQdgkjBud/9y/MrBp0atZJkkrkCdmFKJcTuJU/Jm1lZWXgj7Hve5lCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hO2JSQyz6gRmMoZGHNyD60VEPB42Wq/pL3MpoRi4GeQ=;
 b=Y0pVttY/3IAzMRSFC3go/KKDoiubQx8TsBqYQhfQSPkRnfsZghGfcBabI4zOhzoFzMmgSglmiSMtnlqjjFSufRy+KDCVvdn15c8BbYGCVlTeKAJiCCOqgf1hVU4khIzA3zCuA2H1MrIaapKZAP532/gxXaBpQrbiqnWHonpmNMnejqAOAwn/IMwboo/3TZW9nFafcfwnga1rVPNoMLIkdSzOIqK3ZoiL4J2cvjz5rm6dc11WAtpsDgSA0tP7Rt/rUbrpaZV5nVN8Y8Ce7/+lk8GuqXHyFCaePWmkLAJrVUrg+RPNElrPJEGhpAFFvg6zUXVe2F1RQ7OXGipYk2F6Cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hO2JSQyz6gRmMoZGHNyD60VEPB42Wq/pL3MpoRi4GeQ=;
 b=Kg59ikpAnnjwkhcq2KQB8TnP2d/50PxtOl0e/Dyeo9zVG0umD9cNx7Bknyz4UfrDfDMp2li46nWyZ70syupWbAFYTCxAjAP765LjxO549VrmmH7jjoaz0yfCXZX5Vi1aE9RhJN1VLlzG321i4P+t8UtdVdAigQXR/9SOyYBovL0=
Received: from BN9PR03CA0367.namprd03.prod.outlook.com (2603:10b6:408:f7::12)
 by IA0PR12MB8839.namprd12.prod.outlook.com (2603:10b6:208:493::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Tue, 13 Jun
 2023 12:28:00 +0000
Received: from BN8NAM11FT018.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:f7:cafe::7d) by BN9PR03CA0367.outlook.office365.com
 (2603:10b6:408:f7::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.35 via Frontend
 Transport; Tue, 13 Jun 2023 12:28:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT018.mail.protection.outlook.com (10.13.176.89) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6500.23 via Frontend Transport; Tue, 13 Jun 2023 12:28:00 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Tue, 13 Jun
 2023 07:27:59 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Tue, 13 Jun
 2023 05:27:54 -0700
Received: from amd-Z390-D.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.23 via Frontend
 Transport; Tue, 13 Jun 2023 07:27:44 -0500
From: Arun Gopal Kondaveeti <arungopal.kondaveeti@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
CC: <vsujithkumar.reddy@amd.com>, <Vijendar.Mukunda@amd.com>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<syed.sabakareem@amd.com>, <mastan.katragadda@amd.com>,
	<arungopal.kondaveeti@amd.com>, Liam Girdwood <lgirdwood@gmail.com>, Jaroslav
 Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, "Syed Saba Kareem"
	<Syed.SabaKareem@amd.com>, =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?=
	<u.kleine-koenig@pengutronix.de>, Mario Limonciello
	<mario.limonciello@amd.com>, Nicolas Ferre <nicolas.ferre@microchip.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>, open list
	<linux-kernel@vger.kernel.org>
Subject: [PATCH] ASoC: amd: correct pm_runtime enable sequence
Date: Wed, 14 Jun 2023 06:01:59 +0530
Message-ID: <20230614003206.933147-1-arungopal.kondaveeti@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT018:EE_|IA0PR12MB8839:EE_
X-MS-Office365-Filtering-Correlation-Id: d94dff17-cc43-40d2-e5f0-08db6c09a063
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	4Gbd8KEQr3lLZii1FYZyJEYdNYYL7fhZdzGdBQKR/DmJKWKecCB/TORqzgzFthy60rwiJOW3kS+CSAqKvi12mGP/zP06oF0MbYeBqvxPkRMuS8LZOXdVwbdFCEWkYHLDy3jjWNXAgQoOUIoHKYJzv4BJ9Q9ma30TsiAjCgeRbPJAEIWkvNjkz/W4siFsD59NzaJyZVeICbddX2DFt3GiwWJg1Nx+u3OQbf5rX3qTQdI4Ql5VGY1Id5jxZOOHVJSJqPw9IlAuikPEJG2MC7HVWMwppKMJeTrlrscp0EVwnn+g7d+2qDqr7KqmsVjegSjcsI8lBTXhWhWgklE8fP2Vv7ehFdxEDqjVlSoPlSmAPScCXzz5sH57t11fR7oNP9IfgLYFw4zPhDxELeia5vHLl4RVI+LTSgtFbVneLFC93X3b4Smp2KeyWPpfn57+sm34SbM/MDVQ/cx1PaaPq+IM7aJqdIUNVV75n0okXBRKXpLKACsSbX4xb5pzhPC/MRHtKoKIudcKBqIRB0xWXL7whUwqZgzHuS02//lI5kWHcXN2GvWghrXW7230SpBpIvfXwO7A5kBa3cyafz+1oU36vpqjPS2T1R/x0g7e+K48ZrTR+eSLY3TxH3e1d/6EaVdxIUa5nb9NRwhs+lHfSpOP8KuAXX453ZFnMgpQQakl5K+apgiYzhULDxw+lDBKaoWA634FJjNqsy5S2X5YglkJuWBJqPU8giCG2WVAwr7b6FwIAhWe4JUODYlPUzOku3RfZDcnwvAySX9ZLbkrfQex2w==
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(346002)(39860400002)(376002)(396003)(136003)(451199021)(46966006)(36840700001)(40470700004)(6666004)(7696005)(36756003)(36860700001)(186003)(82310400005)(2616005)(40480700001)(86362001)(426003)(83380400001)(47076005)(356005)(81166007)(82740400003)(26005)(1076003)(336012)(40460700003)(41300700001)(5660300002)(316002)(8676002)(2906002)(110136005)(54906003)(478600001)(8936002)(70586007)(70206006)(4326008)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2023 12:28:00.3995
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 d94dff17-cc43-40d2-e5f0-08db6c09a063
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN8NAM11FT018.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8839
X-MailFrom: Arungopal.kondaveeti@amd.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 2T33W7DKITJSMM4CZ4C3ZI2FJ2VEGZEE
X-Message-ID-Hash: 2T33W7DKITJSMM4CZ4C3ZI2FJ2VEGZEE
X-Mailman-Approved-At: Tue, 13 Jun 2023 13:29:02 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2T33W7DKITJSMM4CZ4C3ZI2FJ2VEGZEE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Replace pm_runtime_allow() with pm_runtime_mark_last_busy()
& pm_runtime_set_active() in pm_runtime enable sequence for
dma drivers.

Signed-off-by: Arun Gopal <arungopal.kondaveeti@amd.com>
---
 sound/soc/amd/ps/ps-pdm-dma.c         | 3 ++-
 sound/soc/amd/raven/acp3x-pcm-dma.c   | 3 ++-
 sound/soc/amd/renoir/acp3x-pdm-dma.c  | 3 ++-
 sound/soc/amd/vangogh/acp5x-pcm-dma.c | 4 ++--
 sound/soc/amd/yc/acp6x-pdm-dma.c      | 3 ++-
 5 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/sound/soc/amd/ps/ps-pdm-dma.c b/sound/soc/amd/ps/ps-pdm-dma.c
index bdbbb797c74d..d48f7c5af289 100644
--- a/sound/soc/amd/ps/ps-pdm-dma.c
+++ b/sound/soc/amd/ps/ps-pdm-dma.c
@@ -391,8 +391,9 @@ static int acp63_pdm_audio_probe(struct platform_device *pdev)
 	}
 	pm_runtime_set_autosuspend_delay(&pdev->dev, ACP_SUSPEND_DELAY_MS);
 	pm_runtime_use_autosuspend(&pdev->dev);
+	pm_runtime_mark_last_busy(&pdev->dev);
+	pm_runtime_set_active(&pdev->dev);
 	pm_runtime_enable(&pdev->dev);
-	pm_runtime_allow(&pdev->dev);
 	return 0;
 }
 
diff --git a/sound/soc/amd/raven/acp3x-pcm-dma.c b/sound/soc/amd/raven/acp3x-pcm-dma.c
index 7362dd15ad30..9538f3ffc5d9 100644
--- a/sound/soc/amd/raven/acp3x-pcm-dma.c
+++ b/sound/soc/amd/raven/acp3x-pcm-dma.c
@@ -416,8 +416,9 @@ static int acp3x_audio_probe(struct platform_device *pdev)
 
 	pm_runtime_set_autosuspend_delay(&pdev->dev, 2000);
 	pm_runtime_use_autosuspend(&pdev->dev);
+	pm_runtime_mark_last_busy(&pdev->dev);
+	pm_runtime_set_active(&pdev->dev);
 	pm_runtime_enable(&pdev->dev);
-	pm_runtime_allow(&pdev->dev);
 	return 0;
 }
 
diff --git a/sound/soc/amd/renoir/acp3x-pdm-dma.c b/sound/soc/amd/renoir/acp3x-pdm-dma.c
index 4e299f96521f..c3b47e9bd239 100644
--- a/sound/soc/amd/renoir/acp3x-pdm-dma.c
+++ b/sound/soc/amd/renoir/acp3x-pdm-dma.c
@@ -430,8 +430,9 @@ static int acp_pdm_audio_probe(struct platform_device *pdev)
 	}
 	pm_runtime_set_autosuspend_delay(&pdev->dev, ACP_SUSPEND_DELAY_MS);
 	pm_runtime_use_autosuspend(&pdev->dev);
+	pm_runtime_mark_last_busy(&pdev->dev);
+	pm_runtime_set_active(&pdev->dev);
 	pm_runtime_enable(&pdev->dev);
-	pm_runtime_allow(&pdev->dev);
 	return 0;
 }
 
diff --git a/sound/soc/amd/vangogh/acp5x-pcm-dma.c b/sound/soc/amd/vangogh/acp5x-pcm-dma.c
index 29901ee4bfe3..587dec5bb33d 100644
--- a/sound/soc/amd/vangogh/acp5x-pcm-dma.c
+++ b/sound/soc/amd/vangogh/acp5x-pcm-dma.c
@@ -409,9 +409,9 @@ static int acp5x_audio_probe(struct platform_device *pdev)
 	}
 	pm_runtime_set_autosuspend_delay(&pdev->dev, 2000);
 	pm_runtime_use_autosuspend(&pdev->dev);
+	pm_runtime_mark_last_busy(&pdev->dev);
+	pm_runtime_set_active(&pdev->dev);
 	pm_runtime_enable(&pdev->dev);
-	pm_runtime_allow(&pdev->dev);
-
 	return 0;
 }
 
diff --git a/sound/soc/amd/yc/acp6x-pdm-dma.c b/sound/soc/amd/yc/acp6x-pdm-dma.c
index d818eba48546..72c4591e451b 100644
--- a/sound/soc/amd/yc/acp6x-pdm-dma.c
+++ b/sound/soc/amd/yc/acp6x-pdm-dma.c
@@ -383,8 +383,9 @@ static int acp6x_pdm_audio_probe(struct platform_device *pdev)
 	}
 	pm_runtime_set_autosuspend_delay(&pdev->dev, ACP_SUSPEND_DELAY_MS);
 	pm_runtime_use_autosuspend(&pdev->dev);
+	pm_runtime_mark_last_busy(&pdev->dev);
+	pm_runtime_set_active(&pdev->dev);
 	pm_runtime_enable(&pdev->dev);
-	pm_runtime_allow(&pdev->dev);
 	return 0;
 }
 
-- 
2.25.1

