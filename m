Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B1E6D4D4997
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Mar 2022 15:50:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 519A616F0;
	Thu, 10 Mar 2022 15:49:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 519A616F0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646923845;
	bh=V0Tqmiyb74aQaOUIorrWo0f2ta/lo0P9HR4Od7R6ywQ=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=f2lgr3C9DFOg9kE2YuCmvKdwosy5xQ8ZbpZARRE9xebBE1v7q5/1aVUoejAMILpxN
	 9NIyWknXFnjQzcIIHxjMBVmgeSrUi9CG4ZXc9aQDdiLh3pdOLCQ0YVfPiGBO3s0EbM
	 WN7aNM2aHRVTB0wwtrRGrkPrPKPYS+SyzEZYr+Bo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AE32EF800D2;
	Thu, 10 Mar 2022 15:49:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7F950F80137; Thu, 10 Mar 2022 15:49:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 39B19F8012C
 for <alsa-devel@alsa-project.org>; Thu, 10 Mar 2022 15:49:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 39B19F8012C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com
 header.b="Ox+loCg6"; 
 dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com
 header.i=@oracle.onmicrosoft.com header.b="PopIVrPr"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22ADdbta028201; 
 Thu, 10 Mar 2022 14:49:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=NYaf7Y+YkUKZ02hJWltgRHo0I0khpqHsSRU27nwIZcI=;
 b=Ox+loCg6Be20hg7oCiJSAbRIPbAl4yOevxNiTl14jWkITJ51TI1gk0qiJU/c9ELrhn+I
 GFjA+z5xnGIOlBBgI1h3Xz1tT5JNo10UO/0cVRoJn/1eIxJP82qFUUnhI4/RiDHNJis5
 6irzw9OZQF77Y7vNH6nYvn6gLWS0Vr4AMPE1VIMs/CL2l7219ji5886vH/8gGDwyey8Q
 mHKughwM+msq2rrR8QTy6m0kGUfseXG5VkhXgHmMHpn/8x0z9IpiaHsC9hKozL47/NVq
 RKFU+t4MJpQhEwe7vK0g8DUbegZ8umPQxDzxpD05yG98mktJn+PlvLbY4mqldLGiVGmt YQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3ekxf0wewr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 10 Mar 2022 14:49:28 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 22AEkTvC187238;
 Thu, 10 Mar 2022 14:49:27 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2104.outbound.protection.outlook.com [104.47.58.104])
 by userp3030.oracle.com with ESMTP id 3ekvyws40y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 10 Mar 2022 14:49:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dhxHsw2e1N+iW1Xirj/oktwVpWsNqbc6H1PCVHo8KQQ3qVdJ6aJuYej+uPVwE4pOg1QuAwsDtDInvNJuZ/6T9lG1TkwHKKpueYSvyLm9+eds0g1d5VaYf4nNl5+Hs9HjNfwZY+VOaESRJbR9Hd6UEVlEpNt2goP2QZZkZ3/QbQmUHY7OvKTkRpyzXkX3mjnp+VxsmXtp2gPaVhCvkOwkAOcdCC0qlQTzStUdFwrzbR8LaZG1eZlPsif+EscO3qvOedDEPy81bu4CRwnKcUUAU0D2NInfgnCNcyV6yb2iddwgBgtvx9utAmKnVO6lMbRHNemd6bOqMSU0JijCPRbiZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NYaf7Y+YkUKZ02hJWltgRHo0I0khpqHsSRU27nwIZcI=;
 b=TNKiSPOicmwYB4loQk8tq/sRn1+8g52PHZqfFufWHmVP3MlikFlV8nO3ApWHUDlcjRgcGqZOYQKsEUwO76XMLdkLoJ+fxL60zrFQMsnfU+kPKw9xSr+xag+qRnBQktZG93KJNq8bxhXqE7gfQCNrSI/y/KOOjpZQN/mLK/1jVLctQ+6bhPn8hhmb0I6sZWNZdyCeO1eitk5cTgzOvvDK8oTGT0zimlqYsyZrq6G5OHG3543igRMHdSnh0zUcNeMayF8CGxTfrRQhmqaGbpAxTvW6ky3G8jMUs2NGfIZhusIfg9CAOgmPDFvTHSTHdJj3V9ucnc1XWTRtJuIoAwn4yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NYaf7Y+YkUKZ02hJWltgRHo0I0khpqHsSRU27nwIZcI=;
 b=PopIVrPrhuO59i8hdiYB/jK7VbDoNJIRRZoKlDH5ydQxujf2BwLuKyAAurxG7zKchYJeJv1UyOxZ+eoYp7u7wR2hsyuoODt78fnDquJoe+2JQWbcPi9Few553eLcXG5W+g+oyu2Y7oZ5siJSSzoPOb54FVsUES6ogQkCoVpjPqM=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by SN4PR10MB5800.namprd10.prod.outlook.com
 (2603:10b6:806:20f::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Thu, 10 Mar
 2022 14:49:24 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::2c3d:92b5:42b3:c1c5]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::2c3d:92b5:42b3:c1c5%4]) with mapi id 15.20.5061.022; Thu, 10 Mar 2022
 14:49:24 +0000
Date: Thu, 10 Mar 2022 17:49:15 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: codrin.ciubotariu@microchip.com
Subject: [bug report] ASoC: atmel: mchp-pdmc: add PDMC driver
Message-ID: <20220310144915.GA7354@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0165.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:45::18) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a8e850d2-4a74-4a26-8fa5-08da02a52b5b
X-MS-TrafficTypeDiagnostic: SN4PR10MB5800:EE_
X-Microsoft-Antispam-PRVS: <SN4PR10MB5800B13E7CA3D927EB6DF8248E0B9@SN4PR10MB5800.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LIPyb+bgEaks3Rvy7lJ1g8BDmaSawJ72FLgXvRW/q6hXPi/0ZhjUVfxE04qwjFvk3xwTm/+zIMdNcDsBHMlCM3ZBgZPCdZyIyyig21BQ+3p1ln6n39fxiifZyTTLJCd6YoIEzqJbzl154gb49/XUccy9dYo64BbifffjcXnZCW6MtqA/kt0BsjNq2aMvxPo3Y823sthfL7DqdJkgXvkdFIW3m7zWq095ACzPpdh8Oii7yrdpvUSCk7MFniX8x1rztDXcHsIfTno7dQA6EUcZ1wisbjnppbePuKG2dPRMLvNDEhvHbk07IUqTn5Wya+pVKer5j1DYxljj2ScpK7b/d8gVynlFu63rCYCAnHtc5/R7BJkWDa8+w0e2g3hmRTgS80FNdv8/YqTxEO/3ZopANkRfP7d1xiq/urtdpUt1DGBsYMhZli6LQnZK6NHpg1UvGC8pYet0irt7sg92oEASMpEnuQx4QauyIrO7GMoSqHH1h/CJOxIPvR7q4WAutp7UBj6XpiTSO9ptJ0yQ+rrI65s/NujtI+TFwbYjDI96aqynAPWnz4eDsCG5PJBTYR3FY0LFDpSouOKfS54wHAFCh+FSrWZ5WcBa2eKaboz2HSCs21DKsNE1GbDdtVJcvLuCB7maQBWHjQwDD7edQp3pcj9MNRREXAd+dj9HLpHAtyd6WVSkkxrir+FrW0fVN5TpC0qzHTqZk1MrWMn0qH9eyA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(7916004)(366004)(44832011)(6916009)(5660300002)(316002)(508600001)(8936002)(33716001)(8676002)(1076003)(9686003)(6512007)(66476007)(66946007)(83380400001)(2906002)(66556008)(86362001)(6506007)(4744005)(52116002)(33656002)(38350700002)(186003)(26005)(38100700002)(6666004)(4326008)(6486002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EeiBlhsirKSPlrjYfaibADYpY+AHptB6SHB7gFZUHmZ0Z0XgSeC42E7gETi4?=
 =?us-ascii?Q?/r5gPNjlUR2YtKh35WKdMaBUF5EpYb0/xVRCAQ5uuHLWD2LeZ0MgcjbNvgQT?=
 =?us-ascii?Q?yMgfpDkk5Et70af7jGn7hZ51JBppajDexElU0wVxh+us3gb7x94abwU6CXzv?=
 =?us-ascii?Q?L41CD3pxEPcYX7NJQa/gSHaWiGHN1fRH5dSmD3CwOKnu4EBppfFbSV8qMQJz?=
 =?us-ascii?Q?5Ybs+sKvt6rXVYL1P5H8oJw/5nvAbyK1CG7LZ4G37B/ZjL9VNbc2HKJDotqx?=
 =?us-ascii?Q?Oa57V3czid9ELcvBYAKRChGbgOihVabNkNIOiD1XLkoQ0SqBgt+QHHVcFooa?=
 =?us-ascii?Q?LrSXh4vn9cDLsU2J0j5ITm6ZCWjCO29kYprc9nJpPaIvCX9Gzh3U8RrKgGGt?=
 =?us-ascii?Q?UpbGkKSm2CqwwbGXDW14dSDnJU6tLjUzeaCtX0fRK6La0vyppi2xUkdoIzit?=
 =?us-ascii?Q?Mlp4uLU5iGhWYUjvNd28xHlhF3H9Q6UKyHNKsRoMISWbi+EPYtaSPI2BoNax?=
 =?us-ascii?Q?WTySSwWNqPzeK8BCwByXeeXJbENgtZJElOp1iWFhRGjEBNlIDEeqNz2zNcJM?=
 =?us-ascii?Q?+gVo0yAgltQsHoV3qH45sM8k6JqQSdMW+LgoLVienKk96FSsDYXEKH4smtPy?=
 =?us-ascii?Q?poGxZLEOt9eyHhPF2ss6+uwGKmMhNrcq119Lb5jrH2YIrGekOuU4yvvYYoJU?=
 =?us-ascii?Q?Ws3cMpZs74MdQSV0BxgxnExqVu5WaZEdOulghKCyClq/+Fios+Q/oLUaC1nt?=
 =?us-ascii?Q?7qJply2C/UUgvkTItQ195s3x3U44lwRrFAdHt69cRSaNVxlWpOmnhoj7882c?=
 =?us-ascii?Q?Oi/D/+wIfN9woZgTddTpH23lWisOq747Q9led9GvPHt79stlIgqOesPia1hY?=
 =?us-ascii?Q?3HH58c5Qg3YisJezJ71R8uxGo7CqQaFbz0DkE6B2b/RS+moJoXiPuOIWgNhX?=
 =?us-ascii?Q?Z2x9bwsQZiNSsMOd8s8XuEZsjfrAXm7QaPUs23mLUU0Z2F2wXU7OA4lQZclw?=
 =?us-ascii?Q?mCE6yhzT6ziKnfYAs265kCDtPYUhg2jip1R5yuKlxyuNJ91Cw5FC/U6LY5Iv?=
 =?us-ascii?Q?qfQUV7GjPGPkpF5IA0QQohd6Q/fEwd8AYUrzcaFtZK+xFk13pWm+uIS+0By2?=
 =?us-ascii?Q?mW4LOrN181RZcMmpalXvI3qAdTopc4aTSv4Ei7/C38ZrPZ0jRAluSD6HuT7T?=
 =?us-ascii?Q?zGSPDJokZAjGsBtfjdOgX+52+Y/wrjD2tVa+GDPfhK+75wQJQMbx6ZfpMaeW?=
 =?us-ascii?Q?QnLCD8+EkB0r9UgaV0AAw/5aQRTTDdLFhdtREzWggK2Mg9nnFXB09lj8Ln+S?=
 =?us-ascii?Q?0sVoHBCgypm8ugjZEgu//AjzTVlDFn2GGtVLvvy0VfyJpYsQgg9gskJhXlu2?=
 =?us-ascii?Q?kKPiuf2loaWEwKUNaBPRQuwW39V+IknKxawAAEmUHEn+UUz+EePOklYzd1KI?=
 =?us-ascii?Q?MSmZeRZodGgtt0HfLAgWH+kfuiACVQgu0EIK3xGSALcN+SlNyU72pOvzD4+0?=
 =?us-ascii?Q?m7KZRT0Vv0fBHoMkBWG9AOtD5lwjHb8MEaR6ZXmUofO8q+2oPenPe+s1EmIm?=
 =?us-ascii?Q?h6Q9u4Qrvw/Dn9xf3E5RbMqHGl6rAEVuzgr08vTFb+7Ji7C/pTByurAzaQwo?=
 =?us-ascii?Q?n8sHrGjKwjp2MkAnaEicY79LKJg7Y3Wpm7rVpUJKzF3asVVPu5TRX6Z1WFjT?=
 =?us-ascii?Q?vklhcA=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8e850d2-4a74-4a26-8fa5-08da02a52b5b
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2022 14:49:24.8189 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZMlEnIG7kLwvzqgBCerssyR4RidJfGEvQwDCZXVoPoOH6MkT+467CCNx2gCa5Rev5uCwVrnOdHratVGtKLcACdvtOkS0vUi0ePUjYEczXEU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR10MB5800
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10281
 signatures=692062
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 mlxscore=0
 suspectscore=0 bulkscore=0 mlxlogscore=797 adultscore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203100080
X-Proofpoint-ORIG-GUID: jULsLu9nuWfAuTK9Ki-8N3eh_uJIamkY
X-Proofpoint-GUID: jULsLu9nuWfAuTK9Ki-8N3eh_uJIamkY
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

Hello Codrin Ciubotariu,

The patch 50291652af52: "ASoC: atmel: mchp-pdmc: add PDMC driver"
from Mar 7, 2022, leads to the following Smatch static checker
warning:

	sound/soc/atmel/mchp-pdmc.c:186 mchp_pdmc_af_put()
	warn: this array is probably non-NULL. 'uvalue->value.integer.value'

sound/soc/atmel/mchp-pdmc.c
    181 static int mchp_pdmc_af_put(struct snd_kcontrol *kcontrol,
    182                             struct snd_ctl_elem_value *uvalue)
    183 {
    184         struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
    185         struct mchp_pdmc *dd = snd_soc_component_get_drvdata(component);
--> 186         bool af = uvalue->value.integer.value ? true : false;
                          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^
value is an array, not a pointer.  It's always going to be non-NULL.

    187 
    188         if (dd->audio_filter_en == af)
    189                 return 0;
    190 
    191         dd->audio_filter_en = af;
    192 
    193         return 1;
    194 }

regards,
dan carpenter
