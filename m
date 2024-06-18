Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A0A190C046
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Jun 2024 02:15:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3B492E64;
	Tue, 18 Jun 2024 02:15:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3B492E64
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718669713;
	bh=wKfD0QpgQb78FwLM5eNtXX19ku/axQTeX9T3qjpuPi0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=pmIe/u1kpseH+bvUaNJ5eTNqNS6QBVz3dp4p/h0yhHjVRG6nMMwed/IQRy9I9Yjf4
	 grw39PiH1PBC1475fefIZmhqJTPeMW7cTcxuN0gU+Re7saSVIXCDCmCgbc4VSVTU8t
	 yzYgay59jCQWxTZYw6sIz35dCfh2fRTkkSc8E+Uw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EC44FF805DA; Tue, 18 Jun 2024 02:14:32 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2E329F805AC;
	Tue, 18 Jun 2024 02:14:32 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 70A03F801EB; Tue, 18 Jun 2024 02:10:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2061b.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:201a::61b])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 77D9BF80266
	for <alsa-devel@alsa-project.org>; Tue, 18 Jun 2024 02:08:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 77D9BF80266
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=PiyxrzFH
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N97LmAsbtfXqKyVDGCCkhYYJwt6tamn9esNsv7PjKoh1/gllSQhwO4hWYP6pNi3RmKZAmErZzQ7U7TMIxnpa3+qSd/8XzAmkWBTT4EOk39AEagW6KguyUL30HN0XCPu7gd900f0B0nZnoxV6tHJW1WiIdEid+VpVfVejL7VGiQVlWoHhfrh3lNzrceCseGmgxVTKjhG3EJr8dK5RNJz2RV7QQmQzTWKSK5MDXy+TPSeYM/oSP6vEmqxWsIPq8OYF9O9kEZU+smVRwpV7ZTXklltvu6l4IU5X/fKvvgd3r1OIeDyQFT31s0RQBf48dXKQVvtXxUTKH+m8TgbllWUiFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NIGadZWtvxjbpEFJSR9FV7fTlTDxgUHbOTvGZscz6Tw=;
 b=Lg4GjJkC1khg8pTn/HGsxTvS1lKpqH+1cmCQZ5OvsBUdsETwDpsXp+Xxv6sam1KCo4Bw7KGG4CtmDTRX0EA6dCB9ku2FLnRU2Gj8+wvd2SEaZ7GCM83N7p2Rvci1OT7Fgqcm9aERo+p3yI5elyMkyIeVmZgKsO62dk3CyOwNR5z0wI+AEUdgoTKuWioYliz7Vi62v/unrZvOgmwFt+4SutIKSbJtDhL22FWFWw07uymi7uDbqPOgiwWqVblmmkCMwHsVXKtPK2rccd0SYMhskBCQhCkGKnYvR8YjopRPvNPeOkzrv87IbPrdfi39azt369Q+zk6pGlQbba9NPrm/Sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NIGadZWtvxjbpEFJSR9FV7fTlTDxgUHbOTvGZscz6Tw=;
 b=PiyxrzFH+zDyPmQMmFQvquJm4xmTLdEuqz8aZ+6lrFIOUTN5KTXPVCvDSu100fEca7+PVSnejJBZRQ58y1i5XeliY6EmpK316IHozmGD0qH7XMUw4jSShFdAiP1C5M9N1slY0tR5E+wxNuMitC79s1saCpRiQkU8MeMGIQ2Os0g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB11461.jpnprd01.prod.outlook.com
 (2603:1096:400:38d::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.31; Tue, 18 Jun
 2024 00:08:47 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.7677.030; Tue, 18 Jun 2024
 00:08:47 +0000
Message-ID: <87msnj3yeo.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 4/5] ASoC: dt-bindings: rename ak4613.yaml to
 asahi-kasei,ak4613.yaml
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
	devicetree@vger.kernel.org
In-Reply-To: <87sexb3yfo.wl-kuninori.morimoto.gx@renesas.com>
References: <87sexb3yfo.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 18 Jun 2024 00:08:47 +0000
X-ClientProxiedBy: TYCP286CA0105.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b4::15) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB11461:EE_
X-MS-Office365-Filtering-Correlation-Id: a6197f6c-5b1c-447f-b24a-08dc8f2ad31b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230037|52116011|1800799021|366013|376011|38350700011;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?xFRTcI7Rt4wJDsFgFwle9nPsiEzWOxvJlq0yhezZ3rvsOIL+KfsMXaXdIx7o?=
 =?us-ascii?Q?SU2P4QJQQzNIvLbOcYiCklZglkRhEIj3hZmNQ58pPSCTx6R15rfqY0UOhauD?=
 =?us-ascii?Q?ZFEnJtxtTf28Oklt07pcRFZHFNN34JgIky45wT6NzzJe4eqXb3BOcMED7zoj?=
 =?us-ascii?Q?FLdmIIPsFh8g8dCaNVSVyv5DIEQGNixC6e9ox0SKB2xjna1BmLbDZyVSjx3r?=
 =?us-ascii?Q?KxWKywGs5o5uL4NKCaUtRcF/HBYIxdk2fCh5A67v93RXRj6n3NxXQS4wV/Cp?=
 =?us-ascii?Q?gw4h+x/2fAfYbxxETqKYCN0HvuIl84D96DyUgL3hHdHOBnwluxcP4F3GJaLX?=
 =?us-ascii?Q?o7/GSKaELEa8Ipqn2SRMpHDwMZ4EvwnmiMYNUDtZ6SQP3cNRiUOHXiS1dHf9?=
 =?us-ascii?Q?xFX/xxk/z7prunPXSjEW57HHBJp8es5AQDCWfs4uA+CN91dfXxitEBYHYaNz?=
 =?us-ascii?Q?e6L4+YkNn1nfO4pq2VJxXWBq4puzfTb9RgrnN4tiotQPmtj7zfPHbH2bE27G?=
 =?us-ascii?Q?fUqk8564ZV2maNXhdGB4OCUrYUpNnJegYn33enCv+Vb6Fr1lJZbwlnBqB7B7?=
 =?us-ascii?Q?aNnbvdmUxVb7RuZcLzAEciNSM22JXd2RKp2KOntP5hM1dBuoCqh9BpdV0LIR?=
 =?us-ascii?Q?/uxc+xyE4vRnA1MPZSoyjlNrGFNrss0BR91Dyfc6YZIY9ilXQKfnSju+3yRk?=
 =?us-ascii?Q?rz0jGct7OviIJhEL1/PwJuPK1u+58HSwqWOdSmrCQGrTHWmgNasIKYVmUdD+?=
 =?us-ascii?Q?c2CulUeZkjuYN2a0H8nR6NHYuV3CcskcnRT4T/dy5E9gnDXwiXfECX0aaLS0?=
 =?us-ascii?Q?r8FfXOZwy1O6nBstrCLjMhWd+NITRfZ9gBYdUeRNttwFzAT9pxrGAywVYxzS?=
 =?us-ascii?Q?5UMHlAYqmLn+IZULo2ewV6RhAx6yrhxPRuGI7TxOXJh626Yl79nFkOyTgPbK?=
 =?us-ascii?Q?PxeIKOEySmgQk4y2PI/8ohuq3DaYmJH/OysUAH7jjHJwUWZ4iAdbW0j24U2D?=
 =?us-ascii?Q?xHVL+4tkAsDwc+K52ec0fzwWvpII5thmX5f/Z9jixoArxa9HWQ4AMHctInR/?=
 =?us-ascii?Q?zSMiWnhbzk/jCgne7dNpZX02ukwGrGohHH2UeVuI17dVcpC7qFdZXBXQt4TP?=
 =?us-ascii?Q?RCuW5TP48IqQJgw5phiJZxNXy19F23pwR4KCjtFIA6KiKbAGRyaIopVufl8U?=
 =?us-ascii?Q?qqFvIxgUlHzOBqUfP+e0TgwhGVZcM5shv6NYMdzK1HqYjAZezPwQ3zkvl8n0?=
 =?us-ascii?Q?o0QYR37Xz8OJv6N7blL7eWE+qD6kzt/R3VGXgRRABWeDLePkdvBM01S8bnn5?=
 =?us-ascii?Q?Mwpbc8u3AB3ChVnYx2sfzRFS?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(52116011)(1800799021)(366013)(376011)(38350700011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?UzvpB3OZMybK+F5fCmS82Riqek0nsMx8W494shtjLBUskpgMYDDJim1XxRbF?=
 =?us-ascii?Q?1Q6Zf+fx15wD2aSo0Jv9EyViOUy7Plh4N94XOgWQxF0XzF/OnyK2JP7rA1Tx?=
 =?us-ascii?Q?YiMZY4+WafQMnZQh+gsAWN3qnxROhWf2/tHrF4Q0aSkwbhFIL1kkmB9xM/SY?=
 =?us-ascii?Q?VGveUePDTiILDeR6YN9kHClI9e3dKIdHsOq+xroU91gDlELZAAfZYIwhwSPN?=
 =?us-ascii?Q?IeD4rhqCv3Mk05jwSweJDjmtDWm9k1fROwkn7c+vCzDRDsT3HLcot96KYSQh?=
 =?us-ascii?Q?DTsvEtKjCgiTY4ralCg7hYFKv30hecV2TIoJHIEA12bgfb0d1VucEb9+6ZhE?=
 =?us-ascii?Q?6xIfu+eUDVia7VIxziFndxb71RcfZMe4QIKJ3oNQgFMqKs/2pSAsz9CJZw2V?=
 =?us-ascii?Q?+Rocfr6LVLJOJZfyczNtY0klNkTapRT2W4ZSR1T/gTNOm8fHJyA2rO6ZUlFu?=
 =?us-ascii?Q?z4E570jFkjj/ciADDY5T2NLFphA3MFH7M5+8ODM0HhwFXVY6nZdXoRn07j87?=
 =?us-ascii?Q?m79Kj4WLDyiHKy0loKi1h7VOPUczNNGMwoWPZtvS98CRzCJTfhuiVEnsh3TG?=
 =?us-ascii?Q?nfwxsqziFjC6CrGvpEuqM1QFnlTaA6ucM4doOOzyh5sITF151Vlm1tbrYIzN?=
 =?us-ascii?Q?fBNeszSKxzsACsNe5XpyL0dDVn0LkK2iiSwb1v72++BTyd2Fc1u3JNgpwiv3?=
 =?us-ascii?Q?soh36BtmwIp6+GCPVDI/ZL1yma2o3CxMcqcAnhiocVHMlo/7+I3vfC6Qe+xn?=
 =?us-ascii?Q?iVZVsPnm7J5PLQW8oQ7fAavCYfxgw2fA2PzbGUPmm4lrKPrI2YMe3spCVCJP?=
 =?us-ascii?Q?I4pvIavwV03F/ap6PFHfh4LtMqYUxnwz8eEnZYs6LZ1xNuVbwrndlTQn1v3e?=
 =?us-ascii?Q?N2zcd5a+5HX0j19sKyLRZRyamy6OuyD2S8Ka3O6UhmRBbDNnYSo44u9F5hrB?=
 =?us-ascii?Q?iUxIGPPbrqV4JqmS18nlTrEYcKIrMsRX7TAo7fxbBEjojdSOmc9X4Q0cChAK?=
 =?us-ascii?Q?gFHzPfvEaU5naVYJISm6CWWT8EeIBxTLuqPITp6y/fFfcR857t1fKrx5PL5y?=
 =?us-ascii?Q?xMnFoQVaGnFAyKtzf42pEshWmAUqLVUneW1wINvgOg195/ZZ5wfkLqUazHhq?=
 =?us-ascii?Q?/JJRY+LtCp0F6pdGScE76j2jZFftoJxXdUlzvCdyk1VsENMc0sWrhzs47JGK?=
 =?us-ascii?Q?L90dayFhOIC6ANex1O7wZMoiOBjrwSfF/WOaz0PxI2GxWiVlsHXPaU+KocWv?=
 =?us-ascii?Q?NyRo8nOEqukV5uCeyOU3ZeL+Blge3rTTRZLVCE/vZrbO1SCE4egocpJadOIP?=
 =?us-ascii?Q?tUM/tZYSZ6TiMUdMzzUPuUSpE8LWrsJ+O43rYU3tMtrmZa/jUwA/+7lLF5FK?=
 =?us-ascii?Q?DxlnV90mD0A5yJMWxG9eK2kQjPX1B//hCeIoky9CNeou1CCNI+XN6vbk75Za?=
 =?us-ascii?Q?0Gy6mdpa//xeSi+yO/z7cwl1q0zfsFjKy19HyQXBB03IBAEyEqirb8TxJWf1?=
 =?us-ascii?Q?LSfWk8WQxXFONyLyFQup6F+VMGG06Oid4Osq9ePDkrS8ROugzbRSjN/yXe6O?=
 =?us-ascii?Q?NDIq4FKLLTqMB0svg21y9wRGyaGI7/h7objh2i8WEto+/hCepzh1+g1mbcZX?=
 =?us-ascii?Q?m7dk/5PDdx9k81Il8zouXgA=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 a6197f6c-5b1c-447f-b24a-08dc8f2ad31b
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2024 00:08:47.4057
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 iXDiveNzmIdcReotyDipA24kMiZu8elkrTNTIFNC8JhFy1tPsAkc8JQgSQjn9xYBeUh+Ja6bytdfehI7EVLg1185Y/SCPa3QbO0gbLfXplRhcwwJujFeMynrPtItwinC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11461
Message-ID-Hash: L2TYX76PAPZTS4MEWKU5YQWYRTNFTK5U
X-Message-ID-Hash: L2TYX76PAPZTS4MEWKU5YQWYRTNFTK5U
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/L2TYX76PAPZTS4MEWKU5YQWYRTNFTK5U/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 .../bindings/sound/{ak4613.yaml => asahi-kasei,ak4613.yaml}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename Documentation/devicetree/bindings/sound/{ak4613.yaml => asahi-kasei,ak4613.yaml} (94%)

diff --git a/Documentation/devicetree/bindings/sound/ak4613.yaml b/Documentation/devicetree/bindings/sound/asahi-kasei,ak4613.yaml
similarity index 94%
rename from Documentation/devicetree/bindings/sound/ak4613.yaml
rename to Documentation/devicetree/bindings/sound/asahi-kasei,ak4613.yaml
index 75e13414d6eb..b49a6cff9f1f 100644
--- a/Documentation/devicetree/bindings/sound/ak4613.yaml
+++ b/Documentation/devicetree/bindings/sound/asahi-kasei,ak4613.yaml
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/sound/ak4613.yaml#
+$id: http://devicetree.org/schemas/sound/asahi-kasei,ak4613.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: AK4613 I2C transmitter
-- 
2.43.0

