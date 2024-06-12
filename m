Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E53B6904B4A
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jun 2024 08:04:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A2665DEE;
	Wed, 12 Jun 2024 08:03:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A2665DEE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718172242;
	bh=xlc2jJQuKrBOEUfIvzMB4f9Wo1wGzSpXSq+ZQJATe+4=;
	h=To:Cc:From:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=tLPGTxuBQr4PJ0tvbtnht2/j2sRwCg/fBwh9YVwumnGg7hEMJ3/UFuGg27sLuzr0f
	 GmwGwJJkct2fJ/dnzU/TOLPZ1F0YUoequCGgxQGa1wfhAplJCueyTz16XXCeK9mGCq
	 uvjAabUQ1di92Bqw+QacPoN8/cHsIps46ZI/cKNI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E6238F80579; Wed, 12 Jun 2024 08:03:30 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0BEC5F805BE;
	Wed, 12 Jun 2024 08:03:30 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BED05F8057A; Wed, 12 Jun 2024 08:02:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.3 required=5.0 tests=AC_FROM_MANY_DOTS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=no
	autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20621.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:201a::621])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E5B28F8010C
	for <alsa-devel@alsa-project.org>; Wed, 12 Jun 2024 08:02:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E5B28F8010C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=Pkuxu5JA
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DcmiIygbw1+eOwWknozRQ5+GlSDgXNAq5JawjE2JHCQlB9X+++O+Zp/8t9YfT3bGeBNWOAA0vlRved/+3xfzspGzacscTdMQVaI/PKO2FN1YkoyojoF4CVwZI55WMkh9SiqkJBInTUJOyB/mHcspfwIkoXmEKmXIKiv9spQhrPWEymsxCnInda9oaXm2poLre2VNb/S7wzrDDzn05YxBoZ7xyteSz7MSOCgjfUhfS0QUqOLZC6ZrWf9kt1UMavtBAo+hq6Hb3X8MGu71ONE8JUMo8EfQy5wLoXYHDXEywm2pNB13PB92OsH37cf7kgDbrvo8csAQtxfHs0TbOsxXWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bQQ9KSvfh/ENITCOFOxoF9XwgBfsZS0/kSo60/asNdw=;
 b=S/aoHKi8MELnyCk6mAhgMxzK7+dDAyrb+EQxWUFdXuL5ohB+AWkVD25bWuoajXrBDwXb9uIbSXRgy0uNyXZ0vnuFOtDG6Dzsg/gqoQ/AGfOX1vAYBqx/NNBWhgJQGyuMG/JVacSywU9Z7WQBapvFMrlXcSpEBOo5sCCJ967JWf8Hl7P+kohZSFwTGkEyGJ24DjDQJXQvGfWTTALCQTUvxeRn5Qe1pznPYa601WwJSVoQ63SR8bT+NIyD3lwicweDNEAfkcqA+5Jg8/HdRR+G5+KJeL3tvaERn9BrcrjnkrUiM7ep1m4p7JrlQmgmJZoGAhnx6Po6+IrVhvFIQ4ez8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bQQ9KSvfh/ENITCOFOxoF9XwgBfsZS0/kSo60/asNdw=;
 b=Pkuxu5JAFs95t3i7lIA9mdkROHYUspHnkosYNWJml/iJZTJfUNdFYp0Mvo23XDuBqkVuZgaFrlq+Akhl9YKN9ESgbaOYOCTXk9A0ZsSG7X3P7zvoW1LELLL0oOXThus3QpXy+/ZDpCHfml/o4M9Qs4tNHbq5H8/LPPuI4xrzA18=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB8904.jpnprd01.prod.outlook.com
 (2603:1096:400:16c::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.39; Wed, 12 Jun
 2024 06:02:04 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.7677.019; Wed, 12 Jun 2024
 06:02:04 +0000
Message-ID: <87tthyzokk.wl-kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, devicetree@vger.kernel.org,
 Maxim Kochetkov <fido_max@inbox.ru>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 0/5] ASoC: simple-card / audio-graph: 
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 12 Jun 2024 06:02:04 +0000
X-ClientProxiedBy: TYWPR01CA0019.jpnprd01.prod.outlook.com
 (2603:1096:400:aa::6) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB8904:EE_
X-MS-Office365-Filtering-Correlation-Id: ed7c96e5-6b6f-43ab-c5c5-08dc8aa52efd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230032|1800799016|52116006|376006|366008|38350700006;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?5tzrg2qrUvpNrOyfkhI5WfUHcuLNNCaeF8NAiEWehQEenBW59ypKCXetRgns?=
 =?us-ascii?Q?S0CaDVBcqgH5Ws5sZtGn2yYpwuZ2mzCmqJPlwxWrT5GGWm7GFjqWWvGm7MUs?=
 =?us-ascii?Q?NLTyZGSgnvWHgz9KLlxhHL96uoH2h/LY3Fd87jZfP7Inbcu2cBU7qW/geeXs?=
 =?us-ascii?Q?MQis74UX0/18JMfkNffnHvxo7T7qX5//OH+QKenVo4GsX9zGkinCnAOPo7m0?=
 =?us-ascii?Q?REdgHCI3rh4V80WeZlML7MGVpL3VxN/fXV3VSYVLsjCx2/SI39Bk8FOFMucM?=
 =?us-ascii?Q?XosckNy4YH88/9KJXAHolApejPBX8fmMYlNMQ6tkCqXJ1Ns+cYj1qOhnOUXq?=
 =?us-ascii?Q?A/Y7BCD4ubOwdvP3/U816BRvAsymA+8dDxcTOVhMgo26s9oiVbkAbINYedrn?=
 =?us-ascii?Q?aa2m1IUIROmKBPPPsZfEYzVr+j9rox0+ubfdwE3D7t2EAq4fSbD5HaFjC/bx?=
 =?us-ascii?Q?fCD99X1EZqlA2YvStEbZIB0hs6D456gns08quvYzGve7lcslr1X5irW/DTQC?=
 =?us-ascii?Q?Bbu9W+T+fAwFCJ9S1KjxDCW877xre2YG1nxF5dj7qwMTLeVf6tb8SzyMNqxz?=
 =?us-ascii?Q?lIBUiuRkbSUucwqYFccXSdLn0n6WxjShyApJsSc+mEEh09gkoV/MBEzzPA2B?=
 =?us-ascii?Q?qZLDpec3nMRiMVPnlo54mS22/U4/qQN99ISgP2YGcy2WsrUOt1aCdfaIQMT/?=
 =?us-ascii?Q?dRG2/CtiM5krueI/I1BCiPmlpjcPoDbA/ICrfFOGIXgKymlOIM8C9a5I65vA?=
 =?us-ascii?Q?v+SBpdaEAg32p6oKw5TIrIaltiFNDf23RS6fF2wE8xzaoEHtJITvlJMB8YtL?=
 =?us-ascii?Q?tyg6MjNr2EyjO1RHIa5h1BQEyxDolDTWF6N58+F8LZa4Ivr3frgN+cJZbQKe?=
 =?us-ascii?Q?PHPTeZCZfd4mLkJdfjQ/Wx6K2OgwYUwPpwkDjWmjhdbwufaz1WpZO/yqrlZa?=
 =?us-ascii?Q?1z8ckq51gS8FzOVOkzFi6XL6GZnTvPLc9fSXegf4i6B5lX7r94HAY9bxezsj?=
 =?us-ascii?Q?Gl5hKuSszXdzzXvheTskpV8WfSbyU+D9Im+9F0BqrHK5cJ6OOppdyhsTnQYH?=
 =?us-ascii?Q?kovPTh9QGH6jAONviWjjDuyTw70o+/QwAvL0PqOcifPifIOWJd+VFPkfvy8/?=
 =?us-ascii?Q?iJHrm70tu6Ry8LUlgGlwBVYo3s6DyhweCUSA4PlhMg+Uo4cttui/IQWoNnRY?=
 =?us-ascii?Q?qP7NDDReej8DSZL4trhsmvagIAoGfQJBHFTVDDmVJ98WbrNzPlSyFazDhhRs?=
 =?us-ascii?Q?bGNULAzN8laA25zP6P3mB8TOg+8NLlVjuUYpCq2OwAE6llCl4A9i9+Y2MSFz?=
 =?us-ascii?Q?JgPfW8aJjRbMzOadDupOZoErRzH/oAimmwQy7Y48r7kAJUuJXkAc2OCW2yma?=
 =?us-ascii?Q?ZFe2XEw=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230032)(1800799016)(52116006)(376006)(366008)(38350700006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?IiWUtPCnNKDKHt42ZyBLPrO+7S5i3awppqRas8Wlvbz+OxIuhTge9wn9Quhv?=
 =?us-ascii?Q?RYBOh350CCXUvLYWQ/DCexkdiztNFaXS+wwVh1ydUNH4P5ZjdHTQG7zbmASa?=
 =?us-ascii?Q?DCHO2j/SW//oY3+MP4xk6PJQJ6kPwy2aPjmSKfyrtKF0+I4U0l4MjHnef7Xq?=
 =?us-ascii?Q?osuKCi4eEMM/lADrRHXwOY5E4lpH3aLrmDFJVx/sNnEhHZfUf5Adn0FbJLwM?=
 =?us-ascii?Q?Pp2FqmqI5VWyQ+zThL24opl6bUg41RyVDf+fdqwvGTjjAPYYiRqT24QRNtWq?=
 =?us-ascii?Q?4+uqtxQ9IJmiK6rym1+cf/XH92D0ooW3K2YJhzp7gZ69Ahl0AfeChGEHxvj3?=
 =?us-ascii?Q?/pQt2e73pBnXtDka1SnZQAMpLsI4e3dbewst9IslEAuOug1LhW46qY0DDwHr?=
 =?us-ascii?Q?VcTiv12ExtsIu/1sNPOax3D4NZ/0JFBExHBn1GjFwXr9kF3RUxYRqTtEFxed?=
 =?us-ascii?Q?9XuAiiAkIJfo/Tra7FeSDX/BH1R7wIceE3T7RNO++yOA/6qUpeZ2mOyvcIMp?=
 =?us-ascii?Q?yoaUMERWxYeeQFxIhO5p/Fo0uwstDjmlGbNvdioG8/y6IcNu8aUZqf4BQGgU?=
 =?us-ascii?Q?Q2d7+r657Q0NO3M8UDSuECEHPWjSnYkbPKVmlNkzRUhcww3/EmtA7gSkktFf?=
 =?us-ascii?Q?iZk6BRGNhLM5wvzcI5XrJ7/9hXGDZ6/+BkFzI14gMkVkea67XILwY6XnB8UF?=
 =?us-ascii?Q?6zVZoTFD4VRigYa73vBWK3EeYhdJ50rFmCCp3lSeNp1XeXT7zj7KrK1GVyJd?=
 =?us-ascii?Q?ne9gV4Pe7Rs7ld3+q9qN0v/Pg+MmXCRkcY7wdvCtVANxkgoFmRpKhdg119ds?=
 =?us-ascii?Q?yicKBx/qiJiLGKdaBOxPdzIEh8xjgWNgMwhFRDeOdFO3cPacoHM7OLg0s81m?=
 =?us-ascii?Q?9P0KRl/Yp5jULpjgD9/ycG5+WsS0x/d0lDwHmVaRB8JnY4812rQUopzjJMTz?=
 =?us-ascii?Q?CdUr+xklFZqgqKOxGNQK/X1gX32flk6IMRbQAeFH6ICsBSrL3eMubJNmtf7D?=
 =?us-ascii?Q?MLTiEYgIgLYCFCIYbs4Bb76+uVLmushK8gWDTJSBf4UNeh3ympkUwpPS5Ld0?=
 =?us-ascii?Q?OTDTfAGlYVpCT8JHJjOoBwkUjnagFEIdOvaAgIpa54mksL7mRKGqp4fHmW7v?=
 =?us-ascii?Q?WLe8rU2jyRZHxOqKWOQ1L908Zr+GAXmDzDIoTi4qYsj3OfTlnrY5seQcvEEp?=
 =?us-ascii?Q?FsUFU4RH0vufCLoTCLlIAqhOC5O5xAISrHWvnKFVbtCJUbiYmSZCU4/JNeIv?=
 =?us-ascii?Q?LbkHotRijvmgTVWAODTOoYfdWZDu3PE13qW46lKbFNbKAKk2gR92C7xq0cFP?=
 =?us-ascii?Q?Q6VIH+9tk6ik5Q2t/6cFipSRHQpBZ8rIjTVndjEsIeZ/Gu4+/itItBZmX+5n?=
 =?us-ascii?Q?v/wGzEbHQ74wDDRcSa0ow/qYyzsHVabU6p/T+Dzok3oto76yz3CFzpoi7wnD?=
 =?us-ascii?Q?KnNBSQRM74hu1OfvxuI50+KUQuUwrUrgxeBDJ9izoWWxVLh3Vp8waubo4EVI?=
 =?us-ascii?Q?SGkKLHwbyXXoEqQ10DT5fBa4pEEnjtUaovkXI19/xfJlah7GQ7TzgaGwgZjv?=
 =?us-ascii?Q?7VMMyx8CuahURS0s6YfWCkxNWxT773thUYWVwh3uR/YOm2yVS1pwJHEAmCMP?=
 =?us-ascii?Q?MMVwcS5wStOOpoBuovUR/VI=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 ed7c96e5-6b6f-43ab-c5c5-08dc8aa52efd
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2024 06:02:04.3158
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 0r8BYj6WWAqg61fDvD2R36iB271mE3OXHxzooqZYfdyRFRbueWHCVHOK4jfcFCpWzlOgxs5frjzunEtK29sZYdWdIFvCMON3420g/C4sfCju38ZQBXIlIBnj58CsxuoX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8904
Message-ID-Hash: MZC2VSX4D2WV6SONU7OIKS7L77RFG4RR
X-Message-ID-Hash: MZC2VSX4D2WV6SONU7OIKS7L77RFG4RR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MZC2VSX4D2WV6SONU7OIKS7L77RFG4RR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi Mark, Rob, Krzysztof
Cc Kochetkov

This is v2 patch-set which adds link-trigger-order to
Simple-Card / Audio-Graph-Card.

Link: https://lore.kernel.org/r/87v82ls82e.wl-kuninori.morimoto.gx@renesas.com

v1 -> v2
	- update git-log to indicate what does new property do
	- include new definition/header included into Doc patch

Kuninori Morimoto (5):
  ASoC: audio-graph-port: add link-trigger-order
  ASoC: simple-card-utils: add link-trigger-order support
  ASoC: simple-audio-card: add link-trigger-order support
  ASoC: audio-graph-card: add link-trigger-order support
  ASoC: audio-graph-card2: add link-trigger-order support

 .../bindings/sound/audio-graph-port.yaml      |  9 +++
 include/dt-bindings/sound/audio-graph.h       | 26 +++++++
 include/sound/simple_card_utils.h             |  4 ++
 sound/soc/generic/audio-graph-card.c          | 13 ++++
 sound/soc/generic/audio-graph-card2.c         | 13 ++++
 sound/soc/generic/simple-card-utils.c         | 71 +++++++++++++++++++
 sound/soc/generic/simple-card.c               | 10 +++
 7 files changed, 146 insertions(+)
 create mode 100644 include/dt-bindings/sound/audio-graph.h

-- 
2.43.0

