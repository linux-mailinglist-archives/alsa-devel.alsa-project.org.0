Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D5ED56BB29
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Jul 2022 15:50:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BE0BD847;
	Fri,  8 Jul 2022 15:49:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BE0BD847
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657288211;
	bh=hK28LofwzIc0den1GoZsIa/QR9wUCK1kltos+gA5gNo=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=vPXZbzN88D5FHt4ScXAVnXgFeXYtbvtAjSTg1ErlXSfl6B8IA3PA4lP5uycwmGZL6
	 2M/eZX+SNIEs3a/IgF3+YZ4uHZ6wWaO9QjpqCi6lJ3IiIUUj/Ngsl4SDr1isGGKt+w
	 WobEGAKEOIPBb/mnTzI2PsU78fLmfck8uceFv6vQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 97EC0F80084;
	Fri,  8 Jul 2022 15:49:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5DED3F80166; Fri,  8 Jul 2022 15:49:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 12EC5F800C5;
 Fri,  8 Jul 2022 15:49:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 12EC5F800C5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com
 header.b="Mxkk16+K"; 
 dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com
 header.i=@oracle.onmicrosoft.com header.b="aD3O+QmG"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 268B8Bko032572;
 Fri, 8 Jul 2022 13:48:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=QuIPYOGh3xrGs1jWHhe65y/C73jEWk4Y/ZiLUv4kXD4=;
 b=Mxkk16+KRMj90heYbcqa7qvenuSHLW7KCY8r7sgIYsKdk6CIa4uRBJ0YoTtzcovu3Xsc
 T/wcaVAvXT5fmm4fzs3uW0WLSmRI6uzWx9CyO2XIyLZps2vqw8gNB89rtqcnd2E5pjIu
 jcqIinzsh9R9Et4ISq/2DkAHShKPJEqey7YsqlUs2zwh4kj758XmekyHOpcMvvz4lXzm
 8vPfaOQ2A/ubO4HVgzsnnvLA3Jj08a9QdKwHQ5u6/slVn5TM6CaiTLGQiaikVz2x2a3l
 0xBB3fiA5dob7belP+hyPbG+CgJWdnvUDkgp5yHqUV7LQE/5AS3zzd5/CuUCjD+A0T7H Ug== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3h4ubyr6ft-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 08 Jul 2022 13:48:59 +0000
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 268Df8BB015259; Fri, 8 Jul 2022 13:48:51 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam04lp2174.outbound.protection.outlook.com [104.47.73.174])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3h4ud2pjvd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 08 Jul 2022 13:48:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EX+sUJnQrnCp6suPZ82sGq0mglooXsgM8NY6PMHHJqw+qfww+RIJ1ulSRVIdtlxWCegS/we+I5LwvW9f/8xssaRKpTgIg4emeLbMii7kWIIE2GZVN0ftu9FUPQPrEreBznzFx1UcXtpKCn9FuwgZoothqUCtqVsTPaf2sXFBDRdTZenXDUOGvNiCg4lPDwoBgbr5sZ7yQ845mw5LsokSTTAoaxe0tXHItGUiGZwEqpoJFw4JIpWdekFY8YfGqJ5SSY3kw77lGuy7qcJccRehq5SLN/Q4pfZgPwhi4X+941JW7YYVyldzs9ALvoQUTcWPg85MDBC0uQhoHkmdv3fjHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QuIPYOGh3xrGs1jWHhe65y/C73jEWk4Y/ZiLUv4kXD4=;
 b=gjRUBcOA/78/4S3nblITabw0yuz0SUdlaQuntgcWn+9Gu5D2+1AWl5M6QwV9kSloCCJunnMNi1Ck8vhHkieSdZ6jPPcxUHw2Wxu9bb1jc0X00r64TAIeG205QR9WU5p3bL/i4384grAGEwCscSh8phRXzXMtsH3w2Kkkl4C8006wutyEhWW4KS3K0Ur3E4X+8s5HGJdUuzBScdP4gmLRJR79c7Xz9l6fWWFhSY6OVYpcqD7gT4BCgXxwRi9v8Ma+0L9sQ8uki3N0nvIuqog61xqUKdZrQDinZfTnDGja1P6nmKpFuU5g9wwTgBaMnSXYkAwfATsh9kfLmZ4VoQd+LA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QuIPYOGh3xrGs1jWHhe65y/C73jEWk4Y/ZiLUv4kXD4=;
 b=aD3O+QmGJtsKWtrQ1hNZBal8JDwrb6F49R2TXoO0zE0FYPLZH9QkYwbxOOimp/9cIKk/qDUe8W5d4wXtsjfeuHErZRBzgutWFwvcYn65oG8clJZBHpa75v2lxJvZHN/h4htR/MLkhwdkY1SUdIgkyWU/Q5dnpb8CCR3lrCzaE2k=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by DM5PR1001MB2220.namprd10.prod.outlook.com
 (2603:10b6:4:30::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.17; Fri, 8 Jul
 2022 13:48:49 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5020:9b82:5917:40b]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5020:9b82:5917:40b%6]) with mapi id 15.20.5417.016; Fri, 8 Jul 2022
 13:48:49 +0000
Date: Fri, 8 Jul 2022 16:48:36 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH v2] ASoC: SOF: ipc-msg-injector: fix copy in
 sof_msg_inject_ipc4_dfs_write()
Message-ID: <Ysg1tB2FKLnRMsel@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-ClientProxiedBy: ZR0P278CA0198.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:44::12) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8be1fe44-c510-4a24-71f2-08da60e895c3
X-MS-TrafficTypeDiagnostic: DM5PR1001MB2220:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DPnXB0k1wwWeXZpol/vwAXiW8p1Mc118OXl523LQZU4B0irKZ6dq2Jd1RtkKHkLbwdjuu0q04WYUaoipMry3/IC4IDYCXmZVw9OIotrlxn5pRRvN7tv69G8qguDk8r5euuXw2BfHYJsUzM26RvJjz4Fx1nduBQerDko3xdIeQRvbDxgeCXV8H8q8m/IChvcOU5GTFkSKEPPgs31UhhsWoyuNY97yECjUZTh91JbuDR45L+c/eQqidC3de2cDu+ANbV25Tmr6gxiuB0pVwphOqDP+Ca8Xa0aOd2fwGFTBl2Mtk4ixiffmAcGhHca6c+HfxaWrumlVGLnGpF1ifsZmuq9hZ31NPBBRv5EMwvUzvdIHJx+THaj6duJXGt63w5M2+WWIrFbtZFJrQykIFk4fLiQ9t9RhDanAQa21YIv9J+bLmaFEUk6uGhgo0SvPddBLltIsyozYBeO3tUq1PWfzAfZEHiV51ryFqzAB95tkU5+x5D6Ixp3EUdHBtDuJAkWQfwbgJtVFOrCWXKEmnI4kuWNjtdX48oYddLYDA6GeQf/ItxLmepfNM6LNaZ/30tHvXZWtSD4RyVRj5RXLPBKYorWL5mQk5DPyVTy81QocN9Ux3uhL1XUULTyTdUqGCf5oUu1k6S81gMpQqdbs7T/uiiRXr8+9h75tHpVwo/FoEth4Ap+VzecX1DAqR/HqHLwNS6laWiOX3oW7OoKmzriiWMmJ9RlqmmWR/MUtlTTW9q/cahqlL0u/pxJBg04OS7uAYWTUhtHqoBUZYbw0+VIoUsuvf6vOSjG5SXQ3IoYjFWWHGl4Gx8GQIdkdO0mF7pPY
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(7916004)(366004)(396003)(136003)(39860400002)(346002)(376002)(5660300002)(52116002)(38350700002)(33716001)(4326008)(38100700002)(44832011)(6486002)(8936002)(478600001)(86362001)(83380400001)(6666004)(66476007)(9686003)(7416002)(54906003)(41300700001)(6512007)(8676002)(2906002)(6506007)(66556008)(6916009)(66946007)(316002)(186003)(26005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Lhox5IMT3MXykleg62CllkjWC0JjfyoTMnRBjBHv5jfC1ANcDXVPBRQ+o4op?=
 =?us-ascii?Q?fRyUM+9FYrj/c2IcPEN/6MUn8VlfUnsRVNJBeG/Uh/ryn3ULA5USkljrJ94K?=
 =?us-ascii?Q?kfVlavm1UZfPvweNcqkjjdBcI0+JkQ9bG30vzbkFKPWeuASRdZHL+Xlo+SOr?=
 =?us-ascii?Q?EMXkYlk1+kcoQs8g6yeDXuWKDIDqKuXml1lFAAUae9AlDOCf1lB+5jhg3bTT?=
 =?us-ascii?Q?rbaktT3k+aurhxPToEJIhCRcSZcJ1nTldw9CWpmrCvhX5FL9Q7qFOOXLg/Xz?=
 =?us-ascii?Q?i3nf0kpFEnn8nRB+6/KEPp28PJ3EVdxSgfW0M78Za+BFF0tBDHLJPfsnTodv?=
 =?us-ascii?Q?CJ+JZ1Rq/43PeIg0qh1q7XdxVFFkE452i0uyHFvV9oCC7TCyj6heQsYsX5E7?=
 =?us-ascii?Q?mlgXlxdzX8mBmI9l6EvY9Hg2VKUIy39IpHCQJs4xO7z09FQ93n9oNn46gWf5?=
 =?us-ascii?Q?PzfZxCRDGvjLjiD3H6eewrkcvgsT2RlRQTy+NoLDU2nc7p1zjNTGhGESOIly?=
 =?us-ascii?Q?r0Ev4hkqgt36zRmt4NUCMf/o9jR444l6zu1G2Pl+75gRKdIowPPjV13XgmVv?=
 =?us-ascii?Q?Tj2Q7fqRJSjf0SB08pLLwasPxXuqG1wrSGHInYjTLTw90Wl4jvnPJKtaBNT8?=
 =?us-ascii?Q?2xC2yS9jVqtrxTuPZ15BF7BkaDOQQoHG2c5LlICvGEXF0ra3x8YcceK0uwcz?=
 =?us-ascii?Q?LJXEASj8VfNJX3u6AVESVaSxmwhHYm2TlLJUG6eFFicydR6/NgA01R6mwLob?=
 =?us-ascii?Q?o1LXg7mUGX5EAq3jN6NcgbUyeDk/v7OcUhSqevrg4UMRln43yKMMU3zYqHYh?=
 =?us-ascii?Q?1c6pYUkHUMz8uHiq+gDqzFUzaNq5c2IUTidWaU0jkhjUdp0JjztgxdPqLmBe?=
 =?us-ascii?Q?Sjr2B6BS7aFayO5ZkrMI1STl/beLgkv38/XX81C3pe7V+ghyrgfzJh83W52H?=
 =?us-ascii?Q?aK5A1OJkm8pPg26iObGRYX68bewjLWTbK0lhu45XjR4N/M+OOblE+E/cdpF0?=
 =?us-ascii?Q?CHoeAK3f8Q/Go92pC6EOyQAvXoBchEpNlW5XbWSmgrAaFQ7G9adXvmdFTILy?=
 =?us-ascii?Q?2dxcHpCAKBUS7AaSCj+LrCdnBxNB91pQ1S9hxKZcGxfUYGuVw/JPY5FNae+G?=
 =?us-ascii?Q?4BD/TSDInS8gK2ej6D/cPVGDRO+XtOwgDSonT7m+ZThLtCgiDAUYrjmAKIJR?=
 =?us-ascii?Q?WRCN2PocQc/x08ER5mq3Q8i3RNcrriqPvYexLPoU7VaL7DmlfowZgOsRwqD2?=
 =?us-ascii?Q?zjULjqrDAxxCl68Gf44zhzWsdDI4dzHP861h5SnF00pm4Bl8StdUm4CNnUXe?=
 =?us-ascii?Q?1MpMP2Tn1p1KZXF3X6F7FIW0PbJkKIWiBjaWcm9L4lKRxZjo+jGCBu3lsv8p?=
 =?us-ascii?Q?TmGB72WaKZAs/EgWKAB1yqH4A5u1wjp6nGVjToVop53jM37EIg8pt978jr07?=
 =?us-ascii?Q?ymYWfrlRJgGZoENWDc1rQN0LzlCjTbLnpkTrZPVvgjYN79VjNZEpaAwS3OJi?=
 =?us-ascii?Q?0ERNViMkZaC59uLxKmK4dIkPT2F6L0iE8gc42VkBP7bTJOp1P9L7hVXFS044?=
 =?us-ascii?Q?LvwcnAZcsno3SWUP99bSJJB0fbB+An4VmohWnb6hhdOBHsmH+Z6DETpY0gJ+?=
 =?us-ascii?Q?Pw=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8be1fe44-c510-4a24-71f2-08da60e895c3
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2022 13:48:49.4201 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YwZ2ayA1vv6r0tkHHqcDXB/dVYSfgD+RJmWWbHvVV1ZhnYZSiBHMgtq5cg2KNVx5r8CJnR5mIdrlZlGcXR5zBQJ8uJGOBlmtJ4NznaaUizw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1001MB2220
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517, 18.0.883
 definitions=2022-07-08_11:2022-07-08,
 2022-07-08 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 adultscore=0 spamscore=0
 phishscore=0 malwarescore=0 mlxscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2206140000
 definitions=main-2207080052
X-Proofpoint-GUID: iJ4scz9CcSZsh_QQHEyv284XJf20hVZN
X-Proofpoint-ORIG-GUID: iJ4scz9CcSZsh_QQHEyv284XJf20hVZN
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

There are two bugs that have to do with when we copy the payload:

	size = simple_write_to_buffer(ipc4_msg->data_ptr,
			      priv->max_msg_size, ppos, buffer,
			      count);

The value of "*ppos" was supposed to be zero but it is
sizeof(ipc4_msg->header_u64) so it will copy the data into the middle of
the "ipc4_msg->data_ptr" buffer instead of to the start.  The second
problem is "buffer" should be "buffer + sizeof(ipc4_msg->header_u64)".

This function is used for fuzz testing so the data is normally random
and this bug likely does not affect anyone very much.

In this context, it's simpler and more appropriate to use copy_from_user()
instead of simple_write_to_buffer() so I have re-written the function.

Fixes: 066c67624d8c ("ASoC: SOF: ipc-msg-injector: Add support for IPC4 messages")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
v2: In v1 I missed the "buffer + sizeof(ipc4_msg->header_u64)" bug.

 sound/soc/sof/sof-client-ipc-msg-injector.c | 29 +++++++++------------
 1 file changed, 12 insertions(+), 17 deletions(-)

diff --git a/sound/soc/sof/sof-client-ipc-msg-injector.c b/sound/soc/sof/sof-client-ipc-msg-injector.c
index 6bdfa527b7f7..752d5320680f 100644
--- a/sound/soc/sof/sof-client-ipc-msg-injector.c
+++ b/sound/soc/sof/sof-client-ipc-msg-injector.c
@@ -181,7 +181,7 @@ static ssize_t sof_msg_inject_ipc4_dfs_write(struct file *file,
 	struct sof_client_dev *cdev = file->private_data;
 	struct sof_msg_inject_priv *priv = cdev->data;
 	struct sof_ipc4_msg *ipc4_msg = priv->tx_buffer;
-	ssize_t size;
+	size_t data_size;
 	int ret;
 
 	if (*ppos)
@@ -191,25 +191,20 @@ static ssize_t sof_msg_inject_ipc4_dfs_write(struct file *file,
 		return -EINVAL;
 
 	/* copy the header first */
-	size = simple_write_to_buffer(&ipc4_msg->header_u64,
-				      sizeof(ipc4_msg->header_u64),
-				      ppos, buffer, count);
-	if (size < 0)
-		return size;
-	if (size != sizeof(ipc4_msg->header_u64))
+	if (copy_from_user(&ipc4_msg->header_u64, buffer,
+			   sizeof(ipc4_msg->header_u64)))
 		return -EFAULT;
 
-	count -= size;
+	data_size = count - sizeof(ipc4_msg->header_u64);
+	if (data_size > priv->max_msg_size)
+		return -EINVAL;
+
 	/* Copy the payload */
-	size = simple_write_to_buffer(ipc4_msg->data_ptr,
-				      priv->max_msg_size, ppos, buffer,
-				      count);
-	if (size < 0)
-		return size;
-	if (size != count)
+	if (copy_from_user(ipc4_msg->data_ptr,
+			   buffer + sizeof(ipc4_msg->header_u64), data_size))
 		return -EFAULT;
 
-	ipc4_msg->data_size = count;
+	ipc4_msg->data_size = data_size;
 
 	/* Initialize the reply storage */
 	ipc4_msg = priv->rx_buffer;
@@ -221,9 +216,9 @@ static ssize_t sof_msg_inject_ipc4_dfs_write(struct file *file,
 
 	/* return the error code if test failed */
 	if (ret < 0)
-		size = ret;
+		return ret;
 
-	return size;
+	return count;
 };
 
 static int sof_msg_inject_dfs_release(struct inode *inode, struct file *file)
-- 
2.35.1

