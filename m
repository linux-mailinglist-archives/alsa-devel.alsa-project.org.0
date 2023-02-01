Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 85BEE685C84
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Feb 2023 02:07:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 836F81E9;
	Wed,  1 Feb 2023 02:06:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 836F81E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675213652;
	bh=cpnyF+3zupp8bqJhK5+gEgGx21+pxf3PxQF3koV1gRM=;
	h=From:Subject:To:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=RKNODQdvT5zgTARvRq/xMh6b0UFbFzefHtYEfKBS+tjc3RlEpqHkyKUCR0qVCQxVt
	 4/p/DLy3FWh8TBHUz8ZeBoH/H2aPXKWeBXlzlummRqln8V0TsDfLa0Z/YwWzFH5ktJ
	 OsBsuF4B5VtBACTNzPHWdKevgPigYoSYhPbtnPT0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 42526F80245;
	Wed,  1 Feb 2023 02:06:34 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 78488F804DF; Wed,  1 Feb 2023 02:06:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.4 required=5.0 tests=AC_FROM_MANY_DOTS, DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
 SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on2071a.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:feab::71a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B5930F80245
 for <alsa-devel@alsa-project.org>; Wed,  1 Feb 2023 02:06:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B5930F80245
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=gnwy7dW5
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aWHkypKAEr5tMaecne2tgPoX+tWBe0ZXAbxmp94G6/Idq69FRFZf+AauZiUSHLPe0CYOtr+jwTKQb2c+KKt7Brq8yGNoGo3BW06GYCLKwZC3IL63wO+Jxxv/YKDIpwikMAiV7/cr0nrn1Ptr1EdHoMPp9kNetUK/vNgut5AFvLHKzUFjQor4MFDql42iM/ax6QckWyfF9MjxI7VZ7IMJwN2JOaK4YiDeIvvX4PCgp3YPBHxaJeDmYiWmA1IjVlsVlc4Ma+hLXgok1M479NV3nqXgVhkkYyQ26ZsvnEknnvXXYA6TppaZ+KjcIpAmjDkVUrYjx/s5beKSpzcU35WhyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pXLPBDIE7lLvkMNyhhWlPkOoRaX1uENOZDGaA8jmj60=;
 b=hvETid7WNQrbN3IhsqxjogJsaJfLnK9ONy9p9rN4xbe5MTsapNOZ3TbhvUA7PFXpRlCvcaHQbKVDXH8mUwGKkcB3QpEqMYNJAI6nQYKj/XiLSssOgY7N+RsxnG1y9D/cy4frbislzWF7sQC1BUacRxKNGb85thNDl9EY4pxCgI7UG2RxP3XDdqEHGF18N7vy9845hh5XAu4s9awgWIgk202/2L6h5NbLM8hZZE76PkaBvaSMlMCvcf6XlCwQ6aRYXCCl24Y1EnJWRSxk0C7ZdgYLaSKstmFxo4qiyuf+89jZlYLqlRCP7+35y7X2PFe1cqljm9HaR/59WHsuDWvPag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pXLPBDIE7lLvkMNyhhWlPkOoRaX1uENOZDGaA8jmj60=;
 b=gnwy7dW5VsCYYs8O/5RDf8c72hbvNRpqBwJZDqLSojfwjQpilEmm705aodOiNwyRrGHNZwA0jeow8x0enR057/2ePuD25LX8ymYLj5sihoPQyjaf3KPaurEbWmdQpGdUSjgM9DOPdHs7h9Je5I+DOG6eK+CWomlfK0tlFhiVhcM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS3PR01MB10342.jpnprd01.prod.outlook.com (2603:1096:604:1fa::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.22; Wed, 1 Feb
 2023 01:06:16 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4b75:8d8e:d89a:7860]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4b75:8d8e:d89a:7860%8]) with mapi id 15.20.6043.036; Wed, 1 Feb 2023
 01:06:16 +0000
Message-ID: <87bkme6vp5.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH] ASoC: cs42l42: use helper function
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 1 Feb 2023 01:06:15 +0000
X-ClientProxiedBy: TYCP286CA0004.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:26c::13) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS3PR01MB10342:EE_
X-MS-Office365-Filtering-Correlation-Id: eb173050-b3cf-4e74-26b5-08db03f084f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: em2CxjbWSEaJMQEjVtHtjcFZ8f5istGm3+Y3nnW9CwzZg6N9+5C5nB//A3/ahnDnw5tpv67aiCjnSWU71OlHcSOe5sD/evAsWS9jHYC2unBBJZfzZyOXHdzezjyke/i1jSl2OdKcNFbgwsWbuTv0coIsw1MTtM+no/XwIjrk03otToMrCLlSIoQYdwZ/Ge5VyjbaH+WO1VVScPWOFlPNdV5qo/jtMCwXGib/8J/rfzubJmiC4T6gccQNhhnG2bu3qhg5W0GSzDbz9CDWMydzcjvC3hrNhiEFe+YJyfThDcLZdBIxQ9VGFXyon75s1XohbshW7JFWjawTGeGAEcczc/1yriYAKDkeJVj05GKqHb/cDntNX+om1QJTPNeGQn2OFlKDIcef0CfkOyR8Wh/bB44v4yYkWYoLkkiiwvDW1+3QfTp10gO8U0xZK/28v0QZ7JiEbDB8CVKYDvZNTbIhK0A2+6BPmbsJn6isu+ts06e9e15e6ASidMxvHD28IX0pdOy5tfLKnk3afBw3oZisSEvP8Hlj3k+dFYfSC99hT0inHDSfuQq3FX3w26TkIn8Q/CJA5PT3ptaPLsZmVFXYiYsI68oLj3L05HsgRA2RXyz70UcwIaQqMxTOOR5pxR4d9rNdmuHmIiIt49e2L+lsWfN/3kIguCumsFaxNdlNr3f4F5BaxsaiMS6NxZ1yaB7o1idnQVPfwGqi6mqyE9M+FGEaT+qx01EmFUwFE4fymOs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(136003)(346002)(396003)(366004)(39860400002)(376002)(451199018)(8676002)(54906003)(6486002)(66476007)(52116002)(966005)(478600001)(4744005)(2906002)(316002)(41300700001)(8936002)(4326008)(66946007)(66556008)(6916009)(5660300002)(86362001)(38350700002)(38100700002)(36756003)(26005)(6512007)(186003)(2616005)(83380400001)(6506007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UwSqrVZeSLN2cEr2B5eLoGMfTSwjeTfiCpyQ1Grt6C4OnSiYb+Lfq3yETTrC?=
 =?us-ascii?Q?x62GSeKOZYFxkOqrIZW99djSVh1rpqX6Ej9LsU/4mT9alONJsXkBH4U1yvHR?=
 =?us-ascii?Q?5KGYfXv4LRha0JI2MNw/kDopQQ/6TOKvV7UpVk/NAGE2QJHCOuX6hg68JGCA?=
 =?us-ascii?Q?AHbROxpYfsloX7D9OruM0TK6WB24gCG9sNF9oBbDqHmFhFn4kinvSXam+Co4?=
 =?us-ascii?Q?MjpbcBtov5NxyWqsCN/hMUxkNibARRQ5GYxFU2E0MHWHENs50C5QCeC8egIv?=
 =?us-ascii?Q?4kpaRqJd+NOTHiZcfXvNjD6sk2qSVaIgnOTXrU4ap+vHF1YhiDTXRIRTdwlJ?=
 =?us-ascii?Q?oHm8YZBcm8AXyXBTjxgCj+b3sqFv+SienS4MeSmWmHnn8Ijd5F0S/TipnI3L?=
 =?us-ascii?Q?3I6HV+MNE21wz1l3ZgGRHGke7FZ6cOdEHUL88DzuOw8f/F+a6PA7HfJ/y+oV?=
 =?us-ascii?Q?gYyMgQ8PYtqxsbAY8ionjUF+BRT3KNCjCiLmy2IE1d7w8X5PXF+kz3ZAbhGf?=
 =?us-ascii?Q?HHeHp9u8WOkdVYyHtxHw5o6hoTKWwKlw4yAKDuaGiwwxMpZyKNyshN6/id/E?=
 =?us-ascii?Q?1wvsDb3NEK5D6X1A0L3sst2cmYrsxvajeLcyNqUT/Eiv99a3z32UwMUCGZi4?=
 =?us-ascii?Q?QUvkqLdl/CrNnJ3EELhtXRn52pUQEyhooppeVEl1lCjUoi/kUuWw57HHhqFO?=
 =?us-ascii?Q?5ta/t5qSK4r1z/jNlQjI6O5KUCcmpmmDhYUYfH0TX3h7ELYIDgvYo7QsgRQN?=
 =?us-ascii?Q?X85fP+WWQ3rm5rfCiZziK2xTyx79nkaZI531NTLI84cziPBZrLH79mpFM97c?=
 =?us-ascii?Q?L15MniuT7/7ebh+X4ZZ3d1jPO+P7EX/5NH3hSD9WgiDOjGopG795dScHQ2H6?=
 =?us-ascii?Q?0UEZpay+zAbsKQJJl51FzvwJzloPAQix09ufymuTaN86Ynl6cJEsJ3Sqem8h?=
 =?us-ascii?Q?pC29NAn40AeLfKuIrLOURfKNRFvZP83FJmFbinDQSiPnoPH2VBR0/XpMYtIm?=
 =?us-ascii?Q?/u6CP3WaVpFEt3c4y3hXua3IkEWOZN35XXfvOg9Zgw1D+Y/eU4KjBsUzcNPc?=
 =?us-ascii?Q?ZHvwK5d7WfDx9ZDG3EcfO/nJE5h5VGsqt7XBzkntfDs40kInnzpE3B9o5CnC?=
 =?us-ascii?Q?WaIRePbKZk+0aQ6OlqvVjI4djot2L+aSwkoJ1jtvofUbq1oqMhW2s2B21FuD?=
 =?us-ascii?Q?0ULebwrJJVtyCExZJzFhMwv9GqHtxnNtlg2ohhnGR12+8Sdah/aqjqAw0cZJ?=
 =?us-ascii?Q?EfCdOX4qfRB3UFU3usdup6eDixZojjlF8KZ9sVrixvhrhSlPHmhOUtnUYVA7?=
 =?us-ascii?Q?mdrdT2n/KLEZV/X5B9MQ/4hJWHTIcGEm2IWA9cVWTDbxhBtNBOrs81Rme+3r?=
 =?us-ascii?Q?IHRBasVVxnoDw3k7JqsReQUKMJAE7aoKcUzXQmzFNKYGmZ+RUcEmHEcuQrOx?=
 =?us-ascii?Q?IpUZin6JjolB145WzWNFURjo2Zb31W+5PwGFCdFqPTgfwA+/pM1LAGzCmljT?=
 =?us-ascii?Q?Eaeq2RBz6S+IRDURkuSjesr4kRKO4b5Niz6DkOQPNI7bEIqCATQwrAA2UFx0?=
 =?us-ascii?Q?cnlRRwa673dA5bo0AHjfmaoiz29lrYO6cHnG8aD6rTOEoFyjclgFsS6ifTjX?=
 =?us-ascii?Q?7U/rLWP+py7kAt6XQ0/ztaA=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb173050-b3cf-4e74-26b5-08db03f084f4
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2023 01:06:16.1778 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E9QnXPoHCcUDtLkyOOIVNMHqfHlV/3VaeTqaT9J4SivKeHX08LWm6sQ1Il2KzmXon4Aur97yXqF0JfPuVtNttgSO6pXRVDDKshDaBAHUbQUfXrR0SEaHY7Cj1NnBkfz+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB10342
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux-ALSA <alsa-devel@alsa-project.org>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Current ASoC has many helper function.

Link: https://lore.kernel.org/r/20230201111415.67bd4b7e@canb.auug.org.au
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/cs42l42-sdw.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/sound/soc/codecs/cs42l42-sdw.c b/sound/soc/codecs/cs42l42-sdw.c
index 79023268d4c1..7b539ee55499 100644
--- a/sound/soc/codecs/cs42l42-sdw.c
+++ b/sound/soc/codecs/cs42l42-sdw.c
@@ -155,10 +155,7 @@ static int cs42l42_sdw_dai_set_sdw_stream(struct snd_soc_dai *dai, void *sdw_str
 	if (!sdw_stream)
 		return 0;
 
-	if (direction == SNDRV_PCM_STREAM_PLAYBACK)
-		dai->playback_dma_data = sdw_stream;
-	else
-		dai->capture_dma_data = sdw_stream;
+	snd_soc_dai_dma_data_set(dai, direction, sdw_stream);
 
 	return 0;
 }
-- 
2.25.1

