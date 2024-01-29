Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 311CB83FDE1
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Jan 2024 06:56:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9F692822;
	Mon, 29 Jan 2024 06:55:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9F692822
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706507767;
	bh=f1N7OMg/ObUI6aHSHN7tSvPAIlDHTCIzfMjXVdVC0RU=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=KcxEWZu3YioyNUhjAqmi7+prqnzj4rkAMJRAfj/TbPDLHSU6JdIX5wf9bSf6Air8U
	 E2EqYpBNyqTlztPXQcFgd35fSnEfJxkhkxie4yYt0Slm+jbkLWDrqKNmz1gfE+YN/T
	 HAE4cs78vWxOrFz8RO9WS9n+W4HCjJ7fRcv6+HuE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E5941F805A9; Mon, 29 Jan 2024 06:55:36 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DC09DF80431;
	Mon, 29 Jan 2024 06:55:35 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C2B80F8055C; Mon, 29 Jan 2024 06:53:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2416::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A3AC7F800FB
	for <alsa-devel@alsa-project.org>; Mon, 29 Jan 2024 06:52:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A3AC7F800FB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=IsNP1x5e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cz9FTOFkDr+rzUazQOIXPQzTpHhXxhnca7KSUMAoK+Dn98U3Kfby12d6NdSsWPtLMHBGH4+usSGajJlCDnHKxZmmE8aaTfo7uc3PHxdDeqzXZUmc+i62nBL8DbcIo05ty+2pJmiJHPWNvU23Czyw+2m8AddS2clnJZXpPADCJL4C/wYpkuiLBv42/ctBSHRNVWo6myt8Gk65xXpQ0bxUiNrBDdf6e9Conmv31bjmB47R8FHPwyU/53pyX0ZWRQ+6QRPlNnurBM48j23IeqLrQJFGsMCLjaodkqtinSYiCSGaPSJ2LPeIGblwCLHQRyPEYT+tzrMYgnyPDRmYVR4T/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+X10LwCoVzVwctPr1s1M91WLO8zd326H92tdZ3BgsR8=;
 b=FR1ei9cW/L4THPodHknAkmfUZ2bo3nHZfPlm+3rtJZelc8JLvIWCKyIhQXe3KjoJa8Nalpa6muvZ3+miRtce+FHA/TdZRCK6Sl7oYWmIInXh858Mu0Sz0tHpK/Fsk9WEX5I1TvcagzOyraVcJzfYP5un+f/V+LzYlTuT+moLvBLMaVhMiTOSZA3HsVkRj8C2K1CpxmPE7ZvnLMSXGK9jcy3Pe2eLvPsmZYsaR0YqHgBIFth3boh3x1y9SITICUfIH2+UYJaXSO9SFizyyzJ60iPOHlUns2PhMHeoPoe5nTAEpgHknFo+lYaKBInl68CRL6q52t5orA114xomceWeFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+X10LwCoVzVwctPr1s1M91WLO8zd326H92tdZ3BgsR8=;
 b=IsNP1x5etSMNKdQ0ujv5B2ye1nM6z4sJ+8KFVD9bmpn4wiCk0ogJxUtlYrj18B0g/WDLslfAFWljRBaFg6IWuA6PxWQ65FyMdlZMTwYk65oxvfdzO8SLXcN5JBSh7Tg6nEYG5ujqITxo3w5oBI3DeEFC3PLKc+WrOD5sglUwFKk=
Received: from PR1P264CA0042.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:2cb::7)
 by CH0PR12MB5316.namprd12.prod.outlook.com (2603:10b6:610:d7::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.32; Mon, 29 Jan
 2024 05:51:54 +0000
Received: from SN1PEPF00026369.namprd02.prod.outlook.com
 (2603:10a6:102:2cb:cafe::11) by PR1P264CA0042.outlook.office365.com
 (2603:10a6:102:2cb::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.33 via Frontend
 Transport; Mon, 29 Jan 2024 05:51:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SN1PEPF00026369.mail.protection.outlook.com (10.167.241.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7249.19 via Frontend Transport; Mon, 29 Jan 2024 05:51:52 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Sun, 28 Jan
 2024 23:51:50 -0600
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34
 via Frontend Transport; Sun, 28 Jan 2024 23:51:48 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>, <vkoul@kernel.org>
CC: <alsa-devel@alsa-project.org>, <yung-chuan.liao@linux.intel.com>,
	<pierre-louis.bossart@linux.intel.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <vinod.koul@intel.com>,
	<venkataprasad.potturu@amd.com>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH V4 00/13] soundwire/SOF: add SoundWire Interface support for
 AMD SOF stack
Date: Mon, 29 Jan 2024 11:21:34 +0530
Message-ID: <20240129055147.1493853-1-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00026369:EE_|CH0PR12MB5316:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e8bf36f-e73a-4ddc-8f55-08dc208e64aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	EgueM8RO15G5ezuj4h5Oxhi8eFhtkHEtmjCixQLcBJZKxyP4pLiGmNzjAfhOUVFQGAmZShOv7aLYVfPaSuzYKPtl6cj2bTESvlEikndu3thLvFKQl3tJIBfZ9A5i3NIgqyfhuW8rboIg0ldezwIViTnJHqb+VvHPul2Tuq2hAPFrD08+phom12IFQsVfKNYBibIVK6mMgC92YcVpgss1H6yBgor+K3E1ybGXdaSGEVU0pyaYJhP7WHNqHMFGF8AR7/KVzo5+dmsG5uxe3ea00vdxptxwjMNTHWxAOcSx1JOPPeqtF6VGZ3MBdsMZphrMCxt2kArAbUVxlcbbIzpNXO6NMZH1SigkdoJslz87BsjL+U+g8YBu3H//7rpavZpFwjHRIVdyIk6pl7j7Y9U/Z1d3SnWu5nPsP1YmVrWq0M33bI90D2RmjeYyg9OcWolOu0MXCVVQFkbHJmyJweEIsP+fDDpnyOzNDpdyi6rr6Oi5QT3seWW6RMvc6xMkVYr8ZEqmByu2AbwHTn9/k3qSBZfGKu0MskH3m/tQPn8FwV+uRiZ7MWqqYoSWYfnue8snMOOWkYjEbVHS3M7yGWTdmEGL56Ux0rIY6km8yKBMuatyQ331IilBEBNT6wkwWij/k1tOki8kuTrvBmH6ez5S3xm5qGVj4pKHtyYejXX0VQQf1bp7blZEVC6uYbtjEXesSSvzIWomyxosxHLuMLfvhkkG9oRTuMm3UzG3lcKaue7lzd+d8jx83K51UZeaQj3t
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(376002)(396003)(346002)(136003)(230922051799003)(451199024)(1800799012)(186009)(82310400011)(64100799003)(36840700001)(40470700004)(46966006)(336012)(426003)(1076003)(26005)(83380400001)(6666004)(7696005)(2616005)(36860700001)(47076005)(5660300002)(4326008)(8676002)(8936002)(41300700001)(2906002)(966005)(478600001)(316002)(110136005)(54906003)(70206006)(70586007)(36756003)(86362001)(82740400003)(356005)(81166007)(40480700001)(40460700003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2024 05:51:52.5487
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 3e8bf36f-e73a-4ddc-8f55-08dc208e64aa
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SN1PEPF00026369.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5316
Message-ID-Hash: 7DQACZMBY3LQJXXBEIYOJ3VJDTDL6IRY
X-Message-ID-Hash: 7DQACZMBY3LQJXXBEIYOJ3VJDTDL6IRY
X-MailFrom: Vijendar.Mukunda@amd.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7DQACZMBY3LQJXXBEIYOJ3VJDTDL6IRY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This patch series is to redesign existing platform device creation logic
for SoundWire managers and Implement generic functions for SoundWire
manager probe, start and exit sequence which are common for both Legacy
(NO DSP enabled) and SOF stack, and add SoundWire Interface support for
AMD SOF stack (ACP 6.3 based platform).

Below patch series is reviewed in
https://github.com/thesofproject/linux/pull/4699

Changes since V1:
	- add new commit to update license for amd soundwire manager
	  driver files.
	- wrap the commit message with in 75 characters.
	- add amd tag in commit title for soundwire patches

Changes since V2:
	- drop "drivers" tag from commit title for SoundWire patches.

changes since v3:
	- update copyright year
	- add missing blank line in sdw_amd.h file

This patch series has dependencies.

"soundwire: amd: refactor amd soundwire manager device node creation"
patch has dependency on below patch.
"ASoC/soundwire: implement generic api for scanning amd soundwire
controller"

Similarly SOF patches has dependency on Soundwire tree patches.
This patch series has to be reviewed and merged in one go.


Vijendar Mukunda (13):
  ASoC/soundwire: implement generic api for scanning amd soundwire
    controller
  soundwire: amd: update license
  soundwire: amd: refactor amd soundwire manager device node creation
  soundwire: amd: implement function to extract slave information
  soundwire: amd: refactor soundwire pads enable
  soundwire: amd: refactor register mask structure
  ASoC: SOF: amd: add code for invoking soundwire manager helper
    functions
  ASoC: SOF: amd: add interrupt handling for SoundWire manager devices
  ASoC: SOF: amd: Add Soundwire DAI configuration support for AMD
    platforms
  ASoC: SOF: amd: add machine select logic for soundwire based platforms
  ASoC: SOF: amd: update descriptor fields for acp6.3 based platform
  ASoC: SOF: amd: select soundwire dependency flag for acp6.3 based
    platform
  ASoC: SOF: amd: refactor acp driver pm ops

 drivers/soundwire/Makefile         |   2 +-
 drivers/soundwire/amd_init.c       | 235 +++++++++++++++++++++++++++++
 drivers/soundwire/amd_init.h       |  13 ++
 drivers/soundwire/amd_manager.c    |  47 ++----
 drivers/soundwire/amd_manager.h    |  16 +-
 include/linux/soundwire/sdw_amd.h  |  83 ++++++++--
 include/sound/sof/dai-amd.h        |   7 +
 include/sound/sof/dai.h            |   2 +
 include/uapi/sound/sof/tokens.h    |   4 +
 sound/soc/amd/acp/Kconfig          |   7 +
 sound/soc/amd/acp/Makefile         |   2 +
 sound/soc/amd/acp/amd-sdw-acpi.c   |  62 ++++++++
 sound/soc/sof/amd/Kconfig          |  18 +++
 sound/soc/sof/amd/acp-common.c     |  65 +++++++-
 sound/soc/sof/amd/acp-dsp-offset.h |  10 ++
 sound/soc/sof/amd/acp.c            | 202 ++++++++++++++++++++++++-
 sound/soc/sof/amd/acp.h            |  26 +++-
 sound/soc/sof/amd/pci-acp63.c      |   7 +
 sound/soc/sof/ipc3-pcm.c           |  25 +++
 sound/soc/sof/ipc3-topology.c      |  40 +++++
 sound/soc/sof/sof-audio.h          |   1 +
 sound/soc/sof/topology.c           |   5 +
 22 files changed, 805 insertions(+), 74 deletions(-)
 create mode 100644 drivers/soundwire/amd_init.c
 create mode 100644 drivers/soundwire/amd_init.h
 create mode 100644 sound/soc/amd/acp/amd-sdw-acpi.c

-- 
2.34.1

