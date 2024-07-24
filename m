Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A40393AB51
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Jul 2024 04:42:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BAE5CF50;
	Wed, 24 Jul 2024 04:42:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BAE5CF50
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1721788968;
	bh=6lY3QVjna1Z1nGwAEftbLSdrhp/gCPw0b5Kv6pmxbVM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=MBq8TxfsJ4WguExPdyODes8b3ujo4nEga2SoXWBysxcFqQQN12ePj9kxRC2ICJGqp
	 C6HQyZa72UP87qlrJxffOqjRQJdSyiXIOX6/JG0oow0Q8CZDCWDEMsrSCtUAnELj8o
	 j4KQpn9qtXDPoQEFUuNq7NeE7PdBwzTU4V6bnmlk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 27DE3F805A9; Wed, 24 Jul 2024 04:42:19 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6446FF805B2;
	Wed, 24 Jul 2024 04:42:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 318FAF8057A; Wed, 24 Jul 2024 04:07:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=unavailable autolearn_force=no version=3.4.6
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazlp170100001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c405::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 63CA0F801F5
	for <alsa-devel@alsa-project.org>; Wed, 24 Jul 2024 04:00:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 63CA0F801F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=Rr4juaAF
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S6+4hE+uo04JxrKqlw8mn6CUqt/yrmy1NLncZt3fV/eND4Edm3RLpli/XWovRB7AEjuQAAlw417NZPq1gWMrO7dz4oRngAOsJ+IPxWL7nD73A5/FnP7/bOes9R7JvcyNz+FOxI0lBzFRcJPzXxkryJ926qYIpfTte49nCsNQIp/gPKVJ34QX0MDrc9G0afl62VTYMedWFWPzAxYBiXYGNnN2ILjInL5bd6nKw12wq/YgplZx9wMQO0Tf756uKDDuw7/e2ZGluvyqbkM6gJvcxIsH7FWCKXzCET3qRuDuP1r7fGyWwpPGaHK5UH/HpNqrqd4/yE7BA5kbx4y3/y9ZSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PH+IIYhAWXhIqx3v8oBZrz7nXjciHR50q+VObJXTIDo=;
 b=FHBv+74P7Ec93AZfAJL7hSd0Uyo+Dvy4I+7VrZ7yAxYU8ASi1ABnklODeRtmb2EfEm9bad1OibMTo+rNsr8bb1XAmCMfWt9Ex3TASeXF1wyi2B2FEGn8xGvKy7xb+kWwNfKTc5+U2FTIuhAKSsijkzaaHLD7RY8ptHN8iFUuXS0Fzi0PSj/dnzuwKBCHjE+KYU3u/nANJOHFfJVmYR+FXsAJhq/vAyQVBCCEobjOEH3fva8a5BWrM4uZ1pmePrh9oj5EsTtCBDMoZJKxFyLaCrybsBuRn5Nzv85kVw8v4zOYzUTxWEGzDUcPiJ508sW1W25AgHs0cIE23vYxr/wqHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PH+IIYhAWXhIqx3v8oBZrz7nXjciHR50q+VObJXTIDo=;
 b=Rr4juaAFdQJ9CmsHuZMc6uBPjzsliQkS29WX6vIFyVk5LdzRTqy8GVtSR/rWC86qi9OhzXjLPJQ+Mx4iVBoVxx5/bjf4mePNOG9OvdfR+Da2AQsylguxNJCrwEQ7f+YWHTrSYFtSuBEzku5/+zOlZMbCptTRWeEvbbtGRo1VYY8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB10388.jpnprd01.prod.outlook.com
 (2603:1096:604:1f8::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.29; Wed, 24 Jul
 2024 02:00:04 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7784.017; Wed, 24 Jul 2024
 02:00:04 +0000
Message-ID: <87msm7ft23.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 015/112] ALSA: pci: ac97: use snd_pcm_is_playback/capture()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Takashi Sakamoto
 <o-takashi@sakamocchi.jp>, Amadeusz =?ISO-8859-2?Q?S=B3awi=F1ski?=
 <amadeuszx.slawinski@linux.intel.com>, Pierre-Louis Bossart
 <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <87plr3ft3q.wl-kuninori.morimoto.gx@renesas.com>
References: <87plr3ft3q.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 24 Jul 2024 02:00:04 +0000
X-ClientProxiedBy: TYCP286CA0044.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29d::17) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB10388:EE_
X-MS-Office365-Filtering-Correlation-Id: 3555070c-b921-4f74-c8c7-08dcab845600
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|366016|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?YjAERmaBCQ/93E7yvTA9XNJ9emZngvy8YpLk2CskP5b4LJxqZnltkEAkP8ag?=
 =?us-ascii?Q?DerRLeBy0KROVkB3eg8T8kMuAZU8ReFxeg+Q3cteIfyXl8/vr9VpnWbLMfa7?=
 =?us-ascii?Q?qVS3o+tSwdarASz/kA92fS6FaVlSndUp3UegFjo7SAwyQrGM7zCbcAh4R/ZZ?=
 =?us-ascii?Q?Rv0akqPVqTyfwjFldWCWCZTmy+ph8dPMH89OrX8oBYvEC7NSTM0brjMVzxLV?=
 =?us-ascii?Q?Sa3TPszLQrH8TJVdCUG7fQ9Z2SbcLcKUVWnnv1O3mBmq2vWgshlta81s0QlT?=
 =?us-ascii?Q?f4ULQAvts4dqjVmnBNVQuPVR7oS7tfcoOo70j905Ew8snv7XrxJ7XnQxf08s?=
 =?us-ascii?Q?k2AvNx8FWPXfHQVys4bG1SN8KuUCY/lvOAKGOMseZ7bwTkb2vOzKVGkrfHDf?=
 =?us-ascii?Q?RZQEkBtNg1EIjfz/ih3W5GWdPaHuvJjvC9AnGy8Jpvt8gvJWtQhmOn52sOhJ?=
 =?us-ascii?Q?r0PxrqWhq/oG89G4K77bf87FVigdX8GeAGExxpveJHPR/ZTXxDd2kjYmvezj?=
 =?us-ascii?Q?Cm0MjO7lHQI+meiLCp2SsABkCEcmjfxIlkCVN0ptB4n1lTJAHT+2a5aOPRz/?=
 =?us-ascii?Q?4bH4dm3Tbu6HQbRVbQZqScBS9weZQa1trFV9iUTfLwnsdWC16unqPrXLa9Op?=
 =?us-ascii?Q?i9DRfFvpeV9TosFjvq2G0yZ3a65aBzdhQPPn0X6pU5DLyoAKlLoGXkBb6RgO?=
 =?us-ascii?Q?J73uJIh+pek0qgu4LtNfgokC6hY0mJvmUejHJrCpeyKLX+hYk+2j6RQwziDR?=
 =?us-ascii?Q?NYD8aOTgsK3Ay3iAsynJc0lyV2f9V/JuZatcyhSD2yzUIPrfstoIupyFU+kE?=
 =?us-ascii?Q?5O1noTH+eeGeDbAsQFxtyMet4Hsl1vcAkyuQOq+V3tA3gLZuC4QaJrmwXoHE?=
 =?us-ascii?Q?tDaq5zTce1yzxO3t0IM9Jg6+GuYL57Dk0BFWwBSfL85sgcfeF0C1QN2jTbd7?=
 =?us-ascii?Q?KeileF9TaQF7aCy7K3bqIXJFMCYNR2lY3jrOcpExjxBOzHsU9Q1qN1osDBDv?=
 =?us-ascii?Q?QWl5Lrwz6/3oz1Gm/uusA/b2793dX5RiPUkIC4vOYjbbK0q2TzqEkdzzv5tX?=
 =?us-ascii?Q?70gBFmpn6NN8gSbnQiGL2D3qKnGvFG8Zbgjz4RHJ+42sRHeY8rJb93544cE2?=
 =?us-ascii?Q?aUY86vLRUKWMYnDCkdVUhRP2dRqibrL5HnPTxYfLRDvqoGcJWFA8s6uA7aoD?=
 =?us-ascii?Q?itTN9oJEe998Cd15y5cZiX1/GUqMIjuv5p0R/a0m2Qob3v6CeC6H3wZs0P63?=
 =?us-ascii?Q?ZJmyiq+OrFnQWATowcAP3iQPoT5hQWY8JhS/ge/t8s9doMA73RWR8qH1JHrR?=
 =?us-ascii?Q?NlfouQjf8pHTjcXkIgXqGMy5YtIefTRUZl7V+3RdJdBveJAAL1Sms1gzSLMI?=
 =?us-ascii?Q?LtazaQf2PclKDSTRF6zCptk+lK8x6p8RtV/X0SQ0jNAS/y2wkA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?zWZxNJnvQ3Jrkx+IFnX16LfdWT4sNjAMFpck94J9gqG9zLCH6PO+2kh3EVCN?=
 =?us-ascii?Q?XR3MMy/QkgKD7G4dC6QqDDuYnjtndQAXHKkcAXvYboszLJ02M9c7e1mqU5pY?=
 =?us-ascii?Q?XuLAPK8dU8noqbFTfG8+nrkFlnNzop20h7MkEzgfY/BGBwb5YI59SKa2KT9a?=
 =?us-ascii?Q?/yfIQDPc9l3uriYHFElaZLEsaM6dpsJnrImfbGd4oTQqIwVewqK9COGRILiH?=
 =?us-ascii?Q?DoKurT2IIS7KK9wfZ5peffYbTW0frQ99F9BJT8z1aU1Q+tNsPpWDeOQo8phA?=
 =?us-ascii?Q?+UpoBsWp3KrpUat4oDG91A3V3CynTpKfcaneZLKA9JAazo3CCv5c47ifJeox?=
 =?us-ascii?Q?HHKmnjOQGEnavEj6nhxEeY8nKCvUT7BmYqt0/twQA5eKqqy4bwoZ0ozkFWvr?=
 =?us-ascii?Q?rtW82FVYZVyllzKKHrSibIzaFXsG7HX5tMoA+jnKWhvv1T4vVn8SOJbTgVNC?=
 =?us-ascii?Q?lPoRBx02kgUIuKQ74AS+MV29irsUojM/nePtLLSD6/Qgf7eqqIzwghIh85o0?=
 =?us-ascii?Q?o8f5dMhp3m4UhEbH4Q8Pyd9AAy1mpWNSHQjwnQZtnDClaLrrL4Jaen9HpDuC?=
 =?us-ascii?Q?0qI/mjXCJ0t54DovY5PP1uuAZ7kWsx9zG/fncVL6ryxvt+4BwM7PpYP/WLKC?=
 =?us-ascii?Q?2xFONBGWqNMf1Njjd/chq6yjOLJob9d55iW0D3HxInIpRIsSvraJTPvLgKSL?=
 =?us-ascii?Q?/Z/CzyuSl7FU4d1KCmfTIr/kcKMKQPcBoQpD1zbtvY5StLUqjDtNtIvzb8Wv?=
 =?us-ascii?Q?dv06iFapce7ocYnh0YUvfJoyVtk/Kqg6Hn7JAabEc4WVD+2IZVIlOcQpSzx9?=
 =?us-ascii?Q?xwZwJsto15BSQI/etVr4s7TemsXX8ggD0z4WOHpS8svBMbOitodCmK14lb8z?=
 =?us-ascii?Q?66MSy6j9G/ID23VMLmKR5EagTf59pCMvbm3mw2N1Ulo5hJycQtFm4a7mh75f?=
 =?us-ascii?Q?oV06fIPQMPEKIYQSioyDEOj0Pi0UkKd355bYH0gjabVHNeUfVUMuF2xR9P3H?=
 =?us-ascii?Q?uAt/upakKYgs3Ysuqd0O/glXWGJio2x51WJDypSvMHGzXJFrgOajSydx1nEq?=
 =?us-ascii?Q?jDoX7EfDlLo7FNE+4RBjyduVphdEJx+VTbkAqrvtslRoB1MavVBP8+Jdy7gK?=
 =?us-ascii?Q?o2TFZSAjdvjJEsAO/vdn7M4mNArj3ybyMVbhMCZ8fRwIPmAnWhq6XwlWvrZU?=
 =?us-ascii?Q?kQRVVOuZ8eKV8ckP4/+9E9IW3qRUnNw2AD+zei0YMz3DQLWkH7W7z3vz7It/?=
 =?us-ascii?Q?6yfwOCYiggqWwbM0UPgiLrsHyaYyQ98p1PiTVj1docEcuuVKOmWht0aOF7AF?=
 =?us-ascii?Q?hkzSbyhURmObv3DFZKuOC875RR02lIopwqtXVGCN6Kjgb6M1leL2Wm+Qeo0v?=
 =?us-ascii?Q?OE0QYiq68oWH+AtxCn2rswjd/wgdT5laLKGIJCIHngC1HRtfqu7nGBYOJouE?=
 =?us-ascii?Q?Rrhaln5SzckSN3Wt9NBZVtrhhw1He7s4QEjYHt2E0f6b/FUe63LcRHFKpnzw?=
 =?us-ascii?Q?dXqCW4GEYI4iDmvEHrmjmnonKzviecZS0bFPCO+45xppMrBmn8Lo64Xi461V?=
 =?us-ascii?Q?jFXOEBelDqqNGVLDQGrEEZEbamwr8GQjDIq+zDMBB5AT7HL/DxDYwYkAEiYF?=
 =?us-ascii?Q?gNSAkm7UxsuRJeT4ukvBMck=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 3555070c-b921-4f74-c8c7-08dcab845600
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2024 02:00:04.7719
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 r6+0kpEMtVyJgDDueN49cZkBeDSIsL8XgGwOEwxBLbAhr4apAPuKjPsQ53LLH+ztR+M/PcFm2evrcA3Uyz5gbv/RKQ4EBFOEOa5ubEclFu9ZOXP1KBdRe7o2DejpulkX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB10388
Message-ID-Hash: QC64I45MBMRVOJCYVBPCBD6NMXUXJX3F
X-Message-ID-Hash: QC64I45MBMRVOJCYVBPCBD6NMXUXJX3F
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QC64I45MBMRVOJCYVBPCBD6NMXUXJX3F/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

We can use snd_pcm_is_playback/capture(). Let's use it.

Because it is using bit-field, can't use snd_pcm_is_playback(),
uses snd_pcm_direction_is_playback() directly.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/pci/ac97/ac97_pcm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/pci/ac97/ac97_pcm.c b/sound/pci/ac97/ac97_pcm.c
index 5fee8e89790fb..2d8276d2d32f4 100644
--- a/sound/pci/ac97/ac97_pcm.c
+++ b/sound/pci/ac97/ac97_pcm.c
@@ -150,7 +150,7 @@ static unsigned char get_slot_reg(struct ac97_pcm *pcm, unsigned short cidx,
 		return 0xff;
 	if (pcm->spdif)
 		return AC97_SPDIF; /* pseudo register */
-	if (pcm->stream == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_direction_is_playback(pcm->stream))
 		return rate_reg_tables[dbl][pcm->r[dbl].rate_table[cidx]][slot - 3];
 	else
 		return rate_cregs[slot - 3];
@@ -512,7 +512,7 @@ int snd_ac97_pcm_assign(struct snd_ac97_bus *bus,
 			rpcm->rates &= rates;
 		}
 		/* for double rate, we check the first codec only */
-		if (pcm->stream == SNDRV_PCM_STREAM_PLAYBACK &&
+		if (snd_pcm_direction_is_playback(pcm->stream) &&
 		    bus->codec[0] && (bus->codec[0]->flags & AC97_DOUBLE_RATE) &&
 		    rate_table[pcm->stream][0] == 0) {
 			tmp = (1<<AC97_SLOT_PCM_LEFT) | (1<<AC97_SLOT_PCM_RIGHT) |
-- 
2.43.0

