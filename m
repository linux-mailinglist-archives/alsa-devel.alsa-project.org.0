Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ABDD1741FD3
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Jun 2023 07:22:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 176AD843;
	Thu, 29 Jun 2023 07:22:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 176AD843
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688016177;
	bh=ZoKj6bPmVpBZrGX3LFW4z/4u9Ps0Zh7DU20gNBGf9gA=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=DdZ/jo1WYzP8S8KZ1eLHRN5kEgrOP5Zeq1T1w8OT4HdAwh6SzPDCcGNQKEijc13H7
	 NQclDuyAoVIFDHeCS1K8sp4/R7ONtFrFHwzW5GUY+Vo5NFaGaDJLXeyMlPcDxUOKxu
	 ENMMVaH8zmTWrHMBIGgmQ6zkrYaivfpu0u/K7DC8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AFD00F8057B; Thu, 29 Jun 2023 07:21:17 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 464BCF8056F;
	Thu, 29 Jun 2023 07:21:17 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C83F8F8051E; Thu, 29 Jun 2023 07:14:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on20602.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eb2::602])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8FC5AF8027B
	for <alsa-devel@alsa-project.org>; Thu, 29 Jun 2023 07:13:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8FC5AF8027B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256
 header.s=selector2 header.b=birsNuk8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EZBHcXpKj1ugAuPzjfjhStSHIcu0sqX+NjdFE5TycJLVitJ4aS7VkB3LhG/o9NpLCXDK0ga9D/MtTOJ1MNgkBW4GRc6HkMb+2TjwxY9mP43wx0A4qWc8BYBQ+FtSXIXAbIEMCcxCYy0/dASSQk5yZ8JaSDYvtGWn7JzjrIrPgEJxItC8IEdjlcqrH3hdRyZhgn8quuktZVn2pEPtXZnaR7RWWIJ8FiQnN8ypokINbSnCT6xMWMPv0D/Zu9oHjQnq3OXFHioHq+MBe41613u+D+lgi+Ef9CB1RN63ZPMPMK5aC+iS5wQJOOE1sIYoFQjxHgvkW2fI4kK5yhNwhIkXVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KNQQEmVq13fEPOVIpt+X4qka1BkChiXFqG8zIYLtjOU=;
 b=CKWz9V1dFrWWtxHnUYvsADgGlaERLgxzp78iY8vt6MreAEq5g6xYvaWXFeCWfzUiFtc9S43KRhrOuZSLnPpgB8qwIH8D1BfKfsE5iOFIe2APqafOJZgYpFYCo5bzN4iBCTxpSQQtbr9pGzJ2dspD9M5r0QXhvsaNdYEtdn1Ew51QJrilwIQgZTd+a/IYYeqBURFQR2n0tF+IwFhS7K/6F1cDdzwQ1TKhLGwZWfdvQZH/haJqc8AaoA56y6uWu0UkcmBfPR2yHNL9WTf2sm91+RBHP1bsneakCSy9BufIpDwuu4IJDxhSsFw0dzaPMJ/AhRIUkLby2jV5mLIis+flEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KNQQEmVq13fEPOVIpt+X4qka1BkChiXFqG8zIYLtjOU=;
 b=birsNuk8aXmSpJUTT9J3WqGaPhFU9yKJHpaVDp2JwYUqvMuPQRNt98XM9dfOYRhk0eSLoeC4YyFBnNBwoLANYxmfvFpYkbCi7VqZrNcRxsYMldgjiQY03r4woZSDSzjXj2WPIc4vG/8RbMODFdE95n+WPajYJs3/PrlyGdeae9iFyr13G5LZGhBjJRpMZyfTF1BZKLqStolEIMNclwr8P0QF4nu6ZIJwfFJGzm4D/jSXxQ28JDxxAJ2mVrX2QT4cDomgAG1/2PzxPCPaRKKx15O3KtUBW/DEi9FP2qAeM20/Xhk3dpPLlTbKCA0ZRt+rhVcU7lkRsnoiZ+ck4Hf7Hw==
Received: from DM6PR13CA0066.namprd13.prod.outlook.com (2603:10b6:5:134::43)
 by CH3PR12MB9194.namprd12.prod.outlook.com (2603:10b6:610:19f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.23; Thu, 29 Jun
 2023 05:13:00 +0000
Received: from DM6NAM11FT021.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:134:cafe::4f) by DM6PR13CA0066.outlook.office365.com
 (2603:10b6:5:134::43) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.8 via Frontend
 Transport; Thu, 29 Jun 2023 05:13:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 DM6NAM11FT021.mail.protection.outlook.com (10.13.173.76) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6500.49 via Frontend Transport; Thu, 29 Jun 2023 05:13:00 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.5; Wed, 28 Jun 2023
 22:12:49 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.37; Wed, 28 Jun 2023 22:12:48 -0700
Received: from audio.nvidia.com (10.127.8.10) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server id 15.2.986.37 via Frontend
 Transport; Wed, 28 Jun 2023 22:12:44 -0700
From: Sameer Pujar <spujar@nvidia.com>
To: <broonie@kernel.org>, <robh+dt@kernel.org>, <krzk+dt@kernel.org>,
	<thierry.reding@gmail.com>, <lgirdwood@gmail.com>, <perex@perex.cz>,
	<tiwai@suse.com>
CC: <jonathanh@nvidia.com>, <mkumard@nvidia.com>, <sheetal@nvidia.com>,
	<spujar@nvidia.com>, <alsa-devel@alsa-project.org>,
	<devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <stable@vger.kernel.org>, Oder Chiou
	<oder_chiou@realtek.com>
Subject: [PATCH v2 3/5] ASoC: rt5640: Fix sleep in atomic context
Date: Thu, 29 Jun 2023 10:42:15 +0530
Message-ID: <1688015537-31682-4-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1688015537-31682-1-git-send-email-spujar@nvidia.com>
References: <1688015537-31682-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT021:EE_|CH3PR12MB9194:EE_
X-MS-Office365-Filtering-Correlation-Id: 76baee59-5565-4592-e672-08db785f820d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	sjkADh66RIFiSxXZi2Jv4io3wRVM0/lRa5aDMqWGngw9ZuKxxDB0Mw0smZ6LvXyy7hKgWmxKwbp2rz8LT/XexsuxUbAj7uGWDQ0IhaB8UwVCpUv23tdRNl85YXMCQf7zNQwShwGmPzeirDZzVEjyHE0DujVFOFtO/Ab1F1/Z6gynjbrQtKa99I9TirCWSiSBQJTc2dQxYcOu3ILSzUstxOOu8EtirmWgBp56He8ivlZz814hZ1qdNkpg1BYlRinmDRtAlmrdSNHM+GgnuTHkabNCvfwkMvZe9nMQvMVpyrW9pElVwnbiaw2bwn20iU5TSUS/GKeTQ8UHlzD6G7bIsJ7xEA4i5BwEdzKWl40l2qtu6yioG3M6cu5z/RbmezdspjF9KnX1JP7fND+KkoCMEr1sdAzbSMcboZHDZ6H37ZUfQ1BenB2mJQFOn5kYuvlVGzMZWbcM7MFp8Ctzeo/i9WEvu2uI6tG9dXKfTR/fNlIMI/ZJ+sGKoKGJoylZK2jQ+7RuPoDEdjnocDRoPaLVymWqCsqT7ukBQr+0SLgU/PSNX4IMQf8Pq39yhJcIQWmnko3Q0wZGGMON/5xjsRWH5lylk0pDeHQzNoxweh9ArQok9QOs+LgIK/qLyCZnsQ6Py9MyA8hRkcpzgXi0FKeuWGEdFFInfHPTW9aXm/xTBdN+mra5PD0zZSJd1EI1IEcu5bRHmTiBhWBm0pSRgYz6cohAHr23R93cfpoqFd+W8IpjOfp4sT0gmDFQuZUG4FtC
X-Forefront-Antispam-Report: 
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230028)(4636009)(376002)(39860400002)(396003)(136003)(346002)(451199021)(46966006)(40470700004)(36840700001)(82740400003)(356005)(47076005)(83380400001)(426003)(36756003)(36860700001)(86362001)(7636003)(478600001)(110136005)(54906003)(70586007)(7696005)(40460700003)(6666004)(2616005)(4326008)(41300700001)(70206006)(316002)(8936002)(8676002)(336012)(186003)(26005)(82310400005)(40480700001)(7416002)(5660300002)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2023 05:13:00.0670
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 76baee59-5565-4592-e672-08db785f820d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DM6NAM11FT021.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9194
Message-ID-Hash: XN4ZCA4YHIGGE4WOPBIRFYTCYTYNFSG5
X-Message-ID-Hash: XN4ZCA4YHIGGE4WOPBIRFYTCYTYNFSG5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XN4ZCA4YHIGGE4WOPBIRFYTCYTYNFSG5/>
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
 sound/soc/codecs/rt5640.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/rt5640.c b/sound/soc/codecs/rt5640.c
index 0ed4fa2..e24ed75 100644
--- a/sound/soc/codecs/rt5640.c
+++ b/sound/soc/codecs/rt5640.c
@@ -2567,9 +2567,10 @@ static void rt5640_enable_jack_detect(struct snd_soc_component *component,
 	if (jack_data && jack_data->use_platform_clock)
 		rt5640->use_platform_clock = jack_data->use_platform_clock;
 
-	ret = request_irq(rt5640->irq, rt5640_irq,
-			  IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING | IRQF_ONESHOT,
-			  "rt5640", rt5640);
+	ret = devm_request_threaded_irq(component->dev, rt5640->irq,
+					NULL, rt5640_irq,
+					IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING | IRQF_ONESHOT,
+					"rt5640", rt5640);
 	if (ret) {
 		dev_warn(component->dev, "Failed to reguest IRQ %d: %d\n", rt5640->irq, ret);
 		rt5640_disable_jack_detect(component);
@@ -2622,8 +2623,9 @@ static void rt5640_enable_hda_jack_detect(
 
 	rt5640->jack = jack;
 
-	ret = request_irq(rt5640->irq, rt5640_irq,
-			  IRQF_TRIGGER_RISING | IRQF_ONESHOT, "rt5640", rt5640);
+	ret = devm_request_threaded_irq(component->dev, rt5640->irq,
+					NULL, rt5640_irq, IRQF_TRIGGER_RISING | IRQF_ONESHOT,
+					"rt5640", rt5640);
 	if (ret) {
 		dev_warn(component->dev, "Failed to reguest IRQ %d: %d\n", rt5640->irq, ret);
 		rt5640->irq = -ENXIO;
-- 
2.7.4

