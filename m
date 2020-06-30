Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ECF620FBEA
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Jun 2020 20:40:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D69401612;
	Tue, 30 Jun 2020 20:39:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D69401612
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593542414;
	bh=5AOErzWsweR5i+06jaHAD1SPZqpluFObV5wcGDaxY9Q=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=O2OXWGhPYuCMwlMake3wleilXO4MRytDt6f94u+gE6RstTWBMTmbBsL5y7KjDmhu1
	 08bMrO/djXg3XwSbiAAjFcSUD6Aldqu/rzfWLSUBGco1JO0kyvnvAB2cecObMrgWnO
	 fZOdg0TQvwW7N7DPzZPrnDEbp4J8sJOVeZ34AeDc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 00C1BF800EA;
	Tue, 30 Jun 2020 20:38:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DA942F801F2; Tue, 30 Jun 2020 20:38:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FORGED_SPF_HELO,MSGID_FROM_MTA_HEADER,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2085.outbound.protection.outlook.com [40.107.92.85])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 81310F800EA
 for <alsa-devel@alsa-project.org>; Tue, 30 Jun 2020 20:38:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 81310F800EA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="rDdo76TV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C0uuT7wwCETxI+otkCZKqW4dCPAVmlPz6i5AGQ3g3CifhgvN7F9NuP0M141DJOXyBxKe5ewCBs17TK8+bWGZ9+Un9BwwziroCQQIuLO4V8du9sKDi9RsB2uUtXKEA2tr2iIMNJBfWgw92bqKQWs1DhCM55yUPx2F7DwHjttG2LcSmNfi7p+fCfV94Ebog+dyF/tZihvwAgjaVFsvqlKxXUioHxwBv56/bWM7b1ZfyMBfOeSZENQOqGevqM+H3rLE1tJqDfQrGEuiZg2YXubQ7ZaKgBcl75lhSYHNwR5KPcTAQWJwGDdD8popvSe8pEvZCsvoCKh4yaGvDy0HMEFEFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yLcAjwrMvaQJkFqG2LSxKLIMRxGzXhPbs9PUwbM+gAU=;
 b=d4pZu+T7NRAVByCJRNegb6MDWJv03lD5FxUpuyd5wKsKvF40L77xnCSmMzpNG0Tb5VD0D5CCpZ2sjNQHN5V/3Y0ypobRf7YZMCQJqgbdEVIyJPpVTFUbLVsg7orT1CP1OTeeQmST6/sj3QhdC22kh97bAMkc5afdajWK5TUiFtJLKv2uX4EplJv59m0zs21l3+YaW8PBwuwhSKwgfmvYZkNc0u8ZdF1Y7n3rL6DgeOaCgJDTkB2u0JGyEZEPhRjQ5KrNPwAmpD2Ym+xN7izvVFVZ/kRUFWi/kHG6ddd2agb0+S9f4f3ASoGLE4Xl0fRTBNIgrtjEZQ1t6oIa9SuSRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yLcAjwrMvaQJkFqG2LSxKLIMRxGzXhPbs9PUwbM+gAU=;
 b=rDdo76TV5Uphbl6HmABa938SM/64B4n7pbpO7PhHVptfPHuoGQFckuuejLgD+0nPG5/XAtd3LMJVuBySnVOwU+D1reKlSub6ymt0Uf34Cf625wwHH/g89fVq0dmV4oTCsOHQWWU5tMt1y5V2qjWgnfWqDMspcUXoqeUStxJSbfg=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB1337.namprd12.prod.outlook.com (2603:10b6:3:6e::11) by
 DM5PR12MB2437.namprd12.prod.outlook.com (2603:10b6:4:ba::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3131.25; Tue, 30 Jun 2020 18:38:23 +0000
Received: from DM5PR12MB1337.namprd12.prod.outlook.com
 ([fe80::b450:73e1:57a1:81b1]) by DM5PR12MB1337.namprd12.prod.outlook.com
 ([fe80::b450:73e1:57a1:81b1%8]) with mapi id 15.20.3131.028; Tue, 30 Jun 2020
 18:38:23 +0000
From: Akshu Agrawal <akshu.agrawal@amd.com>
To: 
Subject: [PATCH] ASoC: amd: Enable interrupt in dma_open
Date: Wed,  1 Jul 2020 00:07:46 +0530
Message-Id: <20200630183754.20641-1-akshu.agrawal@amd.com>
X-Mailer: git-send-email 2.20.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MAXPR01CA0114.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::32) To DM5PR12MB1337.namprd12.prod.outlook.com
 (2603:10b6:3:6e::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from akshu-HP-EliteBook-745-G2.mshome.net (122.167.14.235) by
 MAXPR01CA0114.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:5d::32) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3131.21 via Frontend Transport; Tue, 30 Jun 2020 18:38:19 +0000
X-Mailer: git-send-email 2.20.1
X-Originating-IP: [122.167.14.235]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: c08a4fa1-686f-4403-354e-08d81d24c478
X-MS-TrafficTypeDiagnostic: DM5PR12MB2437:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR12MB243749D8686438AC76FC2EE0F86F0@DM5PR12MB2437.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-Forefront-PRVS: 0450A714CB
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oy6F6/tEmfNYFLoeE6wMErag/vOiRf3s3driMZQ1oER0UD9hUUkdOHiis1aYfilJVVe5TR4dR8Qar1/zvXlV7qqV43G6zSly932xt9ly+hNbDClT8KiN+rYtfy9xP/WkD25R0C7yrpaJxT8LoMERj9Kt1mPbWY1Pv2MWs2noDTPDuq7Si7hR+K6tffNizxsLUWKrCgR+16jyNztdHHDCOh+AaluA0oz00JmhRm//IJ8etflXf7YJ4a+J7losXlRHMyqFiJhPcOGqAwr2t5Ep1xNG0Fbk39Vnut5p6hKBjaviY8CPDmtEwGJchwBWTZJecrGOk6HsEJ/Y0ABJZyew/ekBj1ieOJMn/kQxXJ8+pXb8V3ag8iw0bg4sItu8c6O0
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB1337.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(39860400002)(366004)(346002)(396003)(376002)(136003)(6506007)(316002)(109986005)(52116002)(478600001)(4326008)(36756003)(54906003)(6486002)(8936002)(8676002)(2906002)(6512007)(86362001)(44832011)(83380400001)(6666004)(956004)(2616005)(1076003)(5660300002)(26005)(66946007)(66476007)(66556008)(16526019)(186003)(4744005)(266003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: WxeujkaKS2/UbYP4j5+v0/l/lcRzg7hsKMZub1heCarKwcSCSu4MtSA8J8ZhvUn0AN0WlZNacItiZDZGfIVHFtfylgRWE7uMkFhqtCgcuhQvR9OsrpwU6WKSH5UVef8Wh5Mh5vNGziNLb2cECD6aIJAroumt9Vb+hFuExKRRTW7LPgtsBmzB8tkBw5qsd/qM5TR5RzsVUqXsXRgApgax+hfO4p1y2Lj9RpQve92M8E/8JjRRJCbr+ROz9vZW+LlO8c3HU9/sJhnYF0GFWHlZtFpRFU4bPYIDTkwEWsysT6YmGyYbShJf02VJavjHAB/c0amT/kmTOWy4pR4nb5abSv/AswSj4g0SN/2C7zO8HUcJXM078g+vLIL2xJkTDvcX3MtOf2o+7xOCI1D7qo+UrZTwVFneACwxUmtwkX/Ats/Vlv6K5hcekcFcbszKa4l9lz+PA2hqvpbFULgP94RBsKdDtNqprxUYQcV+QMEZfU/ya7G80BcaxfeRpQGkIb6P
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c08a4fa1-686f-4403-354e-08d81d24c478
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1337.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2020 18:38:23.0843 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QN4/uslHeBzhCNkNUZE3Fq3Ff0AoiLyDSMjgS0fLb3n5PDeVE5UFjhOQdL77QoBnRr6u6n6s3j7pKfbvhzUcPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2437
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Liam Girdwood <lgirdwood@gmail.com>, open list <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
 Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>,
 Colin Ian King <colin.king@canonical.com>, akshu.agrawal@amd.com
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

Fixes interrupt enable condition check with which now
interrupt gets enabled in dma_open.
Prior to this patch it was getting enabled in runtime_resume only.

Signed-off-by: Akshu Agrawal <akshu.agrawal@amd.com>
---
 sound/soc/amd/raven/acp3x-pcm-dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/amd/raven/acp3x-pcm-dma.c b/sound/soc/amd/raven/acp3x-pcm-dma.c
index e6386de20ac7..5bd458e0fe31 100644
--- a/sound/soc/amd/raven/acp3x-pcm-dma.c
+++ b/sound/soc/amd/raven/acp3x-pcm-dma.c
@@ -238,7 +238,7 @@ static int acp3x_dma_open(struct snd_soc_component *component,
 	}
 
 	if (!adata->play_stream && !adata->capture_stream &&
-		adata->i2ssp_play_stream && !adata->i2ssp_capture_stream)
+	    !adata->i2ssp_play_stream && !adata->i2ssp_capture_stream)
 		rv_writel(1, adata->acp3x_base + mmACP_EXTERNAL_INTR_ENB);
 
 	i2s_data->acp3x_base = adata->acp3x_base;
-- 
2.20.1

