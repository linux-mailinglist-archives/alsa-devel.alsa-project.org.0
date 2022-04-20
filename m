Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 46058508287
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Apr 2022 09:46:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C4C331915;
	Wed, 20 Apr 2022 09:45:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C4C331915
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650440778;
	bh=2DCRVx6J1fLP2wPdHQF1t+GB3nPIEe1PyB5YeAUWygU=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=KjRU0FM4V1Bgros/Ws5WQLwIYddb0DCDZvyGy4BI0XF0HUWu4Tox5ikEibLi66P5O
	 U/xCjAzu0BeGGMbvstwOVzuQOaWbp/A8eeLdTCzzduf/Ts9VzYzkPJeifbqOvvsHG/
	 47sibM9U8aLm7yAThCbu8ZNXee7nJ1Pqi+8GXYmQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3F018F800F8;
	Wed, 20 Apr 2022 09:45:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EF468F80125; Wed, 20 Apr 2022 09:45:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 474AFF8010B
 for <alsa-devel@alsa-project.org>; Wed, 20 Apr 2022 09:45:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 474AFF8010B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com
 header.b="PYg9J1Fo"; 
 dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com
 header.i=@oracle.onmicrosoft.com header.b="b8L4f1Yu"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 23K4mmGW024809; 
 Wed, 20 Apr 2022 07:45:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=9iBAvfkft2hkqzc+TJkYfdNNgP2G3BW7A+KBs1S1bq8=;
 b=PYg9J1FoasBfXhVUoebuQO2/sbFIWacobvGfj9HphfqH66X+gkClMsPXQv07ytrUYYjE
 EeNF+Eb9YV37nWE4x841UONakrRiaxt0TfNNyGChiqYNYeQp4xJEhoHDp4Bz/ei3pMsI
 QM0Abzzu7wTO7Zrrwffe6Gs8iFrbDE4a4+X4ZJwKEH6oE4XewaDr2DHEK5e+uLGtW3bX
 2tFpXzoDtiHzUX1BhKKOyqI7W/hBVOamec6VTLUQ6upq6T/dTwZc/Lt34k0wyvuQGRsb
 mmRfBuAGOZiqrtFhYLNcWzlqJeIrZ/2TNL8/XRsBMucvkI1hxKH5E2HKdqBJJ6I8G82E eg== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com with ESMTP id 3ffnp9g26h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 20 Apr 2022 07:45:10 +0000
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 23K7g6Hg001377; Wed, 20 Apr 2022 07:45:08 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2100.outbound.protection.outlook.com [104.47.58.100])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3ffm890bmp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 20 Apr 2022 07:45:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R9Sszwm3saRH/Xg/AEWZMzhl64PH6MVkKlsc2yl521nvhlnBhczr0ehtua22mYT4qaFcmDvxe+44cpH1QQuTGuoefAv6QUhjhqwtjUClI+5gPjYUHF2/PHzUncUHzG+upVOvoEjA036r5U67iif54iZrEg6KY64CqdHDfOBNlDGTElPoz4Ju6+6YUbgG0gFCLvc5DUmxfTi5peep/A8G1/1jPZboLD0o9q3PIylUA25X9988yYu9prd6tjPObn/MQixfgYesavbUjlUSpyt2GpyL5YpEZV5jZD0Ah/jrG9Y3AzscPcAurXfSfPmxF60nEQeMeI0KDx+bQAb7XZ0xsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9iBAvfkft2hkqzc+TJkYfdNNgP2G3BW7A+KBs1S1bq8=;
 b=AQqG4eZ21qg/cfCBBvuj+3BJQ9w15SdbqOvV++P0x4ohRl60BPK8KYzEvgvTwjlHduuEelRyiQzvMhA6q1akhaThHgAV/nmizM8n1CTGn33M/0sKdPnEMGFVatekadulA1z1rpqjfXQhZcE9Z+xEOrfvXT1rS9y7kqfy9WJLNqawU4CmM2TrYCCTnYsXiWTfnsljrL/Lnd/virgnXsXl7gC3e036l6wXVZuIvRtNN7jQq5ptZC8Fdacu42ARxz1f7AjV8Bu79oS5jyjL34pmAIw40gwWaW73mMsiaSpDGJZLScv+0pIQi5qrqnMSMLFyKb5ae68KPX1o57GLdhES/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9iBAvfkft2hkqzc+TJkYfdNNgP2G3BW7A+KBs1S1bq8=;
 b=b8L4f1Yu4oiX0SB/aq9cxlebWJQrvJSJQrvwMBUjXTDSttV50t2kxtfRH71ndFIY+S7Ism4DRE79WYO+0xE0TyT5+LmDrN9PIolRvHyD2IOvENwTCKIfopbfAGnNA0uuZpPUSIQsqoXqSrBSvnIkaeMsEZC3f7jrXkoSIjU74go=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by CY4PR10MB1975.namprd10.prod.outlook.com
 (2603:10b6:903:124::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Wed, 20 Apr
 2022 07:45:07 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::b5d5:7b39:ca2d:1b87]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::b5d5:7b39:ca2d:1b87%5]) with mapi id 15.20.5164.025; Wed, 20 Apr 2022
 07:45:07 +0000
Date: Wed, 20 Apr 2022 10:44:58 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: tiwai@suse.de
Subject: [bug report] ALSA: memalloc: Add fallback SG-buffer allocations for
 x86
Message-ID: <20220420074458.GA32681@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0144.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:40::23) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a93e096a-2023-48b4-bfac-08da22a1b029
X-MS-TrafficTypeDiagnostic: CY4PR10MB1975:EE_
X-Microsoft-Antispam-PRVS: <CY4PR10MB19753BEBE8CBA75DD297800E8EF59@CY4PR10MB1975.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rsYzQS8auJXUsN93HymF5ZQGPR2m+bpuLkVO/F6kjIrfBFmwHwJkQn+kv+G6UsThyeTPr4QOewg3/nJO4pu4j+/PoGTUkitDkYBuB939zaKaJ+mPgOf66vmiFDG5DA0hzDbCmhyLtnkdIkg2nrAjSRrlFApd8U2lj4QC3DaDz/opSWA/gtfUA56Tt70mckoSULEznyojI7fUd8OoJPFDsCXSVegaoQwKIVLcxyrrRyEXfrE6Hh6JtqhIRc0EZeNJYPh229HI4stZN6s49yUjiFNuRgTUKq0kV7ppKAfMFxdeoxML37F3K9olvjYfqHfOzzbkd+2kOUd1NUCvns5FaVK/vbcb5QeDg5mlqiVVM05mGVvhaMkW9dwtRygj2e+GDGHccmyObViuh04DKAkh6sdh8MJP0EcWnGXCKceKHHYxK4y6HsAdrCEQbI60YBW5F6Z1Hcx4WlqIj+6jpZwP5d7VwzD4N6OULCkMh7k9YIuSytBLUys8kPaZLuvXpmT5f1yAbtlDaDi+lUxNe82uZ213Y2vO7gQBAcx1fzGD5CuQsHbbgJOlU91JoFsvrgds2HZzM3kY+eRE0h/Sf3jgRx9PHRQGedIAQ+WM9P+VVslH3fULDCdq/vgZl8YzML6WVi+G14Sp8/l9rWWN6ho3Tx3Uoc5/BuOd/wM9SyeKTrT1AErU9bXRT9lYM5LUj0tHK9bzhxGC/wB3WbRgX14ZHg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(7916004)(366004)(86362001)(4326008)(186003)(2906002)(6486002)(44832011)(508600001)(6506007)(83380400001)(6666004)(9686003)(26005)(6512007)(52116002)(66476007)(66946007)(66556008)(1076003)(8936002)(316002)(5660300002)(8676002)(38350700002)(38100700002)(33716001)(33656002)(6916009);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WlWvRm6QjjN7xn04EEMmRBcSVWa01x3LzzvFygB1bzCZHTK8QEeyIYOmyy+z?=
 =?us-ascii?Q?U2i6wlVWZwoU4f/fMyclFxoW+NjsjMSTpfWGkmEu2OUofvWe3YEnHI2ZNp7Z?=
 =?us-ascii?Q?yzXi0F+AekiUZjlwyVD72EgDMtni0YTyq1BZPRmJX+PO9uOgBNt8H/VskP0W?=
 =?us-ascii?Q?IlS9DsBIfeB8u/00yCKy9ycKcodaasacn+pDWrpcUDw8Tb6Q19Jnx5dx9PZq?=
 =?us-ascii?Q?etuOjOlnP6/4vdXib/9w4BTk1dd7ogCIUmFyHhP7YuIEBWoqjJpaYGHrVOVZ?=
 =?us-ascii?Q?ri9rZ7uFveQm/Tw2GE7V0i0N4yfKY4TMvY1I5LXmH6NIbNRCbcMZxoSzO15y?=
 =?us-ascii?Q?ThiWE3WBL9Y9F7hmvWkwNu9iPHC6Lm5lz7GGX+SZUtr8hcZs1AV/hcu8qjos?=
 =?us-ascii?Q?iIyZdVOC9YVfCF3tc1FJtJosiV0ytwty5mbw9dYS/UUnFaOm6VSeEM/V2fQk?=
 =?us-ascii?Q?B0HurtUYQv0crWxi/YzzrtPNDUc6I6ZtLFRLbioZEzfM5ZK0eDzHjiGO4pmF?=
 =?us-ascii?Q?fzgxZRf9LKFWj5VM7TRvm5jrU1cZRPladzVbsFoSevoVOhIZCyqpu04zpENZ?=
 =?us-ascii?Q?jN+1ODwwa2qQ584WxwFioMtI9pnCwIdm/CMNeQb/dD8ys/sZLf35titmFJ6T?=
 =?us-ascii?Q?t2mz2edb0RAPhSwhGRyH5PQp/zsynFQf9LSDAktef857aMh2mi687tuyUmuN?=
 =?us-ascii?Q?qPCR3kR5JqK5/AcvFLJHoYI7pl9KEUJmrEUiUqNGvP2VM7L3mQOyCBMtsLBa?=
 =?us-ascii?Q?0bVJx5aXuqYU9rH6kc18idytMUuUwNFq4uRZKdqKuSRBP4Ib07waZ8TuwaQh?=
 =?us-ascii?Q?hbb0+4mvyHPFVlcOplsdbJbpb96jlVd2k+YF7BAkv8KtVAJqJ+k6s+Pxkirv?=
 =?us-ascii?Q?8j3kgtXMP9ZsfPYfZPdcDPHlc4Xvsw79Sxtb2+/0eo3Rqaev2gZ+hvqIqEix?=
 =?us-ascii?Q?pXlKTW1Cv/BJZd/AXZwAY/OJIhXIm4VntRfn88tHWDbARtUjfxed3FkL93GZ?=
 =?us-ascii?Q?KPPclD1PiyZXQBh5P2iy2nczJv5GwEOKThyMvt4xEHo/YcB+uq/dotBgUiLw?=
 =?us-ascii?Q?oFjaSGTQdWRWVsB0QNssTkhvX19MYcOFNwAWcRv3COEmzuwb37AaRATI0u5v?=
 =?us-ascii?Q?/ZqhbR7VPZyBhUNU4GNv+2IfcgieuSmk9yPcRoc2n3DdyT4brTKuB/AsYzUD?=
 =?us-ascii?Q?10iMhC0pfUUnBC7+qr49vXBkoVnUwdg6rQwCiY3SjbWGuKyoHAk9wFVFtjIX?=
 =?us-ascii?Q?L90QjEvHLtjifGSUUV8sZf/4OP97jIgHiqKsqj+v3h1O7gcZrxfIPZ3+/buE?=
 =?us-ascii?Q?dh1bS8EyPRPxUt6ILiDpY703O654GrCpEFPMu0x9Jtaa8l3k84SZ3GCLGnKX?=
 =?us-ascii?Q?hTRfWP8pbiLX4qkXIXWGdZSIAyw/Nfxzxw0b/3D8b+JDe/zQVxysALBkKVSl?=
 =?us-ascii?Q?JZBtFcrld6hTlfrxWQthgDsoTiM0DrU8FB7irL5HPSwYfWx2D4lxiHnq+Kff?=
 =?us-ascii?Q?0gXdOscfy2scSNkvuGTYPJRPSb//mlBLChmUM4aNSIOrYThcNLc155az5Sxa?=
 =?us-ascii?Q?Rt/uMW3UUeAg9GZ7HJm4D5MaHtG4hkItIKd+DZEkjD+0ZRGZN1aV+dJPPfV0?=
 =?us-ascii?Q?Z3d+kHDnQtOE4v3khfbxw3oG+tJFdt31dpUtcBR9FmtJ5Ebz/LnpRGUPIx+/?=
 =?us-ascii?Q?jWVOJi2WhuC+udfuZDWXqsj8Xf+xUmcM8aEoRqKFCNWAe/WDh7NXnOfaeUYd?=
 =?us-ascii?Q?YjncQ75qLrw2l82UWqVpkJKXxjpXdWI=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a93e096a-2023-48b4-bfac-08da22a1b029
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2022 07:45:06.9763 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3ODGv4pw407ovFMUFQzK23h/RbmJYIXF00orCr7cDQSdJfr1oYl2sEA0bnkiTN7ojl8WKu41PjdbNAihABhJe+cmtxQGAx8fw2RRbG8BuHk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR10MB1975
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486, 18.0.858
 definitions=2022-04-19_08:2022-04-15,
 2022-04-19 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 malwarescore=0 mlxscore=0
 adultscore=0 mlxlogscore=705 suspectscore=0 spamscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2204200046
X-Proofpoint-ORIG-GUID: Yt7wo2AbLb1kJXwbWVgKROctpq_2Bpwe
X-Proofpoint-GUID: Yt7wo2AbLb1kJXwbWVgKROctpq_2Bpwe
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

Hello Takashi Iwai,

The patch 925ca893b4a6: "ALSA: memalloc: Add fallback SG-buffer
allocations for x86" from Apr 13, 2022, leads to the following Smatch
static checker warning:

	sound/core/memalloc.c:732 snd_dma_sg_fallback_alloc()
	error: 'p' came from dma_alloc_coherent() so we can't do virt_to_phys()

sound/core/memalloc.c
    708 static void *snd_dma_sg_fallback_alloc(struct snd_dma_buffer *dmab, size_t size)
    709 {
    710         struct snd_dma_sg_fallback *sgbuf;
    711         struct page **pages;
    712         size_t i, count;
    713         void *p;
    714 
    715         sgbuf = kzalloc(sizeof(*sgbuf), GFP_KERNEL);
    716         if (!sgbuf)
    717                 return NULL;
    718         count = PAGE_ALIGN(size) >> PAGE_SHIFT;
    719         pages = kvcalloc(count, sizeof(*pages), GFP_KERNEL);
    720         if (!pages)
    721                 goto error;
    722         sgbuf->pages = pages;
    723         sgbuf->addrs = kvcalloc(count, sizeof(*sgbuf->addrs), GFP_KERNEL);
    724         if (!sgbuf->addrs)
    725                 goto error;
    726 
    727         for (i = 0; i < count; sgbuf->count++, i++) {
    728                 p = dma_alloc_coherent(dmab->dev.dev, PAGE_SIZE,
    729                                        &sgbuf->addrs[i], DEFAULT_GFP);
    730                 if (!p)
    731                         goto error;
--> 732                 sgbuf->pages[i] = virt_to_page(p);

The warning is a bit useless.  It's complaining about __phys_addr()
and not virt_to_phys().  I don't really understand the rules here, it
might be legal in certain contexts.

    733         }
    734 
    735         if (dmab->dev.type == SNDRV_DMA_TYPE_DEV_WC_SG_FALLBACK)
    736                 set_pages_array_wc(pages, count);
    737         p = vmap(pages, count, VM_MAP, PAGE_KERNEL);
    738         if (!p)
    739                 goto error;
    740         dmab->private_data = sgbuf;
    741         return p;
    742 

regards,
dan carpenter
