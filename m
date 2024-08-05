Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B238947285
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Aug 2024 02:46:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 123164BA4;
	Mon,  5 Aug 2024 02:44:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 123164BA4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722818704;
	bh=Ovlt5L9oONm6lcpKVxuxML7k8JmtDy2KlGuO0/YvIic=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=fQ2bbqh45IQrnuIGxMY30gi4jjQSLZW39ClNTXS2je/9oX/syKy5SsNikw+leJDn4
	 Hn01zdgWs/I//mb+iJfVGQ1EnGIpo8oc/qvmDX+nOpvHhXuzmhqC6QvQIAvWRAc2cj
	 xHE174qv4lW/Z9z9QcLoLDW18wD8km48oIDXORdc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 52F0BF8972B; Mon,  5 Aug 2024 02:39:21 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A2D52F89776;
	Mon,  5 Aug 2024 02:39:20 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7AA7CF802DB; Mon,  5 Aug 2024 02:36:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazlp170100001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c406::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 358D0F800BF
	for <alsa-devel@alsa-project.org>; Mon,  5 Aug 2024 02:36:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 358D0F800BF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=myFiTyy/
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S51U7uwx3ZgicY3981iJS19AiYKmaMmnK8v1HF6w9WiDNq9cUIFLYiQxgNrX62g8iuVQWOKV5+5OVD5D27fFzgyQFQcxMkhanTFaua25I0PtyJ/k/XxhSxnjs83aMNJQA1nArUsbjDS/XxnoNxQTnaoGQVi/wavozbFqqZHh0hzFN9JP8ien6xy38rOuSF3jhKFGQci1wa9BRvVJyTLxSBIevQKntQSAbnW9K6QqbYuZ8VV/PwgHpvXYJ29q93DnbT2ou8/wYz/yyz1t7KbHN2EvJvFK3qFipaxtHek7kQrA98ZKp87iPobURPwmr3Petv2eGTrMN0t1OjhCZ89D0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3n6Oq+EET7nzKlc5BhH687yFBNZAc6VtaoLke/qPZxI=;
 b=b+UF5Qcn/yQjxKQCedNzLLp8sRa4QLvvj+A5hVQyBNV2MDdzmENhrXj0MZ2p1BU5BdwySgAHw8IBnUrIC8Eysm2uSIybNg1/IOIS4stpEdqESVUm6/Ba6wM9cQlR3g2HAfLzQCrkBsRebjKv3coJhPP8rOkx1KCXxHUYoRjd2hSWHgrTzKjDoXiU7Lpyx4DXp5lDbk+R96saiVeK3U3Uu+GA0aMf+CRaRYRkRvVR3eswfcyhnm7X11HmyoVBNv5UXuXn/p9iTzW9+/0JOtd9Ew8bJP+zlTRRflncMmuP/Fw0l/PdHlY6eO0Fpc1TX2ZYR5Z6Le3SwyNFpKp+oRN/Kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3n6Oq+EET7nzKlc5BhH687yFBNZAc6VtaoLke/qPZxI=;
 b=myFiTyy/ynvZ/mHud9feDaVNHBPfFB4mL0Sj48i9dC1vdbZtd0z5fiQ9ok9tq1329F2X+Lv3c5x3PJyVI+bYGUrM0z6aMsn1Bwqz1oisaeIdPgpV1r+eEuqZ/zo0FYRmjbCuiB/xAhB8dxYHL+vFjdBaHe/vntyl6nlRQST3TKg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB6318.jpnprd01.prod.outlook.com
 (2603:1096:400:7a::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.25; Mon, 5 Aug
 2024 00:36:43 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7828.023; Mon, 5 Aug 2024
 00:36:43 +0000
Message-ID: <874j7z24bp.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 025/113] ALSA: pci: korg1212: use
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
Date: Mon, 5 Aug 2024 00:36:43 +0000
X-ClientProxiedBy: TYCP286CA0074.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31a::19) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB6318:EE_
X-MS-Office365-Filtering-Correlation-Id: ddaabb9d-5b48-45ca-72ee-08dcb4e6ade6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?RK/DujiU8+W+Dfc72wfE7mDAW1zrADDuWHNk7nWoacYR0M2hAbN9X/w75j4m?=
 =?us-ascii?Q?h4yDVHkP+7+h95zCaGdCx2BvD1OQcmTnMcippNzMAsAojE8XaLJMIJ9k2I4x?=
 =?us-ascii?Q?TiIwfIMfOH1lLSwT1c3pNfGePWC/gU833tSiJWqJ9rMbO4/7Tuw5FwUINP6F?=
 =?us-ascii?Q?k5WivUJBR+wgtQ8S1ClRP5NpbkaTO96LWXUtdb+xV3XdFZ77X797pyjteZ37?=
 =?us-ascii?Q?dh88xj/yC+6TndwdepSTRDMaa7CMA+IGxXi44vS3f5C9Rwc5BtTzTV4QtD1O?=
 =?us-ascii?Q?5coMtbP9gOlWDtzad9JuURJJ4fV+KcXGuO7kOM6NuefinKfstlTbb20JPC6B?=
 =?us-ascii?Q?TxCNWrSEMvy+MmRrcLCTsVlPG+Vo2pSQpSrkLdpPd/5u2LQYffvYYbz8qR7j?=
 =?us-ascii?Q?LPMVC4p3ZkAMdymgB5uHSdgfVr4y25TTcgHtJQ+VK87CPjVSfHl9uf/bIJiW?=
 =?us-ascii?Q?TR+JYCzoIr4f8rsAwjmSQV4Jl20XNSvSXyDaX8bUqmXINwBKqQ6CF+c0Q4WY?=
 =?us-ascii?Q?gNyaz5t5eolDxlh8II0TF7MV3RBwY0gvxyi0WVOD/OBrHzJF3LVpsC0wGFmO?=
 =?us-ascii?Q?O4Ls2Bci+5UVYc5nNF4k72T5XGujb+qvjAYpvPUvWPfe8oGc9uEPBbbQcNcH?=
 =?us-ascii?Q?iHmtWeFVF7GruINhEj25vy5sO3wkxG2aKSdRHirTqS9ZeuiJTlPqsysUKGhq?=
 =?us-ascii?Q?EO2GMwc5TJugqogBQuotviJirz3oXjnL1NOH/yG+VC9Fvk+zEXiM61EhQzzq?=
 =?us-ascii?Q?65295rnDnVH5J2dDgUCMKpiNbUcFlAsF82ZgB+92JJz5oZ4zmlE3TJBYvVpK?=
 =?us-ascii?Q?v89qc55Y4bOaz/zWtGimzc7IBcLVbjiKx7XIwIkMOKggq8CF2YDiur07U+f9?=
 =?us-ascii?Q?VlUy83LoL0RUNHrEnBzv/2MMnkUV8qnnEWTRIMl9seoRxP/Sp6e9znz0rW3p?=
 =?us-ascii?Q?MRwd/YC02f3mZA2XYhzRphxr1y9uAv1ZCZEZhSpE8yMQ+OPUs5GIdX2pTE5+?=
 =?us-ascii?Q?HqoqEjigK9WFwCvYmAhfBGAGMG2iayIzW1YWWBj6AcALCnUvEdwEr56EUU6K?=
 =?us-ascii?Q?pL+fwJCZJ7PZqWDGTOnpjRKkpVN33I6lXDQR5OAEa5cVrF/qMM8eTenOJ78/?=
 =?us-ascii?Q?vlTFWjQ+Dt50wV9VLb/1GmuP73YmSNSeR54Cz2UNwjLaiJ9SG9ZQ1k5L+hyO?=
 =?us-ascii?Q?Oj4BU9oZE7g9H3qs2vWZ9XIN/0/ComVqPE7kZv1qF0W9qP+s0YiQrmG1bghu?=
 =?us-ascii?Q?UAM68bUgIcLguZ6mR83C0KRr3w712h4na3bL3/XnGrKR+7lKnxwS7lhkPegH?=
 =?us-ascii?Q?3FRimLSDb3kXB5TSvpyoz9c1AnIjwNZ4bO75S81KT2DtQp74T2Mumzpkc51G?=
 =?us-ascii?Q?WBtJ0EfYsWsMZwcCnkW1hIuVeeJjgqAQA/Xs9dgvHx1IE6+XVQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?FHdIhNZwNdh5YsKbKF3DXkmBH+NgYD02h4dHlUwWNMpimqamGjnDM3+k/Hdt?=
 =?us-ascii?Q?wK1/uc5GHhsGLwhp84ulsRjxYYGpVq1dteS6uvHJrqOs6ynuquL6Q9GFm13P?=
 =?us-ascii?Q?NqHq8L5kmip2APDxkVD1V7+BRUI1h3SX3X6HJBrDLLjLgfoBwIgFDtpMrzQl?=
 =?us-ascii?Q?Pi6HonElqJnV83Z/qoE7JVRMNvdPMQr9qP5vLsgvpYkVtHMtKYESvCUKpzaj?=
 =?us-ascii?Q?T5LkVaK5uJb5FB5fMZYoYfolzQ66bwx5VvuYcT9r/3ssSTkEYcz84agu7lYY?=
 =?us-ascii?Q?YbyW7AUlmqUz9f3S0OGK++zik7r0SEaJg+Y3PiI7yEPzkhhmECWnv2KRc9tQ?=
 =?us-ascii?Q?waoEUhMXv+Yrx6iS0dpLk0befy90x5uioo7LDz25N0XNkONnvm1BVfv21824?=
 =?us-ascii?Q?2x7aoZ+TvGBAPeEQEJZo7asHrphZqUBk6LIAfz2wIvhP+htM5gW++E4HAjaP?=
 =?us-ascii?Q?mUqe+w0nVf91ZCTErPWM/YapEdRypwjbvfi3qGysTber20CWl9xWRoAnOvOl?=
 =?us-ascii?Q?Wr1WR5U0HUd5kJN/10R9vU60XkhKkTJEuqzERry2T5w5suiiRHtzG9H8SqHL?=
 =?us-ascii?Q?fBCALI8oGwefEltRJdDhvilVoLgtrjbABipIsoVhILYr3aR+Hj8y9bYrb8fc?=
 =?us-ascii?Q?ay3OV/dJOWKiRE6Xac+SF6H2cFDbuvqvEPYp+GODMtrwxfS4w/lird955Df5?=
 =?us-ascii?Q?dAdoXkDtyqFoMFObTC/4Ha4MIhqZTpyKzIj34CqErHsxY2uwf+ElGktsgnXX?=
 =?us-ascii?Q?MZlafB4cNpqLhl9KrfF/C6AEhLoum1FcS2CWkv9LqvN3QaBlqsJti5YO4RPT?=
 =?us-ascii?Q?MG94rIJF7pGNiLP+Mbxbg4HvxXBHygvscuq/CHGdusGxkNyabYYnsD6RStQ4?=
 =?us-ascii?Q?A3CzKj48PTFZ/B8gH/7vTRHILYAYYFzVFz7ipBdAV3WXiyNfTmZBETITwsOz?=
 =?us-ascii?Q?3MHqcU8ATN4OmjsbL0teNSZL0L4HFcztDZTushFtIG3ZmAFE2yBDKipNn394?=
 =?us-ascii?Q?Vuj5+Cx4/R8umOQaiHGQx48qJhPNDdap7qkC//jdHXtsTxPwWITcgQo61UDx?=
 =?us-ascii?Q?X9hxFgOScIYugB+CUttzX1EzJOjzSyV7j9/g6Qw4/IBSEcBYI5+hzO80KtEZ?=
 =?us-ascii?Q?+5p0wGetMF0s+YhepnC5077ThK3T5j2UJ9SOs7Jvz8EM7r41F7AlDuZlvJvL?=
 =?us-ascii?Q?APNUFIeOi211jxluUQWV4SKbAaD0hqNciyRPfFFTDmyrdebdmEuzbJUJEIGu?=
 =?us-ascii?Q?aXbfpxEZjxZOgAD95qH6nyVrIHg1hYOWIYcDpQFMkLSQdE+V/YUyyPh4nTYt?=
 =?us-ascii?Q?PNRhyXGT2EEymAQtAwU1v632t1dgy66o9HJWAGxAcl7sF4QcEQXW0CFUZfwD?=
 =?us-ascii?Q?sZrirbHPdrPcnxfOM/6M93v0KhumEKaw6QfH8r/2E2onPT3yCcNB5V1u7EzA?=
 =?us-ascii?Q?pGEfSw05rP5ltODG+UTJQcNC4KMBSa+NKZuLVdoUroDBfyeDv3yCw6kuXduw?=
 =?us-ascii?Q?M2hlLcdMtwEciFHG/d9cSvmUDshZvEnp04LF6mpNhENG/z1WY2bg1MKhnBnL?=
 =?us-ascii?Q?ToEvtr/UU62KZkMJx6AST9nZAyCMjmY7GPFnB7Z9n5kOYDS7VH5UkbxmsyTo?=
 =?us-ascii?Q?IPE3JAZUMNJ8Tz+ZcUUzEME=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 ddaabb9d-5b48-45ca-72ee-08dcb4e6ade6
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2024 00:36:43.3754
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 JOYJMeX6oldTLSbp25g0pkaB2UWt8Cx5oyZlfgUl/7JJADufI8F4O3NtAbO+hu3GpFxUi3cl/S1S6/zamhyV7FAuGpvmAozc4pkzWPU98TU7qt73iRuHalt19oVEY3zC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6318
Message-ID-Hash: WFKTCBOLYGPXWCAF52WPZOHRVN4BOWLV
X-Message-ID-Hash: WFKTCBOLYGPXWCAF52WPZOHRVN4BOWLV
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WFKTCBOLYGPXWCAF52WPZOHRVN4BOWLV/>
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
 sound/pci/korg1212/korg1212.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/korg1212/korg1212.c b/sound/pci/korg1212/korg1212.c
index 5c2cac201a281..f6c7edd1f045b 100644
--- a/sound/pci/korg1212/korg1212.c
+++ b/sound/pci/korg1212/korg1212.c
@@ -1494,7 +1494,7 @@ static int snd_korg1212_hw_params(struct snd_pcm_substream *substream,
 
         spin_lock_irqsave(&korg1212->lock, flags);
 
-	if (substream->pstr->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(substream->pstr->stream)) {
 		this_pid = korg1212->playback_pid;
 		other_pid = korg1212->capture_pid;
 	} else {
-- 
2.43.0

