Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BEC464F207A
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Apr 2022 02:36:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4D5DA169F;
	Tue,  5 Apr 2022 02:35:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4D5DA169F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649118971;
	bh=ipwyMx5Vw0G6HeqdkDM1nfzhzDBhrHZ6RXSWLjCX3p4=;
	h=From:Subject:To:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=cw2y78dQusBjdx4Dc+ebbM6TWXhvACqkomIhysF8xgM26/ZsaCoXbw7PML1LvHnOl
	 n5pxfrWvAL0aSMkkOXw3wUYRhqjRWUnQZzQ3idSyjKiGt0OYNj8PtXAKx27qHEfhUd
	 9KwxboeTCQh1Rv4diOATsFAKszR58y3FTsgrGNaA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C9CB3F8010B;
	Tue,  5 Apr 2022 02:35:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 08318F80162; Tue,  5 Apr 2022 02:35:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.9 required=5.0 tests=AC_FROM_MANY_DOTS, DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20717.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::717])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6BAE8F800D1
 for <alsa-devel@alsa-project.org>; Tue,  5 Apr 2022 02:35:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6BAE8F800D1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com
 header.b="nQiQxcye"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QNHdpQQ0aNM/ytY/M8nZFyHwODZwCGy9JkQDpaRGTGjmcRO6imjKAnoSVrS8vSqvb7d7AUwYlCWA5q375CP6tYNY5gypKqWOLg5UHa8d8k21lFzupDmv7DAgxxICy37jDuFLMChM4RktXRRCw6MbuJ16m59ZFlG2aYcFGQdA5ETok7YRV+2VNcyNryGO7ZOVRem08/LSd0KF7+IVBNyeeLmuAK3aJ7DoU+kjZjK1jlXPVJ/7G1UzsF4g0lSiqZ35W99Xslc2pzefeJGjoO5gZiUBpOn6c9Z7lGtxsqXmqc+QfNE4SZmQvpbxl2aBk4HpSMZLNXOygAxTV+wWOFrAHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2CBl+NLdczH/hSv0FKjRVKdd4v0ONtj/6SY5HA+cI/I=;
 b=XeoTwckHFvEglAPFuM5gZelD70LiBwpns8lnSqKt1PaaXvWcJa7dQKnapf7Kgg7bG1ebgLGj9zM1smATQ8oCkIsdkjQAMtexObdqyHdUFEL3CvP8B+x3sRkL9SrEKcEf2DKJDO4SMgRyX1XfmhuBjxY1M02iusXMDb/UefLOXOHD6zWs6ZoaAkOB/FhlbQRKdG36BL8ma6eldmf+p/X8Ca/jChjKiOBn494vDJB6pcPe6/pPRU/hlOByxPqzfIHxub+7YJPMXuy5pCvPIQMwbEzsJQjtMxu16At2ua+5q+0Dk6IpKYRNX2/zyVtWi7Qw657ZpLCB+TxdNXzPqHtJJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2CBl+NLdczH/hSv0FKjRVKdd4v0ONtj/6SY5HA+cI/I=;
 b=nQiQxcyejkmOsJdpgcyCKmKQqjKm47xxWquxeM2Fy9oMB0BLFjzE7tCS5soynd9GES8IFexCN41h+V2h/AuGeHrOapZZBL2f3Bq3JH3mVLjT3AqiEtf3Qy9G0aE7VI0irck27NROjenVtKFDWjIf3+f5pTd3+5v/d1jzqlzS7G0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TY3PR01MB9841.jpnprd01.prod.outlook.com (2603:1096:400:22b::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.28; Tue, 5 Apr
 2022 00:34:55 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3da4:1dbe:7a91:8167]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3da4:1dbe:7a91:8167%3]) with mapi id 15.20.5123.031; Tue, 5 Apr 2022
 00:34:55 +0000
Message-ID: <87ilropdu9.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH] ASoC: rsnd: use inclusive language for DAIFMT mask
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 5 Apr 2022 00:34:54 +0000
X-ClientProxiedBy: TYAPR01CA0004.jpnprd01.prod.outlook.com (2603:1096:404::16)
 To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 16a947e5-c3b5-4322-a133-08da169c1b05
X-MS-TrafficTypeDiagnostic: TY3PR01MB9841:EE_
X-Microsoft-Antispam-PRVS: <TY3PR01MB98418C1C0767FA6AB93E77C5D4E49@TY3PR01MB9841.jpnprd01.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZbTs6RJuMtI1b6RoOL8BM1LjvGdv6CJQ/RXXChlt3qR/7o7r0P27+LrEmyHZj44JAzTu7Cl1+mvne+omOXoMdslNdaKEK9EmIlkierC2PfnEfwOFbAJ3w9oe+SXD8gNsyqDzTPi0cEZUM3/SrBNKeOtzkCQO/kQSG23S/78s22qMHqIlsGSH+a1mjxlmGz6PvJp26bGg7IyPcwA8crqbQsTOaVJhopM/gehc4Rs/nmyC/Rf4NNzwVLBe4i+4BdOP9/92nL6I+vc2Zp0PNyXybeFGUc6gs6ENlSwdsRa82ko7/IIX7hRHzDYRpxxrANCkmuByyDFnFGfhdW84Cn52D5gSGOurDkKJuNtGA9QFXM+zJu7GdSYVqGpwnPfbdzC4u8VjNGT9uQHBGhBzpzJ5hosL6kwNv25qJ7q5b7F0+bm9MJi7aMAig37lBREHE7IjuBUAumI3GmWR56yPVE4sBBjxBL2ogodApYeNA3V0xT67QR146TDV74/BhmuwZR6A1PzSXbvLR3S5vTsmnUdX9nuvWELzeaBsoOBvaTC4r3pds1XdSIaxifJ/RYtcQt5AMXwCf1ditDhh/INnXVEoSweJV9PExl/zbRNCQrRD2uP+4hJ1WAWOjTrYFjb2jXywxNHljHQNiuj9saLCauq37WLMfAJrfHBA1lssyTFxd87V4LZnhpGJe7yZTSxxqUBIwqiwsQLJ7CiVV2seOJvzsA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6512007)(6916009)(86362001)(316002)(36756003)(26005)(186003)(4744005)(38350700002)(6506007)(83380400001)(52116002)(8936002)(2906002)(38100700002)(6486002)(8676002)(66476007)(66556008)(66946007)(4326008)(5660300002)(508600001)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NUG0ZzvMMam1IKscAl3sZ0cPFIz+r0ie7pfjkaEQO5HoKh1XFmc5zSYbD7PO?=
 =?us-ascii?Q?Xxhm4I21DtGT6I6Ye4pjbU0FFRkTclgW7iC7nfqaIYtdAGk23wMF23keI72g?=
 =?us-ascii?Q?tRCnelqwwfO8+EAh1e94yyFV7WDtBRjmqy8xitw6i79QDjv+IcBkLGTqLE//?=
 =?us-ascii?Q?5ZhXkORkDXkDZqWwuwIJOeMIoDOirdejJEJwIKeJ5DaJo6QPaWhirlXbpBdh?=
 =?us-ascii?Q?UrIDpRWgyk+9d5Q3dpKXMfT7C2mBqCloa5e5FPx5rerjRdvZt6BtypDodeFS?=
 =?us-ascii?Q?oZtfjvTsbTq0a103xav36ABEjz12blA+C09+AYAq/Jp7TaQ59cU2+J+voHGN?=
 =?us-ascii?Q?W8h3OYgtkhseSOErT555ooLh5h0WH27Y7xZX0LREFUhsIkRBK0aWJ8AJg1qv?=
 =?us-ascii?Q?41uKIO0V1Q/u/cTaECBw3EdsrBFqT4vnAC1Fgxt4gq+/rAhS2LoXse9iHy4/?=
 =?us-ascii?Q?+R9qel1W+odG/TIcDVt8X1ptkpsT62ao8kNlA9PjeiFexI+Qvo/a9qPFvcUY?=
 =?us-ascii?Q?Ulknu/m02oEuoFE9p+KnHUhpcRdrUkZ0Xpu1+rZ/0OIG5QiZRwNgiBWV7mKi?=
 =?us-ascii?Q?PZ6Ibxd3zqZP0AIOQHGNVbR87HjSThknBFVo4ATZWfu2wqXs6ImCiavTsZZf?=
 =?us-ascii?Q?aDJS+UgJvVs1MDpWFlNsmdPgP/iIMsXT5/IuoiQ8r/b06ztIjWP5+gvQPalN?=
 =?us-ascii?Q?dCTHasiQNmcUNYkQKt9HFuEAIWdPxI/afjhDfK+TXo90CkC+54YqPsFveG2K?=
 =?us-ascii?Q?H79q8ARbk2v/aQCe7MtvphAlr1x+fZymi1PlE2JYQvc846OzTtxL2Ko4zbz5?=
 =?us-ascii?Q?jafIc5/LM4FFGxQTLbhjpZJCFH0mx+5EjvD3YWxhuRticIVeIEixB/Tb+w1l?=
 =?us-ascii?Q?YScBOen4S0/LI28aLKc1bEfLNwQs9OfmIN3MVI3WwXnANxYMfXfeID78MxXy?=
 =?us-ascii?Q?FZ9tZxY4/I7O70zv4LEUVVXM0S5JDRwCORr59E4M3+XKYh1uWE8YdC/dmiXu?=
 =?us-ascii?Q?dgWULD6MIO32Aj8P4T9hh5a9i+iHmLjBjXIewfXT6Axo3QLMhSWyeYWM32LG?=
 =?us-ascii?Q?XYKe/DqaP5sXIy9Rl8GKbNfljccJv4kHOGOverlj0wOMJHUKcRUgu5d7b9J0?=
 =?us-ascii?Q?OJ2RtZuyMUTUzibcwK6fovOSDjHkX/W5AqGoHa1dcg65fn8LoRQ7E3Xe+R1v?=
 =?us-ascii?Q?Qm+o3tm5Pm9e08zvMYn7k5LysB5xEhaLMQt7F2n9zK3t5U0rGXIsTcQX/9dj?=
 =?us-ascii?Q?AOZ2Gpp7IrBtlO9HdbjS8CF5q1Bj5CJFVwHkMXfpmbWbwNBfwT3Il5uCPPAY?=
 =?us-ascii?Q?3DpL7g1iC7Q8Q/+t/U7eLG4ZHw6a00+nY8wp4qv9bZQ3SMbP1DktQotNAlYo?=
 =?us-ascii?Q?GkS02yjBIvOX6yKXtmyPUzkF0cSfr/ty4FeNyND+OWXx4EmzgN+uIPvqeSDi?=
 =?us-ascii?Q?sQCJHBoi+s4lqzvtepodjSjYFp3sBqdN1KbxLaoT7IbmhsJHA8BZrltvk/JB?=
 =?us-ascii?Q?8nRG4vm0P+rKk5efOh85/nws4xKmOeeorDz6zqQyhc5eY1gMjG02Ag1Sf8qR?=
 =?us-ascii?Q?afmSCtYaZ4pgyUkn1U+apmesSujdDNnPxWcdsxqi23IAonp+6YUCxaH+RPKq?=
 =?us-ascii?Q?SG5H4ZTI7MveOpWIjs4KcpTEyN1O8fA5fw4kBEjVYeT/sOBb1s0spf86Jyz2?=
 =?us-ascii?Q?PjETBZpttJjg4RiD0SxkEjnHjHXVyZZyrqbH9K2Z27PgLC1hd/yMAU3B+YPJ?=
 =?us-ascii?Q?Z6cbLKSb4EKEB2OFYIA9N3VNnGJyVtXPSK1tiCvb4YBPUDippwu2?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16a947e5-c3b5-4322-a133-08da169c1b05
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2022 00:34:55.2127 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zXhK78pEQnbWQKCFvWvQ+0fv/4gK/tfv+4lcZX5z+LoUxFTagIAFKevon2GFwdCIUB5fv9p2vR/+3/0rwhMaw/nfZJ4pKlENvLDZnW6o0CdrTZiOVVIaLxNPZNio2YAO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB9841
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

It is still using discriminatory terms on DAIFMT mask.
This patch tidyup it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/sh/rcar/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sh/rcar/core.c b/sound/soc/sh/rcar/core.c
index 6a8fe0da7670..0c435bff3670 100644
--- a/sound/soc/sh/rcar/core.c
+++ b/sound/soc/sh/rcar/core.c
@@ -755,7 +755,7 @@ static int rsnd_soc_dai_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	struct rsnd_dai *rdai = rsnd_dai_to_rdai(dai);
 
 	/* set clock master for audio interface */
-	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
+	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
 	case SND_SOC_DAIFMT_CBP_CFP:
 		rdai->clk_master = 0;
 		break;
-- 
2.25.1

