Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 830394B0883
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Feb 2022 09:36:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E12661816;
	Thu, 10 Feb 2022 09:35:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E12661816
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644482179;
	bh=iu21i+Hwelrxz8O+WSxuruIVUVp8pjnFRADepWQzLwE=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=JKagWzOK/G3dywuLDPE9O3Oz+JubU6z3OM8PY5o3sj2L/ZGb2XhFAMw5rySGS7X6o
	 Mp56yGQjq0CZeU5omcx7uZzVwMmj/nMymj/dikwp6dlRGUecVvDFv5gT1IGnmvGKei
	 4DUUkBH3+PdXYJ4DcfyMTnw35rZofNv0Varn4Lgo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B593FF80302;
	Thu, 10 Feb 2022 09:35:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 60D22F8028B; Thu, 10 Feb 2022 09:35:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4CBB7F80054
 for <alsa-devel@alsa-project.org>; Thu, 10 Feb 2022 09:35:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4CBB7F80054
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com
 header.b="KYbLcQlJ"; 
 dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com
 header.i=@oracle.onmicrosoft.com header.b="oA/O24tu"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21A57OGO013346; 
 Thu, 10 Feb 2022 08:34:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=SN9U+vUpN4jCJ46G5wYBNdRK/OaEtoO/nrHQl/wXvbs=;
 b=KYbLcQlJzlAcztpOIsoLc7x4BPlJWS5KWO2SpNan2SREsdE+vfemmFi7a107fs7rjbvk
 ZsApBGWA0rolh2d2wNjSO7Hdd78yhPJ2VvcKeR/Ta+jZfUC9wfYu1B0BTdEIP1FET/7h
 WXhfxU78WBmVObTuHZRh6Tion2MniOfyJNGsrVgBKYmETcK/+DxBlO82NJEtW7v8V0uu
 H/V9iZQKc3SMvELqJ11bdwv2Mm5E7pxphFuHjCdJM+AhQSGsdbpFU4/5Vb1yu4nOvd8d
 PUT4/hgiuAoVZLO2IWImy8V75sA7dZdZg+qdAj+ddQi/J6E0iV4fRIo+1mwfE9jJVQN7 Mw== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3e368u0cmq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 10 Feb 2022 08:34:58 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 21A8Fs5K031505;
 Thu, 10 Feb 2022 08:34:56 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2173.outbound.protection.outlook.com [104.47.59.173])
 by userp3030.oracle.com with ESMTP id 3e1ec4bgx4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 10 Feb 2022 08:34:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b5m+nzjZQw8cUUHD5Q4iO3OWK4tusvHmzMMGBwwR3ikDK7pCq8vx75+n3WgAEq7DxfPyjkzJMGp/7KCohrxCxDC9BJA+Aw1UgAVpnJWLud6OnrdJ+ZzOxW7X/rjKFanivkbDbPbItR8l2PQ34DMEC15oE1KsPZvSnMhoKA3RrNkI7gIhLeIU7zRMq9Cn03dCKikkaA3zKIyBYwpZfRke4DdEuVYS6k1DTIYvj4rrDiY/iqGv5PR4lLSqAmLaJsD8YGsA633T1/XGODmnEyCXOWaczngDsdbv2q4QBhtarX9wWiWHoCUipC/C+Bdnk1A30y/yBNrGjAGwIzER7GEnYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SN9U+vUpN4jCJ46G5wYBNdRK/OaEtoO/nrHQl/wXvbs=;
 b=ionkfC1/6Jmuf+I1AIe/D0pOSGOYjNx/+il4HocfGc0Qol5waQGJm6HUQUTFik+yf9rcPIImlqZVqBRug7J85jwwuRgMkHAo8P+AEL+DkTNDGNYpXw1JwzCzjRvwZcK9sbver6sJRsYOmkqARuhUiNxdn2ZCvJgoptPdzDux5Nm2VrZ494SSy/vEGVffbSKvwUiFFbJ0dtreVxpX11Zp6prDTOtr09uAq1loYUrsFXU/3BQdN+70oHlNTdBMcwXwsQOojTq6uZXR92hvwnKpm2dUAd/brBB+8oD4Rnia6m0DoxQQiltPtijStVzDix6kXxou634zRbX6wrhJKEHz7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SN9U+vUpN4jCJ46G5wYBNdRK/OaEtoO/nrHQl/wXvbs=;
 b=oA/O24tuFEyw8LuxN64KIKh8n5IyBNOfaNTZLByu28mBqUnNBBikOs2oKiAj80qkytTuB+6VXhq22VLxZLrKWkADyauGFm0RJiNvJlspGTq981ZZbdf+ASbCxOR58Fekny9Jt5QCx4odO/tbIyIrLAXRv3BebR2NZq5j8I/MQ/A=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by CY4PR1001MB2312.namprd10.prod.outlook.com
 (2603:10b6:910:49::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11; Thu, 10 Feb
 2022 08:34:55 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::e5a5:8f49:7ec4:b7b8]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::e5a5:8f49:7ec4:b7b8%5]) with mapi id 15.20.4951.018; Thu, 10 Feb 2022
 08:34:54 +0000
Date: Thu, 10 Feb 2022 11:34:44 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: daniel.baluta@nxp.com
Subject: [bug report] ASoC: SOF: compr: Add compress ops implementation
Message-ID: <20220210083444.GA17969@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0013.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:16::23) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 70bc6b51-3926-4e86-f8e1-08d9ec703668
X-MS-TrafficTypeDiagnostic: CY4PR1001MB2312:EE_
X-Microsoft-Antispam-PRVS: <CY4PR1001MB2312ED42452F6935475988728E2F9@CY4PR1001MB2312.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jzqGylfcwQXBRFx46tFQqZiklSA6HvGYUQotpFsTohbdfoc0sZNuBYjSY+Hm5Y19MBTqDcdUxj6Y23uoFe6Zqh7cbWzt1htw+mxiCvYCFdvXlT6hypgdXiG1v51QsSDGvkEkR8wX11s5B2kBN6atxlVw1lQjXmNKhftNuNC4G6l5gwg5kfsiOPH7MFPl8yjBYXAHv3km5I0L6KPNKAvm0BZW7pJeg/BgTvdO6wuHkdlLOMMyQTUD9vIYPQpiwu0QxAXI4tMMoMuIde2+tg0jN3lT4pJTR8gWua1an37p0LnMA4vucP3o2PD4bE0E25oWjhZ2rlV4a9fuA4+cyGRggWP1L7I+OPI7XsB2bnfAqEonslF+fK7owgQAKCmhI4veY4P1jJqDtrzSAEfGy8uN3Feg1Ah72qTaoSBN6MvaEqAgCYj0JN86cxhrIh55AUQsMpToMemtJWFH7glpLrR2Wqn/wqQHIKRyB2cxnQpH7Oza0hYv71uUTbf+CFRf5qRNyHtcXKOQO9uMrRwQ9/iFFpxqXFLFuIVPnWNmT+nIc/5c1aJyS6viOhT1LKo8vyD6zR6z7d13HkJhsLSnkFO4reBYQ5VE8R9mbaZqPyCRMHlG3pqnQgPDhFAYSE6YsZhlW5LuwEyG76Zl7xjGsW+PhzqeT62WEO2g7V22875tgP0y6eyiOOILcMv+yzJ/rN3R7y2RdBip41Lc16457fHXAw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(7916004)(366004)(186003)(508600001)(1076003)(6512007)(26005)(6486002)(9686003)(52116002)(6506007)(86362001)(6666004)(83380400001)(8676002)(4326008)(66476007)(66556008)(66946007)(38100700002)(38350700002)(33716001)(33656002)(316002)(6916009)(2906002)(44832011)(4744005)(8936002)(5660300002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EsghmMwE1RuPAxP+/QN9nq5stg/V8QRFRse6igFPIraVBm+VqzDpCmmcqY7b?=
 =?us-ascii?Q?wldkV9z7wQEWOSUzlX/a1Xkwr1g2D+5JcK7GxDCeY40LW5sg44sL5Oy6gTS2?=
 =?us-ascii?Q?pG2dZ8nwppieKyOzWneb/YK1ji5YnNYYDKd8zbavHA+2CVZ13uhCKsNW00UP?=
 =?us-ascii?Q?SX4leHrtM3YsWM96yrqLAqEn+dr+B81xygEpOE8ZnAC/ImJ6B7OesMb3Zbzr?=
 =?us-ascii?Q?BsDAzT3BwR1PC0ydV9ADAtQyWSkJBx1JmmuwOSygEhjm3XS0V4cK/dZnrCFP?=
 =?us-ascii?Q?Sow0h982q4AtPVbsJcVfp0ICpdwk8XsPmUX5BWmYI4qHdComz+wZNHHVrESu?=
 =?us-ascii?Q?YXuJFzDqhV51m0NVprAWhEkceZhauxnkZRMwByvhAgjvV0IDpRkiu81YXrms?=
 =?us-ascii?Q?YbLG9UkDiB0y7RKTaL1/N0j2tMS96tTfw/ZT5g92wRWKlLgQ3qNl066w7PPz?=
 =?us-ascii?Q?G5WBBdVq4FfXVYg906slV2vc1DUNbrnWbkJAlLwhi8wIHAIM+oaAz/h3YwJD?=
 =?us-ascii?Q?eGDtcAjbLtbsttKhReR9FpU47++EjWYtNTmVxYEhr+UjrhmLkDFQEdt63XOq?=
 =?us-ascii?Q?3DAZfM13yDIeQcgtt4Qv3hQ0PMXGlMEZhe+GejsGpj6cwuSZloOr26xFIaUC?=
 =?us-ascii?Q?egA5Yf8Grog2KJxdAVQueqOVK1pd/HAOpUeNY/Lh7Hyhf5cOyqH+alM8ClDN?=
 =?us-ascii?Q?4/mq0NtbQgXvGcTHTiY2MROkH1JsR1+PYkLn+7UgZVmVHaa82JQjk3UrFAO9?=
 =?us-ascii?Q?KN6BaXtsb6iarfsQV94Tus7UcK40U8bCdEHJKKhf8nF/EmWn8P6M4qBggOyG?=
 =?us-ascii?Q?bMs6Y3g3L/3HBfdAxSp7vHktH5s+FO0sHOI83VW6bfU/6rtoKdk+vihbKqYy?=
 =?us-ascii?Q?bHTMrvgSlRg3w9WDFO5C/YJWsWB/B79JSbmtZZ5Eh8aExCxasod1J32Y99U6?=
 =?us-ascii?Q?YacPotILkRftFT+p6ljFl9eiC85reuAeG1HJ8NU1oq8U0qasWU/fWqo2yebo?=
 =?us-ascii?Q?khaX4fB7TikfoaouEdwj6bRzYEsveKx0oyBdbaV1SBkmy7Fu8F2zDYG+OOMh?=
 =?us-ascii?Q?j7zpmIjDii3flKxIoHFIXlWjufsLxSNIGXH73dogu3P4pOrZW7Afys2UTiV5?=
 =?us-ascii?Q?eLJrYt3MnFelReVr+7/1geaY4MI9iYW2rKQZxGJwpq7laW+8xGPPbzSvlBw5?=
 =?us-ascii?Q?nYTWgEoYFZjj3duBDpRxg/CUZctkECs2OhrgTipgQAP237MVpxLm5rRsiLH+?=
 =?us-ascii?Q?HoElbq6+SkLEJC9LcPC2JEMSISRM2ZKR+3uhKppfEHzKIu1cYcbpUXKYnmnu?=
 =?us-ascii?Q?Zb8CHJueWg9B/gnat8KYFHnMqjM0CJiEHCiOIDv63olDD12P2DRCKqFAQkYb?=
 =?us-ascii?Q?DIHKKKxcs1wgR3tgQQRE54POy3SAx3mPC6jceRpsBjq6rghUX6MqfsKR399d?=
 =?us-ascii?Q?n++oV9RXo8KGYKXjXUcMFOYAHgLK8mgqvbXSSSnfYIPPIku6f5XPxEIdAtoA?=
 =?us-ascii?Q?wfmDlqHfN1NH7nsLjKGjrCFPZtJ6+haSCAP0wgMilFjJcEE8SHz59wuyCPaR?=
 =?us-ascii?Q?Xu2zZZ983+JjP2r8Ycz2iTHLSnsEPjSZyYFf4xt+UMx4Ed0wN1nol0c+TIMR?=
 =?us-ascii?Q?YdxEWL674QB/0AH6YUvI64/OX2P2ZM6ps8PJ/VgdK5lJDlCaqhcRvkFfQl2m?=
 =?us-ascii?Q?En7vwQ=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70bc6b51-3926-4e86-f8e1-08d9ec703668
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2022 08:34:54.4070 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0o7Y8Umb5rt/xhA6yxmiGEPRAqueCgvO4FvgyI8T8SogtXyPuDnOoPMdu+6zdef98la3uYlQpenlRhJjZ6Ai6T2eeYE66M76j8vavmbm90M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1001MB2312
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10253
 signatures=673431
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 bulkscore=0 suspectscore=0
 mlxlogscore=875 mlxscore=0 adultscore=0 malwarescore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202100044
X-Proofpoint-ORIG-GUID: 2CNL5hgtKayII50b7BoFT9zXBwDesnn9
X-Proofpoint-GUID: 2CNL5hgtKayII50b7BoFT9zXBwDesnn9
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

Hello Daniel Baluta,

This is a semi-automatic email about new static checker warnings.

The patch 6324cf901e14: "ASoC: SOF: compr: Add compress ops 
implementation" from Jan 20, 2022, leads to the following Smatch 
complaint:

    sound/soc/sof/compress.c:54 snd_sof_compr_fragment_elapsed()
    warn: variable dereferenced before check 'cstream' (see line 48)

sound/soc/sof/compress.c
    47	{
    48		struct snd_soc_pcm_runtime *rtd = cstream->private_data;
    49		struct snd_compr_runtime *crtd = cstream->runtime;
                                                 ^^^^^^^^^^^^^^^^
The patch adds a new dereference

    50		struct snd_soc_component *component;
    51		struct snd_compr_tstamp *tstamp;
    52		struct snd_sof_pcm *spcm;
    53	
    54		if (!cstream)
                    ^^^^^^^^
The old code assumed "cstream" could be NULL

    55			return;
    56	

regards,
dan carpenter
