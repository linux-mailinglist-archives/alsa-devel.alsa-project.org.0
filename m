Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F0E254DD51E
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Mar 2022 08:14:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5DE811836;
	Fri, 18 Mar 2022 08:13:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5DE811836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647587647;
	bh=fqFv8JR1Y4Ioa+hekkrBJXzpSK/RnNiCv7SWxMaAMD8=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=USgk6j4MAfrAJJnLXgbgRIHvNZrKN3CGMM1rXDux5pnRJQ9mRxGaKjkCUuGDEpBUX
	 BMimbeBF9kYxpzn5f8orF83S6Lo6XkCLzCDhJ9tjc1SPUL18r4PqEr+lx66YoVL1/h
	 nykrKfVS4S8d8YapHLdeLek8sylXZIkQG7IqEuuM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2DA25F804CF;
	Fri, 18 Mar 2022 08:13:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7C9F6F80118; Fri, 18 Mar 2022 08:12:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5620EF80118;
 Fri, 18 Mar 2022 08:12:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5620EF80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com
 header.b="xzpgI72w"; 
 dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com
 header.i=@oracle.onmicrosoft.com header.b="l8vWUlsE"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22I3Swwn028965; 
 Fri, 18 Mar 2022 07:12:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=7Vj2rpu4xlwhqz007CGcn2uE64Dwzg615EusHu1YYVw=;
 b=xzpgI72wsM6h3YifTfUjaf7uojqYxuoS+r8FPOUhRCxcyCKdCM3lOCbUA/U1NPCRrO9V
 uHUS877drP+tKa4zWm0shEQPShk6m9nSJjTxS679ntFbSUCuLO8sY5gQ6PYuIAoUJteJ
 BYDDkW2wpneYdqxxpUeepI+hSYAGCDps9rTPM4B6OIJ4qm7wFSR1g5USWUJgPOAK+oTr
 sLcdg4PsSchwCPfiK8JLyvm0v5rODv5GMvu2zUK0xM+sObm3FfCdZSxb+GmHY5NNCzbV
 Iz8NEs5Qu6jViUHwPI0x1TD6Odm4q9GMGUoc5roEKhfa95pdeDoejedbJXnOtPJmVvX0 aA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3et5xwtww9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 18 Mar 2022 07:12:48 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 22I7C8rt058964;
 Fri, 18 Mar 2022 07:12:47 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2100.outbound.protection.outlook.com [104.47.55.100])
 by aserp3020.oracle.com with ESMTP id 3et64mptp1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 18 Mar 2022 07:12:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S1AP1IrFke+cB51AGaiw5eHqoIP/qZN7zZwzO1x35sIsM3zwpKQVUKY/t/+iTDxkGSD/8dXJ7xmfXGNvONjQU0IqBUipJutTOrIoYUpErpZmtFb4MqN16U43KDR2UzUhSqCSGt46tedOUZyE4Cyg6LBrYiy7aR2pyVImP7xVVpTFwKtZySA5UdSdYgKpFbug3/1uli2/3P8k8YRkIGpEQZNPzLo1jBnqsbMD53MT9rvz4j3rksfq3aMF+vZ2dXcYBGZPUxNI7cuziA4bULpv1A2A8r7A5Z6baKkYHTiGgrgyEdgdpUPUqUTCcju5wEwUwHyfPGciA1r5pnTHZoVvNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Vj2rpu4xlwhqz007CGcn2uE64Dwzg615EusHu1YYVw=;
 b=lWaZe/jtL2jS+Kmpu3l6+1VmAh5UJ8DdjJ2XUZ9MGI2hFl2cSnH40NPhhvaZDuDJ/Dlq0NgwWZofSDvDqa4WjRynPX6Rr+i2YlZiXetFAy0Yo28ZDzsw5kq5R85wvPxzfVxfcNWflcxyB8alSPYTAm5w9MXyCX0Gt7VkBWS3eZNniE68FU00japF0UqebO4AoFcE7priDPK7X1NlBgmRqKsRecR7ZBwFpLV0T8GUZrGW025A+mq0a8/0+wFrAs5BsOgKyq0IwT+mEDqZJrBXAElOrmebYCtGNniiKGTcCwBSkgxvH773VLIgm+0g7wjugh3hgs/SDnL19twfvq29xQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Vj2rpu4xlwhqz007CGcn2uE64Dwzg615EusHu1YYVw=;
 b=l8vWUlsE+SvvnxjU7DKcPFtvzmE2DgaEEgHzm9cdHXXeGRf30c88jbXc0aPumloZY5ojh0LosHMD4dk6ZcZu+/YpJpzzxkBFuTExvHnkDJ3DKBAp6gp+11dzmesWeJQ4oeNaad++sUnm2jxHwyz02o71i7nUWFlQVG2BwHy3Mj0=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by DM5PR1001MB2059.namprd10.prod.outlook.com
 (2603:10b6:4:2e::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.14; Fri, 18 Mar
 2022 07:12:44 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::2c3d:92b5:42b3:c1c5]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::2c3d:92b5:42b3:c1c5%4]) with mapi id 15.20.5081.017; Fri, 18 Mar 2022
 07:12:44 +0000
Date: Fri, 18 Mar 2022 10:12:33 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Subject: [PATCH 1/2] ASoC: SOF: Prevent NULL dereference in
 sof_pcm_dai_link_fixup()
Message-ID: <20220318071233.GB29472@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0129.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:40::8) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 860e96a8-74a6-49e3-3020-08da08aeb27b
X-MS-TrafficTypeDiagnostic: DM5PR1001MB2059:EE_
X-Microsoft-Antispam-PRVS: <DM5PR1001MB2059AD20E6A1890D0097D3B28E139@DM5PR1001MB2059.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JTuav4KNHXOXLxNPaMgegtRAwRMfGhiazA42tYhGsonqfTkFXov87o9rvHUdncBuVHZhdnQJQQegAP5hkv5GPWhyRQ9xHW070GOJcLUU/Z8aNJKbvy/NkJr04YptLNuoWAWC6uENl5LsyC3XfVI5EQGFVEAAsqxUzqnuD5z45VbWQPOIaPLL2rltB1YYnwiAj6ce6NGF7JPc3AaXCXrbSffMYkR/2j2DfZE3kEFZhiWfDA+OHRJGLPolvG4qJQVKam547qfzY1mUTjGgSXK/boOpJGksPGDfHTL2O4TRUdIQ39QgquOJtaztWOtBMqx8xmvkR1fifRU7gXqoP7zG/6PwYFI3+yHBMvO8tOmwF+q1Lj0NQyLuhC9bMQZmXXXFYDBvojDOrAiBVPIEWejrk6pSL/y5h4vUc6VpgxG270ZdhCoFMWMaoU+KZ/FNDsmu9pd00NtCn0R1aFZCNL4S4a8d7EmQe5SEpgP6qx5eS/zR5vVV9gu2X8piJ4f6FJtaIyCWWei3X8dm87wfBKKKaG+DESLq5knU0s7Jgcp4MI3LSDffULvGHs2bAVy4H/8yA2ek3etItSXNnAutPE2DbYP55FhjntzFRIm4jDhVA6PAvdhNjxF+sM8Og4Pw5d3lZ3fDQz0oWjkTzE5AWCydaSOUxe2AKXyg0WfzoXKuAO4/6BaAehU/oa38FBTNCvMMUwgMGz5nNq1J1YE68YJqSw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(7916004)(366004)(38100700002)(38350700002)(54906003)(110136005)(33716001)(316002)(66556008)(66476007)(8676002)(6486002)(4326008)(66946007)(86362001)(44832011)(7416002)(6506007)(5660300002)(508600001)(52116002)(6512007)(83380400001)(9686003)(33656002)(6666004)(2906002)(8936002)(1076003)(186003)(26005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?oY1wyQNLLgl9eQqvL0jvHpaXzqZFMVdwV3Er3b9ak3/8czIYVP+vVsjx/hEn?=
 =?us-ascii?Q?RYyKKdUD6rNXCwUrWal5LcwO2sIR/oFL+WY2GVA2DezsBfZlEIWtKRpcJJ9x?=
 =?us-ascii?Q?BjR+zU0ka7sPDaYqCMHXu1jnsEABzmMIZDgO77g2oWOSYS9tSHLKfnQsGdDH?=
 =?us-ascii?Q?9hD347BP3r6LiL0AYLkydrrPaGVR3FGPwz+vjdliFycK4TXFWRz9DaK2QBgQ?=
 =?us-ascii?Q?ee6rGE9IHau6Y3gNI3YVjuMQj3uPQXZLyz9ATLJbp7uUoKK/xd7mVSUwWNTh?=
 =?us-ascii?Q?ktG/8bnY4xjL1mcKKbwayMHL9w4iMUxKMQrYDZQjI95vQZqFIqp+hJGoxR+G?=
 =?us-ascii?Q?8Q16/a1yM2B09wmpcdGztaeuOLilXHzvss3Kht8ARHlXrH5kfnkhbJWqCtRe?=
 =?us-ascii?Q?dWuKY14yNBwzJElburSzbe00RV6XpD2o4CSHhLjuZvEVIwwz27dg8YfZlk58?=
 =?us-ascii?Q?2jfhbc2doZaE825pPvkNk2WdfJ3ULCc1OSiDGqOwT88p2t6gDswxvOHp/Uhj?=
 =?us-ascii?Q?1BnJVVMNFb/kcSfJJ+q23wihH6TTxA5htrh56FAeUbuv9oYbGOT7YVq1C9nx?=
 =?us-ascii?Q?MEEqem/tDkEMj2zonLMIUkYapjQE7ARMl7mR6HIwrCpC8WRf7SR7hjPrV0Jx?=
 =?us-ascii?Q?KcjTXbIzn+S+8VrLHxS1Cs82/G/40RlWIYacDYD1C1+Ic8eHz4Etrz4pZuvL?=
 =?us-ascii?Q?23qfk2rYwVIzV9kbr5ahEjaiO+bMB89hKd50Ey9vTRlC3KM9yOixETo/Dw3Y?=
 =?us-ascii?Q?F7JREYjNPiQN5gnsfuSJfHyuu5wRO/KKdye+YF1PKqKTPxr5onFu2z0LFZPX?=
 =?us-ascii?Q?l0qzanCuhzvm7Vrq0565UYitmqruKC4ZGZQQllPQQ0lpGSn+R/llK5PuezNO?=
 =?us-ascii?Q?h+d3H94uZgzqKx7kx3V5vuiK9G7V7ax6XCcln1WVEuki27LGQY5e2qq9LmJy?=
 =?us-ascii?Q?NcIbHDB7z6/n6r1M3QcnmkYRVKzmBdXQhjDuUVIpDI9EKCBoJBeaRNIxw8I0?=
 =?us-ascii?Q?XxLRCnAr43R1tC1LL4GbaKFWHS7VppbEnzSQL69zeM+dxQwrgvIFBLX1KYh+?=
 =?us-ascii?Q?6IgAulD4zH9rwhGle9hDzLlFqxOXSD5mzoFXwFlf8T21sNwYHwmb1zySenld?=
 =?us-ascii?Q?cDuIWNSxXS9G1ncTkRpJehnEnBrVYj3nHQO6U89bGlU3eNZwTEC8eyjgEOv/?=
 =?us-ascii?Q?0c/eVhgtCwPENV3MKzPMzD99zsnsslChvNPagbcjmjCGiTYkLUVP1eeHF7aY?=
 =?us-ascii?Q?lEecnTKK4sjxdYPYigrbTgFU06konjPxCujGTcPK0UnXW7DvsTIWAqur+PnS?=
 =?us-ascii?Q?Dblg95pKSsMZ3zT6apDFgiL75lrxcd1YT9mHK0hm/ojnQEA6JqEpijw/fKNp?=
 =?us-ascii?Q?q8HtGwJwPp7dgs52qGHQHwwQ0zXK8yc5u9cDzSQkNUkm7SFMJp3Jz5GfBdMP?=
 =?us-ascii?Q?Nh7MOztfIl8Vtn4/57PenQVgQYfvzgitkjnnDu0HFjuezWQFqAwm4g=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 860e96a8-74a6-49e3-3020-08da08aeb27b
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2022 07:12:43.9189 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X+5nyF2q2ruobqF+w9DXyNHyB6cVZ9LOCtZ28CAuMPkYFP+g/sHX8rRop3oZBBrkjJ2ejkAd5iA+OPNm2t4aM1drbHUPZh0I4gGdfxc96y4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1001MB2059
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10289
 signatures=693715
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 phishscore=0
 malwarescore=0 mlxscore=0 suspectscore=0 spamscore=0 bulkscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203180037
X-Proofpoint-GUID: b6Sr86S0U8FxlNvQedRElvbo5STg-VTM
X-Proofpoint-ORIG-GUID: b6Sr86S0U8FxlNvQedRElvbo5STg-VTM
Cc: alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 =?iso-8859-1?Q?P=E9ter?= Ujfalusi <peter.ujfalusi@linux.intel.com>,
 kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, sound-open-firmware@alsa-project.org
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

The "dia" pointer can be NULL, so handle that condition first before
storing "dia->private".

Fixes: 839e484f9e17 ("ASoC: SOF: make struct snd_sof_dai IPC agnostic")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 sound/soc/sof/pcm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sof/pcm.c b/sound/soc/sof/pcm.c
index 1661b0bc6f12..71f5bce0c4c7 100644
--- a/sound/soc/sof/pcm.c
+++ b/sound/soc/sof/pcm.c
@@ -702,7 +702,7 @@ int sof_pcm_dai_link_fixup(struct snd_soc_pcm_runtime *rtd, struct snd_pcm_hw_pa
 	struct snd_sof_dai *dai =
 		snd_sof_find_dai(component, (char *)rtd->dai_link->name);
 	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(component);
-	struct sof_dai_private_data *private = dai->private;
+	struct sof_dai_private_data *private;
 	struct snd_soc_dpcm *dpcm;
 
 	/* no topology exists for this BE, try a common configuration */
@@ -727,6 +727,7 @@ int sof_pcm_dai_link_fixup(struct snd_soc_pcm_runtime *rtd, struct snd_pcm_hw_pa
 	/* read format from topology */
 	snd_mask_none(fmt);
 
+	private = dai->private;
 	switch (private->comp_dai->config.frame_fmt) {
 	case SOF_IPC_FRAME_S16_LE:
 		snd_mask_set_format(fmt, SNDRV_PCM_FORMAT_S16_LE);
-- 
2.20.1

