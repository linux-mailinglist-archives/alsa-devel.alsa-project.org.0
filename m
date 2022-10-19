Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BA8A603730
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Oct 2022 02:38:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4DC29A825;
	Wed, 19 Oct 2022 02:38:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4DC29A825
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666139936;
	bh=6ser0M5HZ8EDxraEH/ysbcc2iQ+gJhDwk0XsZFJXGe4=;
	h=From:Subject:To:In-Reply-To:References:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vNvlKXNV31jLaWGlW1mblrP3tu92+JTOsmQefoKRweHy3YIx+kBQBBO4Wlmf9pvW7
	 xu6yGhu5BRJR8WMafAOU7lUk9jmtc8RBOqE1MfnMfZrMKHk9uf+1NgbL5JLLG4Gnrz
	 JRTODc8zvtCGXYyMtmFmxaVLd5hUq9r+aM6C6LLo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B3BBFF80571;
	Wed, 19 Oct 2022 02:37:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B0F05F800E5; Wed, 19 Oct 2022 02:37:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2132.outbound.protection.outlook.com [40.107.113.132])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DFA7CF800E5
 for <alsa-devel@alsa-project.org>; Wed, 19 Oct 2022 02:37:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DFA7CF800E5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com
 header.b="LnB8txQp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U/vRQA/RzsY+Tjk5bar6XHLLuHEemd27otrgJoCB5tDjg1mjsojCPGJYhgKoTE8yOT1vXyWxEd1kJcrVV0SM3m3isfhzjWRbDVLZBJk4zlW7P5SWp+a1hDN30dYEPuUCAu+Hdfx91pzy84CoDG3JP2BDJp5ksexzNs9wcTAj+jm5AI1hxePTWUYb34z2ozhCLZ3XSFqWjRE17qS79QPzppOvM74aw5QhprDJ6MJfj/zChxMJF3mfMtQ3LsmS1ElSsa8jJbw0Mbe+dPNbOGzfMaYM0Fo+nn4PFwdpmS5rV+sjuMoQqw7Q3CdQt70TpFOCHZqhc6XyOOyZ1GyXUn8ALw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zX2sBo/Uzs11rRBRppCiFF2AevUhwUIC9YuM1AapP4E=;
 b=ZZfZC78D0b4ZFwXqVCB4WbrgVkmYVpos4SIqyVBxowMi8bUZ1FSmWKsdANzWZD5xx/ot28ms6SchvsQwLxmTnvEaK+uk6DmNqBD+ussFoEeCkp5V/Sn+/wxAr949aJGJk+2dS+nhx38JLZmNkh21YAEnkgpbQ2lcDiLGFuDnWdaZ5LFplFT4GrNiPiQhUUZafvuPk0W1CaDPpKH9xi8zEkb5L4ZIqw4artQLduav1FWD2B8aDUeZ9BcsnTMTHOzhRgxhJCxOtAvbP3yIJ/+B6X4B8wLls4tsKU4oG3FDuQBpBCxt94cHbAYtvmNGuwg61s6A4WJdZ1bmIiM64hreLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zX2sBo/Uzs11rRBRppCiFF2AevUhwUIC9YuM1AapP4E=;
 b=LnB8txQpCErS2xAEuZiEfSjM/FwQGoKvZ0zgsRo75gMr8DTWRagFqQIusOODeGLp0cuoCibNlfLyENXugEleKTWvJlvxCAPYkzOmV+uHVkl1Hk64mOlxFJ34YDgR2h+NbIVaRSUMpDgL3vM72Nc4DtXDoomfO/BZUrrPVTMS8vg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB10149.jpnprd01.prod.outlook.com (2603:1096:400:1ed::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.33; Wed, 19 Oct
 2022 00:37:07 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4cba:2bd5:dfd4:f3cf]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4cba:2bd5:dfd4:f3cf%5]) with mapi id 15.20.5723.034; Wed, 19 Oct 2022
 00:37:07 +0000
Message-ID: <87zgdssl70.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 08/11] ASoC: soc-dapm.c: numerical order for dapm_up_seq
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <87bkq8tzu1.wl-kuninori.morimoto.gx@renesas.com>
References: <87bkq8tzu1.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 19 Oct 2022 00:37:07 +0000
X-ClientProxiedBy: TYCPR01CA0087.jpnprd01.prod.outlook.com
 (2603:1096:405:3::27) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB10149:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ac2e52a-7a66-4695-dcd9-08dab16a0d4d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HNaV3cPkvM+eIquy6yCj1m+FgnZyW+IQOU8h7cMwDaOTJi7mcaNcK36/D05ePsBzpM9Xpurn4abs7iOHVQ0kgpG/3+K6eKhxyW669ol9tAW7fhQPNrj24u6ui3mn768ERxLoA7zjZ8A5CxIug6h/5HvNjmojztB/E4IMczG9HPoKjbolNIsBZ07x7IXz8fnBxMMPBL5YVN9MZFd5stB2rTbeoROavQetYFG946K3eUd+mmB7vzYPg4dwySEqm3pTYHHquL5FX22wEZsguG9aNWQHisKDRzdGW6KOYkyipUHLjmsWNv8AI2hjpys3Dp8de9JHP3oPKMPTSYJi6bo0VZi9JxOT2k+geAgkucBekqnYHlzlA4IAyOe0Ee238oVof2jhOqYSaOLtQNgNHR9txKvz7L6ZPgdKcxJxiwYpsIRieH8eurfLHgcJDaO9lwtCshopUBapGRw/2gAmcQhd0IXazyS1fmTCgWjyOi0lvby0WVPAkzeOyHt9NOUS6XwEcDKXTnx5LUi9s27iOY08Kr0uEOz3EL16aJh2+bfSv50pcJPZDyXisa6cj6KBUAi5Zfkvyxv1VqIjuamuE8NKM5SutQdaaBIHJWWY9VwEuwB6xMe3YcLpuq/dwgh/5wRBtXGClWZp/7rLtgoLmYAsNf1s2YoVxRVXwV8aISVzBb5cNDrYG35rgUBa5H78YDmTQHD1yURkV3NlwqWdvMzYV6blhPQHcxmB+qycC3rcg/NpWnkHzBuFtFelb2+fTZ2nvhHkvDLarlcXJXM1gcsxfg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(136003)(376002)(39860400002)(396003)(346002)(451199015)(41300700001)(316002)(66476007)(4326008)(66946007)(8676002)(66556008)(36756003)(6916009)(38100700002)(6512007)(38350700002)(26005)(52116002)(6486002)(6506007)(478600001)(86362001)(186003)(83380400001)(2616005)(4744005)(2906002)(5660300002)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SoO1egTYMvvzejlpSGfwvaPByKSJwRWiw+WzZe9sFH5xxCDb7VtYeodOFeuA?=
 =?us-ascii?Q?mtFlB6QzyF40QamsmurhFp13QebqbcuIBl9lQ/kEDnT+9gTPuARNKHQOf6bL?=
 =?us-ascii?Q?mPSG5kXGEt0XpWLbtIFd/TaPUEow5ma1i6owoovGJ+B+jt+t/n5QZq8DsLbf?=
 =?us-ascii?Q?IwR+QMC+5o+gw6xG6w+xrwSZeVdoQlX1tvr6xpLkJwj62MdiQ2Ry3QwMrMH+?=
 =?us-ascii?Q?1YNOoPbILLt7QeHdH6xVFNG3JRIo9qpidWjI91aeDVe1D605hAhMcnEadwnA?=
 =?us-ascii?Q?GU5sS2qztHfyPlKoHkIaDr11F7IMOovAEeZDxKTNn7rYdmDxlEpPZiVENecC?=
 =?us-ascii?Q?jiniOo1cT7RD60uuvmTHEuAN2XPaCc99ft3eY5BDQmNArftvA036Hu5BUHcL?=
 =?us-ascii?Q?Bc7GxtMQS4dpUxerkqBv2SAL/QHcXpfx6+eT2o8Rti2Fkq3toMv43r6w9oOW?=
 =?us-ascii?Q?VNljz9D9hEpV29Ixp52uezhhFDnhOxOqjdRgrNVonf2H/db6VKzgaqE/GgH6?=
 =?us-ascii?Q?ZfhA9ucSPwbNUehDPRODD62OUko1WldtGvkevGumgw19VvMn3id4CbYfpb0E?=
 =?us-ascii?Q?o3VOCQNoh+717//SGfe1hd6zIdeWIieprBz4BjD4ddVKsiQ+yGjWrWAQwOVD?=
 =?us-ascii?Q?JzhQaf92ffKHhw06dqqk6ukRsGfEXi1WarjGQ8238Rc5T2g83vWex/N3PqXk?=
 =?us-ascii?Q?X+LqG2nyezDfzLHLjB/DsaGv7t3LAirtj/mf1Z5qTR6aoBdZd2uH2Zt9f8hY?=
 =?us-ascii?Q?JV0cYXRvrYDELwKVNTKaEH3Du4QBBr+ugmSPHGqVgNUYuwFhyRG5/cQ570hM?=
 =?us-ascii?Q?wuFzo28fVHz9Kdb6anrIIaZUAxMGcmwIn2ceWwhoplz7dURecsDpW5JIX2jB?=
 =?us-ascii?Q?pgiJ0LaBkpQUgwnQDAiL6Bv9xt6FECxMZ2B2r/oOdV0/7YzWv2REewZBrolQ?=
 =?us-ascii?Q?radP5X74pFVkRUTRwyyv32pfXrJ4oyK768Pm+5B1HbmQzu3fzpFBFdRW9g50?=
 =?us-ascii?Q?/qccqxQSikRQZxLX03lFzgQrSjsbsw+c4Xz/bhV9rhIQWAuiFSD7EB3A/hLP?=
 =?us-ascii?Q?fi5WTSh4gmKKgQ1v2gLmz+jpe6Rw26NOR67dpiWbIrXPIoP6gih+ZBa16/NE?=
 =?us-ascii?Q?0tpn99Dg4QJrgY+4oLecQhegje817Xdugzd0y/eCV7eri0Wkp/OOO1UYelgP?=
 =?us-ascii?Q?T/QM07ezLgVVhCLRoDGpCJ2/CGG2shNyHIkIDVArqA+UkF71xN6Zx3y1mnsi?=
 =?us-ascii?Q?n5KATx/CoukMBc1snDoca06ywfw034zkpHA06yBAIBYJN+XSxSxOoMHqLiar?=
 =?us-ascii?Q?EihFKbpOL1LfBAdYFeorV5tXuHBZDi0OhLpZvZjxX4HYgFAljbLcxklk4PXl?=
 =?us-ascii?Q?d61xSJxQ7WsKzcmmMyrGoAQXBIVCMXsvHZayz5TUyZFQMD8EQOb6YnQmtitk?=
 =?us-ascii?Q?PrwKZQoJJdaLwgEvjxciND4j+P3m9t65CjuLU36vAUH5eGoZu50gmXPCXwNR?=
 =?us-ascii?Q?oKBZD7Vu/1FZCG2Zqgt+j+RioVzXD2dRVDham9g0LryUVPCjo7yLGbuVqI/9?=
 =?us-ascii?Q?g5rkF6ABKYT03F3nL23gTnjYoVZXehy9xnQ0gwzi5OR7YNmKjofYjh8W2pUI?=
 =?us-ascii?Q?ZxcYDm/0TT+bR+KU2f9i1Kk=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ac2e52a-7a66-4695-dcd9-08dab16a0d4d
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2022 00:37:07.4827 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SQsT+3XPQ+1NZZaedJjBLhzz6vEwevgofiCo1bqip70ZfW0n75FHtGDcDLpEOHtlXlhVKPeFGbHf5iZ3ykBzh7y6yuf6Tdak46YvOna9idXbZ6So+DTun9rkVH+sdCdS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10149
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
index ddaa079cfe5c..35edcb632bf5 100644
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

