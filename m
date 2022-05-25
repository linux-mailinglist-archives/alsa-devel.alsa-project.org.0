Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DABCF5344F4
	for <lists+alsa-devel@lfdr.de>; Wed, 25 May 2022 22:34:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4915516B2;
	Wed, 25 May 2022 22:34:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4915516B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653510897;
	bh=r+jh9QLF50JzLq610Kle/x0n/wIar0krCFNUtbzi3x8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=HXJm8LN97dZqySGYEqg3RIFBJyvSsUz+xsFAtCskQhphSZLUf3Ia5eZEnV9cG+WlK
	 1tWFVX8GDbqd0HDSQcHX82vbeCDd4dOhcDiXuAMXhBprlP5QZUgihgYMNoyG61FXXj
	 95NzndORmdk3Xv0F7EpKKskYJAZq5Xoh4qkk2swI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B843EF801EC;
	Wed, 25 May 2022 22:33:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E6573F8016D; Wed, 25 May 2022 22:33:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2062c.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe59::62c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C3B6FF80116
 for <alsa-devel@alsa-project.org>; Wed, 25 May 2022 22:33:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C3B6FF80116
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="ODzsR5QX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QMV452TYVZR1JiOwmEoZSWrIKFq2hhfO3v7eB+VXLnTHt0vcgi81YadS9GeRcI1pI6qygyWM0Pcq/10eeL18jG9fMQNGujG2mPlD4JbU7rybPTJG9X2iAQt2FzKsU04rraKGAwwVG5FRiOs/sqiIbujxXIKEphb/ssg2dKi0bsn+XWm5KllYHJG5o7uDV7PvrxBvd7xZYDHRmwhHYMMmv4HGttEPTqmqF7z38J7edFy5DDkb6wlA+0otkVs+fC66TpMvZGUHRleCGrNjrnSKBTWjOpCYEN0NRaoZXHo2Rx6mFUmrvErj6ZqLZS6dDE3bT1DtRGx4WEetux+hsSskgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zMM43wsJc6c51a+kR/P3rCZJkpe0k5FeugA6SH8DjcE=;
 b=RbozBo1p6DrOgX63e8jKteq9v+umWm/4NuVYVant8+5s0aB5m5E5akE6jipj6ztlKYbHV4SOeFs5wMt87tbie5cNS24D2Jh6hTIB7mQgG1oHp29J2yt/RM4TNaimTDXjs6vLp7CP3VuExcjUVRnikiLldXbj1tsZSnlj+KVAQS5WC1V2f9fkSCyCxjCNsVa2X7fFMtgQIFLDhlRtVt8uHZVzxntR58M927tNa9CCJOjTvsNu/eQgWJ93J5oSV8/zSR0d+ipYMIz6XDXM3Q8Xv01fGdx18CRY5eAYOZ6fSDpfPe8cgEz76j8iTRJVHNma7IHtnlrq7ZKgMEq1Ex1usw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zMM43wsJc6c51a+kR/P3rCZJkpe0k5FeugA6SH8DjcE=;
 b=ODzsR5QXQivvHXH/+/pQmE+zsfjTQQsFcgm+LMsgqRid4gqhCBgPiPtLShr7uWWNnYZAKwEju94P62kYHCLztGFwLwXdF+4uXTK/hJ5m+TRiOEDlikdTU75eF59VJVmfef55BOZm02ZKl/sIH3aVgSK0P4xkAxeQ9GobzZT97bo=
Received: from BN9PR03CA0068.namprd03.prod.outlook.com (2603:10b6:408:fc::13)
 by BN8PR12MB3427.namprd12.prod.outlook.com (2603:10b6:408:62::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.19; Wed, 25 May
 2022 20:33:47 +0000
Received: from BN8NAM11FT021.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:fc:cafe::44) by BN9PR03CA0068.outlook.office365.com
 (2603:10b6:408:fc::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13 via Frontend
 Transport; Wed, 25 May 2022 20:33:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT021.mail.protection.outlook.com (10.13.177.114) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5293.13 via Frontend Transport; Wed, 25 May 2022 20:33:47 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 25 May
 2022 15:33:46 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 25 May
 2022 13:33:46 -0700
Received: from sof-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.24
 via Frontend Transport; Wed, 25 May 2022 15:33:44 -0500
From: V sujith kumar Reddy <Vsujithkumar.Reddy@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH v4 0/2] Add Machine driver support for nau8825,
 max98560 and rt5682s, rt1019
Date: Thu, 26 May 2022 02:04:12 +0530
Message-ID: <20220525203415.2227914-1-Vsujithkumar.Reddy@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e3376fd8-3315-4b11-eee5-08da3e8ddead
X-MS-TrafficTypeDiagnostic: BN8PR12MB3427:EE_
X-Microsoft-Antispam-PRVS: <BN8PR12MB342736374164372F2C7EC7E692D69@BN8PR12MB3427.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: h16y03Y283KufjagMtEFJfZ6U9AmxrbSAIEfHLVrX6/Ob0KQFwLK/Oyl+4WMVQq+FXzBJyGgo72VuvQJsuk5J2m5+2OWpmyGA3UbBSD01Kfw+mwCT8KKm/24U6QaNkDHi0uUBqFrNUPxdzY2H0WsFWqaTFp2cZGn14b+7vyENrIvzimdvT8+4hiNINnpUGxr0BI6z7dkqdyyJHemG09J+mJLZ9C3S3bbHb1KT4ea3ywIb9NqROnZOsWr8v7eLtXMQJYxFQBAeJAOw5MBvc35jgqWjF9CLjzosGavoUhEg9fbjCcYChT6eVTkXylgdwHdvteoKPmzCNeRpRCZolzUyRcLWIMkvllAFBQmqTDxM+gNBcxAvxhqCzab4g1A+NzTEppWXdJRiYNDiWDtNsbeKOHVDMPHscsSTZHKJVv0GeMi8Q7loIQ6Gneym/a+EZSqwqiLrKZywsx4gESSyZmix1gLLPlZ0YZMkq5+jP8YlebOaJraBj8tOlATGLY1y9t3sKCsW2W8uGGJU8XslemZSeRYgsFOGswp/mWy3W01+PF85prPT5TM0L4WXL/HMH5PhYnOISuVK7a5/afZI59ZLZ+ddYPQJY2ushEjK3Id8bYLCaHzrfVcNj3vOdCmUI/aXLC62sVoQ+IfehjEoFakwJBiFg2RDQQM2KtkI8V3PADaaIM+Ll67Ec+g4AXV0eW2GkY5CYlDqc1M3qOeh1W+gC2cOphH/WHU549lJ2OyGsuzMEsSn+qErA2DunNeXqj7QN1imuTzYpCFCAlEndvjHHlyfpd9auqssq4HFnXa/CpnyhxxkixZdssOCcuadSfYM7JWfb2dS3Dcfxf7rDkZAQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(2616005)(426003)(186003)(47076005)(6666004)(316002)(26005)(1076003)(336012)(8936002)(7696005)(2906002)(5660300002)(4326008)(8676002)(70586007)(86362001)(70206006)(81166007)(54906003)(82310400005)(36756003)(508600001)(110136005)(40460700003)(36860700001)(356005)(83380400001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2022 20:33:47.2973 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e3376fd8-3315-4b11-eee5-08da3e8ddead
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT021.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3427
Cc: V sujith kumar
 Reddy <Vsujithkumar.Reddy@amd.com>, Basavaraj.Hiregoudar@amd.com,
 Sunil-kumar.Dommati@amd.com, ajitkumar.pandey@amd.com,
 Vijendar.Mukunda@amd.com
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

This patch set depends on:
        --gpio patch
        --https://patchwork.kernel.org/project/alsa-devel/patch/20220516160619.17832-1-Vsujithkumar.Reddy@amd.com/
        --https://patchwork.kernel.org/project/alsa-devel/patch/20220516160619.17832-2-Vsujithkumar.Reddy@amd.com/

v3 --> v4:
Resolved:
. Assigning direct address without (void *) typecast.
. Used snd_soc_card_jack_new instead of snd_soc_card_jack_new_pins as per suggestion.

v2 --> v3:
Resolved  compilation error:

/build/stage/linux/sound/soc/amd/acp/acp-mach-common.c: In function ‘acp_card_nau8825_init’:
/build/stage/linux/sound/soc/amd/acp/acp-mach-common.c:479:15: error: too many arguments to function ‘snd_soc_card_jack_new’
  479 |         ret = snd_soc_card_jack_new(card, "Headset Jack",
      |               ^~~~~~~~~~~~~~~~~~~~~
In file included from /build/stage/linux/include/sound/soc.h:1362,
                 from /build/stage/linux/sound/soc/amd/acp/acp-mach-common.c:20:
/build/stage/linux/include/sound/soc-card.h:18:5: note: declared here
   18 | int snd_soc_card_jack_new(struct snd_soc_card *card, const char *id,

V sujith kumar Reddy (2):
  ASoC: amd: acp: Add support for nau8825 and max98360 card
  ASoC: amd: acp: Add support for rt5682s and rt1019 card with hs
    instance

 sound/soc/amd/acp-config.c          |  30 ++++
 sound/soc/amd/acp/Kconfig           |   1 +
 sound/soc/amd/acp/acp-mach-common.c | 235 ++++++++++++++++++++++++++--
 sound/soc/amd/acp/acp-mach.h        |   3 +
 sound/soc/amd/acp/acp-sof-mach.c    |  30 ++++
 sound/soc/amd/mach-config.h         |   1 +
 6 files changed, 283 insertions(+), 17 deletions(-)

-- 
2.25.1

