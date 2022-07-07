Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A129056A39C
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Jul 2022 15:28:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 49265165D;
	Thu,  7 Jul 2022 15:27:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 49265165D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657200501;
	bh=w7/uJ0QIgbm+hZ11a8fiew655ROUUXh0D4U2WIit0/s=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=V+1ewtLSdPUfrFNRaN7xr8g3pXG10JA9C4ya89sJLwqnHM0ERPrOAVZPi+5g2lJxl
	 E81h/2oToc1H/JUDhE+S1A3lUmdd1kWCHUE1NLoBDmi+6OVyd2N6XOaE6nU2gT17AS
	 lrZSgPZyvGT8NF90mPhu0gAw0pm+/C0rUEmPutoc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F15AEF8053E;
	Thu,  7 Jul 2022 15:26:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 90CFBF8052E; Thu,  7 Jul 2022 15:26:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2055.outbound.protection.outlook.com [40.107.94.55])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8A478F80538
 for <alsa-devel@alsa-project.org>; Thu,  7 Jul 2022 15:26:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8A478F80538
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="p3jK097w"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oCE5VVB+AG6QI9ZC8GeBB0lvRv8uk2GmHSxIx7/apYadEtWXdX5Hsjan8l+kchaNogbLdC1hsye9Isr0XkjljRPVqW20M5gUZluKiq+N6qP/wmS7KTRd3vxT7pYbpANVRYDbg3h2151u797ERUCu1VW3iJqA7Tood+2a05hnF/64h3aHyUT/WuF6Y6Gq3qTrEq39LvXjesWm6fvLDXQ/K41h1Ut3jcILtzLmiFWg/zjYRLg3dGT4nPOVA8e0xoHwW3NsXLgcluF2c8EkM/C84OmVyUKNn3UdCVCTJR2p0IXqibkRvrfRm9SRRHZGlgZmHf8QzPpmqXMGLrSFPwLxRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fp5wlHeLmJA7UOeVUfZLyKrduF0hIe8TW3CsDq9fVZQ=;
 b=bgPV08eJvcTtBC9dWEbY7vnq5Tsd/NPT6nP1J/T4bf9gAu0rfa7S2K77kgatht/CvZbtO472A/NrogkH/1dKtFwZjgt6GwHzgmNKInCT3JTA2F6d8BntgdjnYuE1G4vTLqtEJOaNOe1pNYhyBvqlUu+eg+6u5ZweyHYMJ+AsHNc6VhHfjmdCiGV9w5rfwCZs746q0BgVSbzTxMeFSShSdpogRQeHQLDvmQZi8QCG0+fyS3QcOAfKS9UQcGqpS9CDxsTpBVaaLmIHiZP6OtRe4UjGI0bZLsHy1nVfNHTmp6HuZSh74piT9tw8hJ7W9D5wH2o+9j4Z0Gg/x9EGi/z++A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fp5wlHeLmJA7UOeVUfZLyKrduF0hIe8TW3CsDq9fVZQ=;
 b=p3jK097wMUFRhOy7XZrPv4oXU7K0fc4dO1lRdy0yUm4pkJW9zY/UUO0Zppjb8ie9FknAZ2eG5cmHMo+16vlUzZjRMFm7ayu+h56bLIPxC8HUMRzl9vOzjBG4Tfkt/ePdgcJnwBRGb+IpJ2m86urD0ECSg7fzwwhoYoq94qOkAFc=
Received: from MW4PR03CA0100.namprd03.prod.outlook.com (2603:10b6:303:b7::15)
 by DM4PR12MB6662.namprd12.prod.outlook.com (2603:10b6:8:bb::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.16; Thu, 7 Jul
 2022 13:26:41 +0000
Received: from CO1NAM11FT006.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:b7:cafe::1a) by MW4PR03CA0100.outlook.office365.com
 (2603:10b6:303:b7::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.20 via Frontend
 Transport; Thu, 7 Jul 2022 13:26:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT006.mail.protection.outlook.com (10.13.174.246) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5417.15 via Frontend Transport; Thu, 7 Jul 2022 13:26:40 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 7 Jul
 2022 08:26:39 -0500
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.28
 via Frontend Transport; Thu, 7 Jul 2022 08:26:35 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH 3/3] ASoC: amd: fix for variable set but not used warning
Date: Thu, 7 Jul 2022 18:56:10 +0530
Message-ID: <20220707132613.3150931-3-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220707132613.3150931-1-Vijendar.Mukunda@amd.com>
References: <20220707132613.3150931-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 98748ead-7e16-4f9f-fc45-08da601c5403
X-MS-TrafficTypeDiagnostic: DM4PR12MB6662:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nwTXFLZGyhXy3Po6Pha93q9xAoW1+dI0IyqMITnTmtrseT1LTVTAcgZZTUMJlslbV8OmGiDwoe7laNhxGnd1HJxZ1kwLHf3/SZSJrIc+L1sxEpCZsAZ1DBd5KRRIibPpyP/okl/uRWHjNlqPAlMwP9BdKqbA3wfrftywf9iJMrRcP/Pw921SyzkonVyN1PXRpsYO7O+0Rzv+GfSLwICIQ/rGFSyc7hRlx8ev/14cR11YmVhA/NvcpcY34lOlkvCMut5uMlsFVlKnvkPR36OQjttsdZHdciytfOVk1ZsYONy5X2Nf7dbEFj41FBAiXrmVnJz1cWod11wu/NHxKtkv3kFlw63BAB4UPkV4aQOgztkQeGuMSTjWZqJG2/ZsUpsXSHp7/jkfZXkf5mR0hXOhgoomcxOh0h2fk5ByUlHfjZRZrfVpYJS0NVOXTRyQ9XfTrLy16+SgDwHZqg2DQuMdMZUMQmX+JPl5BuWniZ5ck+qkj4owG67QonoyovLZjO8LfSpMkQhTepeRxhXznpDUb6+0gon0nn3ZOzWEVX+4Po3ZvErP7W61K4qn1c4Y3KcEVw6TG5WOhlI2HETW1dIG5RyM6jrqHYcJewPbmfFEjL5L9L1ZxzVqk7lY6H7FQPM/dpYOAsAvYdu6rDNB+uGSySwBOZyMN6NUnAgxb2AqfKSj4tBbjGnzzUoYujDQn3TY3PML1ByPXFOo0OeQJ/mr26lC1YQeLkSYdgj+Gwmla2cs+OACpaVni3H13EpA4U1z/tpvbZinxzq6NcpIgcysF5QTBrirpcBmTmmxL3QAEaP/+xBtYuyhPcHeTlM0dPZ/1SEx4djcx10YGPbegK/XiBb3zO97yi461tBaWvgDx84hxRCzEJw8KkmkzYBXgDMO
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(39860400002)(346002)(376002)(136003)(46966006)(36840700001)(40470700004)(5660300002)(47076005)(82740400003)(356005)(110136005)(54906003)(40460700003)(4326008)(70586007)(1076003)(70206006)(8676002)(2616005)(81166007)(8936002)(83380400001)(186003)(336012)(426003)(478600001)(36860700001)(316002)(7696005)(86362001)(40480700001)(6666004)(34020700004)(82310400005)(41300700001)(26005)(36756003)(2906002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2022 13:26:40.9369 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 98748ead-7e16-4f9f-fc45-08da601c5403
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT006.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6662
Cc: Sunil-kumar.Dommati@amd.com, kernel test robot <lkp@intel.com>,
 open list <linux-kernel@vger.kernel.org>, Basavaraj.Hiregoudar@amd.com,
 amadeuszx.slawinski@linux.intel.com, Liam Girdwood <lgirdwood@gmail.com>,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>, zhuning@everest-semi.com,
 Takashi Iwai <tiwai@suse.com>
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

Fix below kernel warning.
>>> sound/soc/amd/acp-es8336.c:200:13: warning: variable 'ret' set but
>>> not used [-Wunused-but-set-variable]

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Reported-by: kernel test robot <lkp@intel.com>
---
 sound/soc/amd/acp-es8336.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/amd/acp-es8336.c b/sound/soc/amd/acp-es8336.c
index 90f4e5809c72..e1479ae684e9 100644
--- a/sound/soc/amd/acp-es8336.c
+++ b/sound/soc/amd/acp-es8336.c
@@ -206,6 +206,8 @@ static int st_es8336_late_probe(struct snd_soc_card *card)
 		dev_err(card->dev, "can not find codec dev\n");
 
 	ret = devm_acpi_dev_add_driver_gpios(codec_dev, acpi_es8336_gpios);
+	if (ret)
+		dev_warn(card->dev, "Failed to add driver gpios\n");
 
 	gpio_pa = gpiod_get_optional(codec_dev, "pa-enable", GPIOD_OUT_LOW);
 	if (IS_ERR(gpio_pa)) {
@@ -213,6 +215,7 @@ static int st_es8336_late_probe(struct snd_soc_card *card)
 				    "could not get pa-enable GPIO\n");
 		gpiod_put(gpio_pa);
 		put_device(codec_dev);
+		return ret;
 	}
 	return 0;
 }
-- 
2.25.1

