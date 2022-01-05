Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CD33484FE0
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Jan 2022 10:17:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B1D5917AA;
	Wed,  5 Jan 2022 10:16:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B1D5917AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1641374222;
	bh=JzYEDj6CvINrW000645NW+vhxW6IMVI+v3QnWJJSVqA=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HqSNkhve/qBuTME9Az+LaVcAT/vmAZp/wPTNyNgWpfe2RHJVfi5jofoycc5cYpR1q
	 BEbL+s6JOh9sPnfbkv+CspzVk8FxHfuxzj8l6ekIsTw20aC6wVF0s7B0j8C7ixNmL5
	 3Rmgfegk41WMdVHdDJurOmyWROcsCzkfcNN1YVPs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1B7B9F8020C;
	Wed,  5 Jan 2022 10:15:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B3BFEF801D8; Wed,  5 Jan 2022 10:15:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F2AF5F80089
 for <alsa-devel@alsa-project.org>; Wed,  5 Jan 2022 10:15:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F2AF5F80089
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com
 header.b="OhOEhabk"; 
 dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com
 header.i=@oracle.onmicrosoft.com header.b="LQiaJq4P"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20579hc7021535; 
 Wed, 5 Jan 2022 09:15:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=M0oRSG1v1YRnLaNa9lMTZ6EMVqfXkx7vW1jiWh7miuQ=;
 b=OhOEhabkZOX4pWe7gd/Vq0OFAfr6H57F8LVXgjlqldOgE/ekZJ+HV3yRcsH9nxUaat6o
 yc6TFEPPAy3rYqV0nnTVhPnS2DDxvY3Iyyiilyg6ctivTWFipHh0orKOJjpVPJRTDWsJ
 WYOfNnmUDRL48Mx2EgvGC5ZWSH1mso5SZo+PZS7WnLUSPCpd5qo2IZAN5RfS15Xodb0p
 C+c5I4OsPmy0TGICn7hSNIgIiDfD/uvVXMGFOvKM6fwFlOAJiCBSInA+2uZq+Wn/8oVv
 lc4XjUu4s8Mj80Cx1OYsvC38NTG8nnYf+1P6IBotCHdsaFhToJg5oGzxKKfTkeMLT6kX LA== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3dc40fm8nc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 05 Jan 2022 09:15:49 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 2059C7Im080390;
 Wed, 5 Jan 2022 09:15:49 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam08lp2045.outbound.protection.outlook.com [104.47.73.45])
 by aserp3030.oracle.com with ESMTP id 3dad0eq3ac-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 05 Jan 2022 09:15:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q6t5ppcM8cUupdZaNJuIlatETpAHIBU+0+nzHbjXwoKPBMnR3PSaLIdOObdDKd/0OnFQtC6gU4l7bgOpELDVbph5KiTyKjoB3bgLKhUGU9yN6kxFWuI/q4zxu3yAWBD/YHy27O3yuRqRecCrUCIb0WcjfwNbUQa+KaeLdl6NT5ulraH3pBAsADvJR2PH23D5DvZfILcktb7wgizIy8eMEjj6/ZxfpP77nh9Q9FWSLKEXcmrCV3cViArUe2Nd6u7YP3U4LBncmS5FbBXSJqezbto9QYBhjZSIrsYBdVOGYfp4hzXLsybOIY+O4JLMomNCs5ICL/bN6r2RBSK2FQ022w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M0oRSG1v1YRnLaNa9lMTZ6EMVqfXkx7vW1jiWh7miuQ=;
 b=nQxaq1pzLM1CoyEE2nOim42bWAS3raV+EHZP8hBnxyronWfOoxZU41tYnXjZ8RRSSo8pwvzPI4uVuNUC/vuuYTMGEmx06D0HLmfiV9yjRsL9ZoZJTygWosOfkzTPugcS7joWy+bFQF07+ubr98pJ1jQ8cZtsFDCAiTW75CM9u4pnfxCIz6/FE9ldApWYiR7bi/zvDqyB7QW1kGrfUvUSaAFpEDX95yWcKyL2knlPQ+a0XAgL96SnOuJ82GnKA+xTMv6tFnOhypqaeH/nGM0QM2Kr5+M93qu/UlaHn2AemQYLYwnOunlRRocnCs3D3GHJo1asJx4E8jU37BuxCHy3hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M0oRSG1v1YRnLaNa9lMTZ6EMVqfXkx7vW1jiWh7miuQ=;
 b=LQiaJq4PK+s+6mn8kszgaDyGGOVI57hfA5oVimlKwBA+xVZT4KPPGIFJZtscRX0WSIhCS3kMgDhT1GsHsceaH5pfC1Li3DI87AP+ht7UBzxtNr17FhLaAKx1OH6LtJjT++6JRiELqDRO6NcBiHv/vWte7OpMJH2BsUzfAIQnP2k=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MWHPR1001MB2319.namprd10.prod.outlook.com
 (2603:10b6:301:34::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4844.16; Wed, 5 Jan
 2022 09:15:46 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::b889:5c86:23c0:82b8]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::b889:5c86:23c0:82b8%4]) with mapi id 15.20.4844.016; Wed, 5 Jan 2022
 09:15:45 +0000
Date: Wed, 5 Jan 2022 12:15:19 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Subject: Re: [PATCH] ASoC: qdsp6: fix a use after free bug in open()
Message-ID: <20220105091519.GA7674@kadam>
References: <20211217150007.GB16611@kili>
 <a28f15cf-b8fe-3214-f353-1fe4565adb8b@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a28f15cf-b8fe-3214-f353-1fe4565adb8b@intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JNXP275CA0041.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:18::29)
 To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 774281a9-6937-419c-35f9-08d9d02bf490
X-MS-TrafficTypeDiagnostic: MWHPR1001MB2319:EE_
X-Microsoft-Antispam-PRVS: <MWHPR1001MB2319721F2DEB21C70B1C2DB48E4B9@MWHPR1001MB2319.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1728;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4S/sDc2eCW63/UOO0FpH107P+/dYLvVnGvh7kapl5KJlUXAbSnva1avO6pV3n6WWKSQYhS0ZiJnRNo3+asOuw9eOEuf73sNrAutU/xsSN/ESAw0vIAd+enPvhNde/OV5iSpQjNdN7xf+1NnRNjRTRkuAlRcHeqXbnUVAkhRymVovXMv4FmSY/rK9D13hgVGdQY70oQVr3PjTDj2qvH4HVxPCYXt2yCa0THx6spgCrgqba65qPZ6VHWDurmXXdXD21oanTdiSg/um9BHyfRFm7Z6mShM74aBl6/2I9/5e6RwLJzhvADSb2SaNqfYOyhUDZKk3t5dxbGouwcSWn4VgZJBLgyRdHqyFDjtFWcPx7ZeBwVvTchfwgQjvgBxr1tdXDuAIzJ9YRHuffAQnft/kvOs4XvBRCXwTV6O04DKe6mzzaNPtRyflv5Cj80hRl7fatrKKUNniodoBfoQ2hvpNgAH0p7gNpCnkpfDxvGNznkQxMvGz0N3rqaiTpWuWv95TT5NcF1NO3ZrrgHN0Da9yJeE+K0gT7eDrvcX2sBOchTfmpu0r3tkK4HEHFDnX0X/TC947FysB7PLcz1/Naqh+NidKjD5Ylu1ir9uoo/Rn32iOOR5FlHXubqSQy7FlxLmS0p1aRlVnkiT59HRLb/OD60A07ZcsW6kYRVXnncXT/cHxuQAosEiTQYxNxigrftNfFtBDyt3ThmUQsYc4aeO89Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(7916004)(366004)(5660300002)(6666004)(66946007)(2906002)(66556008)(33656002)(26005)(66476007)(38100700002)(4326008)(38350700002)(83380400001)(6506007)(6916009)(7416002)(53546011)(52116002)(1076003)(186003)(316002)(8676002)(9686003)(6486002)(86362001)(33716001)(54906003)(44832011)(8936002)(6512007)(508600001)(4001150100001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LiALeMKdgxBjwZCYzBmT8tRR1WbTfLYvQvkkaI4wbLahu3eJmtWGFuWaDiTy?=
 =?us-ascii?Q?x0SH9kAkyr1MgQkVICsG6jJQ8Ui7grqx5X9PtrBtpry0cEN8Wq291J3hCrOU?=
 =?us-ascii?Q?ewNNvOIZ7cSEr7n1JQDHmJ73AWJgNXDTNvWv3o6w8HwoT5e01pEI0lBRAFZQ?=
 =?us-ascii?Q?6vw1My90CZY1zFUk5GGjbl9K32O1eLcVSOG2ywMMkP364eguPJyRLZSlesDb?=
 =?us-ascii?Q?hrBxHE5tCgxVZXxEKtRETtfvGRdh0rd1oPllqS0Z2GsHEp8rJ1JII4vbqg3f?=
 =?us-ascii?Q?hBSj4GjlpgIbxkd6rpNQvWMRlWtC1H8fbUUyojaRSdPdgAKECpXJP4Gl8zR0?=
 =?us-ascii?Q?8scSyoozefqbQxZAJWAlhidsATlTyqjTpuoIulRn9EvOZszDGHb2d2RlKWUe?=
 =?us-ascii?Q?VoaQe6BJ1BWb4ACodxzXWgOSL4+JJAWo5Q4i8mSgOM5pC5k0La6L1XG/BNsz?=
 =?us-ascii?Q?NoRL9YzOLCRq4aGnFwxiBaamzzti6SkhVlNg6ZD1BJdKWc1PtfM0RL2q2jrN?=
 =?us-ascii?Q?KPrCHbes6L3/RW73cmV76qZW2TQPHcTmzYxUUk0pq2YtLpZykc686cF85l0B?=
 =?us-ascii?Q?0y0umyZJPozbpn7YFs/RF+oa/wzIaWW/1xDBsrUtl0c3S+/tVAjSZ/+CS+ZM?=
 =?us-ascii?Q?+i4KbdCUxBGL1DKTTAfMm9bTAQdXZW5W0FI+ud+8CssKLV4pwHxpX27pTx65?=
 =?us-ascii?Q?8ieKuLh8seklfzGt5nmE5OOmADUkHvMkRDyB4Cy3/3RIJN5hcM5hr3eK+6qs?=
 =?us-ascii?Q?mOCTTXU75FtMlA9TOqqAgrq6yf5T7djDyCfI/8xqlx2+yO6JA7NnRFOr3pwA?=
 =?us-ascii?Q?OE4iDiKgr7nfwiGjGdGlo9CyHnwLLaYVH1GKaMiFfHwCBi/7d2cW2GnGldYQ?=
 =?us-ascii?Q?K4lDzcGI5NkS/l/ANFd38NV7ViAyOdrBjwIXUZyn9kBCqgmk6Rke9oC187Gd?=
 =?us-ascii?Q?XhCoQwzOKw469av83FGl2mGP/a/z/Eyy1v3XWiUGM0K0sj7EzV+vj/fFJuty?=
 =?us-ascii?Q?y6ClHoSeWi30zhje39cyB4BrPiRCxpxOdGkZxpKQiV4+ZpKvcnl4S9pp3lIj?=
 =?us-ascii?Q?AJepvdeiFHYEis0BWDHdE3EqyUExEezusU+bQYIudqyWNvXn5gIipcKLOX5+?=
 =?us-ascii?Q?EI/HSZPo6a8cHj2sYsLE8XGPn5KVWW/rhbGUJlB6eeRUM917QVsU7zz1kgio?=
 =?us-ascii?Q?H+ZprkC0IyPnJVaIh81MxdPKTlSajyLVUTIBJa1ek6HNJG8tNg/g/ADlxHxK?=
 =?us-ascii?Q?GPwCyjPltOK6GSW1uqA41+wkzFTjxp53qtSF8G9QIxkpE1wNsBlhFdQ6UFUL?=
 =?us-ascii?Q?2VjFKL2MxOSIldg1koHobzhXMdxD3HMJyUrFgg4I9UPjlgLA8Wcq6arWYWIw?=
 =?us-ascii?Q?nonbtyIf5jFqhPKTyGuO4gKQfXYmHlGnQEVhHx7F5z6INWbe2goZyrews+fp?=
 =?us-ascii?Q?QAELe+kvWZ1KsFsp4SLc1cmS5Jnn0d+mNb8ktKBKArlMboKPaGSW0Z0EMx0c?=
 =?us-ascii?Q?d1ix/WQahPkjbvvHMxcNE0sc4LKtJtaaffz1WjnDwENxxpPNW/cmc8d/3Yax?=
 =?us-ascii?Q?JhKla/VPktZ21BIxHiHmAtV30tFZiSbGIiHbJdWVULav20cJlziQm1H0u0w4?=
 =?us-ascii?Q?3/4hBiNzjNV2/tQrTWK4CbTczzi0xea5Jk6oVE5yZkQiWhg3SNFdq6+nrJPM?=
 =?us-ascii?Q?Sjf9RQ=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 774281a9-6937-419c-35f9-08d9d02bf490
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2022 09:15:45.7086 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a2e0+4+nX8i+fc9T4euHeABQ6BXPwjI21mpA6xVMhpIyHdUDymSfZjJdr+K3RwRdNRU9AVdofzp67hG3yigmh2wFwB3Sj0SYGVWfoGrjR3o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1001MB2319
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10217
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 mlxscore=0 adultscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2201050061
X-Proofpoint-ORIG-GUID: SOL6C7gKUMzmJFfVXln_gKpwFKOT6aD1
X-Proofpoint-GUID: SOL6C7gKUMzmJFfVXln_gKpwFKOT6aD1
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Miaoqian Lin <linmq006@gmail.com>, Banajit Goswami <bgoswami@codeaurora.org>,
 Takashi Iwai <tiwai@suse.com>, kernel-janitors@vger.kernel.org,
 alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
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

On Fri, Dec 17, 2021 at 04:13:48PM +0100, Cezary Rojewski wrote:
> On 2021-12-17 4:00 PM, Dan Carpenter wrote:
> > This code frees "graph" and then dereferences to save the error code.
> > Save the error code first and then use gotos to unwind the allocation.
> > 
> > Fixes: 59716aa3f976 ("ASoC: qdsp6: Fix an IS_ERR() vs NULL bug")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > ---
> >   sound/soc/qcom/qdsp6/q6apm.c | 10 ++++++----
> >   1 file changed, 6 insertions(+), 4 deletions(-)
> > 
> > diff --git a/sound/soc/qcom/qdsp6/q6apm.c b/sound/soc/qcom/qdsp6/q6apm.c
> > index 3e007d609a9b..f424d7aa389a 100644
> > --- a/sound/soc/qcom/qdsp6/q6apm.c
> > +++ b/sound/soc/qcom/qdsp6/q6apm.c
> > @@ -615,7 +615,7 @@ struct q6apm_graph *q6apm_graph_open(struct device *dev, q6apm_cb cb,
> >   	graph = kzalloc(sizeof(*graph), GFP_KERNEL);
> >   	if (!graph) {
> >   		ret = -ENOMEM;
> > -		goto err;
> > +		goto put_ar_graph;
> >   	}
> >   	graph->apm = apm;
> > @@ -631,13 +631,15 @@ struct q6apm_graph *q6apm_graph_open(struct device *dev, q6apm_cb cb,
> >   	graph->port = gpr_alloc_port(apm->gdev, dev, graph_callback, graph);
> >   	if (IS_ERR(graph->port)) {
> > -		kfree(graph);
> >   		ret = PTR_ERR(graph->port);
> > -		goto err;
> > +		goto free_graph;
> >   	}
> >   	return graph;
> > -err:
> > +
> > +free_graph:
> > +	kfree(graph);
> > +put_ar_graph:
> 
> Hello Dan,
> 
> The patch looks good! My only suggestion is a readability improvement, but
> I'm unaware of the convention chosen for qcom directory so you may choose to
> ignore it:
> 
> Function q6apm_graph_open() has two separate return paths: a happy path
> ending in 'return graph' and an error path which eventually ends with
> 'return ERR_PTR(ret)'. Current goto label-naming convention suggests it's a
> happy path nonetheless.
> 
> s/free_graph/err_alloc_port/ and s/put_ar_graph/err_alloc_graph/ tells
> reader upfront that they are in the error path.
> 

Generally when code is indented two tabs that's an error path.  The
relevant pattern is "Do error handling, not success handling".  I guess
the if (IS_ERR()) check means it's an error as well.

regards,
dan carpenter
