Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FAB854A93D
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jun 2022 08:10:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ED92B1717;
	Tue, 14 Jun 2022 08:10:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ED92B1717
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655187054;
	bh=rXcMsfcNxTYyo4eKcSvyr3RMck7Ow4DqHVC57BwkBZc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YSTwOVi1cDV17aZMAeDoi628/hgue5ym0RzcXfxUOATu1tRaVZnDI2BP6/YIMJ58h
	 y7hDJX7u/tB+bdqckhC5cb8LXzCpSSM5Wycx6QQxbHyhu1WJcHUOriPhcfJy8g9hiW
	 W1E1fKKv4qlDlELT0rNV5VtUqxzItzUoQFUS8bwY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 59E55F8012B;
	Tue, 14 Jun 2022 08:09:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E2B96F80139; Tue, 14 Jun 2022 08:09:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 00205F8012B
 for <alsa-devel@alsa-project.org>; Tue, 14 Jun 2022 08:09:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 00205F8012B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com
 header.b="NNsj/Z58"; 
 dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com
 header.i=@oracle.onmicrosoft.com header.b="nWO5ICzM"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25E0oAk2016594;
 Tue, 14 Jun 2022 06:09:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=Ht+N91LTv7b7Uzymp7jV6A1LWhTxvi2RR1S0E0+eQp0=;
 b=NNsj/Z58iJVK0aLoCiwfwfcYvwoikDkj8mTL8g6Inr6Y+B/3EAjv+oQrFG3lct2SB/7R
 jVYlkemUoiP+JTAO9DiLttVW+QKSrrM61JrvbdKe2pzIoXDpBXfTl1EVO+u0BxEGrsul
 QoGLMxp/DnEK1aUtXV5r5WnQd/yq5ds7APJO+7I4Jxom+m8b+f/c35r+B0QWizBqFLG6
 2BAoZ/1Cm4ej2Zdnwq4pxSjzqRNp+uDDJxAskuerGt+kEEuuIyGYiul1Rfkyp2xvdWt2
 XcZKIdcjg2r3n+2QTlMcroF5Xtka8kZF+1DeDS63n6Gl1S6ay0ePNQbtyU9EO93ScE2u fQ== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3gmhfcmuuh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 14 Jun 2022 06:09:44 +0000
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 25E60YBI021339; Tue, 14 Jun 2022 06:09:44 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2175.outbound.protection.outlook.com [104.47.57.175])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3gpmpeg5vd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 14 Jun 2022 06:09:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mLBxoz5D7CTeWhwZm3nCYZkS7T/4amv2ZXzt/w9iciTGnYQ2TftRkObLBRcCjzIVeE7j+xBhEHsID3a6tvOSRn35n3z6W+H0xGWajcLpUWuc+o/wxeLloFA4OyX2i/fIvliai366w25kDD4rbKXCBaP20/WfsNN8px3hnVHF+z4cRMkOk86HaM5AMBOgYye4xeZZ+PjCeivygNXRdjc3QMviQlzeRbdfYF36h0qUjPSQeu94AIalB7miF+X2C1dNyZl+rhUkHami/TOLxd8vyzrnislcRwvZ6GNAOpCArHgLI+my4pQVk3YhDSd2WLTaZSeX99IFatvJK29oNS8qRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ht+N91LTv7b7Uzymp7jV6A1LWhTxvi2RR1S0E0+eQp0=;
 b=KdMQ1ExLrWa9Cao8Mesn//6mKcXel12k6AKj8CtFEBkfnIakLhXjPmnzU2nFTjVnF/0U2ZcYa0kzBD/pvZXxWFSX3V0720r1OWezqnYAhEusPgoKSoJgBhnSxudYW5QiOYEmLQD6Dn2Tm9DBkln9fbApf5IcSItch9W0eeezfTufa85BJoEGjGUAIOxg8WgIvGLP4BTn561YSdoNOM+Ene+GzdldK1f9vsngXM/M/65k6Q9bqwzA7cIH+Fahs8xJ2sLXdKRJXGzunL+zpwKAQDCc8KkKUHD126K385tDTsDUbWdveGKJeCEtpfdxwkDSTMp7HJypjEtKuSV8fGpQ8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ht+N91LTv7b7Uzymp7jV6A1LWhTxvi2RR1S0E0+eQp0=;
 b=nWO5ICzMI3czkcRHaskoluMau0TnRq6MvvB2+nc+SivmTQRUIFa8m/kftJHBMWMc1og4UxLUw3OTcHK3AKHPC6BcpVMD6SYvshJcyHuAXG1S0Gh4pzEQ9/XG5xPh7Gyqn0L1kOU6OB2+r46IHQhg6JV5058CPY6ZrSWZggeFypU=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by DS7PR10MB5927.namprd10.prod.outlook.com
 (2603:10b6:8:85::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.19; Tue, 14 Jun
 2022 06:09:37 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5020:9b82:5917:40b]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5020:9b82:5917:40b%6]) with mapi id 15.20.5332.020; Tue, 14 Jun 2022
 06:09:37 +0000
Date: Tue, 14 Jun 2022 09:09:27 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Sameer Pujar <spujar@nvidia.com>
Subject: Re: [bug report] ASoC: tegra: Add Tegra210 based OPE driver
Message-ID: <20220614060927.GG2168@kadam>
References: <YqdFcPETMQGZm9AK@kili>
 <8553b100-efd6-cd6f-f57b-671fe830a577@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8553b100-efd6-cd6f-f57b-671fe830a577@nvidia.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: MRXP264CA0027.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:14::15) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7888dfdc-2d1e-41ce-a0e1-08da4dcc75b0
X-MS-TrafficTypeDiagnostic: DS7PR10MB5927:EE_
X-Microsoft-Antispam-PRVS: <DS7PR10MB59272DA3D865481577104F028EAA9@DS7PR10MB5927.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lYDvC5D8Ankg+TZExdoudm6+/2u8aum9sO4ewFPeBx67juN9ygvvNE6Qdrs0DhEM/C7k1UD17hwj7B+u3QwAhTuHOOS21yvmhnQ6rc4iE7Fq8oemRTDS94TJfPE/zcCCCmUX3fJWVYE9ZwXa4un0PCEi6FEQW4NGZZTlJJvHNiNuo2i7tqpGd9iCCZnSt4uW+ykpc5gD6deKoE81Puhh2QJbkMO2ul18Y9+MNHauLE8Q1p1IC7GZx7WmyMgxf6D7+6SJCzEU/gD7VX8pKkcaURSq1x54u2xxH/dNZpkRgtzXKh67/eXAfaMGqz2HJa6Ff0He0DZvtV0r/rUBPxUHERWvwelQ6XwYB81tkbkfjObs9DZHyDhyDQind2yoU1RK/hDW+Sn2YLlt6Vac1hPEN6J2Oy9A0k6OpCz7dSDNIsIXAPqxpl4E5AO9+UqbkERD2WoF7WkZm9gM59n2dC4glV8gG/W8M0AfosrQ9iWWLp8alHv4Gua4BtxP0Gp0KPVGdyzY6Wn3v/RxaPymkRBTVT4IDO6KKqPp2F93Tdl+SsyFtTfioxeMpcqjGRvMvRN5t/IfvsPKADNeCGY4BOg4wGkGmH5JFxjmNLW4RMv96A+vvL0/dekgExbCRJcS7dLka03/Z4zBeohSxjJdRzZBiObq7cah0lKOlYI0zVPohqfiSnJxB8NJZjnfQKnaIYUsDN5CRh3uTk0LP1dMQJ72eQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(7916004)(366004)(8936002)(44832011)(33656002)(6666004)(5660300002)(316002)(38350700002)(66946007)(8676002)(4326008)(38100700002)(66556008)(86362001)(66476007)(1076003)(6916009)(186003)(83380400001)(2906002)(33716001)(508600001)(26005)(6486002)(53546011)(9686003)(6512007)(6506007)(52116002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZlyJ0Hcy1Fqo5Yd8GIGKcD9TFt1yGBpqZYUNxA/PijlPY/TAoxVEe0ZK/1hm?=
 =?us-ascii?Q?oG3UbeJC0JK5Uf0bu1ty+o+rY7ylNVrdebCZSDlWZ36UTtxAol4Jua7f98ng?=
 =?us-ascii?Q?JPYacNZbgpDukbadaGYYPRHFel5DloKJ1J91ZO7kRnacO6F8+PeSgnKVwHnR?=
 =?us-ascii?Q?mqFB+ug2aBU+FZ6nQUiBqVPc6/1vnI0+6/GTdlceeYPfm6ZSP0VpJwihsYAX?=
 =?us-ascii?Q?6lMM4DYeo/y984IKJuqzhSOHmVsae3mVJMM8lmtE67uw+NcwsYn1YBQWD0nT?=
 =?us-ascii?Q?vjhswoX10rd8nFgytKy965rZjNa7jzqSS+jMdjXpymK5JzaTLU7q5aI/dyir?=
 =?us-ascii?Q?wFYJm7IKgKleGCZ7d5MX0WeT48HE+N1mtf6tMAl7swmctSoDaoS2YOifmSJg?=
 =?us-ascii?Q?Mp8It9S2gogluS2lvWBUIXcqtslRIXfidl7ypKkveiGjxvWed+ISw6EyEyJL?=
 =?us-ascii?Q?/Ngyr+8JHPF7rCY+kQZcP3mchFaHYTtIkoGPj5DaQUrKII74VDwr9uZ4z18s?=
 =?us-ascii?Q?btryudtKn03Jule05Dx5c77EjMd9OECmEENGQR/I1IY9tUCuTOnBkbhBBZ6y?=
 =?us-ascii?Q?Y026pzm1k3Nn6iqkTtE88bATihj/DXt/3b9vgnJTzW+uYqpVnY9YzdQQyvoS?=
 =?us-ascii?Q?jvAfAu8hrlpZHriRMtqhXNL/NhlvJ0T4cAeSUJcZsvh72ACeWzksI7DoLcPv?=
 =?us-ascii?Q?CUczTsBz5TgnQnUQSiY9BThY9sVAQihdhSJ80HKF1lrJPFSgK4aRG9SRPG9I?=
 =?us-ascii?Q?88VaYxT69e9+Ac/JwyaQsptlNUgSexL46vbPXFu3axZM2Z/MzH+wYUj7byO7?=
 =?us-ascii?Q?tGoALDjS6pCURKgZTDTEwDn4fORT2c79nEeCOW6efMumEXjFgMRpRifnyk6h?=
 =?us-ascii?Q?LctaB66b1QsNCylcXsrxsUXwTQmKaHB2hdiwVo8nrOTU4l5luHGrsWK5XAzh?=
 =?us-ascii?Q?BULuEzmIqqoiAbkXpJEFB0Na+xmaVyUSzkcd+xoEvAoye9HuAQN2+mEUNeu1?=
 =?us-ascii?Q?c+FQIQlJuOWE9ml9edGbfTYHtTbbNkHWjrVGG/P7cLAka8D4pdwAEWbCyu2R?=
 =?us-ascii?Q?ui9RHPxS/AjNg9HpuAPnqs4aTGfDhjvYS3ejgNnQm4699xa1XpGsjZ/yYFQp?=
 =?us-ascii?Q?VYgvxWv2u1ofIbXkcMu3KuUmRSNaFTwejFG/ghSnCb48onQSV/nNGY+5q32j?=
 =?us-ascii?Q?ytb61wJEBe1IAczbbJh6ZZLdjmVG5I3CfTIs7OEG6V2Y+chh5GFmLgym+FVK?=
 =?us-ascii?Q?VDVYxG0I/Us9KYk3ibs9GH+r//p7NvcQrGZ5M69nh8gVjQVgwiXSZOdBUtxy?=
 =?us-ascii?Q?fpJZSFDEJibh6aRSHOe2ure1FpDul/rtO0nA+yLAw1O56+x4LLhF0WEy2HNC?=
 =?us-ascii?Q?K3odmVnLiC149/WVdQYxodbeS65yzDZ/e0xx+ick2cBlUgcLuPCsX6XKYGrE?=
 =?us-ascii?Q?0h8MHHLLZQSJ1fLXGfX/W5Z6idlzKWE8tvs4vMkyZAjn4geV+G2oKTvIfjKc?=
 =?us-ascii?Q?l8lvN46ncayc+pcMTzUBIDayCbOB9R2jOfe7z5mbsZx0ZCZ+NFDDDfKJq0yJ?=
 =?us-ascii?Q?v9UUB5tOWeK8929BreGJzxTqcPrzw3AQ6yXXeXVBZRhPyCBqfLJ5VDiD0Cpp?=
 =?us-ascii?Q?iMmW9l9TEREfaRuYjtqAdUUzBxu3wJVXfwUMYRekBZXErf3IIddm62ZEiU/7?=
 =?us-ascii?Q?Mz3C6offMGxYAR8MmxoAczLC7mCQllAJ9h3pWJhiAaI5zjvDh33Rc79UVH12?=
 =?us-ascii?Q?CewovXW5LYfPeEtFU6OuCylctET7M/g=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7888dfdc-2d1e-41ce-a0e1-08da4dcc75b0
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2022 06:09:37.2491 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ph43ZGUwLXrAZ1M44tsSt9f6FafPufyAOayBOodDK0TIEK3H/g6hYutfhNLnpXv8dry8AbzzBYl+yccyBESjY3zLGpi0dw4u+wSXhUW3GE0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5927
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517, 18.0.874
 definitions=2022-06-14_02:2022-06-13,
 2022-06-14 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxscore=0 malwarescore=0
 mlxlogscore=999 adultscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2204290000
 definitions=main-2206140023
X-Proofpoint-ORIG-GUID: ulk_NvQmxO_CJNGhHa6KTJCoPAwSZGcg
X-Proofpoint-GUID: ulk_NvQmxO_CJNGhHa6KTJCoPAwSZGcg
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

On Tue, Jun 14, 2022 at 09:47:21AM +0530, Sameer Pujar wrote:
> 
> On 13-06-2022 19:40, Dan Carpenter wrote:
> > Hello Sameer Pujar,
> > 
> > The patch 7358a803c778: "ASoC: tegra: Add Tegra210 based OPE driver"
> > from Jun 3, 2022, leads to the following Smatch static checker
> > warning:
> > 
> >          sound/soc/tegra/tegra210_mbdrc.c:778 tegra210_mbdrc_hw_params()
> >          warn: bitwise AND condition is false here
> > 
> > sound/soc/tegra/tegra210_mbdrc.c
> >      769 int tegra210_mbdrc_hw_params(struct snd_soc_component *cmpnt)
> >      770 {
> >      771         struct tegra210_ope *ope = snd_soc_component_get_drvdata(cmpnt);
> >      772         const struct tegra210_mbdrc_config *conf = &mbdrc_init_config;
> >      773         u32 val = 0;
> >      774         unsigned int i;
> >      775
> >      776         regmap_read(ope->mbdrc_regmap, TEGRA210_MBDRC_CFG, &val);
> >      777
> > --> 778         if (val & TEGRA210_MBDRC_CFG_MBDRC_MODE_BYPASS)
> >                            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > 
> > TEGRA210_MBDRC_CFG_MBDRC_MODE_BYPASS is zero so this can't be true.
> > 
> > #define TEGRA210_MBDRC_CFG_MBDRC_MODE_BYPASS            (0 << TEGRA210_MBDRC_CFG_MBDRC_MODE_SHIFT)
> > 
> > The common false positive with this warning is that the macro is
> > something which depends on the .config and in that case I just add it
> > to the list in smatch_data/kernel.unconstant_macros.  But in this case
> > the macro is just always zero...  Is there a plan to make it
> > configurable or something?
> 
> Thanks Dan for reporting this. The device is actually configurable. I will
> provide a patch to fix above condition.

What I meant by configurable is:

#ifdef CONFIG_FOO
#define MASK 0x30
#else
#define MASK 0
#endif

Smatch works on the preprocessed source so it doesn't see that there
are two definitions of MASK.

regards,
dan carpenter
