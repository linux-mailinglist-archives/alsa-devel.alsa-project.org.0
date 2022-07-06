Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4056A5693B2
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Jul 2022 22:56:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9A2F4829;
	Wed,  6 Jul 2022 22:55:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9A2F4829
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657141003;
	bh=xs/rTf+R8eiU9UqUdT8s7vQD/UIqCw+xPaZ41aCsLwQ=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=OTHWlzyEYiu1S7ptTKdR33jirUeK7hZPx8VebcUR7T7DCAUMPuoGqgiTjOQhSeYjS
	 l9IPPSKx6MQgjI6mEMYag7g0nLCW1lI0SF+F4zOsKNg3bmItCqZbzYceA50kPn8UAz
	 xe4lLyp6XDj/x08Kg3D0iKxyhVizBA9Vo7cFFpCI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 16060F800C5;
	Wed,  6 Jul 2022 22:55:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C201FF8023A; Wed,  6 Jul 2022 22:55:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2075.outbound.protection.outlook.com [40.107.93.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D7A26F800C5
 for <alsa-devel@alsa-project.org>; Wed,  6 Jul 2022 22:55:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D7A26F800C5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="vYQy0CRO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ABgfj2eZYEoACNFAwSNBqQUwPQYQp8+Qc0NT2FXnUh39wjzlhlzF/a9sd/4wjFCJpEDrHdnSa0XUxoYQV3StO6raerKCJuqpKr6oFsx5PF1gCf0a1BWodGIlLwTxuXca5LA+Ba4llcVRec4sPZK4Z1M0Ylrfj4lYwW9FpfaXxRvzenQQ29Tzd41R1eU/cuwD5IS733/8E6OS059EMXW4u4KfWzBdOl23okm0Xy4PCHWdPz+iN9L0ZrX+2qyJWn7Ue4cFOAV4arznxKyv5Z1p5ISsGyOEuWBVOtwRXbZ/4s4R5wYq9kDaP3NQxOSA/fRzx6Y6qW6acOCVlOH4yLaufw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zg9FzvsIxxtolhQY+9z3FN7fhfbdxEsDqXPdq33gD/w=;
 b=CLy9uE/o3NYQlZICxsW0g24TKGXuT7/C2rzJ97/DWQ7eq4VhNhk0JPyghYwpYd0Lo9RTK0nWEGAdF3faS+2IioDCgNkqgrtnH6Uh5PcQsgYctI7EiqUhk4yMF6zRvCEAMguWA0eI5dNqEj6+uLYy3ezohIpY0mMm/EOvIP+5VyhOyA+wUTpRtKYJjtHFC+aGPHDG5cvT7F5av2/m+5UP5C2dFUoZc2mdevGafPW4uPWrlLyPWtnwxz/dud/BG6bsp6+dcKm76EmZq5y7j2zreBZhyfIMRr+LnZqRwdcRI+hMuN7D0Q5dnEceiNbpYAybxXYtJHGFHfuSSMMBcUcASA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zg9FzvsIxxtolhQY+9z3FN7fhfbdxEsDqXPdq33gD/w=;
 b=vYQy0CRO4kR/ka0gIuYZJKorL6kcw/xaFXRa3Yb27ciV90StZkiSXTLzD7lOrT/Gy4aVGoOzlsed/gkaeQ0Wza3XlApirsnUSLunPH1RG1fPoxE9h+/d6XFZ7mPCvmAc44HLRHGaHq+0ZEm51DBSblxB+bi7hEI+AdzsC9l9dQQ=
Received: from MW4PR03CA0017.namprd03.prod.outlook.com (2603:10b6:303:8f::22)
 by BN6PR12MB1411.namprd12.prod.outlook.com (2603:10b6:404:1f::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.17; Wed, 6 Jul
 2022 20:55:30 +0000
Received: from CO1NAM11FT005.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:8f:cafe::8a) by MW4PR03CA0017.outlook.office365.com
 (2603:10b6:303:8f::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.22 via Frontend
 Transport; Wed, 6 Jul 2022 20:55:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT005.mail.protection.outlook.com (10.13.174.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5417.15 via Frontend Transport; Wed, 6 Jul 2022 20:55:29 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Wed, 6 Jul
 2022 15:55:28 -0500
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.28
 via Frontend Transport; Wed, 6 Jul 2022 15:55:23 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH] ASoC: amd: fix ACPI dependency compile errors and warnings
Date: Thu, 7 Jul 2022 02:25:14 +0530
Message-ID: <20220706205515.2485601-1-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1c0d3ac8-dddb-4371-fb21-08da5f91dc2a
X-MS-TrafficTypeDiagnostic: BN6PR12MB1411:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Za+/XcVOk8MupTHmoELG5ejcOQCC2ohqA9Pw0ezp1ahpvh01cmXYbmd/JDkTC4h6VW+0Ty8NEmnX/2widlRMr1ELjSlcvWnDt4Nw3vRwMHGO0mwSiWR6SpL3hv9JmUaLNotxAniy1w05YSoWkShjMM2UqPqNHNiEQgVdST7twcGFxbdzMZJcGMZ+uJ8FvIYvK/ZWIsJrVkWHCFBio0Xdm1SRSNJY5acx4XSKhvsP/hnpWLNlqUZpAzkGTDY4I98JZn+EbT1m0IXAzggfqXOiJQZRfccbEqJXQG5O78BqMrOkyfwBLIpNirb+rDcxE7dZk/p/BmcYUQptq2v3/uUgIYmiv1Shcx3RVsvCL9Q4Th8WB+abS7H3vMJjf87mOShxf3XAMVtUXVRX61gTvXlC6ONJB1Mq5SRuv3GSaU0/VkYZ2JfK4KIjwOqaCCBqMKJ6S1bh+01AfJKspVNfjqV/ZR7rYmnCBYQEPfFZkAFHGOH25boFprFCfb+t0JvHpgaJr3TtLNYN/w6iapNf3mMExsvglkqiVs1z6tXMX5vro4wVT4SvFfGQcBxI9ygcHNatB8HtQlqnYX/O1Whx7EKxUyd7V4VSB2c1NzXLIMlQE+C2heL5tFbbIgbuGU9m0eeiwzVofzJTcgvLGgq1+wvmxL+W9MaKWxW3gZ+zxAfPXhgfb/egnGqmT5ppseaCf1CRmhMJvEH/MSkXZ8Ka3nlg4S5c9BeVg/wwcRfYFrkr7rM6NuH/8aVDNl6CLjeaDchV5f032/WnriJxTnwH1d1Jnf375sa5ZD3GsLLOwQ7r4QIfTB07xUIVyPBdIgwxFdWu0L2ZXHWsuHId7lgxC+Fs6FeguPJcOOmtkaD9bFqc4zNUpwmUx8aeWdZz+/zmV4K2
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(346002)(396003)(376002)(39860400002)(36840700001)(46966006)(40470700004)(47076005)(110136005)(40460700003)(336012)(426003)(82310400005)(54906003)(36756003)(186003)(26005)(83380400001)(316002)(1076003)(86362001)(2616005)(5660300002)(70206006)(70586007)(34020700004)(81166007)(2906002)(36860700001)(40480700001)(7416002)(7696005)(478600001)(8936002)(8676002)(4326008)(6666004)(41300700001)(356005)(82740400003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2022 20:55:29.3172 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c0d3ac8-dddb-4371-fb21-08da5f91dc2a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT005.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1411
Cc: Pierre-Louis
 Bossart <pierre-louis.bossart@linux.intel.com>, Sunil-kumar.Dommati@amd.com,
 kernel test robot <lkp@intel.com>,
 Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>,
 open list <linux-kernel@vger.kernel.org>, Basavaraj.Hiregoudar@amd.com,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>, Alexander.Deucher@amd.com,
 zhuning@everest-semi.com, Julian Braha <julianbraha@gmail.com>,
 Daniel Baluta <daniel.baluta@nxp.com>,
 Lucas Tanure <tanureal@opensource.cirrus.com>
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

Fixed ACPI dependency complie errors and warnings as listed below.

All warnings (new ones prefixed by >>):

sound/soc/soc-acpi.c:34:1: error: redefinition of 'snd_soc_acpi_find_machine'
  34 | snd_soc_acpi_find_machine(struct snd_soc_acpi_mach *machines)
     | ^~~~~~~~~~~~~~~~~~~~~~~~~
In file included from sound/soc/soc-acpi.c:9:
include/sound/soc-acpi.h:38:1: note: previous definition of
'snd_soc_acpi_find_machine'
with type 'struct snd_soc_acpi_mach *(struct snd_soc_acpi_mach *)'
38 | snd_soc_acpi_find_machine(struct snd_soc_acpi_mach *machines)
   | ^~~~~~~~~~~~~~~~~~~~~~~~~
sound/soc/soc-acpi.c: In function 'snd_soc_acpi_find_package':
sound/soc/soc-acpi.c:58:36: error: implicit declaration of function
'acpi_fetch_acpi_dev';
did you mean 'device_match_acpi_dev'?
[-Werror=implicit-function-declaration]
58 | struct acpi_device *adev = acpi_fetch_acpi_dev(handle);
   |                            ^~~~~~~~~~~~~~~~~~~
   |                            device_match_acpi_dev
>> sound/soc/soc-acpi.c:58:36: warning: initialization of
   'struct acpi_device *' from 'int' makes pointer from integer
   without a cast [-Wint-conversion]
sound/soc/soc-acpi.c:64:25: error: invalid use of undefined type
'struct acpi_device'

64 |  if (adev && adev->status.present && adev->status.functional) {
   |                  ^~
sound/soc/soc-acpi.c:64:49: error: invalid use of undefined type
'struct acpi_device'
64 |  if (adev && adev->status.present && adev->status.functional) {
   |                                          ^~
sound/soc/soc-acpi.c:80:26: error: implicit declaration of function
'acpi_extract_package'  [-Werror=implicit-function-declaration]
 80 | status = acpi_extract_package(myobj,
    |          ^~~~~~~~~~~~~~~~~~~~
 sound/soc/soc-acpi.c: At top level:
 sound/soc/soc-acpi.c:95:6: error: redefinition of
 'snd_soc_acpi_find_package_from_hid'
 95 | bool snd_soc_acpi_find_package_from_hid(const u8 hid[ACPI_ID_LEN],
    |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 In file included from sound/soc/soc-acpi.c:9:
 include/sound/soc-acpi.h:44:1: note: previous definition of
 'snd_soc_acpi_find_package_from_hid'
   with type 'bool(const u8 *, struct snd_soc_acpi_package_context *)'
   {aka '_Bool(const unsigned char *,
               struct snd_soc_acpi_package_context *)'}
   44 | snd_soc_acpi_find_package_from_hid(const u8 hid[ACPI_ID_LEN],
      | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/soc-acpi.c:109:27: error: redefinition of
   'snd_soc_acpi_codec_list'
   109 | struct snd_soc_acpi_mach *snd_soc_acpi_codec_list(void *arg)
       |                           ^~~~~~~~~~~~~~~~~~~~~~~
In file included from sound/soc/soc-acpi.c:9:
include/sound/soc-acpi.h:51:41: note: previous definition of
'snd_soc_acpi_codec_list' with type 'struct snd_soc_acpi_mach *(void *)'
51 | static inline struct snd_soc_acpi_mach
     *snd_soc_acpi_codec_list(void *arg)
   | ^~~~~~~~~~~~~~~~~~~~~~~

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Reported-by: kernel test robot <lkp@intel.com>
---
 sound/soc/amd/Kconfig | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/sound/soc/amd/Kconfig b/sound/soc/amd/Kconfig
index c373f0823462..9629328c419e 100644
--- a/sound/soc/amd/Kconfig
+++ b/sound/soc/amd/Kconfig
@@ -25,10 +25,9 @@ config SND_SOC_AMD_CZ_RT5645_MACH
 
 config SND_SOC_AMD_ST_ES8336_MACH
 	tristate "AMD ST support for ES8336"
-	select SND_SOC_ACPI
+	select SND_SOC_ACPI if ACPI
 	select SND_SOC_ES8316
-	depends on SND_SOC_AMD_ACP
-	depends on ACPI || COMPILE_TEST
+	depends on SND_SOC_AMD_ACP && ACPI
 	depends on I2C || COMPILE_TEST
 	help
 	 This option enables machine driver for Jadeite platform
-- 
2.25.1

