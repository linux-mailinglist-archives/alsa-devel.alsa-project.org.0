Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 83B7354C362
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Jun 2022 10:21:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 27E5218ED;
	Wed, 15 Jun 2022 10:20:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 27E5218ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655281277;
	bh=akZSpqVV6Iv6Pf3cMrjFVrx23phzncX+OvDH5lDQg4w=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=QxMMn0GfYmG0TdEPhd/mAPqEKLOvcPPe70JSaqxbpRI3Pswb7WfUS4DykDJwBsZOw
	 coZ/g0AxO1w1dmSIsZKiDbHujcQrM4LC9+JHJDlKLueBqs4VsAoF1CRRVwmj8nRa/D
	 7CkrQgyc5pVQO+hVVwzU7eauLYvjLbWIrJh48aig=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 75999F8016C;
	Wed, 15 Jun 2022 10:20:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 28393F80162; Wed, 15 Jun 2022 10:20:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4288AF800D8;
 Wed, 15 Jun 2022 10:20:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4288AF800D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com
 header.b="XhloXRyL"; 
 dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com
 header.i=@oracle.onmicrosoft.com header.b="C4Gv4jqn"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25F6j3nv013340;
 Wed, 15 Jun 2022 08:20:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=vc8tibOsQIuy8+BlweaVKaiDzCgR+eso58Y+5xB2qJg=;
 b=XhloXRyLSyI+0dinA+O9Utbw69aFXppwvsQvzm500QAe/PsCo/FNYKHKlodUe8cjFbEk
 uuEwTQQAOGarcb5bIyfJQZ2HEgDhPQa4CHae6dJuS34gR4MIf4cjAvPAUw7lpU7eEkX9
 d3nesCOBcdZawHEMpRYo9D6vQMDQmHsz0GlLoWo1aTeWT5MABz5mCAqugS/InWu7BL7a
 kb4hAFOsCSOXwYksfI7V8zZCFPNrQfoV7OeID2J/m/FELZ6ofjT9nGiZGLbCYKyjKaEY
 ookpJ7XMGe+Mfp4peZ1B8EcZTWK7AdrMOf9C8Ecf8wbD9Uz8gCTKmrgheUTrdgTO00WT 0A== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3gmkktfwjj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Jun 2022 08:20:05 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 25F8BvpK029921; Wed, 15 Jun 2022 08:20:04 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2104.outbound.protection.outlook.com [104.47.58.104])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3gpr25j135-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Jun 2022 08:20:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YRAzKGYk4TbLZ/R/9j4AwSo0/E6mjfemzvI1lPc4HhLJKhCG1QS7hVUO58yLFQ622McKzOJmwn8d9SbBg4yxSQbjkcL4qoBQix01DK2NwL9TEm0jGrq70JvaJ7aVpECdbMLrSwke1eKDn7KbYOVUcqLTEz12GmKWLOA8IWFlfKrZVTQWAIiSPaWL7s7UCvPRtvcHQ7UUAbxssYcmKI6ZtJOBJlRVEP/tVt0djNXgmDZ2CAJqA1PtcoeCT3r/QFRXZ+k9A5XVMyTHu66yVBkD7AR83LlOgI9Pkz5JDoGoQG++sfgJZvWr7YUinGBFilaMrgSbO+WLiujgd5U3PR+Eiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vc8tibOsQIuy8+BlweaVKaiDzCgR+eso58Y+5xB2qJg=;
 b=EgHC3EdzYK5XEU29kQOtAW31UY20+E7KJLw5txGWzY1iHPuy3IL4DOWgI+A/WUBYQ2n8BcJ73qGEoJ4lrw3cRGNJJkHspvPFnYfT2ftqqq6BidXcwKpM5oAJ/BIH++vYZnrxuNi0BHkvOTfXvlNDWNQi1s7M4+JzygPPYFhnmJ2salRp0cLuisQTuhQPYBFzl8ivMEzt6YQORcsfW0/nbfieTnOihh2AExF+CAAfIfNg6NeVmBy79+tm2YDbp/aLGJ7shOak0M1HO+oEglm+/Z/i0raU4Ouo9LBituGqMwmQAZpiZ5Pnrf8Kql74A4e1L7HYgjcRj3kOzcw+CrqRBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vc8tibOsQIuy8+BlweaVKaiDzCgR+eso58Y+5xB2qJg=;
 b=C4Gv4jqnd2QnILqmsRaCNE54ZgVkCbBAT5RTEmjl7qgZHBNy7KvFZpDhVV9PiixBpdP9P3DjszDaZl9DDSBV12CcQjAlKm66J9Y8kIrmqgdDcRBnihHOG0Xbb0/k5LCfC064/H3ylLkTek7nTAmxOIPtsq+/sq9YN4ZOxfnf0Gg=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by DM5PR10MB2044.namprd10.prod.outlook.com
 (2603:10b6:3:110::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.13; Wed, 15 Jun
 2022 08:20:02 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5020:9b82:5917:40b]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5020:9b82:5917:40b%6]) with mapi id 15.20.5332.020; Wed, 15 Jun 2022
 08:20:02 +0000
Date: Wed, 15 Jun 2022 11:19:44 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Tinghan Shen <tinghan.shen@mediatek.com>
Subject: [PATCH] ASoC: SOF: mediatek: Fix error code in probe
Message-ID: <YqmWIK8sTj578OJP@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-ClientProxiedBy: ZR0P278CA0043.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:1d::12) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 72195b22-064d-4161-aebb-08da4ea7d847
X-MS-TrafficTypeDiagnostic: DM5PR10MB2044:EE_
X-Microsoft-Antispam-PRVS: <DM5PR10MB2044E1A6862E205509D046528EAD9@DM5PR10MB2044.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: roQ4JdSidyNMtI1nuGbFktnqKa3MlMwVBhSMjDxxCtsKLWbusRuSM9lxU6daQhNXgbJwXK+04p9rlzZ6O6nXZOgDTtA4PhJiQApWgKgKUgC7Pc5Yx/qz5E2k0ZmsjVFO7kScRkl0SmZkAWQRJLIwD5rxRoJ1GG5nN0Swcwx6TuQSSZRHDrgejDOIloqEUMf0PvovOdldKalIDXXZc4KvqO4oIlcAr+m2zelojja8DS8RfNle5ZYYEjGNLreB33RZn/PhCLwuSWCCIuo3bYGNyfiIH/Lu6MKyoW8Fk/3PkkIiiJR0IAAUAZSLpOzOV9XzhuxgPeQPHxWNymUuWeAcph023GGtTyE2jzUm1gxKuNuUDKdYKltjs4XtO7su0onZmFU4mKdaJw5IwxvkrZoXRXs87iQRvi9//xHedjVvnLtnSTbwpznz6+SHnOlHE7NJaSlN8YKNuGNkXRjLOgkSK31kM0y7y+Y0OrqS6BsnOB3CK/6PYBh2lEMtYg5Fmt1ooyUEVYtteSWmeIndFfxS6Ut82eKuGN/hjAmueRQzG5VK6ANQ8HjtLJRBbHR8byNr+qhp6leu6esCfJlHQJ+0UvgNZFaSDi5f/wRyXiMHeoEVfE5GVUR3d6mTdasy/E7bJ97dibR9mQUMInIr9bIKtscFFvwGTGd6sFoSuv+o7naElSh3BAQ5zGNWQ9ODj77amJlbO5SYEYiF0lgar8LfRQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(7916004)(366004)(8676002)(5660300002)(7416002)(316002)(66946007)(6486002)(44832011)(508600001)(38100700002)(86362001)(66556008)(66476007)(38350700002)(9686003)(8936002)(4744005)(26005)(4326008)(110136005)(54906003)(52116002)(186003)(33716001)(6512007)(6666004)(83380400001)(2906002)(6506007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Smcjh0jE9ve1fPTQv4JOkn4i3ZhaFPTkYuzjvV02jNf0fLPvLowEy3fE5xFl?=
 =?us-ascii?Q?XtdQnLdA0Wpm69IcIrkWkWQbISKcxhoBYBCdnpHkGjlpcVAMw31sDSPCtdUy?=
 =?us-ascii?Q?BskUCrFL/FDuVWs1TKfD5sycQVZT68Xa8N7uJOWfwPe+mfD6b02XGJBz7eMO?=
 =?us-ascii?Q?n96H/4IqT8pIF0kgB53aMU7oDiXCtEt5hHx2z5zzTRJ41NwVolv4y+nq+61I?=
 =?us-ascii?Q?Fyb5kh7Mwp8ewKgyQYI0gVfpyr/TURNjrZK+Xa1GtOSEzzDiRPObhOALt7Rw?=
 =?us-ascii?Q?DCgpAWfk9hU44J/DnKV1h238YDBx1N0rd3gZSQ7pjmjJFljsnjv8RmOOB6pC?=
 =?us-ascii?Q?xbvQf825vBNpyqR9cRvQE/dzVuMrcNx6S498ouF26cAA7Qzclg5LbmUUv+fd?=
 =?us-ascii?Q?xukOx0gmtWRFRH/hP/dwlrECs1hdkJ6KMZEJmyPGkke6ZQhRWIL7BOTcHvSt?=
 =?us-ascii?Q?gq7jhXiZkslWMW2KWbTQV5OIpSWJ9sZnnIBWO4jPJhI0MroJIanIlf1sl+G7?=
 =?us-ascii?Q?j8FliohGtRuX6AERothLvWGPGoKOxi6oxIM3RwATfZOaCyJrjn0Icgz91+PY?=
 =?us-ascii?Q?us3oCoaTSyudbT/kja2zxOAl3RvT3N6afjOpx5YZrFjfRAhL2IMIKuP2AhS6?=
 =?us-ascii?Q?Cvm6fuCbszOnAGvMflqbeVz4uyCxmACdfpymbiaoahUxFwu/y6tT8ZJL7zMv?=
 =?us-ascii?Q?GtF0Teu7/wXek/Py503yi50dGqdrLYMYXuYXA45pPC+upjY0ClCUsjKgeorM?=
 =?us-ascii?Q?wvHn0t7/2Bb/sKiHBy7nj/y0LH15Th4SY0BhGs34N46PsD8whnJ7gBn7gJOZ?=
 =?us-ascii?Q?KQuA7x9xQiNGtMROAsq+Jd6qN/88aHbNJnHs0/zdTLJry4l2N1b117/Vdu9h?=
 =?us-ascii?Q?zc+cLuD4Hr8ilVeUBVTsWWBNeatcgFU4a9hdHLiN6OmZaeivi+/oYzBnd0V8?=
 =?us-ascii?Q?HR++pIsbMwDj3QwNvvzUqFjg/DSv33KkDRfiJ1TbgZRfs1FWxDyO1aZfbUkC?=
 =?us-ascii?Q?YV89rN1nNKFEint6+wPQ0haDG+tO1FN7fwq/mmmG+ggXHxGVkAepjsa+vdt/?=
 =?us-ascii?Q?puY12MG+PpnjP6KBA4eA1irYDyX/OtTkUsYddSBdvqpW0aAscadvTJz/BLAh?=
 =?us-ascii?Q?BgxN/K8bWHvvJ9W0B7Xp+zIJgEYvP1D4f1MaQiqqcMoWkvfiEVxif9RDjAa9?=
 =?us-ascii?Q?yt1ihOLzipDTzlUNNP8ummhIiIhDWD6orBuF/keWZ3gDD4K/eytONdWWBJRj?=
 =?us-ascii?Q?3CWmL9UrRpkoScYZHX05LmucuqNmOetlu143PdfWiPSi/IJxLSHCJWedPF6r?=
 =?us-ascii?Q?wuOvARBY/3q1zc3zmPbylBIdZKA7CuaqA7N8KBiPTwFEn6GvYd/oSagYFnjs?=
 =?us-ascii?Q?qXVd3R2SEMTMY3Xw/sg2OTt6mVY1DZOW2yfMPPa5nIyEzbdgTquEdpDnJOsA?=
 =?us-ascii?Q?2qHCy5qQabiR4+TKEhs6TjERdJBCWmQqfEoTghvO2EbJXWCV1WcMX9lkPX37?=
 =?us-ascii?Q?D+GtuSHDwkFGwJj7gYWiIdaDRAjiRluPHftp8E5AxYCnkbK+049B9v9KXLBT?=
 =?us-ascii?Q?xcWBKrOrk/c/Nl7u2iWXA2B8x3icmkObHK+Iqmtz5Dcbn/Yn6Tkyv3gSHoL/?=
 =?us-ascii?Q?I4ymL/SpH3EPEv8NKlE0w04lBP+rJcp2iV79Qig5skN3AO7X7Kp9kfM/DHVx?=
 =?us-ascii?Q?4EN9DZRJYTrcvvmcSOE0e7lIuANAlI6fugjZicC6eItLjER0t/C9fBfqzp/g?=
 =?us-ascii?Q?wEoyBOxOBCTLL++SPK5h2zxs/saC7go=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72195b22-064d-4161-aebb-08da4ea7d847
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2022 08:20:02.2521 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B6d081beGBfBm9Mqn3vVY5BiXxXSlloZf1SGBRjBmgcAOFjLihyBMOym+RCLTrcEQ+Sg+QH5x1bKVpl+LEVUlSrxhAzygvotc1WEbrFGZTs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR10MB2044
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517, 18.0.874
 definitions=2022-06-15_03:2022-06-13,
 2022-06-15 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 malwarescore=0
 suspectscore=0 spamscore=0 mlxscore=0 phishscore=0 bulkscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206150030
X-Proofpoint-GUID: TwE7d9Tqmw5Ecy9abozbGwDZazW4eUOt
X-Proofpoint-ORIG-GUID: TwE7d9Tqmw5Ecy9abozbGwDZazW4eUOt
Cc: alsa-devel@alsa-project.org, Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 =?iso-8859-1?Q?P=E9ter?= Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>, kernel-janitors@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, Yang Yingliang <yangyingliang@huawei.com>,
 Mark Brown <broonie@kernel.org>, linux-mediatek@lists.infradead.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 YC Hung <yc.hung@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, sound-open-firmware@alsa-project.org
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

This should return PTR_ERR() instead of IS_ERR().

Fixes: e0100bfd383c ("ASoC: SOF: mediatek: Add mt8186 ipc support")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 sound/soc/sof/mediatek/mt8186/mt8186.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sof/mediatek/mt8186/mt8186.c b/sound/soc/sof/mediatek/mt8186/mt8186.c
index 3333a0634e29..e006532caf2f 100644
--- a/sound/soc/sof/mediatek/mt8186/mt8186.c
+++ b/sound/soc/sof/mediatek/mt8186/mt8186.c
@@ -392,7 +392,7 @@ static int mt8186_dsp_probe(struct snd_sof_dev *sdev)
 						      PLATFORM_DEVID_NONE,
 						      pdev, sizeof(*pdev));
 	if (IS_ERR(priv->ipc_dev)) {
-		ret = IS_ERR(priv->ipc_dev);
+		ret = PTR_ERR(priv->ipc_dev);
 		dev_err(sdev->dev, "failed to create mtk-adsp-ipc device\n");
 		goto err_adsp_off;
 	}
-- 
2.35.1

