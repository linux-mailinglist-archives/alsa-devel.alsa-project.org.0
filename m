Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EBC5146D6AF
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Dec 2021 16:13:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8E06F2624;
	Wed,  8 Dec 2021 16:12:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8E06F2624
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638976406;
	bh=wkqjjryrG6etU72lssKL0Ijy6prSjJ9k5ZpWWgZCJF8=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=fASKkmLAUmQoNk/SO5tHfP+zz7o6SEzQ+Q2pKf0THVKKpPLx6zN/vEzEy3FPZ5MxN
	 YBeX5TmB6GilHdelfKgz1j59X/nvQRPFJYRvhElXKCbGmR392qAKdxDT2S1h8+S5El
	 YjlydWjYON3mnbmqgduQzIC5fEcc2C2fYjSceCcM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 29665F804EC;
	Wed,  8 Dec 2021 16:12:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0ADE9F804CC; Wed,  8 Dec 2021 16:12:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, MSGID_FROM_MTA_HEADER, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3DB08F80103
 for <alsa-devel@alsa-project.org>; Wed,  8 Dec 2021 16:12:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3DB08F80103
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com
 header.b="WTrPP9Sp"; 
 dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com
 header.i=@oracle.onmicrosoft.com header.b="Ls+5YMnb"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1B8F9ZAH007074; 
 Wed, 8 Dec 2021 15:12:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=G3YwlbiYMrFIJDTWrrK/PDlDJtQudd+YsifcK1sPbro=;
 b=WTrPP9SpV04o883UKLPOdR6JwSz7GSkVJY3zT/mOx8h2oCYMhRLROCbDbl/JvoDldDuL
 Xb+JgdTprCgIsvpu/KcHDSh/wc0KRHnCsTUYy1NHvB2J9/AABh8S+ywz7Zu10C1alCDk
 o3TuOeCesJfEP5fPtuceh6W9o+dusrIoQ8WeY6LbyjwI52rhTcWft7BsfM+BVgh1RLl8
 JG+TOpZSfvTKEY0gkvMqKkt3IR5hRgs6OzWcC4UJKS2lSpIByF+yrcpWDST6Ddu7aeOx
 2F8U8JTSoLi/CEkVxX6DD8bo33zaX/FeT66Q3UBpJcumYJ0SpbzdjDPVChUaE7NBIgWe 0Q== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3ctse1gv95-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 08 Dec 2021 15:12:03 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1B8FBOfZ047569;
 Wed, 8 Dec 2021 15:12:02 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2043.outbound.protection.outlook.com [104.47.66.43])
 by aserp3030.oracle.com with ESMTP id 3csc4uufn5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 08 Dec 2021 15:12:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pnds/tOs7RQNuP6GuOC2ouCUrPEE0jdto5uKxY5o1qGpZ87B8nRVptgXukIEeMYpT0VC2JRWXaQtz1I32cN6LSFD53Y2Mb5XJCzbJR5eWrY/98osSD8Ld6FHPuUG6tMSzEieWAWT2IRSZAPzyDlEuYRqT6iYHcMMA39sTVp9tc2yCYcRYtRd6EkX6u4GmSQWHqyrCs4hTRC56jAlKStdkqY98ba9WcuzvNr/XufDuNG3DKQorIV4iFyoAHLcQngs7lbn32HzeioCNhOgQBHeJqqz3tfab57UikA+dAnEvJXXdJYW1HjomNIh4z6OF8t1eojKuvmjZ0BUSnr8yGJTkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G3YwlbiYMrFIJDTWrrK/PDlDJtQudd+YsifcK1sPbro=;
 b=RFt5wPEx59U1FGru2as/fLAgMTi75Qq7SUtOsyqjY0uPg2wCjIIfjuDoemMtHiYTn0v0tD42QZT5w+YngXT+tD79ZsiqRKGj+ywgXUnoc9JZPvubJE7rQfKu34JFMn7riWDs+S0xVoQFqDh4X/BC2QlIoesTLqWO+raKFRu3L50L1C6iuM0d+8bAIY/yHQDZpOsPoqPJZM22tnrOb5xWB83Tf3PPqwp9zNejScWEwKdRtllX2iUwEoZ4wgpefE8JCVSsXLgmaiehyHB2eMXHYQWA7ZfybmLkAWwa1ZB/5SG+S0Bg4lqodk5KKsezCTSZV7v/njjCMk2K0y2JaVZhHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G3YwlbiYMrFIJDTWrrK/PDlDJtQudd+YsifcK1sPbro=;
 b=Ls+5YMnbVGMKAFBbqBxcE8fWew2NvkyTRBQeqTIcPgSonG5nDyZba3i2QeB9gyv/Mj+Q7dD+nLhUhLU2RwUYfQn9SnHfLg5GW60DjSk870bOfbTv7fDH6EJUraI9EAYvTJ0zvUoLSdDqGxoduh2Br135kb0ffZI+RA6/3nuM7BU=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MWHPR10MB1247.namprd10.prod.outlook.com
 (2603:10b6:301:7::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.21; Wed, 8 Dec
 2021 15:11:59 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::7194:c377:36cc:d9f0]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::7194:c377:36cc:d9f0%6]) with mapi id 15.20.4755.024; Wed, 8 Dec 2021
 15:11:59 +0000
Date: Wed, 8 Dec 2021 18:11:45 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH] ASoC: mediatek: mt8195: silence uninitialized variable warning
Message-ID: <20211208151145.GA29257@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0078.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:22::11) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
Received: from kili (102.222.70.114) by ZR0P278CA0078.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:22::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.22 via Frontend
 Transport; Wed, 8 Dec 2021 15:11:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 27ddc11e-2510-4d79-8c02-08d9ba5d14ad
X-MS-TrafficTypeDiagnostic: MWHPR10MB1247:EE_
X-Microsoft-Antispam-PRVS: <MWHPR10MB12473D217A51958B4C15EEB58E6F9@MWHPR10MB1247.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1775;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5nizHeNeqOLNxV9NoBTsRnkD7zS1n1zsFpphbc/q0b6wlrIgSyK3l4Yk1BReatqDR+Z0/mTZP95P/ulId0FJgRHSejSpNHhxy88k5Jw1RMONjs/ei2q7BvJqlljpb2cJx7LnQ3XGS6rwmsu4QdrtRQtinZHFzvkg7pDGOJZ+LkqTyYclspi4t9P1t2jTjlQzU3UXOCTaO6lSaLn0zOgucC/ir6JoXeG5ZORCoOTCabDMiNbg0gBl+/IeHxUBASR3eQl0O1zGmKRptRe99r15GGUPhKsdGis9XSxKdSaJVqbhUV78TwrVqhjGwy1QnSfU6l+zQKKPKBgVO1XG1nn4Ackg5KWG91SP4ppa9sWEHuhbTZMDGRPt24r2+BWwBA3Vn4lH2qjU+hR0pnY8q7Ii5VOMHx0RPwXARbvxoyW8zCpXjeDJ0LW7x9oRe0fXWVCsqAyeRhI3WVsq7eqZIH+HpZ95xie8E5TBqN0t0kTxLQPtbvQHUWALRbNcuykUaSq8geHVADCwc/qzTXsWgw0lg7cvM8jXAEUqueXE20Ie45XT8sMe36FgMsS+2God/wMlsSQHSOOtOhpxStaLsGpiTluxdelAHp/SolxakazSRWEq7jOyZnmefjACnlthIBdRWSlmbQ9Y180lU5a+dRs0Zz4mIwg5ZTq1AGmBTpf4R6tjowIUFvW11TlkQqZP4caRk1eqosLAbUfe/Z+XW+IdAw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(9686003)(26005)(316002)(54906003)(7416002)(186003)(38350700002)(38100700002)(6666004)(66946007)(1076003)(66556008)(66476007)(44832011)(9576002)(55016003)(8676002)(5660300002)(83380400001)(6496006)(4326008)(33716001)(956004)(33656002)(86362001)(6916009)(8936002)(52116002)(2906002)(508600001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NiDU8sn7FHNTu31sZPCpMl0hUeewwhd0lePVwc9p8RSjhtW4I8hrxv1b346M?=
 =?us-ascii?Q?ipQAgTlCMDugYgjB+TYP2iiSaEQXFJscrPPHED+UCRhP76DXLULyAWBlkNYC?=
 =?us-ascii?Q?9CIp5gO0ZOoRL5M9HJmMIL7bgSxSZm1IG67uGkMuvPCu8fX9Bgj62FUfP1BY?=
 =?us-ascii?Q?bAoQjLaiaj4wX92m0pNfrBbKzndKZzrJEePjOcUF0cSPp7NfpmUqhxGSmuUb?=
 =?us-ascii?Q?RcY1YVhcmMsX2okR6LHZzc044iw0JL8bvPm1z8PAeVy02/+ijRPcz1dwy5YV?=
 =?us-ascii?Q?1KqGigRYEE/UR61v2kOEYjkE/nXw9nrnR2e/1qEp37zLNIjQQmAGAjDTAmfK?=
 =?us-ascii?Q?mNMTyN6EuqcpFbGJooVwDtAOIALkJOVQa5H5zbIMURWc+9/WMY5qmPMfcecm?=
 =?us-ascii?Q?RiZNsRljwSfid9uJvidz8HEclQ4d7PhnEuN6Y2b3tMrj+4MBaib+VoGXj/Lz?=
 =?us-ascii?Q?4Neq1O2hoHuZfTmsdk/aqXkUB5W6LBg+d1+5wgCEuwQctNY3AjjIgUzW9yx9?=
 =?us-ascii?Q?vujKVuwthGqNR+6Hbg6M76jCpUm9VxIVw+zOh8OO/zNRnW5hruCNFIQlTIVx?=
 =?us-ascii?Q?IBgplp86mrIbi9L2xZ6w+Cd503BdOoA0x4lbA2Z/usulUwwDOoz5jfQMq1T6?=
 =?us-ascii?Q?e92gO0janLIHthXZhGRZlDCZx5kl5v+b99SE8CYG4eggifdKzNsF69v3uvPP?=
 =?us-ascii?Q?o9t/UNLF2KJ4zpGck1FKlIZpYGuFvkOQR1iZ++WV8vJ5dD6aDqifyPi5pFPt?=
 =?us-ascii?Q?3KZHvow9WL5/YQJJltjoageI2ytne20cZHIALZNJRk58tCfXt+LxYS1AGytY?=
 =?us-ascii?Q?exZvovrjtiZLCk8qv4BKzo9rjPjyNdjNtx9+q6VF5i+ZcQjquuhEL9qNwmIZ?=
 =?us-ascii?Q?/x8bXlDBYymnw9WQRP+7zIp97Y++a28mE8AsmxrwBOVSNGO6D3S0/PP9apvG?=
 =?us-ascii?Q?dCm83knAvFA4o56r1ghq4VdXJ4Zkg4/QR/jO8yVLnq6ibSKKjjaW/hqz2BrE?=
 =?us-ascii?Q?GgDuFqTr1UrLU5kZmj9XcnoAKZ3NEMBgYs3Db4/KQpfithv4OnDEKJT2Trfx?=
 =?us-ascii?Q?IOOkyFjOQIqiDSndMCUuyP7ye11beIIQ0wodT8UHu4buw6lZIa8JzRo33f3M?=
 =?us-ascii?Q?psJoaNLyKKajyFeF3UV2VUT0387KYpyiHoWVdV/vNftLc/NwEvidIXZ/p1MK?=
 =?us-ascii?Q?STumDUETQLKOZ7PyVCyB88Gq+hhwxaT+OiY7vl/Yiuf463K5/9Db32AdlrbW?=
 =?us-ascii?Q?VPLM/IxBPiZ1RJc9Xl5TP62XpliWtU1D32IPb8xRVASXbL23Ds+jNKfUuEht?=
 =?us-ascii?Q?LeQe+nVyB7jnCx6BXHrDz9GXC+OY+tEIXMPINYbAElPo5pKn3synEqojh44q?=
 =?us-ascii?Q?YAO8OIpSQgV10meiCmWrrxkOYsIY/wl7jPPPTeD1qt3ivGxEBnD5I/f+OEn1?=
 =?us-ascii?Q?Zjdv0B9pCo6IVKBSIpAtxojTpgv7li+dYWhDWF7QllVLyDnJH5bCNA4dQm9G?=
 =?us-ascii?Q?dTTYvjHZySDM48DkXgyzanZj4IcaXnsvcYoE1DpB5PEJWbHWdavVnOoGY4gp?=
 =?us-ascii?Q?B5JBGDg8sDMLKA2LDqJdudcb3hhesD3daASqz6FPm776JyXlR6CfEwmUMmb7?=
 =?us-ascii?Q?ljr/7vZ2SvrQfrcQWDNndyesK4GPfcaNGuIoGCYDmkDOKPZ9GgC5oKlFYzTT?=
 =?us-ascii?Q?jUZazw9JiFxl2wWO7P+ksCM+Z5U=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27ddc11e-2510-4d79-8c02-08d9ba5d14ad
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2021 15:11:59.5666 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kJ+dBRrMAiLT0O3tii7cohBHKy6vw49zocsFwaxmB6Qd8VR+0KZ2C5UpC/6eO3A+rp8e6UQzq40FnIkHnA6XweuipmwTe2SG4MAIRRGmF7o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1247
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10191
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 mlxlogscore=999
 phishscore=0 bulkscore=0 malwarescore=0 spamscore=0 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112080094
X-Proofpoint-GUID: yYscDvO32l6V7Eu1z6ABjpuTqJJFyn-O
X-Proofpoint-ORIG-GUID: yYscDvO32l6V7Eu1z6ABjpuTqJJFyn-O
Cc: alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Rikard Falkeborn <rikard.falkeborn@gmail.com>,
 Mark Brown <broonie@kernel.org>, Bixuan Cui <cuibixuan@huawei.com>,
 Trevor Wu <trevor.wu@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-mediatek@lists.infradead.org
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

Smatch complains that we might hit the continue path on every iteration
through the loop.

    sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c:831
      mt8195_mt6359_rt1019_rt5682_card_late_probe()
    error: uninitialized symbol 'sof_comp'.

Initialize "sof_comp" to NULL to silence this warning.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c b/sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c
index b240610dcef0..11a185da0d96 100644
--- a/sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c
+++ b/sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c
@@ -813,7 +813,7 @@ static int mt8195_dai_link_fixup(struct snd_soc_pcm_runtime *rtd,
 static int mt8195_mt6359_rt1019_rt5682_card_late_probe(struct snd_soc_card *card)
 {
 	struct snd_soc_pcm_runtime *runtime;
-	struct snd_soc_component *sof_comp;
+	struct snd_soc_component *sof_comp = NULL;
 	int i;
 
 	/* 1. find sof component */
-- 
2.20.1

