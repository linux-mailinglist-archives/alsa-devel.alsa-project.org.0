Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A07EB3F968F
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Aug 2021 10:58:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C54F816DB;
	Fri, 27 Aug 2021 10:58:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C54F816DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1630054733;
	bh=f1H9ZhjVLi2r5rT7SKj3D+J9ro+sy6nZULpjxV9uwIs=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=I+6sj/6flWbNrN9oQOi7hbDX0Z9RLkoO2duRcZtFMS7ODYS5VnFGE9VqpTbAYlShM
	 oluuph4RYrzj7jhM5eTzydadn3LeRNtJG/aaoUPaRc8mqk+tQQc24uGuSl7p462oph
	 WxuyTqH5FIdcKPWLsxS9UJ1VFOomIAzC33HSRFXg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E2D97F801D5;
	Fri, 27 Aug 2021 10:57:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 543CBF8020C; Fri, 27 Aug 2021 10:57:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, MSGID_FROM_MTA_HEADER, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A0AC5F801D5
 for <alsa-devel@alsa-project.org>; Fri, 27 Aug 2021 10:57:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A0AC5F801D5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com
 header.b="nEeq5IsH"; 
 dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com
 header.b="A/0hvuu6"; 
 dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com
 header.i=@oracle.onmicrosoft.com header.b="UUsrulgQ"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.0.43) with SMTP id 17R6Ih75024236;
 Fri, 27 Aug 2021 08:57:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=rEPVWNy4Nr+RqwrG95Fi3CF4QKXsf3zfkfb2Aosz64Q=;
 b=nEeq5IsHky3EZO6SX/286r66o4xKeWRfJf5uqogi5cGTHZ17KmA5zR4rEnJyFGw90UOK
 k//SKjL9+aFy4xcQtyB3ksKHkijeqcPMq6GyAxHBzvfcHrCCsFiV1HXQJ8PwYix6tQWQ
 wQ8wmQiQKf7pqWIrnaJMAXIuY5uto5uQcPSOe87Ky5DNqkW5wmdHjZCDMoPh002jsFjX
 K0Y77HRPB/UwbOr98wk86ObhDNfxvJumPp7+81SFTmydHwiWfLfzP5OXD8IPXm2rPiL2
 Dyc28oHFlSbAJjjsLNA/vcoHDsYJ1NCWihNiJFQWkVoJNMpJI+H19i2bsVzbiDUdK+5z IA== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2020-01-29;
 bh=rEPVWNy4Nr+RqwrG95Fi3CF4QKXsf3zfkfb2Aosz64Q=;
 b=A/0hvuu6zKnY6PeKRx28uWwXmB4UmGyH+xoOr4hn0Z+B+opfrW9pfVT17tG/mFLWkDZy
 Ie66YWlM2AqLRiYu/dXUzsYRi5iIzY8l9AyzBp8+a5HiOvOf4VdgDDdtqncipAaenyHU
 nlPxgdRkPPg9R3RkJSZe5epXfA8nspnAD9Iqo/WXUbZ2rxHaEZ8Kil39VEDThIzk8SYs
 Pwu2V/JBopO6+Lb+JV4lY6Z12e8X4xOeXJKTqenunDF4sorueOCD5A8WBPWj3HvYqDR+
 kla77F6Om7Nv1oSkU9mEMk29bvTlP8t2OaKXAVR9nsNCno7TMw2QujbPKe5/wljvC4ez AA== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3ap0xpbfh0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 27 Aug 2021 08:57:48 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 17R8tXUe028028;
 Fri, 27 Aug 2021 08:57:47 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam08lp2043.outbound.protection.outlook.com [104.47.74.43])
 by aserp3030.oracle.com with ESMTP id 3ajqhm7xnk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 27 Aug 2021 08:57:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=khPvZbFF5i0u+/bDdxxZzPwOraKUZ3Xjmn38hZWaNcd850bz9xub3xPhfcLS8dBdNsfLKUfPz/0N/+HNOTY+8HCdd3r4ZNO+Rp4au+6KsK9a5G2IWDigOqZEr9se7OjEvYQwUi37K75xEsesQ0rICfpgZiCiWXZv3yB8VMnDmxml+Vj7jMXf9own/daVYvz2ORi1lQF/9t6UsE20p4n+I1LIuUTUAddl7llmDNvU+BUJkZy0TYPp7Eh1JF9B1WS6EWJmS45mziPSXaSdOUaD0QZfhCRd4W+kH74o0pVx+TXtWnleCeCfK3dOhBb+sdoY6HaP+OLVrRZMnQRxYVi1PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rEPVWNy4Nr+RqwrG95Fi3CF4QKXsf3zfkfb2Aosz64Q=;
 b=RWUHF/CEWtxM7gc9f1V1MbPiC5w16uZGfm+IGSsj9jNmUzuzg/vvCwx6tixxgtXqJpDnCj48dRAI3+T+HOzukyXy0Y5KV2ip6CIa9J/y0hfYzcepHZOw4wN+MyvOwcJxUTNvugVdeEMdsm4JrxCu8DRdIRQ2sQ1raoFTAdCLF1/DobnYNMVbfWNMFcjju4CLSRdJXN73nRT4mFO7eABW4yEPvEBXRdiHokgTMNh2j+wQ3H79pPuPtr6AXf1IYblZ5nPqlm1dCox1GDzhf+RGgjYaMM5mmT3Dh5cQa/6qkfaxZXnpRoDoVt2Wf9F7CO6/+RVR6PxoN4QeNTgkOcdV3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rEPVWNy4Nr+RqwrG95Fi3CF4QKXsf3zfkfb2Aosz64Q=;
 b=UUsrulgQ7N+OzBRc8tmcdpigW0F74Hv1xmK8tUzja1Z6OTDmzx1Ec3rCPL73x56VrBiLDhb6iFDRivjrnPsIKU3pZP5LreCvjBGaxFhbq865cotsTjdgMDA2reY/mdVgZUwnxV6r1Ww+dxjWhiXWLrD2bni5fveaJVpdwB+stjk=
Authentication-Results: mediatek.com; dkim=none (message not signed)
 header.d=none;mediatek.com; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by CO6PR10MB5412.namprd10.prod.outlook.com
 (2603:10b6:303:13c::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.21; Fri, 27 Aug
 2021 08:57:45 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268%7]) with mapi id 15.20.4457.019; Fri, 27 Aug 2021
 08:57:45 +0000
Date: Fri, 27 Aug 2021 11:57:34 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: garlic.tseng@mediatek.com
Subject: [bug report] ASoC: mediatek: implement mediatek common structure
Message-ID: <20210827085734.GB9183@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZRAP278CA0002.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:10::12) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kili (62.8.83.99) by ZRAP278CA0002.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:10::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.20 via Frontend
 Transport; Fri, 27 Aug 2021 08:57:43 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 08231a46-44e1-4404-55b3-08d96938bc6d
X-MS-TrafficTypeDiagnostic: CO6PR10MB5412:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO6PR10MB54122C556516B8FA0A27C5A48EC89@CO6PR10MB5412.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wyH9NA3I3ek4AMt++r4NHDkBPMjQi7jiC/xIVM6t1cxlCvxgzBFCrurj2HptlfYNcSYt4xghNni7LHyAI5bmTfwLzdvPyzOYd5KYpaAb6bXuQuFb4UIvC0x6vaaHZizdVAFl4R9LjkG4WMyvy7hUHcgaNEpA/Wf9MDldFDZQeQiacHQO+8PBmb0Qrb986mgjd9xsD+z/+C+j8GJlBVlRsj1BznjEB/oDXXkAfdTWDa+BPif+zW9HfmeQrBCl09E7UADqnrK6c2LkGVBNKnckBJfVh7rDA/u6dlVtwFIlZsX/H4APQUyzI8khY7D5170SnlZCX7pTe4Utii1UIYJ0yeqoXX/+2BCzYObATZ5JxYjrMCFkphusIN4f8jIJzTK+53EQ0zC781iE8NUa60m0ek7gZbXGzDnLrNriE5IIMVueHi2HxTfpWbyBGAqyX2N2ugjw0ZThw0zg/EsII4YwjxanaTVe7kdvGkOuMKlATl1Cre0xBq0FA1vkB4eoS8OkbIcv9Cbpz2T9qw+h85KDx5xA8qFwl4kS6l0e7ShjyLDiiE5QIXvPGeZj12+rZIZOwiO9kj+RoOn8ZVZd/wa+nRwdYMn56srAOwr9gAtT6Tf9rtJchYJj1o1OVipASvtLezNrmQMCRA+bLHS3J0Z2D1wr1Yu8MQ63+e868x8/l4RKs6QhSulXC2WjmKU+uJiSWpzvdKHtPvxsHaCFIFHVGg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(39860400002)(396003)(366004)(376002)(346002)(316002)(66476007)(66946007)(86362001)(66556008)(4326008)(8936002)(9576002)(52116002)(6496006)(478600001)(6666004)(33656002)(83380400001)(44832011)(55016002)(26005)(6916009)(2906002)(8676002)(33716001)(186003)(9686003)(956004)(38100700002)(1076003)(5660300002)(4744005)(38350700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?q6WvRxyB5CnvuBfKfsU7u4JEvJdJWaAtqMQZauJc8AuTRfm68SExfXsAQ75s?=
 =?us-ascii?Q?BK2mM4h/H55q4sFo+ViunlL0r8ZOvi16gvc+UelYDqQyB3hXf6WkLdXVxo74?=
 =?us-ascii?Q?gG08NOJU6/R+wgJ2agWjNfPP0iPtMBXOu27OBXx5XzM1RVXLY9GmBqIcdDyz?=
 =?us-ascii?Q?znCIICervqGbdidtdhTadVSkvs8JKjpBuj80jL4f0grAM1zNTq+iIvWQ3Xhm?=
 =?us-ascii?Q?+kZlzNOn0FBuHVKxZx18oDzN6FQ1SQFwGbHT8EqnhEl2VpVGgwWeuAaqw3BK?=
 =?us-ascii?Q?EWLzOauxl7TZ6vHDq0Jnoz0hQwxQip8zKDEQSyeSfPD6BvzoubeJuVHVhp91?=
 =?us-ascii?Q?BU5IjfDoUyUNxC2atmeJavy3dkDZ9ZbR1inu1HOmksk9u1f8RRiqDvftSE3h?=
 =?us-ascii?Q?DYi0wsgwV7RzJyWY30d5N/PDcvx9EZnV2c6xompXe7pbRVmNF71M6vCiyGZq?=
 =?us-ascii?Q?a59D3clgebfsyU3cYY91VxNHPBP5ir9OkwWLWSenmp0U/wOSpTP36M/xhjZ4?=
 =?us-ascii?Q?76Zaz6mKamzwaiLP/kz4PSSHW1hfyMYnZL4YeH9WoyuJsLtPBkDkWVts9yOA?=
 =?us-ascii?Q?MmZN9cWd4MDWLyPbVu3BUlqRpOHBSmedgg5wpLkO7/USJDfPPv7V7YgeVWNC?=
 =?us-ascii?Q?3aKTAFG8RT0k1IKV+/GzxYLsMK7SgAFgVjtLcMcxQOzJtSyW+Cxcs0kmvUSC?=
 =?us-ascii?Q?4QubuW9u/WSizSA+YzUtmhRX6f/6ufDpBlfOB2D4TV3r2Z5+B4mqTSN9ulNs?=
 =?us-ascii?Q?CUCA2jLURF7Bh+wQXWr9lRlwp/b72meUvRqJkTl3GKYWn17IySWR/qjXbXGK?=
 =?us-ascii?Q?aUvycpzeDO0+xbKwlgihm8cVO03zDi4dOgpa3Ppt8vF9aDwRzMcJy5Ik7qaN?=
 =?us-ascii?Q?GyEOTbN4c0VVCnP0IkuRfTouv8S1NwKccxvwVcWsBapeB0IL0N2LKezbcqEG?=
 =?us-ascii?Q?sii2mlWaESag9TfWQmEH0hKiN3x5xhdJzvwxNzhajo4U7ZFxyFJ4CyAX9pou?=
 =?us-ascii?Q?t/RjkZcOUZA9LQUg9YJtL1o+kpDdMpvfpcQIxg1vsikABvJRDUf1mOsNVJzF?=
 =?us-ascii?Q?qzPEgsOXruv3KnsIMjcS4WxWgVuWeSow9qIIYgNj5nasTH6DmgWkyAcS6ICK?=
 =?us-ascii?Q?mSMhkiNFcoerhUym4b77Wb3obY2e6mPGTyUI48CXqIRfOGLQZ0GyOkqp6JWh?=
 =?us-ascii?Q?U35GcknH8r+bK+BWa2ycE+08CSe2a4uWBqW4ZRXg1E2U9+rsSTVYyJKKeNHN?=
 =?us-ascii?Q?gE+//Jo0eD+TEQP5OTU9vUfLVwh+Mgsg3LfXAQHYvDkwX3q5/oP0jGvQqidp?=
 =?us-ascii?Q?ex8RxZTOw8XHjnT7hqBoQ0rW?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08231a46-44e1-4404-55b3-08d96938bc6d
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2021 08:57:45.2807 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: StBJok6zlsOFXkZ/3zj1eTqbqfg227/vvTp9VACmRNkM9Sos5ywykPBRPcvO/+HYn3fapUe22uW1qkEKH8J5wNPqfBAIx14Dta8xi4byk1g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR10MB5412
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10088
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 bulkscore=0 malwarescore=0
 spamscore=0 adultscore=0 mlxlogscore=792 suspectscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108270058
X-Proofpoint-GUID: 0wFk-ISEUmSr5FoGTSsoe8WhZCK9hoSk
X-Proofpoint-ORIG-GUID: 0wFk-ISEUmSr5FoGTSsoe8WhZCK9hoSk
Cc: alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org
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

Hello Garlic Tseng,

The patch 283b612429a2: "ASoC: mediatek: implement mediatek common
structure" from Jun 17, 2016, leads to the following
Smatch static checker warning:

	sound/soc/mediatek/common/mtk-afe-fe-dai.c:364 mtk_afe_resume()
	error: we previously assumed 'afe->reg_back_up' could be null (see line 359)

sound/soc/mediatek/common/mtk-afe-fe-dai.c
    354         if (pm_runtime_status_suspended(dev) || !afe->suspended)
    355                 return 0;
    356 
    357         afe->runtime_resume(dev);
    358 
    359         if (!afe->reg_back_up)
    360                 dev_dbg(dev, "%s no reg_backup\n", __func__);

Should this return?  Also when ->reg_back_up is allocated there is no
check for NULL so it seems like a very possible condition.

    361 
    362         for (i = 0; i < afe->reg_back_up_list_num; i++)
    363                 mtk_regmap_write(regmap, afe->reg_back_up_list[i],
--> 364                                  afe->reg_back_up[i]);
    365 
    366         afe->suspended = false;
    367         return 0;
    368 }

regards,
dan carpenter
