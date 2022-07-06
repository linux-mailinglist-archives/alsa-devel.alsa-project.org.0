Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 160BC5685BA
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Jul 2022 12:38:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B62311671;
	Wed,  6 Jul 2022 12:37:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B62311671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657103915;
	bh=c5MUrcmO5eYDwPf8MoiG2nItqz+3pvTgebJKDQp7G1s=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cv2hKbTtqVmCITMStbqAs45GG52Khhlf8pDfz0J2nBmnyzCHqBhX/bMbgDc/ql4/y
	 dzYT13J3XXWQM8GRWYcPcm0Hf2MPortUDaClXZUFpW3S08FMrcBARvFLqPIsspU7L5
	 KQfxljYGnsO3P86YRUUdxC5+u68iDWyUHhY5D9wQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 13513F804ED;
	Wed,  6 Jul 2022 12:37:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6DFD4F8023A; Wed,  6 Jul 2022 12:37:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BEB67F8012A;
 Wed,  6 Jul 2022 12:37:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BEB67F8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com
 header.b="KMhGsxpq"; 
 dkim=fail reason="signature verification failed" (1024-bit key)
 header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com
 header.b="xO/jvEpA"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2668RDdu003458;
 Wed, 6 Jul 2022 10:37:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : content-type :
 content-transfer-encoding : in-reply-to : mime-version; s=corp-2021-07-09;
 bh=lUcPLBKdoM4of8jDq00dLCAuMmVJb4MigWSoLaXNv+k=;
 b=KMhGsxpqhxmhDZxOvVi4467mDUAqDawLraS3E2kOLxvJm144WVdM+sgxe3Xi4KkzuHg8
 TngiChzFtEpczUGkZ45pS51K1Y20Kpe5LLg80SaJcnVbhppt2aqYNGHMANOv4Z7IvPQ6
 2C4LqDVAjE46ympkJUteBEp2rRuHyjfw8/OgsVl5VrHa0V5ELlhVyg7qkCrD07s6ZynL
 u+3vYK9NX4ZXxmfdL10MgGioeBvc1eCBTZ9++vmB3PNO3msnjoeCy+KMZkmTrjhg5dJy
 HqeHzPGKvlr5+JHQ6/KQcaWE/xdFtzbtRP6Yj/Mm0i3/vxZPPbuJ/wnsItbrKdnJlZJl kg== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3h4uby9khd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 06 Jul 2022 10:37:22 +0000
Received: from pps.filterd
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 266AVHjZ018101; Wed, 6 Jul 2022 10:37:21 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2173.outbound.protection.outlook.com [104.47.59.173])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3h4ud5yjea-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 06 Jul 2022 10:37:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aRxvzgBlIOxEkCvKKaLWONuxw7fdmTInVAwpjSDOTgch57ZZ6kWe97WxNPGLDxOe+mjqJYzoyyZ5cW2Fbm0NWzV/Zdwe7DR+U86qCab8t+PVpT7JAVVfDJV+K80Xl0QUSPtygPWsZH2VOsfPMUsn2UTUw87ElrfYinfFumybvzoCzAK2R8zH2SpN9Gc+MHsKHlqT4N6Fkfeg91IPe+kpqoGEQpKNMJFcXKQbYy9L2l9YO47QFQRfGZROYEIHcibvD/CC2ikCN1otZDWFAGSxen/LAzxbm6sb1oZfeAf5nAe4Zpt8CASPDU4+gJxqNpNrky+BgKUtrhu2XwGVUSq7Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dwsKfYOrO2BGm/cPnSgpSaSut8bMFHK9SOJwMQcazJ4=;
 b=QaZP3qM9YKjb0wAAlXvCgTrfWTrf2gsL4/cZNFZC7zDZunV7Pe98rM6w2I4R8PWH4ViWs/iEr6k2dWUtaldrSPYcxWQQInDuZHVdCXr7CmH7CtlBjn83QVeYU/B/IblZnUyTCXVKPObcIDRwhyB80MnAbtFnY4wTQdaE16IQRxva/akioPLMoDfTNUt2XbHi69w/cT0L8ibgylVwN0/nRMZddwwAPei6gdQ7aLpNtVEJJdSh2EMdWDajRvkeWqj9FabM5n7CvT6n2+RuajrJJW/km89WJmO2LlyXAhywbhnJmMQX1K88Il5BWPCh315qiYlFlAl8VK43ar8dA2GzxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dwsKfYOrO2BGm/cPnSgpSaSut8bMFHK9SOJwMQcazJ4=;
 b=xO/jvEpAp6xsHy83RKzrt+V91aFDMpM3S56mpIHI8wNcsWQhLKe7kEwMuIT2iF783Q6yNWQD7mdtMD9UY+AlLzIdCtqzZYr5Kc7F0qZ0trxktNO7ujc3b9P6OeVZWe8D60y12Cyg03RQ57TFQvwKOUqPHX1CP4Q6gytO6aJc5sc=
Received: from CY4PR1001MB2358.namprd10.prod.outlook.com
 (2603:10b6:910:4a::32) by MN2PR10MB3920.namprd10.prod.outlook.com
 (2603:10b6:208:1bc::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15; Wed, 6 Jul
 2022 10:37:19 +0000
Received: from CY4PR1001MB2358.namprd10.prod.outlook.com
 ([fe80::e038:d513:8896:32f4]) by CY4PR1001MB2358.namprd10.prod.outlook.com
 ([fe80::e038:d513:8896:32f4%6]) with mapi id 15.20.5395.021; Wed, 6 Jul 2022
 10:37:19 +0000
Date: Wed, 6 Jul 2022 13:36:54 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: =?iso-8859-1?Q?P=E9ter?= Ujfalusi <peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH 1/2] ASoC: SOF: sof-client-probes: fix error codes in
 sof_probes_compr_copy()
Message-ID: <20220706103654.GC2316@kadam>
References: <YsU4dYXYYVsfs92J@kili>
 <26db7e60-51d1-444a-7620-8225239ad7bf@linux.intel.com>
 <20220706102159.GC2338@kadam> <20220706103139.GB2316@kadam>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220706103139.GB2316@kadam>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JNAP275CA0053.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4e::18)
 To CY4PR1001MB2358.namprd10.prod.outlook.com
 (2603:10b6:910:4a::32)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 80e82f49-283f-40f6-1ffd-08da5f3b80c2
X-MS-TrafficTypeDiagnostic: MN2PR10MB3920:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 24DV49plhg0y2rqRs6Uhkpd+92P+MHRrJHYC/8yUsV56BmsUyIgDii75tgAP2Lu99tTto9x3V+UHDSPu28epDwbk78lu/c7ISsJziiL8JyX6ObEtJcs6CCzDhQrAkXEvkL8Eg6guPSAKiaJq7hOoBjunCLiDl88iWrjSQBWVB2agc7QuCaXpmP7G/Z1s0syNkVzbv43dI/yZGuLzhJBPWDtBshc8FVOE77jXRKBLgMiIGVJiYlybpXbYx0mZQB3N64FFfJEY/JeLYQHkjZ0L5QgRrQxNnwxzvLLvBjooUyMj3Hx03bi0qkIKPmqnaclb3J7QbmEVpRBttkiyypCLA/ySadRwwpddeGbcvKW9Pdbw43Vwr8SJc4yYRlwivrCzGy/vF/EXrFFua2v4IlYq5lfwtHhmE1sWL0VIf3mTkcvledy9gg1e5ddCk1Xlm1VLBMybVveQKmVG4azwhlu1Z5/pE7qE10TGpXUXE0KD1SPenkmUETVyn7nfUrZr5xJ8ihbAm2APkffc8GZN1Nf+amYQC/7szjvNoO+FlsaY4WMOX2KCVEyUM4bpxpcAXKSCP79CqoNJRsKJOgouaIempBSsyDDqZNzHL7P9V3bXu3lKnm9mR4Ngyr9RWWuE1672Gi+DS3QcYzTTNr0/l4w0tyMMckDsJJnf4Ly2D870OT+7Akw83I6yFppZZWQMgryYK1Qan3fb0ONlqSLVIp1PZlvTNcS+aHamtiwTHR/iUjSspaoxvRB1ahT6/DQ4z7xM0rrVWMl0EbV8xj5H73Iq4+2V+we2zw9k/oH7Yy5Hn+CivxRjvH9X+qNw1YBskN8G
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR1001MB2358.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(7916004)(376002)(136003)(346002)(396003)(39860400002)(366004)(1076003)(66574015)(6512007)(6486002)(9686003)(38350700002)(54906003)(6916009)(316002)(186003)(38100700002)(66476007)(66556008)(4326008)(8676002)(44832011)(41300700001)(86362001)(66946007)(53546011)(52116002)(33716001)(8936002)(33656002)(5660300002)(26005)(478600001)(7416002)(6666004)(6506007)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?QBJRIJjqQP//zElr+k/G31WSRv7kIgHoZZfzTlkQo+eAJRhWK4eP7RoEo8?=
 =?iso-8859-1?Q?qsMxQvXGHlZfjkIz6iBuZsVlYGLBKfnEt0KzXHtXDXUWL3r8D+4op4Xqvi?=
 =?iso-8859-1?Q?XY9f1eO91mCOAjOEKHt6CtS4QLofg/0a+BFX6y/PMam10uzUVxHDtWQfUk?=
 =?iso-8859-1?Q?TFPGL4vIxwsVXm1/2QmWxGurIDXRn4IFytWL1KFnu6x0eagjQ/dpeZ+xdr?=
 =?iso-8859-1?Q?RmTjvMdz+DifJI6uK+o99UW8lsOc/g9TkCkpAb0MexK++npGqknXQNh8JK?=
 =?iso-8859-1?Q?w+huPbvCDZHxk7vxtD1dZpmJZ530XbUPjWnv93l8JHkrK58V0Lxwjk2v1l?=
 =?iso-8859-1?Q?18swX2lPiGhhJlgTdlL38ekiBRrN6I8d2lnKfL99lXaqudm6iqh+waWRW/?=
 =?iso-8859-1?Q?rZSvuL4hJ7aaUnF0odmN0+u6nynvvx/FRBpfJckLEQF3dOsuWR3BdIqtCA?=
 =?iso-8859-1?Q?4JvJ0tmC2phE8f7VBh0EN+gx/1bEY+DrllGG9HODcg7f5PSYP1SJQRvvRI?=
 =?iso-8859-1?Q?MqM5jH9n0zdo0SYfZcFrV/dXIFktMtSEieFZqup2bEaMkL43eXlwe0KmgR?=
 =?iso-8859-1?Q?DyZRolfKDid3FGmdyO0RS9ncRcJPRx502eUaj8FSjm2CWpnGbeUZfxZjl1?=
 =?iso-8859-1?Q?9dbfi12iRDr96Yuqzqz+mnDlywVMUrzecp2LVy+cmmtWjtK73S1sLHlSHi?=
 =?iso-8859-1?Q?im6mt5sIxnbNji0if7FY5LwY74OmCXnVvPNL+90mR4DbYu66Ml9zFn3ypf?=
 =?iso-8859-1?Q?EJZZ3CDwPpobpsTt2i/UfvcmFqGJWtlQjlK+CEzLIdrv4Z0pY4u3z4G17P?=
 =?iso-8859-1?Q?IIhlq66Wi2Fy8pMuUFmzzIggVTjnJFceNTor5KjlwwDtIQ2N1EML3nS5Bw?=
 =?iso-8859-1?Q?CqViCWs19CukqiB69lspC4LghwjIEOKe5giBPWauqqsCUToRUwYmjBzNeK?=
 =?iso-8859-1?Q?rsiU+YUtZdv4uaqvFOgpgVP02JsDyrnWPQxFhmQhoMXpxldpsqgRcbTIbP?=
 =?iso-8859-1?Q?Gbzt1FOYfGdrEjgOXxFp3tenShMxdCGiXRG8+qMlJv5kOGFdzcwDkVUV4h?=
 =?iso-8859-1?Q?CWyeukgBbivZ5kJbaX0fYm0sNAsOtq5PHvZ6CLiIx/auzIvdf1rlNTcu8F?=
 =?iso-8859-1?Q?WlZ/ukjWBcme6ERjG/7fKjWRhH7VjUxVEhxmVfTSTyfJ5pIvvXb00uS3bQ?=
 =?iso-8859-1?Q?HyxzVvsKcRNuKEX9+KP/Jq8RskgUS7PqawC3NhnnrcbhResAckzUx34cYo?=
 =?iso-8859-1?Q?rHjMbm/JdJwdUTEnot1MZPg6z8XvNICRM7UtC+2h6E0deuBoERtct4rl4G?=
 =?iso-8859-1?Q?9D4ClwQZ6bfdotc1qoFSYqvXQ1nzR1NiLRCad2K/JAxWo6Ae7kRbRENjY/?=
 =?iso-8859-1?Q?Fb/2/+nkN0Q4hy2sR2SsvT4gxnE6uEeppKMmCj9ii2E8wvVnWzYczPSiPZ?=
 =?iso-8859-1?Q?kxH20qqf9RTWYNnyzqM+OUb3pqJyj9Mp0kcj9bV80XyC+HgY3u7ICzKq/l?=
 =?iso-8859-1?Q?qRr9xAtdvLyyf2BjnnXSDXKyNTjSe/14acCh4o/Bh3bg+tWM17ReCEsnDT?=
 =?iso-8859-1?Q?OKce60YTJL+C9mzNYoRjQ881xibW90zbKTsz1iz3+QvXQBHL6L5Yzat2gp?=
 =?iso-8859-1?Q?lmqgLkyCGrnNRkqVZa8TEpI8/ZThuZ8e1oYghEKN87XWyA/G6cNPUJnA?=
 =?iso-8859-1?Q?=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80e82f49-283f-40f6-1ffd-08da5f3b80c2
X-MS-Exchange-CrossTenant-AuthSource: CY4PR1001MB2358.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2022 10:37:19.6448 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H+yzr+4nJxNIueoLk9J91hpIKLq07oeuJldJro1L98CoP4I8rTelYOqaqG9PZmQyF2Pn2Pre+tx4YhYsOpXeSJBy8o7oxARq4qxLn6PBGMA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB3920
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517, 18.0.883
 definitions=2022-07-06_06:2022-06-28,
 2022-07-06 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 suspectscore=0 phishscore=0
 adultscore=0 malwarescore=0 mlxscore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2206140000
 definitions=main-2207060040
X-Proofpoint-ORIG-GUID: zcWUCWmUqB1-pbyKqbZuEXQvu14lxHiQ
X-Proofpoint-GUID: zcWUCWmUqB1-pbyKqbZuEXQvu14lxHiQ
Cc: alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 kernel-janitors@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
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

On Wed, Jul 06, 2022 at 01:31:39PM +0300, Dan Carpenter wrote:
> On Wed, Jul 06, 2022 at 01:21:59PM +0300, Dan Carpenter wrote:
> > On Wed, Jul 06, 2022 at 12:05:37PM +0300, Péter Ujfalusi wrote:
> > > 
> > > 
> > > On 06/07/2022 10:23, Dan Carpenter wrote:
> > > > This function tries to return the number of bytes that it was able to
> > > > copy to the user.  However, because there are multiple calls to
> > > > copy_to_user() in a row that means the bytes are not necessarily
> > > > consecutive so it's not useful.  Just return -EFAULT instead.
> > > 
> > > The function is copying data from a circular buffer to a use buffer.
> > > The single copy_to_user() is used when we don't have wrapping, the
> > > 'double' copy_to_user() is when we wrap, so first copy is from the end
> > > of the buffer then we copy the data from the start of the buffer to get
> > > all data.
> > 
> > Ok.  But the bugs in the original code are real.  I will resend.
> 
> Actually that's not true.  The bugs in the original code are something
> that only affect users who deserve it?

Yeah.  Never mind.  If you set up user space so the first copy fails and
the second succeeds then you deserve it.

regards,
dan carpenter

