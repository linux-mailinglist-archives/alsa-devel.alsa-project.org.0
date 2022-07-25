Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CE57357FA45
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Jul 2022 09:29:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5FC8E20B;
	Mon, 25 Jul 2022 09:28:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5FC8E20B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658734172;
	bh=yK6ePsI8sNjfWBtWq2W9x0q9n7XOPCFoQBoYQ4WjrUw=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=DTw9x1u20s2ZGsG23K4iFTqevOcSf0W0Nw8rDHrfHuxauFUfvt/3kcLotq7AEu5pe
	 78ESIUVgC8KAvaZbVmIEnc0wCpiAhYU5su1WmoXenyAqU+EwCKdy+mXXu0Z4VrokEH
	 LLBE1bJgz864BpVWAeoM1r0F/Bxwqf7Mqj6Arg9s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C8B62F80212;
	Mon, 25 Jul 2022 09:28:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2D825F80163; Mon, 25 Jul 2022 09:28:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BB2A7F80115
 for <alsa-devel@alsa-project.org>; Mon, 25 Jul 2022 09:28:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BB2A7F80115
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com
 header.b="tK1Iqsja"; 
 dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com
 header.i=@oracle.onmicrosoft.com header.b="Ivd343nP"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26P6Nn2G006688;
 Mon, 25 Jul 2022 07:28:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2022-7-12;
 bh=d+LEfDKwWvMQMJ4JSMZmFe19P+n2jmIt4U/ElNrlTOQ=;
 b=tK1Iqsja9DWzO62q3ZAzXFqvJB0wkkB8eAIXtXyibQMXXy53eYEoPNJymFE311PclzuP
 qDERtpiWRCrm4J5Q2myonVpCZiken3i98uxQGAvLL6GCCUtKpRfia73KXCfBFFRcurmW
 cxbYUbEMXvNlArawAVsqS1xtwcUfj1S9ZJELKwwR/ddZB4MRQi+yrORh7gZrZE4BfwZ9
 jUekBfG6cTsd2BmhOK/etjB8N30loiKC9isYxn5eC1fjokaOEnpm10qAQCotHXzCZ0qQ
 SWgoPbiBCgyChWc9DPoR2ZWFLithDUw7u2KiSAI2ES0msM4zxVlz7n01DV1blG7UzEv8 cg== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3hg9a9aeyc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 25 Jul 2022 07:28:22 +0000
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 26P5UAIG034455; Mon, 25 Jul 2022 07:28:21 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3hh631528c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 25 Jul 2022 07:28:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N1hJ63qDPKLOGHUh18uRu0ULZ0u29yu5UxaQYLih/+dU6eXThIkAiX1or92RDk6EosVg8gjTgb7AO7sPnQrfgLbknfMTFmPI1XblfMDBEsPRaP/Fwqw+7Z+4eANORhHQ/sxj2Dp+Mtnk2tp5eiNsTKBJ5Kq0+3WVRvp9Si3qA8jcuvTnOcB5lJYxu7iomVkwacNze6/crdRbMZaIV5HT1Px2EKsDnni/XBM/ETXtDb9+6MiCiHc/gtpHa7gqSzBVo13AuiTbMkTCasUbPQ9Tqqm6V1B9cVWhd3FA9jNtRkeRS8CBZD4+MgNduSKORW3OUVXNQyy4y36VuGXKxUGvEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d+LEfDKwWvMQMJ4JSMZmFe19P+n2jmIt4U/ElNrlTOQ=;
 b=AUlvLt7+dOsgtywfHq1ogqHFcwFlBAqwCQ5ejvXovla1g0U235Vgd654Pw1spHiZPfmCjzzEbF3B3FDr0rBOhBI8OCHtERrbZLtAL006hkasGrg7Zw0rpp5nbff/1RibG1IZEWKbmVAYhpFo3irHfyslIcHgD8rH4BuRuprB2DJzQcxAgaSOlWMloFVRkls8WF+q4TEWE0OhLAjXJMDQd5Xruqypualpog38FFWxPcHQvGdmnau3TZpS1yw+0PfVwiG0W/JZdmActXgMRHQiVh+bTVbami7Ogrgpch77ktD2vSfBsClCmsri3QnpMJSGyTAmBWh7AdPEJKydar2zXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d+LEfDKwWvMQMJ4JSMZmFe19P+n2jmIt4U/ElNrlTOQ=;
 b=Ivd343nPLZ0OyTh6dKhMgJfptOmbRiyHou0EtWClmifQXm3pqG88+984ZFyten/4LN67vz+CMRmLVxhhP6Z68L6a2UC1ddMkKdjBgZscAE2UAN0e74rpXFg/vHmMXu7ktx5voio5Uf+hulaFkbwXob6EnL/QuEvC+cSviHGju50=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by PH0PR10MB4792.namprd10.prod.outlook.com
 (2603:10b6:510:3d::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.19; Mon, 25 Jul
 2022 07:28:20 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::24dc:9f9a:c139:5c97]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::24dc:9f9a:c139:5c97%4]) with mapi id 15.20.5458.024; Mon, 25 Jul 2022
 07:28:20 +0000
Date: Mon, 25 Jul 2022 10:28:11 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: jiaxin.yu@mediatek.com
Subject: [bug report] ASoC: mediatek: mt8186: support tdm in platform driver
Message-ID: <Yt5GC+tlG7M6jiXC@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-ClientProxiedBy: ZRAP278CA0009.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:10::19) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 808a6b0d-ff51-47d0-53f6-08da6e0f3fa8
X-MS-TrafficTypeDiagnostic: PH0PR10MB4792:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9OMMroY8TlRzoAhrILb+zexapoKhlLHa+FS6zNTZ8CMMhq4onCxlPoc4ye6ooTsFAnzUeJ0JPGn14kQJCAbmFLyqIFk+MRTYjTi4voNfchZvxbmNpemrFXWFZ6/5KYM6tNuLjBRHyIYFHwZLfVgGF/RKTkyhdxGf1sqolodxfMqEF8eFezW7QxxDZXj5skx9ItIvYW6HGAmkEPZjD3ygWv06gP3zEWpbvWOcmALoMEmF61YZTW5quAbRFOyi8YvHkDga4SMQbpxP30/uU5X/6Vi/eHnzEACPg4n88kalB5FR+7fgr72RRgNb5JekyIMIzqt3cPkAESf1zu9ZZv+Tsci3qs2Vwim0GuJLM9DwYvQ2dZAqn0IvMI52XqVcN4Orgr8VsHn/nxMKjM1JAOk4zTQRhu5+LfWNHmRmaphLTnJSwzwBDbVPF9c0fXPfr6gsL9hwHIhn2BPfGmfYZerR8gKbW7SVrturDyl+D8+VDJ5yWWqo7Ik69gOnIqxe1Nv/aU0bXOaOUSKuYKhi2kHBoxWdRS8uITdcnmZnrzBhyfpi9akqmweB7qTS5Ucq0C5GDzwjLX+U2DkQcx5DixZTqtZgfX7CsXVJ5MMTGNl1etodx49ogRSgr+HzKzgm7pcBWhtxHzlkyDoMHoqp7n5UiT1wX2gtwuVaBPkhKbZsijq+GdZHuIo9Rpu63uXA0awNkMVD2KrR7jvDz4MK49eYSvaN9rlDFom+SlM402PJZy2YFRSp9KdcNPWM6tFfxVV0ZXAjWWKmEIlmNcKh0McGEUQ35pJ4reJYEn/lkKNOTY4iR+9fTpW8tWalPCgKqY8PGORs30JiSc9eo2CrDZefRQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(7916004)(39860400002)(346002)(396003)(136003)(366004)(376002)(186003)(6666004)(41300700001)(66946007)(8676002)(4326008)(66556008)(66476007)(316002)(86362001)(33716001)(6506007)(9686003)(6512007)(52116002)(44832011)(8936002)(26005)(83380400001)(2906002)(38100700002)(38350700002)(478600001)(6486002)(6916009)(5660300002)(67856001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?R1rp+O4hKIeNdpE39qeVg0epbiAuvjADgz14EIeUJhQ25XnYmoJ5h/MTNdGi?=
 =?us-ascii?Q?gVk5jldOLAFIav3CG391kZo/tdSwB8NerlZSsQJlsSzMIL+Drm7cK62pTmzj?=
 =?us-ascii?Q?EMXN3DFzDnudmqi/u+vIpAsU9xb68g8X79aEDlJ1XPL1+EWseDK4xrgYtAmO?=
 =?us-ascii?Q?21EOQ64C/QgWOTlGK+MQHFSpnV27uQdUnP2j3d0QWKrefP5iv7rnNV+bb06x?=
 =?us-ascii?Q?/UhcXzR9CoJ0RIj/I9uCONyjKjhD804AThd1xo22j8FIlhG4R7BPUbY7DaPx?=
 =?us-ascii?Q?e/6u9APeXjZTTUamZrdyioN/TPDw377y5hf/b3wwUC9/bKhmjeaQmxrbZf9h?=
 =?us-ascii?Q?pCfF04Z4RFyy3VTS+Bxqse2URfeCj6qixD7PTrVAHR1ycWIq9kcR/Z4bGg6u?=
 =?us-ascii?Q?kRZIOWpBHPPzYbkO+vDbGwqhJfNVlTW4OZWFP/9pZz1Lh0BDWmq5H4xkOMal?=
 =?us-ascii?Q?MJoIvdLbsMwV5r7bSj+os2I9ElFu8+Kp8vpIAPa5vmPQlX0QWebiZhhQcsSR?=
 =?us-ascii?Q?c7Wr4FWR4lQ2NgTL5DQEuu5+Lr/G9UeVuHPKrkrwG1ZGeURP0vgauyUTsHqs?=
 =?us-ascii?Q?QYBS7hrkvpDFhIDTk8PPlA0Fft0hSYR5qpuv4IWZluHonnlTKQdLoXwq4EjY?=
 =?us-ascii?Q?/C9zudY5fzHW1WS/DNe/0tnusHKXxlMbVU6kfS/PXXsQLukmoIhtzxsMdmdH?=
 =?us-ascii?Q?9hqraHGR3HwuVHKqrax/qm7sz9JRd5dwz07Ae8MW76OZ1Pjt7U/FNyHaYXOw?=
 =?us-ascii?Q?13pZSbXNAwsSPQdaOlI41vxL+k8FGyWUlTiMdjJtYpNbxun9eQp8q3WlOjnm?=
 =?us-ascii?Q?OrmOCVqxGdnLjufLwayP0hB/nXGBs1eLLqY/odTsFXG/einw+pJCYTKvCD06?=
 =?us-ascii?Q?l+mTNtLMiDwp9JLyP5RjbpI+5ENCoWVMS3Yf5Xs34tp0VEvY8pagHATN/njv?=
 =?us-ascii?Q?4Qd8c/Zz1mp/V4chaJaslJ/UCxmRAUnn8m1iqbsol2qI+py1l8f5L3xGvXwd?=
 =?us-ascii?Q?ALwW89Tuu/MU93dMIkD9mmLWbDjVrLq7o2H7ZdQ2oYAwMJkOqlvc5vZp4BYj?=
 =?us-ascii?Q?a0xVOC6lpDatPrJGW03Zx2Ei/cm/v1PqTc1lU1Uu98apJj8QI691ss45arRW?=
 =?us-ascii?Q?1h1jlCDQbUDj0nhKhLDuE/kqtkZ1gEyUyKPMElvqnOCPPmLJsXme2FdJTOk9?=
 =?us-ascii?Q?PzxeZX3EA2/jzYrD+KOJ9duXaN8OKWBvUJwKd3HANwCzYIXB0rAtZR+SqUs7?=
 =?us-ascii?Q?ORDN2x13hyoOibazxXn54lIgWZJyyAJ8VrTTQLbinPSb0f4E7cvczd070AFw?=
 =?us-ascii?Q?3xeAERaxbrT89kNK3xyr35TeGblx4vd2a7pPtiGdyrjdeZpfW39Z4nc5TklX?=
 =?us-ascii?Q?WtFrtEX68Sk0BAFjD3HV8JutSWX62Zp4kaKu00B/Gk6D3qDWrOyCKg0igRMo?=
 =?us-ascii?Q?v1K9knXeoeCgdgrJMAGrRjMAyBHrcQepSH/R7TStX3b0QX2hjNjwgKq8OxA1?=
 =?us-ascii?Q?lBx3QVG063ROd4SQRAd8+AlT/Kl3s0xvoVjV9fRC6dcH5uvCJAHRz+EiEH6z?=
 =?us-ascii?Q?WmkN+MtRGHcNxwXEjoLp8JHha3rfYas62Kxv6qV1XJQVbYWCgKYS30cYk2pL?=
 =?us-ascii?Q?4w=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 808a6b0d-ff51-47d0-53f6-08da6e0f3fa8
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2022 07:28:19.9313 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Noy8eS8+gO3yyt7nB1mZ1Ee/ThzMERoAXihXA9kCJfBsUuhRXwf5AK7k+bfA93hI6tQey1arCugUN96wn8JQQg3D2QLfaJBs7nhEUJgCRrI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4792
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-23_02,2022-07-21_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 bulkscore=0 malwarescore=0
 adultscore=0 mlxscore=0 mlxlogscore=866 suspectscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2206140000
 definitions=main-2207250031
X-Proofpoint-GUID: MFi_eGOf2VdyRjuhChmu9WymDl2RdGLS
X-Proofpoint-ORIG-GUID: MFi_eGOf2VdyRjuhChmu9WymDl2RdGLS
Cc: alsa-devel@alsa-project.org
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

Hello Jiaxin Yu,

This is a semi-automatic email about new static checker warnings.

The patch ae92dcbee8b6: "ASoC: mediatek: mt8186: support tdm in
platform driver" from May 23, 2022, leads to the following Smatch
complaint:

    sound/soc/mediatek/mt8186/mt8186-dai-tdm.c:424 mtk_dai_tdm_hw_params()
    warn: variable dereferenced before check 'tdm_priv' (see line 406)

sound/soc/mediatek/mt8186/mt8186-dai-tdm.c
   405		struct mtk_afe_tdm_priv *tdm_priv = afe_priv->dai_priv[tdm_id];
   406		unsigned int tdm_mode = tdm_priv->tdm_mode;
                                        ^^^^^^^^^^^^^^^^^^^
Lot's of dereferences

   407		unsigned int data_mode = tdm_priv->data_mode;
   408		unsigned int rate = params_rate(params);
   409		unsigned int channels = params_channels(params);
   410		snd_pcm_format_t format = params_format(params);
   411		unsigned int bit_width =
   412			snd_pcm_format_physical_width(format);
   413		unsigned int tdm_channels = (data_mode == TDM_DATA_ONE_PIN) ?
   414			get_tdm_ch_per_sdata(tdm_mode, channels) : 2;
   415		unsigned int lrck_width =
   416			get_tdm_lrck_width(format, tdm_mode);
   417		unsigned int tdm_con = 0;
   418		bool slave_mode = tdm_priv->slave_mode;
   419		bool lrck_inv = tdm_priv->lck_invert;
   420		bool bck_inv = tdm_priv->bck_invert;
   421		unsigned int tran_rate;
   422		unsigned int tran_relatch_rate;
   423	
   424		if (!tdm_priv) {
                    ^^^^^^^^^
Checked too late

   425			dev_err(afe->dev, "%s(), tdm_priv == NULL", __func__);
   426			return -EINVAL;

regards,
dan carpenter
