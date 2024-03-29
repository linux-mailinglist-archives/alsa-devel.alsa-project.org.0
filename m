Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D3A589134F
	for <lists+alsa-devel@lfdr.de>; Fri, 29 Mar 2024 06:43:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 585392C94;
	Fri, 29 Mar 2024 06:43:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 585392C94
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711691003;
	bh=mQMuZ0Qo5AG4pxa9fPZlfbcX9gRbL3RMroV69V5Yppg=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=nOLh8h1wf+eY0yVLFpZKesLep9nWeJ7nh4qVw82H879SGVEY+riI3G74tJk02XRhl
	 EgdnwPWQq11/C4q+YayCoPWdWhEBOLpdg4xdN7b7zUOHERN+1l28S5RuxnQ4ZktrgS
	 JECjlZGdgDKnlC+Bbxs6Nm1nvyhamaGItkF0hKuE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8219BF80579; Fri, 29 Mar 2024 06:43:01 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 20A1EF805A9;
	Fri, 29 Mar 2024 06:43:01 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C57A8F8025F; Fri, 29 Mar 2024 06:39:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2416::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6AA9EF80093
	for <alsa-devel@alsa-project.org>; Fri, 29 Mar 2024 06:38:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6AA9EF80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=dIp/Ioth
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kE5rNKUdJS2IVJJSOOBPsJPwcbprKgfm9pwEALlWS2ckVKAv3J1QpQsrMlODSj1qlgIDPEDyfChrm6jmzyuEa5B+rUYLLaG8XxgdXokpQsmvcFYD0hoWfqoxF/uUFTTwQJ6NnbfM/QC7l7OeQHKSm0GZCh8vfh8PGKfHyiRIbi/ST84t1UfKqcBCRpzRUWz9daHeKcGMKyx4UWgwlEsVbXmA/y/YlP/9ozCbROb6mV89K1egfEaB/o5/3FmiPv83UnAsTVll/Gyw1DrGPwrRzGFtg2FbrdoKiCMN1tstgnXFLjZmNSw/ZEnqjCQVuENdUh+OMBcd4V2auJNIhiGvWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2mLrx29e1YrvXhNPqPTYaWzs3am18IJPXmS3Lljm6RA=;
 b=dGRgQW4xnI7ZFDg4TR5Y/rJXpEA1bh4cUlrQy5NypCWCil3ytFqnYewt0LXEAYRaXVG1XqTxlFTx2rh44ozpcCDlNA/d3dC+m6MpZ9lMChBdrQrVQqZE8+aZVt/Hx2j6l+z3qAs6TqDvzACiC4YmFrm4QBAd+WDmYp6su53p/LTUJrqhu0OCbhnVaK0BLaJTd+nDh/RP/JgtueiKcoJL2TQtfzg1v3ntctoi8GtpCDKq3uXKujOYn1NrONOGuKeSu4/47DRYI8eiZrKuI1j4FVqcZ6J4LufcZomn5hbhvPYhe3Pymn4z56Z7zNVAaI4dWsZry8nFKZ66asQyglRMcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2mLrx29e1YrvXhNPqPTYaWzs3am18IJPXmS3Lljm6RA=;
 b=dIp/IothyK+3KYsNfKgsRXYQUvXec/1/lZvgm0+wP3TFoSOPPfk6pya3tIDejDticoHNxDpcA8F9jBDFPGkjt6jd/Iwz6X0obVqUUx3u0loaoKI38UShyoMxFmAG7zkgdX2x0mSYBTqyRV2WDPkZUC/Jb7oyfENTPEvvL6bNOFU=
Received: from SJ0PR03CA0042.namprd03.prod.outlook.com (2603:10b6:a03:33e::17)
 by DS0PR12MB8320.namprd12.prod.outlook.com (2603:10b6:8:f8::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.40; Fri, 29 Mar
 2024 05:38:27 +0000
Received: from SJ5PEPF000001C8.namprd05.prod.outlook.com
 (2603:10b6:a03:33e:cafe::18) by SJ0PR03CA0042.outlook.office365.com
 (2603:10b6:a03:33e::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.13 via Frontend
 Transport; Fri, 29 Mar 2024 05:38:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ5PEPF000001C8.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7409.10 via Frontend Transport; Fri, 29 Mar 2024 05:38:26 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 29 Mar
 2024 00:38:24 -0500
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35
 via Frontend Transport; Fri, 29 Mar 2024 00:38:21 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <Sunil-kumar.Dommati@amd.com>,
	<Basavaraj.Hiregoudar@amd.com>, <venkataprasad.potturu@amd.com>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>, Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, "Syed Saba
 Kareem" <Syed.SabaKareem@amd.com>, Jarkko Nikula <jarkko.nikula@bitmer.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>, "open list:SOUND - SOC LAYER /
 DYNAMIC AUDIO POWER MANAGEM..." <linux-sound@vger.kernel.org>, open list
	<linux-kernel@vger.kernel.org>
Subject: [PATCH V2] ASoC: amd: acp: fix for acp_init function error handling
Date: Fri, 29 Mar 2024 11:08:12 +0530
Message-ID: <20240329053815.2373979-1-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: Vijendar.Mukunda@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001C8:EE_|DS0PR12MB8320:EE_
X-MS-Office365-Filtering-Correlation-Id: cfdbf79f-d577-467b-59f4-08dc4fb27506
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	cdC76e/zMrOLIIqHXCfYO74/4rc/DeXKiUZHZM16gtc4INtp1wBl39LIVWE1stdcGQIkX6eC8J9qita4OKH0gJ24T9Vq64JH1Om/AcDL41Z4j9ygA79sUCZNopnwr0HCHS07TrGa9ed9u1AUYBlbvaxygS4SOokr27D8RrW4VA4jV/1tzJ/wstkcoCI+kgTpVArFX99FyXpK1sfkxBZpGSnIKjvYJKpITziD8bQpxHzO61tfZbZBqmsXTe8+tyWTocJlgr6X+l6WWzO3/ie9Rn3XdMGdJNiRn9c0vGFkM5hT6ZmOOext1oR+YkT0z49DWScsXKYgArzCzwvzFHhy37K53BIL4KDzX+I0xfYvO2cG1uOxqoLx6Vo/sxqurfBZ4ZZm2TY6R2F/UhfS943jTQSeSKlpou1lL95/1PoT6xkzCLueF2GL5H+Gqzxs7cqa+PtQZkGCWSlROEYUsAfpUiUqLtUHRHTlgKgkEjq31LJWrA3ISt5wXI3H1LVHLjDXtg87MrNqRz0hW8hLWCXcpCHBPfJMVqPefXo9J/UScvd7cJr/LxqMnJpANqztuA1KUBRiv3TCUgX/rVRucm5HFKJKjRn60S/0fIcoego5b3ZG/xE+lKOJF1RESPiNpWSzAz+bpNAfitKncS1TYKGPAWn2jESM6vTut7J2RT59kx/kM+o4toz4Ox+pKpV6ijsF6UPGiPpV81m1blDadZcu6SHuCO1y+G1A2fjM7OmTqQ5wRhUSiAT7zJ8ZxMaV8uLi
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(82310400014)(376005)(1800799015)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2024 05:38:26.4172
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 cfdbf79f-d577-467b-59f4-08dc4fb27506
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ5PEPF000001C8.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8320
Message-ID-Hash: YYJSGFDY7K7S5PXDJP3G7IAIN7RDJZQW
X-Message-ID-Hash: YYJSGFDY7K7S5PXDJP3G7IAIN7RDJZQW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YYJSGFDY7K7S5PXDJP3G7IAIN7RDJZQW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

If acp_init() fails, acp pci driver probe should return error.
Add acp_init() function return value check logic.

Fixes: e61b415515d3 ("ASoC: amd: acp: refactor the acp init and de-init sequence")
Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---

changes from v1->v2:
	- handle clean up sequence instead of returning error directly

 sound/soc/amd/acp/acp-pci.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/sound/soc/amd/acp/acp-pci.c b/sound/soc/amd/acp/acp-pci.c
index 440b91d4f261..5f35b90eab8d 100644
--- a/sound/soc/amd/acp/acp-pci.c
+++ b/sound/soc/amd/acp/acp-pci.c
@@ -115,7 +115,10 @@ static int acp_pci_probe(struct pci_dev *pci, const struct pci_device_id *pci_id
 		goto unregister_dmic_dev;
 	}
 
-	acp_init(chip);
+	ret = acp_init(chip);
+	if (ret)
+		goto unregister_dmic_dev;
+
 	res = devm_kcalloc(&pci->dev, num_res, sizeof(struct resource), GFP_KERNEL);
 	if (!res) {
 		ret = -ENOMEM;
-- 
2.34.1

