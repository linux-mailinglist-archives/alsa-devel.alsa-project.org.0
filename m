Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B13B42D3B5
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Oct 2021 09:31:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1906C82C;
	Thu, 14 Oct 2021 09:31:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1906C82C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634196712;
	bh=c99IfLLrOX+p2M4WhVDXp62BeqkYPs0xpdZscT7iUv8=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=ZGRmoaD7cWqKjeTfS8jcqboouwUEmTOzCk3YuEMC9bZK5StqKP7nAuUcueHJi2Ub+
	 CuhhB/1TdFaQ43w+LRVEr0eeYkxHaYNG90NZxc9RfOcWw1rOR7qEH7G9+03xEjGz9g
	 CDjJkmrPomj/81AanDZeiO1QId02A5YN/WuOZufQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7449CF80245;
	Thu, 14 Oct 2021 09:30:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8A3B2F80212; Thu, 14 Oct 2021 09:30:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HEXHASH_WORD,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3C861F8016C
 for <alsa-devel@alsa-project.org>; Thu, 14 Oct 2021 09:30:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3C861F8016C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com
 header.b="Z/YHGQmV"; 
 dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com
 header.i=@oracle.onmicrosoft.com header.b="aKiNiCcn"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19E7CRuS001745; 
 Thu, 14 Oct 2021 07:30:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : content-transfer-encoding :
 in-reply-to : mime-version; s=corp-2021-07-09;
 bh=ycwP1E94/FGY7QR7FG6MW5Ujq0xeTX8vHif5BNtNw0w=;
 b=Z/YHGQmVru785ocSICRuTWTTo5fywViUf8+G0Btak50sbMjoS7Q5+LrXD7xFxxpPxD44
 hLz4HCIDG3Kpv3rtZ9bU6gfHxdgM8SLEfVsR6jl4wP684eM84AuLKQiL+QYeWwio/u5u
 fJ3VXxobXV0Ac+eYoSUKl0K2tcr/JNt1npi4jJCFGi83lFKfVe8FGmkuSK8jxPX/sP7A
 Fl4VdV8t/xFvRk4fF5kSve/zf1kX66LVfimbNDtkRdhd15Dr3G710M47CVrhzar6QiR7
 PC/Tx0tdFUQL6AU7HZ0s26ZlX4vcrRng7uscT4Ptzxv/sKpnaDvx+rHsboiUuEo7B4Zd KA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3bpfy6036j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 14 Oct 2021 07:30:20 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 19E7Ap1P094385;
 Thu, 14 Oct 2021 07:30:19 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2174.outbound.protection.outlook.com [104.47.56.174])
 by aserp3020.oracle.com with ESMTP id 3bmae24ujc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 14 Oct 2021 07:30:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fDLzYafOfGxuX2tD2HNv92K7Adjf1F/GT7wE6Hi9idqFg4t0rj2s06x8VX2T/fmOEsbdw0q30XI2rRnVMlzwbBdIqUJDIeiQhj097/KSWtH7ueJUGSloMKYm8Y/z08uQv3XaoHyJB9x8yGqCBxsKCCKT+Wu1nwTLcBY2+QK+5gwkt5ez+DvpUzb59pHHfHi6roZBRgOuz4GoLpWuPJSK5gXXVTjbzztf8MnF2v4Tjo5P3NdkSuDg6eYf0KIAPIBTWnpBL1KBNswANmK/wjqzVEmofuwxnLaxca+DRTnH7+k8N/WkBym45xlClaLEu+VdjCq/lYmKME6gHfsZPnYygA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ycwP1E94/FGY7QR7FG6MW5Ujq0xeTX8vHif5BNtNw0w=;
 b=m11UPcAu5hTOXCcZF+mTzDo0FFeeGej/TDLmMMZzm/3Pfl3Hd6Lpos9zkVX4Emu/+38ERT1IQEpES0zhU2cualKYzzg6NMgqkQwqR/1bla3RZkTA6z/UWVH08W3dJHILJQf/yltnzQRUoYU95XqB+QduH6T5zjXfeF2YnHm7VSFJhDBLfXH+XXyzM4TIKt22Y34w1AtVJ12s2Lkmt5AQcbgqBG9e1P1dWqca44iZbptDp0CJDxuQcL04v+krysXLGg67bIULN1R6KKXfqGt0B4r2B1pGRiCahMQW0i5+I1IkNCzUkddxwsnLPI4lw8lNwYSP+Egj/oS7VAyk1P2SgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ycwP1E94/FGY7QR7FG6MW5Ujq0xeTX8vHif5BNtNw0w=;
 b=aKiNiCcnmbnFLsHtshjXvmBfKnEUaF7dL3XuCFELbpVrdYyY4J+xvhGInXdrI3fI3wTWWQ9Qh+JLDY9HYW/zD63MdzfKtH3hx9WgxiIne5kwiryZYP/7uS8wLsFve0R/Y+OzP+EM6ZbXBO1Vpgc+fF2kNWhogHlTLbGMNd5qaM4=
Authentication-Results: lists.01.org; dkim=none (message not signed)
 header.d=none;lists.01.org; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MWHPR10MB1662.namprd10.prod.outlook.com
 (2603:10b6:301:a::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.22; Thu, 14 Oct
 2021 07:30:15 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9%5]) with mapi id 15.20.4608.016; Thu, 14 Oct 2021
 07:30:15 +0000
Date: Thu, 14 Oct 2021 10:29:56 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: kbuild@lists.01.org, Jiasheng Jiang <jiasheng@iscas.ac.cn>,
 vkoul@kernel.org, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org
Subject: [kbuild] Re: [PATCH] ASoC: soc-compress: prevent the potentially use
 of null pointer
Message-ID: <202110141045.aqHVHzRI-lkp@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1634116664-1784856-1-git-send-email-jiasheng@iscas.ac.cn>
Message-ID-Hash: 26FLMCOPOTJGLBJBLIW6NC6VRQ6GPLAN
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JNAP275CA0010.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4c::15)
 To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
Received: from kadam (62.8.83.99) by JNAP275CA0010.ZAFP275.PROD.OUTLOOK.COM
 (2603:1086:0:4c::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.25 via Frontend
 Transport; Thu, 14 Oct 2021 07:30:09 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 61f2f93d-0502-4f33-a91b-08d98ee47714
X-MS-TrafficTypeDiagnostic: MWHPR10MB1662:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR10MB1662B8F6EF203F51C9FC654A8EB89@MWHPR10MB1662.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2399;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: loefJf0ucDuEZEQn4GZcbV1eClqnoUtq2snfsK0b38tox1KPUMhA8C62aCoqr7VZXnrLN+RdOlP6DM1Qev8qfwLB0IE05mhi+hZH4IHc5tcDhRqA7TYOSVfF7LszMfyRg/aZwdLRl2OrYwjp6ewpAsdb7/lGVvYx4uNYQZo3TFvgDEKxGw5QBRVzrjA95vTbI11asX2XbOZYOzlxuXk6rX0K6U84CcsfVCb74m/pOiXhIeC9WNLAo4iOuZ/G9F8bHunKLmYzNvQRc71EuT4HmAoSWq71m9ekIH7nFiDtH3fWG+pN9xdh36tv2V6Md7QABKaaxnacnZWw4Gm7T/mq8/K5vujcn3lenwQRxO1OfvWGyqo0yecALDcxD44WmxZz+ND3TFl1D/hjsw2vQLjvqYc2WfFj6xt7L/G/ZI+O8IginkiwkLAy4S7LdW+11y0o5beQMROjMPPOIEAEhPb3w/PeLfS4Wz2ji2wccQ8vW5M3qzYaFwVv5PCmhdTlUzwk2MTPyn3XeG5oZ+16gaz9vR81lmnonZuhFLyRFVueH1gmX4haLtRPng9S2MW3WD/PcVK6jwe7dmNeR5roTY7uYFnottzM8T21rHtswgVfco2ws3U3NPAp8UMRSvX12WsvhmuoMBaJl9UAA6xNke7k+0SY2Coy+730+O6oRRDZ+YglEKA78bBw9TO/nrpKMLPjk80hQOKsZ2fofeULU0tjj3TX8ewZrsdbDYvI642hZs487rkL4IsrdJ01P7wuOefGrMY9/N7Beg2mSUNIwmT+gUjP5q7sVlVgYMGmKBJqJuuB9ajAs6kmb+vhLDxSnXbQfq5JRYpaL9b8B2bAOE6POw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(966005)(52116002)(316002)(186003)(66946007)(66476007)(66556008)(36756003)(6496006)(508600001)(83380400001)(5660300002)(86362001)(7416002)(4326008)(38100700002)(26005)(8936002)(1076003)(38350700002)(4001150100001)(8676002)(2906002)(44832011)(9686003)(6666004)(6486002)(956004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MzBVNHoyNE56YnZtOGk2b3dtc25OdGxCZVNpK3ZMdTJsc3NxeWdIV0hHcEJF?=
 =?utf-8?B?UUU0YkRTb01XV3FTYkdMTEVOQVNUeUNXTTk3VUZCdUNUZnNwRHpGR255Wktp?=
 =?utf-8?B?RExlcGk5d1Eyb0NSKzRSLzBIKzNrdGREYTMrVTYzOHpYMkdsS09PYStMMGFy?=
 =?utf-8?B?SURvZE5MSStCQ2hRajVDRFpBZTY2SjlXOXVpOUdjejBJQmlvZURRVHQ3cDJ1?=
 =?utf-8?B?d3NGbGtFRGN1RjF0NWdvN3VjVVVDTmhzcXlhVE92NGNYYkd3YlBTOXlWYVAx?=
 =?utf-8?B?amRyV0JJUXhSSWplbjR2TXRvVGl5aGJKaThYemF6RWxiV0VwTkVGOWJkbTZG?=
 =?utf-8?B?K2JzdDJZVGtCay9HOVhzMlpVbVZqVzljSlR1SElhRXNTNEw4TE1IL2daVlpS?=
 =?utf-8?B?bDhtWDlrSVdtRzhvYjlpNU9QS01odWpSNGZJN1h5R2Q4TmdhVE4rZU9DUFhI?=
 =?utf-8?B?WEVIb2s0d085cVNQMkJKYnlHVy9Pam1vL0QwaWxzQi9lT0tLMUxieEhDNGtv?=
 =?utf-8?B?Z2dmQk9DK1FHWnlTa3ExRXczVlJzZjRERndYU0NOYUZQeE9TK2lCM3BQYThR?=
 =?utf-8?B?TlRyU3MyR21kRHgzQW1vVkJEY2prQnl5MkdXTGlMbFZDTHE0NG93YUtWUWtC?=
 =?utf-8?B?M21iclJEQVJ5UlFYMUFQUEdPVVF1RnJSYWlVZjFadXltWDk3Z3VxMHhFNlBK?=
 =?utf-8?B?WVRNMmcvTEtzKzRoNE14WFVlNlY4T3AvcmJzTGpucmRYOGVsMkxteHZBbzZl?=
 =?utf-8?B?dTcrRFc1dGdXQjlxQXV1ekdneDhxdE45MEUwSGROd3V6M0U2RkVRdWR0bUp4?=
 =?utf-8?B?NHlLdG1MN1hNMmhUbFppU3QxWUV0MkpJOXhFMzYrSlV2RC81VmcvQXh3cTVn?=
 =?utf-8?B?d00vZWQzNDZCc0ZSNnRmcUpya0Roa1JxY3Bobk5nL2JKdUMwdy82UEdjcmRB?=
 =?utf-8?B?M3hKQ1lYMDdiWmF3akY0eVdBMk5GYzRlMU83T2dGTVlvNWVCREoxTXc5MmRY?=
 =?utf-8?B?cGZNc0xBOTB5cng0TDZXN2FVT2VzTGRQUVhwV05FZXhzOGNHMVBsZlBUSUdW?=
 =?utf-8?B?MkRnYTZHUmFTV1ZSQXo2UmJ4Sm1QUUk3dEpsQlBVNHRaMGd2Mko5dXdkeXdI?=
 =?utf-8?B?cWR0UGxOWFRWY1VWOGw5S2h2Z0tUUWhNY3I1RnRFOGVjUnRsaW16YkJOOEts?=
 =?utf-8?B?c1lkN3N1R0w2eDBtV2NURTZkVUl2UFZoVDJmcEJrMlBsSjZsVnVKRUlGYU04?=
 =?utf-8?B?L0hQY2tvaXFXUWRiQlZpZWdlOU1jTHkyNFh2V3YxQmRsdjczQWRkdks1SGN0?=
 =?utf-8?B?bXhtNmtFcWtuTC9laWpMYzNZMU5YMWZ5UVZlTTVVenlaWnlEdjIvK0gxYTJ3?=
 =?utf-8?B?WjBvTWgya1VTMmRjWVhONE9IQjRQNnRWVDI2UFdEb0x5amtaazFzb2RpdTFi?=
 =?utf-8?B?bFlhTFJCcDkwRzNzdTc4SlFXTW9ENE1vVzRyczBtcHVjRWVOdlN5VzlQRlVn?=
 =?utf-8?B?N0Q5em1TQkZqN3dmYks5K3lWRUZzK05jbmJCc3FuWnF2SUtnSVQwZUtCWHBr?=
 =?utf-8?B?dTRlc1B2Y0QzOUdSUnJFN1ZTc0lXelZhVGU5Y3BsaFNBS3dIdUxqUGd6Z2dm?=
 =?utf-8?B?RWpKOGI2ZUtnN1NuWkFjWVpUNGRVVkJCTXRVRkxxSXczUm5wSG0zSUZhZGFM?=
 =?utf-8?B?Slh3bFdVbENVSHA3SXp0blpYRjJFbEc4RTVKNzVhQkVWN2RHK2FiSE90Rlhx?=
 =?utf-8?Q?QbLBnoehMFKYreFaLLeMEH3L/sjcsmWRPAX3Zpz?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61f2f93d-0502-4f33-a91b-08d98ee47714
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2021 07:30:15.3195 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zeiBJVwAKmKSsXSjHYkr3hfw487kdfbjUWx12AXiZXuglAsm+I2e++7lCo7Yl9TgRrWjm+qwUk5DQvVXNgOGiesxRZfod7oTm4KvAO/gp90=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1662
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10136
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 phishscore=0
 suspectscore=0 mlxlogscore=999 bulkscore=0 mlxscore=0 malwarescore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110140044
X-Proofpoint-GUID: d_tTeTp3Xo7aBw2KWQyUu2rxhm_qMLay
X-Proofpoint-ORIG-GUID: d_tTeTp3Xo7aBw2KWQyUu2rxhm_qMLay
Cc: Jiasheng Jiang <jiasheng@iscas.ac.cn>, kbuild-all@lists.01.org,
 lkp@intel.com, linux-kernel@vger.kernel.org
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

Hi Jiasheng,

url:    https://github.com/0day-ci/linux/commits/Jiasheng-Jiang/ASoC-soc-compress-prevent-the-potentially-use-of-null-pointer/20211013-172002 
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git  for-next
config: i386-randconfig-m021-20211013 (attached as .config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
sound/soc/soc-compress.c:595 snd_soc_new_compress() error: we previously assumed 'codec_dai' could be null (see line 538)

vim +/codec_dai +595 sound/soc/soc-compress.c

6f0c42269f000b Jie Yang           2015-10-13  511  int snd_soc_new_compress(struct snd_soc_pcm_runtime *rtd, int num)
1245b7005de02d Namarta Kohli      2012-08-16  512  {
9e7e3738ab0e90 Kuninori Morimoto  2017-10-11  513  	struct snd_soc_component *component;
c2233a266178f8 Kuninori Morimoto  2020-03-30  514  	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
c2233a266178f8 Kuninori Morimoto  2020-03-30  515  	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
1245b7005de02d Namarta Kohli      2012-08-16  516  	struct snd_compr *compr;
2a99ef0fdb35a0 Liam Girdwood      2014-01-17  517  	struct snd_pcm *be_pcm;
1245b7005de02d Namarta Kohli      2012-08-16  518  	char new_name[64];
1245b7005de02d Namarta Kohli      2012-08-16  519  	int ret = 0, direction = 0;
a1068045883ed4 Vinod Koul         2016-01-07  520  	int playback = 0, capture = 0;
613fb50059cf19 Kuninori Morimoto  2020-01-10  521  	int i;
1245b7005de02d Namarta Kohli      2012-08-16  522  
7428d8c8bd7936 Kuninori Morimoto  2020-10-30  523  	/*
7428d8c8bd7936 Kuninori Morimoto  2020-10-30  524  	 * make sure these are same value,
7428d8c8bd7936 Kuninori Morimoto  2020-10-30  525  	 * and then use these as equally
7428d8c8bd7936 Kuninori Morimoto  2020-10-30  526  	 */
7428d8c8bd7936 Kuninori Morimoto  2020-10-30  527  	BUILD_BUG_ON((int)SNDRV_PCM_STREAM_PLAYBACK != (int)SND_COMPRESS_PLAYBACK);
7428d8c8bd7936 Kuninori Morimoto  2020-10-30  528  	BUILD_BUG_ON((int)SNDRV_PCM_STREAM_CAPTURE  != (int)SND_COMPRESS_CAPTURE);
7428d8c8bd7936 Kuninori Morimoto  2020-10-30  529  
6e1276a5e613d2 Bard Liao          2020-02-25  530  	if (rtd->num_cpus > 1 ||
6e1276a5e613d2 Bard Liao          2020-02-25  531  	    rtd->num_codecs > 1) {
141dfc9e3751f5 Charles Keepax     2018-01-26  532  		dev_err(rtd->card->dev,
6e1276a5e613d2 Bard Liao          2020-02-25  533  			"Compress ASoC: Multi CPU/Codec not supported\n");
8151d5e60232d3 Benoit Cousson     2014-07-08  534  		return -EINVAL;
8151d5e60232d3 Benoit Cousson     2014-07-08  535  	}
8151d5e60232d3 Benoit Cousson     2014-07-08  536  
1245b7005de02d Namarta Kohli      2012-08-16  537  	/* check client and interface hw capabilities */
87e5451ef9ec85 Jiasheng Jiang     2021-10-13 @538  	if (codec_dai && cpu_dai) {
                                                            ^^^^^^^^^
Can this really be NULL?

467fece8fbc677 Kuninori Morimoto  2019-07-22  539  		if (snd_soc_dai_stream_valid(codec_dai, SNDRV_PCM_STREAM_PLAYBACK) &&
467fece8fbc677 Kuninori Morimoto  2019-07-22  540  		    snd_soc_dai_stream_valid(cpu_dai,   SNDRV_PCM_STREAM_PLAYBACK))
a1068045883ed4 Vinod Koul         2016-01-07  541  			playback = 1;
467fece8fbc677 Kuninori Morimoto  2019-07-22  542  		if (snd_soc_dai_stream_valid(codec_dai, SNDRV_PCM_STREAM_CAPTURE) &&
467fece8fbc677 Kuninori Morimoto  2019-07-22  543  		    snd_soc_dai_stream_valid(cpu_dai,   SNDRV_PCM_STREAM_CAPTURE))
a1068045883ed4 Vinod Koul         2016-01-07  544  			capture = 1;
87e5451ef9ec85 Jiasheng Jiang     2021-10-13  545  	}
a1068045883ed4 Vinod Koul         2016-01-07  546  
a1068045883ed4 Vinod Koul         2016-01-07  547  	/*
a1068045883ed4 Vinod Koul         2016-01-07  548  	 * Compress devices are unidirectional so only one of the directions
a1068045883ed4 Vinod Koul         2016-01-07  549  	 * should be set, check for that (xor)
a1068045883ed4 Vinod Koul         2016-01-07  550  	 */
a1068045883ed4 Vinod Koul         2016-01-07  551  	if (playback + capture != 1) {
141dfc9e3751f5 Charles Keepax     2018-01-26  552  		dev_err(rtd->card->dev,
141dfc9e3751f5 Charles Keepax     2018-01-26  553  			"Compress ASoC: Invalid direction for P %d, C %d\n",
a1068045883ed4 Vinod Koul         2016-01-07  554  			playback, capture);
a1068045883ed4 Vinod Koul         2016-01-07  555  		return -EINVAL;
a1068045883ed4 Vinod Koul         2016-01-07  556  	}
a1068045883ed4 Vinod Koul         2016-01-07  557  
a1068045883ed4 Vinod Koul         2016-01-07  558  	if (playback)
1245b7005de02d Namarta Kohli      2012-08-16  559  		direction = SND_COMPRESS_PLAYBACK;
daa2db59ce7e36 Charles Keepax     2013-04-18  560  	else
a1068045883ed4 Vinod Koul         2016-01-07  561  		direction = SND_COMPRESS_CAPTURE;
daa2db59ce7e36 Charles Keepax     2013-04-18  562  
09f448a415ece4 Amadeusz Sławiński 2019-06-17  563  	compr = devm_kzalloc(rtd->card->dev, sizeof(*compr), GFP_KERNEL);
7a0cf42edd9cc3 Markus Elfring     2017-08-10  564  	if (!compr)
1245b7005de02d Namarta Kohli      2012-08-16  565  		return -ENOMEM;
1245b7005de02d Namarta Kohli      2012-08-16  566  
1f88eb0f0660f8 Charles Keepax     2013-02-05  567  	compr->ops = devm_kzalloc(rtd->card->dev, sizeof(soc_compr_ops),
1f88eb0f0660f8 Charles Keepax     2013-02-05  568  				  GFP_KERNEL);
09f448a415ece4 Amadeusz Sławiński 2019-06-17  569  	if (!compr->ops)
09f448a415ece4 Amadeusz Sławiński 2019-06-17  570  		return -ENOMEM;
2a99ef0fdb35a0 Liam Girdwood      2014-01-17  571  
2a99ef0fdb35a0 Liam Girdwood      2014-01-17  572  	if (rtd->dai_link->dynamic) {
2a99ef0fdb35a0 Liam Girdwood      2014-01-17  573  		snprintf(new_name, sizeof(new_name), "(%s)",
2a99ef0fdb35a0 Liam Girdwood      2014-01-17  574  			rtd->dai_link->stream_name);
2a99ef0fdb35a0 Liam Girdwood      2014-01-17  575  
2a99ef0fdb35a0 Liam Girdwood      2014-01-17  576  		ret = snd_pcm_new_internal(rtd->card->snd_card, new_name, num,
d3268a40d4b19f Qais Yousef        2015-01-14  577  				rtd->dai_link->dpcm_playback,
d3268a40d4b19f Qais Yousef        2015-01-14  578  				rtd->dai_link->dpcm_capture, &be_pcm);
2a99ef0fdb35a0 Liam Girdwood      2014-01-17  579  		if (ret < 0) {
141dfc9e3751f5 Charles Keepax     2018-01-26  580  			dev_err(rtd->card->dev,
141dfc9e3751f5 Charles Keepax     2018-01-26  581  				"Compress ASoC: can't create compressed for %s: %d\n",
141dfc9e3751f5 Charles Keepax     2018-01-26  582  				rtd->dai_link->name, ret);
09f448a415ece4 Amadeusz Sławiński 2019-06-17  583  			return ret;
2a99ef0fdb35a0 Liam Girdwood      2014-01-17  584  		}
2a99ef0fdb35a0 Liam Girdwood      2014-01-17  585  
2a99ef0fdb35a0 Liam Girdwood      2014-01-17  586  		rtd->pcm = be_pcm;
2a99ef0fdb35a0 Liam Girdwood      2014-01-17  587  		rtd->fe_compr = 1;
d3268a40d4b19f Qais Yousef        2015-01-14  588  		if (rtd->dai_link->dpcm_playback)
2a99ef0fdb35a0 Liam Girdwood      2014-01-17  589  			be_pcm->streams[SNDRV_PCM_STREAM_PLAYBACK].substream->private_data = rtd;
d3268a40d4b19f Qais Yousef        2015-01-14  590  		else if (rtd->dai_link->dpcm_capture)
2a99ef0fdb35a0 Liam Girdwood      2014-01-17  591  			be_pcm->streams[SNDRV_PCM_STREAM_CAPTURE].substream->private_data = rtd;
2a99ef0fdb35a0 Liam Girdwood      2014-01-17  592  		memcpy(compr->ops, &soc_compr_dyn_ops, sizeof(soc_compr_dyn_ops));
aeb6fa0f15c71a Peng Donglin       2017-08-16  593  	} else {
aeb6fa0f15c71a Peng Donglin       2017-08-16  594  		snprintf(new_name, sizeof(new_name), "%s %s-%d",
aeb6fa0f15c71a Peng Donglin       2017-08-16 @595  			rtd->dai_link->stream_name, codec_dai->name, num);
                                                                                                    ^^^^^^^^^^^^^^^
Other code assumes that it is non-NULL and doesn't check.

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org 

_______________________________________________
kbuild mailing list -- kbuild@lists.01.org
To unsubscribe send an email to kbuild-leave@lists.01.org

