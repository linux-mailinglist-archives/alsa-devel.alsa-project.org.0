Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B6EA56B419
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Jul 2022 10:09:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2D8A01DB;
	Fri,  8 Jul 2022 10:08:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2D8A01DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657267778;
	bh=+wEQdLE3cNLZh4UtunjrM/vieGkfFTiHX1jUft/znMA=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Z8TjYuaEM0Bn+uwF/ml8Ejnst3QLnknG55SQFZ424MfHaJBXSfDXQJLgtuLio87bh
	 eUI0HjmtdrkFWTk6fN3WEefnINWHY94waMxUPUwDL2A0NTCjnT1VERyKFjECoEnR6J
	 YjPOhas3vJJ8nMs77L6Q2IO8+37rQ9jnH/ckXDxA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A5959F8025B;
	Fri,  8 Jul 2022 10:08:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EC0A9F80167; Fri,  8 Jul 2022 10:08:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 06447F800E9
 for <alsa-devel@alsa-project.org>; Fri,  8 Jul 2022 10:08:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 06447F800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com
 header.b="X72JzCaA"; 
 dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com
 header.i=@oracle.onmicrosoft.com header.b="bJ5FFGIl"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2687ELQJ020796;
 Fri, 8 Jul 2022 08:08:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=kF1GtA3yaJ4Srm++9xpcbKR1ZYxRBm0gBno5ULhEtuo=;
 b=X72JzCaA+gVUHPFjc0Kie3Wvjr9ytLx8g9A1x4b6UqXrln7vIRuEO6nEYWLsTp1pQGGb
 1Lqgngb+kp19FcfiNdORbvx8nzexkr4NHfKy7ANXhnZn12Aa0zWYlFzyAZqesmD464s/
 mfFK89pI5D+ckYP999HYRs5Rpoeo3JynCRJxATZi9sa1KJfXaIgQuX4QOCym5oAz9Rav
 AeWBym8yUKKkf7DoXw/1Bh8DWi1SCP+rOljmfNV+i11+a7hfjjKFV/kVnJ0vMGwRzaX0
 8B3cDbLPI1FLKNlRCmFt2ZXLR6Quk4pFaFdspTjmu7hW9geEuzb85OWG7NRikaWD7gWD Tg== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3h4uby7dax-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 08 Jul 2022 08:08:29 +0000
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 26885Smn027434; Fri, 8 Jul 2022 08:08:29 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2109.outbound.protection.outlook.com [104.47.55.109])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3h4ud2cr2x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 08 Jul 2022 08:08:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AcV52nKsIK94SN7qnYrL/vtObG8NRifFiD9U42NA7YPMKnpE6ButGQ4+mgNA0pxArjOJiMbwNTh5eB8y513Fc0T6+Vktdsv5K+aFQhUuOOeEr0XXbRlAL4lYXsamjqgTJGP0r4NtRNO4vL9W12e8+6dvwPOHMxfrtbXK8LpmcnFsotWaxRZ1jUEZlgge6RIFgLOv5NJqCNTuZPRAhCHFzFZoK2r3esLmbLYan1UX0iOc43d57JwcSg2Eug2cYg2uJATw/u4pNW8vqe59NmYikn1h0BESk8dYeXkQGtu77fqDPH61qEkiyu3oQt+t26v9iB9UkQA9vIXCN0Tc8QL7cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kF1GtA3yaJ4Srm++9xpcbKR1ZYxRBm0gBno5ULhEtuo=;
 b=h9MAynCDswtK/LV6weso07tC6pt1OeE+87MW1mevd6uiDvhROwgb0/J3b9cIRQkNGGk8R2zCL55fe5hRfHEFrXoKvrz3wQXFqlWWo0ahMGdMKjAZ6dz3hu06QkL4Q/+TtHrw7e1BrkPM403dor2FGOwudUR4TiK6xzAPVZ5l3mo1W5+nl5FU9wpOntqX9W8ICwvTE7SZ4RcoglCxzhQ4faHc6t3OmUuUp0UgIKFd3BITLQckw4XwBl6ijMGz5oUqCIyZIvddPXIcmtYYSFTmWT6Lu3y02Zo93bVe6R/viaa39hr5rcMyRZZAbyBc1UsRsCmJL0VOEGpjLi37/zym+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kF1GtA3yaJ4Srm++9xpcbKR1ZYxRBm0gBno5ULhEtuo=;
 b=bJ5FFGIl6RziSZ08vNR9cRxj9ZcY6paWE8faHP1Kyxqee1N7e5YhjOM5w2CCNa1x/BdLJOESS7JXZhWHl4qrH5eOmowyiUOAlaJ2taulGtQLrdBT/+87Q6wcYlintpAoMvVd9hobXkw9pyU9c6NQI8faSpA9islN4ymsrt8fkes=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by BN8PR10MB3603.namprd10.prod.outlook.com
 (2603:10b6:408:b9::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15; Fri, 8 Jul
 2022 08:08:26 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5020:9b82:5917:40b]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5020:9b82:5917:40b%6]) with mapi id 15.20.5417.016; Fri, 8 Jul 2022
 08:08:26 +0000
Date: Fri, 8 Jul 2022 11:08:14 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: srinivas.kandagatla@linaro.org
Subject: [bug report] soundwire: qcom: Check device status before reading devid
Message-ID: <Ysfl7lzEyRVuQ+Dg@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-ClientProxiedBy: ZR0P278CA0021.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:1c::8) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3c5d7e2b-dc95-4c62-2517-08da60b90930
X-MS-TrafficTypeDiagnostic: BN8PR10MB3603:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: edeCdRKmxGGByZTOEtdY+aHB2dHolm8s2L9Ktx0ao7SJ9CrkE20sFeMdqfk1EJbUhN7f+nejJQbotQ7pXjulgNOKoKL/4eHs58p2j47+9FJKztFBPSGQxIh209zN5uP4RnInXZg0xOMY8lWIm0346BWmok1uV7s1HCBLO48CTvk5iWzTmi+M1fsnvt0+HVyxTqMYpI3SGmDKOzPmSsfqZ+P7kWauYAiZdIiMPKFyLgHrVrqsRHKnMOEtG1/t3d9LY6FpidsFZSyljqKT9mkUD5qLQgtsdr0oddKmkopUXBp9QN4MQPvOPnj7rmDL/lzk/ThfeUhaqITkw7AxOzxLh3nUbvtVTi2cPp8icaDpqr3n1GqoS0EJSntpG+Hgqyh+GnIPLQndMPQKipFAuKzz36WM23zWFLNlXkOK3SN4f2Lpry7A/iNbXlnLSrp5ipnVz01yHGCrEVg1Bl/SLhEGnxC2J2nMlydvqqF6b2JH536bHd/waILFlkscmDYgWZqYnR6Qh7b17eAmBmJVzg8OdhxQOGEID9pbX2GFVlwYklJpkdwLO/JqpcW0j/gBtloBSMv8h6KdgdZ6LgnF/m76QipJm54o2pjdgNeJKk2ySb1iYfzrtMugGWIGJpMchYjt/4mIhnMPcrDlZQgAI4kIm1N4pB/JUDB4buVDgEht2c/6Fd/SnIx7PcS/AkcGSCUXjpocSUtYGxlUZ70ZEf3kHYiw8OQFvSRRsU1OeYflm+A/z53naT92AaJnL1twdcDtULc7XpFr03+YqoDJVPnehrcN94aJrjLNzQwPyiC4HX4E9WHbi9Kls8GnTU8H61hH0NCA2RuiqH/Ak6sYtJfaSA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(7916004)(346002)(136003)(396003)(39860400002)(376002)(366004)(8676002)(66946007)(66556008)(33716001)(2906002)(9686003)(66476007)(5660300002)(4326008)(6486002)(83380400001)(44832011)(26005)(6512007)(6506007)(8936002)(52116002)(86362001)(316002)(478600001)(186003)(38100700002)(38350700002)(41300700001)(6916009)(6666004)(67856001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nNwLP/2lx/Acf4mCT3Of6g/4hlvq6F5v5a5jXLnMz8pMI3GvkVN2RHzWPbuf?=
 =?us-ascii?Q?OQlp6bTIqOJdV9Zh3qp2+Gyg5D7tlTrd9CS7YW6zA6tvzs8HBEzaYIo99S6m?=
 =?us-ascii?Q?ZvUJan6iQ9ReJ2yFWJeraMITMyozPzuOGM//rJTKjXDbBQwvbPmPJMsNUUDt?=
 =?us-ascii?Q?tku5hkAaMoUmzXm5Gg2dXhh9FpYfSsywRac8PpZz4sLiVsABkisDLnWUm2jp?=
 =?us-ascii?Q?XzQ2twT1KGk0Q1smdNDSQWXMRZmo8KVTw+zgMqeXUzGgDhHoUknIfM9ao0Yk?=
 =?us-ascii?Q?YVAyIT216qkZjGhEb5zwZMO4gRpWHHkPVT8dBboYvuuFVf7O9F/cqDjKzLZf?=
 =?us-ascii?Q?CbUydoXPnfdXoibnVBvMW6WTMw2YEb63DwZFPneaKYFcAHP3RWrKxO70XAUt?=
 =?us-ascii?Q?8Pi/JIrHNjRpH1S75Ynyy1tMS/ctx1eQrY15PUS0UoByoAGUfx2PZ5JtGmBs?=
 =?us-ascii?Q?htnaDT+iW7TdQ6ICQycGr0Kt6dn7FR0QsBdqaKHMfbnIgXU2Qa7fos380B+0?=
 =?us-ascii?Q?xB/tsxToovSnsNcBeb2Z+jJPZAXYJGhbbcq2tqrsnuagvo2MdKOXGIqTXuDC?=
 =?us-ascii?Q?hVh1UHc1KEPshaeuroEBOl5HY4RDbs7A4Og2AjuABwYMghJIaofvbDixy7uU?=
 =?us-ascii?Q?owLyztuC2K8z3ZegWk2g7bTcfj8oDzpw4djHUoC950Y+6VmEM/soCK49fDQW?=
 =?us-ascii?Q?rsW7amC1U3lVplbQiiakVzcVHUIfybSfU1jqaqRpNXxG1sX1Rb1QR8tIFMif?=
 =?us-ascii?Q?NqDFMQEJ2JKGMS4S2J+EX5WN2lgo0ZFpPhjREwIj/YK5GZt5EPcRx6CgWPJf?=
 =?us-ascii?Q?Tp9wSBqDqoFPZFsaT4A1jKoMPhyfSwDlampeiPWlww+7fP7n+txWK8V4tmjh?=
 =?us-ascii?Q?5pE8zpqdb3q5PU7viv/qTkVkastEcLb6JmH7UcHbxww5vRTwrStGujZaG+YK?=
 =?us-ascii?Q?uiqF32oWiqosgHkczocw/PR8FTkH6wCT+aKQLg5R+CVkqkreVPrLp3Y5zS9l?=
 =?us-ascii?Q?OTZx2S3gxCsvtb0x/S2TDu7gSyXcSilhSx9G48hu9WTa7woXG+ibFsrdk1dM?=
 =?us-ascii?Q?up/fzboe6npz2qgD7zEBvDMhZ3o4EgETitvRSd8JunSfdunqWtg3yQn5oT6l?=
 =?us-ascii?Q?OzKu86WMBQOwo/I9F0NXoh+tdMPREy6MVsfTvm/mufUhEJE2oW5ajw2nleBt?=
 =?us-ascii?Q?G0t7B91IMPEjENg7K96jwvbQ3iIsQL/27YVcLdIkFSKUwOIFuvzoNANmMyCK?=
 =?us-ascii?Q?WpAOClkcUTb47areRK+yxGqo8R2tv39bIwnWWf8ztCLw8w9A0UAsHpNACIyB?=
 =?us-ascii?Q?p25nlP2kZglMMM5shL30vHgfE5F1F/v7lDUNBG1qaMgLRksOmVkt8PBhpxw3?=
 =?us-ascii?Q?QnQq6Y5CKhOGMEzEA2MJrR7z7ia1E2JpOkhLcLY48Rk6K/iVHpuymfXyrQaI?=
 =?us-ascii?Q?DJb5kshu3kKQjZB6S1QVLqLK82MBMWY21+66GoU8zVZv222GuQ5L53l0fEbf?=
 =?us-ascii?Q?GSyIOAhxlE1KTlIbiA9PWC7uDcq9JjdkN1qbTfWzZaUVPcm+vNkWHu2h3H/e?=
 =?us-ascii?Q?Q3avWyeSmFb7IDljTEk3YYx1JNqbwvGd2K7NEF2ZRtwtqPZt6EK6oyxbl+7r?=
 =?us-ascii?Q?uw=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c5d7e2b-dc95-4c62-2517-08da60b90930
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2022 08:08:26.6962 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cvcZfKNQs2YIvHCaHhFA9mqbgiCVRGeuHp4hYzU//XyU7OT9dlqLCVogJeIqSCoI1c58UOHL1yWSvlgw6XGg/JKhA8GnUqPAg/XL3QztIbE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR10MB3603
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517, 18.0.883
 definitions=2022-07-08_06:2022-06-28,
 2022-07-08 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 adultscore=0 spamscore=0
 phishscore=0 malwarescore=0 mlxscore=0 mlxlogscore=802 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2206140000
 definitions=main-2207080030
X-Proofpoint-ORIG-GUID: FS-RW0WUMZMSwXET0KaVA3SZxUvckUzk
X-Proofpoint-GUID: FS-RW0WUMZMSwXET0KaVA3SZxUvckUzk
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

Hello Srinivas Kandagatla,

The patch aa1262ca6695: "soundwire: qcom: Check device status before
reading devid" from Jul 6, 2022, leads to the following Smatch static
checker warning:

	drivers/soundwire/qcom.c:484 qcom_swrm_enumerate()
	error: buffer overflow 'ctrl->status' 11 <= 11

drivers/soundwire/qcom.c
    471 static int qcom_swrm_enumerate(struct sdw_bus *bus)
    472 {
    473         struct qcom_swrm_ctrl *ctrl = to_qcom_sdw(bus);
    474         struct sdw_slave *slave, *_s;
    475         struct sdw_slave_id id;
    476         u32 val1, val2;
    477         bool found;
    478         u64 addr;
    479         int i;
    480         char *buf1 = (char *)&val1, *buf2 = (char *)&val2;
    481 
    482         for (i = 1; i <= SDW_MAX_DEVICES; i++) {
                     ^^^^^
This a loop that starts from 1 instead of 0.  I looked at the
surrounding context and it seems like it should be a normal loop that
starts at 0 and goes to < SDW_MAX_DEVICES.

(Or possibly the other loops are buggy as well).

    483                 /* do not continue if the status is Not Present  */
--> 484                 if (!ctrl->status[i])

So this is off by one and reads one element beyond the end of the loop.

    485                         continue;
    486 
    487                 /*SCP_Devid5 - Devid 4*/
    488                 ctrl->reg_read(ctrl, SWRM_ENUMERATOR_SLAVE_DEV_ID_1(i), &val1);
    489 
    490                 /*SCP_Devid3 - DevId 2 Devid 1 Devid 0*/
    491                 ctrl->reg_read(ctrl, SWRM_ENUMERATOR_SLAVE_DEV_ID_2(i), &val2);
    492 
    493                 if (!val1 && !val2)
    494                         break;
    495 
    496                 addr = buf2[1] | (buf2[0] << 8) | (buf1[3] << 16) |
    497                         ((u64)buf1[2] << 24) | ((u64)buf1[1] << 32) |
    498                         ((u64)buf1[0] << 40);
    499 
    500                 sdw_extract_slave_id(bus, addr, &id);
    501                 found = false;
    502                 /* Now compare with entries */
    503                 list_for_each_entry_safe(slave, _s, &bus->slaves, node) {
    504                         if (sdw_compare_devid(slave, id) == 0) {
    505                                 qcom_swrm_set_slave_dev_num(bus, slave, i);
    506                                 found = true;
    507                                 break;
    508                         }
    509                 }
    510 
    511                 if (!found) {
    512                         qcom_swrm_set_slave_dev_num(bus, NULL, i);
    513                         sdw_slave_add(bus, &id, NULL);
    514                 }
    515         }
    516 
    517         complete(&ctrl->enumeration);
    518         return 0;
    519 }

regards,
dan carpenter
