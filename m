Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0880E5735AB
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Jul 2022 13:39:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9C01E171E;
	Wed, 13 Jul 2022 13:38:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9C01E171E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657712342;
	bh=cuk4tEuBNnOQT9JaQdX7qeLAx0FoDN5kBSFEDP9a5lw=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=OlUYuHdpU+CgmkOHJll1piek8VE5voXjhtVy3OFX0EDH02Y2NEm8VZ0ySUun/kCN7
	 tcx/Ai+jWs2xWpuuu0vv46SEsnlI2HtGTM64MD9nSDPXaa2Ypf4ZA3k9t+M2SBAgbr
	 l0qWSC3aHYW4wt1xCNFrqlOkPCeRNHYJxSEIlnfs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 37E12F80310;
	Wed, 13 Jul 2022 13:38:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 82A57F80254; Wed, 13 Jul 2022 13:38:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C4737F8012B
 for <alsa-devel@alsa-project.org>; Wed, 13 Jul 2022 13:37:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C4737F8012B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com
 header.b="j70qPQuT"; 
 dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com
 header.i=@oracle.onmicrosoft.com header.b="v5+RHmE1"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26DA7Pcx022733;
 Wed, 13 Jul 2022 11:37:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=+Tg/91Faq5aDWnRiZJZ5JVcCycSRtgJRKkogPvBamb0=;
 b=j70qPQuTtciQ+lDWR63SnQ04dRITadE+1WGYNP0xEKk75PJo4ekUoBIMKh3lxMot1pEB
 X42DPO+RpTc2SSjxdXkc1xrqlxo5vrx9c2ks27HhF3u/5P5xTd34p54ftO3rVvt3KLA2
 ZCjtGzqZh8ZYlV41BWLDa8iywd3DYQ4FsUAeYqIaNrcn7Gr2U1aN1i4rk3o/4zgVfuOf
 E6Kr/FuiuMGt2+8HK2SPYD5FXBqFMqoaeIYfia+ejRw85suZA52X4Pzx3R4cEOP4zKz4
 Rr4lqA3hrSy3Zk0wFejgv9A+/Ji2AOk5nChAXeqiOlKd99o22vlTqHA6iCdwR1WDtUo5 lQ== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3h71xrhx49-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 13 Jul 2022 11:37:53 +0000
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 26DBUlOh009656; Wed, 13 Jul 2022 11:37:53 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com
 (mail-bn1nam07lp2042.outbound.protection.outlook.com [104.47.51.42])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3h7044578u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 13 Jul 2022 11:37:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C5HZJfizrX7dSmRYANPj+B56hGTRhkj1HY8gObDKdYi5+c2uKpFnO3ws8rESyWZLxPK9WVO2yPFJX0CKiUOqbxInIoVeiNvv0U9N/TvGP96YT1D+bDYPCStwV5QfV6tNAqknLSRf1ICEE3zmgZabFPKx7I542491guSHxNVfK/xdlgrY3H4bUHnfbisGgLx9KLbc/Jdz1iDTXFZcr7b0ynLHYLrbrJWVXTF34ZBakIaWKSzYOZz4k96bgqOMOyVg299fQyQjMdoRD0dki65AR2a4vU6tI4kGEqSrXDMO1yzF4k80i6gkQDbTeHXsUIzNWIi/0TlneZeJC9W544PeRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+Tg/91Faq5aDWnRiZJZ5JVcCycSRtgJRKkogPvBamb0=;
 b=MnTicmodMTz4T2Fs1wO01y0sJuA7giYIzTSS0Qe6PqW3W1HRSRg6SYEwefI1lT7Gn6zV/Juw5VAi6nFb1tAzONxCi8ofQCek9NAcbzbMKhTUAWS9tjcgnd0vrTaHo24FtvueQQvf9DzBHncyDV6DWBf5mYp/R+PyFpOCWFUILy16avqZy+32HD4k9nzZDtr5DBYIudRsJN57FFYINMPeDGYFDmaZTtocpdlAP35xTKyvh+bJCM1Ohi3i2bHCHyY/RN6zCOD/O6tTq6L5qQbhIAWxjPlPCUkvzIXheCoOErxtPcvHYGKMfV2iNM3qhv5s0Jpalik9LpHLcqPxjZFqZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Tg/91Faq5aDWnRiZJZ5JVcCycSRtgJRKkogPvBamb0=;
 b=v5+RHmE1CRbmccqMmifIQGGI8pbZbNZOUUYfAhHorNraEuYWYIFlgBNb7j6mLs+DvIOqajClahjijwSBci38CfRWn4QBmFgwmhup8Z/AA/n2YCMWbL01Nnv8bR1XkDbHuy0CT8rZckiy61052NQqIzEyBygBZJSGHTmszte2oSQ=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by CY4PR10MB1877.namprd10.prod.outlook.com
 (2603:10b6:903:127::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.16; Wed, 13 Jul
 2022 11:37:51 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5020:9b82:5917:40b]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5020:9b82:5917:40b%6]) with mapi id 15.20.5417.026; Wed, 13 Jul 2022
 11:37:51 +0000
Date: Wed, 13 Jul 2022 14:37:43 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Vsujithkumar.Reddy@amd.com
Subject: [bug report] ASoC: amd: acp: ACP code generic to support newer
 platforms
Message-ID: <Ys6uh4k7rl0qPNZp@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-ClientProxiedBy: ZR0P278CA0193.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:44::23) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c99e766c-ef92-42bb-7888-08da64c41e70
X-MS-TrafficTypeDiagnostic: CY4PR10MB1877:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SX95Xr16P9hFxqox1pXFa3kwX6B3Lto5nejPELz5/lRj3ZkYV6H7chln86YUudGr5swqlTloN5XCiirJ4J7q2upsGj9RdyksXwPvPcmGbB2Aibqz48dDoO7b6unTQpR2vI+WehU/Cyf5YIhivJrqr/o3JAce5WhOyTDNW2CvhsOhSlLRcBpTNPzGXwnNCWmQ0NL4b0oNeJDuovUQ/g5xaFXIwVh9ZLKGahqw3EVy0nKEQWFspG2b5kl5itzzmJD8irgAIn4Vx90T97/vYtngYLEF1sInNFJLEcpwz9GYAYFETi+U7GbBPq24r0QqCC4PXR6mZy0w47R8+UeV29ajoFt9q8sTkowODnGQ8zOs/aSQQ4PPR/GtOw9UqsHKpm16ykiu0I8nQaDQgPlvZd0QuPz8blCRl1wPoPJNw3E6hRpAJ0xLpAywEOeazrvVul+EF5AFR6GI1u6Eu+s1TX16lfdHhayow3dqj4LNdo4HOVbDEUZnVolrfYvV8UueDVvXtNdztsHC2wF3XAzpwWIC/RtxIbJ1V0w8cKy9Gu9QSWKCarBRcBiFj+Ox1aAFeGVsOdrTFtXdVUoiVOfxvZkPb74Fx5jjog2DxRW0V3SoMAP3T1V98BAhVJ6IP0CH0Zj+IbJFuQwFwE5kvgR8nHBbS/khiYOh0iGR1OmiUVjTCW/s1PJ2X+Jon5Ab3bcdKdKxul9nMyCpcg3gx38GY9RhCtd21Qg+qND0YVP0VfzKP3SsAlGSzzAquHpA+GhaqO1xwHNInLfwx/kv7VsIlFpz4PuUa+FJ861F1RLAwR32fPMRrpdQnebzWah8u/+YQidy1k4PXuxwGcZpYhli01r53g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(7916004)(366004)(136003)(346002)(39860400002)(396003)(376002)(8676002)(66476007)(8936002)(38350700002)(4326008)(6506007)(66946007)(66556008)(26005)(186003)(41300700001)(6486002)(52116002)(6512007)(83380400001)(9686003)(6666004)(38100700002)(316002)(478600001)(44832011)(4744005)(2906002)(33716001)(6916009)(5660300002)(86362001)(41533002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pND+J54+jTd+Rqcormw6bw2oZkk0HfTcdrO+DUZqD22HR51y4tcRIdssCpmV?=
 =?us-ascii?Q?M4LzyasP4LCoQWKOfmPxRwHJURENYbq88ATPtlMYZYTX1VhnYFdeNucpGTxG?=
 =?us-ascii?Q?bb8HzGnK/ZwBY9b+nnBne/xIYlWqSatkoWdUxuMgjjjgUAPMDEQpp52m7ZAS?=
 =?us-ascii?Q?VvizGLbhud4szP86rwv3Y24r0+mEbw54R1aT/g4PDCiITak9sfrP1uCTbpGY?=
 =?us-ascii?Q?BcIoLvkc+ek9xCPchcUxFcEO8p5L/VfTTzlMLIhUrpk3xa4sWVMnrWqWcVC8?=
 =?us-ascii?Q?O4dLX7N+IAHti4mOV2oomq6bzISLq1m7mSkn9uskpYTUl473GAguL5Kf6yzi?=
 =?us-ascii?Q?v42ZXOVZmFNCwGZEwxTK3d1z4izvXj/uthvoMRJZfbQMXmjRiInmEXCanvz3?=
 =?us-ascii?Q?xF5Xbu5gRd/HmiBwhUnBiTyJrUYXeNB81uvhas2eitt5RXK17v2r7rVrkyKt?=
 =?us-ascii?Q?nGt9SdhTy1bB5HrgSWnlxb3KrGOLEFfN/4yWj2AW/ybI+PJDYOYhPH1EhxxF?=
 =?us-ascii?Q?WniVKNbMtDHRj24Wekq8ycgvr0gx5TWSz355Y8qK/KrZ/Itjy2fRMBXrXNSM?=
 =?us-ascii?Q?fR5T6lYEtgkfTu1VimhWUdllQJabjLeRxZUbRUBt8ht3PswhrmYzxzUinoFz?=
 =?us-ascii?Q?c9bb7D1v3BXeyhtonlDaeUS+Uti3LVF1lu+i5I0IRbjqmKe7M0z/q2Rj+HFI?=
 =?us-ascii?Q?Kox1ojVtLBY4AQt84us4+rs9WNs/Jpbp26/88JCXJxaYvAbAvnjrzVrb2EzM?=
 =?us-ascii?Q?iGPRWiQaDDCsXICFoABKnfa3wSo+CXW7gXrL3AA+hmKMAWVwb0jgwmD0po3g?=
 =?us-ascii?Q?RSlj11R9xBVyktHLbsPoUC9MdpQ2G9uqnIlB/ui6RhLNsjqeqv/tj6zYbNVn?=
 =?us-ascii?Q?CNJeOlr+sJcmCCmBxLcxdXlOnNMLT5b6KkL5n2fI6MB5H3RqynkSL2GxoSaw?=
 =?us-ascii?Q?CvvchjkEu2F8IBBdLFj3e4ZyI5NRWdxkF3xlORZSnKSo9bEcDoBIIoFpgFw6?=
 =?us-ascii?Q?PN0686Q9Ng+7URu92+LNovqVChwZI4RTPu2UCwYX7Jzb/LmX9gKYgOf6OI7m?=
 =?us-ascii?Q?qi0VxhniQyQK2Aei9yYnZwzWYcdw5CCHIIex2YNGRV9WTNnG3zOzr39YPPBs?=
 =?us-ascii?Q?BgRFDdA2XtJFxAjhBG3FgOtqt7cvekMVnOgT8lE3bjIr4GixNGItn2v5zrL+?=
 =?us-ascii?Q?PoAyk1dJ27AsyHLn8hOqUJ3xg+xHu8zm5OF38zpgRSEIGXwlMFYJnSfpdvwV?=
 =?us-ascii?Q?KHpouJi39I8N+UUXjnnY3fPf5njL9T95iKd3ZpFxGdM0SnwKVyhJmoxs2BhF?=
 =?us-ascii?Q?/Vf4J7HQMhNP8IZ+WBhkSeLrUYYrJdUTQFzl0pWQUJd3phu2M6F4+1EDufC4?=
 =?us-ascii?Q?taTqVs515PeTGBdv6TCNo+JTaIsQXUTAsJTegvsh8aZgTsrWqcd7IychXKdz?=
 =?us-ascii?Q?UAgIQo7RY719D6IS9lzZbxWvFrViomKkTssyLhiOA3hko84oSdJ1N7F3GdFk?=
 =?us-ascii?Q?DD0qopdu62HcjMywVfMO6XBL3KW35Vd2X3musRxhpjc22otPh5OjLz6t1HXu?=
 =?us-ascii?Q?A4z0Dsg4IAC60vdmmHxY76nDONc2Tc/RHb8ZrklkZ0MP5LhY4FWq/xCAil9X?=
 =?us-ascii?Q?Rw=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c99e766c-ef92-42bb-7888-08da64c41e70
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2022 11:37:51.4807 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N4HFmRx+S2nMzZmM8UdCy3EZ409I8pKJkKAdtAUG9XBHQSvH9EV7S09ff0nNEsO9+HQA2Yyit39Mv6QlBbswUZsIlQfd5xnB3+Jj7ABk+g8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR10MB1877
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517, 18.0.883
 definitions=2022-07-13_02:2022-07-13,
 2022-07-12 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 phishscore=0
 mlxlogscore=729 suspectscore=0 adultscore=0 mlxscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207130047
X-Proofpoint-GUID: zZ4DqhBPmuLcEczzh_QADAhsD1irNkkO
X-Proofpoint-ORIG-GUID: zZ4DqhBPmuLcEczzh_QADAhsD1irNkkO
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

Hello V sujith kumar Reddy,

This is a semi-automatic email about new static checker warnings.

The patch b24484c18b10: "ASoC: amd: acp: ACP code generic to support 
newer platforms" from Jul 7, 2022, leads to the following Smatch 
complaint:

    sound/soc/amd/acp/acp-platform.c:99 i2s_irq_handler()
    warn: variable dereferenced before check 'adata' (see line 94)

sound/soc/amd/acp/acp-platform.c
    93		struct acp_dev_data *adata = data;
    94		struct acp_resource *rsrc = adata->rsrc;
                                            ^^^^^^^^^^^
The patch adds a new dereference

    95		struct acp_stream *stream;
    96		u16 i2s_flag = 0;
    97		u32 val, val1, i;
    98	
    99		if (!adata)
                    ^^^^^^
The old code assumed that "adata" could be NULL but hopefully that
check can be removed?

   100			return IRQ_NONE;
   101	

regards,
dan carpenter
