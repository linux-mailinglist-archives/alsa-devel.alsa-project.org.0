Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FCE7835E0D
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jan 2024 10:25:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 30D5684D;
	Mon, 22 Jan 2024 10:25:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 30D5684D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1705915534;
	bh=gSDB7q4tI2UF8XRVnPlgAXrAQHMw0lkjkTzASjMyAMo=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=JBg4/5tB1oOV+h7P4AuS5wJpT7mieXhGXJuTnI2GePEZCm0O/QRWelmNrlbiVi/E7
	 cMGJD8xWkAwFGHngHkRMvc7ksmf2Of4+WNnfjzxXO3GUGvzjioVtvonSxeAJVG2W1j
	 dcZ7VXlsnv0nhE4jO+ZsHSLtazl4+5vfLynp9gME=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 83621F80571; Mon, 22 Jan 2024 10:25:02 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5E008F8057D;
	Mon, 22 Jan 2024 10:25:01 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 62856F8025F; Mon, 22 Jan 2024 10:24:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on20628.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7ea9::628])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3557DF80149
	for <alsa-devel@alsa-project.org>; Mon, 22 Jan 2024 10:24:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3557DF80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=hzaxfgO/
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eWxVsoHp6ZfpAlNqJRljZTkSdFicWaYrm0vijWAGDThcxBEJ5iv2reHEBFkBROQH1hLxoD0Vi1cNSXUMF2TfP9qGfZo6zb+lNOyc7ULL/YHq0/upNRGdwdqDD3wPOHBxAP+5JMWrjmYKclvZ5fSuhRvqdZRh9cZFkYsO0s3D+8BAiUbGZA7wOJEDa7PUNZgxo2JUKuNdJjrJSQ0gYrUUc3FbEh1LUqh5mApau22F9Y7y+8T3qmNg6HZQOk3YnHss6BJlaRhCo73EYfb5KO0ZA2HqXNBVc3zPRwduJxLCfpimAK8GK7S0/cQrkwwSz7wnkBPhurYZ+nHqAL46ACUY6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u6o6jRvbi7+asY2VYnQO0r+UTghbvlGvybDiv3yEq7s=;
 b=kUH4hDoNH4LTE3QbAf8AAGUJIUB/H701JkDiSv8bngiFj4Dnt21tNUiahFWuDkockxCblklHEdZ6TUcwhJo8YhfcS42qH/qowpwKp//jYcPqoIxksgRlnjQg1VLyg68QSey1qK4OdQcWpn4foVE7UxsOD8sR8tHL3yqi9AsE/aUMgJp3pGh4lIyCbTSRWqkLJdpSyVf2jLGk+HPQhn8PUNUf9CNOG4lFY6BsP9cRqVib1DP3caok8Ng3wZEQJYFMgIzAbFfjqWqqQI5aLiaX/isL0/LCjujnc2ExxygpOyv2+s895DihEGRo48ac6bw40it71KCuUZZEIrs5LjRIfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u6o6jRvbi7+asY2VYnQO0r+UTghbvlGvybDiv3yEq7s=;
 b=hzaxfgO/OaFV22Av7prs4WoafPvM0REwnZFHRMFN64MMwYQou9VYPsauFbFXFo8EI3I1Avv2eXd9tpPu/zeuRzOn+OU4mxHkaTYxEa1CAGuMWfspZUv38NTbK6Eg9rr7rk0uOAJdkdmbkvlSSAvmPpuFzaJEHTHVc+kxTL0d5Kg=
Received: from DS7PR03CA0259.namprd03.prod.outlook.com (2603:10b6:5:3b3::24)
 by BY5PR12MB4885.namprd12.prod.outlook.com (2603:10b6:a03:1de::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.34; Mon, 22 Jan
 2024 09:24:40 +0000
Received: from CY4PEPF0000E9D5.namprd05.prod.outlook.com
 (2603:10b6:5:3b3:cafe::68) by DS7PR03CA0259.outlook.office365.com
 (2603:10b6:5:3b3::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.32 via Frontend
 Transport; Mon, 22 Jan 2024 09:24:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000E9D5.mail.protection.outlook.com (10.167.241.76) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7181.14 via Frontend Transport; Mon, 22 Jan 2024 09:24:39 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Mon, 22 Jan
 2024 03:24:39 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Mon, 22 Jan
 2024 03:24:38 -0600
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34
 via Frontend Transport; Mon, 22 Jan 2024 03:24:36 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>, <vkoul@kernel.org>
CC: <alsa-devel@alsa-project.org>, <yung-chuan.liao@linux.intel.com>,
	<pierre-louis.bossart@linux.intel.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <vinod.koul@intel.com>,
	<venkataprasad.potturu@amd.com>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH V3 00/13] soundwire/SOF: add SoundWire Interface support for
 AMD SOF stack
Date: Mon, 22 Jan 2024 14:54:22 +0530
Message-ID: <20240122092435.3791175-1-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D5:EE_|BY5PR12MB4885:EE_
X-MS-Office365-Filtering-Correlation-Id: 54a2cc6c-bd5b-4250-f8f0-08dc1b2bf5c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	9rz0Wg0Ad1cg02IXr1flPPuq3CplsUmw9GUjLOOq0RrNFQFG6NFa3cCDkQLp3E5x68Io5cYUsP5oAXd33mdm3f0LK67Vpt7SkmbqFuONjHuWT9tR9qUd8lNNZOjGAVa+HrRUawEQfq5LqTBfxScmjGb0WiwdQ0kurjdIM6d7I8rlq5XfmIGZPYBz+XwAY951lKY2G2lGTXAfl0KEdc9BEJioeyv2Hkiuhg2jTYNev7PFxhSFFmkkMBJf5hR19aCUKMFSE2szKrlO42WPHqPP63JcA3R/SWGK4ac/9ZWQkSKBCfWmyoL/xI3vcvpzcBQx6iKR1VM4ozUu01B7LhrP7Z6DHG7BRjhWGumOSNMjOTOm0tjiYStHr+oDT2Fp+AvxYrj/ykC90SDSp14VdkhLd/TireMHbVTOkI+6C7md7o7biB/sII1Xi74D4C7zwKOTTyL6pD/tGco27Vu185cSbmTsyLPsYpI40m0ycx/ZIK0AJvkQfNeqELj+Gl4YuBOoyN/PW2aO+VrV6EOPLsQ2VZ5RdW43l5LloNFeVkEYEH5V0XbaXrzCSNHivFxFUMgCXLkLQiNIlqU4fLhCV7HPLaQY1ZT9BC2YFYBIo/qrvotaj2HV3r4e1Cz4Wc4HRzCdHJTtrYfpZzn/twbhl7YyCzDPVcIghqf3tITv7i/3F8XOz1IFiMKZP2XkkC1lBIxuQevrQcBGjA2aEIB34AQQsVDmt2VeaIZcKDjz+l0adJWbFgAMYuwfv2b9sgDsUMLA
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(346002)(136003)(376002)(39850400004)(230922051799003)(1800799012)(64100799003)(82310400011)(451199024)(186009)(40470700004)(46966006)(36840700001)(7696005)(26005)(336012)(426003)(83380400001)(2616005)(1076003)(41300700001)(4326008)(8676002)(36756003)(8936002)(70586007)(86362001)(316002)(54906003)(2906002)(5660300002)(70206006)(110136005)(6666004)(966005)(478600001)(40460700003)(36860700001)(40480700001)(47076005)(81166007)(356005)(82740400003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2024 09:24:39.9347
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 54a2cc6c-bd5b-4250-f8f0-08dc1b2bf5c1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000E9D5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4885
Message-ID-Hash: 4P5LHZFVXGGX4NHWHM6CGVWDUJ7BHFK2
X-Message-ID-Hash: 4P5LHZFVXGGX4NHWHM6CGVWDUJ7BHFK2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4P5LHZFVXGGX4NHWHM6CGVWDUJ7BHFK2/>
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

This patch series has dependencies.

"drivers: soundwire: amd: refactor amd soundwire manager device node
 creation" patch has dependency on below patch.
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
 drivers/soundwire/amd_manager.c    |  45 ++----
 drivers/soundwire/amd_manager.h    |  14 +-
 include/linux/soundwire/sdw_amd.h  |  81 ++++++++--
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
 22 files changed, 802 insertions(+), 71 deletions(-)
 create mode 100644 drivers/soundwire/amd_init.c
 create mode 100644 drivers/soundwire/amd_init.h
 create mode 100644 sound/soc/amd/acp/amd-sdw-acpi.c

-- 
2.34.1

