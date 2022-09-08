Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 86CA45B12A1
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Sep 2022 04:45:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0D1711697;
	Thu,  8 Sep 2022 04:45:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0D1711697
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662605151;
	bh=hJwg7QiYugL9PsGyoGgR9U5ySd9lpV88AAHgbTNCk3o=;
	h=From:Subject:To:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=n1t1GrYJLA9HD2d3sY51BEDQp6IGJsjQtpZJeLb5y3sJsq2tETqt3s0u+58/Zbian
	 Sid0MG+0H9QRzyw1Zh/miauwcOP2poXuuOOSGzLwAEC4T+NELI3i91WzU4JcemQwsk
	 /JGYt9g31bwBtoImPGX/fag52ZDQa+KdXV+w56m0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6B293F8023B;
	Thu,  8 Sep 2022 04:44:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 08B4EF800CB; Thu,  8 Sep 2022 04:44:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.9 required=5.0 tests=AC_FROM_MANY_DOTS, DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2130.outbound.protection.outlook.com [40.107.113.130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 59A4CF8016D
 for <alsa-devel@alsa-project.org>; Thu,  8 Sep 2022 04:44:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 59A4CF8016D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com
 header.b="AsUOv7a7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FD6sRD3ngJ5uNyrD/PKLvtdyQVfKRTFB4bUH6MbzDkaFjGHeLOcQb4tAlpmAZIuvrqwaPB0B6QvkssY8/JtXkj7U14FP1AhPrdNLiZc3CLXCBr28vcNNpYdM6Td1SD23+flAud9HrWCw6IE3k0kpipehSNbLtqqETE0PU9QavvlOQo2jPdJzVUzRBRgW48S67TQ4gpjNRj+b6N6gRS+6TGmOMaqbChYPxT1dTKqXcl3a1f/I/OvhYmnsqSIur/OZ1ttlefcdfujNwZSU+zTDJZgBlBn32A0sV2U4lQN8GBDZ7jKPQ+sTyYKKXdrX+1oTuN0Q+tPXnt+WKcGgCSrE4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3k4hohOJp//1Rbgb9QI9dmUYLsfdNpwnn5tObPXCunw=;
 b=mrxgd5/m9+yyrc4b+aW3Tu80Lc2s+JnYQVu1mLhip+ke/NXAiFp34IhM8eYUGsS/0lN2N3vzw/MkYPzaAE5poGvaXZf6/Pm/gwNnchUVikJ39YXKyXlibmkNN7W1KQwElzDcI9ns2Y4w7iOcqqvAArRKPBXB/E/VbxyL7E8flpw4TmPXOv30hHCMy8LmK3ovVy3Ai7dARLkgOTQJRwvRMk+p0Gssz157Mvk2jROiN3+l9H81hnb45LY7mZc6eju445rDJj1DXK9EDi97qa4I8xA+79oXm77e//a9cNfX0WFhcZXha//lsVH95eAHAjq3TN+HFkwa8ZAectz4/9YtpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3k4hohOJp//1Rbgb9QI9dmUYLsfdNpwnn5tObPXCunw=;
 b=AsUOv7a7jsesNRDNqhKXFt66k/2H5bIsPd78ZsUc+8iZ3Mqvai51f5rpEg5hC0G70+wslg+G2eJLwi2zzEJLbaj8G2rskUWdL7sgiXQU6EUqMh/TYRQqYgcp4rvT7yAUb0sFmf7ti8RAFiRljX2CfxIjtC948xFkbsN+g26BgkE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB9861.jpnprd01.prod.outlook.com (2603:1096:400:20c::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.14; Thu, 8 Sep
 2022 02:44:40 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::1891:867b:6039:55d3]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::1891:867b:6039:55d3%6]) with mapi id 15.20.5612.014; Thu, 8 Sep 2022
 02:44:39 +0000
Message-ID: <87a67abn54.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 0/2] ASoC: soc-dapm.c: random cleanup retry
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 8 Sep 2022 02:44:39 +0000
X-ClientProxiedBy: TYCP286CA0082.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b3::6) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB9861:EE_
X-MS-Office365-Filtering-Correlation-Id: d656e46c-bc7c-4af5-65cb-08da91441389
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WpK1g7/JNl6ocr652rJ0iWXLq5o6hXVgXa4RlEji1I2fGpkI6RIw1A6r1PbR7jxRHMoe98uULQr1+XimyQx1lfLbBFyL6ID5U1AvxxcV2XkFcH/Flgmc/9A1pP7uoUNY5c2Y9cLQtPEfbgJPDeDwGWGS2xfA5O2SzhBpOqbBqV0TB9L1M9BAvXJ71ihVo6QFYJ/7RmG3RFzTmMQM5HAWOxiMkPxEhbYIi6QpI3OHMSZdryiqkRpFbLSvtC1caa/cxkPkIZYIY9IfhXQA1hTFthslZD8l+qn2YmasOVyMwrVxmdq8G9bLYffgGp1Ky1VqrEUQlWcRtRwOguztOEwOw5eEK7IK7pJUrRTr/ld2FSWYcNNBGRrnUm4pfBSiqxnD6L4kSTK5h1jElSMeSdEcziJmK9gkobVFVdOZ/jX95hnHbKBTkcB6MyvQ0p9CpcECtrkB7PeM23ys6nSxvdBVjk+lk1JLrvul8O4L5i8vB2Vs/VNe58acbenqlPYm9k4OBiCMFfxzXE+CItxt5pi23PucIQEijGgl/ebnPIN2WjRS4M56iC3ngOqPjFSD4qOUyj+mMs/O+cgAWOyRGcDIQJ0MBu5KIEWnHw8NDLZQNyaRzEVPwqxCu5q6dd77tHfUGL4cyvogBEWpM4f3fWRo56qhndzEcjOzitBJ0+qX2j8/4bHQSy1mrCrTdOeLLMAvLnH5ibVnU02PSqHfOSnI4poF2DvwMle5kYOaKkIyHP3QyeXx/c5+EfNBGLGTkY2UV2jVBZB2YH/PRNssWGDZunOvzjZiB0NMRm6l6wja38A=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(39860400002)(396003)(376002)(136003)(346002)(366004)(2906002)(5660300002)(6916009)(6512007)(66476007)(6506007)(36756003)(26005)(8676002)(6486002)(2616005)(41300700001)(8936002)(4744005)(38100700002)(38350700002)(186003)(86362001)(52116002)(4326008)(66946007)(478600001)(316002)(966005)(66556008)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Kp6jl8PpsYlb3rEauYF2fVMYIYDowIKXiEkoIIjegEkoMSYSuKnCsMHrdFnQ?=
 =?us-ascii?Q?HltMpWMXoldSEJibEgTnugIlxY6Tbel9+KVBWQPE7pT4ZrunedhITajEAlZQ?=
 =?us-ascii?Q?mE+2O23/HHUZsnQFfc54Tpz0eEAfsvjJjrUbGkxa292+4gevo6ykJNE/581Q?=
 =?us-ascii?Q?WCgdUitMuf20iPg1uQan1DTAGM+nJpnUwmt/ioJMQF6lnGSVwaooaNnxgf6u?=
 =?us-ascii?Q?qkPyTmT7wU8WTDcO8iMvCjl26DBFpQL999/n8zALyEFpRmEt8un23MGC1OOr?=
 =?us-ascii?Q?8quPFi4giUreJOD6mxkcWoShnItWkyD9lbIRp/eBADEHhjskch4OCE8lJ6op?=
 =?us-ascii?Q?AK/xsGdL3QWogobaO56qpyc9KmZVk1w50bH772l/WJqCoxC7Fs+Kd5vhXF6h?=
 =?us-ascii?Q?O8xYyJ5QknkhV33ASAYduVqjb0LTEC393//UMQTM4BQQRBt7+EM7Xq7FXQ8p?=
 =?us-ascii?Q?23nsGVXrhH8MPznLoj98F75GuJh82zHKLF3NCfoK8XdU3fjlW2ymso/W3/Sr?=
 =?us-ascii?Q?CoBlYzGjMWNcmJMavWFOdZvcx8HKdHVGNzymfObhuGJKZgxcXO+r0y7XVan+?=
 =?us-ascii?Q?PRVUvu/LxOIXBdca1yTQwZJEAP2W9VRZOj6sG6Zswx45Fz58w/aMl0nvem8Z?=
 =?us-ascii?Q?DqnzyfUW+OQFmyRGynEpg7NpPMWWbTrdFuntJwN8wRtf1fSc/DElbzMa0v01?=
 =?us-ascii?Q?V7trXT/ovxQDNaz/sAWqPySNkCOWNgW9q2BTPgYDgAn5TMoHjhlt59mGnykZ?=
 =?us-ascii?Q?HTdNSGJrydd9loF26feCDfwRuwpElEKdgh4XBeIQXqqtWpAuItVLPrh6abBr?=
 =?us-ascii?Q?DAlRhOGOU0ANx3HSnvQvjNf/sH72qjeAM4PyOhTnSwk0LF8XhVPSPb0PTDM9?=
 =?us-ascii?Q?0CVIrrVXYdddfr68lKlFhYcqoO17nClsfdwMBtYSrZaaUUxvFb248pKRGP3x?=
 =?us-ascii?Q?BQPC/6UJx4SId+f8qkNuhHOlkYgWJ5dp6WR5zmRoBvOk8jdZBAJSbSaGqwzh?=
 =?us-ascii?Q?WzKv+n4G04BevHDOTNEnw2kJCzUft4ikjNW9afW3Mrp0/Nyjsvn/uhoOp8FG?=
 =?us-ascii?Q?5MDphVwpVtLlsHyqvzxnPOOzH6sxLY80Jj/eDjllbYC9P0By4l9AIksjBnFR?=
 =?us-ascii?Q?PwlZYv8HLKcljfSeC/svuQNUftrSJ02DKjUouCg7Cc2s0B74XbWoMUGMIvYL?=
 =?us-ascii?Q?J62XkbAEF35NJ0AnG+mz+kNz3Nuhb5OycrwP4ZoJmEiZIAc1uMLUY4gTNJIx?=
 =?us-ascii?Q?KaU9zcclhym6KjB5nJAZztnbU/xFlz/sIHQ0dbXy203YJNVgjvE/5cNhgwv5?=
 =?us-ascii?Q?NYYi6Z0jfn/lfdPKGe54aPioY0SkxTPX3r/e0yBC+OstGA9uUqc3CMmUqjdy?=
 =?us-ascii?Q?ZyxeLVP1Er2TENo3ZtTqESifTTDox2UYoizYjbBOE2I7k9DqkZ+uiQ39DKj6?=
 =?us-ascii?Q?FBSRagXZIrccDe+Y3lByUuXer3AUOB/5RdGTroTok4C6qqeocWA3YY01MDyK?=
 =?us-ascii?Q?SwUaABXCEX6kQHr0ux5jTZAPKEYItRY9g9zV0+CBC8C8aIF/GBJzIHij2Ko+?=
 =?us-ascii?Q?YcGOKZqMpGlqC4+uKNYDszF/AKHo9EBjgUeVNW1YvBO5McbbcUOfJsSkK2MZ?=
 =?us-ascii?Q?TDYIt2SnNPWbPgjjfCyaGD0=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d656e46c-bc7c-4af5-65cb-08da91441389
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2022 02:44:39.9483 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kjRRxrxmPQrfycQ5ROY0Kn3pAM3HjaFIx38O8jywOBbQH6saZHwtsXtlO7rn59/vQoFYehySDlvRmc4JmrybOVaElPeA9hW3OMEm2ituSPw7uMsaJcHouFdgJX0Pc4Oj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9861
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
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


Hi Mark

These are remains of my previous cleanup patch-set.
[1/2] adds comment why kzalloc()/kfree() are needed on snd_soc_dai_link_event_pre_pmu().
[2/2] is adjusted to [1/1] patch.

Link: https://lore.kernel.org/all/8735d59zt9.wl-kuninori.morimoto.gx@renesas.com/

Kuninori Morimoto (2):
  ASoC: soc-dapm.c: add comment for kzalloc()/kfree() on snd_soc_dai_link_event_pre_pmu()
  ASoC: soc-dapm.c: tidyup snd_soc_dai_link_event_pre_pmu()

 sound/soc/soc-dapm.c | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

-- 
2.25.1

