Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E35F739FB2
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Jun 2023 13:37:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 95B8983A;
	Thu, 22 Jun 2023 13:36:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 95B8983A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687433830;
	bh=XHe0OI2k+YnPSmuYyAoFyDfPInNgckuRyVQzMWgoZg4=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=MBwyAYJKoH11J1qyl0xwBqJmMwqKwLOVI9Nden0wuY6BNsBtQcpl68fyqnowlHROW
	 zs9nMytItd0SKeiw/lg6aI9wzrqGgJcmOORTUw5p4ygE5E/m8Sv+KfIdHAt/IYd60g
	 l0/ATJ/eBfmqvj9yLtXIYSrfAMSp5hTCrYRJeNDs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D28B5F805A9; Thu, 22 Jun 2023 13:35:13 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3F03EF80588;
	Thu, 22 Jun 2023 13:35:13 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9FE9CF8057B; Thu, 22 Jun 2023 13:35:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20629.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe59::629])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 894EEF80141
	for <alsa-devel@alsa-project.org>; Thu, 22 Jun 2023 13:35:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 894EEF80141
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256
 header.s=selector2 header.b=bh/2OjXV
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bTy19JQJyr9oIjqf5d+T0G3SuqvaFVI8tv6xdkk4X4fAqAORF3okv6jGJOFieNA1LSk/6yHYK+/Dg6YuN3X7yYs6uui+oUZpiFmjRnjWMSDtCAlHalOV/t1U/duliS5GjOgAqakiRAjw3QkO7P3ycp4d54YRLgK2Q5TU4kkOLNuFVf/OKMR8Fk9IhilgPCMa6Uzj2i+bYd5n5ybEtgfeUnIaQQr8Xd8aip/gkhYrhdMlQfsqe6kJR9L37RqjyS9557NMGExG9dKcDJrtvqlp7p1AZ4YhKdoaMtnVORcKEqDfHYqiLmn8RUjcnbjZT885ZqyeFsrg+Ura4H2eCNUszQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0AJsKlJH+Dy22u58HUR+dduYwlLJG94ezKMXHoJVwCE=;
 b=W8C2UzjBFHLR2FrzT4Ps+tGhdIFJyXHwMAleWcFgGIzjHoT6C3JunCVMx8q7OTmAExshaDB9F7L/9c6fmrGBFHhovTPY080n5PCjxDnwA684evQW7mTf6sYf3wEQY5eK1IsTIPUjaL2OZyza4ZkcWly8u0Dbn6xyOszNUXgREaEncIldrtpQfMpyfRo78KECDo1Ot6q0BBDCbcEa+dQeEtMPvE1VFdq5Bdrdt4rg5VjAT9aqHfgodmD5acSWVhJQzvBA9/AaTDtZDSenG/kbjRH+paeVUugA0k0rw+jhLghY2XqiOIdx6zIFTIe2IOohdUbpccOf7D/AEzz4w8kvgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0AJsKlJH+Dy22u58HUR+dduYwlLJG94ezKMXHoJVwCE=;
 b=bh/2OjXVl0dUQwgm0XEGCZD8p/bgYpZ0rIjNH9KJZL4M+0m9cI5n5nbuKWoafM/KzZ+kEeTHYTNgEn59znsA12IT5i0KsSP3qZFXKjhNmWXpF8vPrdlaRs7jvjRPTT825Vmb3RKpMxS/GMhA1Bc2M/stOGXoRQ8hGCdUP3gZSvB4YEue1ZG+k0n2vFZIb1f+cQAx/HtxdvKVD6zD+1o0eWZq5mbaXIDymca58KijcGmrP9RGbDaLhv2tOcFB0eeH1JjOMdNKKoIYMWn0scgqoRHHB2uCPJQ9ECsBXvFtGXU8andilNfmd6nisqSpi6/O+iU/TZCUIZyqwR1tU6LWww==
Received: from CY5PR18CA0007.namprd18.prod.outlook.com (2603:10b6:930:5::31)
 by CY8PR12MB8315.namprd12.prod.outlook.com (2603:10b6:930:7e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.23; Thu, 22 Jun
 2023 11:34:55 +0000
Received: from CY4PEPF0000E9CD.namprd03.prod.outlook.com
 (2603:10b6:930:5:cafe::f2) by CY5PR18CA0007.outlook.office365.com
 (2603:10b6:930:5::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24 via Frontend
 Transport; Thu, 22 Jun 2023 11:34:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CY4PEPF0000E9CD.mail.protection.outlook.com (10.167.241.140) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6521.24 via Frontend Transport; Thu, 22 Jun 2023 11:34:55 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.5; Thu, 22 Jun 2023
 04:34:42 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.37; Thu, 22 Jun
 2023 04:34:42 -0700
Received: from audio.nvidia.com (10.127.8.10) by mail.nvidia.com (10.129.68.9)
 with Microsoft SMTP Server id 15.2.986.37 via Frontend Transport; Thu, 22 Jun
 2023 04:34:38 -0700
From: Sameer Pujar <spujar@nvidia.com>
To: <broonie@kernel.org>, <robh+dt@kernel.org>, <krzk+dt@kernel.org>,
	<thierry.reding@gmail.com>, <lgirdwood@gmail.com>, <perex@perex.cz>,
	<tiwai@suse.com>
CC: <jonathanh@nvidia.com>, <mkumard@nvidia.com>, <sheetal@nvidia.com>,
	<alsa-devel@alsa-project.org>, <devicetree@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Sameer Pujar
	<spujar@nvidia.com>, <stable@vger.kernel.org>, Oder Chiou
	<oder_chiou@realtek.com>
Subject: [PATCH 4/8] ASoC: rt5640: Fix sleep in atomic context
Date: Thu, 22 Jun 2023 17:04:12 +0530
Message-ID: <1687433656-7892-5-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1687433656-7892-1-git-send-email-spujar@nvidia.com>
References: <1687433656-7892-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9CD:EE_|CY8PR12MB8315:EE_
X-MS-Office365-Filtering-Correlation-Id: f314db9b-fc5d-4a86-4b20-08db7314b3d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	wiKmyIRNphQMVcqitvmFJOc1cbrJbPdv3nR4i2XPolpJOOVI6AWvTODhbFRmIEBQcr2feLZUMRTtaOv7qGCVQuvc2JoDHiMkdv9KvytXn5xwjpd6vasdoYLAQCecTriJIV77x3boLWp0JHHnh9lqKjvPHwrS9ls+zi1fcDBBr4HbBKfVyK7v5I251ODSfUh3pAQV775vSuCrj+/1TcBS/Bmc8Tg7Vtb9yOJLUaQKV92UP3SP+LrTK34TMDicF4n69LbPoblL58Q5s6Y6519xcNXlWIuwX3j43BdT8VbAM3VSOijw/e3CTh0KU2+SBS61GZCfdTb74ECMF5wDL5lxhqzhZSfTNJsAKlkOkskp6NrMdhHUXdUKf+hxnYZouT74noEn/EJu9jzzVfC7ni+v7tsdOj28e6YbDM7GHKTaEJl3vk7eh7tJ1nY2R4U63DGJnmlV1CdqnSpWmFK6Qta68RMNPB0dppJqwwmcM+UA3vvWyT8m2D20Kw1DEw/8eOT/p/YqE+CrIwZMBX8DN6zcmMSFfBphGcUuSWBoEqORYVJqUH3mJYFEuFc/SZjpdP71AGVZyHw3jq7bo1MNXGjExWYsZbNxfwT+Nl3k3zzCEnCBCNGO84tSxRj2ZQwnSRYUjZrk9KsydMB7D7Oosm3RRbZxTE4bCkzT48LHHcH+pu/EE60FbfIdq4z77MaSHH0lo26ZKqEzqnmQamauxqFhi0vt4ZOQ0aahdVWYvg1nwukp5HrmA9gv6qrYmubtxI7i
X-Forefront-Antispam-Report: 
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(136003)(396003)(346002)(376002)(451199021)(46966006)(36840700001)(40470700004)(6666004)(7696005)(83380400001)(82310400005)(186003)(7636003)(356005)(40480700001)(36756003)(336012)(426003)(2616005)(47076005)(36860700001)(40460700003)(316002)(70206006)(4326008)(70586007)(2906002)(7416002)(8936002)(8676002)(26005)(86362001)(5660300002)(41300700001)(54906003)(110136005)(82740400003)(478600001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2023 11:34:55.5341
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 f314db9b-fc5d-4a86-4b20-08db7314b3d1
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000E9CD.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8315
Message-ID-Hash: EFVOMLASYVML2PRUC72OTLA7TDAQY5X7
X-Message-ID-Hash: EFVOMLASYVML2PRUC72OTLA7TDAQY5X7
X-MailFrom: spujar@nvidia.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EFVOMLASYVML2PRUC72OTLA7TDAQY5X7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Following prints are observed while testing audio on Jetson AGX Orin which
has onboard RT5640 audio codec:

  BUG: sleeping function called from invalid context at kernel/workqueue.c:3027
  in_atomic(): 1, irqs_disabled(): 128, non_block: 0, pid: 0, name: swapper/0
  preempt_count: 10001, expected: 0
  RCU nest depth: 0, expected: 0
  ------------[ cut here ]------------
  WARNING: CPU: 0 PID: 0 at kernel/irq/handle.c:159 __handle_irq_event_percpu+0x1e0/0x270
  ---[ end trace ad1c64905aac14a6 ]-

The IRQ handler rt5640_irq() runs in interrupt context and can sleep
during cancel_delayed_work_sync().

Fix this by running IRQ handler, rt5640_irq(), in thread context.
Hence replace request_irq() calls with devm_request_threaded_irq().

Fixes: 051dade34695 ("ASoC: rt5640: Fix the wrong state of JD1 and JD2")
Cc: stable@vger.kernel.org
Cc: Oder Chiou <oder_chiou@realtek.com>
Signed-off-by: Sameer Pujar <spujar@nvidia.com>
---
 sound/soc/codecs/rt5640.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/sound/soc/codecs/rt5640.c b/sound/soc/codecs/rt5640.c
index c7d2f31..a54d2bd 100644
--- a/sound/soc/codecs/rt5640.c
+++ b/sound/soc/codecs/rt5640.c
@@ -2552,9 +2552,11 @@ static void rt5640_enable_jack_detect(struct snd_soc_component *component,
 		rt5640->jd_gpio = jack_data->jd_gpio;
 		rt5640->jd_gpio_irq = gpiod_to_irq(rt5640->jd_gpio);
 
-		ret = request_irq(rt5640->jd_gpio_irq, rt5640_jd_gpio_irq,
-				  IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING,
-				  "rt5640-jd-gpio", rt5640);
+		ret = devm_request_threaded_irq(component->dev,
+				rt5640->jd_gpio_irq,
+				NULL, rt5640_jd_gpio_irq,
+				IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING,
+				"rt5640-jd-gpio", rt5640);
 		if (ret) {
 			dev_warn(component->dev, "Failed to request jd GPIO IRQ %d: %d\n",
 				 rt5640->jd_gpio_irq, ret);
@@ -2567,9 +2569,10 @@ static void rt5640_enable_jack_detect(struct snd_soc_component *component,
 	if (jack_data && jack_data->use_platform_clock)
 		rt5640->use_platform_clock = jack_data->use_platform_clock;
 
-	ret = request_irq(rt5640->irq, rt5640_irq,
-			  IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING | IRQF_ONESHOT,
-			  "rt5640", rt5640);
+	ret = devm_request_threaded_irq(component->dev, rt5640->irq,
+			NULL, rt5640_irq,
+			IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING | IRQF_ONESHOT,
+			"rt5640", rt5640);
 	if (ret) {
 		dev_warn(component->dev, "Failed to reguest IRQ %d: %d\n", rt5640->irq, ret);
 		rt5640_disable_jack_detect(component);
@@ -2622,8 +2625,9 @@ static void rt5640_enable_hda_jack_detect(
 
 	rt5640->jack = jack;
 
-	ret = request_irq(rt5640->irq, rt5640_irq,
-			  IRQF_TRIGGER_RISING | IRQF_ONESHOT, "rt5640", rt5640);
+	ret = devm_request_threaded_irq(component->dev, rt5640->irq,
+			NULL, rt5640_irq, IRQF_TRIGGER_RISING | IRQF_ONESHOT,
+			"rt5640", rt5640);
 	if (ret) {
 		dev_warn(component->dev, "Failed to reguest IRQ %d: %d\n", rt5640->irq, ret);
 		rt5640->irq = -ENXIO;
-- 
2.7.4

