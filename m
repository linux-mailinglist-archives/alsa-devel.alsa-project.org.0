Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D1BB1601DBC
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Oct 2022 01:39:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 720283E51;
	Tue, 18 Oct 2022 01:38:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 720283E51
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666049959;
	bh=fkgw1yMMuQBAEcvq0VddaXw1EapPxK4wgcbQPFnFhxY=;
	h=From:Subject:To:In-Reply-To:References:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KxRD67jnTpSzutg1wPbIicO8Bhsq3dWB27IvQWbgE+8kDsNn/+CecNrarCjVNOmq6
	 +uzmmduUbSgMmpUvQBgKD9PwGOlTHkoJ/a80+K7x3EXxeZdKKNveUTg3o2MeVwvDYi
	 HTHP/B/P9fdcU3043oFYIw7bJVSsdKDJ99TJYHkw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 38385F8057C;
	Tue, 18 Oct 2022 01:37:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 28806F8057C; Tue, 18 Oct 2022 01:37:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2101.outbound.protection.outlook.com [40.107.114.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 758C8F80552
 for <alsa-devel@alsa-project.org>; Tue, 18 Oct 2022 01:37:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 758C8F80552
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com
 header.b="VmZ+6CrC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=miyNLLYQJep20na/m7OVrrE1Yh6A/3qEcZWbEjobps2d8/KwenB9ZDhncueJHQOLSNOQeFjXF05qs6lSTNmdT++93sH3bC+y6v9L0hLJG0z4W0pWlYSF3sjzGGZf1jHfGTdMTt5gqk2HQIAZJeHS/7ahTmtv2wr2ByXbrZqrV9SgPHFgkXN7/gbC64uIiambjijfsiEQmiqCh0mFZ3soZAGSA3beF4Es3tXdm6lbF1y51/eNWUKnlZ8cGqniIDHdfjJaGlQzxAZP9GtAftQioJNA+jZ8kSZi/60XC7ntUKwwyQAKK2WsvbkLnFvpJsDN1yb5IOkaN9z/tKBEy7HLxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sDRBqC2xafaWsWaiMUFTu2TKDRPdzLODXymlu7ePhXE=;
 b=dGBceh3XYxO7J1+JTqwdgXDJ1iV4iPM6BamfS7XG25WxCdK/iiqVd5mvxvY4JxXJheFWhSXF6Gnx9Me6OrSkdFNtsjurZElkN/uLoHVDWbGHpDEiT0LVK+j5LlVlzta9MGhMsLFGU0N9glDyPTj56uwt7rkvM+uHmkz38dHPVf2tRQBg6WIzFPWnX4dT8G1EZ0hgK/4BmcSWzWd4iJw/+GseSP3ogp6C3/16BLpwzcjy90tIQHtoVVcZQlcFxflPco7Wha/uCZ6EK67p9BbyJRhXLSg9ojNYnQ7E0ubeAy4/VYn/osTHj5V8EHuuS6SJ4fb2aG02CpGtDT82ELY9CA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sDRBqC2xafaWsWaiMUFTu2TKDRPdzLODXymlu7ePhXE=;
 b=VmZ+6CrCtskmvI3EiGdrg1HQirP/LCnG94DEBIoRuMcyQNrJ+YFtBkjUxCHcHC+1JHDIuie23PYUruDvK+udmxjHQlYu5uaWwKmTsCnZ4RxTl3R/sVjwNZXRnT6QOsTVnLd+0WqqS+KDIX+zxoVALD+xCsgysFb/BgSR+Icux5U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS3PR01MB8180.jpnprd01.prod.outlook.com (2603:1096:604:176::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.29; Mon, 17 Oct
 2022 23:37:15 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8860:a9ae:8e74:ec53]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8860:a9ae:8e74:ec53%6]) with mapi id 15.20.5723.033; Mon, 17 Oct 2022
 23:37:15 +0000
Message-ID: <87r0z6owd0.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 08/11] ASoC: soc-dapm.c: numerical order for dapm_up_seq
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <8735bmqazf.wl-kuninori.morimoto.gx@renesas.com>
References: <8735bmqazf.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 17 Oct 2022 23:37:15 +0000
X-ClientProxiedBy: TY2PR06CA0027.apcprd06.prod.outlook.com
 (2603:1096:404:2e::15) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS3PR01MB8180:EE_
X-MS-Office365-Filtering-Correlation-Id: f9a8ca77-bcff-4bbb-b082-08dab0988600
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: e2OZ2tnPU1dc+yHqxwshBVUEHU+ehAFFJPTXggxuZFrNqc+H7a1PhVsEoc5h+cvHVgAWiFQJVYw0pRnmVk0yrYiRreZzjuc579rslXUtzz672xynb2wYkiOqE6KgMGZvnYjtiHN58//OgaZy3Y7EpzwpiViLD1M8qwpH1DISdiZp5IsJJJvnYUxMmtR0Czq+bjEywAE/KdNeZB3yEVDK0YmOlo0U289e3HZIiPOBcCbqo8fBZc1oE+W2MBL+T9C382FAiVxG79koKTBBESjF0jsfJs3t5cuCGi/lvgCejqn/FIae8wLSQz4jDXEr6iII8Mq4ayo224fIZpEngOecZQL4Xtm+OjpWoLsnh8O4Hp9xxfTmjzULMSUo28wG/o7N+JDSjh9CP1bVIsTaCx7ZNLncGpyUqDkm959zQPq7IP0hRspZI+CTygqMWqe097oUHwlbZPiWtuDMSe67bO80LggnA540J89fVEXSMrRedheMTHX1ILl0waPsz7iZmvic+tfgIlx9LAyTL20HIVhxGy/yf6ySSL5L9DgEHNDjl7mnyEWHC9m3xPWDT170VzS5YXmDj842MHNqYuQcyQCyiWv9PMG8Y1FM6fXduoGM1AM6si8cmhYEXOnjR351bdYkFb+1e+ENlela0OY1kKdt9fhzqewCFT0Z54w5iJCCBd7sM0Fe91ck8FMfrr3Tf967xuVGG8RzgFMOO5CY9iMuGKtV/8hy+Tk5H6f4bV6p5eNVoaX9bs86t5zusy8hdlFED5jZNvZxaGTPtbCdEM0VKA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(346002)(376002)(396003)(366004)(39860400002)(451199015)(36756003)(86362001)(5660300002)(38100700002)(4744005)(2906002)(38350700002)(2616005)(186003)(83380400001)(316002)(6506007)(6512007)(478600001)(6486002)(26005)(6916009)(66946007)(66556008)(66476007)(41300700001)(4326008)(52116002)(8936002)(8676002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7W9qGoHWQZqD7hhGGmf2X+tQOcdbenSD9jgutIV6MX+L/RVtt0/T700x7ICC?=
 =?us-ascii?Q?vVL0GpSJVn/MukK1Vs8JRdK3gqzpT+WjyzXP2APGxZMsQDDni/u5bEukHL+V?=
 =?us-ascii?Q?HM0lSJu/X8AVT9zckNdMADmqLkJOCgIBf8R0yidUjgkBeSrLjoA26Wv6Xxe0?=
 =?us-ascii?Q?GZ4eJi4iH9qxMjOA6En8eQ7wiJBFpvPk3IelnkoBQ2MyGJVF8zZgqaqnE4zy?=
 =?us-ascii?Q?INS/dSr71GQFD7wG080zs88v8/jjaldBVyL9JPQblWNnvlK49A8EKJwqUw0V?=
 =?us-ascii?Q?STWaUnFhhHlvJ6QUTFKxnFV26SmfT9IFd90GlakU3qrUrFERkkJ9uCiVCz4u?=
 =?us-ascii?Q?U1I0bxzHH71CeIVjzcp+4iJ5/FZ+iSi8e/qt9hunf3++bvJQIJZVFxrB8tFv?=
 =?us-ascii?Q?ZPG1jdva0yExyEX9H+Bpp5p/jmWHbP1/aGUU0GFL3qJm9kLg6ZwDxvvNRGfe?=
 =?us-ascii?Q?SH0Nv4UI5WDJh9ci52sVfByWLsr7NqUnhDGMyJBU2YmV6UgAJA8F/qtjNyll?=
 =?us-ascii?Q?saZBJp0qFlIXiGqPPPfLIx6dGVvzQzuYyHgctZpTL6fssA0LQmUsY2UN6E6S?=
 =?us-ascii?Q?ck8m8/3kuqE0lrKPHH7P10CPukCbh+u14KfzA9/zEZ4oIAR5FzFRdnS0rbhm?=
 =?us-ascii?Q?beiN3RJpQIUlaoAOXI5Cc8QOuGzWJAPtAfEfukmGbgKoLPeDY2SDhzs3sviE?=
 =?us-ascii?Q?Is62skDlnvMwFGVLiql6ksADGXWvQ76vyJedQiecAkBDAq+BQCwDAPVRVGOD?=
 =?us-ascii?Q?u29CQucNXX84OiTmqLjLc9JgOPUBr684cxLXqs+KCyGL2Pdl4b9y6nJLTPCX?=
 =?us-ascii?Q?51CQULtJ2g95gskTeL4Wo8bb2jueLqIbqOK9sy5Gqtn9NIq4qkVu2B6876+O?=
 =?us-ascii?Q?g5/x3ekB7yU7lgfz0qRNR/jNMgiwPTuNkkE0D4Z7oc3qlULKWPB1Gl2pP95Y?=
 =?us-ascii?Q?ds81tQfxYfe0UGnzrdVA/nSRLxgu+w8O8isG0buR5pYQR81f4AEbDPtTY5BQ?=
 =?us-ascii?Q?6uRSkiZhJkHDW+dTF5lnc0HjYoLGTdSaV5lNnY4a1gAmIIdn2Nld6RtXcAGk?=
 =?us-ascii?Q?RekxP/5GjIWWYyBQWrPQMmn6M9imDn5jYZgJr0J7ZppJdoxvRNs2KtBGAn0S?=
 =?us-ascii?Q?XFLhmUDvSIKQugLpJBVS58nxCsgTL925E7vguz37tp1/G9U8QanU0rXeMyoF?=
 =?us-ascii?Q?pHbXN24IdMjaCuKC1h5K60tSukrIBDDhQwvwSuELQE3Mg8iGCdW1jcGvajlH?=
 =?us-ascii?Q?+bdLjaEanWdPi1kl8b1ele0ACF9xTSQNz9r7BEdE5jAaS7X5w6nUmiMHpYiX?=
 =?us-ascii?Q?VrqgQpgHFhnC55pf69k6xijmJ2YiyL4ZL6l0aPcwdwkVOI8ATP7j5Lvi025j?=
 =?us-ascii?Q?ju87poMNUdotiqit3AByBQlrDRayQLdum3U4QrAIIeokUXYhA2AA4DxJmJ/0?=
 =?us-ascii?Q?dEqfd0EThfsT4KEaydRpQjZrGptW7JGnlbKbliG3stYW107oQH4F9yrmQFtp?=
 =?us-ascii?Q?EValVQeNugljqcqg74ZSfEt1h496G+vEmu2HL0piZxzGLocaMmMssaqQ1lEs?=
 =?us-ascii?Q?/fT7XTANxl+36GwOyBSSwUtsPu3uX5PcQp0ORGs+rd92QtJvRWUEVwJNSuBb?=
 =?us-ascii?Q?3/Ga+eUxf8fcUglbIwig8Eo=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9a8ca77-bcff-4bbb-b082-08dab0988600
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2022 23:37:15.6837 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w6Aip7QQO4keyphoVezDhXF2eDisdSffAqR1+99Esxr1kXx8XSP1iazZ2sA8LmnwQXbXzNWCOSd4+aQbpGd5GstZSRGUPpDc6Kb7SLlmdQCfhOIsDhAO7rLScYyo15ro
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8180
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


From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

dapm_up_seq is arranged in numerical order, but _dai_link
is out of order. This patch tidyup it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/soc-dapm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index 92140a78573d..e1657eb78fdc 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -71,9 +71,9 @@ static int dapm_up_seq[] = {
 	[snd_soc_dapm_pinctrl] = 2,
 	[snd_soc_dapm_clock_supply] = 2,
 	[snd_soc_dapm_supply] = 3,
+	[snd_soc_dapm_dai_link] = 3,
 	[snd_soc_dapm_micbias] = 4,
 	[snd_soc_dapm_vmid] = 4,
-	[snd_soc_dapm_dai_link] = 3,
 	[snd_soc_dapm_dai_in] = 5,
 	[snd_soc_dapm_dai_out] = 5,
 	[snd_soc_dapm_aif_in] = 5,
-- 
2.25.1

