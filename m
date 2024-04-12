Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D7358A25E3
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Apr 2024 07:46:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DEB172C2A;
	Fri, 12 Apr 2024 07:46:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DEB172C2A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712900812;
	bh=5oykbQrzdjX671101D9+buHnuBZCW5fFYaJgtHoVMmM=;
	h=From:Subject:To:Cc:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=nrM9GjdMHGC1NsvTXiZb+spBoXiksMlZM45fJnZNDjDd3Av6FAuC1Pe9rMu/5jsNN
	 qVY+VjUAoQvdwSxZTA/aAvwYyZZrDCYZH9SqF1oBw7vI7KCFQzb1WuJLxkt2WgqOX5
	 2cmYD3T0EONubCkgpRBD3GduCigiixECXC81LVS8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5592AF805C3; Fri, 12 Apr 2024 07:46:17 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A3FB5F805C2;
	Fri, 12 Apr 2024 07:46:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B32CAF805B0; Fri, 12 Apr 2024 07:46:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.3 required=5.0 tests=AC_FROM_MANY_DOTS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2019::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0FCA2F8057F
	for <alsa-devel@alsa-project.org>; Fri, 12 Apr 2024 07:46:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0FCA2F8057F
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=UlmfN+4T
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BWN7w+O/GMif8jW1VxT8m+vC/se98+TxLs4iHxXGQ7Vre3jEeNJKnGll0oEh1KaaJR3Wc2U43/urDwknrhrw1VtgFuautbjBbn6hVghOBtkE7N08029dXvFG7bWPItLCD/K4PEQE3NOkOasaYI2bHCSDoZEQ9vsFk6HQIQSx8L6egOuzgyw5BM2ugrVtOzkn9jKC+M132dlJTVqBowKmfi5aFPtiVp8fvjv+nN/Hpoc8hDeip7T6NI67Ho29Q4va1z8jHTl/o0ztTt7ul/vng8ajT8tAmZFOwO9Xg/sf/cMIviKJv7hrptCpRRF2BQF1sUk2mA3RWdqpyNcumAzNXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V+JOtLXCP6D+X60IbUQL7q2JrS9v19FGDQy3WMUTzdU=;
 b=ErVxh/7uFetWWUTw2zuhvfSLjK3VmUmS/s1Y9wLWd7K1zV13Cz8mk+hDC8EHjx/P8/K6N5/ZMxCtTgfiPCC/VuMP81Vl+jRcxxw2k3e1uStBpqPx5ybQqB/L+dOCaMKjgcNzcV3WEX9wAEuCiJSBywz+zucep4DqQBcQCyTyhIyAa/1UHj7GeQ30knXgb0ENVPyXjNy4dpX/Jyzt0ht7oRr9ci/LfNTVSFo/S8qMcOiRMHPoyMq8Na7lFdeSqf7Gjif17s4NKzWRoB8v/qAu7PlZmcdzn9tcABxuH9QOCtUU+kYVOUoWWce6CXdB1w7nYElwBn/qJ2F7izaUAKTG0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V+JOtLXCP6D+X60IbUQL7q2JrS9v19FGDQy3WMUTzdU=;
 b=UlmfN+4TCHFuZCSzxbkIWA0Ltv/bSFHSeNgY7s29OilOfrgya6j/IzgYIPzLwGkLkq8Q6gAJ+8w2a7MRAn7KzN52zaimxINeOJzLwKLka7qz2Vm4buqO+5SxDA/MZjQrIa6XQsDsAVT/L10nB59LeLhZh9qixKDIUgCaIiyE3Sw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYVPR01MB10684.jpnprd01.prod.outlook.com
 (2603:1096:400:2ad::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.55; Fri, 12 Apr
 2024 05:46:03 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b%7]) with mapi id 15.20.7386.025; Fri, 12 Apr 2024
 05:46:03 +0000
Message-ID: <871q7bcew5.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH] ASoC: dt-bindings: renesas: add R8A779H0 V4M
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 12 Apr 2024 05:46:03 +0000
X-ClientProxiedBy: TY2PR0101CA0029.apcprd01.prod.exchangelabs.com
 (2603:1096:404:8000::15) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYVPR01MB10684:EE_
X-MS-Office365-Filtering-Correlation-Id: fec5e58f-51d0-414e-bdcc-08dc5ab3d6fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	qfEOOFdmqA9QiaNqAWrCf+OsaRz2ehvMEaLQLdGMNXuMXlmhzvtuzKU0K8LjWdU4YwQZ0izW4p6HtMeuP5kfDSxu1ICy6hSfIZ3MV3N3SfV1kGlyScK2Yh975aKY6eVoTE+9uHR5gF918qBskwefmeAGCNJt8Kt6ApJK9DTClklXv30QqrSqqe4mbNA9vRR4f7GoopWqjGX4BF/PQj2NiTrao1msuB1g6WE3UvjBw8p99T0C9WDr+xGka8hJ6HQSWAWYRHG+pkpn6g9wAigHjQVElzszMB3UKnl69/EgqLd1qIK3EgIVaH2ePFAiuCwnSVrl6eJkkmFaQROL29zJGKREkDm6Esp86FMtpgktCMlYumSkgUSuTU+OlI8JgVidG1IIYnlReiQcT59FlLo2ZxX1KIFdLdRg7RnC3fxCMG+qlmYbSmkeoNVol41ltTkoxDI5jDY7sqtofRp2vlW2rXO25xIicczpI2/r6NK8hUu7lYqw8zZbAKqsolhOF3Ye06tAHU5jYOMF8oNxLelbpfwx++8bE9doXndcp4e/ykffsL771Y0WpQnvNeMwrmLUlpkNi9gWnyCsZEzY6jb8MDK+jKb6IN202QN/f9NND5fvQW+exTIZBwgsnzpLHHXdXNNnJdwRl/IVPRt1qQ+9JnlPwsDJH+T8worwT/Ji2eJBcndlsU8izS5v0yQqGAC5//0zv8QCXGJBHf6vrs+HvA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(366007)(376005)(52116005)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?XhJZI/jcqqLKf4DsWFud0oTx0sLg2IVy3qLN+tf+PRA/V5L8eB4mEqVZEMX1?=
 =?us-ascii?Q?vNL7OWS+JrAn2mmGysyBhKAPnpHxz9o4gQJsAgQgpzN/oXhC4sF2OFXp2eHm?=
 =?us-ascii?Q?brfXMKg6imJKq+r+75lAg7WQpg3oGeIe1nXaBD88WHMquHHTqwvo+PA6gYN9?=
 =?us-ascii?Q?mqbUGMD4Znlp+jOsdPhGMsPIsg1QrJ1/Tq5fyPRFqk/+ibDLlifnelOL3Y6d?=
 =?us-ascii?Q?+cGW7YUVK4DVGOe1A2FxtO7zsFBhKhdIK35Nz0+d4G1Y6uCNsu8NqPd0H1Rl?=
 =?us-ascii?Q?FO1d0anO/9WaDJDOaFXyxMMbscJF4TBVFnKbRmS9Jlk3weyaL6UxEm0wvRIT?=
 =?us-ascii?Q?thWU21lZp+U21BEH3OawLvT+xxtFSf4IuXbMSECPfdHqO6rd3uofx1SjN4ah?=
 =?us-ascii?Q?PMX3d7r+Rys1lfTWKvFO84/NUTCzza/scTleOGhIpxdUgTrK4nz8Yr+1KFCQ?=
 =?us-ascii?Q?3B+cuAEG1wmNEo6In2wnVC9MxEr8ulmZDzD4201lumNrFPjh2UoLraiO/JrF?=
 =?us-ascii?Q?CcRSg0bK8SqucGUqdjksu2xH1+njCJ2EyyNNKr3hLDsTMuX3UXGZARHII1rE?=
 =?us-ascii?Q?pRaqAZ8QbV72df9/VBS5JxaaLfHnoC1JzE8LEh10yZfZVolVoQRmiQJZ9DHF?=
 =?us-ascii?Q?Pz4vhLnY470nj3rCYMizP+TGtQYZxWPXWJIdqr5FtL4uKz5QyUKXRGPcOBml?=
 =?us-ascii?Q?kpvePPQfQbl/pmVa27C9pZvosjAT9cgwaDJpsWkNpxoaqMEUL+qrhpv/KkuS?=
 =?us-ascii?Q?gfNL5y7bNXVIzAhphEpv8jD2ckyfCCTXUH1wi8kQp5Iino1Q/Yj5/alWEjBT?=
 =?us-ascii?Q?KoXkDGRpqFvWLYl1Xgo9llrAQihNpV+FTE0/mD7d/dsWiochrhGOKxpaKkiK?=
 =?us-ascii?Q?a1fS4BBY01K1cuTFNXRrEfpWXfOAEaEiSOpt8JIzPht9NGhVhh0RDb9SuL3J?=
 =?us-ascii?Q?Zze+m2PgRGAmLrVgJsWXVGE3D9srfbuDN3Nqbw7/TAPvZ+WWjAP5+GrZQ3rI?=
 =?us-ascii?Q?ARQoQmDZEF7gLodN9BEqYqCH1Xd1orgr6jS4GgCnOfWWTB3ToqAsmYdiJ5sa?=
 =?us-ascii?Q?kJXyfNKuYq5EdrcqrfmG/ox1lbhH8+CVQKYilSmA9F0Wbu6Covf7FiVFAwR0?=
 =?us-ascii?Q?IhMlqQpT6Fn6tCz//wLE7JNW2+x7wwnZGxGYDQ65NkuzigjDJcP0mN9cp0eU?=
 =?us-ascii?Q?x1F8z3mwNdBMurrDAM3FDGVJuG2lRodPI17UYsmfyvLaNXiuPzmegD2koda7?=
 =?us-ascii?Q?u7ROJf6aBWHo6xz7X/nJylPn4lD5qUsLYe+RUKu1k1BK5B9VhRyOvA14zL0d?=
 =?us-ascii?Q?Jr2DuEWa2cTt8OKw6Cy2jvLAgNC3rxAt9QGPf/+/DYiCrWbBpegT+RZJvV+w?=
 =?us-ascii?Q?g8Q2WzzIcZZS499ahTtwxVnXGOhYdEc2iItC3jZ4RGBzRUoaGjLT+akXAr9D?=
 =?us-ascii?Q?JDL5kqe5bXmFIA/833hKLisFmtmlZYYE0WfsU2dxZq/QqUdPxxf6thk2lvOR?=
 =?us-ascii?Q?L7Pn1LzbwDcVE9BfAqWpdHzX7eYX4D7XgaCCS0fuNR7jclCRNr4Pwy+lwHdM?=
 =?us-ascii?Q?VY6qPsXwly9Dpe2z3Ytxyaw9j2A8mtaP6lhWVw43rSLrDCHiL4Be3UpugdrJ?=
 =?us-ascii?Q?tg7SHO3TxYq2emS2qJPZbrE=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 fec5e58f-51d0-414e-bdcc-08dc5ab3d6fc
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2024 05:46:03.3179
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 LtQ1hW8D9M0yO7VBsqDdwahxdNgJOs76UrQjOy3ewEaS97tCXGiL/W56deeMezL9+niyozH7Di8OKXdV73fHjCIAGS3KAIXRHlMYTY5jvpgNzUUDatu1XXM/7ju1Ncsd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYVPR01MB10684
Message-ID-Hash: ZIOY4D5V73L4KJ6OFFOFX3R4O2JGPJGH
X-Message-ID-Hash: ZIOY4D5V73L4KJ6OFFOFX3R4O2JGPJGH
X-MailFrom: kuninori.morimoto.gx@renesas.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZIOY4D5V73L4KJ6OFFOFX3R4O2JGPJGH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add document for R-Car V4M (R8A779H0).

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 Documentation/devicetree/bindings/sound/renesas,rsnd.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml b/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
index 996a13f21b63..b3da278cf141 100644
--- a/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
+++ b/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
@@ -49,6 +49,7 @@ properties:
       # for Gen4 SoC
       - items:
           - const: renesas,rcar_sound-r8a779g0  # R-Car V4H
+          - const: renesas,rcar_sound-r8a779h0  # R-Car V4M
           - const: renesas,rcar_sound-gen4
       # for Generic
       - enum:
-- 
2.25.1

