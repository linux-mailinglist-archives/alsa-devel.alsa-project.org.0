Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E8C43D710C
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Jul 2021 10:19:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BEF951B01;
	Tue, 27 Jul 2021 10:19:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BEF951B01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627373992;
	bh=7B/G4e+2P90oCKvCKfnPpmF6zU+pAfbpUI9Bn/2qE3w=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=eu7K/ScK7QEges1J6j+dgknnpXM//iz06F8ZPjHbLp6k2qa+lfGc8HUwj90xXtu/J
	 fhxMohYuehi8eYhfwGSPWYGCYd5p26vFrUK4VBIbHqgvEw+pPUUXYsWJ7UVhdxSGoM
	 /2UlYz0UW+NVQKfm7+HgvLRLtI6151cFYmSSkq08=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2EF22F80276;
	Tue, 27 Jul 2021 10:18:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8BF5CF8026C; Tue, 27 Jul 2021 10:18:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, MSGID_FROM_MTA_HEADER, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6BCB7F80212
 for <alsa-devel@alsa-project.org>; Tue, 27 Jul 2021 10:18:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6BCB7F80212
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com
 header.b="QNAdZKb0"; 
 dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com
 header.b="Xk53X6od"; 
 dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com
 header.i=@oracle.onmicrosoft.com header.b="quXv66vn"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16R8BkvF026606; Tue, 27 Jul 2021 08:18:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=zZ0n56n0OCkXTgrnNKQ/BHZMkyoMv1vPeC5NKrJPAM4=;
 b=QNAdZKb0CxLG+8Vk/WWEtIwiB+v3TylYAGMV8SlL/s3EyuocP3xs6Cu3064FIinHJS7z
 zXI9Xgo34KqtjcSRCvUqHoC7fd+aQxI8pJ8ZhrYEEU/MGSKU1TWY5+vhtwItRFSj11iY
 jgaSwFQDTsIhEubRsEl/hq2uPoKDdqmf+BCYzfTt12u6bidzOEk8NswJaJ4wptZDzTiF
 G1jgVMFu/S2CxgCLPxOuI/m1CFaXaSDjuf77m8k+hWhZQ9b7l5J16Jbre6oob8ExsOkL
 JrYl3ki23Ntbs2PIkPj0i9bdPaEcLAfYgJmfCNZdVzmQ82LV6+0l43u1fnewUj2qTppA pg== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2020-01-29;
 bh=zZ0n56n0OCkXTgrnNKQ/BHZMkyoMv1vPeC5NKrJPAM4=;
 b=Xk53X6odfcdCQzMv7XcNvT0Z6CAd2TY0GVGuqDhUz9Y0bdtT7RRplpBc5iN1wMEj0MZh
 x2L1WA39OmaBlv4nOPlJGp9Mb6MvjaY8LEYExxuJezqZ66bQIHRd3+qBb6splz3L/0Zs
 PiYNi2YVf2NuaMHwcoV9sKjamiRJ3x4Da/GOq4h4wrzYb3p6RW9tVNstajHguySSLAUI
 KCHOJcamif/wp5ahcnTHrQmQbTskYUYvGwL9abuCgjGWZcVNl5jZ/N0SKjfTaWpdONrr
 2AC5H+YV8p0af+BuvmTcubboFTAHlK/JsELy83vDTEwkjNwjTprUnKf0gscG0TAIqt5s LQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3a2356h2mm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 27 Jul 2021 08:18:12 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 16R8ArEs148897;
 Tue, 27 Jul 2021 08:18:11 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2109.outbound.protection.outlook.com [104.47.55.109])
 by userp3030.oracle.com with ESMTP id 3a2352hdw6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 27 Jul 2021 08:18:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Uj48WSgl7b9FZig++aO9GFGF9up5wkSbF2BXxHQVdcBMJmrmUp2UutlKxBPPNi4w+z++z/2sBGCu5fGGCMh33DSAkqBeWWSUBCxL6anLC9d0R+Wduh+rFTesZ2ETuyde1ocF0LWWSkkIN8Pux7Hv4kvhrikmYy/oZrqxBCRRRz4jCRoFPyt2zccmPTZ2WdBagyAkNOUywkcONcyTMVa0LCTudZhQIOYe8FUnL8ybmcHm3CSpmYz3ql8FsT0hJ601kghgikwikY8l+8q+ILbvi2VTlHfL+N2CyCUoDWFhcd9ELQfIZ6okqLFL3bZtax7sfpL6ggk0+wk1lQfsddpTcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zZ0n56n0OCkXTgrnNKQ/BHZMkyoMv1vPeC5NKrJPAM4=;
 b=NQEr4wwWgG5kF06moViBBMW3Tg5jdJEy7TgUWHcEqW2V/BqPssjbAVupdpFdOYS0SDr05F3ULCP/YPzN0iMs7Oeb5LKpMbz7oskn+tmADy7Xwsg0PbQ6Y4H7jf7CDiUvbJRZLX6GZCjQF1eJTznIRFvValvCbukZLmg5/jZ30r88G9dxCnTo76O4fymZ+pyrupeLhuzNfWmuToi17VwxRXf14ophmALFTdYJPgJfwZsdQoOEjTak2wA/1xTcO3YmlK0A5/GdrFaNOYbm7hDSgKRiJFhAVyV2Ge87UcY01t/9XbP/3VOAv1tncCajRlAbbcSM0kXgn/rOjboST3neBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zZ0n56n0OCkXTgrnNKQ/BHZMkyoMv1vPeC5NKrJPAM4=;
 b=quXv66vnQP8gLgj5GvS+HdUTmtZtJMyHwSr2E6R50cxpbje9eiAVtAyLI1HgINu9B4NBuH4dMgzQhaNA/D7XPKYuRoZLzobSqdhMzzhaxcbjf/DhsZ/tfITqb2EpxbPcajwkkrMuWwXzGVfe5E5TWSwxCf9TTe+V0tMWMstLCz8=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by CO6PR10MB5410.namprd10.prod.outlook.com
 (2603:10b6:303:13d::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.17; Tue, 27 Jul
 2021 08:18:09 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268%7]) with mapi id 15.20.4352.031; Tue, 27 Jul 2021
 08:18:09 +0000
Date: Tue, 27 Jul 2021 11:17:56 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH] ASoC: amd: fix an IS_ERR() vs NULL bug in probe
Message-ID: <20210727081756.GA19121@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZRAP278CA0004.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:10::14) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kili (102.222.70.252) by ZRAP278CA0004.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:10::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.25 via Frontend
 Transport; Tue, 27 Jul 2021 08:18:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1d960c4c-4869-4f54-c7d5-08d950d7116b
X-MS-TrafficTypeDiagnostic: CO6PR10MB5410:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO6PR10MB5410BAA555CF1D1B49A77C328EE99@CO6PR10MB5410.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:227;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RQwF0gR8T4diD2NI1TuEv7Mct7uYcisV5gkSob2Kx7F3Y/uVWyeUzbQ4PAhW0aBd4ziDpPqYjMfri8IVv+o/iSKz3R+rN7GyDDdE2d5zTUYzUVXeLdFF1YQESapaoC7sPbEGNG87+WqbtanPxVMVcuGRlSyOPoGur3+mTUeN1Oyklbdq0dhQ37yFezw2I4VZ4u/M+va7hUS5uztikaf3XXH7G+z6ffJoEbtMhLl+EYMByPwTXc7zNIxx7Ql/ejKOSlMo4PY1j1Jj414iARPW/qfcP/l8b3LxEapXbBPdTtHjce3VCLuoYg9wkyZ7eMEtj1CB8DzCOnmWyVUUj4o/R1pZpYFNHh0Rzix2+Cr4kUawEqFomRtJgwPySis4xByPZGu+u6Omaz1kZMUsLhPTszxsnnJXr81p5qyBEpGHPj3MEwMgDgQQXlmSj7Zh1HgHpKceecyT6ANYSDthNLmaxEqn4eqGvsu+SWX4xhkn3qK5tkei0VPkKurFTBeE5EInb8CNlARvD+bOuILEPunoc8b4fvlg+iuEcPAg7daztgDil2P9u1VWBzCtqzyZOdmK6mvmPuule+7L/QLTsw/tJ1CMYwO5QpMm7aVcruoHwkCU0AR8whIvHzdx6ulHXCglmI31VbTT/dy1MiSXiFokWQXu9qz5VRd6M/TmK/f5YN11WkDAUUNZZhcMSMVFlj+bEDTxmADJ0lLh9rlwrDksrA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(366004)(39860400002)(136003)(376002)(396003)(8936002)(33716001)(86362001)(316002)(38100700002)(4744005)(38350700002)(83380400001)(110136005)(54906003)(44832011)(6666004)(4326008)(956004)(9576002)(33656002)(6496006)(1076003)(52116002)(5660300002)(26005)(66946007)(66556008)(66476007)(186003)(478600001)(55016002)(9686003)(8676002)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?j1lHH8AtuF0YjEeTHF/EHR16KmfiU0BgP/S4rc2l9QIwlKzMChEWe1Yinamx?=
 =?us-ascii?Q?gLGsGyAWfYpBRbyu67p2tae7VCY6sk2iLUXUXVqu7tWVh2HmtTtgP7s97ev7?=
 =?us-ascii?Q?NEuelxetf2Xklqjgitk6ma7MIiPw8S5Tszzob1myOmfMmxdv7v636Y9fz/RT?=
 =?us-ascii?Q?dMlyodVe2ptLtWNlCCWIBR3iFQCKaVd0RSernLcHzwEXh4L1J5QKPX4pcclj?=
 =?us-ascii?Q?+dpPTbnBfas1qNaP4MCgRsbiaLQy/Ea2oKlbbB94x/LsNEnyZB9PZr6GOlzt?=
 =?us-ascii?Q?EG/wVdMM3dmEMu/4z6Jw33a2Dl5jodwtha1hPwN9W65TxnRa8DccykZNG7ML?=
 =?us-ascii?Q?l3wqhcTQGaQ+9DWXk9Ri8CFsoxebg07GFsBghJb49Lu2GMaoCZijf92uCENa?=
 =?us-ascii?Q?IrHKbFZOv8u19oGjRCvKJgCFAZYWr3JMa1jiZ7YZRSdVGgWb5uZ+d84fBSY0?=
 =?us-ascii?Q?kNIOw0cCYPt0ELlkUM1dNGtVEbZwpzrZ0Vbb2zYGY9MTcG4xKlcQCncs9tQP?=
 =?us-ascii?Q?mn4sXKhFs0stKVnS7RR+J7q0a//u/Y6eLbS/PiYdnBg2L3Oxr3xd2j8ePUrz?=
 =?us-ascii?Q?qC2jwQ3E5qg4LlLXCtpdEq33+Y1bE8g+lBVJIF9qNfSaOFglAAckOz8QLgeU?=
 =?us-ascii?Q?a4U/LGkx/uKIymSJ+ikHQwdxX5UtQpYn/IcINPQM42Vp/DcmwBu4co7rPMiJ?=
 =?us-ascii?Q?s2nsyvXMlNsCfu8/nzYM6FzKl5vLdAfaCjvrA+ReJlBqHiy8ZH2Xdc9RyHA7?=
 =?us-ascii?Q?KKxFr8gUWsHiD7vlHjY35zOCWfvfyJS/PGOdYGy2nGs0o1QkdN75UqmvMxf+?=
 =?us-ascii?Q?mTDZsjQSW8AEUGVyb7F9lvyaxOQ2F8BXdIcz/jJkwBU5NkbjhukK9AAZmcI3?=
 =?us-ascii?Q?gGz+yxZRDn4X6DT9c3uBRORCoRH2ajhiy2npQM760d0xBQhQPSgOP9UOAy80?=
 =?us-ascii?Q?oEetAvyC0moO+G2UH0ItXBxjcPyz/jsTWHFodn4x7H50ry5kZaPYhNfzi9RM?=
 =?us-ascii?Q?+eOMlKTIQNQTmI/nYaedPu5gdniTBOycrVcwk2LYhxVVZ6v5bheVMGZ/TP47?=
 =?us-ascii?Q?IA24k8BQkfhtekzZLfRHUOyLTVqX1Ge9dYXVZ6O8vZUZeOwA+jGFa+xqASKU?=
 =?us-ascii?Q?p+u6oSF8majwMdp4Pak8A9HUMr74MdNdM87aas9ICa7GCvg9LmFtayVMG9yb?=
 =?us-ascii?Q?UMeplmnW6A4IuYUQrlrn/7a+KzCQTRdqakoAaTZChsEU+wBR95IsEygLHhLu?=
 =?us-ascii?Q?lSUGIvjFc7jt8RTgkWMCNabXE4p1XNklzE2jAuu1crLyWQoHZ5G0kBM5JGkP?=
 =?us-ascii?Q?cs61kJM4rvvqFwGo1FGtCJoX?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d960c4c-4869-4f54-c7d5-08d950d7116b
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2021 08:18:09.3700 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G9hAeq0X13EhytZ9WbwRYFAwyYnNhMu2ety4u4/RoQXUBA7Ln4BVMcZW1WzEczgzJq3ijzsH+xwxmDTV0VTAUNniLk6vU9hMKa0GcYG7sVs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR10MB5410
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10057
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 malwarescore=0
 suspectscore=0 phishscore=0 mlxscore=0 bulkscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2107270047
X-Proofpoint-ORIG-GUID: pA91NNE_Q8Yy4j8_sKMe-IdqfrWyxubi
X-Proofpoint-GUID: pA91NNE_Q8Yy4j8_sKMe-IdqfrWyxubi
Cc: alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>
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

The devm_ioremap() function returns NULL on error, it doesn't return
error pointers.

Fixes: e550339ee652 ("ASoC: amd: add vangogh i2s controller driver")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 sound/soc/amd/vangogh/acp5x-i2s.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/amd/vangogh/acp5x-i2s.c b/sound/soc/amd/vangogh/acp5x-i2s.c
index 86b37c93c3d2..2705e57eb713 100644
--- a/sound/soc/amd/vangogh/acp5x-i2s.c
+++ b/sound/soc/amd/vangogh/acp5x-i2s.c
@@ -399,8 +399,8 @@ static int acp5x_dai_probe(struct platform_device *pdev)
 	}
 	adata->acp5x_base = devm_ioremap(&pdev->dev, res->start,
 					 resource_size(res));
-	if (IS_ERR(adata->acp5x_base))
-		return PTR_ERR(adata->acp5x_base);
+	if (!adata->acp5x_base)
+		return -ENOMEM;
 
 	adata->master_mode = I2S_MASTER_MODE_ENABLE;
 	dev_set_drvdata(&pdev->dev, adata);
-- 
2.20.1

