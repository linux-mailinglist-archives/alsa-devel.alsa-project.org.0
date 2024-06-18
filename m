Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E66A690C049
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Jun 2024 02:16:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7179D82B;
	Tue, 18 Jun 2024 02:15:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7179D82B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718669761;
	bh=nzarAkZV6jc0M8E9E7XPr6ludIOF8Ukhw6MeoLkbwkM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=QNUITeH+H3wjcaom/suv35D3woj+bcGDaJuD1du3eKD8m7u1+3QqBBBxhZE/KpP7i
	 v+iqozcCrzP/a56zVh8sA6vBRMzLLmi4/rRu/YsZzHBNwh9sxqnXoRf8sdqq8UQOlZ
	 GXvsgu4bSB0P+GaIBytM2IhkEFQZVM/VZkAtXHm4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AE093F8065C; Tue, 18 Jun 2024 02:14:38 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6CA34F80636;
	Tue, 18 Jun 2024 02:14:38 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 74F53F8023A; Tue, 18 Jun 2024 02:10:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2061b.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:201a::61b])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2729FF80269
	for <alsa-devel@alsa-project.org>; Tue, 18 Jun 2024 02:08:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2729FF80269
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=gIBR+y4d
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m7yO3AxtKtOZs5iW6e6E52GPUHH7z2ij95n/ySWz30aqLI1S0jeEOwx7Z87SftDIS6YU7eZg410IJCtZJ6nLZgYpNP3dnLQ+KfD8pNE+nAiQjPBmi2aV59rhf0iUACkcMNnEtq0pCP+IoojQruYR8K8IokX2UemxgcQFsYQfaJ0mlY3rHWbSU/KXt3J7bQAkkplZ3Q5JaVODAJU+W2leir1jzEtpfjwBRiQ3Bek9McVBSxdThvU7MHSbJXWdKoQD8yozk0Vqmb7PkxczHIED6RV/5L02L3Yuc7f2pUjfWk2dcpNhT6FbZ7JIJ9tHCYFteysYAe62GNMT6kQpED1KrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TNwqHvxCg0jFrrZ/pS/HTV91GA+F4H1KmvUnqHlEnrU=;
 b=gwfO1OLqUuNzDVfr9Cq16wg+WswzHMy+IOTGg+94X7sBFZ+boMBNQPu8NbMEJlJ3pARSHUbUIbUgJ+9Gr+k/jmgc2i/JOflisKd+8s6diYw6XxPQ2SWgjtd/B2I8kPyG+zFbjBcyUrETPTwpqKX20bbs1JwtpLp4RlXdL8KTOgiGFlX056UAkE2ouYT9U6BBfAzXT6YJRDve/QyABerhVbiwb5irn4asFrvO+0NqOgXFU0QJ5hQqLd82EMlvhGRTbwzpMY0Ps/Ec6/De2dcJ8MFE4KiJB1ibk6jchPvJR9qVNOLJQEuFou6wtaMYM1htCCeBetACG4acVCx4cu5oGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TNwqHvxCg0jFrrZ/pS/HTV91GA+F4H1KmvUnqHlEnrU=;
 b=gIBR+y4dIArwaxvpVCnVhM9zwuq4GhMkcLSCCuonGIBMdOaDohFe1Tb0NXCiYFdWupImo61fqMK7jO6VqaHGoG9s1zKaA9NG6uvE/wJPCOtQtPK/Lr6zp3HO4q34loBmfeDJD5t9n+bD1OimI5ZiYYmvt9N8/W8Dv3zQ2T1w0Sc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB11461.jpnprd01.prod.outlook.com
 (2603:1096:400:38d::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.31; Tue, 18 Jun
 2024 00:08:53 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.7677.030; Tue, 18 Jun 2024
 00:08:53 +0000
Message-ID: <87le333yei.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 5/5] ASoC: dt-bindings: rename ak4642.yaml to
 asahi-kasei,ak4642.yaml
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
	devicetree@vger.kernel.org
In-Reply-To: <87sexb3yfo.wl-kuninori.morimoto.gx@renesas.com>
References: <87sexb3yfo.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 18 Jun 2024 00:08:53 +0000
X-ClientProxiedBy: TYWPR01CA0019.jpnprd01.prod.outlook.com
 (2603:1096:400:aa::6) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB11461:EE_
X-MS-Office365-Filtering-Correlation-Id: 2efcc904-f588-40cd-8e0e-08dc8f2ad6cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230037|52116011|1800799021|366013|376011|38350700011;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?PoHBO+P5ZN9DbnjVuKBB7LQnmFefiSSK/jlvrSBsPVqsaGUTmOiUB5I0avhw?=
 =?us-ascii?Q?TVUNBFkBC/ybGdwntWnhkut2CqnI+l57n6Knm9qlLnekDvzQ7I/5evxGpWlZ?=
 =?us-ascii?Q?m3cbcNfvsc/479bDlaihnqPJEjTLIcb3VBl5gZ+eHaNbzDeqfRHB4yHoWKvN?=
 =?us-ascii?Q?O9ac1AznYPqKupQkExNrUp/u/Fdnulyu90J2BA5l1HGYFVOf6+SbVHWDC4oH?=
 =?us-ascii?Q?UBmL0N4RsTVNeBbtEXcVecN5h0IIqT6EgJGxuMcEG4BBVKz5zWg7nhJrZ0bV?=
 =?us-ascii?Q?Bd/7VvE1buztsWTFIBvB0k8uSojJ3+AAcfxjqzLYn6EsBz1dN5QAUE10YneT?=
 =?us-ascii?Q?S1kqFP1JkkJIAkeT4Vftut7ij+YMf7VC97jM+nICnysjsw7ReW9AKl7OFaEE?=
 =?us-ascii?Q?UVULVWGncuY2GrNOi1UZ01n9sxPux75KOvAAtPBgxibjl/Nf1EIDF+4XkT2X?=
 =?us-ascii?Q?ieIAGgYZ3tI52uZsrrSWSH700dQRXDJdmKArjeGcr1IbQ4by4Py/oP2NfnOR?=
 =?us-ascii?Q?GXws8trE1sCLTpnsfeylSxWCeKz8AMetP4cB6nHvh6aq381x4PeI8cfLlwoS?=
 =?us-ascii?Q?iPfLY0Qcje93M2xPdoqG17g5a+K93voydxLB5OkBHCTW7h/UUtd309cGdU1s?=
 =?us-ascii?Q?rnW0xPyWVgJZPXsgtIGA+fUN4IwYLTrG+v586sW8vHuq1k32eHZ8aFOe+EGo?=
 =?us-ascii?Q?uQ0dOjzXRP1UdcgaevG8+cWc1N/Iy3yNvP0kl1RCvOclAhj6iyBOwIMgzY4x?=
 =?us-ascii?Q?V4XTgX1gIpRUipo037gLFNRQjYM1fzn3S9eEEFI7LwHnVE/CZE+/v9NmODfH?=
 =?us-ascii?Q?JZmdd1I+aIo90td5Syxzm6ljj22d16zZzTx4spUu6Xn01+vUYtg+aJBAERQ0?=
 =?us-ascii?Q?YYWfO8S5MMqk8GYimt0hrvf/p9w8Ae8jLXkh6UNBhnt1GnGQ56kr8HqX9B4g?=
 =?us-ascii?Q?AAHmpCDNO1oYrJeVl364XIHBTopvK5VKC3x8X/FxPMfhkjT+bDFdZhwEXPeO?=
 =?us-ascii?Q?2jU5IGXvSRa+6KPhORC//qMEP3yeDMcYg0RX7aF12Pm/40bCJraVCaw4jjq0?=
 =?us-ascii?Q?/Eri/qzld6nqjRPaEeHTNRrcQhWUv8EFmFpz2T1PRBmNxTvmoJmSAGoMFXLG?=
 =?us-ascii?Q?yANUQrFnSht4NdqnONZbm/LMj/E8L6rLs1Zu+M+x5CKVIdtIJpTkchXinvw/?=
 =?us-ascii?Q?hYWhKD2XrR9K/7WBR1ynffZ2nmmUCh5LqD6pnDu/uk8ZDJ7qhCakA/qFqEUn?=
 =?us-ascii?Q?KU4LgqP+m8L4qCEcYwOc4APdxu92IFv/Fky5mJcLkJqZVeOok7Ruftjd0DiM?=
 =?us-ascii?Q?VJp1A4zWlxRx63k4QtmsxOFZ?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(52116011)(1800799021)(366013)(376011)(38350700011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?qMMnOK5GhhDagOYonBWIYp83yBlYLil3v65pHFpVWQe0VXwSsnKO7fVuIp3B?=
 =?us-ascii?Q?/QEBq7ol5W6BKExX4viUOhy3hycNzgQGkknT0pCR7tNExC6XUfhsjcDghevP?=
 =?us-ascii?Q?mI3ONQWO6FDln4D8jA5iNDypagI5jpsTNuFf7Y/zCbbQheQpiw9949m6Ep6e?=
 =?us-ascii?Q?PPk3fvhXP9SbTVi6epC5Wwclx6OKwfwmpipLHRwXE/DPrlyzTJRR027Nal9U?=
 =?us-ascii?Q?GIkXzgFb9LFBwVQgKYgA+ai2/E3OeLST92FGus7SyCJh7yDLx8fssp9iq8G+?=
 =?us-ascii?Q?Xc4d1iBDGuKJBsMwBIzIsJ4WbL3GSk4pPhbeErtJX2e7jwmnmlPLf7ejG+ve?=
 =?us-ascii?Q?gn1vp9SeYAqGGx2prwVzmQR7gN5a96JCxbhA888TDNCBzeTfiB3ev2NJIdtG?=
 =?us-ascii?Q?ydYJCCcAm1t3J5DjW6xIIXBd2/dx5mDjCk/+gNzRXUJGvkrcr/dlrwm4DTD5?=
 =?us-ascii?Q?nm7Ck0oLhfkiKHG3M14Le+UjiGGsa/fcxFHnvRpGK2CZbGYgZppZF9sPLEBo?=
 =?us-ascii?Q?qILNCdn2JT0OkMt6oYrA91KECz83Zzd/eO0vbifHl6wjqNzWzWeDu8zlfPNk?=
 =?us-ascii?Q?jxpKKzsok4Qtja6oizRIVUiTbjuA6VllskdnMNQtNzsgnwSlqsLgftF0IGbJ?=
 =?us-ascii?Q?rtvjUDVHdU7gZGHPwuQ0eKpC6r/pudnV5C990LukRAfeOSxqZahOgmWTOcsf?=
 =?us-ascii?Q?t8Qah9Tb4QieirBd50fBhwhDW+M119B05CjxsuQy9ePhNbZt4KXb2C9pCtxe?=
 =?us-ascii?Q?D2wM7PBiL8ye46F1HHjfRUKRbpOqTfAXGRS73SwBJr2gClbaZALvDOhU0pxn?=
 =?us-ascii?Q?nTMbWRUm4v7s08JoBtMw4dRiqBdoiXhKUaAWu0fQ2yePT/GCZTQofr02IC10?=
 =?us-ascii?Q?UtdHPKzhBM3xsGm57zNzQvFNBCs6/lEIvagcdVtMl5DaoywpaSncgMonstMW?=
 =?us-ascii?Q?LDO1R1uKexMmr7ZPNaCtAf1oNM5mRJhPpJarTO9UTu/ikqiOWjk0Yv4py5d0?=
 =?us-ascii?Q?sFuQTxWh5+StoOPpN2LGJnN0GilIIjtKylP2Jk9hksaWyUTd/oiX6e8Yq92h?=
 =?us-ascii?Q?7K3v7da8y4U4OfIOGpyixa5bvSPNtYPtfbne70JOsMf8lDffQkw91BLJ6WmC?=
 =?us-ascii?Q?h3IXiABSWRHJPmeZ1ebfSkpf73OJ5eG2dzPggFMpeKLlv+jJN/hWWlacbFPL?=
 =?us-ascii?Q?2LywUVA2RtOkQHyvS+X9StkXADw/Qq7ypSVttx/IGzbtWk1sAls6ec7vP46T?=
 =?us-ascii?Q?6lq0qnmFiHG78uq3CgEOm9jRerWaRR8TSETrjtaDJMKsXwE23z5cik9yXoRp?=
 =?us-ascii?Q?HrarCXQgxzakcOexqqqflao2sqUNxtHB3o5rDQ//dcycz4aXqo5NmFn/i4jb?=
 =?us-ascii?Q?uWX/l3ad6sxw5Zg9Mtt0anrduhyqirzqqX4HdUm0Iijs5yvmtARPdkrBCVxK?=
 =?us-ascii?Q?RKOtsbrnInI9h6ycslJi7tQl6zvrTeeqWUmQNNoJMkipRxi0EetbC/MWtE/5?=
 =?us-ascii?Q?jt0wM3jbm+w3nJWHU2B8e/4W+/tCSbn1gJuSTz9FVX5dwuU+/Qvk9xVUAH8P?=
 =?us-ascii?Q?GSRDKcAoxUFTWw8sit4rEQ9XW0RQQrAFD+bvy9T+AlRkaQjo81EyD73S6Z3a?=
 =?us-ascii?Q?KYKKgzdWe/YY/0R9fKSiwJA=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 2efcc904-f588-40cd-8e0e-08dc8f2ad6cf
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2024 00:08:53.5651
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 0cSHGcMCQ6FOSbmywaQF4CDhCocPRuK5Cw20+O5qQ5ANkoVXIOKkF3G9Ls+1PkUJZpjG966M8i/Gc7OVYt0fzI9cmZtaUA+EQMh2n96Z7C8OivdOkCvS8OqVZvFrdV7Q
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11461
Message-ID-Hash: W72IRDGN2MC5RYFNNQDCUEZYZG3LI2E2
X-Message-ID-Hash: W72IRDGN2MC5RYFNNQDCUEZYZG3LI2E2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/W72IRDGN2MC5RYFNNQDCUEZYZG3LI2E2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 .../bindings/sound/{ak4642.yaml => asahi-kasei,ak4642.yaml}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename Documentation/devicetree/bindings/sound/{ak4642.yaml => asahi-kasei,ak4642.yaml} (94%)

diff --git a/Documentation/devicetree/bindings/sound/ak4642.yaml b/Documentation/devicetree/bindings/sound/asahi-kasei,ak4642.yaml
similarity index 94%
rename from Documentation/devicetree/bindings/sound/ak4642.yaml
rename to Documentation/devicetree/bindings/sound/asahi-kasei,ak4642.yaml
index 437fe5d7cae1..fc03f0373a1a 100644
--- a/Documentation/devicetree/bindings/sound/ak4642.yaml
+++ b/Documentation/devicetree/bindings/sound/asahi-kasei,ak4642.yaml
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/sound/ak4642.yaml#
+$id: http://devicetree.org/schemas/sound/asahi-kasei,ak4642.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: AK4642 I2C transmitter
-- 
2.43.0

