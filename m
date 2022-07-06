Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B174C567FCB
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Jul 2022 09:26:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5A759164F;
	Wed,  6 Jul 2022 09:25:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5A759164F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657092385;
	bh=ZlBJcqRjOHYkWWq3FPzakqy9euB1V3h+PXYmwzsgjc8=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=Tp4ZtcLxF/sKNQCrU7wn2a7GJsuMINajmW5MmeONAC0jTVLgB3PVpytXWF436Efi9
	 zHez8CtvcY1Zu6YQvxyweQAeHbyg0pckjr8KbLUg2NykW5RH+/U2gx4SW6t/DyyEib
	 Dp6cvdHKyhcxyF9kagcXMux9jefzOg1pjiPcGE4Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D0927F8032B;
	Wed,  6 Jul 2022 09:25:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4D14BF8023A; Wed,  6 Jul 2022 09:25:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 86840F80104;
 Wed,  6 Jul 2022 09:25:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 86840F80104
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com
 header.b="FYr2Gn1O"; 
 dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com
 header.i=@oracle.onmicrosoft.com header.b="a3IDdHJi"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26663h6S030603;
 Wed, 6 Jul 2022 07:25:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : in-reply-to : mime-version;
 s=corp-2021-07-09; bh=O5+hg7VeLKe3P5uvNBy6VBT6xSaUrbvZsV7HgXfF5xk=;
 b=FYr2Gn1OMnOW+i9cx3Pr3oJu/F0/F++2s8OJkbUkYT6JBG7LI0u9LTvJFXD+QxcgliPi
 Lh9MymCXj2NRUOpcRc5uMdzADtEl8Q9EdM+VWqgV8JY1tvHznlgJ+n4ocvS13JEzBAyM
 WexI6f8FpMkKjqt66usmAZeTC2/o+dX3MeSJSmdu4GvrJPGFC3IbQtF2thtwiahsrYVF
 Ga173QILUjgvjCRpLNeX7bA3dPNhVTKIyvZFLN9isdi8mH67OT+WDEByDdKsl3F3N+O0
 Gd8SzHINpuLbMK3vnNnerIYlvSaZ2N1+FDa9K0jRvt6+0Cm+L+6C5mmHUpmlYTNlJ71x DA== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3h4ubyh4kn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 06 Jul 2022 07:25:17 +0000
Received: from pps.filterd
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 2667LG5A007211; Wed, 6 Jul 2022 07:25:16 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2169.outbound.protection.outlook.com [104.47.57.169])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3h4ud5uh4d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 06 Jul 2022 07:25:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jcedJd+OtRs6JXtxwKcdj9i3W13Jk/0ICgHsY1NZCsm2DkBOzGA4aICqEZARwu7LihFdrdO4nOJ03e0pEMXr9j+7T9p1gH5yYCohjShDY0Xurdd7MVXh07ybccrcySN8T0zF1q8OLiJaxnUee0NRqX4YGv3cfIqzQlJKPX6i5VDdthukNjpnUsOKn8rMMUoZwTQ++7/t/RQOOt32japWQ8RjhjL78qPLo9RkH4YPtFAYmSkfpegmAN9plFLGDd+qNrYYKrD6mm5jpRIEKZYjIdkNk0zajBxKcFOcnCMB2c2wK6vKhPqE6QxDe47c5pl8VPEgQeuzFzsjcI9kTqYoAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O5+hg7VeLKe3P5uvNBy6VBT6xSaUrbvZsV7HgXfF5xk=;
 b=NtFi3baDv428WRVUn5YyxN5edne55dVhJ/SSAVQcy4vukRoBNvkGm0tbil4Qwv5oMIy6LdyrJfapb/KP+j6VLm7NGdoYbVl2Tss00KyDC7mmU6Y5YlTsIutR2Z6nfrAQxBmiGosc0d3XgvtA2qjuNCzl1kAFT7aEtQy9b7rwvHpvFXB7vdQHMAxrzpTvcgac838H94qFD4lT9Av/RqAmGrw+k1wCb3ySSwHXI3VClWcZ++yYnL6Vhjfvtl3b7rCuPGurrkJJHcfpkOys+a+v9rX4V4XikE0oSXZHJHv+luTZU8KdoiWy+bNRBWDcauW0zC76IdD/cx9kw/F242Da0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O5+hg7VeLKe3P5uvNBy6VBT6xSaUrbvZsV7HgXfF5xk=;
 b=a3IDdHJikLv49fSXm3c1RpurQXMgZNirVEHSDv0NvZLssIrwyU9t1tUwo17FPjdTunvafEakapyM/U5kbSN6WQ5peJxvvhvWL2NWRe/DYgS+SGLUP24A3PXuknB2t20YDSZbJghVuqXIcjE539lapU/qj8Kv6lWHrh/WAxk0EBA=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by BN0PR10MB5109.namprd10.prod.outlook.com
 (2603:10b6:408:124::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15; Wed, 6 Jul
 2022 07:25:13 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5020:9b82:5917:40b]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5020:9b82:5917:40b%6]) with mapi id 15.20.5395.021; Wed, 6 Jul 2022
 07:25:13 +0000
Date: Wed, 6 Jul 2022 10:25:00 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 2/2] ASoC: SOF: sof-client-probes: cleanup tokenize_input()
Message-ID: <YsU4zCpaV7GBpHci@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YsU4dYXYYVsfs92J@kili>
X-Mailer: git-send-email haha only kidding
X-ClientProxiedBy: ZR0P278CA0051.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:1d::20) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: adba0a86-510d-41d8-3542-08da5f20aaa9
X-MS-TrafficTypeDiagnostic: BN0PR10MB5109:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ItgWUU6E3DIn3Q1wfyMtH7GVI8wN1EB2DAeTti2f0Wr9DY5shCoWytENiG1RDjLwR5IHg1bz4HihDu4njGgh20/ITevCLdQBql9a1L0V/6QJLPtUmExzv7DJoME4EWIZVId+OKv0GUllsPGkaawwBaFna9f+ffIgvMtxAHYWkLqKKkbdHyv+OhHjwxPPZ+/3FT3bMnxIhbaP8w7Pe62m5FekIw6LKZsG+a93WFhfFr7S7OcJU747Zs6+AvxPfRIb2GWmA6sWFhaVQTcFnAWUGOHar//HM77/gtbQ4PgszujuCxiAITQ7SkZ9MAQfjuxREYSbOoA3gkaijiL0pToqrOrY7aoKFhqxlcOfypbO5X6Z0fvdX6vnByq4uCw06p3mjhCU9c7mW5cpl8l6NBZ1hA8H7PV0DIw+tpTpDVbW8MyMdE+xjhClMLzWPYrf0TIukUQ5qYLm5EHY75tpQKe238PPx+yMRnSulugNfnuHlhrLhHn9m3WjqynK1ldewBr7P9ibWA0us4iFQnB+klvNEcrmVmmYV69P8qko8bXomj2C10o96aReY+0I0CkbJ/gJGzRz8JEFlup0mFlbuEYSHGvdI3wboNywGT0mA4xqyjznpxt8ZIB4CpT2J+lwPpQcdJ4KkiEq0GH945gydrhZfEnnAsfx3o+qTR8wcutGO4k1gSDq4RxFjBK1karlZFy4bCUUnD/4dtqlnpq64ZNFW7qocIuEfJtpaAHOyzh/wVwEtSzaTPiYgGU5nxP+ffd4N8ytqVRkAvg4eo8GFxZmXc8go3BPj15+XnCKOhAmLzEwr56vzQZAEpxGJ+wjnQBe
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(7916004)(136003)(346002)(376002)(396003)(39860400002)(366004)(38100700002)(38350700002)(6512007)(2906002)(7416002)(5660300002)(44832011)(8936002)(478600001)(66476007)(33716001)(66946007)(66556008)(6486002)(8676002)(4326008)(83380400001)(54906003)(6916009)(9686003)(26005)(86362001)(316002)(6666004)(6506007)(52116002)(186003)(41300700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?z09Fjjx0P8Zz22zpJQT4hfHe0/I7K7AAhKHYCuCt5YFsHbcdp2aw8CbCn6S/?=
 =?us-ascii?Q?jUJgXA4DkD5tCrPi2KcjhuRbNGaWUF6NqCB0bnqaU8eQTlguFUCMruNeS0vE?=
 =?us-ascii?Q?qZH3FILszHkZN0r0CTwxlyHcji6tB3QQ+a9o7fjp6puf6aDVSq2lyca9xt8k?=
 =?us-ascii?Q?HUVcPoeaRA/saqSeL99tTP+c68WjU70cYLqpPtdtIRd8u086xIaxPkvLSNXG?=
 =?us-ascii?Q?wxEr5LgZmV3qPTRUhZWNTvkU4kVTzYVtXDxQNJTNpOg5xV7QDtmdmObFMsbL?=
 =?us-ascii?Q?hqe9BWdilVeI/cec2i+UCDQ4bGLole5PV45Ks5fswnNXUXueVLTeK0BHBxpd?=
 =?us-ascii?Q?OYtUm18Cm7PqScsWLzyoiVadoej30lF8zut1Q0hLOdDtcFtOQehqb4MYZ2R6?=
 =?us-ascii?Q?TxiGhNbgNfZBoP+dFrcdAjTeMiLpMFBUWMVJge6OVUZJsa5n1NSw8rN4f9am?=
 =?us-ascii?Q?oy9SF9/LurwqnTuefUNgOOka1egl/UpWisr671h4PHi17EmRW++/NZc/fNkg?=
 =?us-ascii?Q?rZd6ZRNnHhA5PMk3E4Wp/9CAa4HXZzjxxe/AfGPHnB37saFFsJubB+yj2no6?=
 =?us-ascii?Q?gbSuL5fD+yEHFCOgDK9BqFzGyobr/vorM+OR3Lse0e2Bb+aCO9Gk2Tjehq+C?=
 =?us-ascii?Q?R9HfmsnOXNa7jKJzzqKb1MarJgoE8y7NnCgK2HaEGnm/tAh4kdNTUPoBYDMy?=
 =?us-ascii?Q?Ylr61VbCQ8A+CELdZ4bdFp2SzVwC+gYL8DoWbfn5Ro57c/ZAsbDwzLyrnxSZ?=
 =?us-ascii?Q?ztU4ZrpIwmuKhjbbo9q4ViF17A6vo+fKLADx/vXwjIymZatrZ5IPAq+q15qn?=
 =?us-ascii?Q?nVOWQ33ARDJiw2pOU7VjpCPiOasCw0b0HeiCf5NYP886yPANSjL0jsWNsLrO?=
 =?us-ascii?Q?MxT92IDQDHlj+SZdP189qiAK13Pk4fYY9r1FdM9UXZGyfZ8geEPP65oiT4yH?=
 =?us-ascii?Q?y1T5UFCjI3CmpI/EU2nz2Unk7ktnifBce/oYfIKCJ1uTqFCHjDe2d8EFRfuk?=
 =?us-ascii?Q?bxLBQeQxPtds/p2A3FkRpXG7gRXO/BYw+q9dv/bC8utxmc19bqrDhX6JqSyk?=
 =?us-ascii?Q?9+VeF4nHjLbcZ0nDU+j2LCNApNHSYe6GcRc17o4Ha0DtSppU/TIFMLjUz28y?=
 =?us-ascii?Q?00POSajsmHCBVdRpB9QrWphh/60/+UwyieQcRV47fCVhe+N2RtCeH4P9TuD1?=
 =?us-ascii?Q?2gwpqv3BBV6fKiRus4q2D7BmAbtw2q+uTMMBRyNblUgrtRnJbz/TqGCzmlmn?=
 =?us-ascii?Q?Fy42lQrTZZ9xitbWJX9Bjqi+jMUN6OreudOj9bxsjVeOqbXSxDXR7K7yIg41?=
 =?us-ascii?Q?O4CW1nu1l6TlAOiN9UmTT6OJQHFTo9gyfO+LGPe9ka0BONMixPnsZ+ISCLhi?=
 =?us-ascii?Q?xyyHruEv69lHXJr8/Pew6IKjkJ54ttJFwN46E1zoq0vzWMqfD5coEPWop5IR?=
 =?us-ascii?Q?zms7lofVFEdCJRwwNOtHX+8P+IlyyKbJF//gXQ2QVFCWoUtBpu9z8vmrqtdM?=
 =?us-ascii?Q?qY3dfqcrZt5cbyD0M/uB5bTETHRw0xHyvIbgAiVm7fNc9gUoccwjcQdHvv0V?=
 =?us-ascii?Q?ifkUFGqcTS3sq6GEF2av8qtw6L7iOXYCk83EEVpAqMt1gHReP9r25dN6q5jE?=
 =?us-ascii?Q?nQ=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: adba0a86-510d-41d8-3542-08da5f20aaa9
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2022 07:25:13.5810 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BNakJnLNYSchtRHkK+JCCxPXtRBYMvnmv1+79ijxcUQGSyN/fg4NXJBZnDWGiXLLGTZkeonuOL74h1foeQ8NGvKnSmT/NY5n8qjMc66+dHM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB5109
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517, 18.0.883
 definitions=2022-07-06_04:2022-06-28,
 2022-07-06 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 suspectscore=0 phishscore=0
 adultscore=0 malwarescore=0 mlxscore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2206140000
 definitions=main-2207060027
X-Proofpoint-GUID: iil7nvu6MREeXs2-vzXmNt8_5NRwyiaI
X-Proofpoint-ORIG-GUID: iil7nvu6MREeXs2-vzXmNt8_5NRwyiaI
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

The tokenize_input() function is cleaner if it uses strndup_user()
instead of simple_write_to_buffer().  The way it's written now, if
*ppos is non-zero then it returns -EIO but normally we would return
0 in that case.  It's easier to handle that in the callers.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 sound/soc/sof/sof-client-probes.c | 27 +++++++++++++--------------
 1 file changed, 13 insertions(+), 14 deletions(-)

diff --git a/sound/soc/sof/sof-client-probes.c b/sound/soc/sof/sof-client-probes.c
index 679bc7d371fc..6c922b683f67 100644
--- a/sound/soc/sof/sof-client-probes.c
+++ b/sound/soc/sof/sof-client-probes.c
@@ -461,24 +461,17 @@ static int strsplit_u32(char *buf, const char *delim, u32 **tkns, size_t *num_tk
 }
 
 static int tokenize_input(const char __user *from, size_t count,
-			  loff_t *ppos, u32 **tkns, size_t *num_tkns)
+			  u32 **tkns, size_t *num_tkns)
 {
 	char *buf;
 	int ret;
 
-	buf = kmalloc(count + 1, GFP_KERNEL);
-	if (!buf)
-		return -ENOMEM;
-
-	ret = simple_write_to_buffer(buf, count, ppos, from, count);
-	if (ret != count) {
-		ret = ret >= 0 ? -EIO : ret;
-		goto exit;
-	}
+	buf = strndup_user(from, count + 1);
+	if (IS_ERR(buf))
+		return PTR_ERR(buf);
 
-	buf[count] = '\0';
 	ret = strsplit_u32(buf, ",", tkns, num_tkns);
-exit:
+
 	kfree(buf);
 	return ret;
 }
@@ -552,12 +545,15 @@ sof_probes_dfs_points_write(struct file *file, const char __user *from,
 	u32 *tkns;
 	int ret, err;
 
+	if (*ppos)
+		return 0;
+
 	if (priv->extractor_stream_tag == SOF_PROBES_INVALID_NODE_ID) {
 		dev_warn(dev, "no extractor stream running\n");
 		return -ENOENT;
 	}
 
-	ret = tokenize_input(from, count, ppos, &tkns, &num_tkns);
+	ret = tokenize_input(from, count, &tkns, &num_tkns);
 	if (ret < 0)
 		return ret;
 	bytes = sizeof(*tkns) * num_tkns;
@@ -607,12 +603,15 @@ sof_probes_dfs_points_remove_write(struct file *file, const char __user *from,
 	u32 *tkns;
 	int ret, err;
 
+	if (*ppos)
+		return 0;
+
 	if (priv->extractor_stream_tag == SOF_PROBES_INVALID_NODE_ID) {
 		dev_warn(dev, "no extractor stream running\n");
 		return -ENOENT;
 	}
 
-	ret = tokenize_input(from, count, ppos, &tkns, &num_tkns);
+	ret = tokenize_input(from, count, &tkns, &num_tkns);
 	if (ret < 0)
 		return ret;
 	if (!num_tkns) {
-- 
2.35.1

