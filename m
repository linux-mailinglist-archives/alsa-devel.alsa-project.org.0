Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BA9C3947290
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Aug 2024 02:48:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A39CF3F57;
	Mon,  5 Aug 2024 02:46:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A39CF3F57
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722818824;
	bh=1yEQuyHIzoT2eoAhdru3hXRTCu2g+dQM5Ell5eKAl8c=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=bBe4jihkOfiNDQanMyPxH6NjE94aMCJxKtwW2igeesaRJNNAf4aqKFJ34sNViCGf4
	 JFq5RgWUZE/xfMW/bNRXVSXP4v6282atvSy9fYwbELz5HOAVbZRH36+jB55wSsyltO
	 oA7NMUW0CjwXIfW5Ui8fZz46yqFJezsilAwfDjvQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 35BFCF897B2; Mon,  5 Aug 2024 02:39:36 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 067EBF898C2;
	Mon,  5 Aug 2024 02:39:36 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 84732F802DB; Mon,  5 Aug 2024 02:38:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazlp170100001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c405::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3880AF800B0
	for <alsa-devel@alsa-project.org>; Mon,  5 Aug 2024 02:37:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3880AF800B0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=DziOK/V2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OlHVtYHJ0Zobg9p4gdtfLsYQidHmRS19HZvDcaiAKnLRNnkB5lUkN7X8dfsD4eZ4xwtJM8PU41CG8PIKSoEeKx7fQmeHqFmnslfFJmn4ahW+Ewwuc80bsUUm6bMHnqgmSrVP295eKVoOZDhU2japg0AapUKrFmjnUCZjxRmVYKzdluyhCqpmMPqvjJabztsIpd2IsglW4x0SPFPfCrJWcul3EZ5Fk6e4ZBQ/ldYwa/Mxjry5Mux3RSk3/gDYVNawvHbGbRcrstgD1c/bobZLBQ/Cfg4hTs0I/SkrCYa8yJZQiJ3M4Hzuo9eMESM/U0vAVGcM0Eu4bCjUfz5T/9iyAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=od4JF1EE18ALyLXED/p+4+5yxyPsJ4a+WL1HygEqqrA=;
 b=vCNxHK2GO7PhZxKYhyBaVh2/f010fMAsoj8Ut835KtzZEKBQLMJCiHv8/yRc5RAcF8gTVDA1pIEAiyKDUs2lJy4C7IIA2n3ftB06vPSKR91hDbExN8Afbqo7wx5lULqbYLLOwZ2Tf4CUU4IBvRyRICCKV7uX+WoBNFtn0x9JJi49niN4iVhr60AGbZLK4VZR/zvMRgLlpJz2jqV9Qy5IqHB/lSCSSGsulELLK1i1Ktkce0QZ50pMiLxTyNztfs1gM87R8qm6rEaBArjCdN71TrH5UVgEd10hdDEZp2jGXBGGLLpQNhI6DWEnAqLrmHKrbR7WsjNGr1CBzpIM93w+Gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=od4JF1EE18ALyLXED/p+4+5yxyPsJ4a+WL1HygEqqrA=;
 b=DziOK/V2niv9pesDO7qFoNTzzkCZEAmVxSv8mSF9pk3AsB7f6l9AVZY+44LUMmpJ3+ZahuaMO+f7A0+MgZC2wU2x1IfbXIwb5sjlIZ+joe5wTHbVjUAZ9CW3tLt/i7k5DuH+c6Gm3N54ROp56JE/poDlEb1oFFVg8rsZmKJ+tMs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB9685.jpnprd01.prod.outlook.com
 (2603:1096:400:221::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.25; Mon, 5 Aug
 2024 00:37:55 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7828.023; Mon, 5 Aug 2024
 00:37:55 +0000
Message-ID: <87plqnztwd.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 035/113] ALSA: firewire: motu: use
 snd_pcm_is_playback/capture()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Linux-ALSA <alsa-devel@alsa-project.org>
In-Reply-To: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
References: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 5 Aug 2024 00:37:54 +0000
X-ClientProxiedBy: TYAPR01CA0053.jpnprd01.prod.outlook.com
 (2603:1096:404:2b::17) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB9685:EE_
X-MS-Office365-Filtering-Correlation-Id: b5af83df-f2d3-4b14-4ef8-08dcb4e6d893
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|1800799024|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?gujUsG68Z3GuAwiFkrZnL/mHyvXgojAcIP5/Idid+TxPjeqCn4nKX05+/Au5?=
 =?us-ascii?Q?hdstwHEJ1j2oqaxKbtt67xQuMqjSpn7LPj8Z5k7W0qQL/iKvROu/5f5wyZz+?=
 =?us-ascii?Q?jt4JkowNB/kCCt2hGyGZ0MHOmBLUiwtofmc6AqVygaacRDQ7pHcgSqQRUaUh?=
 =?us-ascii?Q?GX8VVT7o0baCpbvr0OXeA8fDwMPYoWcHH2qU5k7I0NIylAATJf7p8aY6cBOR?=
 =?us-ascii?Q?7Q8H6tLMYO4dIj0MB0pQWN4KCQoz3cgCkFkW7whoTo3q+fNregtmbMuhq/Mq?=
 =?us-ascii?Q?7j6hFB/hRGdTXoI1wb9ARnyRMcKHZRSuR0sYBNpks+keQZfmT7VmpulA819A?=
 =?us-ascii?Q?Df1TAGNSAUtKMaBTos2W4C7yqttt+X4KugrLugRZ/5/Ng4O8eh3FmV387Ysk?=
 =?us-ascii?Q?2cjEtYwh7Wf8/zW7CYPKUsqiFgFG/MThXLDBwhqky0SUj08S+ZRmWvYCez+R?=
 =?us-ascii?Q?caFdoq443cQKvFc1qJ34/2cfR5i7lOYRJhACDYD8qvXehUR1MTX8y6m4Yd/l?=
 =?us-ascii?Q?O7BH4CR4kSMHW9znen70Ll/M7hFy640lHiLDeI7Oy0xv+uT6BgfVBXeG//RI?=
 =?us-ascii?Q?BiODY0EBFdHsT2XWHydd/zvZtVfHCxJVpNZAipj0iTLigJK9Gv402wIwckRD?=
 =?us-ascii?Q?KUJBQDz+i0Bez69eGYhmyr9enEagYgbQX2GOI70HMTTfV8hFXbg1J09Z9Z6/?=
 =?us-ascii?Q?JAKwCrosgzxOlSRY04RQzT5RQiw7OD+1QQqPJQ0NBj3KRtP4NVIkvsbbXmDE?=
 =?us-ascii?Q?s11ncEr/gEvHY1j4tPKiGiiFHssvmuWD0+56FaJS86nGCFU3sClMHXjMZRfu?=
 =?us-ascii?Q?7zdclKDZYlelQFrRO+stRUr/xbWSrZiDlgrG6Ww0h1wf4ze1hGKQZMqGeLjK?=
 =?us-ascii?Q?7TLTPVcM/JWnxMVtc4d4QpwoJ/ALtGi+VBGYs+g550usuTZeLlMlFMpD4nAF?=
 =?us-ascii?Q?UvfIB2lABBteLyWeXKbKroHybICqKCBcivlzZxpNjq/ad+diAdh6eEiSgyBL?=
 =?us-ascii?Q?ijHrxTTfGxc8T7nBD8/EcxW0OdEagkXFzU2HyN9CH6b9hTE4yHT9Y+5t/Yaz?=
 =?us-ascii?Q?3raaBwy0dvwJcpdFFRXlCbmdhLIoizyiFwuJrPeMWBt72pARgnCfitskAWT3?=
 =?us-ascii?Q?bqaOud5qp1TYeOReXTR/izhgFLQTRNcWSfa2yxQHHDDsSzbwamDNqgoPhbGN?=
 =?us-ascii?Q?SwMzTzffkLcUapTBsY0jBYTqKCzhyTpSjfbLJKifPC3dNbQ+/RKv170f4w0r?=
 =?us-ascii?Q?kWl3DJM1j+DMavCX6/8cS04qDdyCpYnSgHmcr2Gi8Qa7ihp8/Nu9WMWA1cdf?=
 =?us-ascii?Q?Q1VsfdSLeaJjZ7KR62Nsghf3WmPypCQQTPc/tQPoJpECzuWizunEsPwMbUet?=
 =?us-ascii?Q?13wUjp7UP5x79F9RJzwN8N4KWv45QXPatQ+JK1BXs5m1dj8Lcg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?wxve3N1lrD4Nlr19LGvcxifevHMwNQStD5QMZEuiVEeZPEjSSVN6NAWIKN02?=
 =?us-ascii?Q?rRsfdirC73jWtIPnsWdTTDEvEnI6G2KI5+sfdJ8CPm2aY32gCmTniHIQbL+d?=
 =?us-ascii?Q?m8ixdo5jBR/KhlWUiojojL1r+owlPJJp2kU530REhLFDLX2+wUenHPxkDNz8?=
 =?us-ascii?Q?RXDvbP8IdXckt/YEcN5prpx7CKL3m5dMDfj0CK8CqeJZxUT88BtT+JNsgLd8?=
 =?us-ascii?Q?adEtukkDRl6gjVVDDNTdjfkB92pr4tn8XH1JfQSGU5NqAHceddG5l1ILN3eG?=
 =?us-ascii?Q?pzcSo/kfJC13g8pc3kHTwzecaQIlScfabteEcQHdr6b5gcn0v7eBnSQyGYdW?=
 =?us-ascii?Q?uMm/lbIXLt15KKbrpPCwH4ovRZQsXsujc53kZzOCbPPrjiAfvEiQf3Yij/w7?=
 =?us-ascii?Q?k7hxDkCth/YKQCEYtzkFBSV+CJTsrY4UYzrfLdCSHXxz4DtGX6ASm0mJGgCJ?=
 =?us-ascii?Q?fXRzZXav7FdbuYmZdGRMjPd5SiqjZkSODdWJzb19VjrldjChUpG2oZXa3ReB?=
 =?us-ascii?Q?3DxxtLu8Rn6ovCbpjQlP8j4uba0+vcznN19Atc/T8/6v0FRNhPLaavxbVgBf?=
 =?us-ascii?Q?yyc4OLyfee18Xj+EOuqyXsQMIQmdire7RhHzEgH/7ktAKA3nc8YroRN9IDHQ?=
 =?us-ascii?Q?2gaD0dDiBtkhtAa8Ppcg9g/+Hr9GSmp0aJHexDYdjtRbuepgNxAftspQWFWR?=
 =?us-ascii?Q?JEspgYyLSeyk9YOGDf01LjuAFMZUK7QWWRvQbCN2yMlSOL88Lo6UiExxLOYr?=
 =?us-ascii?Q?+L6ntUKgyWyjmv5dgxoL1+Pb/3zuPcS1rj36WlJs4utprN3yRTydNT6+Rs/e?=
 =?us-ascii?Q?DEhgV3VPRFXGzFFDvZmbf8Y0/0sEQGMmCcNrCPuJ8pjoy3xBAs9WztLq6qj9?=
 =?us-ascii?Q?fbwV5UZER1U8H5RfrqjRqLwQKvx9o+Dgf31cQ2Ge9AI4pXTLpkx19cPFV3gr?=
 =?us-ascii?Q?uGQGdK3Hkvl30quvU4PKrJfnNG2INpeMoqdDYP7bRrRn0FRChWOuxaBK2GHA?=
 =?us-ascii?Q?ouwelGuJdgvV0bE0RxCd0yU/4XWiHHFwHhcgSJSzpgnFScVXqvrv405zMh/U?=
 =?us-ascii?Q?eljFYFcxkGf9nZLsbBywpDi/9cw4pLaWAiHlfRarzQn0YG4+EMeQjIHQq+qW?=
 =?us-ascii?Q?+9jj5df3pKBFzD/5iy4+H/aO/HIoXMlZabSVZtHN1llPi4V6hNLdAfTLdhqy?=
 =?us-ascii?Q?TpGDJ6HBQfrhmxFdU/3LnyFXmos1W1SXt1R3c+qk62Isvml3KBaVjOXVfEs4?=
 =?us-ascii?Q?Dd0cA3KYppkthwx0N+wqc0K6sWb9kUjB0lyj8+XTw6sQcx1HB+2YBulptUZE?=
 =?us-ascii?Q?ElXIpczja0UpFHtmWprwzDqTiU6z1o1LV8i7st1yHjYfwUxgfDMPf34cnXLE?=
 =?us-ascii?Q?aZWUXOHcV0u5NroiOarzmrxrEQd/aeRpMwW+nSv9I+QjPJ0b7k6fyQiXAMYh?=
 =?us-ascii?Q?wg4XFNsAeo3BUwOpqlPDcKnnGQ9AtjUX2DuZQr8SEmgTTEVJa2r1tT0MNqeM?=
 =?us-ascii?Q?yzJuLSl+WPVmRskolb1kbx9m5hMIU4wwRjZRwtr4JpFs3I7Dt7CdQ5HOUxkW?=
 =?us-ascii?Q?zjxl/DHrIY7pXrmqTDLWYCeVg3CvvImWJsnAZwthmioxa4fKRabhGrzmPJ4K?=
 =?us-ascii?Q?whkuT+44MwgLkBkSyM0H9io=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 b5af83df-f2d3-4b14-4ef8-08dcb4e6d893
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2024 00:37:54.9494
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 u0g0ZEdnN2BUoIavW7FSOMMKN+76Ipt/pG10ygmM44MCF+q2dc14u6SHlK66+YURzHKFLgF7SEql3lZGxmj8MxEiQYuGSn4y87tDNx03hFPOj4Bj3e5iS0wS03fqdFUU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9685
Message-ID-Hash: 26O4DSZNZYRG6NLU66CK3XHIOT6RJGJO
X-Message-ID-Hash: 26O4DSZNZYRG6NLU66CK3XHIOT6RJGJO
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/26O4DSZNZYRG6NLU66CK3XHIOT6RJGJO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

We can use snd_pcm_is_playback/capture(). Let's use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/firewire/motu/motu-pcm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/firewire/motu/motu-pcm.c b/sound/firewire/motu/motu-pcm.c
index d410c2efbde57..411d2b3dccbb8 100644
--- a/sound/firewire/motu/motu-pcm.c
+++ b/sound/firewire/motu/motu-pcm.c
@@ -101,7 +101,7 @@ static int init_hw_info(struct snd_motu *motu,
 	struct snd_motu_packet_format *formats;
 	int err;
 
-	if (substream->stream == SNDRV_PCM_STREAM_CAPTURE) {
+	if (snd_pcm_is_capture(substream)) {
 		hw->formats = SNDRV_PCM_FMTBIT_S32;
 		stream = &motu->tx_stream;
 		formats = &motu->tx_packet_formats;
-- 
2.43.0

