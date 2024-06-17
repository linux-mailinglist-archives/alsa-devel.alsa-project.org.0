Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DBBFD90A197
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Jun 2024 03:07:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 46C8EE72;
	Mon, 17 Jun 2024 03:07:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 46C8EE72
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718586434;
	bh=DatrdndK5atfZAPf1zpAbPKhhuy5a6f2H8f52vptbaY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qdOaJxEuzZDz70vPG44wPs7s6TQPQJLMygW8eWGGxQEZVe2ROLdw5FBxsjBMMEJpY
	 YsJcpFGi2E/epUcrRSTIXFblSx6Q6dgO7bedaIt7cfCPOeuN0UTIKWmY1dqVf9uz5f
	 4ZfNlNxJhB+An7ojrWSxUYwqkCTuz9/wqY09GrFY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A5B66F805C9; Mon, 17 Jun 2024 03:06:46 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EA3DBF805D4;
	Mon, 17 Jun 2024 03:06:45 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5C815F80588; Mon, 17 Jun 2024 03:06:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2061c.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:201a::61c])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 226F8F801EB
	for <alsa-devel@alsa-project.org>; Mon, 17 Jun 2024 03:06:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 226F8F801EB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=o/p1fzZa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b3DoIV3R1KTYN8g4s0wjsoE2xaR06Ip+xDoNL+KaLEfFPSW0o3/Ce/XrvXMNWUvb/NEJCVluFfgH4sga3P0vLGSNRDiTv3DUmNGbep46Qf2P85S+WMqMn4qq9Cwb1YRLMGssThJlQn3qrFslbIliJW06QhLlwK6JfuU37XJBXR9hziy9hGNRqxB9xJI0hITZi9tSDRKO5ykNQ9RzinWB1CNAHMg0EGZddiHMCU9rLr54k2sUGUmrtfahU6lbEYqh7aps3E1wi1cnMgIWVDDDE+2kFDbAqPt+qVwgZ2Dh5Nh1vQa0ApLrakE5PQi8cqj1jpkUwWrvx7loEU8Im06LtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rrmMI/8LoEKlLvdzR5pryoS4zouS6yTC1zJV2fbdnec=;
 b=hnFqHJ1/qpDtw0abLZpIEQGBGsVYPdZWto6oW9np7soQaYMTfyOkOMFPSvHuQ9vvuzwlEgAm4d9WtaVw271XeWn0GkqTY+qSCwa5gtg7RGyjqQwd0tPnAeyb5Lv6u/cFmaZ0YVlHzigDVrg8LkT1mVWHFW7q/Pz3SBBtyqx1cbOWnQvE6LWI0O37M80Qa7h+e+y9AOjivx83L9lxTeZKiEor2a6IinKwQb5Q54RZalo4j/sNXM33NLkAYIJ0sUOyqZe1uoJPftoni7TWOGpgT4eVkBWf2pTLtD6TA3HR7PlEIps72Aa+iXZ4lP3H+2EOcEeAgAncsi/4LKkCnRFsjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rrmMI/8LoEKlLvdzR5pryoS4zouS6yTC1zJV2fbdnec=;
 b=o/p1fzZaKzJa8ouSWgF++kJlN1jkdRI+njzFPVH5j1NtPxhls2NrL6oBwh+6iXwlAigwy4a6Fuq3yyDeoPqFqy6/f4X7OhS2P7tOeTxwZJvkswvPsUTneUuX4Ln8LWpRG/pqDQRwwofrdga/jwHZ40Pdfo9AYdCJo/Bg2bALfD8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB11912.jpnprd01.prod.outlook.com
 (2603:1096:400:38c::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.30; Mon, 17 Jun
 2024 01:06:33 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.7677.030; Mon, 17 Jun 2024
 01:06:33 +0000
Message-ID: <87frtcs7hj.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 1/5] ASoC: audio-graph-port: add link-trigger-order
To: Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
	devicetree@vger.kernel.org,
	Maxim Kochetkov <fido_max@inbox.ru>
In-Reply-To: <87h6dss7i3.wl-kuninori.morimoto.gx@renesas.com>
References: <87h6dss7i3.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 17 Jun 2024 01:06:33 +0000
X-ClientProxiedBy: TYCP286CA0237.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c7::15) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB11912:EE_
X-MS-Office365-Filtering-Correlation-Id: 75157ea7-f242-4c5b-a0b8-08dc8e69ba97
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230037|366013|52116011|1800799021|376011|38350700011;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?HTmI50HJMKNE8eA+NWdnA+R4f0/W1pNnnJW06/Tj+vEm4c4u4AHFIBgqBnIJ?=
 =?us-ascii?Q?IdHsjG3xCgyH2qrlLic9OuvbxaHXZgr1wjg4LRZAUC/5n0f6X+i8mXO3uklW?=
 =?us-ascii?Q?x2iiAj25aeYjtmnE4DT6bknmwVd+9zu5HbBdDk9CS4IG5ku3zSZrc4O62RmR?=
 =?us-ascii?Q?UVbFAs4+WH84Pk9QvWxcAEeeGnfs5BdU4/x5xNRD/VA0IzIjPlSjwNE2IjKt?=
 =?us-ascii?Q?WKStCJlspRiPt8c38p1/LvgMJ0QZm6ABnWlEwXnnfhBgAM/WfDGn3F5X8+Dq?=
 =?us-ascii?Q?lF6OnVmW7CsT4Pea5BnNh9VqYhONDjt21kE03IDXVs1YtkScFNuvnvD6hZep?=
 =?us-ascii?Q?hgZShcGlUmoSiSM97rpZ3IPyg/NOtuKDZ0YF55DG5SGBVf2hWaAXu7ZWqxB9?=
 =?us-ascii?Q?KPfKDmyswOZOX84C4/rS+N8uoPMie2ayWTpIKU9hdHy0q/xkuwNf0GPR1I2I?=
 =?us-ascii?Q?Aup3xe4ADoOo2Kn57IoVM1AgAx8UQdZbeGkCC78KjhotCHF7Jm/15L9F82ku?=
 =?us-ascii?Q?IQVIePoXJBL1pznvLQSpqMAg+XQGUYLpVaUmvwVH6RscAffUCpcVlB1dGHaY?=
 =?us-ascii?Q?Eqy7CliCJQeKdd91Kg2jGev57mk8HXbf6rA2e2rBNa2tKY4AfKYnjY7mwzCx?=
 =?us-ascii?Q?sceL/8kfClpKtM0DwVNRy0Y1ZMawiYtp0blM0aDeaZQILioqs8SfRyXNN0w9?=
 =?us-ascii?Q?jWQSRjritqjcy4nPyQa2J0I85xNnzIHX9Ep+v/Afld6jED+hl2I1saTELjgE?=
 =?us-ascii?Q?jF4v0/drWihmXsTdzIEeDU2RNyMcBqo9KfrKtXCCgF2R4sXWQcbhfLwQsLvs?=
 =?us-ascii?Q?Nfb4hlDFTegC65Oxz2NuLsjteF8Wv4cVysVrX/3pQn0QqLFgp9ucGmdOzRst?=
 =?us-ascii?Q?ehzNo0nzLQdATuXDZOu9ktncfhsVtkCCM63D0mSUx121OJyIZCAGLexQwZx+?=
 =?us-ascii?Q?HY4LyqjjcZW2EuxpvDjMUbXTpjWVd9Yi02vrNCV2fYZ3mFGM8dYz2oWUnvHV?=
 =?us-ascii?Q?rT0G7Gw8zx9p3qD8pUf1aMKg/LekLhwntQPHiM8RgLJN5Z2oWV1dAUKiKg8y?=
 =?us-ascii?Q?jQOGMHpwvSWHTbY9EsdrTH369Il6mjmwWSgvuLUsPw+kx9/1cgac4ZluQFbd?=
 =?us-ascii?Q?67os/WkeRdT5+g6hQ/uKauN+RA+GfhO1RRdPhLOzFztWxM5ZGSuk9nZdnXsE?=
 =?us-ascii?Q?HZNjuklKx+mDDzi6ZSqEuwvAz4OkohtK9oYJDeu7WdqSRc2XWTY85NjuJWhN?=
 =?us-ascii?Q?PdEbAhbC8XspsqQ8/DEZfsa6w3URp8vRC4gGlWY8lH0wnN64kvPceRo8ekPD?=
 =?us-ascii?Q?qYeujJ5WNB0v0RTzAb9FQuBgPpTodGpCvoWdDciEcz7lqv1v9Vd/vNFNg2oS?=
 =?us-ascii?Q?SYxLx/0=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(366013)(52116011)(1800799021)(376011)(38350700011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?FEyMkam6Jdbts6xkqvm9jcc2MFCX1at/MPSv9RDlXEI7bD4lgdVftLukZ2p9?=
 =?us-ascii?Q?6kSglaGTY4KVnVo8TNwp50T22VdIQ8gtVu1FZER07JR68NFfTe3fzNqZhnzN?=
 =?us-ascii?Q?Bz1ihUyFMsWHkDm6Xr8a1m1cjjsI6kP8ogdySDVl2FS7nfFOJsiAqs4PY6Jk?=
 =?us-ascii?Q?Qw/5F922KFcZ9q8nFom0pEAq1qcv+anFytU+InjTgA9DYKeslOSd6Wv1fjSb?=
 =?us-ascii?Q?kpE4/GYl5WkyaxHAWEV3wQduTC1jFPksl38T+MEC7gmIfVFt9E9NBY3ljt/m?=
 =?us-ascii?Q?QrTpLMmTTYsbxr0dVmIk8orM1uOwSfeD2CIOrSNqOc1Dhfhva4e4yIU9LabS?=
 =?us-ascii?Q?Bd3uzjPuRYNer6jBfIJZrqaU8LXUkLzft+5saoAD8hrEmGDE0sanyB0wwhLd?=
 =?us-ascii?Q?sAv8gTzuhe3EWxNsDYghGeeX+kegOj+UjhRG9iZsxfzoBIcMYEoWSj6UJn2H?=
 =?us-ascii?Q?LODZEnY8GIAn0CYYkWles+ks7AQ/IZzilOoQFOpX4ZnLFkXk/oyrFShv3KeQ?=
 =?us-ascii?Q?79QQDy4+ks23uUo2rBMVJfFyzOWlF9Y1RMfnSXglyfmuOS960rB0LUFlkqM1?=
 =?us-ascii?Q?P/r7UyPLapkEChwIvKHeBDwqSYhj3pkPvSmZZljVnt/xFHym5/cIJ+Yb8Knq?=
 =?us-ascii?Q?DouHBIqvQAruBGT0IsBMGLkQVkYbyR2/hawibvrsxlzAwibS4XPJRzHo58wP?=
 =?us-ascii?Q?wYTT98jsf476Es3lY9EiVjsqovImtJ852QrEZFTa6apB/Dz2/NhEkNLfOzRU?=
 =?us-ascii?Q?EcyiOlGZ9hmrJt/CQY4NypYI2qeKjTrt5sqiXiYXvE+/3QEQLkGwQ7f4wQy1?=
 =?us-ascii?Q?mNvkOSoo7h4R4B6pZ2NYMdYM+XOI0CQ0l0neXPT6KhZHqWB4OXTW0XmmLJlF?=
 =?us-ascii?Q?qD9ToJxA9xiyDvQqKWk6zetujM2/qQTu0Ryh7R32BuRjJ8gCO5HAFKjRR3VF?=
 =?us-ascii?Q?uQ8Vsh/PdPT1jebRZX/UfrKx3pa2qA4HaA668cH07kt6dxrkJRwt8is7n9xU?=
 =?us-ascii?Q?MgCi2wDCHkgk02dhCprq39OU8eb0kVylzpdIm89XNgc5Meq0K9x6zzLWFfzK?=
 =?us-ascii?Q?90p9PHTxIDMGeIJT3UiZXOMobCr8ZIX3uVHqPI4dhYPA6YrTSOznT1BqXiD7?=
 =?us-ascii?Q?ScWGnvLNJdlK3GkOk31tOeNXpSpYMSk5IWPY2UayfLhIjyw+sUTp+XKITqCQ?=
 =?us-ascii?Q?1hzqzvDXbmHCSflroxzUSiPRaTe6/xVvu6GnHKzg0tQDi2m3i65//8oS75DB?=
 =?us-ascii?Q?QBJlatzP339Op+x5PqFMUJOdAujYD7gs1pRNJHJ+DjtlSATQtqfBOGw3Jyee?=
 =?us-ascii?Q?NzQoJ+HyMdzA3PcTf9m7rh13GaRk0zWa4DDdJizzlixJDZIhSvfAnGQBSc15?=
 =?us-ascii?Q?U5eNCvl9UUWBd3N4k+Qk4Z7cxDRduVDnMvzg81b8vljZnkRLKoiMIR98TmDu?=
 =?us-ascii?Q?whz6e19s+sJf2LRZQ2xt0jLOwszDrUS04r14h3TaQ5NtBFeSzsTsjxlaL26R?=
 =?us-ascii?Q?WlXn1VKsoTwsjMnxNaOID8uxa3VrZXNkd0OV1wRHWp2VEPQcfJtmE5PEGOPa?=
 =?us-ascii?Q?UeMlkAr6AkWytqeVM6g1SRLdn9dzT1wXpKyuAYfinaS4r98ZqYp7RHlL2aS7?=
 =?us-ascii?Q?dsqm5YAIJ4FxuqgnmOTp+gQ=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 75157ea7-f242-4c5b-a0b8-08dc8e69ba97
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2024 01:06:33.3645
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 O9E3LYWiRy//CEqFqU/ielSE2wlsKbJgC6ZcbCrkWqpfqt9BW1l9QGl2twxg4e2/zI+8AXMQy7B/KNwRv4CAT5K2hBkLKNPgwMdnYPXi7Ut7zqFQQ+e85vGuT+x1uEee
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11912
Message-ID-Hash: B4ZKSNOZ4NKBECBANUTQPNLBOSZOKSU5
X-Message-ID-Hash: B4ZKSNOZ4NKBECBANUTQPNLBOSZOKSU5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/B4ZKSNOZ4NKBECBANUTQPNLBOSZOKSU5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Sound Card need to consider/adjust HW control ordering based on the
combination of CPU/Codec. The controlling feature is already supported
on ASoC, but Simple Audio Card / Audio Graph Card still not support it.
Let's support it.

Cc: Maxim Kochetkov <fido_max@inbox.ru>
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 .../bindings/sound/audio-graph-port.yaml      |  9 +++++++
 include/dt-bindings/sound/audio-graph.h       | 26 +++++++++++++++++++
 2 files changed, 35 insertions(+)
 create mode 100644 include/dt-bindings/sound/audio-graph.h

diff --git a/Documentation/devicetree/bindings/sound/audio-graph-port.yaml b/Documentation/devicetree/bindings/sound/audio-graph-port.yaml
index 28b27e7e45de6..d1cbfc5edd3ac 100644
--- a/Documentation/devicetree/bindings/sound/audio-graph-port.yaml
+++ b/Documentation/devicetree/bindings/sound/audio-graph-port.yaml
@@ -25,6 +25,15 @@ definitions:
       capture-only:
         description: port connection used only for capture
         $ref: /schemas/types.yaml#/definitions/flag
+      link-trigger-order:
+        description: trigger order for both start/stop
+        $ref: /schemas/types.yaml#/definitions/uint32-array
+      link-trigger-order-start:
+        description: trigger order for start
+        $ref: /schemas/types.yaml#/definitions/uint32-array
+      link-trigger-order-stop:
+        description: trigger order for stop
+        $ref: /schemas/types.yaml#/definitions/uint32-array
 
   endpoint-base:
     allOf:
diff --git a/include/dt-bindings/sound/audio-graph.h b/include/dt-bindings/sound/audio-graph.h
new file mode 100644
index 0000000000000..bdb70c6b7332f
--- /dev/null
+++ b/include/dt-bindings/sound/audio-graph.h
@@ -0,0 +1,26 @@
+/* SPDX-License-Identifier: GPL-2.0
+ *
+ * audio-graph.h
+ *
+ * Copyright (c) 2024 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
+ */
+#ifndef __AUDIO_GRAPH_H
+#define __AUDIO_GRAPH_H
+
+/*
+ * used in
+ *	link-trigger-order
+ *	link-trigger-order-start
+ *	link-trigger-order-stop
+ *
+ * default is
+ *	link-trigger-order = <SND_SOC_TRIGGER_LINK
+ *			      SND_SOC_TRIGGER_COMPONENT
+ *			      SND_SOC_TRIGGER_DAI>;
+ */
+#define SND_SOC_TRIGGER_LINK		0
+#define SND_SOC_TRIGGER_COMPONENT	1
+#define SND_SOC_TRIGGER_DAI		2
+#define SND_SOC_TRIGGER_SIZE		3	/* shoud be last */
+
+#endif /* __AUDIO_GRAPH_H */
-- 
2.43.0

