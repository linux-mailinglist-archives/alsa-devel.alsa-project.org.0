Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F87994728C
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Aug 2024 02:47:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 851734D06;
	Mon,  5 Aug 2024 02:45:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 851734D06
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722818765;
	bh=BYeiGQPqg8A1Pf2Fd1CwSq/SeOOJX2AcQtG/jlKbp/U=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=awxAwx9pk9dMc2xJ9CLunAPC06fpA33VVNCbZwzprQ6vz8rzV9m//j/M/zlcwaki3
	 hm4AkjowhJUI60/K5CNpJWkDS5s9hM7FnKmyOLA35ZA6NnObh44ZL1sDUXdV8/zOm4
	 RQuONjM7VLh3rJUtQsQzT8qGIrSDKM/jXDDKVeyc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 72837F805CA; Mon,  5 Aug 2024 02:39:26 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AFCA2F897FC;
	Mon,  5 Aug 2024 02:39:25 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4C425F802DB; Mon,  5 Aug 2024 02:37:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazlp170100001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c406::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3DF46F800BF
	for <alsa-devel@alsa-project.org>; Mon,  5 Aug 2024 02:37:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3DF46F800BF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=hn8l9NhV
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O0AWWJWUBzQmJhWr1tG8QvOuKSvJnoBGFWRofZR9ipplSr+uSkj+2vUFXyK22l/nDpOCXPi5et460O9/bMmMzqjL8TSZ9cv+fAjS2zBV73frCoV9VkScPZyXAQNLLEPzPwlwH8yFBYm5F+6JgKJfhxJhhmjaPwNsUPCJjdpRm1qSQDpy2+YUqNQ80lNYKf0rmWnBkTQMw7aFPWyRzZKlJgiRqIyyizMaMB0RBeJxgI9sQj5EJKK4VCqolkMOC44cXH7hK/cGk1M0aXljo7yL5vdDNEf03qytyQTUGLsuIbeEOmQHZP9E7l/Wshy5l3xuGZLVF7yv+srUwtIU5nMWNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7H9u624bX6d2+JJGw1QV70upFuFqYwjbDQqa5wQRO8w=;
 b=SiipmnsytoR3JOsznP+ZdKIj9S/XskEhpME6CV9v84ETSh9ujQ2dBJ8j45FEGvfyk4dI44ZAUehg7vlxQHVVpm6kMs2CEybY3uDQ9zuuaQBKBjnt3++nrOLqhM6rUV2MyJ74X5E9KVxlnlqWZmBip/3RF3VWml7dRqhXc734SLZNLpjCWhGje59aDBmeeibJvdTo6Q5zeYqkkO75N4KlKceKL/5Jywf0qSPi8x0B+vt0+lAs7wVq9VpOTO/lttBjlXUCYvAgHtrBN7y9fdCJpfTK4/zgX3W2zu92bpYeJjkbscNnFEHsNxAZ5MSNKPRD1fgIJtZMdLYJGvhBCjIVuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7H9u624bX6d2+JJGw1QV70upFuFqYwjbDQqa5wQRO8w=;
 b=hn8l9NhV9sKRdHwZ8iX3g0/PSPVDoFds3Y0pygPqF+Jy9S7+XZrtXeJzqSWcRxuyQfA33CklbM2qHoDQW/w+wHBmok7vP3yIYNajnWDMjynPKoqWOlTAPSWqMPMa+6+nKl+kLTbZbppDTA4dJZl8pSatrGXNq77hBUrGpVY1wQM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB9685.jpnprd01.prod.outlook.com
 (2603:1096:400:221::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.25; Mon, 5 Aug
 2024 00:37:07 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7828.023; Mon, 5 Aug 2024
 00:37:07 +0000
Message-ID: <87zfprztxp.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 028/113] ALSA: ppc: use snd_pcm_is_playback/capture()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Linux-ALSA <alsa-devel@alsa-project.org>
In-Reply-To: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
References: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 5 Aug 2024 00:37:06 +0000
X-ClientProxiedBy: TYCPR01CA0195.jpnprd01.prod.outlook.com
 (2603:1096:400:2b0::17) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB9685:EE_
X-MS-Office365-Filtering-Correlation-Id: f18d231b-9bd6-4fef-b701-08dcb4e6bbe6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|1800799024|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?X15R4aJnytKjPP8Ht+VuKXdV0Utj6m0nnQs1pMvMZ36hYyukFO1fAVJliEzG?=
 =?us-ascii?Q?KjYm5dehZODemd649VrtCtR6TJ3k2hpvVrqYmH9NxFq6jh5/n7tyJ/FiF4aI?=
 =?us-ascii?Q?Gsq2TAdD0UBN2yp0hvKP2KqXmV84KkrxL3ZmCGOj2AZJseNGz5BHcymWvwVU?=
 =?us-ascii?Q?G1YWDKBZbTwcllouzkCclVg6TprrktsJpMo2H28i27v7AQLU0Y/Ve2oGUif5?=
 =?us-ascii?Q?Qv319cxnkzNyCqGT1egoM4KPmtzb7pmHOiSvqW1gCRoc5hyfJKlMNOV12sNu?=
 =?us-ascii?Q?BuTVChEAxfpPbOQbzwKjiRbwfRYTmprx31sCZZ1R4vJGpoP2Yy1vU1PA80ng?=
 =?us-ascii?Q?aDCBtQwWWw3h/XWEDphPOEAUOItMOb9wsYmeg4dENb0hsuMQsaakl4d5zn+W?=
 =?us-ascii?Q?DEifyotP59/jGK6YdTCaAAf6JYpyRsPE89HCsuW/Al6i+WIl2TboK3tWrYU4?=
 =?us-ascii?Q?AmpB3hNodRGeQzVNi1zfojeNklZfTPzE3EiPgGKkQMTyY2AyybmsTlVI/yhZ?=
 =?us-ascii?Q?UD1uFQ4vuusdbK9each0QD0d1fD/ox2RSMBPslZrXjCbCIxIrQQviv19bjOu?=
 =?us-ascii?Q?N2UpbpKWf7X3RQZ+RyDIgsfLpLODEo8+Yg8xOu0YyywEtGNS08gHKnHEil2v?=
 =?us-ascii?Q?ZYEz9a18F1JadHxA3O9Rko8ZmEhp9v6OV9mgOutqYFBJVUlKatTFqOIHI54t?=
 =?us-ascii?Q?VfqAoryfWAqLbAaoqYVL7nhECunfpTu3tNoqV6dHv2MJ0ecPOpLxc25m2AE8?=
 =?us-ascii?Q?nj7D9+TMfVHP9LatKVXN55SD2/3HJbMQ7Re9eDRAyekUrmTkleEsXudfTmup?=
 =?us-ascii?Q?FGmKXRAMXrbS1cjLgCRtI7wQFnskUzU2TU9Bc4DAt2lnKeP5afEk8vufIgfh?=
 =?us-ascii?Q?xxde3EHFmp4cgTdAmy04VpF9hrY3w6BUmcj3lDYc154HXOF7u/uQghlwC2Ho?=
 =?us-ascii?Q?cIailMF/vUUWEyXHyTHcdGNLM6yGFJmu4u98PuB4FZyXxLSjIg/4mZhnIllW?=
 =?us-ascii?Q?nltTh8wYL/PmrZEILwXTL5fvTPswVWR7dtKuYC1ciETvrkb0WFOheYW94caE?=
 =?us-ascii?Q?BWdUsZ5dmPg8qfub8XrLd3CqPEzi2TawNeJ1jG9rH/14GQbTq3f1soSqJSP9?=
 =?us-ascii?Q?yPxMl3tGRaiQtYhtP8aHwuIR6tJ7D9Y1DnQsboQecScVN9RZaLg8hZ5AzNe2?=
 =?us-ascii?Q?J606yn9OM9dJrCbf202VWN+vC2BfFE2ckmX4p6K1qaRN7LYwLuhw0eQRlCOO?=
 =?us-ascii?Q?0YAcBDfon1sC2VhYXarv1m+5g1gXcbZPdkIGGd+NBjY/C9+73W2JTrA23y08?=
 =?us-ascii?Q?LGB60+IvN21z/eOycZrw90u6ulRH62CMPIjgY0xTYQchBhplv0nJkin6hc2/?=
 =?us-ascii?Q?qvQcDavurymZj/TOowvkmbCB04Fk11q/v+AuAAmEcP12z1lQ6A=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?beHv4ea38EoxN6qkbYhMGJPr4hpckJaVV07pR3h8PmelwaHNiNbojFWIiSE7?=
 =?us-ascii?Q?miKv6JTTr7rrhExqSiDI/855qBZLXD2EkZOLzsN3Kd7OBb/eb7rZ81tDTlya?=
 =?us-ascii?Q?3GyBdJoBLACXIE/YbVpQF1DLTi6obOhA/FzSb6o85Qk5JF5AAFhYTteXdCei?=
 =?us-ascii?Q?hsD1FvjhF+zstg6ok1Fb3S9b0+z61LPd80vF2EagVHVF5QpI7WE6Gg5WuJ4Z?=
 =?us-ascii?Q?jUu4uj68viv7BqkcFfJ66EiD7p8+mjSriNgANYMmHLeY5QF7zf6SilKKDsb6?=
 =?us-ascii?Q?ZDZliC7mIDtNhHPHXEXpdnbQYoSD3O1KAl7syIJtJNnrqG7ecdMnBmnjo686?=
 =?us-ascii?Q?XvRPVEm5m4ntJMh7L3vyqZpb9iCbb3VRhqtrj2l5MQt66g0/3L1j26TmBiJ6?=
 =?us-ascii?Q?UVxUUMKxsarB6LzxgpOOhAVfw8zpdRbkt04cLvXQJFySfqWS2JP67GZXwoaX?=
 =?us-ascii?Q?qAT5+x8PEfSCbr34a6wMTlBhby1iplCh+iMQhy9CkVCgebNq/NLrU96YOndk?=
 =?us-ascii?Q?rEwWsD7drHXqnTmcZBMEgxaxddh1b+WGdRgFgylxsj8muOEOmHLXxqi3Ngul?=
 =?us-ascii?Q?cracIx4eA/JFPUzAKxtL8Ck/f+ODbvl4YrzHHx1DtWDvkqKUx6azCpkYxdSP?=
 =?us-ascii?Q?qMQTWqIa+FpEOxOC6GAKDCWVtAviahA4XaYF9BwfoDh+2BUhwMA2WCwzXFZP?=
 =?us-ascii?Q?OsLC1A+mz/ltgkg36eMnZ96F8EbGnv+zDgMqKboeKuTPAKhL1baOB7OrjTpt?=
 =?us-ascii?Q?A2SMz0VTqgFsawdQqxMqYeiW/RLsndDQ0Uj8iWGYiLR9KCyhQkhMZK4x1CpZ?=
 =?us-ascii?Q?OZ67ldXUDByYqqocV9Rjak9NbFKg3CK3D3Wj8aEFY4oUtgX/QCU5/Z8jazs+?=
 =?us-ascii?Q?s8kT8v1pm5YFu8mVKWRx3x/cI3nae9sh729hKc6Jd+3KW+SZjWK72tcRufdC?=
 =?us-ascii?Q?bs/f9HTwHzs/V5VJDuEY8q1fZLt1btjz49ssxrtB6bUd3BqvgKfNOMMqTldr?=
 =?us-ascii?Q?ebfZfh4ZFGcfyxLGag+jOvu9EPu11K6PV9WdzaW/I5hvlnRtjDzw7Z1w56l9?=
 =?us-ascii?Q?OFcphK1V0VNfHnzeihPDk6CixJXilsfkMfxZ5Nq/yPdPQ6GA6CoI+SigAt6F?=
 =?us-ascii?Q?q4I7Zok4MGzo4hy7CRwldHijJUoLYVZHi/9ksBSZVPket1H2ivzkBPsohWcQ?=
 =?us-ascii?Q?fqRGb2IjSD0M0QzrUjKvYd/DOeOLoC9ZZ9U9SKiHi63JwEUcruc25CeBYkIU?=
 =?us-ascii?Q?T1Fm5NVxu4klO37wbcZ03Ionv6wHUyvct9/QNaL8auvZEy+1EbpUnxK14fgA?=
 =?us-ascii?Q?CeSNLQy4gTXouYohFPGaUbrhNRer/F3dQUFan9sT/vFH2iyui1seznmn8GsT?=
 =?us-ascii?Q?KEHfHYoTyPY3elGF8lyZPWx444V/z4cd1vUBmN4MqEGn8ihJbn9DftzMz/Cw?=
 =?us-ascii?Q?jWZt4IJKlks+JNbk97767ARBs7onH2kWiryGCL8ffNyC6S70jnDscFUBPcIk?=
 =?us-ascii?Q?Q7i5HnslnwYGD3qyc9Vv7yOudrYodu9xdqIqjAcvrNzaWT6g/XRqPHzG3zbm?=
 =?us-ascii?Q?FajOTww7LHvDcVsmxbhAjtRpupgKHeiH7ehbE2PFvwBzO1EmPvGDBeTNl2Dz?=
 =?us-ascii?Q?LIHfe3ZBd2tepfo8LZ7Lx50=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 f18d231b-9bd6-4fef-b701-08dcb4e6bbe6
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2024 00:37:07.5328
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 dzeARkYb4JWgWnyxqE98ie97TErHCCtdOg0F4XXm84SLJXSufc33gGv8m+Mhv0TzlZ5NH0QRdwYvyIMiDUogDDJaju6h7njoI0TAPgwdmUxRHvdmDqt+ex+SjV6mWALA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9685
Message-ID-Hash: PGNM6ENT65NC5F7PX4UGGUQFRSMZAIJL
X-Message-ID-Hash: PGNM6ENT65NC5F7PX4UGGUQFRSMZAIJL
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PGNM6ENT65NC5F7PX4UGGUQFRSMZAIJL/>
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
 sound/ppc/pmac.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/ppc/pmac.c b/sound/ppc/pmac.c
index 84058bbf9d127..168c1e2535faf 100644
--- a/sound/ppc/pmac.c
+++ b/sound/ppc/pmac.c
@@ -103,7 +103,7 @@ unsigned int snd_pmac_rate_index(struct snd_pmac *chip, struct pmac_stream *rec,
  */
 static inline int another_stream(int stream)
 {
-	return (stream == SNDRV_PCM_STREAM_PLAYBACK) ?
+	return snd_pcm_is_playback(stream) ?
 		SNDRV_PCM_STREAM_CAPTURE : SNDRV_PCM_STREAM_PLAYBACK;
 }
 
@@ -251,7 +251,7 @@ static int snd_pmac_pcm_trigger(struct snd_pmac *chip, struct pmac_stream *rec,
 	case SNDRV_PCM_TRIGGER_RESUME:
 		if (rec->running)
 			return -EBUSY;
-		command = (subs->stream == SNDRV_PCM_STREAM_PLAYBACK ?
+		command = (snd_pcm_is_playback(subs) ?
 			   OUTPUT_MORE : INPUT_MORE) + INTR_ALWAYS;
 		spin_lock(&chip->reg_lock);
 		snd_pmac_beep_stop(chip);
-- 
2.43.0

