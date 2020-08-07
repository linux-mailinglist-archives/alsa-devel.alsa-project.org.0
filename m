Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 23D1223F0D1
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Aug 2020 18:18:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C85D61614;
	Fri,  7 Aug 2020 18:17:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C85D61614
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596817085;
	bh=dSfzNRRV+Hm0JQA0ZTBsxDbjr5jABhCgiD2Onk/Ymgs=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=lCtZ64eXRJGcRyp8iHl1DT598T/O/t5FdMy66BKD91uGkSp2mWU+fepkZd0DFDGtG
	 KDZqOlAXXhdCt7RUwfngfjE1v0gp84ZR5sMOZlDwoKtlIDaODAe1ZbNRdrXI7vqEcS
	 d6STtqk5WXvMO3P63Ar5MT2TlIu8uUu6ka7e3mQA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 16F68F8023E;
	Fri,  7 Aug 2020 18:16:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 20C40F8020B; Fri,  7 Aug 2020 18:16:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FORGED_SPF_HELO,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2063.outbound.protection.outlook.com [40.107.243.63])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 16B57F8020B
 for <alsa-devel@alsa-project.org>; Fri,  7 Aug 2020 18:16:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 16B57F8020B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="sRw58YSp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CAPWle5wVQuyhPUo58Te2azUKg87Dh+nH5usIp6tX5gGARt1F8CacAoIT+EK6x1uto8br138HY7+7arAfGKbRaYhxj0N8kYN3IefvLonPueS9o+0NsyQ/hxCGct0nIyLsd6WDgj6vJX/aarOYlnbFKguLg2/L7F6+UTdjJHtLH654Drn3mc5xK1OFEiwvTh3yUsLmHWcPblx6nANkvQ8mVbhiTAHh8Ct/RypTqq5wlwXoJEwgsFJ6dFC1XuRB4nFp+03TH8nzGJrut/WFPmDwQXkT7swzSGo1UKSjwPeS6U9maNrRdZr1lNmOCwkGK6A6WAOfjv4d7ELf4nv6bmpuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rx3wfKZBAkWa78NVMszSWAJ4jhBnGuqJxpn3pWbmn/o=;
 b=lzZjgI/OB2l3JhaLaruTkOEJdPmRKueEPAkJGpywF5qWT35u4VltkbALTaM8Xgoy+gpE7mtwveBARFjF42bHIWKK2eGi+3TMKjh6MoFJQyZGb7n8UBEsi8Cv+GhC4pttjBW9hk+5a7fLvnmbf/iz4Upsl/GRisbFeukf8iu0tFU+bXdHX0KRnJDg3niBF/BCvJg9EbkuCNr1WC3DMByqZkwk7eOikPyajXnmJZphgsqdId3FuhamHeDIDPXkLi5GPttwSHnBkTZoMGRuAsgD3t3DoLwEKqCiiYcEksjMkRw6GKdIdHW3PArSDeHtST4E/Us1eIrF2xSPkjyeGbgG3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com;
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rx3wfKZBAkWa78NVMszSWAJ4jhBnGuqJxpn3pWbmn/o=;
 b=sRw58YSpY1kDWwKsagJ3JjaQzbmn7JU76SO9OTjTFp+AGGIAt6GAJ67DqsUCJXXqW+3Bt1RdTmagl/yUqF3dwhzouPQJ11uBRxwkOsiIQY6RyFo/zej9xE6E6YxFGmAjsdZy9pkvr4KxKSf8geFojNmxxVAAriYdTjvieuXjyHw=
Received: from MWHPR11CA0028.namprd11.prod.outlook.com (2603:10b6:300:115::14)
 by CY4PR12MB1224.namprd12.prod.outlook.com (2603:10b6:903:39::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.16; Fri, 7 Aug
 2020 16:16:09 +0000
Received: from CO1NAM11FT057.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:115:cafe::e2) by MWHPR11CA0028.outlook.office365.com
 (2603:10b6:300:115::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.15 via Frontend
 Transport; Fri, 7 Aug 2020 16:16:09 +0000
X-MS-Exchange-Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=permerror action=none header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB02.amd.com (165.204.84.17) by
 CO1NAM11FT057.mail.protection.outlook.com (10.13.174.205) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3261.16 via Frontend Transport; Fri, 7 Aug 2020 16:16:08 +0000
Received: from SATLEXMB01.amd.com (10.181.40.142) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Fri, 7 Aug 2020
 11:16:07 -0500
Received: from vishnu-All-Series.amd.com (10.180.168.240) by
 SATLEXMB01.amd.com (10.181.40.142) with Microsoft SMTP Server id 15.1.1713.5
 via Frontend Transport; Fri, 7 Aug 2020 11:16:04 -0500
From: Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>
To: 
Subject: [PATCH] ASoC: amd: Replacing component->name with codec_dai->name.
Date: Fri, 7 Aug 2020 21:40:17 +0530
Message-ID: <20200807161046.17932-1-Vishnuvardhanrao.Ravulapati@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6df3f196-e917-455f-d256-08d83aed31ce
X-MS-TrafficTypeDiagnostic: CY4PR12MB1224:
X-Microsoft-Antispam-PRVS: <CY4PR12MB12249C94E418325F929CA714E7490@CY4PR12MB1224.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: l2dD8EVLQsLeu3iUjmqMYuy3XW6DkXuxMUh+QXNwi12VbhcHpxS0W7D3dnKY5T7in4F+/OJkv9BHDjYwmGiaZ1XMTHMQbrdB0YWZzBUPtJZ5h7WB9Ghw/wzwn3X90IUX3CtYW94WC5Ku9fWbXMHuwg8HiKqOYc9dTE149WSM4i6Cqk+HYtAHFE8FtlWvoG7ulAW3JQJSfDj/6ox4nRDptMF4G4D+r2hkcPlxXQG7PuFktASEQuNieGtetlTWSnVcwx65XAVQyuNOsZyjnhZOB2813oraDHmf3nZzm+W3umWNIW9zTEn8HbjtfkCeGIleKm3PeuoGtuBr6DKi5PRM3mQ1JUGj6oM0eUkPWUSGJRAHpB9Wde/QH8IvednQ/b5nxoScMf+Bc+MyRIQDrmMs1TdE4DnpIG+fhXKiU05JFdE=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SATLEXMB02.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFTY:;
 SFS:(4636009)(39860400002)(376002)(136003)(346002)(396003)(46966005)(316002)(54906003)(109986005)(186003)(8676002)(26005)(8936002)(426003)(7696005)(36756003)(6666004)(82310400002)(70586007)(81166007)(70206006)(4326008)(336012)(1076003)(5660300002)(2906002)(47076004)(2616005)(86362001)(82740400003)(83380400001)(356005)(478600001)(266003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2020 16:16:08.8603 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6df3f196-e917-455f-d256-08d83aed31ce
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB02.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT057.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1224
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Liam
 Girdwood <lgirdwood@gmail.com>, open list <linux-kernel@vger.kernel.org>,
 YueHaibing <yuehaibing@huawei.com>, Takashi Iwai <tiwai@suse.com>,
 Akshu Agrawal <akshu.agrawal@amd.com>, Mark Brown <broonie@kernel.org>,
 Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>
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

Replacing string compare with "codec_dai->name" instead of comparing with
"codec_dai->component->name" in hw_params because,
Here the component name for codec RT1015 is "i2c-10EC5682:00"
and will never be "rt1015-aif1" as it is codec-dai->name.
So, strcmp() always compares and fails to set the
sysclk,pll,bratio for expected codec-dai="rt1015-aif1".

Signed-off-by: Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>
---
 sound/soc/amd/acp3x-rt5682-max9836.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/amd/acp3x-rt5682-max9836.c b/sound/soc/amd/acp3x-rt5682-max9836.c
index 55815fdaa1aa..406526e79af3 100644
--- a/sound/soc/amd/acp3x-rt5682-max9836.c
+++ b/sound/soc/amd/acp3x-rt5682-max9836.c
@@ -138,7 +138,7 @@ static int acp3x_1015_hw_params(struct snd_pcm_substream *substream,
 	srate = params_rate(params);
 
 	for_each_rtd_codec_dais(rtd, i, codec_dai) {
-		if (strcmp(codec_dai->component->name, "rt1015-aif"))
+		if (strcmp(codec_dai->name, "rt1015-aif"))
 			continue;
 		ret = snd_soc_dai_set_bclk_ratio(codec_dai, 64);
 		if (ret < 0)
-- 
2.17.1

