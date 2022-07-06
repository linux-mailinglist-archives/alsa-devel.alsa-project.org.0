Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AF74A568513
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Jul 2022 12:18:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3C6A916BC;
	Wed,  6 Jul 2022 12:17:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3C6A916BC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657102720;
	bh=xW3w4F/inbahLqBVaj6k99OmQiLourp2CLKRSc7/FBk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BAt3wpv9OjA/oOymUl3AuOfp6slcBsb8MrxbWxG+lLMXJ1r/V1RKXMALrltbqvBO9
	 x3hQsPIKm4cp91GDOIOiZtEq2g+3NbiBerxFLq5mi2iii5EGHyM169CtIrWKZEu9UH
	 NaPB19vTC7aEsCJ0kRcyIz3N7MuqeGysTvir1a98=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F35C8F804ED;
	Wed,  6 Jul 2022 12:17:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 71EA5F8032B; Wed,  6 Jul 2022 12:17:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 52BB9F8032B;
 Wed,  6 Jul 2022 12:17:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 52BB9F8032B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com
 header.b="LQbYEsBB"; 
 dkim=fail reason="signature verification failed" (1024-bit key)
 header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com
 header.b="qNXXELIk"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2668RDM5014816;
 Wed, 6 Jul 2022 10:17:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : content-type :
 content-transfer-encoding : in-reply-to : mime-version; s=corp-2021-07-09;
 bh=sQ3UkWKzdbGcg5d/cC5PJFy9TGYTMumtT9hoXJfB6Z0=;
 b=LQbYEsBBjsoKaR5KVwgt4zpMdEgpuIW6aQoEqeS56coAaVjagI8WKfkJin27+2ci5qeU
 X7CGSTUFvqA7qLSnVgm2urCEGbpXhnsXCl22kGQM9D0wHHBvcYJh/6Iv791Nnaeo14Ce
 gVeCw927IoEpr3rKqIpX8t60jpx4Y8v9ZuX++aCb/ZP7BCBU46T/WBin8E+gYWi94hbE
 ZHo0cQCVMA2Hh240W/009AB5ejqW+Jxxit2XDJhc4v0wEjDaXOdb+6WenQXeb7vbs0an
 uA9b/pCCp9bzuoux7AF+Bsutausd+mwOf7LZzcMvCq1ui7eg7nw7lZZyXgIozkNLd+xs hw== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3h4ubyhjdv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 06 Jul 2022 10:17:22 +0000
Received: from pps.filterd
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 266ABc3e007631; Wed, 6 Jul 2022 10:17:21 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2108.outbound.protection.outlook.com [104.47.58.108])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3h4ud5y3nc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 06 Jul 2022 10:17:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JT/VhqZZggkX4rsL7eRcG2wwQTUIyAgeNFy12Alo+0K/6hKFn9HOVatrSqtfWZ0oQVeCWNgAtj9rACiYHjmZc1tRuTu88+imfGuLyX4S4WKjKOYJi1FTy3kKxqIS5ZwlVC45fDYwFm//tBUYCMwM8UB+Ovcy7kRuLEukwK2lvgyRkggI5j1RZoXpQQLiYzoK8edjMghr/NP+ZLEV+eil4H4gmAVxgTVO6whY/dvD5+iHt93jCJgVaGkTByf6JScTGbdLee7PijZy+gEcZP7rdDnQN88Hhl8UebMiSJ/tDsdy05zVGQJ7U5ehVgxJaPZC5sMyZYfxY1MgdxPyt/KHIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kH/M9H54+k8HezXBrXsWd4QRwVoR7rLaubs5/00wvzY=;
 b=GImF5i9wdJiOMknY86NM1BR2M294+xzhDWOSVlDXTbkE9N5gIfK6q5LLG+nx44nji/9woIcgUKQysQdaesdJRExTe1IOeTByL1y8sk4vFfMviHBF1wZbOgAVGQHGpMdjjy/EMlzWLzCRMTdgAPsPZRwyMk2G02Ul1H85dkP9sODyicvLWTOlPCL13PZtLpBPPhIkrACjFNfu1aTgHM1UI1PWzROw/vjW3rPOfz2pAI2/ogDBWpOzDis1y7G+w1SlOOZ4YTlMBAcvqu5gj+jkEmts+iCDw181EXoLdZk+xUDwKFmqw3tr4VVreyJR23Ehc0wIvf5Az88rQJcG7mDgvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kH/M9H54+k8HezXBrXsWd4QRwVoR7rLaubs5/00wvzY=;
 b=qNXXELIk+YvqIV9LvKOzadMXOprR0xA3cSLoXe9/Y8RqKjnav133FHQ0O7QFfPZRKw6CA4Kyg3TPkala7lFkjo5wqxy1bhCqMIJspJVNO5W4ymbuNLZhDPbVj/Dtds3iPQ7zh3q+i9wUWJz3+2Bsx4o5PGWBdPk6ZkeMH8wX/iU=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by BN0PR10MB5093.namprd10.prod.outlook.com
 (2603:10b6:408:12d::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15; Wed, 6 Jul
 2022 10:17:19 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5020:9b82:5917:40b]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5020:9b82:5917:40b%6]) with mapi id 15.20.5395.021; Wed, 6 Jul 2022
 10:17:18 +0000
Date: Wed, 6 Jul 2022 13:16:57 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: =?iso-8859-1?Q?P=E9ter?= Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Jiri Slaby <jirislaby@kernel.org>
Subject: Re: [PATCH] ASoC: SOF: ipc-msg-injector: fix copy in
 sof_msg_inject_ipc4_dfs_write()
Message-ID: <20220706101657.GA2316@kadam>
References: <YsUzQPyZYMkhN/Q9@kili>
 <4cf393e1-00f6-2b5b-a5f5-9f555fdeafdc@linux.intel.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4cf393e1-00f6-2b5b-a5f5-9f555fdeafdc@linux.intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JNXP275CA0002.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:19::14)
 To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 02fc7aca-8f91-46be-1bf6-08da5f38b4d4
X-MS-TrafficTypeDiagnostic: BN0PR10MB5093:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LVb0uctgAssiIPS4Od856sVjWjljGNg1FVR28uPTtNDC5JBy0cTakBL1mK0zj/O+Fph8M8M/BP42ivJBHbTsuQrwN3JuAMP0BwzyLC6R8xo2IW/5IAfm/6vwaIDxN2ISAXUcSMO6dlUot0T6c/hPt+HgU6vo3kxVM2kYUQuSX60N2sr2OWo5WdXhRkJF095m9YYqEYd6p3yJOIR/BQOI+ysJPsYmFpFFCiHbUMe3EMbwZ2XvEttfRuvVX6kLUqGktfa4kb8pWsY3K/ELbzf/NSusB17qDGtlXJnWjOaZCQiihotdOhJOdXHJq82RK93w4+yNVIVFOT00uHCKkRz8/nJtnojS8xhQ2Q1y5FHb/IMm4ukQZxU4aUuhsSTYYZFxCOA7+vZxGUz1vhrLgIyGGlBKH3uoRXyBFvBTJ8gjrvZF0kWIxRiMKZzW1Vz2rKqIDXJjINw8WUMQgrRlw/+/rgXvvB9iwsCOBCWynv/5ip/rYSzvP8E2JsM5qZE9vOoZfpdJIpGfRc1CEhwAqCuPnyA08vpm66l7x9mLJ0mD0KCyw4hSjKApe4B/SsK3p7993tBmcjBHTleWCi+mUbXpFW0gSCQQa8ZidKxAhkKOROH3RLZ/x8Ozczgv6bhnhxNxjvWnepJz0VoxWG/owWODZcn+gIZnZWOYCA1MyqtTwgXscXgNs3ZqnGwxy/Rw/9dJ1ZeD/GNwc/Kx36Eh4alWB4PJrUqSUHyxnkRzlfUEwbX6UCemzwGiE5q9Yx4onfuoAqk8nwOkaTc/pEE1hjseWJUgFMuuJwdXVN4Ga9cBUDmejCJpkEXrbEgpL3ZG9+5G
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(7916004)(396003)(136003)(376002)(346002)(39860400002)(366004)(8936002)(1076003)(6486002)(66946007)(44832011)(478600001)(33656002)(86362001)(4326008)(38350700002)(6512007)(8676002)(9686003)(33716001)(66476007)(5660300002)(66556008)(7416002)(26005)(186003)(53546011)(52116002)(316002)(38100700002)(2906002)(41300700001)(83380400001)(110136005)(6506007)(6666004)(54906003)(66574015);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?EqWKo3lXizc5MkZs6s/OKql+zfP2sJXtpQF9i9f/X7BsE28L/Fn+P41J2v?=
 =?iso-8859-1?Q?Vtxjl7Um9sid/dMSE4IN/f30gJWQfEJe1A4OcY4yZ1AcQ2BzJJpz/uXoCH?=
 =?iso-8859-1?Q?A0eG5lylRBn9I19CRYUzCrPoRtIUPtKegNKRozqrSF1qUO8mPni7yOjrau?=
 =?iso-8859-1?Q?dwLjd6yFcq+ixjUIrNb+fKfAeThRsPgWX+2jJc7m23qhl27Jr1Vccx5Q6R?=
 =?iso-8859-1?Q?F4m9hSF9Wa9NirjTRicPBNRZ3HqVLGYPhj3vUwCxZrOEJEen4okfNv5jPZ?=
 =?iso-8859-1?Q?OPDG0k5YX8NcIAimv65G8RNatENFhUeCS6+ta1aitCzNyGo4ZhzH6eLvnV?=
 =?iso-8859-1?Q?xl0/NbJDz9XnhssqmyvrNQQsK4vWtn2NthpiHQqOX3squTEWl4RrOFGZ7p?=
 =?iso-8859-1?Q?TlXT0hBtPUySHU824g69aTPJ9p4duar6lFL9oIWFHknOecvLIiSDmoAb13?=
 =?iso-8859-1?Q?9dpzlHmqlG9z1G1I95YmoLQWk5nxh0ov3IJWOPHAu15HTcYmJFVEteULGS?=
 =?iso-8859-1?Q?ppORFv7LrqqY4vy+4EiCkATOUm4e9JrJ+A/HpD4S035paPmUtUmkxieqaS?=
 =?iso-8859-1?Q?cGkOAj10Ls+cLNgkiHpfp5WyIayfidbEAQdJYgpWx0zg4M5W5fKnI0X0y8?=
 =?iso-8859-1?Q?LwSD7C6K9qbPq+LUiMuCLIwLxZQocnxNBN+CAFDYGREAu4w0buviIkYqFX?=
 =?iso-8859-1?Q?SUZhNq9Oy0g6aKr9Qc34zqUx4Ha8097LIqBVv5s9thTFTM7wpi0CKXfEoc?=
 =?iso-8859-1?Q?n1uiZ+0DEub3/DSdSKVT0oOA1er2IToiGwzqG+WU8FEa/twYABSPWwStkE?=
 =?iso-8859-1?Q?515QupPrBFuvhxiJ4zsqI1QQX+JBquv3Z475SqPl2mOlcA1NTYgtNWDOVk?=
 =?iso-8859-1?Q?kK4Hpi+hzEinGn6AMNHbKmS8bsTOXoPunEReJut+nDITs6jI8t/DjfPY2d?=
 =?iso-8859-1?Q?X/T+Q+gx9k5v+v/U2jvPEdx67J9MKAI6ldLmXRO6CI9Lkb+vzFSMgr+JNS?=
 =?iso-8859-1?Q?eZjQN9qSI6hInHvoH38s/K7N1affUNLQC7QRT39jHpj/diwGGXHs6tFYuQ?=
 =?iso-8859-1?Q?UtY5P5jdgvM0LNfj1Bpl9qBMTus+3RZUngPQTowBZh1D2kxBFG27Isy4A9?=
 =?iso-8859-1?Q?yJXsxp4njxlyKLVtRS96Up3pZICbrrW/UiKIeK+8hXf9skHZlKqTxOhqy+?=
 =?iso-8859-1?Q?k7KgS8rJWOZfu0sVZjM9CAGEIXQKT+dgNHhpavoHgFjhOigKivlHvIfA3M?=
 =?iso-8859-1?Q?yWJ6NJPQnBLG0jzYFjEAkw77vr5pclb1w0xPvJmrblc0X7UzD6U5cE/0IB?=
 =?iso-8859-1?Q?I+5UQmQDHusRCMtUHcw4IspdlRCKJPIXX3e3dz6DcrDO2e2fHaCm08Ed1n?=
 =?iso-8859-1?Q?1hgn2AX6De4/dq4l2KFoSzmww6ZEn2tFulLRVLBWkIgKCv1UjrXTVlrtko?=
 =?iso-8859-1?Q?akBsh+Bc8bCXW0jEgogo38jVt9KIs0j/fBNjOJXq5UyEdTr3r3j5dW6hqz?=
 =?iso-8859-1?Q?lXIk4VqVGYuYCYLdxE5Z56AQozLOBka6nvm9bKhUt09892hVDdO1XifTtQ?=
 =?iso-8859-1?Q?jGEBWz7TMlq8gmlVR1qTDgBdop962bQpS6QQUsE/JinQAaJHNwmT+WTCpj?=
 =?iso-8859-1?Q?HRcp1nxqym7BPJtSeV5DmaTKwPDrdDtvn6Ne/5H7X0JAZMCSG4ne8PJQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02fc7aca-8f91-46be-1bf6-08da5f38b4d4
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2022 10:17:18.6859 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mokTPy7W87g+vLWTp10HjvToY6HuCqPoYDZx2xhnCfnnWdnzup5ssLBZfIIMz7iuG97y0/jXBtZ/CGer5jwEUon4ZxZiatk235egyTqIhCc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB5093
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517, 18.0.883
 definitions=2022-07-06_06:2022-06-28,
 2022-07-06 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 suspectscore=0 phishscore=0
 adultscore=0 malwarescore=0 mlxscore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2206140000
 definitions=main-2207060039
X-Proofpoint-GUID: CW9TpTkJquUUqXVoAKcHMRXWXHkCMZrj
X-Proofpoint-ORIG-GUID: CW9TpTkJquUUqXVoAKcHMRXWXHkCMZrj
Cc: alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Daniel Baluta <daniel.baluta@nxp.com>,
 kernel-janitors@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
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

On Wed, Jul 06, 2022 at 11:55:33AM +0300, Péter Ujfalusi wrote:
> 
> 
> On 06/07/2022 10:01, Dan Carpenter wrote:
> > The bug here is that when we copy the payload the value of *ppos should
> > be zero but it is sizeof(ipc4_msg->header_u64) instead.  That means that
> > the buffer will be copied to the wrong location within the
> > ipc4_msg->data_ptr buffer.
> > 
> > Really, in this context, it is simpler and more appropriate to use
> > copy_from_user() instead of simple_write_to_buffer() so I have
> > re-written the function.
> > 
> > Fixes: 066c67624d8c ("ASoC: SOF: ipc-msg-injector: Add support for IPC4 messages")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > ---
> > From static analysis.  Not tested.  I believe this function is mostly
> > used to write random junk to the device and see what breaks.  So
> > probably it works fine as-is.
> > 
> >  sound/soc/sof/sof-client-ipc-msg-injector.c | 27 ++++++++-------------
> >  1 file changed, 10 insertions(+), 17 deletions(-)
> > 
> > diff --git a/sound/soc/sof/sof-client-ipc-msg-injector.c b/sound/soc/sof/sof-client-ipc-msg-injector.c
> > index 6bdfa527b7f7..e8ab173e95b5 100644
> > --- a/sound/soc/sof/sof-client-ipc-msg-injector.c
> > +++ b/sound/soc/sof/sof-client-ipc-msg-injector.c
> > @@ -181,7 +181,7 @@ static ssize_t sof_msg_inject_ipc4_dfs_write(struct file *file,
> >  	struct sof_client_dev *cdev = file->private_data;
> >  	struct sof_msg_inject_priv *priv = cdev->data;
> >  	struct sof_ipc4_msg *ipc4_msg = priv->tx_buffer;
> > -	ssize_t size;
> > +	size_t data_size;
> >  	int ret;
> >  
> >  	if (*ppos)
> > @@ -191,25 +191,18 @@ static ssize_t sof_msg_inject_ipc4_dfs_write(struct file *file,
> >  		return -EINVAL;
> >  
> >  	/* copy the header first */
> > -	size = simple_write_to_buffer(&ipc4_msg->header_u64,
> > -				      sizeof(ipc4_msg->header_u64),
> > -				      ppos, buffer, count);
> > -	if (size < 0)
> > -		return size;
> > -	if (size != sizeof(ipc4_msg->header_u64))
> > +	if (copy_from_user(&ipc4_msg->header_u64, buffer,
> > +			   sizeof(ipc4_msg->header_u64)))
> >  		return -EFAULT;
> >  
> > -	count -= size;
> > +	data_size = count - sizeof(ipc4_msg->header_u64);
> > +	if (data_size > priv->max_msg_size)
> > +		return -EINVAL;
> >  	/* Copy the payload */
> > -	size = simple_write_to_buffer(ipc4_msg->data_ptr,
> > -				      priv->max_msg_size, ppos, buffer,
> > -				      count);
> > -	if (size < 0)
> > -		return size;
> > -	if (size != count)
> > +	if (copy_from_user(ipc4_msg->data_ptr, buffer, data_size))
> 
> I think this is still needs an update:
> if (copy_from_user(ipc4_msg->data_ptr,
> 		   buffer + sizeof(ipc4_msg->header_u64), data_size))
> 
> To skip the already copied header.

Oh yeah.  Thanks.  Will do.

> 
> Or without a rewrite the fix would be simple as:
> /* Copy the payload */
> size = simple_write_to_buffer(ipc4_msg->data_ptr,  0,
> 		buffer + sizeof(ipc4_msg->header_u64), data_size),
> 		count);

That doesn't work.  Simple_write_to_buffer takes a pointer and not a
value.  So it's pretty common to do:

	llof_t dummy = 0;

	...

	size = simple_write_to_buffer(ipc4_msg->data_ptr, &dummy,
			buffer + sizeof(ipc4_msg->header_u64), data_size),
			count);

But the simple_write_to_buffer() function is kind of bad.  The only
thing which saves us from a security nightmare is that it's mostly used
in debugfs so it's root only.

The problem with simple_write_to_buffer is that it leads to
uninitialized variable bugs if we don't zero out the buffer at the
start of the function.  It returns a positive success value if it is
able to write even one byte somewhere in the buffer.

The start of the buffer can be uninitialized if *ppos is non-zero.

I think I have looked through every caller and I have not seen one where
we care about *ppos.  A bunch do the dummy = 0 thing.  For the rest we
could just add an "if (*ppos) return 0;" at the start of the function.
These functions are writing a line.  Just do it in one go.  It's not
like the rest of the write functions are set up to handle partial writes.

So in other words, you can find a code which will accept a non-zero
*ppos and it's not going to crash, but the data from the user is
invariably going to nonsense.

The end part of the buffer can be uninitialized.  A lot of callers
address this by adding a check:

	size = simple_write_to_buffer();
	if (size != buf_size)
		return size < 0 ? size : -EIO;

That ensures that *ppos is zero and that it was able to initialize the
whole buffer.  But if you want to fill a whole buffer then just use
copy_from_user().

The only advantage of simple_write_to_buffer() is that it takes both the
size of the buffer and the size of write into account.  However it's
probably better to just do it manually/explicitly:

	if (*ppos)
		return 0;

	...

	if (count > size_of_buf)
		count = size_of_buf;
	if (copy_from_user(buf, user, count))
		return -EFAULT;

Looking at the sof_msg_inject_ipc4_dfs_write() function again, we check
that:

	size = simple_write_to_buffer(
	...
	if (size != count)
		return -EFAULT;

This ensures that we wrote as much as expected, but it doesn't ensure
that we filled the buffer.  But since this function is just use to
inject garbage data as part of fuzzing then re-using old data is fine.

regards,
dan carpenter

