Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BA81E3D249A
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Jul 2021 15:28:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3F46B16DC;
	Thu, 22 Jul 2021 15:28:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3F46B16DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626960537;
	bh=tNmabUvkI6mDOkoWsitr5Wn0MKBSXktvSDOTvjUE7hY=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=YPvUR1pwlz6sjIH6Yzq7YLFPhoQKAoQIqxn3PcSLixXjqiNn0LKK/hgFqkyLAZiA5
	 UmyQ6wKGKnAzovoXwKyMhxUK67w++FDLaH7f4G8id2dyb5o0ZCRH6iopI4Cd1kja9r
	 8of8sqxR9D/fAW//7IdvFNrPMfOJt+A2bR1mJGgw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 522A4F80256;
	Thu, 22 Jul 2021 15:27:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5EBB8F80227; Thu, 22 Jul 2021 15:27:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08on2053.outbound.protection.outlook.com [40.107.100.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 802A6F800DA
 for <alsa-devel@alsa-project.org>; Thu, 22 Jul 2021 15:27:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 802A6F800DA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="K84UzRpV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VrJEBh9FSlJpbO/s1Kbx8/XvoaLIkobweFGQh9guJZgykhyIZTLdZnWdaEtsva+RBVs6H8Uacub1P7jlp8ILOK8+cff/sThhQLEU99rQxotWnurcqsx7qOE2OJMamvFlLswHVZHhV9XnSBiYZlpi7xnJtKEYQpSFlC9Q+4PfFwZS+CsDSoPxBKnCxX8vn9hlRUVQosJJHZ6Lbtg0sDO2sXi6YQMdXyyf60OOV5EPZHfq/OgByLC6TKtqC6hHGFp+yxe9MCidWu0rIhFDsLNrdfuEfqMfMeOMBXlS12VO04ZiAI61u4pGW0yOp2be13kkP0lYCM0UWQlPke9T4jnm/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3jbbtlEvsayePZavH6PkVjuiaytaqc+SiJugKjpEB80=;
 b=RZiqk7VQ6iwRaE4TG3UJTjdL8gztt9Ecmv8B/Sgkxj8G05tmZP8I6RSLAMiM2MYJjccx/5ckDonhoknK2cB8mkL19pARrplPyuv2sLBWZ/E3ZFRTVCCg4tdKaReLi7bSzKEBX9qH5HkJh5kzG3peZpV7uB8C3MSy3xYzRzzAsy3jxOjpLsql/feMcZckWoCbXThzOTYr7z61TSjavTTGIpN/CwvUadCKWbsiWH9W9oRe/Qug3zQBjVMpQzklHbFDna72vxmpBTPPQqNc8RJ3c8JSRehrT5ZcpyEkfKmiw+8Pxdi7gARUD3k6cnYMruM4oRPeyPol6obSZeHRR00kuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3jbbtlEvsayePZavH6PkVjuiaytaqc+SiJugKjpEB80=;
 b=K84UzRpVzwMp1oQf9mjaZFjgJc3Q2DFpI5OLlDPcCH6yOsyO9TUEsNXZhth/h72m2wtvoPhRoe/IMVCvyxdRZ6l3JbGQMOtB+69Xk9jaOcH9UtiJ3ac8NqEVdWSA4nGllcCvY6q8/O2uPiawLWFIv6e6/8j28PKoabEYb9AE/eE=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=amd.com;
Received: from SA0PR12MB4510.namprd12.prod.outlook.com (2603:10b6:806:94::8)
 by SA0PR12MB4592.namprd12.prod.outlook.com (2603:10b6:806:9b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.26; Thu, 22 Jul
 2021 13:27:13 +0000
Received: from SA0PR12MB4510.namprd12.prod.outlook.com
 ([fe80::c05f:7a93:601b:9861]) by SA0PR12MB4510.namprd12.prod.outlook.com
 ([fe80::c05f:7a93:601b:9861%7]) with mapi id 15.20.4331.034; Thu, 22 Jul 2021
 13:27:13 +0000
From: Mario Limonciello <mario.limonciello@amd.com>
To: broonie@kernel.org, alsa-devel@alsa-project.org, Vijendar.Mukunda@amd.com
Subject: [PATCH v2] ASoC: amd: renoir: Run hibernation callbacks
Date: Thu, 22 Jul 2021 08:26:33 -0500
Message-Id: <20210722132636.13072-1-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SA0PR11CA0014.namprd11.prod.outlook.com
 (2603:10b6:806:d3::19) To SA0PR12MB4510.namprd12.prod.outlook.com
 (2603:10b6:806:94::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from AUS-LX-MLIMONCI.amd.com (76.251.167.31) by
 SA0PR11CA0014.namprd11.prod.outlook.com (2603:10b6:806:d3::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4352.26 via Frontend Transport; Thu, 22 Jul 2021 13:27:12 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7783a1aa-4c9a-4536-dcd9-08d94d146a81
X-MS-TrafficTypeDiagnostic: SA0PR12MB4592:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR12MB4592DFB97160B34014C0994CE2E49@SA0PR12MB4592.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:813;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MSf89VGzZnjIj6h5pSaPktzARxS+QRkU60kp7c2CMNrHVqHNQ7JXCWmwTgD0LsMvCAlMZNiSzIHz6Pd1mUFVdLD95BAzIgWMdBPVJeJl0D1tbuXWExmgV3a0mxH0T/QfnDHieSWcKmiDoQL/leWWgNHA06xLFS9mdmGuzj4mKIFqbRWYFsLwqCY0iPSkrtbe7qnfYjd+C74UxANKWi80sI7xx/xSDn6TL/yI2iv6xtYUqoVSPMzn3QMtVJM97jEUpuCVQ1CBnP/Ub43NDf3RmQEtoY+HCmJLpbT8mw/AWRROjMUcWyttx9/GkjalGdgl3+uO8W/Fgw6k8BHpRzruqVQN+8+AeVbfKdKmQ5miJgd3Ab58yUKHwoPwCketq7d6agb+KsoF9K9ALOl8+mm67FafX6YqPRHQQkEKna9fhJioVyQVYmVChfVSYfUQZ7lj2aMHBlttyVl90+U1JBIH9w71t8yK5LMU8ENldFbKaiEOjRQJOYgI5WJhRQLy9h2gkv2OFjgP5Ktod19/ExpTrAOEQW6QEgk9h+dOUocol7B71BtHGJHEhBeG/J9enfCnwSN8/WIgw6qu+OwXv8vnDZOMu8Wb5CxdpMpwJB05j9nYrNi91dfz7/JH9xC0Qb5cbN5NPyoSV5vUqy97+gt4ijjO1X4r76V0bFsaDiv/KgOzoQVYNmFNoJwH19XRqNCd2d0uSR5454cX6LP7Wukq2sbaBJk5yTZX8yBvMe7uRMnI68Y25LZwGSskGMoX5SVGkZVnwP3dQ+nIy5ES5X4OKHAwIjQvrj8ah25FOx7EOmc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA0PR12MB4510.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39860400002)(346002)(396003)(136003)(366004)(6666004)(186003)(83380400001)(26005)(54906003)(38100700002)(38350700002)(7696005)(52116002)(86362001)(2906002)(8676002)(4744005)(4326008)(1076003)(8936002)(6636002)(44832011)(966005)(316002)(5660300002)(2616005)(956004)(478600001)(66946007)(66556008)(6486002)(66476007)(36756003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GRNN8XfWG8YOOKt54WD2Rv9/UQffQOOUt7/n0jifzXZsWgReCC4puWvN8Gil?=
 =?us-ascii?Q?JQPijocPL7aWuvaua/LTTsObfhc5TmBCSmZGk/s9KGFRRc31yZEfV3PrbNFH?=
 =?us-ascii?Q?KMWYQmm1EGSAJKSzCbtN71hHJgAFsX8gITRZgw5qeeaz4VdHMpLWXSjmoZo8?=
 =?us-ascii?Q?xucoUqezzX8SLLO/nC7LsMRikg+t1nzvIHxG5FnVggRL0I0N6g8K5zDG2D89?=
 =?us-ascii?Q?C+e8yNvPflCPCQaa2QRQnmIJ6wkNu4qWohyBdKk/1FPjrc2QB4YA7wAlIbn2?=
 =?us-ascii?Q?yTMUPwo6QsV2J7wytQL6lq7WfHSKsjvqVkv2jiVgidHuKvhl91AndpcDbbPv?=
 =?us-ascii?Q?ZlV98og994wSJjhV6EDiap/ZV2VB6ApKqBcrWip5vPwQ+Y+LVShTgLNyGLPs?=
 =?us-ascii?Q?6LOrv+3jOYMSJARPoVdH35mX1BEiKjqR0R3beKfLUPdXcCgHCKlHRwmo33VJ?=
 =?us-ascii?Q?uU10D1LnRZlwgsIYaBMWiB+Rv9EixT/KlewQQcmkDJKCx8EbTvhv+LuyDHpv?=
 =?us-ascii?Q?CJzWleyYpLiJ5qwpjgkCn48ZNmBIiNp/tU57NHGoX40YB02pJa3jZ4qDLfzO?=
 =?us-ascii?Q?zuibDrOfPeu2ixO4ZWnBQvPsm1TRDHpS/wZx+f/GpoL/EeDIBFXSPwBOTAjz?=
 =?us-ascii?Q?GDg3JRYvLpzxMUI0h/oyaFF+1MEUuhuXxWLKPtJg2I7Sf+sFNYVYBbT7FU6U?=
 =?us-ascii?Q?VgvLbHYI4SYBnkC3rcmsoWEPdSdyhdLI68qHnEFQ3erBv8cufO53RxjdbBYb?=
 =?us-ascii?Q?ZdO2YDm5ONaLydojCkGazvcmTlQs32ib2M3C6pHQs295BN+NjY/uvaOWF5PB?=
 =?us-ascii?Q?yWHUP9KBzgevC+CVzHurS1SCRiIbcp4BOMhXwg4S8WNlw+9yZ+KZA5EG18xb?=
 =?us-ascii?Q?chf0lf7q4c+Piw51GtXKFuKynSCbFeqXUFt7ezp4TgJwoMZTGNh5F/pWpmH7?=
 =?us-ascii?Q?x7EVuzB9g4jlBUtr5jvEqZ01qp5/jCi5tJT31O4NonDh/G9Lnt6f8qPZVM5u?=
 =?us-ascii?Q?GV7MXI82/chpxIj2bk60ZJE+maRJJ5mlAs43RE6AjCWHG/4b5T7nEBQISS+P?=
 =?us-ascii?Q?XF6FSoixCMlqTR3CvLQ0LZrc2srKxl3Xks6Hr9DuX/bOHUODyZ27XEvaasyA?=
 =?us-ascii?Q?9NxSWgdnTz1U0I3x8XXkBqnbU65b4d1i8TK5Id9WlSn2QysGFCFPTORKY8dQ?=
 =?us-ascii?Q?Z24g7L25VOE1j0Y2aGAbRsA0q5p1aua7CBgZ4uC7WXuzODvjtQaFh7LhqtQR?=
 =?us-ascii?Q?XQbHOx8X6UWQ378ZqxdoZsAQz6XeGO9IiNW+HqWDHdmSC+vHLG9bxrPJVT7C?=
 =?us-ascii?Q?WTqOwzkKAIPTRN5BKa0CnNcG?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7783a1aa-4c9a-4536-dcd9-08d94d146a81
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4510.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2021 13:27:13.2848 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +j67vO1kTwZ6by8JOvd6xnWFQxE4BaqaULanUVoYK9ww95yRp8aWHDnA5m0nZ64MEBK2LUfsnWj1DIAkLuz6Kw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4592
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, open list <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Mario Limonciello <mario.limonciello@amd.com>,
 Mark Pearson <markpearson@lenovo.com>
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

The registers need to be re-initialized after hibernation or
microphone may be non-functional.

BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=213793
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 sound/soc/amd/renoir/rn-pci-acp3x.c | 2 ++
 1 file changed, 2 insertions(+)

v1-> v2:
 * Resend as a separate patch from threaded series

diff --git a/sound/soc/amd/renoir/rn-pci-acp3x.c b/sound/soc/amd/renoir/rn-pci-acp3x.c
index 19438da5dfa5..7b8040e812a1 100644
--- a/sound/soc/amd/renoir/rn-pci-acp3x.c
+++ b/sound/soc/amd/renoir/rn-pci-acp3x.c
@@ -382,6 +382,8 @@ static const struct dev_pm_ops rn_acp_pm = {
 	.runtime_resume =  snd_rn_acp_resume,
 	.suspend = snd_rn_acp_suspend,
 	.resume =	snd_rn_acp_resume,
+	.restore =	snd_rn_acp_resume,
+	.poweroff =	snd_rn_acp_suspend,
 };
 
 static void snd_rn_acp_remove(struct pci_dev *pci)
-- 
2.25.1

