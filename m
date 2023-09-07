Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 72F6C797062
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Sep 2023 08:57:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B0373886;
	Thu,  7 Sep 2023 08:56:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B0373886
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694069831;
	bh=nr4I42pEYdT0llEuWIkizXUP5VXa8Fe1y1Pqr5K2v4I=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=PShxgSD0LsafaiTUdHU7AREbZM6Tm6ccr27rXAVy2e5Nx12A9xrf5IJ24va/fT7gH
	 23mdU1KdPBCYAEbUvHJmaqut2zk7BugD8S+bRnKFLwm2MFlbsrWqom9ooWk/lafebT
	 o7IE6agsqn54zOgAj1QttJ4xelOAagIAl9hOmsLE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DDA50F80527; Thu,  7 Sep 2023 08:55:54 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 674F6F80527;
	Thu,  7 Sep 2023 08:55:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7B06EF804F3; Thu,  7 Sep 2023 08:53:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2062a.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5b::62a])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B4DD9F80494
	for <alsa-devel@alsa-project.org>; Thu,  7 Sep 2023 08:53:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B4DD9F80494
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256
 header.s=selector2 header.b=BPGQ+0QC
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j9lRV6oVBZS/mRvBxl4OBaXLKkxCoftKQgrptXT17vxdI0UFqjnkKqPV5OXv9SBpmgPTGU5trxtkqw7NQ3EftoM8aD6DiRNIHPcpQZAYAUGLn9EYJK5XELILpJmap5DQTHDkuRAiyCmCwnoUz+HZVPrCD90JCzRjZhgzolTC0+/Gd7yzLyOeF/nozlQM9YXNv+sB17PHMyviLRpKnzNP6xCrauNInOkJF9+g3R1KuxwwSZ0oczNTT6+3pFK97pKVaPWwPgt1JI6qwYeNozMizgOzLvfvAFIfmsXWrN9I7nUOPQ3xnmF4/n26l23Fa+8vJZ9ZhePnIDW7JJji0ADGxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ebOE/zjW9GGAjv5RxHROWc6oen2fedyGFfkAkpTfTTA=;
 b=FL+u57foV9phBzYLugTH+MqgPOoDD6ubwhDtAVl6tAdZoKdCkFamzXHTuViuaQO1uqfhm1TvZUHNDux0aeMF28+NVgqwp8Vp47Eg44+nsqINiTJeSX+8DYncnld2CNmvScyxWL6ASQ0rqkYS9wsQ4I9wLF8Z356VbNGmzDibTXGiUPjLiZ+bWb0FuxZ4bSm4nH+CPIHpaJrtwomQ/kZoVWobHPB2X9ShWX9K+cds78BBq7auEZw/2C8FQjgNdTlABIegPNJ4BRMU81mliDLX34SoRMVBulT+JKZdJg4W5si92rdb9nNJWIVkwwPAyqOJButRGeLvJ0ORt6d6eejoAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ebOE/zjW9GGAjv5RxHROWc6oen2fedyGFfkAkpTfTTA=;
 b=BPGQ+0QCKZL0nZG1VvLD+pXJIm764Wjca39OEyDn2DdZFdsdgL9q0XNyfn4cQ/kFmeOa7KyVi/FrXgFvRURs3ui3+Q9vl7vRy0meTD79gm7cKrFzCV2B8iY1mwWGtCdl3huFKycCXKPk1+MhfkSOdnn/BXG2uOkv5f6My/Zn1CKl6Cn+C0U5Xl2tu3rLlOri2gWneGwJN/8mih1Y1W/7jgZf8+Pn2h5bl1mEy3I61MLKTtRgjdE4sdIlyPRaJifADjkyX0qTpTV4b9x4G1UbkecUG1lpeEroL/n+xiddiQeSygnnv6n3tJw10VEjVqplPH85NItuFmtzphDBOhpSmQ==
Received: from BL6PEPF0001641F.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:22e:400:0:1004:0:f) by MW3PR12MB4474.namprd12.prod.outlook.com
 (2603:10b6:303:2e::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.34; Thu, 7 Sep
 2023 06:53:16 +0000
Received: from BL02EPF0001A108.namprd05.prod.outlook.com
 (2a01:111:f403:c922::1) by BL6PEPF0001641F.outlook.office365.com
 (2603:1036:903:4::a) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.33 via Frontend
 Transport; Thu, 7 Sep 2023 06:53:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BL02EPF0001A108.mail.protection.outlook.com (10.167.241.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6768.25 via Frontend Transport; Thu, 7 Sep 2023 06:53:16 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.5; Wed, 6 Sep 2023
 23:53:01 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.37; Wed, 6 Sep 2023
 23:53:01 -0700
Received: from audio.nvidia.com (10.127.8.10) by mail.nvidia.com (10.129.68.8)
 with Microsoft SMTP Server id 15.2.986.37 via Frontend Transport; Wed, 6 Sep
 2023 23:52:58 -0700
From: Sameer Pujar <spujar@nvidia.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <perex@perex.cz>,
	<tiwai@suse.com>
CC: <thierry.reding@gmail.com>, <jonathanh@nvidia.com>, <spujar@nvidia.com>,
	<alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>
Subject: [PATCH 1/2] ASoC: soc-utils: Export snd_soc_dai_is_dummy() symbol
Date: Thu, 7 Sep 2023 12:22:12 +0530
Message-ID: <1694069533-7832-2-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1694069533-7832-1-git-send-email-spujar@nvidia.com>
References: <1694069533-7832-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A108:EE_|MW3PR12MB4474:EE_
X-MS-Office365-Filtering-Correlation-Id: dd191d4c-9690-467d-39ff-08dbaf6f1d01
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	quyL6qMFJNkuBnISuFjqRGf5qyKjIvakNb/jvj4+tWmM3rMN1LrkKwyr76fT06SHBs7AWlLwYYZzUC7r6vwwauNn7aDjDQeVnJ+j7SK4oLgA9SCjiUHAS0VkABqp4RmY6tsrpDBsnACjr5E/ZPMjxanwZXK7ZkJBcBirzhif7+9vmGNdCVcO49goK+Zz8Qem5uZCXO5uPQsjwp/FF05zabKzZDDrgWQEbloPtKY3qaC66IQ+tBZbg8bhN4xnsbmsjTLEXWPYvKcrlEZrQ9RU406FejKQHZwrfSqSDoRdmwf/9F0Az0AHzWLlG5Kz6/GnNgeFQxrXG+6Ytk5ypOKQCsKWNj3M6r7XzF3w4MV6jFnGUpKJRtxmi2zoQxVPHfZJsauFl+X1fGI/SWk2adDjIA6Ej7KVL5ymm8y2+Ll1rCdmWF5ROsb6kgB+dJSBbc7n4RhP2x+wVl+AtQ3bDnNlyWIDdKdkq6MD2Li2BhiR6yknbb6EUjBY09vpkNsWRS8ZVR+Uhn9DUpKz4aq2FizhqVApOjdmVX3AbuqkSDfsJNCXRiWTZZ8VYDhVLLGsaSwhH64Yh10SHJRiZWSQPDxwQGEywn0og1lj71iNyeTdVDLzfH3SZqAuKHK0zcy3rFgmUHPjgSEtllz9rYVYlzg9LmQhVSzwqAYfX8geaZ0XVXH/4gXoCvRH4G4/WGAoXqoHvS2PjisVb8WDR7oVlh5rPUg0NVDwh8pJM9DQWaLZbc4=
X-Forefront-Antispam-Report: 
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(396003)(39860400002)(136003)(376002)(346002)(186009)(451199024)(1800799009)(82310400011)(40470700004)(36840700001)(46966006)(36756003)(316002)(2906002)(41300700001)(4744005)(40460700003)(82740400003)(86362001)(40480700001)(356005)(5660300002)(7636003)(2616005)(36860700001)(426003)(8936002)(4326008)(8676002)(47076005)(26005)(336012)(7696005)(6666004)(54906003)(478600001)(70206006)(70586007)(110136005);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2023 06:53:16.3876
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 dd191d4c-9690-467d-39ff-08dbaf6f1d01
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL02EPF0001A108.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4474
Message-ID-Hash: ARWXUQEVH2V7AXETTETX35IZTHRFECHO
X-Message-ID-Hash: ARWXUQEVH2V7AXETTETX35IZTHRFECHO
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ARWXUQEVH2V7AXETTETX35IZTHRFECHO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Export symbol snd_soc_dai_is_dummy() for usage outside core driver
modules. This is required by Tegra ASoC machine driver.

Signed-off-by: Sameer Pujar <spujar@nvidia.com>
---
 sound/soc/soc-utils.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/soc-utils.c b/sound/soc/soc-utils.c
index 11607c5f5d5a..9c746e4edef7 100644
--- a/sound/soc/soc-utils.c
+++ b/sound/soc/soc-utils.c
@@ -217,6 +217,7 @@ int snd_soc_dai_is_dummy(struct snd_soc_dai *dai)
 		return 1;
 	return 0;
 }
+EXPORT_SYMBOL_GPL(snd_soc_dai_is_dummy);
 
 int snd_soc_component_is_dummy(struct snd_soc_component *component)
 {
-- 
2.17.1

