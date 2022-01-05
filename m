Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A5F02485BE8
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Jan 2022 23:53:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3C1301A00;
	Wed,  5 Jan 2022 23:52:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3C1301A00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1641423215;
	bh=82js8f6KQbGPAugWoHio5T6hzUDpKmt4Tq+9FQSaZOs=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=f6TMW55/Md2MJqMLNHFfjylZdbrZbjAXwRCDnjFR9zCdPh4zffyZU4WzRoKXKIb3X
	 7KIKxPONy/HNd6sQY9xzKuM8zJgJdhAh5nZ45BQS42xSMdXOKu3EoAPx1ed4/1WpNU
	 EdKxMKyTiEO3dJu6N10D9O865ga/3Mv6hs81yjuU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A9F41F804FA;
	Wed,  5 Jan 2022 23:52:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2650EF80227; Wed,  5 Jan 2022 23:52:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mx0c-0054df01.pphosted.com (mx0c-0054df01.pphosted.com
 [67.231.159.91])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 034FFF800BB
 for <alsa-devel@alsa-project.org>; Wed,  5 Jan 2022 23:52:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 034FFF800BB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=calian.com header.i=@calian.com
 header.b="uPeKzvdF"
Received: from pps.filterd (m0208999.ppops.net [127.0.0.1])
 by mx0c-0054df01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 205D3T0I019799;
 Wed, 5 Jan 2022 17:52:15 -0500
Received: from can01-to1-obe.outbound.protection.outlook.com
 (mail-to1can01lp2051.outbound.protection.outlook.com [104.47.61.51])
 by mx0c-0054df01.pphosted.com (PPS) with ESMTPS id 3dc72w9gch-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 05 Jan 2022 17:52:15 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=msFJciMuNRUVe/4rkqjoz6EtVa6ZoDSAdeWQhiPIEpM7HpiTOJzeJokMBNBLok/VuSOWXu3UH9Vyq3eopwA2AMmBtK8vTSeLgQboTmFHpa1sDq2pwwF25JBTlvKphPWTeq5b4yT6xGnEFJpxbpXgD+sUNx5c6DjPGM2nJ4rFXY4dHgwFRg4vZbAkxsiL8cczfsT/XQBzdtxEB+Ty3WE+BYywwXwSneFTzu0qyfbsxBT7q1oi3yQsZFAddWgFN1eoeM+NaRnGTtVChJjRmwjDiRlStuuS8spus6eEs7kinqTUREOz9jBU1MWwWVHuiOK4k9NeZAkYuqWVqRVfR2lU5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5yr1VwCAbixIgGKV1awmLgBip3IV5A9kCUwJpcwSsug=;
 b=QIPt6oMLdgS+X271bmrVaf12aXlc9MN/CZbyfkuLhRBxar/uRSjul2DRnKbxbX77dwckUeOGdxu8mIqTP2/mmkFFVFVuYMZEhQBHahW/ZyR+ib8Hd6L9vefNW4sz5Z8ipn7P2ATAgKRJBarF8sf85ydL8yrr+h+bGFtg+MSkaH9LsBc0wg2cTHkObjaqNrqN3kF7Jl5Rde9SGEx9RvlE/MrUHk2UYSkYVKGAPIAYfUAzm0e0iiCXAF/5XACmitdahR/c9tTdQAKwGShy229FDL0/urE7if3tI1+vw3jqQeIgaFs5RIVDZpACUOoFVI32KSVSXxHlENa2iFKrYIMNaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=calian.com; dmarc=pass action=none header.from=calian.com;
 dkim=pass header.d=calian.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=calian.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5yr1VwCAbixIgGKV1awmLgBip3IV5A9kCUwJpcwSsug=;
 b=uPeKzvdFIt5gbNefUHkmR9IQullPN26JsY7ZONKTHkW5Ne3SX0zNYO0u367nuIidgs+bypn9SXSgTzCcL+KvS56ZpLb8Aka/Vgn1gp+beBGADW9suGuaPLR3eY2TXsBB3nOZJA9Ntq+s8zvFD0HqKgnyPQGG2WIX2ofu7QMTHpA=
Received: from YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:6a::19)
 by YTXPR0101MB2189.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:e::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.9; Wed, 5 Jan
 2022 22:52:13 +0000
Received: from YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::d1f6:d9e4:7cc7:af76]) by YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::d1f6:d9e4:7cc7:af76%5]) with mapi id 15.20.4844.016; Wed, 5 Jan 2022
 22:52:13 +0000
From: Robert Hancock <robert.hancock@calian.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 0/5] ASoC: Xilinx fixes
Date: Wed,  5 Jan 2022 16:51:41 -0600
Message-Id: <20220105225146.3517039-1-robert.hancock@calian.com>
X-Mailer: git-send-email 2.31.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CH0PR04CA0059.namprd04.prod.outlook.com
 (2603:10b6:610:77::34) To YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:6a::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 54a5f53b-88c7-4158-73c8-08d9d09e0372
X-MS-TrafficTypeDiagnostic: YTXPR0101MB2189:EE_
X-Microsoft-Antispam-PRVS: <YTXPR0101MB21895148DA07FC3DE8FC6821EC4B9@YTXPR0101MB2189.CANPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lbo4KhJxLxzECxyr3+Fr4jL88ykgXTVUIou9c7RUpWweLEKt8zTayLLPPoCpGRP2LgHiPKkjczyQT89DajiE2YS6ka6UBaeUZTaoeQUqf6U3Vuh2PxSeJBXoAQIt7cxbfIIiNxVjpLKIlqWIcwmhwFv+lUNb0Sp+2yLtARU3dn0Y/qz/+hZQXhStFcaHxcVOcf0DrsFb8Lf465P6OM3sR/OeadKJlrzT3Pio9HPm3WsYcQdWIGMQ78u+edShnRc2lCaQ6lQuI/gKB9JbMXSzj6abkbtdACnXt7bqGlztphv0GdVFsYNgqbhK4tvI8CSTRO6+CFCk0TkmJHuL9OP+39txqbqjf9FO9nntS4EGOh+V2HgyiEEWarsClHYI0kyV/joVCZYIpDC3bNqzYxwMp6FdkV7SjsUkvdH7n9+JiKMTVx0nxH3CWC3X1D1d+yzgcneC1PZPRotxyD8nTnzKr3aORYxHPR0rwpIIPdKzom8CjVaLNQaHV36kaNUKndtqzAeDN70JC2dbf1xBe96cGRpMel/lPOLAwh2FBqfYrfQl50z98RqxV2jSDhqZN6YjoTJunl95/WUSn/3OgnHzfn0Bp3WF1zYVQel5lb0BvzGh6rZmTRbBNXPY5AG1WGmDhsHWUxi++FvFssETHSHyY2RENPc1fuPNqaEsq0jJqV4vzw5BS7NvFFkyHzTQQ6PleMv0xb/zgkduGns8JI6d2Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(8936002)(316002)(38100700002)(38350700002)(6506007)(6512007)(44832011)(2616005)(107886003)(8676002)(66476007)(86362001)(66946007)(6486002)(186003)(66556008)(4326008)(5660300002)(2906002)(26005)(508600001)(36756003)(83380400001)(6666004)(1076003)(52116002)(6916009);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wkK5NyBOby45s+NFo7tTZ4zkOVkjSIYqx+Ecyo7K27D2o7kVcW9XLtLiNlHV?=
 =?us-ascii?Q?inIU7Wj9JHo+5Y5OQPcgkX7l4Fh61d97uYyRbeSgHW4qSpkzLlv1Z5taFUeM?=
 =?us-ascii?Q?Jv0F2Nq8ftScejDS/hmz6/jGJuZ2B2hjyaf0CrfL3uWTumZJSO/+JWcLPh3Y?=
 =?us-ascii?Q?zzyYjR5IcJkTNBF9r6dhKZeLlRSkMB67J9CAqKRuugIwjc3Tf4mYFjq0izzy?=
 =?us-ascii?Q?SkTv1qlgFqosEkYBFUc9n9EeIdCFsGR+3ievYdNpzisl0IRwQ26/I8xOyeCg?=
 =?us-ascii?Q?moum1uW5H1kvaqw7c8YZ97CwHeAvmLAMpIxsAKxkecZ5wXwDmIAEd2sJsva2?=
 =?us-ascii?Q?mXizXbxHe3TOTsOpaEZ0MahZvNcPG1NUeiSHIU/0n2DTqgFY6iGbNZGYbeO5?=
 =?us-ascii?Q?Fjl33JPw88hoiecxQjws90uMBSFZOA72xFzSPLNfgxPpheWr3ijToj4ocMEY?=
 =?us-ascii?Q?hKi0DXg7yejZjKKqeFvIDE0nZTdFUB63v9dPT6dbJHVlqSuVzt/T7EFbixYw?=
 =?us-ascii?Q?//mJsCKi0sQH++7KCoFM0y7OAvLNbXY8ndHxOfltBwX58a8rHGIppl6u2TmH?=
 =?us-ascii?Q?9t7cQX5bCEzFY94+C05o0iX/vFpYCLuxKJuX3C+1V7htuHtVZUYLnpKZ6Wqv?=
 =?us-ascii?Q?GSVaQP92Eq/nfhM2+STnX7qUqJhPRZ23w6H9NPgGIdFhuJCLtmyKxUGr18H4?=
 =?us-ascii?Q?ccVa0lsgZ9OUArLT6FXqgFPo0x14rgSJH67EF9XuMNIMw3afty7UkfmCA4R9?=
 =?us-ascii?Q?xIOsrfRsC/BU2nyBHqocBrAi42rtSjCo9t/pE94iMbiug9eKrnwZznDYy+Ys?=
 =?us-ascii?Q?yEZG5nsYAY3kQdbEp+DiRL2ys4xrWYRkjDA+UgMicvmm6ZxVJbsvdHZi2VtO?=
 =?us-ascii?Q?sjrzYN3qEkx4obNWGBIKL/g1dK7birEVyLY7h+Wq/CE1xfHcDxTrg3iqm865?=
 =?us-ascii?Q?F3Qt1p3OOlrfPsH71fCgbbzKljr7d/O7inNctBIAYyXrWjUS31qWUfXUuLnB?=
 =?us-ascii?Q?HidASKz+5AViB1Gtga5AmG1Qit8LO7J/S1zzihjAVxiws2H26DA7ddSk4h6a?=
 =?us-ascii?Q?8revFoEgvXfx9nbNekI1snQwClegj+R0/Rfca8Nm3z7LL/d1VcXxhgGN5Cok?=
 =?us-ascii?Q?1X2+FWvF+0kpQgakdjLTbhbI9Zydyu5+x5rAXuTrH8xCJUtVjO4N7Up8CWZg?=
 =?us-ascii?Q?CSsI6eBvISbAyLi6Z33euW0lzdRgVUcbGu6ULb6JmhtWOzH5wO99F8wFLmFU?=
 =?us-ascii?Q?QnE7+lURs6OPvpVnin25DKh0FrLuRYSxEXmzaBo+VVoVBMrtF4KD+K3GBvdK?=
 =?us-ascii?Q?l6dlYMQN+oa/ooEPS5ir2Kkmbc8N4Y1vBtlJBcMq3NpAPClzJMpXYBqRNjXo?=
 =?us-ascii?Q?fBuFOjcZUo9YXB4WCAewJENeo1uHSlb3QAIthAgYbne7XQNW/5W9xeoakNmS?=
 =?us-ascii?Q?0Tvw5+MxVzLv2D1D6E11lkY5wxGbTEld9odOR1LF4wulSNddxlpYIAUX7ico?=
 =?us-ascii?Q?9wg3H9oKZCbpypHcN5uEILEFs+osGl7Rh6e+aSK0pYQuXoUjzdxYxUJw1imx?=
 =?us-ascii?Q?yF1tctSiWwKoUt3GgZBbqfzqA++FSWb9kGRf6fcGa304cvsnqZICuBdWD11D?=
 =?us-ascii?Q?s4GKsr8zZv+r99cmlMJIy5m/I2kh5Y3sux7lNe5AUZRbya1jRSXESjrF1AgR?=
 =?us-ascii?Q?pU+4ti2AM2jNSYrFK/OeSg2kfb0=3D?=
X-OriginatorOrg: calian.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54a5f53b-88c7-4158-73c8-08d9d09e0372
X-MS-Exchange-CrossTenant-AuthSource: YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2022 22:52:13.2753 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 23b57807-562f-49ad-92c4-3bb0f07a1fdf
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xafNzxw0VTNM0KByq32Fr+Y0CfkVUoQekJon1RLEnKrmguM3DvVs36odSE72l40S4GgKWSBQQqPqLuG9RwXVAaK9RriPVUrfI+ZUgi+JGEk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YTXPR0101MB2189
X-Proofpoint-GUID: qtFNqG4L4qHjUceJPjTQikxs52AZw_GX
X-Proofpoint-ORIG-GUID: qtFNqG4L4qHjUceJPjTQikxs52AZw_GX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-05_08,2022-01-04_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 spamscore=0 mlxlogscore=476 phishscore=0 mlxscore=0 adultscore=0
 suspectscore=0 clxscore=1011 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2110150000 definitions=main-2201050144
Cc: kuninori.morimoto.gx@renesas.com, michal.simek@xilinx.com,
 maruthi.srinivas.bayyavarapu@xilinx.com, tiwai@suse.com,
 Robert Hancock <robert.hancock@calian.com>, broonie@kernel.org
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

There are drivers in mainline for the Xilinx Audio Formatter and Xilinx
I2S IP cores. However, because of a few issues, these were only really
usable with Xilinx's xlnx_pl_snd_card top-level driver, which is not in
mainline (and not suitable for mainline).

The fixes in this patchset, for the simple-card layer as well as the 
Xilinx drivers, now allow these drivers to be properly used with
simple-card without any out-of-tree support code.

Robert Hancock (5):
  ASoC: xilinx: xlnx_formatter_pcm: Make buffer bytes multiple of period
    bytes
  ASoC: xilinx: xlnx_formatter_pcm: Handle sysclk setting
  ASoC: xilinx: xlnx_i2s.c: Handle sysclk setting
  ASoC: simple-card: fix probe failure on platform component
  ASoC: simple-card-utils: Set sysclk on all components

 sound/soc/generic/simple-card-utils.c |  11 +++
 sound/soc/generic/simple-card.c       |  52 +++++++------
 sound/soc/xilinx/xlnx_formatter_pcm.c |  44 ++++++++++-
 sound/soc/xilinx/xlnx_i2s.c           | 104 +++++++++++++++++---------
 4 files changed, 150 insertions(+), 61 deletions(-)

-- 
2.31.1

