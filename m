Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 096A9567FC4
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Jul 2022 09:25:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 97F8F166D;
	Wed,  6 Jul 2022 09:24:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 97F8F166D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657092301;
	bh=t+fU+WZ/YaMmI+5YSTzSBzF8xpcNhxG0xVCXrBlbyRQ=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=i2s98UlIm9xsdlaTOap+arAMNZ1bGNNg5MyuWi9+UQTDxvTICONom4d7g8hvuPvBA
	 yq2R1Y1DpJW28ttao3tqY/ChHo4DEb10XcjoWpEN2z9LGazs6kKNfnOwIHsYPbEtUX
	 RqmS9XwNYHgbVDQtcjwoS1l/W3mm8pBA7j5KZRn8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E9A6BF8032B;
	Wed,  6 Jul 2022 09:24:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 461B8F8023A; Wed,  6 Jul 2022 09:23:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 86FB4F80104;
 Wed,  6 Jul 2022 09:23:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 86FB4F80104
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com
 header.b="AXc7xyGJ"; 
 dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com
 header.i=@oracle.onmicrosoft.com header.b="m4VGosz1"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 266641ca003649;
 Wed, 6 Jul 2022 07:23:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=W9ZFp5vzHEnTzklg/NCy9D1sq8XIjGptijB6OAUc2AU=;
 b=AXc7xyGJiJrU9kjuIVz8nwz97KZD13RXmL6hG4aVdp/am9uPBLiW/hJ5XuJK269cWC5t
 fGqOTnWiTuF4LJQxw6iaJEiiVgl2WgRuhHRmqk4wOVFO7P3esj99krVDHtOmjAbERSr0
 90RugRB9zPjQhLmuPyZhxUYLueHZNjE1sni6uT8Q3I+8JuJV+HLNz1D4Ku+c8vPZh487
 ucokxcU/J2XQVuAkxDcvKIhgvX8aUdRYSNpooJbH6FPKdHL2nz8y78rj44lLlicC2GeK
 aqgKMNrs6x1hCaBRUAMJdO070uTUWEULzoMHXxrIN2BXEeAggKY428ttjyaUjQGjD13j kw== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3h4uby93s0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 06 Jul 2022 07:23:49 +0000
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 2667LHDF038402; Wed, 6 Jul 2022 07:23:49 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam02lp2041.outbound.protection.outlook.com [104.47.56.41])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3h4ud5jyr8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 06 Jul 2022 07:23:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZivQ46EvMUORW2ZWycOLFw2QGqpO6NyDr3Y6/C5VgN5u6S96rULAyjkt/F6fXG1xcYluMrsodEmh0nS8p5J2lOKsnJ8QTrJ3qXN0zxKp+M8VI9FAxMWlnYa6i+yT9/D+wOlbLGwMaXOvu5041/bsgQpGvfRqjhf0FbBm9gY8O/DAVqBMhBDT9XnsXtCiHKRdTjKgixO/NJK+zzLj3kg6UAe/fbuosLDVyFKG99wPgbi08urTe+Xld+j5BgLthD0cVOwq7mkXeUDM6fPsAMBzNgu3GuRQ+kjvO6Cahg1+3qyBwBqhKQY8W9l+0tNFaALe1ULqtLYHR6Q/UpGRBUdK/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W9ZFp5vzHEnTzklg/NCy9D1sq8XIjGptijB6OAUc2AU=;
 b=SCEXVYCg9dzuv62GyIlgVE7+oSFPhFjRM6GRzkus/E98iYIg+6yi5sJZaqfcfmXkEY6+KAXgPYD4yNsngLoS8+z1c7W25Ld3ksIiTomtGcb4B0D9fFfb54DyCoTPBtwJD7fUfrkNoYAEC6vBQtfnhaxltZwb8ZyBzzlpvbcSjbQqE7wAP2w4SFsiMbfMOoC3pWRVFyIwKF7YOZLBWa/kCnKZ9//2WSaqtC2J0o4YV92wIslW0ebgnP6wxLMaiA8U1MTY6R9UZRppooKvGr4XZVBOBwPCzaAQgR1cDGLkG8f5gloO4QIspU1Xfnq0ANweyrmIgQdLAOUq9ycJRu09hQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W9ZFp5vzHEnTzklg/NCy9D1sq8XIjGptijB6OAUc2AU=;
 b=m4VGosz10u+0VAkFbElP2A4aP/5lFT62c2J4W9aQvEfbQBqslqiRC8qkYM9/vROrkKZYu4UGzx+svoskqyMkAHDUHwVDDvA+KTbd6P1FLueFBhz0zq5FCKMTImfGI25WWDNRCZfdqIo9f0mhQbDHjs3hiYDn0fLvuo+V0J7zhQk=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by BN0PR10MB5109.namprd10.prod.outlook.com
 (2603:10b6:408:124::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15; Wed, 6 Jul
 2022 07:23:47 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5020:9b82:5917:40b]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5020:9b82:5917:40b%6]) with mapi id 15.20.5395.021; Wed, 6 Jul 2022
 07:23:47 +0000
Date: Wed, 6 Jul 2022 10:23:33 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 1/2] ASoC: SOF: sof-client-probes: fix error codes in
 sof_probes_compr_copy()
Message-ID: <YsU4dYXYYVsfs92J@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-ClientProxiedBy: ZR0P278CA0069.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:21::20) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8946eb03-4850-4fdf-b100-08da5f2076f7
X-MS-TrafficTypeDiagnostic: BN0PR10MB5109:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4Dwu3EvwK9Uf5gXy74akmnI7PQz9X5sVKmZD+M7KIK9RqUGX8uIYlrZKXvsoCZ6ZkvmlgTt0nGusheDBgsqts/5CQHsfjmyEe+KCwVgO598MpUn8c6gzL8cwec0ST8m0PshxIJKm7Npy9xQQwDFWHQsKPBylcNqjuPnokdvJdWrBqtwHtttJFGb93AF6smyIE5eLM+4DgEDavMOFevi5IDESsJjzQ+iqYKMHNVj95m8PrPP+SVEF8hdqmq8eTeqXVuTodtIxNusBLraf7QyeJjwAxY3f3vmwMjfZRSmMuFtDk7SRDUi2/DmI8eLdOe4YqITvj1EGpn9UIKL5QNYrMj7uahJZI+4yPkOGzJtWihI7uABIo06xefStHAqAwA0YWQ+SWAAb0+BLLcrTbnCcJ9Y4DNaxqU6kO3JgBfuJBW23vO+MiJ6Vk8RP8G7QpnxwA4Is3xX3nLYlfko8q0vt/fZfvhw8bia11g4yRRa/+8JxqgHnq6oqczJDTl805S1XUkLXxTBBRXKYbBJhZ84wSK//e5Az9wSgp61IB2svaqqPxalTWtMWIWD9qZdgG+jz4KlC1XJx5QC/4+C7FZKpe6HR6FygV35BMw34jkSrTz+bDb1NPuz8maZEkFU0ojiWfwyqXY4EDRSfu4J9ml92DPZvrYNdyYow+lm6b5CWMZcAX7GYgXnzZ4ciN0v4L3M1B8/PmA668p9p/o4GkWV40yaWIGRoo0iNTuwrqHQAM4mglE23xRole6MLFH8hylu4H4Q2Q8NRSEypi5H1ylDo9UxlxdHW1WrQsKJtzhn7RbDaet+VG4KSVckRhotdE2jx
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(7916004)(136003)(346002)(376002)(396003)(39860400002)(366004)(38100700002)(38350700002)(6512007)(2906002)(7416002)(5660300002)(44832011)(8936002)(478600001)(66476007)(33716001)(66946007)(66556008)(6486002)(8676002)(4326008)(83380400001)(54906003)(6916009)(9686003)(26005)(86362001)(316002)(6666004)(6506007)(52116002)(186003)(41300700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/yvkeD+aFtIOyvkLbZrMtiLC4ZMqUEN+fDC/gWutHEw9EmwNhOEcSWQseHS/?=
 =?us-ascii?Q?J5pmzaA8PQT8JyDIJDhHSg9gVDA7HmpCxTlDkGnL/y1WyYi25G9okRXOCgim?=
 =?us-ascii?Q?QbUf4l/0OUITeYLSLdN8P3B/HTXuCicvNMg98rbO31uwLL+rbR0DfZS8wda8?=
 =?us-ascii?Q?vi4Vt+yJBk0+yqyIb4njDxkfmsU60XhkrBAdRLEYloc5LpLDJi0ZVij1AWwa?=
 =?us-ascii?Q?3dZMOIPGrzkQOpiTQGTDTvztbKFzctPHuj9feCpdgHYw42VCd9nvLcTYAbwl?=
 =?us-ascii?Q?8E94wnNjoEp5UREEhH+viPZgDTCvIFrQrh6+sOAD1N7z8hXUDacORefLqLqX?=
 =?us-ascii?Q?NITUdCKUqkT5S0g27BK3ErQCL7BsZ9/pJkaNluHV4IyCUxummw9bGlBvGz5k?=
 =?us-ascii?Q?sYVr0ADezpZe2l13lFIqI+qJKyEic/Of/egxs9gk0IFQ6RxaDjcFGVao1nqe?=
 =?us-ascii?Q?nh3BWgNeLL1PG0WEWH2RTPdzmT0Yh3A5/1tWoNkYfqynADsbzAfBT7B01oZJ?=
 =?us-ascii?Q?Tji57WjDHOQV6qQZuxVDTxn9GP4GZU7j/vUOvoB28WWFscmfjkeAfP6Tlc9H?=
 =?us-ascii?Q?Xf7n1K+M6hPLAq4LUjeGrS70/AVEwjrv393fL8u6xKB43QvzDuroYiF+jzfW?=
 =?us-ascii?Q?OTjYrfsvcqRaFzthCaizgabgRVvZRHwbiCpqHG5E6718adNGsUeAP9+QumIC?=
 =?us-ascii?Q?pTzbc2sWR1ISlMj8pUQcr8rV23/JWLOdzvPN2oj0/t/ZNxkBd8DKor1udQxX?=
 =?us-ascii?Q?p1kZy1EnsvBgu2+I58KdScH6WGmSg5+qF8p9ywE6EDK5N4ASMw1+7+v+ZbkD?=
 =?us-ascii?Q?jBgu8vPG+MW6RNYeSD0WSzxqQTpINGMDo+sNOnzmzJNrmgzZc2DM8re35H2q?=
 =?us-ascii?Q?/QcUgYFs5c8omlSHjDeuqDE0oQd1ALkAs6xQh1U7u3VlDU1BZjqqnpENp8bF?=
 =?us-ascii?Q?6wjTt2R1Egm7xiv4h7xXTOJ6SDG8IayFmGApjNYLT0yPplpbgHJ3joG2Engz?=
 =?us-ascii?Q?CbXfMaGEB/Sa8eIXlqgRaoRVx8bJM47CsHQc9SDCK4IZt0JS9gAjMaCp3q3J?=
 =?us-ascii?Q?GczHt2/rqwdQLW1GZ3nQ93NYacEuSw4BB0VvFgV0jVWXZOn7H84phZDmV2eD?=
 =?us-ascii?Q?kXyZx8O74YjeZAgv/HFYcXcc3i/n/2gjgKDRs/Z7qJUZRdeSCBtzv51FNLZ8?=
 =?us-ascii?Q?TOrGKZdj6/tY7bT+KVALty86MeZktQGzij/LntwJ+Gf7qyTYippRuotNAvXx?=
 =?us-ascii?Q?vpV+aLuzCTXCD7+lTRMeQBl4vEUg657ny5DpbBTQVuQPdK4kiGBOfoBe/COv?=
 =?us-ascii?Q?av04qpt1M43kMoWimRqV9ieg9fjfcCzLHGh4LXV7kCh/rY8ryFvJhSlJt5WW?=
 =?us-ascii?Q?uKORRovaN7ez+8CNL+AQwjDJvmks9u7hHId0mymRTaEMoEuwJlydNJG09QH/?=
 =?us-ascii?Q?2vK+Q4yzmb9IfDRFADAq+aQ2F1qlpLmOsQjhQxzbqPupty90L+c8s+cim1Nv?=
 =?us-ascii?Q?tMEIeVKWrJzAQKDPZvH3dlyhvjb2kFQD6/XVDU7PDZK0aeBaIb7xjQ8rEk1N?=
 =?us-ascii?Q?d+M3ualGgmZGM25Rb4gLhuXwdd8M8tFvRURvBODFOYHfnWVJtD+ABkZcryds?=
 =?us-ascii?Q?9Q=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8946eb03-4850-4fdf-b100-08da5f2076f7
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2022 07:23:46.9007 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EcGPzdY76tqYmZLReDaH1Y4JhXKuPosx9mmLHYYHjfzXyxZrj4lPmSSQHS12JkrMwk9QkNKF8tR/A/THjI61sH+j1qKiz7qHnz25JJSFmF8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB5109
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517, 18.0.883
 definitions=2022-07-06_04:2022-06-28,
 2022-07-06 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 suspectscore=0 phishscore=0
 mlxlogscore=999 spamscore=0 adultscore=0 malwarescore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2206140000
 definitions=main-2207060027
X-Proofpoint-ORIG-GUID: JtlXRQwjyHjSh7mNEjX301h2x9E93j5W
X-Proofpoint-GUID: JtlXRQwjyHjSh7mNEjX301h2x9E93j5W
Cc: alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 kernel-janitors@vger.kernel.org, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, Daniel Baluta <daniel.baluta@nxp.com>,
 sound-open-firmware@alsa-project.org
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

This function tries to return the number of bytes that it was able to
copy to the user.  However, because there are multiple calls to
copy_to_user() in a row that means the bytes are not necessarily
consecutive so it's not useful.  Just return -EFAULT instead.

Fixes: 3dc0d7091778 ("ASoC: SOF: Convert the generic probe support to SOF client")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 sound/soc/sof/sof-client-probes.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/soc/sof/sof-client-probes.c b/sound/soc/sof/sof-client-probes.c
index 1f1ea93a7fbf..679bc7d371fc 100644
--- a/sound/soc/sof/sof-client-probes.c
+++ b/sound/soc/sof/sof-client-probes.c
@@ -385,7 +385,6 @@ static int sof_probes_compr_copy(struct snd_soc_component *component,
 	struct snd_compr_runtime *rtd = cstream->runtime;
 	unsigned int offset, n;
 	void *ptr;
-	int ret;
 
 	if (count > rtd->buffer_size)
 		count = rtd->buffer_size;
@@ -395,14 +394,15 @@ static int sof_probes_compr_copy(struct snd_soc_component *component,
 	n = rtd->buffer_size - offset;
 
 	if (count < n) {
-		ret = copy_to_user(buf, ptr, count);
+		if (copy_to_user(buf, ptr, count))
+			return -EFAULT;
 	} else {
-		ret = copy_to_user(buf, ptr, n);
-		ret += copy_to_user(buf + n, rtd->dma_area, count - n);
+		if (copy_to_user(buf, ptr, n))
+			return -EFAULT;
+		if (copy_to_user(buf + n, rtd->dma_area, count - n))
+			return -EFAULT;
 	}
 
-	if (ret)
-		return count - ret;
 	return count;
 }
 
-- 
2.35.1

