Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A6A50644F44
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Dec 2022 00:04:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3AD5118A0;
	Wed,  7 Dec 2022 00:03:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3AD5118A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670367844;
	bh=BKRUmR9QMdjUO7DGpgP8IIm7SOjojwb+/HvW6frjYik=;
	h=From:To:Subject:In-Reply-To:References:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EZf92rJ9jOpCW+4GfNOHZN8vNSNqL6hzxJO7AyuZ7vxsSOQg2cXOyhcnr526eKv8W
	 KxCyWELnrFL5Nmkt676zcK6Qc2Zos1ZRUv3JAn9S+Hz/WN3pNj1+uLDbNQF9sXW6y2
	 PRQbdQAdva1P3ur6/EiCW29kwrG56Vi/Vq7r2Uc0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D978CF80290;
	Wed,  7 Dec 2022 00:03:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DF270F80246; Wed,  7 Dec 2022 00:03:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2071f.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::71f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D9864F8014E
 for <alsa-devel@alsa-project.org>; Wed,  7 Dec 2022 00:02:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D9864F8014E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com
 header.b="CnKzFply"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VuFObXZZgnNU8oVoEZtoEylaZ2KHuyiTYBJgWIQqshMKa9Ua564ny7JQGgSwVQKW7EZHYkAt8sOIw7n4dmJY6fnUlYBWlrc9vEpPXLCjNWdQ4YOtzBUQc+VOl58hJEkLM0dJWyKPAKzyvIc54P3PGVF6BGMbxF1HIlM9pCmT6x+sffhRBU5/vwW8Dxse7anXncGunxFjTVPgjnY1UoLdgA7RFD25pS0TD02hlYRoQ2wP0Cl6qh7pfG15r1OlcYeK7MIQDdViL5ET7e3s3n6OZ5pP5vX6vuIPfgM9A2KM5j7dcqKtyI6dK+pjRcxqptxfeo2fwvfTgq/nhv8CdlNTgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iVA7f+tcCry9zw5esI3EZ29YZ/XKE6+pv0k8ay6FdOA=;
 b=IDUiSMZ11tuWKA/N/1nhsGvriV+5qFcJo5UPkOQ4lGR/mx5bYseHXk175c7vEA6JDb8aSznQIcvQEchjEXJOK9+eHVIerRK/N+PEb66Li4ZOloOIm+tCu3jx/OP9K14Hq//4h+CwS4mlxkONCkbJgxsyngTvoqc/EC4oC6ECDIGz6J3CHkaQY9tAc3bxyg4fR5OSUC3kBymzeIhV5BFvSH7fiqborBcJKustFlS/g2qI2Ieu8SqEO3XFpJj5Y/oNcP8WcI9ArxMo+HmDkaH0dAltLarlFtgKmnONqVquyj3FzJi/fhltFBQ7a/IhNrSbtvbuLmttUuipmNR6SnQaew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iVA7f+tcCry9zw5esI3EZ29YZ/XKE6+pv0k8ay6FdOA=;
 b=CnKzFplyki57ZFTyDKZUpHZWAx6gdCtS43i6MSGf1tNQCovl4IRDOmbLm4ijsWMDCV0RL+fmA9n4jOq7pIXsPbx414kmt7Psv3IdPNmJ/eQqw4zYNRcWYnXo9SrfMyePimfjappYryOWLTwODffbxnNn1MEDf8NJerTqB/RuzEI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYWPR01MB9679.jpnprd01.prod.outlook.com (2603:1096:400:225::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Tue, 6 Dec
 2022 23:02:51 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::a5a6:2344:db9:431]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::a5a6:2344:db9:431%8]) with mapi id 15.20.5880.014; Tue, 6 Dec 2022
 23:02:51 +0000
Message-ID: <877cz4m8yz.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Wang Yufen <wangyufen@huawei.com>
Subject: Re: [PATCH] ASoC: audio-graph-card: fix refcount leak of cpu_ep in
 __graph_for_each_link()
In-Reply-To: <1670228127-13835-1-git-send-email-wangyufen@huawei.com>
References: <1670228127-13835-1-git-send-email-wangyufen@huawei.com>
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 6 Dec 2022 23:02:49 +0000
X-ClientProxiedBy: TY1PR01CA0187.jpnprd01.prod.outlook.com (2603:1096:403::17)
 To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYWPR01MB9679:EE_
X-MS-Office365-Filtering-Correlation-Id: 44393721-4cc5-4459-09d6-08dad7ddff47
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Hh+WajaXpg1jta+W++dUneXS48so7ow5lbJG0iYkPJRK2FXeswURmWpXH3eco5/ctvGgk+MZHZEaNcK+H8pgcu5Pp8TFbIKfVTnPu98JcJ5l7GCjgvxKat1yntN9VstJTef83B32NY5uz8DWdYRNp0e4iziEbHHAjZv/jMm5i66N0hM0DF1WZ0Rwjnxi/NiMeszOdAVOpH4OhZ+wn5ibsnGXrR1+3BRt32dPhPP4xT8pQtrK8kHM+pswVrO2ok9sUMPcgw/sEu3nLg59GHVRcKL3zwiOmKpEw6n3VqETrSTGE3707ke24Dc8wWWlbCNs8AoCzj/eMyX9uoRa7DtENgkPaO0Yc2BJ/AL8yxWlaDNmdfzJJYUJF4Jii2rMWKUWR15IwkVQ/Rgll2FAe4xYziEv76xbv7vEc4i5gwW0X/9xI6ciESK4PQ1YFS64cAUFkTX+ZK5eIAk/skgCiXMRWPXoJLYBMIBDuRU0v1uOOcI0NfgggvuCrWAfpuql6p06eESCHTUP+IjJawuav54KNo3IpsmDeYszpE0+zC7i7JyvhJIZCMpYhjOaoVXeWm4PBSPRqx7vxrMzwqs8xPgvUc2NT1RWCgZ6fQ/xXDDzuB3YOqPykiFOt1xOuRg5crhw4NUvrHV9x7Y9WYz0mnXi0uEt0Py1SoQAzf44xkyQGvEu4ZcN75pvZ/9BZy26/uxx
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(396003)(366004)(346002)(376002)(39860400002)(451199015)(2906002)(38350700002)(4326008)(8936002)(52116002)(66556008)(66476007)(8676002)(66946007)(6506007)(38100700002)(6512007)(5660300002)(83380400001)(186003)(478600001)(36756003)(6486002)(2616005)(54906003)(316002)(86362001)(26005)(6916009)(41300700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Q0/3baUYbABdb38ypEr3kvtqBvnGOmC1ExuxI2DWvMoru70buC2/Grzr56zD?=
 =?us-ascii?Q?+MU/nobbC2XbWl2prQV3bfgWLJv8aDgPxJZ4vlDE0xR3XnRr06KwBERwgBBm?=
 =?us-ascii?Q?imVMHMR6NWjCaRyxC9MVv7o2gcgOfGcJxfYVEwR2q4GKn2RBvm8K+sfAngK7?=
 =?us-ascii?Q?IrKh88cc93kRTYzx2wIIVOjOrIxnyOlk5JL4glFvDsMq/Hkd1qHb8Oh41rlg?=
 =?us-ascii?Q?cxni6+lbkyoiae4fgBBoptlOBVbA31AY1CX+Y5MhWy8cK7M7vJTTmcDZAjnN?=
 =?us-ascii?Q?Y8SMtjHN/WJcOIw2NyKPWUfDPQ1HRKxhS43f136U+GIhv1nweJYUPa8OIRSR?=
 =?us-ascii?Q?MN3mTX6HyLmcEAn2j0Hz+ij7WREPuuTlcideDWioPbHE+h1UoN1TFjLp4hiT?=
 =?us-ascii?Q?kHQ7piaPDP9Eq2AiLQYdrg03LRUMZ5kgDnUOtUABTKiYZzUta9AbsEAS63sK?=
 =?us-ascii?Q?Y+vAXEKBlnIG+mMnZiPNKWY0MAx1ib0ZiExWMU0pK4hP4aq2y8IwQrzK4+47?=
 =?us-ascii?Q?G9ePFTxcQfs3mQrs0/HjKt23qF8AK+OSD8Y87t+aWt5qNGtNgD9DkqIJy7i+?=
 =?us-ascii?Q?txKdXo9VZyZj+7mTRoWof+4JssLKkp+b/lPVQ1uTGOiNIx2o2TkKeCdB/L3F?=
 =?us-ascii?Q?WxYZcw+KL7CiiUz7y2Xpc5cdzZe/zFR3Nv6YVwLPFqAUl9c3KHYwG6ae+KN6?=
 =?us-ascii?Q?7OZH2g+jsmw5hvU2uizgh/yIkFZ47QaV/me5K4zvCRrX1YqvpDGhA/72g9AA?=
 =?us-ascii?Q?wjKnLIwICdFCWgR4VrUZBbKK3Sz1kOnax1EYOFTtDI5Yoi9Vw5eoTRfHjpOt?=
 =?us-ascii?Q?C+xf6Rb+qyOG8Zm0Wt3zWPi5cmvfkmHEndECzyBmWoCIBuaouGGo5gXIzdJy?=
 =?us-ascii?Q?smH2Leks7j7w2Q1ewg30WRvnf1TNKthYuafWzgEz3D1HMoUPvnzvD/nN49VA?=
 =?us-ascii?Q?7IvNHjghXgfD57kB57N/oXsSZ/RIrhV6D7DOqidVE7xgXG4Xy0ByRyfGFAs7?=
 =?us-ascii?Q?2VueZhhedWaXtkdS0suYs5LB+iCDWr6TSqYnhxF3S11Tu0lgcI62wOKBCILO?=
 =?us-ascii?Q?nnUoPnpidgUtFUerQlQB5MYOMQ67QSzxFLxzoAOQ6fJ+p1qjv9lgjn8tF9j2?=
 =?us-ascii?Q?wopv75cRLN1i2PnPFKtzzhnpi7SMzsxnnfprZ7Ld+Ivk6um/mTtLrGqEmFjV?=
 =?us-ascii?Q?VTXNV7Bh1RWRZy35Uv41kLbcJMJxmo4aAFY93ZZjxVbM5Bs2hYPtdPsRX7Xq?=
 =?us-ascii?Q?S56OfrJ2A3G4MAB5L79oYQTgt/5Gg5fM6m0bQx2vOV7nCdd1bAZP624JkG8g?=
 =?us-ascii?Q?IBmX8lwLVuzYiA68aiBHRzO69b+2m5DNxpuXwoEbt/YA+fz5SSOf2fRjBbst?=
 =?us-ascii?Q?WCd6bhAYvcJOquYxf4E2si1XWFR20105+D4+0LCmFE+09w+Ah28hIA2iBynZ?=
 =?us-ascii?Q?O4FOVfrphCiPZpOCQNi4hgti1ETAK16ohDGuWlnoQNxkKUtOg+oOSmDJcdcZ?=
 =?us-ascii?Q?6DgXZpEQVI6qHjm9EQoiV5INke7aD3mzID6NFLAptksm+Yvgt3CjSWgYpi7h?=
 =?us-ascii?Q?vAi1oecjZ4Og0mhB3izx5Rhcg1wHydt5gLqI/i1obvEq5Eq/DTPkujtbsSbg?=
 =?us-ascii?Q?jGYzk+b618YsuNzyDlrG7uo=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44393721-4cc5-4459-09d6-08dad7ddff47
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2022 23:02:51.5071 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M8883PmLnrEGsIAGsa7AaNVZnTvQ1hjlglW1YZ5xtcFFE/5mx5HvF9Jnm1WdJE+kND+kzZsx4vGS3eaWlXqhYDyYIluM0wRQ3f7E0Rvz5XLcuOFQ7L6q1q5CvLmOhXcr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9679
Cc: tiwai@suse.com, broonie@kernel.org, lgirdwood@gmail.com,
 alsa-devel@alsa-project.org
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


Hi

> The of_get_next_child() returns a node with refcount incremented, and
> decrements the refcount of prev. So in the error path of the while loop,
> of_node_put() needs be called for cpu_ep.
> 
> Fixes: fce9b90c1ab7 ("ASoC: audio-graph-card: cleanup DAI link loop method - step2")
> Signed-off-by: Wang Yufen <wangyufen@huawei.com>
> ---

Acked-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

>  sound/soc/generic/audio-graph-card.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/soc/generic/audio-graph-card.c b/sound/soc/generic/audio-graph-card.c
> index fe7cf97..5daa824 100644
> --- a/sound/soc/generic/audio-graph-card.c
> +++ b/sound/soc/generic/audio-graph-card.c
> @@ -485,8 +485,10 @@ static int __graph_for_each_link(struct asoc_simple_priv *priv,
>  			of_node_put(codec_ep);
>  			of_node_put(codec_port);
>  
> -			if (ret < 0)
> +			if (ret < 0) {
> +				of_node_put(cpu_ep);
>  				return ret;
> +			}
>  
>  			codec_port_old = codec_port;
>  		}
> -- 
> 1.8.3.1
> 
> 




Thank you for your help !!

Best regards
---
Kuninori Morimoto
