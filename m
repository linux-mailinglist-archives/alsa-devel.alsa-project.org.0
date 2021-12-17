Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CD6F6478ED7
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Dec 2021 16:01:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4D65B1FE7;
	Fri, 17 Dec 2021 16:01:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4D65B1FE7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639753319;
	bh=ko+q6d2DCI7f8UEvG65CU0/X4vB2g/+EPCXy4jLCmqc=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=M/INWpDfoKRaGFwpWa78K8VMR9fvsaargNfhGFMAG/MVfocYJomoW7areeiUsY4vZ
	 puuZ0BaeDuLQClMn78FXsL2S67aKruHJsqaSYtMcj3bjucrMhuSqu8dw7iftfKhf9p
	 ya9Xld4DjmNnTLSbLtgYkymwoVIaNsy/EAsI1hyk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BC367F800B0;
	Fri, 17 Dec 2021 16:00:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 04F42F8014D; Fri, 17 Dec 2021 16:00:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 391D6F80143
 for <alsa-devel@alsa-project.org>; Fri, 17 Dec 2021 16:00:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 391D6F80143
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com
 header.b="BdXgE1+N"; 
 dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com
 header.i=@oracle.onmicrosoft.com header.b="isG5RtZr"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BHExQIn022350; 
 Fri, 17 Dec 2021 15:00:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=/7/JWOY2YscqIbHB13TvJun3fFoYMagqiqaJzTyQC/U=;
 b=BdXgE1+NyqZfku4OAgj3d90+pSx5wOFsiYqWEIYbeHaaJGxUp0dscWNJhIQaT5QT34mX
 GH3zjTkPKvLU9PecVJXTi93BgF2d85MRqjWP/NtHitEKYBq3lPg0DyjtY7xahpV+P8o4
 1uMNttyiMNsS6FX+gWoAfbIiWXYme4X9ZFxDGgzlNX2GpCS032hGYEqq3upN9Lv9JZu7
 St9a0JogkGeOy3hXIFMhxDurQedMfDmSom697Vz6/s2msSSM6K7+NhIudOWAZIZ4DT+E
 AAJMuja6x7F7l8Jy9go495fdpN1+zJw8yLR+smbwyIav/HWaymcRij3xRS8DMUICGgoV /Q== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3cykmbnxfc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 17 Dec 2021 15:00:41 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1BHEud9X149458;
 Fri, 17 Dec 2021 15:00:40 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2170.outbound.protection.outlook.com [104.47.59.170])
 by aserp3020.oracle.com with ESMTP id 3cxmrf1j77-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 17 Dec 2021 15:00:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CVwmTbE0IsrPoCqLgX4fgBJZR0o1U2s7CEat88VmDxh8KAvNX+H4b0g5eTJ0uVfN3ApJ/kM006fO63Wjk3BdBwIriN1US2ALHKnuho/vmdYYvnuIMZ83zsUb9OHZMhs8RVZlf/n/+9SoCDrYKalVkZHSc20pEleLwlGVTzk1NdHkPYlZbVsLlqevPtFzBHyPDNd7Z3bf6PhPEyqgWOv5khlRZAz/3uE5dsvTiKQ5vsvgbba512fZGBCM8CY/+aW5p7JnJGwjmtBwFwKHXNLoej8vu1swp3losBbGUnGi6TBjDER6JYN3qtp4cBSfPmsOhrVn+EWrXsLAiwf3+41nRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/7/JWOY2YscqIbHB13TvJun3fFoYMagqiqaJzTyQC/U=;
 b=HB9WqPZ/D9ThvNoONyecJjtmZbgUUxPWsKG9oj9l1pgEbjwPsCdXcHTQGuPSnukr6/1qOtIlQx9pspfnrqClhMNZv1weIEMEAzL1JNKU0lq9RIMGqIapBhWe1Uqjq5496hz5cunMlqcJ5JY0nS8E+/wHDwah/LVq6eH0xSYLqkrzrfNJCB7k/xMJBAVTzRB+XjpXC3KNeKbsooH/10dFcZLCuNkjQNhWXyVf7ziXwU3dyo7ljFzdiIVgXWRRJZ+Z2YMLCbj8XdxvW9TOmVwT9HwEwffDsn/hy0V0Wh8Bf6Xij9K9QqiM7d0rT4EefUW8uf3WukaiqXZc8e8OnxL2/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/7/JWOY2YscqIbHB13TvJun3fFoYMagqiqaJzTyQC/U=;
 b=isG5RtZrY6h4R6evZpvWPb1aLnJmm4J/VDnrTeSaUyM6euaP4gDm1sUjoly4CtWppYAl4CoCUO3pW91Asdeg3iIs/Z4m20YxvZGTyq8v2u6/dmck8Y/CShtpwML2UkrlBVamzaUXNDDa3UGo/onG6BveR1w9ay6ni8SopzZtZDY=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MW5PR10MB5849.namprd10.prod.outlook.com
 (2603:10b6:303:19b::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.22; Fri, 17 Dec
 2021 15:00:38 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::7194:c377:36cc:d9f0]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::7194:c377:36cc:d9f0%6]) with mapi id 15.20.4801.017; Fri, 17 Dec 2021
 15:00:38 +0000
Date: Fri, 17 Dec 2021 18:00:07 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Miaoqian Lin <linmq006@gmail.com>
Subject: [PATCH] ASoC: qdsp6: fix a use after free bug in open()
Message-ID: <20211217150007.GB16611@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0065.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:21::16) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8bcd0f9b-6d38-4780-b232-08d9c16dfc2c
X-MS-TrafficTypeDiagnostic: MW5PR10MB5849:EE_
X-Microsoft-Antispam-PRVS: <MW5PR10MB584979F08F507A3D98FFE0018E789@MW5PR10MB5849.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:949;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HLlt1Wk5lB5Pk6Qr+D1cyAn0sK7jpRq9v+G8eC5KY18NaCm7ltvdjeHeTc4SBAeZZAiLmfdotcGb7VjVrD2uRlt5y3vpeiyLp4QZCyWegNoxzU+d1d+khDPafgl0Nzv4fWcDFnDA9s1d9Tuuqp9WoL7LspDZxw8S6cCLwca9/8+2dN2huog0Av37qN9y5ELswrkjwtxzSKmLOUNVVTqFDUcDCFKObAEmtfzDxylUNxW/RAUMtPwdXbXZd5QdAazEI7DpnJ0ijXibqRhGtVQga79wG5REzGjEswlqH2iUMPFXwz3zGBkdo+xlcHK3NbTHnebgkxrTijxABh2Vu5kLmzIvsrWouLTa4PpeHtdeuIrDzd7vCdv1tiv6uNB9i6JO+k5FXY/BzWW9xiAkvB8vM+StuITB+hOcapCJYxLTtMyGvB02+00y5e1V90cDnIqhvXXvaF6cW4UkP+L5FIEUr32UNuVeRyba6MeZ7OUH7BwzivOCFHpe2MA7zf8jX64JiiDu4iDrooxx7ido30ksMFBoB3/tvSrWVzYzTlOZpX8Wt0MhxhuJ/UF8pC6oc695DnVC1ku24QlknOFcqlpYKShvlmQ+qcLLCE4qZpTwS2M6ZDsPdAshaivkTUNSKheCwLlxXT889aMxKNmT/3IXAoCgGT7R06GlDg+EuVy9tiXr9xcoUJZec0a8xLaEhaCHE4ormEZ6ZA3LScUQzQDwUA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(7916004)(366004)(33716001)(508600001)(110136005)(38100700002)(4326008)(66946007)(8936002)(44832011)(7416002)(66556008)(6512007)(52116002)(2906002)(38350700002)(6666004)(1076003)(66476007)(9686003)(54906003)(6486002)(5660300002)(26005)(8676002)(186003)(316002)(86362001)(6506007)(33656002)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VcRG5VSpkOMxSoCJG44g07Dd+ZKqoD9LSe64aDzLVATbnP9b1+TYoNqH3wTo?=
 =?us-ascii?Q?gZ5IEACSPWEmtqGIqG2yqcqdeypwh6E+JOORfge1LWyblZjgZ2pph+9MGnFF?=
 =?us-ascii?Q?nT51Che1oPe8pnWmtrczlz9/6ONoMJnltmisCNtOdYCMczfoKaVwKHqpS+bA?=
 =?us-ascii?Q?R47mfsLxNulOsF56JZVzimyb1ovhqBjq3p+JHcMyEG9N1Q9pHhz+gcS4LvcT?=
 =?us-ascii?Q?eJfDqWNP2H8f648tBhfDyc1KM+af41akloSzWxqzSgUDPs0dlC6bw6KP0Jhm?=
 =?us-ascii?Q?M2QI32dYGo05xkt8knM9xNuSAFkPF6cbZ34zXik6e1RFK/u+jlvE1MTKad1A?=
 =?us-ascii?Q?GZG5yOxLidXoFvc9cjdDiH+D9730VyEPmgPRJDRzqWNSnYN87qm/fK7sqBLr?=
 =?us-ascii?Q?WUfpK7h4MmdYCIjZ6FpR3g8Df2zRVHIDhLYPDGcttQiLpN8YIT/Yvgiu6Cmg?=
 =?us-ascii?Q?HWCF8urZg2ILfnDTbHnvdgk9k0i8hWMmfMTBDeU2VijLu9XRqGYSLVegjCxB?=
 =?us-ascii?Q?cvNPtAprA++iE5mZEOD6i503F5UUe3P3EWyxbcHNh1HvT+EWTLTSDaB66hFu?=
 =?us-ascii?Q?MbmxQZAuy8LOICCUABDFy0w6mZICtbTXCWfLJnHAePW7EhnzqvmZf/3LVwX9?=
 =?us-ascii?Q?8rjj94nqRv5gCWUi8ZoAZNpPIGqYgI06kFrOYl1oPYbLuumEQauypjuMYhku?=
 =?us-ascii?Q?jK1SzJsUYLE+CWsposz9vkrrEf43v0C2WTtLIjsS0O+V3H+51w7cY36LhSBF?=
 =?us-ascii?Q?vNEdoho+EaJwVvXgMSRkrs5xra79ELh8ErDjapz3LDSpB7sEbIPMFEy8mHq9?=
 =?us-ascii?Q?x8i59dfpDYAeiS4TRkNcdA4E+i25/HmwTxEzaynh8g6hDdgM9V4Wu37P0iVp?=
 =?us-ascii?Q?1vvUHIcr7Npu5F7bP0qbmURUv5wzeXFHs7xzj6QBOtCHfxKIlobA5J8ruofB?=
 =?us-ascii?Q?qp9pAfPuUFGEMSfSUFrAoiI4IdMpVjjaeBF6qnGedVL4058OCj/MySmnmLuf?=
 =?us-ascii?Q?XxzZJT54Zykoblxt0oPtvcWAoemcpReG335jh8xCdslvA8lyGIRD/rWoC5IV?=
 =?us-ascii?Q?nEVPLeSQD5BoUTCn2TR4vw1In4gFHOJotHf1eTWh2x/n3wWhq8PJohawTxcK?=
 =?us-ascii?Q?6VGu41ZXB91pCCV0S1HJzGeFQK/L9v3A70wrxIglY79+TSsBAQqFcParM9pY?=
 =?us-ascii?Q?0Z9BPZgciW/h+a46UKGXAZvJj+/JtJI58L8eI5Chj4EbZdgDhfYlS/TZdbGL?=
 =?us-ascii?Q?vbUzI48nO9XMfogngLm8IZjB39AovRuQ9Nle8Y+PLbdEPdVas3yuOsdcW7cp?=
 =?us-ascii?Q?6vIFTJ+geDpDR4Tp6hUt06uIZ+CWcwuy1+tdLPBGdZU7whQjmHQAX5L91N5F?=
 =?us-ascii?Q?y0bSexhxLr0vNp3o20Pb2jXZG0wzKzEYMflj4ZnWpOa26UhHNn7HljCNZHjX?=
 =?us-ascii?Q?ZU2iM3PX8Pa/2jPAx5aGeTvhGXevFFnxdhRKkDPgq+IR6BTvkNogyIUj2NSq?=
 =?us-ascii?Q?GcpXUDe6KDIMp6ykkZyfB9U7H0F4sJPya7A87RSG5Kt7sPTBP+9frPdCpRIS?=
 =?us-ascii?Q?GYWQEiYKoOYDcWBhWF7qRjHDdqzXGvKDzcZ5JXiQUVg9VBO3SPJpwwYW7i+1?=
 =?us-ascii?Q?leQcBmsUJlRkxHJoOHyAc7zrn1PIRhehs9N8P+03m2LkBhJITnLmivokBgG6?=
 =?us-ascii?Q?77XwVmIfcWc7kTPfbLuMZLIEZf0=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bcd0f9b-6d38-4780-b232-08d9c16dfc2c
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2021 15:00:38.3295 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zl2rRWtw4VG55mw3xguq+w/JT4VlCxgeRrYR3m6lVXoK0D50SNIlYhmnrwPWd0CTAX17epHel0Felwl1ciwM3lz51k7R8lBoLyoCr9kbrTA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR10MB5849
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10200
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 bulkscore=0 spamscore=0
 mlxlogscore=999 suspectscore=0 adultscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2112170087
X-Proofpoint-ORIG-GUID: RiPurJPq6lRV7e5v6Ahv0ZrycqcAvsy6
X-Proofpoint-GUID: RiPurJPq6lRV7e5v6Ahv0ZrycqcAvsy6
Cc: alsa-devel@alsa-project.org, Banajit Goswami <bgoswami@codeaurora.org>,
 Liam Girdwood <lgirdwood@gmail.com>, kernel-janitors@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>
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

This code frees "graph" and then dereferences to save the error code.
Save the error code first and then use gotos to unwind the allocation.

Fixes: 59716aa3f976 ("ASoC: qdsp6: Fix an IS_ERR() vs NULL bug")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 sound/soc/qcom/qdsp6/q6apm.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6apm.c b/sound/soc/qcom/qdsp6/q6apm.c
index 3e007d609a9b..f424d7aa389a 100644
--- a/sound/soc/qcom/qdsp6/q6apm.c
+++ b/sound/soc/qcom/qdsp6/q6apm.c
@@ -615,7 +615,7 @@ struct q6apm_graph *q6apm_graph_open(struct device *dev, q6apm_cb cb,
 	graph = kzalloc(sizeof(*graph), GFP_KERNEL);
 	if (!graph) {
 		ret = -ENOMEM;
-		goto err;
+		goto put_ar_graph;
 	}
 
 	graph->apm = apm;
@@ -631,13 +631,15 @@ struct q6apm_graph *q6apm_graph_open(struct device *dev, q6apm_cb cb,
 
 	graph->port = gpr_alloc_port(apm->gdev, dev, graph_callback, graph);
 	if (IS_ERR(graph->port)) {
-		kfree(graph);
 		ret = PTR_ERR(graph->port);
-		goto err;
+		goto free_graph;
 	}
 
 	return graph;
-err:
+
+free_graph:
+	kfree(graph);
+put_ar_graph:
 	kref_put(&ar_graph->refcount, q6apm_put_audioreach_graph);
 	return ERR_PTR(ret);
 }
-- 
2.20.1

