Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 18F1C68E57A
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Feb 2023 02:32:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 35DAB3E8;
	Wed,  8 Feb 2023 02:31:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 35DAB3E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675819944;
	bh=9YXHci03Vh2WlGOEkCOOWuFsIQxOcS3VivNut7U2wPQ=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=LFeiXcdyNaTGTdeywb1Q6tFK5judUS94Z8vNuVzo5Lw0k4ffgLd9XHJEi7rVVT50B
	 O1Eq/qaWFDuFYZimXpKlz3Qgei/f1mN9ekwBWGMwqF0eIad95uJHEcP0Lf98Vrw2/F
	 q2y+czx3WRm/Vo/7WQrsQqmCRMRw25RrsO8K7rn8=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 723E5F8010B;
	Wed,  8 Feb 2023 02:31:33 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ED31CF8012B; Wed,  8 Feb 2023 02:31:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.1 required=5.0 tests=AC_FROM_MANY_DOTS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from APC01-TYZ-obe.outbound.protection.outlook.com
 (mail-tyzapc01on2072e.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:704b::72e])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A1D8BF800E2
	for <alsa-devel@alsa-project.org>; Wed,  8 Feb 2023 02:31:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A1D8BF800E2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=bl0WhLvJ
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mPTqWHylPI0h/VqjROZ5suvZpRLqyfzHEIHSkiPE4oD9aXT1+BaJMTCzLnzfhy5eq/iQsO3SIzL2z1K/fa3JbhDbbJgzTWfscFjZ+/sm6DoE7sBuxqlO2lGZ0S9Xgms3GW2Lvf8h702Z07CwR3QCjYuIb4usgsliVxtgKrQrulDhxLZ5qQ7Zjm1L9+HXyr1eH/CdlLoSZ/xT7EytnciEQWjJG49cOSI3BSVqv0EsMAM8OJ/g/yfUDZr5a7Otg5nXnMENEDh7dN/q7KCR8MM5ZvOgCkG25uEE7yrpLYoaTP6R8q+Vzmj73IOSu2PE8zUuayKXPxdC65e0CHsGpQtwnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oQ7kixLp2xP7PWYSHM7KlfezriiLQPZu72PGAl+gDak=;
 b=eowJN263zBK1qFDvqSQCFescljalA5c67GybuVv5uaLwxxvq5+xZ/9OPdvCvOluTD2MzCBql8V7wkBLLxuMD2HnocNoIr2oaO6ZiPa95YhZlYwW6OmjRUqkn+b1r35Nvq0qCNpqoWgrSVrEsp3ROsMXevn7ZZ04ESTHxHHPFg+kDpttN74Sbb4zIIK3HDEeqbSaFbbvIoY8bDVrzBCRm2DujYhStZ1p6NG85uISA0bxCxl1FOgIzh3M91bT67K9/fgPf9TvV+4RmVYGi/mK1pWDnWwOGC5/krUc4xj6O4cgzWNVRhkDRnJTQgJT7vz2fysAzcL3jnArict40OYWzFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oQ7kixLp2xP7PWYSHM7KlfezriiLQPZu72PGAl+gDak=;
 b=bl0WhLvJa4/boxYOEZBdfO8zxxgnpCFJnpqjI4FK/FTCVANgSIH70VaZcxnLdBRyxKzHMzZFrzIMDCNCCzMWMeYISe3MyOFghzWHdGcSfuy/RNcK1beAOeKBEDYN5gHi050qcIluc5otA6MZ1JjptoYigacJCn+L8Xuv6HXSynE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OSZPR01MB8702.jpnprd01.prod.outlook.com (2603:1096:604:15e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.35; Wed, 8 Feb
 2023 01:31:19 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4b75:8d8e:d89a:7860]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4b75:8d8e:d89a:7860%9]) with mapi id 15.20.6064.035; Wed, 8 Feb 2023
 01:31:19 +0000
Message-ID: <87r0v1t02h.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Rob Herring <robh@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 0/2] ASoC: dt-bindings: renesas,rsnd.yaml: adjust to R-Car
 Gen4
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 8 Feb 2023 01:31:19 +0000
X-ClientProxiedBy: TYBP286CA0027.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:404:10a::15) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OSZPR01MB8702:EE_
X-MS-Office365-Filtering-Correlation-Id: 684be59c-f5b0-43bd-94ff-08db09742e17
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	M+k15w78WxpFwuDyPey8B6SSThIhZuKjZwWcRu/40uVhlCQKqif2u53V0dGqC2XNnAoh1+UPCx+Qn7sjHdJ+Ql/enm4H6jT8X4PTXCus+OLVkVEDn7pbxynJliN6nFh8gi93VtG01i2RbscVQZvMBCMPG+RBtpW1wFC9LOaC4Ija0aXxG9c9MX/AvaOy9V5+/JvbYBRB0MzKm6X2jtdqrWz3RsR9U+UXhLzxadwn7z5vzCpCYe/z5x184WThlZPJ88QmkISodp45PDO19zEGIeDRFm7kRpThWIVUrKwIO+0IFcRkKLQi/dJl+ylgV12T/a0HLgXLmC060z8HkWJoW4/oUi6ctMy+Y5HeDXlP5xUnHwpdqgcHl2zAyNNozsCwr6yzp2fbVtcDU7KGjzfYKq+I+Nmg4mPmXWpb95ZMxbMqJsaXdtyJwrJKpWuFNe/tzBdyWEpqbC6T2waBPmMAl6C0YHWCO84h+sWzMNXD+SE8IiVqkvjAvQGL5cDjsR3E6MoXdmd9Eo3Jgep40LS4Yk5gxrRcKG4T0ARyEpdRRn9sbwFL59PU6uJCDeSOGlPZzO9FOtEsBQwVpBgWQVDcisJlbE9UqLVmEaQ6rjkejk0fbnNnyWxkg7KTFoEWUuMGaoIjY0/iQiTT3lVxAVp+tfmFoU3hdCHjgWoQCSjndqgHibfW1X8ncwsgOT+akdprPzRGJB4y8PQbKsBmAnrwLQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(376002)(136003)(39860400002)(346002)(396003)(366004)(451199018)(38100700002)(316002)(83380400001)(2906002)(8936002)(66476007)(66556008)(41300700001)(6506007)(6486002)(66946007)(5660300002)(38350700002)(4744005)(8676002)(478600001)(2616005)(4326008)(6512007)(186003)(26005)(86362001)(36756003)(110136005)(54906003)(52116002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ar3Flgza/7VGZGATAa7srx0HOJT1r4piPXCyLjoTUVUWs0bWIHs5BbGgj8Dn?=
 =?us-ascii?Q?DYf3b9n8w29ll65yL/jgEggl2NjkCxsnF5vVcUCukU5JUllkcm3vm2dDgLD1?=
 =?us-ascii?Q?MxQAtdb8lnDffiRapMViLX1K/ZO5t8VlMPS39hEQtzG1Z71Grr3i19zhW2jt?=
 =?us-ascii?Q?fAvO+ASnZs89DVvHKy9b3llPp2Gj2Mj/RMeDKyz0cuDthUG8S4wDMEX6DRNo?=
 =?us-ascii?Q?1BOBa6LChqoAF9+bhIfNeUpzrN+G8v1vU999v30VuE4Jn2T4lPKv+/kmhmYz?=
 =?us-ascii?Q?vGTQWg2BjeIRBgT6AMw3Twrry+Z6NZ5fFHXdeAMm2MNxIiIBBUImq1HoWYSm?=
 =?us-ascii?Q?FGE9qv2xab6K/haliNAJaQdf4nTiYEUv+Dw65/nhnYdeWXhR/pHEPYlb/xlO?=
 =?us-ascii?Q?huXtaJeIkzrUwwAyKVxRdO5gvKnkL8XZ3rXrBdDRva15fTzu1RnKEEcVsMXa?=
 =?us-ascii?Q?aDTuLtu2ILsl0JglrOVEvgnGerGNB+BrazJuIts5HGTZmnJQfYPeKsuXPP8D?=
 =?us-ascii?Q?7JfGkqYWstzj8B5w+aTO7dTcLpTm2LpggBiA0xAJc1rwls75yWLRAYTq4XIK?=
 =?us-ascii?Q?3BPsI9oWXltcrMYX0OQHyNYf7P22zTxEiNKKZwVfMOIQKRyws5fPaJcXAnIH?=
 =?us-ascii?Q?w46ytStX3oHY9sY7KmYnVvuUc5xVKvG0kSxHd2MBfbQEAYI/ICXMp6cey0wW?=
 =?us-ascii?Q?GbwWEgainX/3PQJGfznuS00sTyCIjvF0wIT7RoBpMxGi6aO1BBJr9mkycg7E?=
 =?us-ascii?Q?EIP3ccso6KTFVJmX2fyU5Pkp2Og5MUEHBUAj4mQqh8EUk+pzc/Ls6mS5yAGM?=
 =?us-ascii?Q?rxf5KU7SOPzyO1CYOKxHqa1fnt1446aDOZWp8rqmBRfoqeKShej02ko8laHq?=
 =?us-ascii?Q?GfkS9ON9h4GlsNS2dNhexbgV3IawkMhjsi7o6M8qvuxlRdUNt1Tllak1py6I?=
 =?us-ascii?Q?h09WWD9SyyR77GLaDvDIqERfywAlSSYl5p82IPrI4LYMPVvwwu87LufdaZUm?=
 =?us-ascii?Q?2e4No8BSwCXeGGA//0LrMzacVyrRJkXkpRp17oXeTpjKcvXTnaHjMyFbdrM0?=
 =?us-ascii?Q?BQfUkEeaxB+Pg1ZZXiDmF1tY2daxTPKDGX7ge9dr9yrCzFr8RQWB+4ycz2Wx?=
 =?us-ascii?Q?t53iVBrXHq/uHqK7gZYMC+gCE+X2O85m0yZFpzy86ytfoE7PMhs1WNWpO+aE?=
 =?us-ascii?Q?FpdPpcpNn7kLdWPDNOod+o6jHOjjmGNwQFzmyE5HOhumiewB4K2mvtKXmkYh?=
 =?us-ascii?Q?2QwIiFIeq1eQ21hKsn6U4xlHzNCE50n1hmGjfk3A5egKqankuVntkignXG5q?=
 =?us-ascii?Q?TBGwHa0RhV4r6b3iwDnOk9/1MX+X0DxXQGGagILT3t90SYKs6eI/2YmsK3nL?=
 =?us-ascii?Q?7Oq4ltrF/zYoLMcsqS9sdkOCk/Y8uieqR9bZW6O+Z90Hs5QyiGKVoR2urRir?=
 =?us-ascii?Q?peI9TDrcnkE4uRcYcL/qoDxrTZNmPhqwpkp5BJcy8ad+Ym9zPdg+tT/uvsw3?=
 =?us-ascii?Q?WYRPeVZwkcnJayvSJYkiijcuwXWLyfgeC9ouEqg5SuFDBgh6OQtjNmyiBB4s?=
 =?us-ascii?Q?NbAZs3fqro3yqhAR8ahKZHqvB5juL/nGV8Vc6uxERfMycUc957gKoQmg058s?=
 =?us-ascii?Q?54jkqXjbho6KMzSDJ53Xm1c=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 684be59c-f5b0-43bd-94ff-08db09742e17
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2023 01:31:19.8304
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 EzhCCiejQr2UyngXpBFxViEEwP+Ci1X8MFl1OmPYMxN8nHESN4cCKFYG1z3rl5yR3ccMgnTWsoMDecoyCBNFURYBWsIa+iNzCRBZIT/LLBOjUTGag/IqyzhmTZq9gh1h
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8702
Message-ID-Hash: W4GODZ25POXVTCA2NC6NLIHPP76PLERT
X-Message-ID-Hash: W4GODZ25POXVTCA2NC6NLIHPP76PLERT
X-MailFrom: kuninori.morimoto.gx@renesas.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Linux-DT <devicetree@vger.kernel.org>,
 Linux-ALSA <alsa-devel@alsa-project.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/W4GODZ25POXVTCA2NC6NLIHPP76PLERT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi Mark, Rob, Krzysztof
Cc Geert

These are R-Car Gen4 support for Renesas sound driver.

I have posted these patches as [RFC], because the schemas
doesn't work correctly for me under certain conditions.
"required: dmas/dma-names" always hits to "if-then" and
never hits to "else" for some reasons. I'm still not sure why...

But to be very strict, actually, this schemas is not mandatory,
because there is PIO transfer mode which doesn't need to have
DMA settings.

Thus, this patch-set dropped the schemas for now,
and ignore the issue, but it is *not* a wrong schemas IMO.

Kuninori Morimoto (2):
  ASoC: dt-bindings: renesas,rsnd.yaml: tidyup reg/reg-name
  ASoC: dt-bindings: renesas,rsnd.yaml: adjust to R-Car Gen4

 .../bindings/sound/renesas,rsnd.yaml          | 76 ++++++++++++++-----
 1 file changed, 56 insertions(+), 20 deletions(-)

-- 
2.25.1

