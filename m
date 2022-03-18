Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AD7464DD520
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Mar 2022 08:14:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 02AB1187B;
	Fri, 18 Mar 2022 08:13:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 02AB1187B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647587673;
	bh=LkpvluMSsD5wRnzwaWenIgoXyVj0hqvcZCJhnmFUbw4=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=iKMgDukLnyctMOpHZGX99YeaTci5ceUvq1qm7RA12syLw2ZsC1jWnNrQM7sQzILPY
	 Z4Gf6MdgXKWAudvFoy3jTlz7mX0UdmvPU09XScy+LR9bGQqJHZOk6aLamEtRCj07sK
	 0bkt12JJR97Sik4QqtAcyOunbFfkWyYIVLMe7OzU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 12ADFF80118;
	Fri, 18 Mar 2022 08:13:34 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 446C3F80279; Fri, 18 Mar 2022 08:13:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8069BF80124;
 Fri, 18 Mar 2022 08:13:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8069BF80124
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com
 header.b="TWFneAfF"; 
 dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com
 header.i=@oracle.onmicrosoft.com header.b="REpBtAAl"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22I32Zu5009049; 
 Fri, 18 Mar 2022 07:13:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : in-reply-to : mime-version;
 s=corp-2021-07-09; bh=eJ5dAWyk4p+Sw3jeTJ8FcujIY0VEgGIhm8qLEpfLj9k=;
 b=TWFneAfFSjRxzPZaOiQDUIeTY4GTRQuSROBVGtA2BdMFlD1+FgWGltMbzWRZJykfKG8s
 lgMw0PJ8dpVxQ6HG1Z/pQOkStlCyMk6MLIGfbM/8A6VWyw98HxLjsSXW5h5bLHjIvczU
 vnXEGqlQ4eABLZ9d+5ss6vAAm+nBQU0cBfURFB+HikE0BAswbti86fteZ79v2oxeafzN
 eDj1DPkSbc2QmZrW+VNgTGlGEvfBbjEYOo/vxBNPzXM8ffqykB+oELw7X+rlvl4OwqZn
 355G5+/kPRr9UBXVN6FHk17mUMGcpPGvRpr7WIpt7yfzjl/HHZyh9PCc1PnLexVqHxen Yw== 
Received: from aserp3030.oracle.com ([141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3et52q390b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 18 Mar 2022 07:13:24 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 22I7CFEb081724;
 Fri, 18 Mar 2022 07:13:23 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2176.outbound.protection.outlook.com [104.47.56.176])
 by aserp3030.oracle.com with ESMTP id 3et64u3f6v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 18 Mar 2022 07:13:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fzQZ2c/J8VeSofwHadGmVvQm4oqANqrNHZzXucZ73VV7yvN8wzl0JACj3JxMiH51wmP+Vv+OCgQOMmWzicChQAwILXZ9+4nachhb2ZwUjmFGVbvRVlt0HzE2dPXW2TniVgU/H+BGd//CjL0Bq1heB8g3f4Q8xN/gDPcomF5TqJM3x7aEhiBKplCSQ5sC/tFVXNdN99z3WwV2JiNdiM5XasitsmMq1IKUi1+RPH80Yit3msfpjoFsnE2vM15Z4VgHEiBHR/MEG2Z37CQGwiv+kX/3wJYQXXMNGimmd1nmWCdsorGrMdEy2VbJXDniJXlfvXVLhKO6hmG7Q1gM7xavtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eJ5dAWyk4p+Sw3jeTJ8FcujIY0VEgGIhm8qLEpfLj9k=;
 b=TSyMOa1VyPAoKxdvyx1JX6DcNxJKONkofCXt0Z81zSCWszWLuJq2Utxoq876wpvfSHnhlL1rBKK0TClkwr8TfXlHpyMuguyGuobk1qI/QqK5uf1OFS9KaXBgF5TLVQCK3ATj9q0Bg+Zpcj8KO3vEYc22awm48b+C7ufv2BdBWgf90B5TGZ3lOylWCSv3jq3RMN/rWt5NxX7fRuWCQ5lx9pbs6JtkSTwAfc4rbtvY6j+WcM+HRxN8EUXOuxnwNo/fYUaRa4muYxOoJVgsq+Iszoxw9DQ52nRxEqcK2YudGlEN9K3M2ETMHpm16tqgG/++jbq7TFFe5JLgt6HYcSRMAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eJ5dAWyk4p+Sw3jeTJ8FcujIY0VEgGIhm8qLEpfLj9k=;
 b=REpBtAAl2FyYUJS3EI+atNuTz9DKbs4mEitVp5wNrNOIIZxfXIrWFj7EecrrmySTOW+op7LqfAYgpeY7PYukcqNJuhzz9J5MGgggsrfg3fulYVanqUrJkmiOXV8DY2GFCJZl8xuRVLYLGnIVGY9sHDRP1m1ziiwYrRhzOvTiPbE=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by DM5PR1001MB2059.namprd10.prod.outlook.com
 (2603:10b6:4:2e::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.14; Fri, 18 Mar
 2022 07:13:21 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::2c3d:92b5:42b3:c1c5]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::2c3d:92b5:42b3:c1c5%4]) with mapi id 15.20.5081.017; Fri, 18 Mar 2022
 07:13:21 +0000
Date: Fri, 18 Mar 2022 10:13:08 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Subject: [PATCH 2/2] ASoC: SOF: check for NULL before dereferencing
Message-ID: <20220318071308.GC29472@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220318071233.GB29472@kili>
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0162.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:41::13) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d0798b60-a069-430b-8d24-08da08aec8ba
X-MS-TrafficTypeDiagnostic: DM5PR1001MB2059:EE_
X-Microsoft-Antispam-PRVS: <DM5PR1001MB2059A5DAC3FEF94AB5F8422D8E139@DM5PR1001MB2059.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pHh1rlp4rQFXmE8ADwmP9FkWw4FCwe5URPedsS539QXFwTTkcaXaIz2DG5i0TBn7BzJyn1206l6ZuZAWor08hlALlhe/6NE0lpQ5XYn7P1nJYI2uTfZLR9UnSz7aLb6sJjk/x9TkJM9ddKJDI3stAMndy9E7BfvIXNWwTtPbRnDNhPyZGfl05bj7K+XiwuCBzmwYMmkpex7W2NYTf3DDG71OhVVf8qkE8d9vvtMjzCImouAC2mpJrR1qixTJFCtRtvir+VjHvte6aMSLH+liniQ8hEiQeYc6qZCIGlc6FBvIXQFGZFyW3Uj8B+/d0KcEe95t6SiYaOVeZa4EX7Ddbulq4iJDWcLJZu3+pZe+ZllkcfAG2gkh45wpK+HDoNbVBf9OswGT1JxJCsj82eW+2KcwpbZ9SKFQqfAGeqV6MMjYPao2wUv+BjmDtSlsT00FkTksYSNJ6g8xIEJxOaWDBAKaWZFZLLnZ/H8hkxOPA2g/pjFE2YHOUy2Mm7JFfenaHHUsOzFfWdttxeYKr8VFbiTOjQ+BN34q6YtMgCPw96jvwUQHMB9Ql8aDvwyQCE7Heepg84JZ5CbR11ndbGhoL2g3n0rS0XT+fDhuLM2QzVKO/EuJrmK2MpARXMyYpYeCKbzks81QCbo3F4ilBSODpn73C7O96o0Q0ypVXafV54wm1bggx7qjZMuVpKSb0Egq5P93KK/y23TOBItt5b5DXQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(7916004)(366004)(38100700002)(38350700002)(54906003)(110136005)(33716001)(316002)(66556008)(66476007)(8676002)(6486002)(4326008)(66946007)(86362001)(44832011)(7416002)(6506007)(5660300002)(508600001)(52116002)(6512007)(83380400001)(9686003)(33656002)(6666004)(2906002)(8936002)(1076003)(186003)(26005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JwNUUvDI5Ww9WJPi0V1FEgQCPxzto+W5/954zkQ71JkbKqp2XpgGjhpvzobT?=
 =?us-ascii?Q?KNMBTj6DaZICBT2M2Ga59C09ie9OhytFwfVv+4KKXRxULY/7V0l8zEbBTDca?=
 =?us-ascii?Q?URQJsQjbCkgOSNUAcFfx4+PVvLBMcsslWG/pKrOPPF9/K9bdvk1HtQRnIDFa?=
 =?us-ascii?Q?n+SgHDPbNsIQ7V+x9fezRLhRoidzPT1dnobvXk+6mKehrVYJ338sjLfjyuM0?=
 =?us-ascii?Q?FjANqds5FjjZzit98LlcCp5eBeB1g2utysnz0jjKkxXEBCwXYlw9kg1waBoy?=
 =?us-ascii?Q?nGRUfbWPd1y/x9PnDBYU59u2c3p4Bi2oCa0AQgZ791hlA+FZm0x4F2SEIrQC?=
 =?us-ascii?Q?NBXsMOtv2lI2c4IIgf6Pduvjsodz8re4vW9/l1FWkaNdP6FHBPu5MpsHU0r7?=
 =?us-ascii?Q?tXNJs2qa/0UYZ+rzXPxTctuoVHiYfwmT8iEVMrKVxEnutDnaoY6gn4RQs0w5?=
 =?us-ascii?Q?D4YIjar0+dgWIccoOOcgo0G8y9L4beYnPFwG1jqTz5HghvycTq3V98DBfZmw?=
 =?us-ascii?Q?hzKSJpkPweNRj9TlnGcxLwjbo9seSFAN1MA6I63NfeF6johu4vK/MolrQd1t?=
 =?us-ascii?Q?N5T6MSDOTU8PYjt5WKnVj/d2O3c/wox7SklA4IkkCWhebd26KW6weOowzIEq?=
 =?us-ascii?Q?bQcnE3qYw2eZXjegJzItEgBFR39Q7nuWSoPxt+gu/cSY7OS38R/9isPHJ9CW?=
 =?us-ascii?Q?cpg2D3JX6rtjoyX8AgWZwIPLgMtk0h3B9UIpJ00GMBnTSyOx1vKwYKtu5gdi?=
 =?us-ascii?Q?clxiPx5cJeKaRBRjDcPyAPbysHkBqI2rnwo3Msoc05gMST93DZHt1B9fFjkY?=
 =?us-ascii?Q?4H19FoOgS1sOEnHTFhP5lnO/9MynngQrQ2jflLunNuZMhLnfbpB+hiPObieR?=
 =?us-ascii?Q?gMu7/jGyFkerGPXNiJ7Ai15xlv98/6iG/Ec2cEldVO5lgm6/ba2fVdRhGXWZ?=
 =?us-ascii?Q?uM48Y0twLnyyEdmq1Z3oOFmBH291h6WIHo2DFi8qETfqH7KWPHOaKhpOBKBN?=
 =?us-ascii?Q?WB77iidIOOfotnobcNiz6yKv8OA7cifhbpcUpE9bczsweWWAGu/iJAWNGM2u?=
 =?us-ascii?Q?40fTMCsbrd4msksgKsMfvkgykVWgG8q2su2iy3eZnOIvwDhekdkUeYyX1kk2?=
 =?us-ascii?Q?jYWnJSE1BynRJlyxPpH/6ha+qMt+ZeyOH0eYorLUogp0bi/2sq0pIj8uOGKF?=
 =?us-ascii?Q?9w/xOsgd/liiqyN3xJSUBncsopKgY+g0Ak1RauW4zKlJhKxknUqG+vh9bkuC?=
 =?us-ascii?Q?qrFDHCeXiMIkhL48hJ590ur/Mu0dYw485e887MtuCv8WV+bu3qutEeiOD5+x?=
 =?us-ascii?Q?34rqGd9CyVSv7RV3m6CkBbX19374fgW7WnhjdRWxzjO0BvMcYg6398uHeu6s?=
 =?us-ascii?Q?FzAuOP8Rgax3Q1UYjLBOUjgtcTWnLkm3ki+8SU+FBe1iR/E3RYWDXWkUOeG6?=
 =?us-ascii?Q?CA/85I12PWHbRAUb1AfAvnmVv8KbJIzYtx7OJdtpMSUwWlQs2Tjkgw=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0798b60-a069-430b-8d24-08da08aec8ba
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2022 07:13:21.2597 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /pi/0/sSIBP0lMGJFTvSMyJGe5BtospkTJSF5qRKZc0J1lW6Ht+pRA2Auiko13FbVaxN36vEsn1eyhAdj93YA3+YciPZiYcMfzH8wCRu+BU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1001MB2059
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10289
 signatures=693715
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 bulkscore=0 phishscore=0
 suspectscore=0 mlxscore=0 adultscore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2203180037
X-Proofpoint-GUID: NLxoRXxal5vJO3SvlbspgSl11MDtIrjP
X-Proofpoint-ORIG-GUID: NLxoRXxal5vJO3SvlbspgSl11MDtIrjP
Cc: alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 kernel-janitors@vger.kernel.org, Bard Liao <yung-chuan.liao@linux.intel.com>,
 =?iso-8859-1?Q?P=E9ter?= Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Daniel Baluta <daniel.baluta@nxp.com>,
 sound-open-firmware@alsa-project.org
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

This code dereferences "dai" before checking whether it can be NULL.

Fixes: 839e484f9e17 ("ASoC: SOF: make struct snd_sof_dai IPC agnostic")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 sound/soc/sof/sof-audio.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/sound/soc/sof/sof-audio.c b/sound/soc/sof/sof-audio.c
index 15c36a51f89f..88ddd1e2476d 100644
--- a/sound/soc/sof/sof-audio.c
+++ b/sound/soc/sof/sof-audio.c
@@ -626,10 +626,13 @@ int sof_set_up_pipelines(struct snd_sof_dev *sdev, bool verify)
 		/* update DAI config. The IPC will be sent in sof_widget_setup() */
 		if (WIDGET_IS_DAI(swidget->id)) {
 			struct snd_sof_dai *dai = swidget->private;
-			struct sof_dai_private_data *private = dai->private;
+			struct sof_dai_private_data *private;
 			struct sof_ipc_dai_config *config;
 
-			if (!dai || !private || !private->dai_config)
+			if (!dai)
+				continue;
+			private = dai->private;
+			if (!private || !private->dai_config)
 				continue;
 
 			config = private->dai_config;
@@ -918,10 +921,13 @@ static int sof_dai_get_clk(struct snd_soc_pcm_runtime *rtd, int clk_type)
 		snd_soc_rtdcom_lookup(rtd, SOF_AUDIO_PCM_DRV_NAME);
 	struct snd_sof_dai *dai =
 		snd_sof_find_dai(component, (char *)rtd->dai_link->name);
-	struct sof_dai_private_data *private = dai->private;
+	struct sof_dai_private_data *private;
 
 	/* use the tplg configured mclk if existed */
-	if (!dai || !private || !private->dai_config)
+	if (!dai)
+		return 0;
+	private = dai->private;
+	if (!private || !private->dai_config)
 		return 0;
 
 	switch (private->dai_config->type) {
-- 
2.20.1

