Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 15C116D3DF4
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Apr 2023 09:17:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 30CD0201;
	Mon,  3 Apr 2023 09:16:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 30CD0201
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680506258;
	bh=63NN3CWWkhhSJMgbIXj/U92h1bFfy8QDF5vCkhYeuvQ=;
	h=To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From:Reply-To:Cc:From;
	b=hav0w9dBNhXDzbTaHKMoQQt+C4d+nfHxDw5O4UJZPrLnUcY+QDJnZxi7YaLQhCd1/
	 9mUVugoS5RrWkSmXBUUDQ/vqpLunWtRWkS6CNaDDy8qBCNw0oDaM/OaaxyrSX+VtCU
	 Rx32Jer3vRD7WQRzCzNt4wmvvQtxkJkN1Rm4tHvA=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 57F6CF80423;
	Mon,  3 Apr 2023 09:16:47 +0200 (CEST)
To: <broonie@kernel.org>
Subject: [PATCH 4/6] ASoC: SOF: amd: refactor get_chip_info callback
Date: Mon, 3 Apr 2023 12:46:44 +0530
In-Reply-To: <20230403071651.919027-1-Vijendar.Mukunda@amd.com>
References: <20230403071651.919027-1-Vijendar.Mukunda@amd.com>
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7A5SUTGLGIT3IGD56FY2AA22ABMECBIU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: 
 <168050620662.26.7043568417448123342@mailman-core.alsa-project.org>
From: Vijendar Mukunda via Alsa-devel <alsa-devel@alsa-project.org>
Reply-To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Cc: alsa-devel@alsa-project.org, Basavaraj.Hiregoudar@amd.com,
 Sunil-kumar.Dommati@amd.com, Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, Takashi Iwai <tiwai@suse.com>,
 V sujith kumar Reddy <Vsujithkumar.Reddy@amd.com>,
 Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>,
 Ajye Huang <ajye_huang@compal.corp-partner.google.com>,
 "moderated list:SOUND - SOUND OPEN FIRMWARE (SOF) DRIVERS"
 <sound-open-firmware@alsa-project.org>,
 open list <linux-kernel@vger.kernel.org>
Content-Type: message/rfc822
Content-Disposition: inline

Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A575FF80544; Mon,  3 Apr 2023 09:14:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2060c.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8a::60c])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E144EF80495;
	Mon,  3 Apr 2023 09:14:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E144EF80495
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=Q7vxl/Vs
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OLIB4L9zTlmH11qwjFNJWXHCjh3sOeTVeEzuJNiDDDOIv5c8K6Uut3rV1HX1PNrbZrZgOv9Qe8vF+DnrfiBFUprCh2JQ66RkIBNbB+gKz/AuNfgjRA1n8YtJ4QEdrgJop/ONZbEwezUQzbKztcxyf3sUClHKKXUbjxOVsCn5yYVHgllF35TyI4Epidyr0X/pChRhSTIWZ5eyhqbqODlmpmea0db0JGjayAGCPThrBKr8oZKQz1FkS19W2hOWEYVw7t3Rp8KaRM3h+e7shVQ4MFNEaIrPHvr9GUITx8bXacrBHyYZiTC2BRsrRfDOjngd1YZCumdkkNhEQ2V2CU5TRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g3aDbK43nFYU6lt/JaZU4bsa9TW7L4EFVaCfxSnjk74=;
 b=jbTM5F3NXf0uPntVyQFYNHGDffHAw+qx9DOe596cf50MHCAE9hyutF84YMqcZUDZDlBGkQRwqhwvv3G33EyYd14DC1TOBEDJ1e1vNaqT91qwcVkZfpW0ldhcDUkYqwnRSGtYSSovlT7KukEoz5w4hth8GzZEkAX5Mh7q/1rHbIsqrp5N3mYKaCk5Lz3tkASEtt3I1ypzP09Ad7FgRSDcRtVF4C668v3ZCqAYmf4HyvumHgklTyDOANYZEKVcLUgPgHu8h+Q0VVer7Fg2kMx/1bw1jSGbX1favj2Q9nQ0epaiYYNB4PPVb0RqEQDGblljaTur4Dk8+PxmnX3pD8iyXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g3aDbK43nFYU6lt/JaZU4bsa9TW7L4EFVaCfxSnjk74=;
 b=Q7vxl/VstpwkIOQxnXMDZaETh5IDOymFPv9VwcNqrVBT319DBwfEmLJjyJe2I4ld3wyhak03REpnwU4SRKu93v9JiSIoNLXRvL9kHR1S/cdrsTXWIi8V31pFcLiJyO3839HOpaxRjaychhtQkX2e05dp6JoZSGMMrPHZBPjTa2I=
Received: from DM6PR03CA0087.namprd03.prod.outlook.com (2603:10b6:5:333::20)
 by CH0PR12MB8487.namprd12.prod.outlook.com (2603:10b6:610:18c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.30; Mon, 3 Apr
 2023 07:14:13 +0000
Received: from DM6NAM11FT017.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:333:cafe::86) by DM6PR03CA0087.outlook.office365.com
 (2603:10b6:5:333::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.20 via Frontend
 Transport; Mon, 3 Apr 2023 07:14:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT017.mail.protection.outlook.com (10.13.172.145) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6277.14 via Frontend Transport; Mon, 3 Apr 2023 07:14:12 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 3 Apr
 2023 02:14:11 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 3 Apr
 2023 00:14:10 -0700
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Mon, 3 Apr 2023 02:14:05 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
Subject: [PATCH 4/6] ASoC: SOF: amd: refactor get_chip_info callback
Date: Mon, 3 Apr 2023 12:46:44 +0530
Message-ID: <20230403071651.919027-4-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230403071651.919027-1-Vijendar.Mukunda@amd.com>
References: <20230403071651.919027-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT017:EE_|CH0PR12MB8487:EE_
X-MS-Office365-Filtering-Correlation-Id: 12ad219c-428a-4a8b-7080-08db3413070e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	hk5texWbCwz6sGwz/6Odf/Du67wegTewwzSahUmTTIunRUS7M9UG9kzMBmTgIO2VOEQZY2jD1pxSNhRAO98AJKU06Q+uFZdwaS/6h2mJA3bo4wdGRPe2Ohx7Th1J3GQbP2lN1oDRE+WEPIQQvA305pXY29rC1ZbEv0rnL+U0yCyKJ9COF6nG1BCPton+M27iUibmUdPVXFkdD9aVBMLwayBhaHf4IMvxh5fwvXl/hEs2evK+rNUxwEtcLkYue3MNcCX40od7MVBdp5HrdMeRDf/t9+q95ol2sHL36VR7ZkAg74JHPb5B+y+YKdgQNfIWejvIhFI7NRc09BLjCbKyLAxSphO4/+brkjO6tZFGB1k3Nbp4QEIAQSrBxlYVX/1C1wBszaEpalxABeKM/isd87XaPQ/C3Sxgbb3TH8D+zFROoP1HEPJcEpoSjbf4L7AR64K413V0TcQ0aYmP0vxbhreNpfOtNC6wYshK7x/Y6xQRWuc6MSlSrUvq/d4esmEjTxvZE6GOtnUzt5pFcy4BT7YCJ2vtNwLOsjdrOlC7ERkvooSUq9U0L6Pgsg0300d6Ty8bYektOK3q38yOcOVXx9dvrw676jWk9sivSGqsltFhrpSZ2DbolBvNlQ11xLwz37Vh7GR7C3KrmYlAhtMIgZi0iXrL3gmyaATFo0o0+cZEgl2VUKwAHgcJCQQ/QsT4+39j5QQl2jPnITzIXxj20CuVI8sgv2HS6vzSETKkPGk=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(39860400002)(136003)(376002)(451199021)(40470700004)(46966006)(36840700001)(356005)(316002)(8676002)(82310400005)(41300700001)(6916009)(4326008)(70206006)(70586007)(81166007)(5660300002)(7416002)(54906003)(8936002)(82740400003)(478600001)(86362001)(2906002)(7696005)(36860700001)(40460700003)(47076005)(40480700001)(26005)(6666004)(1076003)(186003)(83380400001)(36756003)(426003)(336012)(2616005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2023 07:14:12.9685
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 12ad219c-428a-4a8b-7080-08db3413070e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DM6NAM11FT017.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB8487
Message-ID-Hash: 7A5SUTGLGIT3IGD56FY2AA22ABMECBIU
X-Message-ID-Hash: 7A5SUTGLGIT3IGD56FY2AA22ABMECBIU
X-MailFrom: Vijendar.Mukunda@amd.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, Basavaraj.Hiregoudar@amd.com,
 Sunil-kumar.Dommati@amd.com, Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, Takashi Iwai <tiwai@suse.com>,
 V sujith kumar Reddy <Vsujithkumar.Reddy@amd.com>,
 Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>,
 Ajye Huang <ajye_huang@compal.corp-partner.google.com>,
 "moderated list:SOUND - SOUND OPEN FIRMWARE (SOF) DRIVERS"
 <sound-open-firmware@alsa-project.org>,
 open list <linux-kernel@vger.kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7A5SUTGLGIT3IGD56FY2AA22ABMECBIU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Move get_chip_info callback to the start of API.
This should be first check in probe() call.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/sof/amd/acp.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/sound/soc/sof/amd/acp.c b/sound/soc/sof/amd/acp.c
index d5ccd4d09278..e8fe324c23d0 100644
--- a/sound/soc/sof/amd/acp.c
+++ b/sound/soc/sof/amd/acp.c
@@ -470,6 +470,11 @@ int amd_sof_acp_probe(struct snd_sof_dev *sdev)
 	unsigned int addr;
 	int ret;
 
+	chip = get_chip_info(sdev->pdata);
+	if (!chip) {
+		dev_err(sdev->dev, "no such device supported, chip id:%x\n", pci->device);
+		return -EIO;
+	}
 	adata = devm_kzalloc(sdev->dev, sizeof(struct acp_dev_data),
 			     GFP_KERNEL);
 	if (!adata)
@@ -486,13 +491,6 @@ int amd_sof_acp_probe(struct snd_sof_dev *sdev)
 	pci_set_master(pci);
 
 	sdev->pdata->hw_pdata = adata;
-
-	chip = get_chip_info(sdev->pdata);
-	if (!chip) {
-		dev_err(sdev->dev, "no such device supported, chip id:%x\n", pci->device);
-		return -EIO;
-	}
-
 	adata->smn_dev = pci_get_device(PCI_VENDOR_ID_AMD, chip->host_bridge_id, NULL);
 	if (!adata->smn_dev) {
 		dev_err(sdev->dev, "Failed to get host bridge device\n");
-- 
2.34.1

