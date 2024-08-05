Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 72C4C947284
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Aug 2024 02:45:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BB05E4C4E;
	Mon,  5 Aug 2024 02:44:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BB05E4C4E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722818688;
	bh=kD5D+JYDLwjUBsmQyZ7K66wTaqtvl3YT1KHXkpIP6S4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=gfVlZ+PoSAamv1u+chpKX6+d92VenLwraE387EiNTsawp5CSN1kaRJCS0OBjeK4X8
	 6VrMQgCfMUm260npbp71ga81CVb1GI95cyIHo4MTzkO8DrBBrrGjG5phiz+MdeFhfn
	 2yFkbPNxcybRFdE0TvLTTaPIQv6WjiQiG2mVrjkU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4F741F896AA; Mon,  5 Aug 2024 02:39:08 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 10FAEF89612;
	Mon,  5 Aug 2024 02:39:08 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D63AAF802DB; Mon,  5 Aug 2024 02:36:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from TYVP286CU001.outbound.protection.outlook.com
 (mail-japaneastazlp170110002.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c405::2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 82F5AF800B0
	for <alsa-devel@alsa-project.org>; Mon,  5 Aug 2024 02:35:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 82F5AF800B0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=AMVYfrsU
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K5E+5sFZdzhLVrPeGIoceXWmkWme2QUZoJJ5WpPRXZQ9TDwzMr+3rpVJULU96IlLFFA7Vgu8UUFSQ3dorqHukwKpfyKoca4TJz4d/ItCCLIxYXfzqqVn2kE/UxYL7vdu+sBZPPpfxG7Vsed61//ajCOJ7JLD2S9rBiiu7tHLV1vEYM0RDDF36xW//vSLlfyxyFTwV5JraQqG44lTvT+4TC9zL0PyjTu7PUsWorGJ5nlWlhDWMHv2pkWYvoCoU2CQOunS83mru4YbuLoBjCEeKKKFL0PgeJkRasHWt9VERzriO9vbCF15Xk8V6rKTLpn1R9ClIygkZomOBal4KvFCGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+2gg95VKISkFMzk2asYqs52WMb3/zFHpKRS+Gupqwnw=;
 b=Vw6Nf0hW1deFWj/Bc1A5naqzGAb8Kmw2XULUefQAkRzY2ueBl1hrK2j45nTPW4s2gviR/AExb6i3uxc5KMLy7WggSyay815xMNCFOIjpL8e3Ybp+7meSZ+t2pSyLgQvP9hY6aL8RTZ2JAIj+fZj+KMJun0C7BQs9p6bL8TzGMHzfxjzdEIAKG04t0vWs+rMwHh4XdkeCYauWXyH5pNwKKHenGdxI/kWzjQtQP0dRr7HXCQHU0dOG/BqxB47kGt/zbKHi+NOf0AlI9BTzMYId8aAOSp37albBdAtMFaMb+DTDgLoz0eJLw2qFDoSwEUYZhn/UM/hYw3B6guUj425KXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+2gg95VKISkFMzk2asYqs52WMb3/zFHpKRS+Gupqwnw=;
 b=AMVYfrsU3Ng8/zFqz2a73tGYNxoRhAdpKEPJG3IeLQ+LRokbeJqCVkJymaWvGEJcE9HsE296tHXF+ZeqgZpTUNP6Us9BD9elyVaH3lr4wNc1B3cc/UCpjUKFjy6+xOnRcy9iw8m81uSJvQHlhJULbF+OexG7QNMAcGNmrdQmGBI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB6318.jpnprd01.prod.outlook.com
 (2603:1096:400:7a::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.25; Mon, 5 Aug
 2024 00:35:56 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7828.023; Mon, 5 Aug 2024
 00:35:56 +0000
Message-ID: <87frrj24d0.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 017/113] ALSA: pci: pcxhr: use snd_pcm_is_playback/capture()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Linux-ALSA <alsa-devel@alsa-project.org>
In-Reply-To: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
References: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 5 Aug 2024 00:35:56 +0000
X-ClientProxiedBy: TYBP286CA0005.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:404:ce::17) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB6318:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d9f9e1f-0f5e-4961-98ee-08dcb4e691ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?73QCax6oPPwzYNiaQX0uFUT+dRJUhetaDATPWv8Yjmvbt5u6aDj2zhJrlhPC?=
 =?us-ascii?Q?rfLzuN86XB19AbUMXJRxkdMQXW9yF8d9WkjTyQ9rgI3ewNkFmoXJgFMo+eR5?=
 =?us-ascii?Q?LNMlcE6SQSejxx0hCuQ6KaM+ChG8GAvyiCj/lln95wpFFNbPrjv2CL5LT3Sw?=
 =?us-ascii?Q?d5BDfnlA0KbxTC8DrnB3zYqR2GU/0R7ssFFc7pml4VwwDHsZI6GJHxpcbTjK?=
 =?us-ascii?Q?WSQPnncPocc8aNXnVgk13Fu/+4bgoRlds0WKZaquSi0jwow1TbY8Czxwvi6G?=
 =?us-ascii?Q?hyVUzby6pIuS9XGkAfYzx1kJ2cFx2auXWb1/OiF60nGHCAVnq+efOTZN9S9Z?=
 =?us-ascii?Q?DFlfSt8zXnSTP1MEVWJGxuGIvudVkxKlkI8B/lk0jOS1u1nfIKkwBUl5gHdF?=
 =?us-ascii?Q?RaX5ywI+wrlWC6SNyIUfDcnEMtUUYXA+AZqOjy6XORxICy8qKIuRRFRMz4Cx?=
 =?us-ascii?Q?ByyKrArVFW1TXsy2ss61CYS7mYSlqj2TUnfKvO/2qa9dm3erkeILr9ZBr723?=
 =?us-ascii?Q?VbOdTId5aF2j85jMLIQAxCXW22h3G8Ls7PmMC6sc0Jd2II2ZVg3sk4IJTzWR?=
 =?us-ascii?Q?hSx4DlGr5F/VCG39t8wlsrYxiOL9LKwu6UQdDCCn1QaaVkx5pcDF6E8p9FBv?=
 =?us-ascii?Q?aTggC1AavPHfQc4+4UdWkOmb8MFMY+FovMTFPvvZKL40QYY/t1/YrhZ1Iaoh?=
 =?us-ascii?Q?tQHRZCkjYbVxf968C7jLLNIinhk7q8TREUHGM6me63/RjSW3D5pdTWIrDALd?=
 =?us-ascii?Q?6g25oL/yKVxspPU0hUR8V28MVAUcm0j5h354mw8rLY9+C4/4+QjXyLa9I+2/?=
 =?us-ascii?Q?Q7LDgFEnQw7rOnp/bLy2HlqSgiL0u7GbPgIFwxXefIMTlwaqqIdfLtXAfpIK?=
 =?us-ascii?Q?7BeT7SBadRAmNHHJsjjzfazLTb3klgzOLifoaWTWg1vDWWq2DOhzOmvzYpeZ?=
 =?us-ascii?Q?5YJtohcyzj/+Uc4snZZusxYTmqNrAAv60LZRm6Jbkt/TGZB7HYB2opgOqux4?=
 =?us-ascii?Q?ob1R5l6rtotWZzSwcOceKEoqDvbmoR26k8b2mFi0uN/vlTc8vqBvuiNqTvz2?=
 =?us-ascii?Q?ETkmICY/zLrQeDDLIW2Z5HMxrP5Zwb96jK1Ol4RyamVAzpG6HMPtj2HUwKpL?=
 =?us-ascii?Q?O2/+f01lEv+pY/8sz1RLlp/jc/GnJwnNHufHJz7K75EVMlPWiwbMXFl75kax?=
 =?us-ascii?Q?GWNGiBWuAbivZsyqbTdVbb18OR1HNrPMAP+Hq7ASbGl5OmdtZYIZBOV4VSE2?=
 =?us-ascii?Q?2Gc7zG7AGNz/6D2xTdPeDTfoINy8DepSrYEAlAkX5m9A98niyaGpXxcDqym3?=
 =?us-ascii?Q?OZ2bu1cn3RjUJkN8HJSCfzidO6IC9gU0h6JLmnLd7+EXXq8uf1VCXw2ViuCG?=
 =?us-ascii?Q?rnYwbi9UEDu5ZVoJjiJdvY7Umt4PNWAU2T1YSBHB9M0sBqdZLw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?lccAk/del/W2eaWasSTl69e3JdX7dwJmUWSIL7Lfrtr0zOXEuFJwO1Fjre8X?=
 =?us-ascii?Q?tHjvqS/84smApIRY4by4icizw7qbF7IIY4hPWvTYPQMaHB7BOS1GnqFQ9D3T?=
 =?us-ascii?Q?3be5O1nr2WQNbZVyz+EwpwTCCcVcE0UENOiJWI/0cpLU3AD296W7beWec32x?=
 =?us-ascii?Q?RKiHHYRsm/U/7D/CX+jX/4j0t79uqp66f82glVu6OWzaeQP41IhADEyRhT5j?=
 =?us-ascii?Q?gR6EKj1vwuM6KjnQ7AWRWs/xK+pEMsniDCN/Va3yzvZFRakkFUIOEnqyg0np?=
 =?us-ascii?Q?vvIsJGE9xxfblFu1UkDzE6EJgA0BobpiuOLbhL7hMLyInDHLHLUDU6ec1wpJ?=
 =?us-ascii?Q?+wa/nJaC5lazzPeqeCi9U/Z/5O8PyXI+vDg/wnKi2r/36pR9Tc/Gqge915ZT?=
 =?us-ascii?Q?yWd9Ma6SfH1Ayss9BdhN8VpiuXrI8QtXLUy3nTeu+gthz26Wv/vM4Ps4kaw0?=
 =?us-ascii?Q?YpiPUCMm+xo8aBI41DTMA5u6WmN6puUTzceDmcwVe/idjXUMjnc3aTE01g2D?=
 =?us-ascii?Q?P4Kp26Vy9klYwnvn+DZI/a8JV8bKJ8k91Dp+aIV4q8sZ6D9yg1XZ848enjU4?=
 =?us-ascii?Q?qGHGQl7PkkwSuJQTLe98pYvfSuLPaX5B9422KPraYpUsnCCuk8N3nISVwepD?=
 =?us-ascii?Q?WKMhv+5aqhJ/ys/Wb8v+mFsIzEb8CKe6bdJ5vfkgLxhqks6ww2kIOA06U/Qh?=
 =?us-ascii?Q?OZJVoVII2rlLIVwptFYopkhzDD35/FD8k86hHuQplOkMEdJ/q0M9LeenCEnw?=
 =?us-ascii?Q?7WgcsIsAuQw/yTV/X0IcPrLlWyMgFfuyPM3FWZk3MuEU4Bnkrgi+IdKqA7bq?=
 =?us-ascii?Q?TxXH3m/Dw1ZirpcZdZJxAWNTeqf+Wta2crIgu8OtXfomUBJf76wUKDzJuD9W?=
 =?us-ascii?Q?Qj+zeh8tiGz3vszkpbhuSru9bEKfS3LmDsKeSKgOCiWmwOj0daobyV/Qui+9?=
 =?us-ascii?Q?2uOEgkC+Tr/p4jjKwOrXK+ZHDsq3Hn0BGBKkpuyAF1GDEiWozuIN2GB6gdte?=
 =?us-ascii?Q?lGvrztutJsOc2lHK7g48tFMIwxa8sBFVcZbbCMxtr8387anUP0bpOQmEG9gj?=
 =?us-ascii?Q?x2BmgUx6X5EeAgh0a1qeKbKyizJM0pI7IFRWrNdENLJuH+G1dqLCnyV0ToO1?=
 =?us-ascii?Q?rj4omQiFTtx56wTk1Dlkq/m0Qrv1FykYcl6gg6Jm6u3G8RZIxCF7LLZpDyJV?=
 =?us-ascii?Q?mq+3kUMNn10YahHKwSZw40lelekIWQ3xD+LsufsJmBZm+03+u7mMcab1bL+x?=
 =?us-ascii?Q?1LsSM2WCjwHDJcsquNEQikKceLRk/feODDJVn9pyqSLALHo82FTwz58ZEjvR?=
 =?us-ascii?Q?4V+eUbIQZGoMuheyUB9gXL+kWUzuQSuvkDhkVLU2VG+W1/z3kbUxp2yUV7ca?=
 =?us-ascii?Q?8DH9vx4TMVTOvHHrVuknOsxur0WBXhR8R4KFtUHWsohYr51gQBE4sDbGczwU?=
 =?us-ascii?Q?cIlsUr7QKsq/ijQHcFsU6s8QrTiECVjFlvXY+taQKe4nCSXN9gD19uBGzkng?=
 =?us-ascii?Q?ocqqZoRxOQ2m/Z91l8UIWqRZSJTtpby8Ac4fv84Zd3ps88SdZkGgHm3a9rlt?=
 =?us-ascii?Q?HvxGYt08Zbkz52CdtSZaxAZEeVyDNBDHGU6/hxDBQupyLlZ0cE8SeqqG9S+t?=
 =?us-ascii?Q?I4kn1AMfhUrkCseGGOmccyI=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 4d9f9e1f-0f5e-4961-98ee-08dcb4e691ce
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2024 00:35:56.2336
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 JIgjmFK7dOCoSN+AkvrgTkwuIEYz84zfgOYIhA3Ph1LtzHMWzR0OXe+r/qnWmYrRvv0GnVR45s9a7KGXwy70eHUWIG2z03Wcml9V951x64jWemFOJEaP5ayPW0UY3dIU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6318
Message-ID-Hash: MJRGKYAJU6VNLOVHL5Z46EMRJQLNFK7O
X-Message-ID-Hash: MJRGKYAJU6VNLOVHL5Z46EMRJQLNFK7O
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MJRGKYAJU6VNLOVHL5Z46EMRJQLNFK7O/>
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
 sound/pci/pcxhr/pcxhr.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/pci/pcxhr/pcxhr.c b/sound/pci/pcxhr/pcxhr.c
index 242bd7e04b3e1..2de8ccb33d17e 100644
--- a/sound/pci/pcxhr/pcxhr.c
+++ b/sound/pci/pcxhr/pcxhr.c
@@ -626,7 +626,7 @@ static int pcxhr_update_r_buffer(struct pcxhr_stream *stream)
 	struct snd_pcm_substream *subs = stream->substream;
 	struct snd_pcxhr *chip = snd_pcm_substream_chip(subs);
 
-	is_capture = (subs->stream == SNDRV_PCM_STREAM_CAPTURE);
+	is_capture = snd_pcm_is_capture(subs);
 	stream_num = is_capture ? 0 : subs->number;
 
 	dev_dbg(chip->card->dev,
@@ -995,7 +995,7 @@ static int pcxhr_open(struct snd_pcm_substream *subs)
 	/* copy the struct snd_pcm_hardware struct */
 	runtime->hw = pcxhr_caps;
 
-	if( subs->stream == SNDRV_PCM_STREAM_PLAYBACK ) {
+	if(snd_pcm_is_playback(subs)) {
 		dev_dbg(chip->card->dev, "%s playback chip%d subs%d\n",
 			    __func__, chip->chip_idx, subs->number);
 		stream = &chip->playback_stream[subs->number];
-- 
2.43.0

