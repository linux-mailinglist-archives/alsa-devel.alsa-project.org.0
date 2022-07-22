Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A52A57DA4E
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Jul 2022 08:31:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 562AF186C;
	Fri, 22 Jul 2022 08:31:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 562AF186C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658471516;
	bh=h3CFemlZr+tb6QuhfDa+lLZN6aT0yxqWWfDAglf0bjU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=g3Sys1Q1aFxZP4CiIIJ8i6/tU5ztq7i+oALIP+CBnYwfTLEBo2icSplaNhXKV97gn
	 xcXLOapBnE6/3kWkWw//fUFcOmYNnGKSi92JHdPCrHkJzkylwOSYqEcMaiNUB1ereT
	 6VMXypLFW8TXP5jUXBJB08wRrqos4h7Fx50NO6Gc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 84BC8F80166;
	Fri, 22 Jul 2022 08:30:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 87197F80246; Fri, 22 Jul 2022 08:30:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D98E3F80166
 for <alsa-devel@alsa-project.org>; Fri, 22 Jul 2022 08:30:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D98E3F80166
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com
 header.b="v5eiUld6"; 
 dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com
 header.i=@oracle.onmicrosoft.com header.b="nvYxwPBY"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26M6SrNA032403;
 Fri, 22 Jul 2022 06:30:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2022-7-12;
 bh=RUqWmrWi1YJnjxDoXrc2iF1ZKhF7L2RIx7k0hX0Bt3Y=;
 b=v5eiUld6borIp85SR5z5PooxrFV00WH/A9QUEpeDKclSEwG2iAIxznQcncbX1cAjLXab
 fu8Adh22s1Se3f5U1/kcPzPnwulRPICya8wzlksxMAIUswIJQvg0x+vFYAtIRQCSMX2v
 J5/UehTj2RhK4inHKNIG9j6bFqI8dMO/nuFOQQlOma5xJkUfL9gLOMgAemNb3VQ5AoKJ
 Iox+tl5NhcPhc3KiDfVhb/+xcWIuTwwGpZm3p3C/Q7d5hAs3MZze+FKtZ3Bz9nB5I6mp
 NEBlGLEYiRRHzXtYbkrU61uWZFGkv5eYowFtqdKAPCHQpX7Aci4NQSO+sApF7IMepZA0 fQ== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3hbnvtpjfu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 22 Jul 2022 06:30:44 +0000
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 26M3k0hQ022197; Fri, 22 Jul 2022 06:30:43 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2171.outbound.protection.outlook.com [104.47.55.171])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3hc1huqha4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 22 Jul 2022 06:30:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e6N/BJzx1A4R3h9IbrQhKhhf38p2fv5LOW1VekoRLspfBICQqVr89ZWFpR4gIHnW2UQWy3EYiDGaKLtU/3VhbUGsDQpBnuUnpUSv4snxCDcU7QNat7QfG6RePi/fGFHVcRfZpK66JqgkGL5SqMeR5lOpXeOVgfxqBtbYvkbT+VN35yUPQuZKNLNh3DxPX5aGwedAinqlIGCZr6eFVUYqB8ua1mgyc4weROsR8Na9A/5h3cLpmMijEEN5q98NDjBY13s2iZQZHBJ1XWc8xUTE/e2S1eXylE9KWPBUaC+lg2h3JZFVAIGPFoBWwm1D7eB5BOZr74PvhA7qnNUkSxp99Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RUqWmrWi1YJnjxDoXrc2iF1ZKhF7L2RIx7k0hX0Bt3Y=;
 b=bDzTYKIAI4HCR+Odd3HqOw5CMn3c0LlZouN7TUj2M08Ex4t5ap7rG5VSIzPruEYvMJmtfAGYkb/c1WCHRkbfVHjEOWc9Cb4OeDQ4dkuz44lAuP5rWHqz6Ug5dfUq/LJmUH7eKUvA1uxilNUlW1KtqGdherK2IIOjsbdfmfqPTpTKLSMlV4xtkaz7pjtM3RzCK95R4eZwodseybbpFjgWPzVmFxJwKYysdZAsG9H69MjEBsn1wTOzEUDm2pP/1bO9OMZyzyS3Ar3S1JBgvWJUGiFQsWnHiOC7bD5v4eGiG4UhwAThf/5mkQ9MQN1x5JHN77fPbpd3f5/PcQ56TUh3nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RUqWmrWi1YJnjxDoXrc2iF1ZKhF7L2RIx7k0hX0Bt3Y=;
 b=nvYxwPBYBvYRkTdRVPttrNcdSq3EyTpg8rY8xaXYWt0fIBFqOoX0GxOBxQhJM6if/TO2nq3wHuAQhrXgso5TQjvvh4OcnTWttZ48hshMoWhaB/h82Q1G9cfMnYlek9dV+xspL1Z/jUligHrYbvNYnTmptDV5dU0rtxZ4tTUwY3E=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by SJ0PR10MB5744.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.19; Fri, 22 Jul
 2022 06:30:41 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::24dc:9f9a:c139:5c97]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::24dc:9f9a:c139:5c97%4]) with mapi id 15.20.5458.018; Fri, 22 Jul 2022
 06:30:41 +0000
Date: Fri, 22 Jul 2022 09:30:22 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH] ASoC: qcom: q6dsp: Fix an off-by-one in q6adm_alloc_copp()
Message-ID: <20220722063022.GN2316@kadam>
References: <0fca3271649736053eb9649d87e1ca01b056be40.1658394124.git.christophe.jaillet@wanadoo.fr>
 <20220721100042.GL2338@kadam>
 <a29ea047-4935-4893-108b-f29f46971272@wanadoo.fr>
 <20220721104731.GK2316@kadam>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220721104731.GK2316@kadam>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JNXP275CA0022.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:19::34)
 To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2858b3d6-617e-4e99-d01f-08da6babb30d
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5744:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8eOcusr/OPlT4E9ip3kqw70/4eaysu8CKXO+ZglxbT29XApfgSLOvDhUKXxtCyGxPqGiPwlcffyD4T4TCRllkpvkbQ4wloe1vbQneizkkyu2fsYM96BAdp9FN/rpucaJRe6mjucd39YOmpqghB/CIW5EM5fGJPioYIKFLpzONiL4jEB+fsvHjnFBSovvCoLOV6YTpiSbVwh3uxjLEpnTqzXpBdir8iui/EVS7a5Q4cGU7JYEbnyAHZtIxcpEOzdLdggNeg15pRzXohNq2jBCChvIVbjsmLapdWChYpHXrfsakKZ7ciKwsatosOUDt6A92sZs1xsuyJkU/0vbcL7WWIUKyC9BIb1CaHYIOSt1KJt0I/fUHBFktaErD48SPquaXMnQY68KwxjgyH2Qr9yC25gYc8MPd+tLOcuzpXYDh1if8kh4ys981EZkZQ+2RTqLt5DjCZ6tf2L2ko3zkOkuLPwSqUgrWuFpV3V976RIJ9e0wieseQiNhUpi+yHi0784bsB4K1BfMxdyIHWSh2v3lIcseykAPXh4cdBUukiPRfImgrG2ml+HXz74uWRUp2Eh/8T4wb9MmZzPzGwr9bH/dkUjsl8J+vr24dXSqRcKLZzrvuQkA8hUBQFD0WWDTBsKtQq9htQO0JHaDdcUNDm0qQabrhI8WP1OvFmNtmV8cmebnlIm8JusKKdKXQu4f9+lm1NHya3R+ui2Bs96yRNirYjL4U8OO6UT1lGzt7HurzmlooH/FP5uU45COKNmjsgcSWdVgb4Fdxcj5d4hrYbGgYC+nstUoILCI6kCTgi+f+DsU78SA7cYz6Uy8OFFtEl4Ilo41Yzi4Nfs981zoY3F/Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(7916004)(136003)(366004)(396003)(39860400002)(376002)(346002)(33656002)(33716001)(86362001)(38350700002)(478600001)(6486002)(38100700002)(4744005)(44832011)(7416002)(8936002)(316002)(5660300002)(66556008)(4326008)(8676002)(1076003)(186003)(66476007)(6506007)(6666004)(41300700001)(2906002)(26005)(6916009)(6512007)(52116002)(54906003)(9686003)(66946007)(32563001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/B6JLZmhn/XdRSPqconm6hF1Arfy6/eQdCekjESrVoVRiop+h25ui5yYzHYq?=
 =?us-ascii?Q?Bi0zcA0do4n1jhyY0uODUsLppx3HABsAVqf1MzriArjnrYkAvuCHxcm2yHD8?=
 =?us-ascii?Q?4HzDgJItQ3vQGNlN0KTOeugwiPYH/X9ktCH7dTeMsuD+3/wThlBqNBtdkmip?=
 =?us-ascii?Q?WDY0sCyE4XBMCki2+umts3wxo07gLKT8L2BTOKMZ6Cx5aMOgazojzqlN1sPY?=
 =?us-ascii?Q?Jifh6rrpzM7SYlgwgY8OYCD8O/3zJpaiXUldftMr7MkQn/7UxwVxj8V+R8gf?=
 =?us-ascii?Q?Ck9Uhkh+Bv4L1dd/LKBBOgQQDG7j5LojO9pH3+jJAEyuJ1FQ4PoHk2kC/0hJ?=
 =?us-ascii?Q?17ZOkmVwwE6yZDnBA2iIfCzKfd1jKgwQnHNe3iPleNP2UOMRlYsCHsqViE4a?=
 =?us-ascii?Q?WgHU6I97JyithdBFsqdVMlFxfuw9nXxusvTl4embPXfCn6R4rbUVRDdkpRlw?=
 =?us-ascii?Q?Xnt7/4vFp1kLtOb9zcGa0xp9KWsjYIg4N64C72csKxKlpov/BsP5DauCx32y?=
 =?us-ascii?Q?ktt7hNNdzVd2ERtvubG9JsRwc0IBRt+9Kr1HsO4mS71OMNy7an0kDSRJB8Gm?=
 =?us-ascii?Q?7OCDsvksznG30gsVmIfXFA7235b2JtxrQMFjQ/GkZ7TEHQjho1qsqSgMsKeP?=
 =?us-ascii?Q?LKa+5VgPh8Rr7sLCtsUJWOKPGDzUiutTuo3Uyb3JHO/LELchQXecQM7KDSSB?=
 =?us-ascii?Q?8SBh6p+2F4jlsqgFWostPHlS78G4GATzSoAEJehz2ti/PYhMATK357fdVgEd?=
 =?us-ascii?Q?xdc1y8udK1DXVacAbPrbQJ459rlJOpBN57inUTz4s2Q48tGJziLyGPXLax0A?=
 =?us-ascii?Q?s1MNU2aeNq+6J0ezBTXUZwYC1WfO7QKQOJKQ9hm9o5F5V9Z0sgDBPs9EijkW?=
 =?us-ascii?Q?KsPjySRg5Oky2LGFsm7amXE22XEu1jwPJEPPnewYG9nVqw//2AR62Ty97tfB?=
 =?us-ascii?Q?bSEv+kD19Iyixo9WfX1DMMeVB1jeD9y4tsOfqTqdYFs7z+uum4T0/SsXnEVp?=
 =?us-ascii?Q?/MGHzZUMMyKFYtH3JGsSaz4U0CcDntwqkBjHS/bT3wz5178fNRCiv00OiJlP?=
 =?us-ascii?Q?dj/GTy2Wy+K1n5RIJ0JYhDo6/dMA+mZr9yx2LIhuzDoG33k/MwX3nw35eeby?=
 =?us-ascii?Q?DpLFV3TuMHLDVSM6OxFZVhnyqWqFuDh2UsD+3Mh4uMjC6VnAGDx58nUmN6pY?=
 =?us-ascii?Q?dQLPT7/cbvYnQuKwyF2lsuSo4PVCOeaLQSTpBY5ykbDtnN0lb+vLEmCAokAQ?=
 =?us-ascii?Q?T60DyHSc0WL78I3LG96hs9fDv2DtvIORxdcnif1hrqFOtaDLGH/qs5ecMd28?=
 =?us-ascii?Q?0XYby1IOWXqlEH9jscYCgWjVZCp0iAgdPh5Ou/iPbVfbwnnKvkuzL85PQNFP?=
 =?us-ascii?Q?OmQSLChgCn+42Uf3qnFS8itcA+1tQhiiTAf+vC3cWr82YfWlEaWRLzV32luA?=
 =?us-ascii?Q?cfmoO47g5oK1f7YC93XlmMMWE5YcCNpsSh6//vpihBVusqzS+1N2H5FOuOxx?=
 =?us-ascii?Q?E3gqQOpXksESgonEJ2/lnyapoPS5/zSJgyEpvz0ct5SDpWVm23uFSM7jOoO8?=
 =?us-ascii?Q?Yca8UO4pMg+t7NFrrl9JvXXFd1Qpk0t5i+ft3q2IKUuuM7PlORnjaij/uJFu?=
 =?us-ascii?Q?/g=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2858b3d6-617e-4e99-d01f-08da6babb30d
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2022 06:30:41.5515 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D22sbC1UGf2akxkHBf+4JUxoM+kufa+cMbVN68fcwxtmP5a34RCAbJaWOVN9ETfBPBI/YJT8ZiB6j8fiVYvmCpLnQlqmyEZZ1ZVAFVZmFV0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5744
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-21_28,2022-07-21_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 bulkscore=0 malwarescore=0
 mlxscore=0 phishscore=0 mlxlogscore=893 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2206140000
 definitions=main-2207220026
X-Proofpoint-GUID: OPeOpw5U9TN6dtFMwvFSebAAnRugRPeY
X-Proofpoint-ORIG-GUID: OPeOpw5U9TN6dtFMwvFSebAAnRugRPeY
Cc: alsa-devel@alsa-project.org, Banajit Goswami <bgoswami@codeaurora.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
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

On Thu, Jul 21, 2022 at 01:47:31PM +0300, Dan Carpenter wrote:
> (Still takes overnight to run so I might end up sorely dissappointed
> and defeated tomorrow morning)

The generic test was pretty useless.  :(  Basically it was 117 false
positives.  Attached.

There were thre main reasons for the false postives.
1) Smatch takes short cuts when dealing with loops.
2) Smatch doesn't understand threads so some code does.

	msg.code = 0;
	write_msg_and_wait_for_response(&msg);
	return msg.code;

It's kind of useful to find these bugs in Smatch and I'll investigate
how to fix them.  Another option would be to hack around the bugs by
just ignoring 0 and 1 returns.

	if (rl_max(left_rl).value == 0 || rl_max(left_rl).value == 1)
		return;

That would probably silence 90% of the false positives caused by 1 and
2.

3) A lot of code has harmless sanity checks:

	size = get_size();
	if (size > MAX)
		return -EINVAL;

or:

	size = get_size();
	if (size > MAX)
		size = MAX;

defeated.  :(

regards,
dan carpenter
