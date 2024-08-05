Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2269E9472AF
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Aug 2024 02:56:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 61B4F5173;
	Mon,  5 Aug 2024 02:53:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 61B4F5173
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722819243;
	bh=BF+AZguoCo7V+mfNfBSorDhXKpVTtVPWTnoPcT41ILI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=NSbtAiGAd8Ws65+E6rHK8BWxGDQoL+k44O56RTxrEBYjR31qqp0PAhYom8XGmE0fr
	 EHWehtu0tuiVYka8ZWQy3hXHk0hXppFuc/S4aKrCV91nz/a+S8XOeHe4IwYhJWsl0i
	 gR7rnZftaNhwTQwMpJnyg8kT7yuNEXGEDAy+jaMs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DF6FDF89AF2; Mon,  5 Aug 2024 02:40:35 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0B5C6F805B3;
	Mon,  5 Aug 2024 02:40:35 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 57B03F89A5A; Mon,  5 Aug 2024 02:40:20 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 06AD6F8988A
	for <alsa-devel@alsa-project.org>; Mon,  5 Aug 2024 02:40:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 06AD6F8988A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=B+eUyzHo
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ts7GP2Lj6hA3sbNu59PZ7hvMqEkEpt+DNlwPeWfxyFj5KoWdBaZt78Mi/oiVBiWyOSWKIe0cynxwJErZE7UXErDTarUwrRBbyfJfvf4BB6juJcXoiqYe3+esZaldnbXKZHH2SbTGL6be5TMP71PbUJI+OsSIBc8glmEYEcBvbK8YlFMIiCaWsxCCkbWpJ3IJKMIpugrNYMtKPpPad+m5KOzK6SgyES7JA+dq2UWYKkDX21R5XDJy5PQu8ksVve/nc2GUgGPsdkrre6NvRBbilSMi2mPiNSorpWUzaw3omUU1kLolRMdyARHrQ/h2HbLhIXgjXG0EAJnwTovyOCt2Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e7o6TiQnaMaRLBaT95lA/r0JnmPt6tWmU7DxJR+d8e0=;
 b=aBQaRxslZWv1kxKyj30WHMTJPJVEHqpEG6R3Wg0EEjzZOk+D1b34lTBwcxbVbj0NAvqc+QT9RTVpWNDl3l7r3RJuqNzSL1YPoeEOFGE+syAa72QynjNZ7BXKnva4D7OWJaG8OTcn5vKUPb8MUA0hTSWdoJ4Rbttu/gtYGMUZ+Li02eZI768c2uD/O5klVHqCibCh7E35mxeum99NENPw/gKhQ4+PdkhSrpHdnI8QxXxZl5RJVROxyNm6xbPIwp6sDkglpojA5iTbf0OTEMbjqKXhS9f/+lGQgiaDgiP34Xa2NxvKoU3ZAxO5ib6h5atgxo0o6i+lfWe8jF9RXKBQ5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e7o6TiQnaMaRLBaT95lA/r0JnmPt6tWmU7DxJR+d8e0=;
 b=B+eUyzHo8r9IlsKRDGfWGCrY+Ym6/q3zyxomksAv+Q9+o5AKc1FPCUl7o2EBgKDogzJdrIlUJ0Of4ZukAJEFVCuwJh4Tdpp76a6Um3kf7gEI9rCGa6B7vcr2k8JyNaIrd31GQRZPP3uE1gIzCfG4vBUZj2PHLSXJ+cCSYpP+1bI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSZPR01MB9459.jpnprd01.prod.outlook.com
 (2603:1096:604:1d0::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.25; Mon, 5 Aug
 2024 00:39:55 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7828.023; Mon, 5 Aug 2024
 00:39:55 +0000
Message-ID: <87sevjyf8l.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 058/113] ASoC: au1x: use snd_pcm_is_playback/capture()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Linux-ALSA <alsa-devel@alsa-project.org>
In-Reply-To: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
References: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 5 Aug 2024 00:39:55 +0000
X-ClientProxiedBy: TY2PR02CA0063.apcprd02.prod.outlook.com
 (2603:1096:404:e2::27) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSZPR01MB9459:EE_
X-MS-Office365-Filtering-Correlation-Id: e9ecd055-0ded-4b08-6948-08dcb4e72068
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?H7TiixdF9Q1PDysj3bRb5kjMM1gn6y8nX6H21LRKlTK8iFf8EJWndc17Id3q?=
 =?us-ascii?Q?VbWKS1txGcTMfrfOQowXBcb/02hSmmYltL+OJcQsNBAr8DMrtsR1aA6pvgqa?=
 =?us-ascii?Q?nzTRuXNYAWuvJHlerEVA4aPRNmWHG3glolvEqNjXCnt1UfzBO5ZieN5UDBZc?=
 =?us-ascii?Q?ndKi56m12FZqTGfHXSu9CWceAwWOAYvhixsozokIz4jY4Es4EEyPHUdoSfIA?=
 =?us-ascii?Q?ufFQAnBHxEAwbGyCvZlJ9gwV38Ci/adPYH1PnSawbpCk57xcCEpQeVWvEtnn?=
 =?us-ascii?Q?71ahkoHh9rr0lOVgJDk+mCxKOl2bVpOmNo80gfuBtFN4AtxfcQkCo2XAh646?=
 =?us-ascii?Q?9i5rP7Y/fIpL9PA0GRYjB+cuFmSsDKvMC5W98FhXYZA3eZipd3KqyCVcSjWX?=
 =?us-ascii?Q?9Fac2far+H1RCZ8tD8QFJQvXIbdJC7eQ6XaZDWGpSrmjYU6z/LD8lIyAhZHD?=
 =?us-ascii?Q?OEEHbhv+aoo4A7oTciK2UJgiKkhcm4ADHcPFT1OKZFT2X69F5AgYTaD6juY9?=
 =?us-ascii?Q?gWDAijM+ByIbXVRpQWtS8R+xY6Zx8NXR0DsRUGZkDi7i2e8YxFBupbQhV/g2?=
 =?us-ascii?Q?3VkJb+KkWNA9MDYcXFMDswhw0gBgEc/Avnf5gzZnOtO/AHYfSLV4eD/lukyO?=
 =?us-ascii?Q?NYkkPy45oCvvKhlflpWff4qmaZpNMWtcRi12urs5Niup9iZRczpLHZkdQEPI?=
 =?us-ascii?Q?gpbSm0elSbolfNnTmXbjLPo5+ggt3V1s2moCq3p82cVrAo3tInx0AQznufGE?=
 =?us-ascii?Q?cO8TK4PhniPrkGXygXtrt4H4eLNXR6/VGjWPD4pZYg1z30fayFyOgZzFXsye?=
 =?us-ascii?Q?rxQBedX/HhIzjry5RDXPALwfr6hie06u93cAblRUTSlFSvRHi/utsp6a5dXJ?=
 =?us-ascii?Q?AHxB6WdRufTlt7CEeuyiGU0q+8HpC0u93dAo8Zw0UHwvDWmjnoPda5g5MObD?=
 =?us-ascii?Q?ufzQhDknXiGygjAYzpBwKqTQ0PSwPGIsz1M3MS1YBvBonl+wFypB44W9MiB9?=
 =?us-ascii?Q?VWbYqoCC+4JPzZ604Qz+Nha+e3ZRODxiOQsrrEPlJfsQpFizYug/X1e4lAke?=
 =?us-ascii?Q?g0fdMM8EV9TMjRiUx8O2j7jRLAw6UNMb2h9/+L9KLYEb5OVly1DLp+ulMZg3?=
 =?us-ascii?Q?Uz/dHSAEj4dqqQ5lHyweVdjEyktcBEbdv2iSpB9l29VfzKZUg84lMgjmxiGz?=
 =?us-ascii?Q?Q02NNEnRPt2TZ8ms/uXyhcHCV+bA2jq7oBrgjJweyoD7LRDzlUViH8urpCKm?=
 =?us-ascii?Q?KvHQRHVwxWbK0c7PL6ooUCB7bs9t4RkFBFcsZJeWJXuOuF67ENVWoXJfbaVr?=
 =?us-ascii?Q?20W4eXhmcZ0jJJCvjGQpH5vl8j4YdyZRUJYljmOK11W9JQ+Iv/JkG9zDr6Uy?=
 =?us-ascii?Q?veeAxDbsPXjhJstBoTHdIQPRjqIvdZMuMfZTSGGiv0rHW5JZUA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?8C0tjgkLPqglJO3bV1/57eZvZMmQHVvBX6vcpVJu1dgCcMd8rVhR8CJQhCZN?=
 =?us-ascii?Q?u2KvNq59V6JsBgmPkbCbVT5uH1Qx+0koEQySk2UTrIboXC8MUsm8qmvxjzyl?=
 =?us-ascii?Q?+PkIf+HLPiKSFHLe742r0Lou54AjqTdNMaKKVsFJJt35wizF4/X+KVKyL+RU?=
 =?us-ascii?Q?96cmnG2Rvgmr+siGqhD7Kstp4jGAn62f14TXpoUg1ibXoQD+EJjZ0bdu/fw/?=
 =?us-ascii?Q?SpelAY3z0alzlZtWKtzbixPBex+XK1MYJEEnzvxqL7h1e2tl9sSBvAOQIRcn?=
 =?us-ascii?Q?mkNxau3cZ53kOwLtu8fk6wRMPEGw3H9WuD1l4muvDH4p6+ReD2DxS5uHQAaA?=
 =?us-ascii?Q?tZPD2r01maUChDfES3l0D5W+rIQ4brCeNGWCLh6dnCtcIkt7bZHpAQrXjqC0?=
 =?us-ascii?Q?yd1Tpl6m6EZCEbJBeDWgta0jdmMV2p4vuVpkWNj8xlxvPFB8bDosU70pkZAt?=
 =?us-ascii?Q?+njvlvpimG+FJh5Y4d+biqSsijmxKfisGWRxqDv/lmn9Opp2r7ulRY/+fOk9?=
 =?us-ascii?Q?A09FRaTYo6HhNr2WmK7vJPAJd1HjXxjiRzexdeAuCr7S3EicEtOcDD0bdqqa?=
 =?us-ascii?Q?w/XhhVGqdTkT/tgvFCVLuFwxRLi0wC4ryQWS/x2/cb3HXGF94ZOEAXbi4SP7?=
 =?us-ascii?Q?8PiNDBV5gNTaZrJCx3l1OSzwB3pho25UoU5G3azMqNYQGqZBrslQIe2LM8k1?=
 =?us-ascii?Q?2DJd5d464mBhNUW9SZoVu6qLVB9v1TLX5vmJwATZhreA+ReDIQNSMGcRkxAj?=
 =?us-ascii?Q?VRN9MavfzmTtJFWfR1cHeCNiIJ9+xcJfCO7xkKbhyVxTgs7IUjaol4ASsI1E?=
 =?us-ascii?Q?zi8gIAXWIGhDC8u8vFyIuvJ4SVdUudKH4NFRtkYXrcVVXGCYGc5c04yuOs9U?=
 =?us-ascii?Q?LT5jMlLq1XohLcHcwrf8mbWI7pTfrSBb3ZglFcKdrGsz+n8vqcE+LcgLzjdt?=
 =?us-ascii?Q?fhp54ACACQhKH/169DkLbwLhEfW55dIODwFr7XLZNkjrkGu+D4Xog8kXv9Zw?=
 =?us-ascii?Q?8M5/vBK07Ghf2PQdFDpSmcF/iW6LV378L/EEzXv6z/ekIKv/oQFoeKSEMZR1?=
 =?us-ascii?Q?NlcgsyRuJk9RFxID0tc+y1bNXlVqLFWyZ/yIBcEUrUeCpnu/0udJPaTQNLzn?=
 =?us-ascii?Q?1I2kKJch5OglnuyNjMwrSkxKFA0IG37JtO4g7q1wG2sDgnkkL6JqXDIucVDc?=
 =?us-ascii?Q?V8HFwOcgCHMatXj6xiqGlG/xuc2yz/P1qB7ruO+Ts22wS+n5PgaGxdi+Y5aT?=
 =?us-ascii?Q?MW+Xyw/ROP7YPH67FKUJgwoA3s+TUC+/42P8+YUn8QsQV8crp/ErVqfUH+14?=
 =?us-ascii?Q?S2irpx3TdnPwDb7a2zv+zV89V205M+RVnnUSrMUwb2asoNCm96gb3sYUO1r/?=
 =?us-ascii?Q?AIzVViHekpQ7XQ7Rfw7cG9QecVfI8eIkAHwHCS5n3e+GOI64jKGn8KQBUcRa?=
 =?us-ascii?Q?OLVuql+4XijP4Gv7gRb/qPE/8SHUJEw77cod0J/miFRuLF07w0UAVQWmYE5T?=
 =?us-ascii?Q?/hi3JfvN/vjVjEQcTjMHEa8hgCKDlHouUCXX1G60PwMGTbhIhI6vSx3517Gr?=
 =?us-ascii?Q?xV4lSxWWWcNDoquDyyp8DbgXcD7Z+7xm4ldDKS3ZrbkM/f4HcdMgeQDJZ4UT?=
 =?us-ascii?Q?+OOOF8q1+MF8HR99GvXnX7I=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 e9ecd055-0ded-4b08-6948-08dcb4e72068
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2024 00:39:55.4782
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 cTuyk2GDnxH/3ILek6EzTHOh8fpoeDgGDqoUAtvgYBe16qbtFWF4axh2njFS6YaPN5IVIOOVtnoedAEivrS1VfwdpAl4CFpwci++ezOh8weWhrbAQ6nXGdGtLdkggfYL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB9459
Message-ID-Hash: ISNYYJCMMTS2I2LA6V6QFYMPKZQK57WW
X-Message-ID-Hash: ISNYYJCMMTS2I2LA6V6QFYMPKZQK57WW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ISNYYJCMMTS2I2LA6V6QFYMPKZQK57WW/>
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
 sound/soc/au1x/dbdma2.c   |  4 ++--
 sound/soc/au1x/dma.c      |  2 +-
 sound/soc/au1x/psc-ac97.c | 10 +++++-----
 sound/soc/au1x/psc-i2s.c  |  8 ++++----
 4 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/sound/soc/au1x/dbdma2.c b/sound/soc/au1x/dbdma2.c
index ea01d6490cec0..307cfbc7f713f 100644
--- a/sound/soc/au1x/dbdma2.c
+++ b/sound/soc/au1x/dbdma2.c
@@ -158,7 +158,7 @@ static int au1x_pcm_dbdma_realloc(struct au1xpsc_audio_dmadata *pcd,
 
 	au1x_pcm_dbdma_free(pcd);
 
-	if (stype == SNDRV_PCM_STREAM_CAPTURE)
+	if (snd_pcm_is_capture(stype))
 		pcd->ddma_chan = au1xxx_dbdma_chan_alloc(pcd->ddma_id,
 					DSCR_CMD0_ALWAYS,
 					au1x_pcm_dmarx_cb, (void *)pcd);
@@ -235,7 +235,7 @@ static int au1xpsc_pcm_prepare(struct snd_soc_component *component,
 
 	au1xxx_dbdma_reset(pcd->ddma_chan);
 
-	if (substream->stream == SNDRV_PCM_STREAM_CAPTURE) {
+	if (snd_pcm_is_capture(substream)) {
 		au1x_pcm_queue_rx(pcd);
 		au1x_pcm_queue_rx(pcd);
 	} else {
diff --git a/sound/soc/au1x/dma.c b/sound/soc/au1x/dma.c
index d2fdebd8881bb..7a8ff759ab4b1 100644
--- a/sound/soc/au1x/dma.c
+++ b/sound/soc/au1x/dma.c
@@ -200,7 +200,7 @@ static int alchemy_pcm_open(struct snd_soc_component *component,
 		return -ENODEV;	/* whoa, has ordering changed? */
 
 	/* DMA setup */
-	name = (s == SNDRV_PCM_STREAM_PLAYBACK) ? "audio-tx" : "audio-rx";
+	name = snd_pcm_is_playback(s) ? "audio-tx" : "audio-rx";
 	ctx->stream[s].dma = request_au1000_dma(dmaids[s], name,
 					au1000_dma_interrupt, 0,
 					&ctx->stream[s]);
diff --git a/sound/soc/au1x/psc-ac97.c b/sound/soc/au1x/psc-ac97.c
index 1727eeb12b64e..62627ec731063 100644
--- a/sound/soc/au1x/psc-ac97.c
+++ b/sound/soc/au1x/psc-ac97.c
@@ -37,14 +37,14 @@
 	(SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3BE)
 
 #define AC97PCR_START(stype)	\
-	((stype) == SNDRV_PCM_STREAM_PLAYBACK ? PSC_AC97PCR_TS : PSC_AC97PCR_RS)
+	(snd_pcm_is_playback(stype) ? PSC_AC97PCR_TS : PSC_AC97PCR_RS)
 #define AC97PCR_STOP(stype)	\
-	((stype) == SNDRV_PCM_STREAM_PLAYBACK ? PSC_AC97PCR_TP : PSC_AC97PCR_RP)
+	(snd_pcm_is_playback(stype) ? PSC_AC97PCR_TP : PSC_AC97PCR_RP)
 #define AC97PCR_CLRFIFO(stype)	\
-	((stype) == SNDRV_PCM_STREAM_PLAYBACK ? PSC_AC97PCR_TC : PSC_AC97PCR_RC)
+	(snd_pcm_is_playback(stype) ? PSC_AC97PCR_TC : PSC_AC97PCR_RC)
 
 #define AC97STAT_BUSY(stype)	\
-	((stype) == SNDRV_PCM_STREAM_PLAYBACK ? PSC_AC97STAT_TB : PSC_AC97STAT_RB)
+	(snd_pcm_is_playback(stype) ? PSC_AC97STAT_TB : PSC_AC97STAT_RB)
 
 /* instance data. There can be only one, MacLeod!!!! */
 static struct au1xpsc_audio_data *au1xpsc_ac97_workdata;
@@ -230,7 +230,7 @@ static int au1xpsc_ac97_hw_params(struct snd_pcm_substream *substream,
 		r |= PSC_AC97CFG_SET_LEN(params->msbits);
 
 		/* channels: enable slots for front L/R channel */
-		if (stype == SNDRV_PCM_STREAM_PLAYBACK) {
+		if (snd_pcm_is_playback(stype)) {
 			r &= ~PSC_AC97CFG_TXSLOT_MASK;
 			r |= PSC_AC97CFG_TXSLOT_ENA(3);
 			r |= PSC_AC97CFG_TXSLOT_ENA(4);
diff --git a/sound/soc/au1x/psc-i2s.c b/sound/soc/au1x/psc-i2s.c
index 52734dec82472..bd4a75fec9822 100644
--- a/sound/soc/au1x/psc-i2s.c
+++ b/sound/soc/au1x/psc-i2s.c
@@ -39,13 +39,13 @@
 	(SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S24_LE)
 
 #define I2SSTAT_BUSY(stype)	\
-	((stype) == SNDRV_PCM_STREAM_PLAYBACK ? PSC_I2SSTAT_TB : PSC_I2SSTAT_RB)
+	(snd_pcm_is_playback(stype) ? PSC_I2SSTAT_TB : PSC_I2SSTAT_RB)
 #define I2SPCR_START(stype)	\
-	((stype) == SNDRV_PCM_STREAM_PLAYBACK ? PSC_I2SPCR_TS : PSC_I2SPCR_RS)
+	(snd_pcm_is_playback(stype) ? PSC_I2SPCR_TS : PSC_I2SPCR_RS)
 #define I2SPCR_STOP(stype)	\
-	((stype) == SNDRV_PCM_STREAM_PLAYBACK ? PSC_I2SPCR_TP : PSC_I2SPCR_RP)
+	(snd_pcm_is_playback(stype) ? PSC_I2SPCR_TP : PSC_I2SPCR_RP)
 #define I2SPCR_CLRFIFO(stype)	\
-	((stype) == SNDRV_PCM_STREAM_PLAYBACK ? PSC_I2SPCR_TC : PSC_I2SPCR_RC)
+	(snd_pcm_is_playback(stype) ? PSC_I2SPCR_TC : PSC_I2SPCR_RC)
 
 
 static int au1xpsc_i2s_set_fmt(struct snd_soc_dai *cpu_dai,
-- 
2.43.0

