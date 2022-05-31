Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 62502539056
	for <lists+alsa-devel@lfdr.de>; Tue, 31 May 2022 14:08:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BF6AE1B5A;
	Tue, 31 May 2022 14:08:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BF6AE1B5A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653998930;
	bh=Nsy7oBCFtKprDZnTt/xtXREX0caGkhFXifAML7ad6t8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ZwbCU+Mb4Xyhm0ngfGrDdvxK+3QEwGxmTv4g840j8bqTezSX2OeohIkiHdeaetHwK
	 KjCXBr37OjFhQqTgRlYs03NOFv6YTiLM39eZGA10Jsg4I21ZOwsSUFp36rk47KopnT
	 sz1s16eS2q2tlLSX/hkfeSIkkpBwFWfVN+kiwY4E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 10469F80129;
	Tue, 31 May 2022 14:07:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AFEFBF80161; Tue, 31 May 2022 14:07:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20602.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e89::602])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AD582F8012C
 for <alsa-devel@alsa-project.org>; Tue, 31 May 2022 14:07:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AD582F8012C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="yI/mIkQz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IS+QDQZS5H8132EkIGu0EPmVC8FaU29XrvtP7Y+L6BOoILaUkCHoYEFQ920qtyJc0kDsjwafHEl61nqpMcIefyPNbre4glpN5D9J9wBneNU+GvH3oIPwKmTOVm5RuH9YXenMBo+vtkc+uSrJpbuAUOPSE4WdoXSN/thOggWaxN4DV+MJ8RrjN62y7K1d4MPuKSgpYUyqDTTvhduwnTxgYaloOrSg91yBHk+6cJQw8FPcUj36g2hiU9nJYZQ61Ur1SnYUPcSA9JkgXh8X/CkqIwS2ysM2Wb/avUkWjpTb5sP9MQ4zgtWQM+TX9D7OR6Bm3jqBiW01R2JOMlNPHePV/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iO0h/n3oLjJUmXVCH/o0fibelBw8fZiihxq02eKuDBs=;
 b=SNEJbJ9Us8TJOAXsC4OOFlDa+F38OLnEhaEBQmEzuwgA0QpM1i8fHHSlfN8nYk3pYDsbiUgQ79IsgWt50wIlAPOhC9sgJyPd8Dr8e/M5slRrHndVRAsc5ctQzgpGVcGLoDVX4fP4R/USPJkzd0hw/TaaSCujB7Qjt8eGVUMUp2MICZizPw9BDOHxHg41zSzjT0wLtoMAubbl0W54XfLn0o4nqQeK05fSkQgs5OiMZdV/+qA553LGmUEoW33HR+U5r/lPS6v4mhUGRtH3xULBvwKA1YTCXVZXrXt7q5Rhk4TXXeHT9PjDpRA3mQB4RRIHqV7h8r30l4d4kNgxqsGkpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iO0h/n3oLjJUmXVCH/o0fibelBw8fZiihxq02eKuDBs=;
 b=yI/mIkQzVelw+TK85t5EkicvdezvXjHpQsgKaEc0Uq3KTVInjioa2/9ExhmEwuFT0iGsUgheAehgHLo5YZ5mFbqkPvPf0sLgpe2JF0NKLLmYcCDbO05Rlnj0A3XcDRUTfHSEV+MKEz+cSDyLgRhsLvOV7hlhs43jG2//z3k2vrA=
Received: from BN8PR15CA0012.namprd15.prod.outlook.com (2603:10b6:408:c0::25)
 by DM5PR12MB1708.namprd12.prod.outlook.com (2603:10b6:3:10e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Tue, 31 May
 2022 12:07:41 +0000
Received: from BN8NAM11FT054.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:c0:cafe::cf) by BN8PR15CA0012.outlook.office365.com
 (2603:10b6:408:c0::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.19 via Frontend
 Transport; Tue, 31 May 2022 12:07:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT054.mail.protection.outlook.com (10.13.177.102) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5293.13 via Frontend Transport; Tue, 31 May 2022 12:07:41 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Tue, 31 May
 2022 07:07:40 -0500
Received: from sof-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.28
 via Frontend Transport; Tue, 31 May 2022 07:07:38 -0500
From: V sujith kumar Reddy <Vsujithkumar.Reddy@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH v5 0/2]Add Machine driver support for nau8825,
 max98560 and rt5682s, rt1019
Date: Tue, 31 May 2022 17:38:10 +0530
Message-ID: <20220531120813.47116-1-Vsujithkumar.Reddy@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 26b78df7-6bf6-4fdc-ce28-08da42fe29a9
X-MS-TrafficTypeDiagnostic: DM5PR12MB1708:EE_
X-Microsoft-Antispam-PRVS: <DM5PR12MB17083646E79D46287896781C92DC9@DM5PR12MB1708.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +DKw1LL7fUxsXprGAktBIX4UaOC/ga/vrvwnRwXmfq5cRWdmqO4n5SODCQWwMBniJpjOWMhqKwvCnADly7la3axn9A43qRxjawa+ZQYhMMhsGAU/ogatzrwPaBV3vgElh7m85I4wYJ1iRhwh0uXsHQ1IW7jHpJ50gRCFfPfro5Xvugl5r1XQLPgV1/lN7DeZ4es5P7EjChmJpN0eUFVgzkJtQrOcy1xb9z1smtCBW5EtAlZJMFbAO7DXQnfWdLMC1QS/dhiFCoiAqYZa9V1R/qll5YxkShRxn1w4THthq+VAfpwmFv8gxDqxtw4jr5LrChk3qDW318sMNz9WQJqZ+7qZBuDExhTiYuuBR8wNa6BbmR0QNQNGa2fXssH9Kwbd0+AoSgCp3FQytmcyKulaEIgddJUPSSqBQOeXHedtq9XJ/xBjajrNAxjEaX4vzU5AGAjPMUR5DrJ0MmK0QV6hTZpTK68NtCQoUdipuucIx0Knc2pBo/B0KBDAM3VOjkRBrin6T07aHo+4vJS4GaD761SytnAGv01WYwsIiOFxLguRZJP8ROibdYIb5JOO2yy8js+9dDiYX5B3vZ//QGSRdR3t3nHC01xwY8VkeNykNxWwTu/WGdXFcWCP0IHb4+bD2rQJf2qehDBN4jV/rRG8KjR9jh21D+4cmo4OX396CfTFoB6L1wee7wojeV0GhbJW5+eVMxeJ9ANW9O1zyyQq9UM4mNJRsn4D8FetGDb/gD91Z0kUlEBalqwx96R2GlGraD8l18jzz7NlDRNr8NDdckG57THHti1mpPzMmk+bH9E5K/lSjrfXZIV3X0yzSQdxlRKPHmbxT7qV54ir9yaHxQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(36860700001)(8936002)(356005)(316002)(2616005)(26005)(508600001)(8676002)(70586007)(4326008)(70206006)(83380400001)(5660300002)(7696005)(1076003)(186003)(40460700003)(47076005)(426003)(336012)(86362001)(81166007)(110136005)(6666004)(2906002)(54906003)(36756003)(82310400005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2022 12:07:41.3685 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 26b78df7-6bf6-4fdc-ce28-08da42fe29a9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT054.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1708
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

v4 --> v5:
Resolved:
. Used separate firmware files.
. Deleted useless initialization variables

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
 sound/soc/amd/acp/acp-mach-common.c | 233 ++++++++++++++++++++++++++--
 sound/soc/amd/acp/acp-mach.h        |   3 +
 sound/soc/amd/acp/acp-sof-mach.c    |  30 ++++
 sound/soc/amd/mach-config.h         |   1 +
 6 files changed, 282 insertions(+), 16 deletions(-)

-- 
2.25.1

