Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8282676C1BA
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Aug 2023 02:56:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1ADB684A;
	Wed,  2 Aug 2023 02:55:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1ADB684A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690937807;
	bh=2aH9Y91CFOrH4kLtTsVtqfahqPUtoaInoiDaXN92hKc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=kf6WonZy3XPnNTRoSptLxRSz+rVV321UusxPKGfr0TpefxHvXMPNFDgMdhstjRfJP
	 yQyq4pk/lsIutJeEiCCLaTenaxep2avJUeOCPI3CQRXuZ0t6AjwxOfBOSRdzAWyYdl
	 RKR7DT/lRnYsCiH54HBgYVNMFBduTs1PUyIFPZMA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B53E1F805DA; Wed,  2 Aug 2023 02:54:04 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 024B1F805D9;
	Wed,  2 Aug 2023 02:54:04 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B18AEF805DA; Wed,  2 Aug 2023 02:54:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20726.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::726])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EEB0FF80552
	for <alsa-devel@alsa-project.org>; Wed,  2 Aug 2023 02:53:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EEB0FF80552
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=MgDS9w6I
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XCcNUviheJM2rdwy1fKtmlt/+HFyjccGKELrzpL/rS/nLiq9hyAQkdNTo4Kz5Ub0mW7YzJSJAenL0UT/mqOCpW/tNDw1GFhYKyO3v4cw4mjlKIRFCIJrtmrp4bk0ee/YdZVg5raIOHA672qPpO0TTY/aIA5FNlz7XjdBj/LXWFBL8/bYo3iGr+VxQV80chsJpIL7AXERBygOgpEVqVKnRFfYjaV/6sJEN+eBz2QAsuxGlcwHxaUz5wFJ1aPv7HkqylOfQqii71inSTqYHGeSJLhTFn7r1PhWZhV4nTejd/9OPFxZbLebhHpF34oFKPjFo9EP6XPQrtYFcAStE+DJFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HSJG1kWDBDyn8f+9w6/NGjB03z62oqW2aUUoOyJ8rlc=;
 b=R7081UkKVOuvA6J5ZALXqUkBV8Q52yKxC174ziZCXMZwTJeVZ9z1r3cojiQhOBC9CVnmPGhMTV9bwGDe3PJfsB8w69qTurOJ318LX/JYwT/D7AS1CpXMKnq7hHVqhJpU6xKVIt0zBoy7slDvAjzmA+UxCst/NbMPfzKHQGexiaaD2Ssbt3M+O4Nt4QurVKBFu6qf8/FNChis4ozuRRZHikIiGwC/GKchetO2j9Ow0HGzPbNX97xcoMyELpGkAVz2yEqeKEQSWJv9UAWP6IGoJuhDzPoyLW+dvcSOvO80Ma0c7AubD4unI06A+J4FbRzRdgjW+62M70n8fjeI9Kf62A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HSJG1kWDBDyn8f+9w6/NGjB03z62oqW2aUUoOyJ8rlc=;
 b=MgDS9w6IHDfQxMHm7ozp7opPoATPQ62PYHGSJXmhHgkbyxDMZ3jr35vFWBspitBsBC5do8Gb17U9wMmvWxcPT3AhaFA3xUCAIM77uE5+1h+oC7HseImGrF1Y6/6189jTYHf+u36OW7AesYkyfJmolo/WpWFDzqOKxe05jxd3y/k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS3PR01MB9381.jpnprd01.prod.outlook.com (2603:1096:604:1cd::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.45; Wed, 2 Aug
 2023 00:53:52 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5%3]) with mapi id 15.20.6631.045; Wed, 2 Aug 2023
 00:53:52 +0000
Message-ID: <87sf92tgbj.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
 Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
Subject: [PATCH 12/38] ASoC: sti: merge DAI call back functions into ops
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
In-Reply-To: <87a5vauuzg.wl-kuninori.morimoto.gx@renesas.com>
References: <87a5vauuzg.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 2 Aug 2023 00:53:52 +0000
X-ClientProxiedBy: TYXPR01CA0051.jpnprd01.prod.outlook.com
 (2603:1096:403:a::21) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS3PR01MB9381:EE_
X-MS-Office365-Filtering-Correlation-Id: 37725e13-3332-4766-22eb-08db92f2f0fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Ix0NoBil4Kj/MVvpWW/OndArBgiWnrXgdrzVZUf3cu6us6gdb5rFM5IbxirQkj403HrUv8l5dv5lcvLqgOLSE/tZq90r990l6y8ewATLK8H65ph98BEpNnAcCTbl7OTIZS6StgvvSZ8qZ/zk8p305GQIWCOpSfCKeWKA988z3Yf0Ffgv1fo5pPZC59nDlnwEIcUZjLQaXIrx70s4GkV7e8aatv1GKLZQ6xaj2K3GJ9+vQmf1APNGmwUG+y2ra02m1Wx4AUCStuD52OPsWJHNrT6fEnOGvSzuo0/1xoYn9i305Mg9DzeDepzXi4Py51sqXfiPtDIuMlZ33WktBFphzLWhVyPLExIwWVbiStcKqNGdPk0uJ2Oc+uV9CHzXsAWATbzCdtJp42lD0B5ngIBejIks55DL+rW2fANtJQ93acoUdcyR4m1f6h8RtQkdPn3GO/nzWQSdZqSRwtqLToYE3cQCUHuokQa11Rf66TVz7raErEw7uBFrF29sggdiEuG5qLTPocmUglhEPY1icQMn0wyvfCOGphivv/CN1TN20Am2g1TjF9bndi/xq76cbounvCUIgJoYOd5/TlOoe6qkHR7yNwDzETzW2aKthh4UkHifgm42D1nFfWKdDgH51ko1
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(376002)(366004)(136003)(396003)(39860400002)(451199021)(38350700002)(66476007)(66556008)(66946007)(2616005)(83380400001)(4326008)(316002)(6486002)(52116002)(6512007)(110136005)(478600001)(186003)(6506007)(2906002)(26005)(4744005)(86362001)(36756003)(41300700001)(38100700002)(5660300002)(8676002)(8936002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?JEHkBr29o+8bQqolcP03ffZlIInwGvO9AF8dvFeERwnA1nYucGxs0uOHpprZ?=
 =?us-ascii?Q?SZeFTOHYzyke5zxHsYOwxiHso10ke/YD4J92jUdFO7OI3+VZWHJzRDNTj+o/?=
 =?us-ascii?Q?v2fDo44D8HaUgkgwMWb/74wTPqf9xaJxS9wnmOBU3fLeD5sOpq32M3DfAFoP?=
 =?us-ascii?Q?DzVnSC3Oabzi7UT6S4lcoean+NQftGWWgyjJ9k1953kB0ab8DBKGI00zG+BM?=
 =?us-ascii?Q?rdLhDBffB/0fzZMcOmpXTnd555/FGQuadew4iN4ygMSSj8oLs6bPm2vUZiK+?=
 =?us-ascii?Q?l3b85diWpA+C8qDMvPVYMmSq7nLWdA+kyqZEI0d7f6mKpizLA0vty+I3/vzi?=
 =?us-ascii?Q?doDpAhJzd5pUF8mPrnjQi6qojXvSN+xs7b/EikR/tTSaa6nF61SwK1vTgN/t?=
 =?us-ascii?Q?vCifNGvEKJZ0xTrBMeD+OJzBCeyXRNOLlXxK/kJnw0MpkwzA4V4j15ul7gyt?=
 =?us-ascii?Q?w3A6/E6vggHv1tuyCbDtkD4DGpZQS4T657LAabAOyjf2TmaBTwsW5QVm5g1+?=
 =?us-ascii?Q?vstQEokZEmS5DJBwFOis1Kbhl6Anhe2b746/WrBmQ50RI0rHpn92rTk2S8rC?=
 =?us-ascii?Q?lRL2gfW8MxowWOS+DQM0RqoSG9/cQ2VjmlJPPBcHS6tmqvKWV0QB+QDSf0fp?=
 =?us-ascii?Q?3QQFLObexbcBiX4v+DK6AJDSEoCyanFe+fo2gZKO1oVqxBsAbciYNAg//FNj?=
 =?us-ascii?Q?xXkbmrmU2QXWMgKlrZL8TA8WTSd09OZbewo6WX0Gr+/yV/qL+2R5dkPtJPtm?=
 =?us-ascii?Q?LrPgIttR3EU6MvWRt7vq67L2DP9F1NdHeWdimYLd9POZN8gGWIDAidefRjYI?=
 =?us-ascii?Q?K0iajeUbI9R3yssyN3es2MMMdsXfEY5ohJlZhQFP6QjTQUYUAmg4/gIUpgHA?=
 =?us-ascii?Q?rgTZuBI76BYsyFF6wMyRtpz2gJT648xMX02b/L3XVLEnHmezj5xvlEu/TXHZ?=
 =?us-ascii?Q?QA/bt2N3+uMF4HKgxqzfbT0lbLepE0KhXNHcYxUgzWlHvwM9j359L37s1dcG?=
 =?us-ascii?Q?HReJGtTP0VD5z1yHm4DTUJlHitvUwvyzFAQJYE3WTnUgkeusb7IOg9kk7EVP?=
 =?us-ascii?Q?afHIcE1/+NbMI1RZ5XNzvH3ykgvKlNo6pf6i5quef7a3pcoi9Cesr5BkH6Je?=
 =?us-ascii?Q?FfmSF/jytpqCKmCkG3pPQk4C1M46pqpBNgxZ6p2d9XmZXpdDYnFIyPjDHlkl?=
 =?us-ascii?Q?nVzOHHfYdp0pax18DzkUBQ/xkPCfqb+1uqCJQ8WN+sm71vELjw6gdUtZPIPI?=
 =?us-ascii?Q?IswUhVlOfw1esG1jkMF55cDe9cTc1UC7b2HFV1IUY062tFBaZ19Px28Tv+CI?=
 =?us-ascii?Q?1pUe24nieftg9sNZUhmL3M/1KJh+P2Bczqg/kZ208rOuZ8QNQCgtmzdbPJir?=
 =?us-ascii?Q?sY6dE83LcypLKAoshn21KNrCiLHB5zyh/PiazEVksj1ZUcgWqwEQZbeoPzVT?=
 =?us-ascii?Q?MS9NYMmI9KLBmNFkYZ8RMOsovlEXtSI4KGMBXljEriZ9Iu1od5efT0fhrLE2?=
 =?us-ascii?Q?/24fMhk6v9SXIrof2fc0lD7f/ReNOLmo03qpRyq8UcFHrIdnAOmogZLNRkCv?=
 =?us-ascii?Q?Ibks0+K0syWm5DH9PcK2os38dlvIg0TSKbjLSg95Zpikyaw+KYp7vlGkmrwT?=
 =?us-ascii?Q?6E+lxxZcyWBK0Y+d8Tvs2Ro=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 37725e13-3332-4766-22eb-08db92f2f0fc
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2023 00:53:52.6825
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 bw7J72/1W61c+osacm7U4iJpp4ptgs77tkZpwinu9XMf2R6njw3ke2XL8c02xIOZT93PbXYWAVhlZ1/ggdVRLytn089PtweaML3rPyUAAyqDpXkXk71k4CF1ykygf93O
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9381
Message-ID-Hash: LWYSNDY5PKQQR4N3HTMOC3MDMD6OS766
X-Message-ID-Hash: LWYSNDY5PKQQR4N3HTMOC3MDMD6OS766
X-MailFrom: kuninori.morimoto.gx@renesas.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LWYSNDY5PKQQR4N3HTMOC3MDMD6OS766/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

ALSA SoC merges DAI call backs into .ops.
This patch merge thesse into one.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/sti/sti_uniperif.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sti/sti_uniperif.c b/sound/soc/sti/sti_uniperif.c
index a4d74d1e3c24..2c21a86421e6 100644
--- a/sound/soc/sti/sti_uniperif.c
+++ b/sound/soc/sti/sti_uniperif.c
@@ -369,10 +369,14 @@ static int sti_uniperiph_dai_probe(struct snd_soc_dai *dai)
 	return sti_uniperiph_dai_create_ctrl(dai);
 }
 
-static const struct snd_soc_dai_driver sti_uniperiph_dai_template = {
+static const struct snd_soc_dai_ops sti_uniperiph_dai_ops = {
 	.probe = sti_uniperiph_dai_probe,
 };
 
+static const struct snd_soc_dai_driver sti_uniperiph_dai_template = {
+	.ops = &sti_uniperiph_dai_ops,
+};
+
 static const struct snd_soc_component_driver sti_uniperiph_dai_component = {
 	.name = "sti_cpu_dai",
 	.suspend = sti_uniperiph_suspend,
-- 
2.25.1

