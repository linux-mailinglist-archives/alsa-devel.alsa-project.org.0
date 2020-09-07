Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B0AB025F23E
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Sep 2020 06:03:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3123B17BB;
	Mon,  7 Sep 2020 06:02:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3123B17BB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599451385;
	bh=9nAsnymo8amUsNBJHRL2YN9vwnzFbQ9zqFs3rzNvwVg=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=YBOlloUkpqCRv3NABlybbwchtM5nqmtmKaUMOkj385WK89ba27j9wyE/K6H9x+Mqe
	 XBL9sKjhJ523KCt29K76Foy5tB1VVzw6GJHywO7L6jDkLNS3NiQYNWziwL5QBmXWBB
	 DUguFifvGEXzoPPZsds0lH1q/R/R+c3nPG4OeZYo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 54BE6F80240;
	Mon,  7 Sep 2020 06:01:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BC176F80227; Mon,  7 Sep 2020 06:01:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FORGED_SPF_HELO,MSGID_FROM_MTA_HEADER,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2040.outbound.protection.outlook.com [40.107.223.40])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3C175F800B9
 for <alsa-devel@alsa-project.org>; Mon,  7 Sep 2020 06:01:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3C175F800B9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="qCxcvXcS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MccTc8G+dMd1pGAyEvXl8yuhFqWAr31RT6Mml2l4jDNa4jgsRL4BoVYzBPYJFTGgis4GT0d6y0NQ9qfie2P0mux3YvS9/geODmAeMhc+TBehlMjHGhOjLQnxYNc/BKA9ciCe8GkiXlatHTlh/Rco0y7u4S7gB+6+Hdt88GW8m0oNDqzieu6JhG9drCu2l0uZXtVLz2f8iDVRDeQAR1X4P7eS+znYNTg3bie5vz8ulN/UpEc5I5ZsMfE1WTRbUs9KXVB7U3aZnkA1L5LiGJjS0vtCAHT76n9cNiF3wT5d4+OvvWrW4Hw7zlXvnZOxnSBPUlFhGnQ0qfJi4iAdsxu0xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u3FU48ufH16I77XoY5GAJToYJfa8nkyqW+DjLFkNqcQ=;
 b=b1MmiPsD7m0JHqQ66MVhd8SIndIT/Aaln6XNspPEnBGctXGdvPErMqIxvlXPpNnmCqu0LpnIjS1XGrRkc1HPfRD6A531aF5M0VwYsY5nBLKZz2dYCmqO5x+H8CO5f32yx6KjMs2Gv7+Rt/fWATJyLjusL+zYGDfCt3sedjntMHj0dK+NEcChONJruSPkLd72gKZlP+lCYJwfx+VE9uNusg9MQw1hKXZS8CpRLsRMlTHdHhOW7zHUJGEyDvrsbRhG5EfZ0TXG/yXZSy9AtKVXQwfBY6gzd6VsJoDexUSjkgEtAmDMapTrXiSI83/nXP5x1yhOMdexiQLxrEkExYCkEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u3FU48ufH16I77XoY5GAJToYJfa8nkyqW+DjLFkNqcQ=;
 b=qCxcvXcSd5A6guSuUjgASpLkhhSDWpcB8dy8tBxpifgp0KFdyQe/qofzmGzXHlJA0PGvFZ04JvCBFjKit382Yj6XxA0MxbrhPc0Tc8wbZ9tT+JE1U94xON91AbRTVQfK/LldESxrvqfmIMlBfBVd0sRBhYwVjNBPysOOmzo213I=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from DM5PR1201MB0188.namprd12.prod.outlook.com (2603:10b6:4:56::12)
 by DM6PR12MB4315.namprd12.prod.outlook.com (2603:10b6:5:223::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.15; Mon, 7 Sep
 2020 04:01:08 +0000
Received: from DM5PR1201MB0188.namprd12.prod.outlook.com
 ([fe80::4df1:4ad8:38cd:128c]) by DM5PR1201MB0188.namprd12.prod.outlook.com
 ([fe80::4df1:4ad8:38cd:128c%7]) with mapi id 15.20.3348.017; Mon, 7 Sep 2020
 04:01:08 +0000
From: Akshu Agrawal <akshu.agrawal@amd.com>
To: 
Subject: [PATCH] ASoC: rt5682: Have global name clock option for parent clk
Date: Mon,  7 Sep 2020 09:30:37 +0530
Message-Id: <20200907040038.3124-1-akshu.agrawal@amd.com>
X-Mailer: git-send-email 2.20.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA1PR0101CA0038.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:22::24) To DM5PR1201MB0188.namprd12.prod.outlook.com
 (2603:10b6:4:56::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from local.dlink.router (122.179.60.60) by
 MA1PR0101CA0038.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:22::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.15 via Frontend
 Transport; Mon, 7 Sep 2020 04:01:04 +0000
X-Mailer: git-send-email 2.20.1
X-Originating-IP: [122.179.60.60]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 449fc26f-1ac2-46ca-2263-08d852e2a5e9
X-MS-TrafficTypeDiagnostic: DM6PR12MB4315:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB4315919BE701B0A6367F3E74F8280@DM6PR12MB4315.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tNHBQeA60/9bXHOjOqjNJqvFh1BQ+VrQgiHzJMu7sLm/6tHENAVUYhEdWd2OS6upJlkz/kPGPoEID0TdBrLKm42caYT1Zin4zxbGLyONcdz/CWWYusGIzm3oB56kuftY1K0wO9n+XR5fpS+dGDccsI/yojpuZoSWyv+Qyykqm41x8cSlzQLlUvJ9BM96LNy60DvFrnoCLbVdTvCZXZJq3JcLbjFaoQylHKT9ncCpDDwrfLYOfZ3kw2dWBhUj9m/Tx7qcbLGUL2fe/6fmi5/XlDzn+QQSS87QpfRqYCH760O/MsyvfAQSJk3wr/XjMVIxm8ydOPayPpB6+Jve90eWqvJP8ca4AqWVhamYO/R7K+FW/OeyVvkZTzWsxfR2HQSZ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR1201MB0188.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(366004)(396003)(39860400002)(376002)(66556008)(66476007)(1076003)(6506007)(6486002)(36756003)(956004)(6512007)(8676002)(316002)(8936002)(2616005)(4744005)(52116002)(16526019)(6666004)(66946007)(109986005)(86362001)(478600001)(44832011)(4326008)(26005)(5660300002)(54906003)(2906002)(186003)(266003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: xvlOFXqli+k2YwP7vAyjj9RcilRJ+t0aOZMxdTNw/5F5rfTWGKw1iMttLKNH6jyUfLMmSEbtvhGu93wsUqAMd/rAqnJlS1IYi0z3XgjUjcfr/S7hZa+bk4dM6tWIwiGF8xoxTGqNAaLfQ2hBqB9nh3T8czgbhE3GDrdG50csbWlDZ+wgZeYGOmelinJS5Fr8tBeka2uD4HqBqJdfVF/czXv+caRMyFGB9YG9BNTu95Z/MQJdvXVLPX+UDbZTJ3QF9Lt2JJuEPFDe1hnNM7+PbNeq6BLYIog2Rl1GuQINQmkl9YTPnq2otSe8OJsQoC31lWLJGhq9XkskuVEVnL/Ej1E1XveeIvoYMFIH1gI/sbPqGh9felKfuCWhqhN5oZrAZGIboFFm3Ua+ne7Ju7FKluhRLeNgVulkbMQuSLszFKI89tGDelNsV6IOKqsLDmDM4z5AEiF78Qz2pM2pgmZvVTytjgpbhfUxi9SyDOlYL8VL2pBB+nOHNfHqQu1mI35xMnQ8JFZR8ImW/fg+cT31TdXMiB+na8eaCu2U9YzIn4mwLgF9WZFz/83uEcxFA7Tg6jdoulxCINA6Qc3CgncJ1y76dgo3HPuy0dhHhoaTLxz1iQqg/JOU95wG93Kw492TyoowLXqRc70V9cxs/QF1+A==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 449fc26f-1ac2-46ca-2263-08d852e2a5e9
X-MS-Exchange-CrossTenant-AuthSource: DM5PR1201MB0188.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2020 04:01:07.7638 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KjvgCi3q4cBqA70z17v9kZQyzgcFlYjcEPht1gu0mHIEBIe1jgB2pbPjwIKx8MpPWx1+/WCiKJ90YOmdR1M2jA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4315
Cc: Oder Chiou <oder_chiou@realtek.com>,
 "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, open list <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, derek.fang@realtek.com, akshu.agrawal@amd.com
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

When adding parent clk(mclk) to wclk, this adds fallback option
for the case where global clk name is used.

Signed-off-by: Akshu Agrawal <akshu.agrawal@amd.com>
---
 sound/soc/codecs/rt5682.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/rt5682.c b/sound/soc/codecs/rt5682.c
index 93ebf0279b62..26928bc49bcb 100644
--- a/sound/soc/codecs/rt5682.c
+++ b/sound/soc/codecs/rt5682.c
@@ -2780,6 +2780,7 @@ static int rt5682_register_dai_clks(struct snd_soc_component *component)
 			if (rt5682->mclk) {
 				init.parent_data = &(struct clk_parent_data){
 					.fw_name = "mclk",
+					.name = __clk_get_name(rt5682->mclk),
 				};
 				init.num_parents = 1;
 			}
-- 
2.20.1

