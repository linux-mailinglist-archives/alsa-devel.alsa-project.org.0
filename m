Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DD0553B5D2
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Jun 2022 11:16:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B928016BD;
	Thu,  2 Jun 2022 11:15:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B928016BD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654161406;
	bh=qmpj/SakHOOVjvNzmpdVb/fjAIGo87Td/ROi0K1CzTs=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=J7pyG76+zgVdgXtE9tdWJ9jLpXIEXgS9oc+cXe0hDWsVaP6zaQDlvRYj75NtG1Pvs
	 rL6dJSf3gdYk/V64rqGEj7eld3ag5m18fqUjVGF7jmMGnjHVC/1Tw0AFuDhJFbzVrV
	 p26ULwB4pBWoNW0X5Ax2FBxjAWC18BDK7AqSl2FY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2CB61F8025E;
	Thu,  2 Jun 2022 11:15:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F353FF80236; Thu,  2 Jun 2022 11:15:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5A14AF80149
 for <alsa-devel@alsa-project.org>; Thu,  2 Jun 2022 11:15:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5A14AF80149
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com
 header.b="Qm672NjV"; 
 dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com
 header.i=@oracle.onmicrosoft.com header.b="YosQgc03"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2528TS6M020499;
 Thu, 2 Jun 2022 09:15:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=4o6Ru55pr9HuYX2SyIYHZ9uFq/u1PRGvAdzzoSAmSKQ=;
 b=Qm672NjVyJcfFvqjw8+H0+bT93aD9YQhsb73Ua+t1J7ErHpSsA8j2TCOxMhmwV3socJH
 HJkywqSfU+ZzXi/8kLU7UoUAeUkQcTHjkdROf5B3J3kw5PMr+xTuUDloyv622nCjtNrO
 C6u2Vz4NqiJrjjOp7f14AqSarzvsa0dxzajHEUho/m3/qmXcDIjciQpLQuuLw5x9gaw5
 w35Jx0QUCSkRnC+zBY8uapfm5PFR6cgStnxkLoa/YGcAi4MgiYs+SdLfwEGrQjclmZPN
 IN0Vob5xCbzJmXpL6kZq6fJSpxOg36GA6i67a9tuCdTFwwhQgw2+k4KfYMlAeiolWdos HA== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3gbcahsycp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 02 Jun 2022 09:15:41 +0000
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 2529Bfvl036097; Thu, 2 Jun 2022 09:15:40 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2104.outbound.protection.outlook.com [104.47.55.104])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3gc8khvnh5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 02 Jun 2022 09:15:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j0wtf8rbJ47sjU9ycVfc+cXVxS3S+zWD5x2YAMrMQa3MxYt8F/exIG0u02evObfV2sRenImN8M0ktAavWJzCQ2/EqdoVT8UibbtkJ5T9F/rl9yEn1TpO86a5W3ZdAsD6ZI6DjQhP2i+g4inovfiVexGqV9Ifk4Xs/iLtmLyfPHqtquqbeGbSUYFMj5EsajtSl7qDS+zRdw4JNVzW828qER3ZmDmssIFpSkplqmW/4iFGAIlKg0HWguHSA7CfdTXUNcGwQXWBHxZPuAzbt+9tVczJeQ/xfaq9ULaVZuLQf8JSwzPRWaCuG62TOZAWDeQOAzm4HrR7b5/zJiW7zseLqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4o6Ru55pr9HuYX2SyIYHZ9uFq/u1PRGvAdzzoSAmSKQ=;
 b=YbvZCnLC+IlkyIsIOsvqy3zYv2IIGUEeajrnOXet+8rrKnKyjhHT/u5RLVNs+U9y5KBkRvitTg9L1cnpsty2xP7S73PXyJ7qz31WWqmF97/FHxv266cvUNSFwKCBxGm0Pv+U52vRd5HYW8R3TZgrIKLAYi1sVdy6FmNS4/6rdHAaSjQGHhE7vXWHoKSzecwQCzy9P7XYMdm3sS7T0VHfTxyKePN7XUaNioTCufosnfnuXo8WUrLMInH/kU1xNYTl09p0/GJ6GOjjMSRGaHAdIdOtAN3ZBmp3BkAsxSHiWcJLgKD3KSpUT7xzk8Tz6OfL7awO9O2n9X2NQ1x+hmskNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4o6Ru55pr9HuYX2SyIYHZ9uFq/u1PRGvAdzzoSAmSKQ=;
 b=YosQgc03foDTncRJ4kPUJP+HOjbC0CDskER2lWmsrfoCPcY3nDtemo/u3mcaKkiu0FKm7gYAsqtX2IdQUUWavEuRxtnr4GIVSMiITJzJHGwdXBTv+AAGRIa1qPYYDqP/rcFIyYz0JhBEYSbER5PlmzmqxXR3rnanVwwc55XH6wE=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by SJ0PR10MB4767.namprd10.prod.outlook.com
 (2603:10b6:a03:2d1::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.12; Thu, 2 Jun
 2022 09:15:37 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::86f:81ba:9951:5a7e]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::86f:81ba:9951:5a7e%2]) with mapi id 15.20.5293.019; Thu, 2 Jun 2022
 09:15:37 +0000
Date: Thu, 2 Jun 2022 12:15:28 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: peter.ujfalusi@linux.intel.com
Subject: [bug report] ASoC: SOF: ipc-msg-injector: Separate the message sending
Message-ID: <Yph/sJtP/yMDuaEC@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-ClientProxiedBy: ZR0P278CA0086.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:22::19) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 78676981-b3c6-4f51-ba42-08da447874c9
X-MS-TrafficTypeDiagnostic: SJ0PR10MB4767:EE_
X-Microsoft-Antispam-PRVS: <SJ0PR10MB4767FFD18C57EB8D0C4A2C698EDE9@SJ0PR10MB4767.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: z4oTE0ZfZX8xX2DM0DJDssLtGHy6sn4MCwFC4nC/unsT1FiA3mc8yVboABTK/Hpw3Vuxtso5NPdH0m0eDmRZF9J78Lh0x1VjCp1mvLVPmGcyyFLO9OQofzY6DxekxqTdBw487HVzCb/l/nYZsr4/E7mjzVXHe7c+vtXFZeXLe/KZ+nrW12oK9dE7/B7OZ8qQJclht7LLcvS2CaXffhLIpfc/uD3FfM9I+mQDh97XEP3TtD2+k5NpgKBgqJPvXj3VWxm406ivfF6P64FW2tBuqvCU0Nq0wHMiNg+WRrqXK2EMFFRpe+TEH1+3ipy08cUYD6Ttx3GSwzcwB4mtNZbKf45UHP44uwMVsRFvWfHSCFEfkpbQ8HX1pIKAmplBi0W6pqVmkQ8dLb2zJuaBAEEFB0tANzgH2LOJoF3B7FUenMuYq1ddmb0hgqagwZ6RFbkz5ldwvlGLkhlB3X04xXzCbvoMhLCi5X42tRwZxX5cTw3nnzOmpQQHjeW2ZL7Wa11Ml6AIzgiowfcJMRSCCCy1HFdDo08zWKwkjX/0sofgdPalx1x830bpHZTI1ylrpqLLdYVGrIbymd2J+2tdLCFV3i7Z+yyIqihmuJmX16kx+KjvXr4+qYDz50hLgSMHNGe9X7MmRCYDV8LJJt5gVOiky3HWVKCuQLd8NpASiXLyQXM6XL/ECjxUTB+hRxtTdYTYlePVIPLngnAAsVXwg1p4tg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(7916004)(366004)(508600001)(6486002)(26005)(38100700002)(2906002)(6666004)(6506007)(83380400001)(52116002)(44832011)(33716001)(38350700002)(5660300002)(15650500001)(8936002)(107886003)(66476007)(66556008)(66946007)(9686003)(6512007)(186003)(6916009)(86362001)(316002)(4326008)(8676002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?R6bxxCQg89EFb8usUMF88p31mTIjXZ6Yy/0KopxbhkjeL7CINeK2ABmMPlP2?=
 =?us-ascii?Q?GlSTgXsySYaMlNPcWeQgmP7JSP7UNKAPs6W1gpNc9WAUv6QmoyUaa1bv2C48?=
 =?us-ascii?Q?cXl1NXcGBLs1DPZbPNQolGswuJmrOtTLi5Je5vX3Me13fkORX56K9J0SJiaN?=
 =?us-ascii?Q?/Po44l3OoiqFNGdavBGNGcQaJxSn/4U+j6IcscDxdGoevezZLMP1ldOOlgMu?=
 =?us-ascii?Q?2YR9nsAyHg96wQ/d42Ze+6tuSAEaiAD6fiuwB2QtwEO4bboi+OM0OMs2xIQi?=
 =?us-ascii?Q?Pq7SY1SeXz/e503aYMa45JDNdVLujHnHfl5xpRWfrnpL8+VQztZ9skHE+psq?=
 =?us-ascii?Q?kN5Ud5OQXDko7refQ41VoHOKPiGPJcLYli5rksd8FJM4bHHiDqwFXYCk5MAh?=
 =?us-ascii?Q?nskHqOAItaxB768TDhKtSlK6IUTU/pWnawI2DcTNc0d9VTRZCi7qJhHNPBjG?=
 =?us-ascii?Q?U/Jp5JhZltyX5D0HER30Mq1gTtcst48FoRXZ+DoXo5ia5LnSXS3wHK9fOdKQ?=
 =?us-ascii?Q?/259lFA6g79mH+iD8zapjCLWvKRZb1Cr6+lrdtmld/CFNeAMpZ/4k/QEhL98?=
 =?us-ascii?Q?8OWMQUyAy6V+JxvCLjaNttpac3L6nBLkG4E3VCgbxgTCARn+qy7rVu+ePXoI?=
 =?us-ascii?Q?davy2fOrQe4CXgeJLsVeS03So5p/ReCRkt2sGKX7uEgfeEgCi3yyKKWIXLTK?=
 =?us-ascii?Q?9WeM6P+OS7O4/3qiu6KPFjE9pYefHayG3GRQfSTW4vW8FUf4k5OaJs3++qlL?=
 =?us-ascii?Q?BprDHWChwC1ktZ+w10tqvADE2WHYbN+kz0rSKVm/LqsPAQLugts1K9VxH8jB?=
 =?us-ascii?Q?ThB6kFaShdv3/0pa87hOp6o8Fd6RtGgUkKjFvyZ6r3aJrAKshMWTV1eMBJ5c?=
 =?us-ascii?Q?cVJbFEZ608dEvFreXbDa051ERh7zN3yZi850XFoIQGvkVr5xOrdFteIaIlil?=
 =?us-ascii?Q?0NrUSQPhw0T6Smh7Q04x3E6/kZ37DAkXTIUZxvP319m+TwYZD7UxvfBSGhh3?=
 =?us-ascii?Q?5S6YJQ4IaPGbA2N6wuPSKaStJeRqhufxTP2mB2hsVV7bnLqT22Rn34ZW0mo0?=
 =?us-ascii?Q?Ba/mdfWYjrjElypTfYGHCUGFHmMJa8TrSCUo2xzMw4rSXKDNvv8LbvwXqhAP?=
 =?us-ascii?Q?oe1fiZrCokNah1LXIZ6kDnZFapcaOPc6KRAvRw6v2z8FUg4u8cHVX29NTnHw?=
 =?us-ascii?Q?3aJfR9BuRIq8FHmastDMceCjTbSDJ8Jt4Yi/megbEVvFKfT1adi1eW99jWv0?=
 =?us-ascii?Q?EkV889KYCd2xIm9OfMzWyiAeYBXoTXd3PUkZNacJJ02r3K10sDFcMqneaqbN?=
 =?us-ascii?Q?s9VaTrAJOE1nfRdc1phJYp+m1GaVGAr8hYqsIGk+njO15NgcrxTZqj/+BgyL?=
 =?us-ascii?Q?tV3L+P0fjSD5Tq0ASLaDMfiA6RaaR9YA+HJSsFpjF3A6yV+qxbo2AkZiu3WT?=
 =?us-ascii?Q?9STQNmwJQvXx89EiikiYccOH98WW+uWUKdu03q1YLz+vOKr/13GkJcC8xrsC?=
 =?us-ascii?Q?kfBd/pL0vq55HAZPSfbLi6QMjQWIvn2VpIej8jkbq00m5UR4VILRMKll21ja?=
 =?us-ascii?Q?n6ivBhQ062iq7OmedgfvreIJmuXL0TKIif+7raR6X5aVDz+7WprM9V3KvATK?=
 =?us-ascii?Q?Z8/vGzJ2Wp+YOuoVe2z15ujs6zJTFuiE2Ge7FSiP2jmA+0LAiS5FkwiEBL+T?=
 =?us-ascii?Q?RFxk4b6TrR+ZbEhrATYfjRW0a62TSgw0N8A5PxhsvE78o3x6Cqc5gLSG28rF?=
 =?us-ascii?Q?GXSKqLx9GpfdBjnv8RO8DR47qP5TnSg=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78676981-b3c6-4f51-ba42-08da447874c9
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2022 09:15:37.3581 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HQ518q8ww7kPN95q0Yu49c9Aph/T9Q3GOIw8NJuCWUu8uNOjcyCYzHP9QaaA4+t0Haf4rfubxc05S+GsFlzJUw/M1Eb8EnmfVktLcnnUlOU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4767
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517, 18.0.874
 definitions=2022-06-02_01:2022-06-01,
 2022-06-02 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 mlxscore=0 phishscore=0
 suspectscore=0 mlxlogscore=929 bulkscore=0 spamscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2204290000
 definitions=main-2206020038
X-Proofpoint-ORIG-GUID: tFu8PcSNVhZYkeEMvXTWBF3uZS-XoO_6
X-Proofpoint-GUID: tFu8PcSNVhZYkeEMvXTWBF3uZS-XoO_6
Cc: alsa-devel@alsa-project.org,
 Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
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

Hello Peter Ujfalusi,

The patch a9aa3381e404: "ASoC: SOF: ipc-msg-injector: Separate the
message sending" from May 6, 2022, leads to the following Smatch
static checker warning:

	sound/soc/sof/sof-client-ipc-msg-injector.c:162 sof_msg_inject_dfs_write()
	warn: kernel error codes cast to unsigned 'size'

sound/soc/sof/sof-client-ipc-msg-injector.c
    148 static ssize_t sof_msg_inject_dfs_write(struct file *file, const char __user *buffer,
    149                                         size_t count, loff_t *ppos)
    150 {
    151         struct sof_client_dev *cdev = file->private_data;
    152         struct sof_msg_inject_priv *priv = cdev->data;
    153         size_t size;
    154         int ret;
    155 
    156         if (*ppos)
    157                 return 0;

I think there needs to be an "if (count != priv->max_msg_size)" check
or something.  Or another option would be the do a memset()

	memset(priv->tx_buffer, 0, priv->max_msg_size);

before the simple_write_to_buffer().  Otherwise if count == 1 then we
re-use stale data.

    158 
    159         size = simple_write_to_buffer(priv->tx_buffer, priv->max_msg_size,
    160                                       ppos, buffer, count);
    161         if (size != count)
--> 162                 return size > 0 ? -EFAULT : size;
    163 
    164         memset(priv->rx_buffer, 0, priv->max_msg_size);
    165 
    166         ret = sof_msg_inject_send_message(cdev);
    167 
    168         /* return the error code if test failed */
    169         if (ret < 0)
    170                 size = ret;
    171 
    172         return size;
    173 };

regards,
dan carpenter
