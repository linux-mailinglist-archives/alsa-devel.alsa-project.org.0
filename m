Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AFE7674D85
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Jan 2023 07:57:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8F2212DC7;
	Fri, 20 Jan 2023 07:56:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8F2212DC7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674197855;
	bh=ECdyxaQeJAqRl5Y6Y/CXCyGfDY8/jekXQHF+AhGaWG0=;
	h=From:To:Subject:In-Reply-To:References:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=rsusoZBOU2CIm2K2y3SyGCfXvESmt6bCEvXtQ/M5FiuOwrIj3bOAgBxk7ByUTfvTe
	 eC5oNbKKBD80OR7BfcZrxLZS+VyhjtXGqQjIEOx39ejlBUuj7T8L88/tfHg//cB79v
	 uBz/qFgwyBmAZ+kDw9AUXqMVar//Q2/raN6yuTVc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D23E9F800F0;
	Fri, 20 Jan 2023 07:56:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 30EFCF8026D; Fri, 20 Jan 2023 07:56:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
 SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2125.outbound.protection.outlook.com [40.107.114.125])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 66F43F800F0
 for <alsa-devel@alsa-project.org>; Fri, 20 Jan 2023 07:56:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 66F43F800F0
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=ht1VbXUz
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WBafaJgbqQA3rWl81vOIh/6GtGzRK/nicOXM3A5Uv3Awl9rsYmTOfaRHMCjiNzSXf5y46/nmVTHX/bm+/FdYItq2K5NxuICJVNvvNRnHa2HJ4c00tkrSLh3ej6ZWoEmDoCD9DsbImOeKWt1myoRcbZ4gQT9wJePrMJUBK7Ty2z/PVabggHikfIyZcsqETJWHkUEYqreojPsEnu6R964Q6m8w3dl7yPq7i1kht/bjNMxLqwvxjhGTEzV8GkOkerojzE+GLgbVODO0z0iQ3C6OokAbhS/lp9WM8gt9WzXzeg30sFK6B/ymAjoGs5vk97rYuyiQx6sWb6gySBBr2PJ9PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YVOjUz2BHQgDLQSI7cZZy1SN/VxZ33DYBtP7LuzDz18=;
 b=EHURalEbPxE5HfLfvPfRwyjVjtZalW5vCnrVaJkk99E5zZmjR1czIJdCxUx2O56OEyH5SyczAZk7WM0ZfiQN/gNpdNYc019vRjdyiQm19rXq6bv8ONEduX6LOhlNzv+x78kR3LvuGIEGoRYUdIPGL2cZCb8DLCuPiIjAR313J68vOpN/8GTx2pWaqN57jxqzeV+Vikvo19xW5MBxKOT1gLEfGc1qC74WfShCoBe5NNpFfGXAAaJFplv9qDS/VSLdxAjzJSSsfFGwweWZrCwQut137QBxtu3GmIzRPCOzpiLB/H2ZGINUqAQo72Wuip1SkKxaiAAeFGKDq13UOCT/6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YVOjUz2BHQgDLQSI7cZZy1SN/VxZ33DYBtP7LuzDz18=;
 b=ht1VbXUz8qlqLu0U3nO0pGLovBskJQzvfig8IUCqzGlnUP0E5Kg9jnSC/i+ylEsk0lXlBRnRda00Q/espzmqttA8btx0Bf5LO5TErdxC/G+PJr3q7OBBDUHGhEO3TjOFK2wi7pCMbt2YTOvBYNBCkySdC8D0hYZajJ7j/wmgGK8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS3PR01MB9301.jpnprd01.prod.outlook.com (2603:1096:604:1ce::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.27; Fri, 20 Jan
 2023 06:56:26 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae%4]) with mapi id 15.20.6002.012; Fri, 20 Jan 2023
 06:56:26 +0000
Message-ID: <87bkmtlmn9.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 00/25] ASoC: use helper function and cleanup
In-Reply-To: <87ilh1lnbq.wl-kuninori.morimoto.gx@renesas.com>
References: <87ilh1lnbq.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 20 Jan 2023 06:56:26 +0000
X-ClientProxiedBy: TYCPR01CA0042.jpnprd01.prod.outlook.com
 (2603:1096:405:1::30) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS3PR01MB9301:EE_
X-MS-Office365-Filtering-Correlation-Id: 94b362e2-1c61-4449-3cf2-08dafab3733b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4TtzBaAjj+kF2aK3t//IS47tiyE4u59MVoT7bLizV1BEiSPF49RbBbOIQmjELGBoQEpSVijcW7n/LNwVbh/s9Jx/+DAFxaniI3So89a/VuBO8dgeCA7/GdlQs3F8iB4xUh/NKwT3Qv3XsUCB4IHeYNDY7cLrRopHoPL7w5Gfrg+9QzAwUJGyTFeEP2GJbrnlxFYIMFc2TljeHOLfT/xpCRYabxe+WrTX1S/pKitgYNSGhC0wEEMBWSloEYDvwxsyCD76gWo3TZvZ6RCYYc/DzehzgB6viUIEW4a/FB8NO6unLHuNOfhxTWGpMOv1f5r4QBDMS6mRk1AfNk0xHGyxMyCIkJlOrc/ZJpd6FmtV/KDtkZ9FCx8qGA3rV7hWY+OlPHQYSOhgnFrX0ZvApjhbH/5bpGaTnu5Wtnndw3QrbyigW0bf+Ycc3gLVCh2u4LMHJI7/AHlMCgTzNH3BW4j+qgzPGxX/ckKZCv/LRzDByFxJSi0Q0bQ6mPcTikW5MU2Vv6mB2ppQsHkcDL3CgBYMzZWxG2CH/wYiUWo6VArt+0lwPux/9XxMLEWmmSjuilnvIYnz0fqz3lK9wmycUcY8oBlo3WVaUkfrvtxtDiQ/3fHK9oR1P/Sffh+rJuLuBjjZXVL3HPrmECFz5XgFtTauwGR/basfkVA971khrnRq5bhTTCImyI0QMiQq6OPCJr0vcvkeLMD1HGT4fasK4nyQQM/XSB0v1qjb7zgOcbqH06c=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(39860400002)(376002)(346002)(396003)(366004)(451199015)(6506007)(478600001)(6486002)(52116002)(4326008)(66556008)(66476007)(8676002)(66946007)(316002)(186003)(26005)(6512007)(5660300002)(8936002)(2616005)(36756003)(41300700001)(6916009)(4744005)(83380400001)(2906002)(86362001)(38100700002)(38350700002)(21314003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3CnQgKgb19jRmJUgv0TPxAvW7X6cHDyDaFY5mmgObnos74nA2S8yXF8ILCPT?=
 =?us-ascii?Q?XVsnGqkUDQePVyF36daNDXuTL9j4OHJYP/40NPB5lfVt8a6Un4tiG9VTG0bN?=
 =?us-ascii?Q?67oTN+N459ePqnbUv/HRxixGRmdtabzQsHlVfm0TNPFubZ40VBXNXg2fwZEG?=
 =?us-ascii?Q?J2LI+RqJ62hZW8weRjp4YSiPZMDB9YC9pObWseAS45+mjThwUo3T6AKgrVRA?=
 =?us-ascii?Q?dD+wSgbrtqC3j665kkURNuCcQtOiW+REo0lJZdh7IWVGgVwvthOFbrFyaVj6?=
 =?us-ascii?Q?s8gcXju0fXFpi2kJJ2cWO47/2Mc0nYn1wvOQdhaMqB0n5o7tZVrRwc4JNYxR?=
 =?us-ascii?Q?xUifHLd8iLy/SXzy6lwPysrrxeeL4XtkCXZIM645/oWkMXV1UytAKad5ZsxD?=
 =?us-ascii?Q?OGHuKmfJGxtvPRoNtwfAbxM5eBzuyxmvixXQHtJw/G/5rwhl9beBqE52BpKy?=
 =?us-ascii?Q?8TKRk2ypghxpwuohWn5K39iZgFgomatNOHoaY/5t6cjyq571h5CPxXDD6iTx?=
 =?us-ascii?Q?40l/MDygX0UkZHDE+YSHFvWcSpsfV0gG5MdChBO2o1LaY3mHvY6EuP0xG/Ti?=
 =?us-ascii?Q?83FYQowLpO8R0tgsSWeV5oFxfb/nPfbX3r8r/hbjNzmges7Dg1l97uMRkHzF?=
 =?us-ascii?Q?X+0muPds+CdLZ7HDeewUaYyJeEijpu4ip6bYWAjTFasS4gBrAPCEwnRT29bw?=
 =?us-ascii?Q?BVpGI69iED23FbTmNeJ45lMeoqUEk9HN/NQ5Zg/ILOnsPNUnOacSx9LqOKIV?=
 =?us-ascii?Q?OcBvohK6Dlj5ofdLZuAuwV7fnlysGeqzxnMIYnLZBRXbjSJqGDvu1r+f10KD?=
 =?us-ascii?Q?KHzIiYbdo+ltUH+23+osI17LIXYMWE1Dev65/fQpWZB1zm14T15wiktOUMjA?=
 =?us-ascii?Q?95CTggWDEehgtmcqgLsiqrv3UzCKNWUEXsgFprnbAIoTjA6N3Io/I5VJxtSk?=
 =?us-ascii?Q?QbvCjd1goNIzcRomnJGhcL4+siyNDNr7bnW6zYi4Y/v+jBNLu75rOkgPSMN/?=
 =?us-ascii?Q?YfHFwQuOis41GfjcvXXqpyPsTso2LcI6tpIAGfrplGJZeStSWV4nndPJo3T/?=
 =?us-ascii?Q?usbvt+VFlh6dJjd7BzdXs9qdBhIZksxG2CINMAqGil9JRF1CLdwPCrw37mpE?=
 =?us-ascii?Q?A+ythf615z5dkegLAarOyrGkfjolCABarA3e+qyMh80BMUP+eXPQoIgwHT5g?=
 =?us-ascii?Q?qcZDwr+UMSux3uWHgZvozyE3FyM5snBAhH6YMRqLXEXY0NOW5SV+QezP31Nn?=
 =?us-ascii?Q?B+qM9Bu5vgX7LrFr4siCHMkuEbDBCoC70WcueEiMQTCv7cTYBFjdXXOA9MmN?=
 =?us-ascii?Q?/USB/NKwdJDGcxRhPqgLJXNwGPG7l3Uv+f/OcTNfLMeoNQQE29wQn0OwHJOX?=
 =?us-ascii?Q?SCjPeOflFCHJyOT3ACbaVWWCRCG0MtXQSWz8o3zO32c9ZLDBA+BMhv+qmsaN?=
 =?us-ascii?Q?WEWfT2DOoYsWPnJx1fT7ZPs4FhE1ZKUfcXcGGXgJ3Eg2MD6NzAq2kXBvDSDh?=
 =?us-ascii?Q?80JNNXIPc63bZCYC2m04UEt5w4CAMpj3qB6r8aqI8RY7xutu17Vqe/SyzybU?=
 =?us-ascii?Q?SduRfnSQBYfY1U38cWznzZ0S3A908iter4ThRMYAjN6CR/tvuQpNYext5cPt?=
 =?us-ascii?Q?c6xIFmQRaPjkFM+alXrNntc=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94b362e2-1c61-4449-3cf2-08dafab3733b
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2023 06:56:26.8198 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xPGh5JjUIbk7xVBW3HS31zS857nI+IVfZuOhwz8k+TbpBtfCq798RNH066PDi2040YFUdBYkFJjP9BVox1ev1ej6uLjQZ9qumRe5YU2zYRM14FbU+9Jw4x88ffw7NLez
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9301
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


Hi Mark

> I'm posting about DT schema fixup, but it seems take longer time.
> This patch-set is 100% independent from it, so I will post it.
> 
> struct snd_soc_dai need to have info for playback/capture,
> but it is using "playback/capture_xxx" or "tx/tx_xxx" or array.
> This kind of random definition is very difficult to read.
> 
> This patch-set add helper functions and each driver use it.
> And cleanup the definition.

Posted messages are rejected.
It seems too many Cc members are added.
I will repost it, again with reduced member.


Thank you for your help !!

Best regards
---
Kuninori Morimoto
