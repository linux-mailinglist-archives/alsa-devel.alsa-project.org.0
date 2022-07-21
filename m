Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 467D957D074
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Jul 2022 17:59:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A5D0C185B;
	Thu, 21 Jul 2022 17:58:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A5D0C185B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658419187;
	bh=tgsWalgR4XAHT4F7AAUGzpmA8W7EbMgWPyEqZNr94w4=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=FqaH7Gj+9gy2LSxlt20Tm9s4JIpzWSs6Guwp5AktA3/k7XXPfjUXqsRXDgfAjCmcw
	 GUjuexEhRbh3UcuIT92to9Dqbbg0ink81FOWdezNCbRTcCPiLFma/gYvhWza2S7i32
	 f1fXBm1a9AxOkBXfooVr/uAyQpyw6lnW+RiCUPQQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D8445F8052D;
	Thu, 21 Jul 2022 17:58:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 96E86F8016D; Thu, 21 Jul 2022 08:18:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2050.outbound.protection.outlook.com [40.107.212.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8F65EF80166
 for <alsa-devel@alsa-project.org>; Thu, 21 Jul 2022 08:17:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8F65EF80166
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="Nuz1yOWk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=inl80c9HRIjH+q+yTvEZihCoo2ONpTWFtGuw4daG4YMCLf9EuNCEtMa5+E74dE9faLFvs8BccBM//weroEPiXxj6Utc1jxTR22LViIdpcwduLGbEJKdh5+/N/kZvKfdOHPW5olMwQeMGgfH3WeokokAAKcU2V4fqkr5i4UgT2lvYHN1l6t6ElYHHmYugvygbEcjzEn0fZ+MXUpEbFwU7NNlc2Xy/x+tUpa8v7/Oh2rJ2CVaYTNrXBhWqHrXnUA2b2GSI3S3erMmzX66/C3p5nk2ZpAPmmQixDH6HpO2lfSQyDFqHiXzKQq6bF2owTES/dD7ccrpkocEg9VyoiH/bpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wlXfnXgIedlRjCxyBZjj2xZaKqIMr08iSBqCjCO/6L8=;
 b=YzGtlRuKNIknx0XbiuBF/xPmYb/caVae8MvIiNJqVU3X21M7A2qtUpGF4EpTgp9QGHGi/hPNaMux/QGcKKMzi+7OCv6QWvOTNP7sDLBJH0ghqAhOrt6GACnROVBF1YU1L3csdYl1Yv8hIwSF53fdRe5APfPvIvDse8kjYEdXVIeVeX19fgtinV42+2lSI0RG1h0SuwjK8wudlV8E1K69rTPhildiWfo+QsQu6Doi2e9vVHlg2jN25Bk1lwD1Nd4pMdOGjRzIYe0rNDSmQ9jw398bk6nQ50V6zChCCmt6BwqQvM4FphUShL0CwLCBnTDBEnm2gaSEzwECt3oeyLgCIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wlXfnXgIedlRjCxyBZjj2xZaKqIMr08iSBqCjCO/6L8=;
 b=Nuz1yOWkwQ+DwYYkBNADA8aCLOophCsz4B5/WvH+ttCnhAEcqXL2ixYaQrLGasc7fwfbtJRBS38UrKX5Gpn12ztj3acvmXdxZhDfMw8BPTKEVDdcFBj5i4bHPuyQDo2xRBFQwATgbLFa8OdliMDB2gLdzXMKRm1ElAqv9C8b/VU=
Received: from BN7PR02CA0010.namprd02.prod.outlook.com (2603:10b6:408:20::23)
 by MWHPR12MB1933.namprd12.prod.outlook.com (2603:10b6:300:10b::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.14; Thu, 21 Jul
 2022 06:17:49 +0000
Received: from BN8NAM11FT034.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:20:cafe::f1) by BN7PR02CA0010.outlook.office365.com
 (2603:10b6:408:20::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.14 via Frontend
 Transport; Thu, 21 Jul 2022 06:17:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT034.mail.protection.outlook.com (10.13.176.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5458.17 via Frontend Transport; Thu, 21 Jul 2022 06:17:49 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 21 Jul
 2022 01:17:47 -0500
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.28
 via Frontend Transport; Thu, 21 Jul 2022 01:17:38 -0500
From: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH 1/5] ASoC: amd: acp: Modify local variables name to generic
Date: Thu, 21 Jul 2022 11:50:33 +0530
Message-ID: <20220721062043.3016985-1-venkataprasad.potturu@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0e9cd981-038b-42a0-ceae-08da6ae0bc5d
X-MS-TrafficTypeDiagnostic: MWHPR12MB1933:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dUxAbAtK6d9+mn4IHAi8wUoTs5uo4EzWOWMVLwuh39qNP4mhPhP1+uHP4y5PzFt3EJci0FAGq8SV9Zs94qmYVOUo7DaXBrfZ30Ixq5yXFejt181dGDTiDRLXcNxw9woYE/G0mz+rMABfSUFtaPT0eoDPofU7ml9Bba/Y+bq0T0HC12O6aXiUCx1n+G0xFi4di6gTIqhz8ijdcjeScKEjfmMAFLlkaEUer6kqVwXs8tHLPPgd5/f3dGozLMTblXbSjKyJ9DdB3XpcnrdfcB6Gzt2GxM09yrbex9w7ve5/AXTVoqYLTO/R/vDZK2AvJlp00AJlNHeuTzrTzcF1iaK2tAqIKlmiO9PRXG63zM/BjZOry0JM0i/mpy0gsLd6Vqa3S/foHiB3ds/nQgSEUXqVjMg7LE10AGKlebJ7J5PoIbdQSZlP9yOiCvTFZfIWRDkwTEVQSrOcacaMW+fCAlx22CkrrcZU3Ec2cb6mGb1Dpp0qiltpK5LgsuHlfQE973/Ogw9nROcEubQSWKTkF0y+UcjCiOHnLkT08yqQqLpbfLfPsrQexKmAmmzYj5KZjcn+c2mF19WJa+OeDViAlHLm506EBPrl0wXBwt41ztlRoxM2oDcdxbY1fUxQFLGmzG96aip6ToprtkZBiWMgD4PALtotweAq5Y59sYpfpfDKDOvVb34sEmaPOKeWrWaDLHSXe8R68qPl97qNfeDvU7i4zxEVR5sfsKrEuCgk95FFbpQKfpQnH+6plfYJ/thDC3kZGHN8zr/zXsKL8+WiOUXc81Zszv+RdQ27dnTLJlmAYtCrtyiQIj7WjacCszAJR/7E3sezLTco1SBbHIG9tV5yQIx2jojF7pX4+yH0WfICZlA=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(136003)(39860400002)(346002)(376002)(36840700001)(40470700004)(46966006)(26005)(81166007)(36860700001)(186003)(86362001)(2616005)(83380400001)(356005)(82740400003)(36756003)(426003)(47076005)(336012)(110136005)(6666004)(7696005)(54906003)(478600001)(1076003)(70206006)(41300700001)(316002)(70586007)(5660300002)(2906002)(4326008)(8676002)(8936002)(82310400005)(40460700003)(40480700001)(41533002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2022 06:17:49.1048 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e9cd981-038b-42a0-ceae-08da6ae0bc5d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT034.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1933
X-Mailman-Approved-At: Thu, 21 Jul 2022 17:58:02 +0200
Cc: Sunil-kumar.Dommati@amd.com, Charles Keepax <ckeepax@opensource.cirrus.com>,
 ssabakar@amd.com, Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>,
 Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
 open list <linux-kernel@vger.kernel.org>, Basavaraj.Hiregoudar@amd.com,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Yang Yingliang <yangyingliang@huawei.com>, Vijendar.Mukunda@amd.com,
 V sujith kumar Reddy <Vsujithkumar.Reddy@amd.com>
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

Change local variables name to be generic in irq handler.

Signed-off-by: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
Reviewed-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/acp/acp-platform.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/soc/amd/acp/acp-platform.c b/sound/soc/amd/acp/acp-platform.c
index 327e17736dbd..b1ca52274375 100644
--- a/sound/soc/amd/acp/acp-platform.c
+++ b/sound/soc/amd/acp/acp-platform.c
@@ -94,19 +94,19 @@ static irqreturn_t i2s_irq_handler(int irq, void *data)
 	struct acp_resource *rsrc = adata->rsrc;
 	struct acp_stream *stream;
 	u16 i2s_flag = 0;
-	u32 val, val1, i;
+	u32 ext_intr_stat, ext_intr_stat1, i;
 
 	if (!adata)
 		return IRQ_NONE;
 
 	if (adata->rsrc->no_of_ctrls == 2)
-		val1 = readl(ACP_EXTERNAL_INTR_STAT(adata, (rsrc->irqp_used - 1)));
+		ext_intr_stat = readl(ACP_EXTERNAL_INTR_STAT(adata, (rsrc->irqp_used - 1)));
 
-	val = readl(ACP_EXTERNAL_INTR_STAT(adata, rsrc->irqp_used));
+	ext_intr_stat = readl(ACP_EXTERNAL_INTR_STAT(adata, rsrc->irqp_used));
 
 	for (i = 0; i < ACP_MAX_STREAM; i++) {
 		stream = adata->stream[i];
-		if (stream && (val & stream->irq_bit)) {
+		if (stream && (ext_intr_stat & stream->irq_bit)) {
 			writel(stream->irq_bit,
 			       ACP_EXTERNAL_INTR_STAT(adata, rsrc->irqp_used));
 			snd_pcm_period_elapsed(stream->substream);
@@ -114,7 +114,7 @@ static irqreturn_t i2s_irq_handler(int irq, void *data)
 			break;
 		}
 		if (adata->rsrc->no_of_ctrls == 2) {
-			if (stream && (val1 & stream->irq_bit)) {
+			if (stream && (ext_intr_stat1 & stream->irq_bit)) {
 				writel(stream->irq_bit, ACP_EXTERNAL_INTR_STAT(adata,
 				       (rsrc->irqp_used - 1)));
 				snd_pcm_period_elapsed(stream->substream);
-- 
2.25.1

