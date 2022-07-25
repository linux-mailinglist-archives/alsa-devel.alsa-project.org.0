Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C7E657FA34
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Jul 2022 09:26:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C6AF310E;
	Mon, 25 Jul 2022 09:25:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C6AF310E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658734003;
	bh=sRavtxALq/DTKlX+hpfGnkblkmXu/bgdaL1E6AWsbDs=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=B0uZ1qhwGSIwXVW4oFfjgTf1+0Mj+RZ20cJTp/wrw2L0i9NqMPLRyvs9eA0Y59+R1
	 phWCfg/2Pv9GwYNDWeOasvEzCxK4bwtvTdqIzMW32dzZHSPxnT98npoZ5qJAZZjd9A
	 lunsA/YE7WI0B0CHWw1NFWHNODSa+Nl3zW7KGdXk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3B5BBF80212;
	Mon, 25 Jul 2022 09:25:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9FE86F80163; Mon, 25 Jul 2022 09:25:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8B71EF80128
 for <alsa-devel@alsa-project.org>; Mon, 25 Jul 2022 09:25:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8B71EF80128
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com
 header.b="P4Ea4NVS"; 
 dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com
 header.i=@oracle.onmicrosoft.com header.b="u7kwlR6v"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26P6VT1D000854;
 Mon, 25 Jul 2022 07:25:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2022-7-12;
 bh=XsMdHyzNtwSFFLuFnr4qcCUJ8hGQSRnm953V1EmJJXU=;
 b=P4Ea4NVSkeajKH5S+1BhQWgC6iiOmtKxFtU2SRr38BxuBwuJvxYSg7YJ/zOpQfasZE0Z
 YwOcg6v8SffSP9PWPNIB2vbcIeXYkBsQTM8K9SqojBrD3Ic4D9m9Jz9mgoRYAkYGojJt
 lbdDGrvBtnDM8AziF1dP7VpJ8FEnyvoKw4l87K+h02+6upEhET0MdOSt4cZDmTiRGsju
 X3tzDPSwIlT2IBPEljKyHgQsUOFj+IggLYhrDJzoXTBxrCjMa1vzRtOHbvKrDfwhdu5+
 IZya74EdnQZqs4SniGnRW2nXLJ+MzNP6dZV91rjBJ3xJq9dSovE6MDMOYoItnApP2q1H Gg== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3hg940jehj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 25 Jul 2022 07:25:36 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 26P5VDjp006270; Mon, 25 Jul 2022 07:25:35 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2108.outbound.protection.outlook.com [104.47.70.108])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3hh659w683-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 25 Jul 2022 07:25:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OVb8U2NvITRl5ZHmADnuLmbRu8SrpIcGNTmOSiCESBK+nFpe+C2ZDE/m8f0tLWQLZgD2Ff8tzxqMqFw4b4M4oDn/6kY1dvPAv8gHjVsv8gs2tHqhXoVPUZ4j1iQx/UlblCvsGWx1hMYzNVP9uUREkkQhogpg/awVT4HfQidf/SsFjlyYgkXRlvjPFf4k7iGqrKyBqsqNJSg3KuYDBPXgl+KSAr+BN3BGSi9w7lwqhsw8dx9OMAMua0gskSCbAZ2K8/E4F7TV8r1FqY/PNJq3sYQR0MqmcTiKiHysfnvDmSku/Bbtrd4CXL7jVEAi30r1vwvqHw8hdioiKT0mP7aHZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XsMdHyzNtwSFFLuFnr4qcCUJ8hGQSRnm953V1EmJJXU=;
 b=GHPGHVmT/+h/tmFgy6NVpLmvDwgF0zNnr3DWtOKJp9JjdMuBzO3vt8fqvtSxS6isiX9utSWvd2sfkdG1/bN75G4d84lkrLTMhGq9ztdZjNJFhQrk3tf99HLjvccZWr5KVkFkpUnkRr6uwmd+M2W6yqGFHzEgx/2cXhciRb6hPIUmh/DEY1b2VnrFndWyQb5qQW+6yFSmml9xi7OYnLSN8uRBuO2DHtNL8bKI/qJnDFSpKMT7wBDMRJofG12zdNQvx1kyCzVtcCym6ye0OV23Un8QhVludiK9Xj+yH/HTbvbZP8AolrAzF+PLdH/wQhzA6o5BrIBxuUyKeY0wa9bKfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XsMdHyzNtwSFFLuFnr4qcCUJ8hGQSRnm953V1EmJJXU=;
 b=u7kwlR6vY0ABRireu1MWpD4CPfqPX/dOeVviG0mJzC5md9+NzYVGNh+xHeA4xVQECQVhcG90Ulr6845Vuf3O/6sK8hPE2NbZMeW1d6eqNaV5OldU8KJ/0xdhgAfC2aM3QG6Z+w8bxDbP8IUU5NTkjBL7dkDbhusAa+whdfcx+90=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by PH0PR10MB4792.namprd10.prod.outlook.com
 (2603:10b6:510:3d::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.19; Mon, 25 Jul
 2022 07:25:33 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::24dc:9f9a:c139:5c97]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::24dc:9f9a:c139:5c97%4]) with mapi id 15.20.5458.024; Mon, 25 Jul 2022
 07:25:32 +0000
Date: Mon, 25 Jul 2022 10:25:23 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: jiaxin.yu@mediatek.com
Subject: [bug report] ASoC: mediatek: mt8186: support adda in platform driver
Message-ID: <Yt5FY0RffrGZx55I@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-ClientProxiedBy: ZRAP278CA0006.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:10::16) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9d7ef5bb-2b99-4d61-2f94-08da6e0edba4
X-MS-TrafficTypeDiagnostic: PH0PR10MB4792:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zGqpHdejSAHFcdg943d/tYLoV4EYHUw3p6dhfG0VtS6xDMXs9HW1OQaF0oW6o28mRvUsdXQF0wfWoemOrayHdQD7MNjMnV2U5nvnI3OOc+ohUSV201c1FxUDMU4E8yPfJib8KzFdMpQKauKquS6BFKuITces1Q8eS3bkxzYVz1ag5OW9VlhTbK6bvMhBmI3A68K4E6Q6yAU7J35EbQq4YkdPL26qxE7eLn+ycAalikxm0AbYwGQHNtDdDJ+PvRxADU08LcRjIGTAI5cz5W9rc37Q0sHRsEt+xGNopdVzxT0jhXFr0u1tBB2M5nZiAEBgezd/V5Tr5k88LWfNhZsXRnG9Fcrks0T6gz8cdh3Do3B1T9BX0KhTBWwgNba94qcs/I26Q2lDnOWG9ebHH8nWpwIkkKt/hOPoHKDDFPhQH3anIOM4tt/E9KwtZjn/faq07XvLseHnR7ge+Ca1X5i5ynLnT7b6k39EIltEBZpdYopeJLcPf/xH8c4adf7GLXa3RZUwpSsmQlDuYeVWN2pLFB38j4toFQ/2ohGGB9DBlpioW5IEFGI/xA/jNQhwPkiebLTnMwyloyzWVx41RFvN/DnHGA7nAhhHpEFuQTY48bexgTwRcgN8RyXRGFBEf49FypkV+/c65PO5vd7K6+p4QSamDtN6vtnbPf8Xn8x7L+lh2LXiEnBFwJ2+9EnBX1R90AMwpOl88N0WcxAbkkYSo6HM2t29JApF9QLuKRkNP1dUKO5uZEUt9rSBlZ2gqHUK7kQh23zhvxrCOFGKDiVUJNV8MLzvwzYpje7f2gTDS1mEwOxkIVrKYkl9/Kq8JwSU
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(7916004)(39860400002)(346002)(396003)(136003)(366004)(376002)(186003)(6666004)(41300700001)(66946007)(8676002)(4326008)(66556008)(66476007)(316002)(86362001)(33716001)(6506007)(9686003)(6512007)(52116002)(44832011)(8936002)(26005)(83380400001)(2906002)(38100700002)(38350700002)(478600001)(6486002)(6916009)(4744005)(5660300002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Da7YvnmAbtL4luLoihIrybD/S4vAs9sk6i7P3BMn59GF5+NjBv+ApHCIwlC7?=
 =?us-ascii?Q?Pl5WnVT/anyzU30FTgxofb551f0jiXHuoVE0Y+vVgEygTdYPztCgYgVC5mkR?=
 =?us-ascii?Q?8xLE5UnbEi5GPKi17lzuvGMwgcdXKU2GMF0bJyUTe/ZjjfXFmHxZoRYF9m7S?=
 =?us-ascii?Q?iAWBVjl5wqEo9u6GDFC53dwKxTsTJ7QxRBI5k15oR+iPWHpfz4FufGiCSXt9?=
 =?us-ascii?Q?8k6V2/n8fMlWodGUTkAZkRdFaoehTeSoBnhc9exYTIgahqflh5gJproQvpOq?=
 =?us-ascii?Q?REi2VAsaatj2afSFFSOQwVt4LfEpZru2657ynRhGo66UjE59+YexB6wAW7Pn?=
 =?us-ascii?Q?2aMwgqzyjM5egTqvI7YweVfgi3O1kw8B1D2oouzgSthXUkdHCN+e8GxSmHPi?=
 =?us-ascii?Q?wLEvRoSfB6hgWI973kFs1U6IxsbwxZwwqM9gm/yVB1I/iofdviB7H9fj5E3T?=
 =?us-ascii?Q?Fl3J765gzCsU40mMKpBEV8Beaz0zwO4mORBc9t/xbj2rMMVnP8JqPWHNfBS/?=
 =?us-ascii?Q?QTRJjaW3rF1TY2ufc7UljcQLYVRwSNJOPLNu8btQOw0DB+whsOtX1e+p+vpe?=
 =?us-ascii?Q?kjd9iVppv5ROhGX+wQxy0vhzlV7nfJt5sU4ZgvR1p4g9qn7lX7NZnlO6Ruws?=
 =?us-ascii?Q?uUbAJHcItf1j/ZqIv0zM8gz4/hu4ANBIhgxjmSdMD/nY9zSZA21f9uL99HER?=
 =?us-ascii?Q?2k77DSvDo58hcPanMkzs7lwbVYCZKyCGXXyIlBB4y0KHzmkoXmut9sEKcup9?=
 =?us-ascii?Q?gQYMIlo4TduHfzAmGCbuH60/AdCteiaSBTwjpWrXaChw5VMfKn7GpuWpzHS1?=
 =?us-ascii?Q?2jq6KMcRJpKsx7ZIi9LqP/D8MWIZoRZMwu6j/VIxYY5VxRe7838AGQ7PMk6p?=
 =?us-ascii?Q?RvWASu3iqR3mv5P0R2GqnM3Zur9JTZOkv9OYxb2gUZZsws1/nEn9YUszRs/8?=
 =?us-ascii?Q?S0eLxHNvF4bH5jRIfGRVMt/LB6BE7agC54CPBjtr8pIrVFH9zd/rILMb1qL8?=
 =?us-ascii?Q?N/f+hOJoHTw5l0upaBJlQO9ehxk8lpE3GQumtsrZ3XEnofgIZSljnTKxN/Bv?=
 =?us-ascii?Q?VLweQ6eJgAM2DXkSpNFSzBukE4YoXO2pIbmBHsJPDVVHtN9KjSul958YDLv0?=
 =?us-ascii?Q?BeaukrdIDewTWwX5mGxTQYSEf9vjzn2xrxFmSSp3eq3xPJZPE9U1Lbqdy3Ms?=
 =?us-ascii?Q?ijTJljWdzF79cQ3G3mmQTsslGJAQPpIEm0WoCVs+XEfuykn3O/m020cTPzWt?=
 =?us-ascii?Q?PfNFOHGZTxO2CDrT0EnJheZTGNXfO766lYaKrgmOvhNRX6rpbRoJq712gy/f?=
 =?us-ascii?Q?YsRfXFORnAnXHdOvEYrU8gzXuQmwg3zYGcDwY8t1GcD5lhOF3LyWdOX0Sz4m?=
 =?us-ascii?Q?ISwKp+5WCdbid77t9U1q1KcYhzVlRg+6IQKgK5VflqbOeCGAEKMNxqBPr26Z?=
 =?us-ascii?Q?22JT/m/BoQ2nRkCUir+ap9GtcBkT+5TcMRVGg7E2Tp+Zt5WcgvWpFk8mCveX?=
 =?us-ascii?Q?r3I782pFSFqBqG8EmyBP3GLBbybYiikCTPeYUoqTItTvOil558U96gEkdrpU?=
 =?us-ascii?Q?q2vEiH3z4m0EC7nW6GgAqHbv5pFL1DCKDOkXy+wgdgVVSNuRRAdiXU81d82c?=
 =?us-ascii?Q?2w=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d7ef5bb-2b99-4d61-2f94-08da6e0edba4
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2022 07:25:32.1632 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XebZu1PhVylcUBhj9JI5dNDh8kxbM10eyWK+IsczCGmpNamCYsu/e6sMQvN+uZL3T+k24jplYXNLZTO5Py9Tf0AQD8AMw2PK/v0vbz9vuBs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4792
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-23_02,2022-07-21_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 malwarescore=0 phishscore=0
 spamscore=0 mlxlogscore=990 suspectscore=0 bulkscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2206140000
 definitions=main-2207250031
X-Proofpoint-GUID: TqLTR_updbwVdFh3yfUBBHB4R5ovUvYe
X-Proofpoint-ORIG-GUID: TqLTR_updbwVdFh3yfUBBHB4R5ovUvYe
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

The patch b65c466220b3: "ASoC: mediatek: mt8186: support adda in
platform driver" from May 23, 2022, leads to the following Smatch
static checker warning:

	sound/soc/mediatek/mt8186/mt8186-dai-adda.c:78 get_adda_priv_by_name()
	warn: strncmp() with weird length: 17 vs 7

sound/soc/mediatek/mt8186/mt8186-dai-adda.c
    72 static struct mtk_afe_adda_priv *get_adda_priv_by_name(struct mtk_base_afe *afe,
    73                                                        const char *name)
    74 {
    75         struct mt8186_afe_private *afe_priv = afe->platform_priv;
    76         int dai_id;
    77
--> 78         if (strncmp(name, "aud_dac_hires_clk", 7) == 0 ||
    79             strncmp(name, "aud_adc_hires_clk", 7) == 0)

7 is weird.  It would be more readable to say it as:

	if (strncmp(name, "aud_dac", 7) == 0 ||
	    strncmp(name, "aud_adc", 7) == 0)

    80                 dai_id = MT8186_DAI_ADDA;
    81         else
    82                 return NULL;
    83
    84         return afe_priv->dai_priv[dai_id];
    85 }

regards,
dan carpenter
