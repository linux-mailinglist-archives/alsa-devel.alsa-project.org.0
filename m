Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A5176E04C5
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Apr 2023 04:43:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 98867F72;
	Thu, 13 Apr 2023 04:42:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 98867F72
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681353779;
	bh=HtZhR1kbdHz1mNUwMIICgn1ENBnvSFyr9WIc2t7P0rQ=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=ifuNFkjpdHUG/66R9yAh1bxspGlwewrwX3SYoncCulYCF3b34BD98aQrQAwM34/pl
	 QZa5tCoeZABoht5l6rJVFFuio+MklRz+ChHtg0t6WOgZJS7kNc7ELE3bkIL0NNfEnm
	 xcdK/mM9hbJdkggtvo6H4A2poJA3TTEfoSFz+ALs=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 41ECBF8023A;
	Thu, 13 Apr 2023 04:42:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1B724F8025E; Thu, 13 Apr 2023 04:42:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-2.1 required=5.0 tests=AC_FROM_MANY_DOTS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20717.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::717])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B1EC2F80100
	for <alsa-devel@alsa-project.org>; Thu, 13 Apr 2023 04:41:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B1EC2F80100
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=dm.renesas.com header.i=@dm.renesas.com
 header.a=rsa-sha256 header.s=selector1 header.b=MOgFr1dc
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F/2hrCsKBaMDjyrzNAFse9ZaM5OUBom5vyi1oNbRzpdOnoLbQQpv2I2pRR5hRUzCX7y0ojRG2ckMbcZU7Una3pERlbX9/oufyEo9X3wFtNtNynhHS30JadLXHrKyXzHN8vPoCpr6lh+YdRbXhmoI7OlsgHIYWTpPzwa+lNgbMoN/qHQNCUs9PL2l/uRAsQHpXZq5crOPhAGj6aEjxZ0ryguxG4v+gnp7zNKttDoLACei1cwACUgQPNA7u3NSxcxxJmekPwm18OoUvM7b5kX88H4LN/Mg6Gs46M1zZv8/rF1FrQoszEKstjSO23WNDbRvrHDeHRTlr06T7NpuwpwkjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KaWpvmq+TR9bONDipD/WTvMDWGBm7OmBzuHYlociAYo=;
 b=N8PelJ0GNXNRggnrOojrdbZxe3hMSCNELTgcaNCzXu9cHrOEv4Map7wU+CK7oqRaHHQGRnW72y8n7oGUEjomq+NznSp5UXZlQNiy7LmjCGgy1fzTPZ7T2zVAF85PeG2+sYh9M6PK96uR3ZgkDMs1RFAzeuTnx13U66ndqrMIdE3sCd9Dbe4/rzj31Wb66wfM/eBvOEZjDwasUqK8aFZp78o4B9CLowmsTjWposiDzVMFKVkj4VXtbtv1XfCTrylpnry9RIjla3X5tj3pdr00+2do6TBgsKG9ddgBUOIuOa89G8Tr/31tfgSz6W4OyaqA5bJWPudzwB+zGCFCOKogJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=dm.renesas.com; dmarc=pass action=none
 header.from=dm.renesas.com; dkim=pass header.d=dm.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dm.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KaWpvmq+TR9bONDipD/WTvMDWGBm7OmBzuHYlociAYo=;
 b=MOgFr1dcfhSJ17It845RY0YMhsQrIrjl9ivJLpJl4k3E0TQ8lEaUZ+GwN/6cuWC/1F3zNS+r7e7Uz2H95BHVcP5qnEE71AFpf1NDZxw9Y8DDoXEOGn31HvAbiEhIzNYe9Km+5JmtbRQ0I5+neTSphM6Hm6GRIYuGRwcgH/ZIBhg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=dm.renesas.com;
Received: from OS3PR01MB6641.jpnprd01.prod.outlook.com (2603:1096:604:10b::11)
 by OSZPR01MB9615.jpnprd01.prod.outlook.com (2603:1096:604:1d5::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Thu, 13 Apr
 2023 02:41:51 +0000
Received: from OS3PR01MB6641.jpnprd01.prod.outlook.com
 ([fe80::75a2:f32e:d86:4246]) by OS3PR01MB6641.jpnprd01.prod.outlook.com
 ([fe80::75a2:f32e:d86:4246%4]) with mapi id 15.20.6298.030; Thu, 13 Apr 2023
 02:41:50 +0000
From: David Rau <David.Rau.opensource@dm.renesas.com>
To: broonie@kernel.org
Subject: [PATCH] ASoC: da7219: Improve the relability of AAD IRQ process
Date: Thu, 13 Apr 2023 02:41:34 +0000
Message-Id: <20230413024134.8612-1-David.Rau.opensource@dm.renesas.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: TYCPR01CA0107.jpnprd01.prod.outlook.com
 (2603:1096:405:4::23) To OS3PR01MB6641.jpnprd01.prod.outlook.com
 (2603:1096:604:10b::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB6641:EE_|OSZPR01MB9615:EE_
X-MS-Office365-Filtering-Correlation-Id: ae1ae7ca-d0ad-4ada-74e7-08db3bc8a193
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	26AOZCE53QeTVAEJwn+pBfuHxLlqPVh8f7w2zgPLGDbhKszge+ixMlHJvfcTcJnDWVS4GjkUS26cWw/nX9pMbIBtI/IkcubOHsmBB+PoL2fg6/HtRkaXWGOCXkT2sXC25JbGVc6NsfqtKehMnKop+8qTh+7eMBPaXh5wJ/k7RUn1SgWOwov9PAl9V1GvuWsTFUhBNVEFrpm3nIzWcFJvPAx9F/dvDWfgi1TFMFRIM4RqsttGju3LiKFoMwsb0MzQ9KpHZQOYDuSvLZmtGlLHrJThCCzjlWQiDB6Iv819ERF3p9M9m+OEZ3KA16moZrfo1ifhC5WS02lOMnOIIjiyOlHNucQzkgCBqJhYCxyyhj1xnNuImb9O46Xm46gyv71Da+JBg20kP5bUIAgU/9N79V3AwjAAh7n9Wr4Sw5zQWlGAFFiUjlWFcCxNA8fTOOtqBefS0TnW/jBZkMOGATTArZfFczznNsQms1sZjrFr8mqQJiZwK6BYAcR+/mlwExBncKFUQ/KFyM0BGHi93daALXrHcTk52DXRCnAny/QxXVqD4dForlfuEwqmrGqKLjysO/BIlM/vIkzqx4/cBbn6V2Vc+C9iKzM/lnfrKB5JxcHpKtJYyI1YJ6ihtxIutQ3D
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB6641.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(39860400002)(366004)(396003)(376002)(346002)(451199021)(66476007)(66556008)(66946007)(316002)(6916009)(4326008)(2616005)(83380400001)(52116002)(6486002)(478600001)(8676002)(8936002)(41300700001)(38350700002)(38100700002)(6666004)(2906002)(5660300002)(26005)(107886003)(6512007)(1076003)(186003)(6506007)(86362001)(103116003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?mA/TNBgK1QgiPKc7J7Yu7U/fuNx64dMfYRon6IN9kxdR33OViT7+0KyfT7Ve?=
 =?us-ascii?Q?heXhLQY2+gA9My0M3RwWVlaEp+SETKC1bTb4Tt3dQHnSvjDkxRJX0ERyiSut?=
 =?us-ascii?Q?WzoT8ET9XqPBGdniDoFiKp0cHGime+EWuF5scFks71yitkc+LrQJwbnJcVCw?=
 =?us-ascii?Q?JU3LdQpdTilVTTf7zJJqtGDuwuZigYNOouAE4LwJLeOFiuNlJi8UZ8am9M5H?=
 =?us-ascii?Q?8lpwEvmlBpHMX07p4RmdmWuOet66Zg3RuBWYvCFhJlmZ3t87uwO5wa/79N2N?=
 =?us-ascii?Q?E/r8uReO8h9xjzK4ewhOP2mLc5aOxuJ2y/FZm74MLLe3+Sbdik+Mu0nX2Irl?=
 =?us-ascii?Q?SBLzmFN06cHpy6szlpR5Qv8wAhgK20dBIijeD07Qwu2RV21o3Psq2WteoV3P?=
 =?us-ascii?Q?tp1x/g0BDxSJmZ2bDOQ8Zpn+/o2izRbrNUP87o4uxfHZtR/CP63dAKwK0od8?=
 =?us-ascii?Q?SH3VQWkSIqM2O0UWN9vqmfQHLDDFwNMIWYsDZ4oBMqaGBE8i3GDdiU/1i79G?=
 =?us-ascii?Q?FdeQxyC5awKE7mbLwelHxLyWMJW0sGxFU7gKzkHofvIYHOr705A3yOals8y4?=
 =?us-ascii?Q?tUeMiiZcLvYW9JP2kT0OqHtyFfVlaVheg87QNKQmpu3ImH3uyOnAaJkFQRzS?=
 =?us-ascii?Q?UhaX1j5ZLvYwMytTSjy7/YJOyP0Dh712vBfLMhfqT1Il6EIlvw1+qKVaBluX?=
 =?us-ascii?Q?Z9t5lJsCFasF0HVXDwFzWyMgGBjSVb1YXVdrQ9j+3ySr74dmSySMsX1y+rGN?=
 =?us-ascii?Q?32lMhPWziunY4q3jKqg2n1gHvCG+8od8zilLA3pPpScer6s0UYRZbYQvX3GU?=
 =?us-ascii?Q?Acawt0KK5qBuH9OHGvAoeH4xGjUubilq/XcSCWW6VGtnERTryTgaG35w72Np?=
 =?us-ascii?Q?Rzac69b/AbjEXiRqufgGHk5pmMfVOH7PI1fCqc3A6Rxus3VAVXifvJRqM5rj?=
 =?us-ascii?Q?nyR+2Uzwguk6/9sqbTGDm7bzYJDyi6djxXLF//2nnLWfRcXZP5I+1O2KGvVS?=
 =?us-ascii?Q?Wuc/Y+iBmWPkyfuh1YTH3XRPEzYlWd+0E28ZApi0hEMtUcpi9oFptHcICGLM?=
 =?us-ascii?Q?FNi2ciiOBiW0qKeRCttZ/b7nBEhxfGeW/Jb27c3loz7NNnljbimGuvoN9Hn6?=
 =?us-ascii?Q?D3ybll6LMBUDHc/aWiqFUQM/cumhVj/wPiML75vTX/RrcB8a3wlL/nMIDNfU?=
 =?us-ascii?Q?x+Qej4EsaV9Wb8qM7e3tma9ZAD74ud5Lx9XKQSxzFYPc9vthC1HmDCqaldlC?=
 =?us-ascii?Q?tHe5gEM9Uehxn2Al+OghD1j75HeKdjkwaHBU6U4/PqHSWaJHRJcxiVNknDCw?=
 =?us-ascii?Q?EFqxK0T4glikpAIYMIsx8nLmREyvTF4aoSsz2cdPPsbDdHnZnWv/FffW4d8h?=
 =?us-ascii?Q?NNLu5FA4iRV0LkgKoLdKJ3yZl5L9j1dV5AYDk9TZIhYpNpxx3TvQL9OcBbVD?=
 =?us-ascii?Q?UcbJYxDq4qw2jfUpGg38ocpJVHmjpMZ278d2u+sqGIm23ModWMw7IlNix+47?=
 =?us-ascii?Q?9S+jtMQpZOyI+6B7xZEAeikOOffb1vVVFRenhmguBugjKR6LucmD3NFJnYNe?=
 =?us-ascii?Q?RKiTc7K+GSokPm/goUPKfi6yIahgW27S48KI1DZuzCrs4PhtrZ5ttakTU/bj?=
 =?us-ascii?Q?UQ=3D=3D?=
X-OriginatorOrg: dm.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 ae1ae7ca-d0ad-4ada-74e7-08db3bc8a193
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB6641.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2023 02:41:50.9679
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 mDgDbnCU7pQVoPjIt6jPeYTrp7uU2L5bohrlXtcWkoe3PZbbbO0il/mxY2JgaZxrPF7GIK/l0x6/q5i6EEEiJ60cMNRUy0VFQShLmW5zEZQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB9615
Message-ID-Hash: UIXC2CQZ2T5PWQSBTWTGAQ5VZBZPIJTP
X-Message-ID-Hash: UIXC2CQZ2T5PWQSBTWTGAQ5VZBZPIJTP
X-MailFrom: David.Rau.opensource@dm.renesas.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: support.opensource@diasemi.com, lgirdwood@gmail.com, tiwai@suse.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 bailideng@google.com, groeck@google.com,
 David Rau <David.Rau.opensource@dm.renesas.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UIXC2CQZ2T5PWQSBTWTGAQ5VZBZPIJTP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

- Configure the default gound switch delay time before enabling IRQ
  to avoid the unexpected delay time is set up
- Apply DA7219 AAD own work queue to handle AAD events
- Replace msleep with queue_delayed_work to have better relability

This commit improves the control of ground switches in AAD IRQ

Signed-off-by: David Rau <David.Rau.opensource@dm.renesas.com>
---
 sound/soc/codecs/da7219-aad.c | 60 +++++++++++++++++------------------
 sound/soc/codecs/da7219-aad.h |  5 ++-
 2 files changed, 31 insertions(+), 34 deletions(-)

diff --git a/sound/soc/codecs/da7219-aad.c b/sound/soc/codecs/da7219-aad.c
index e3d398b8f54e..993a0d00bc48 100644
--- a/sound/soc/codecs/da7219-aad.c
+++ b/sound/soc/codecs/da7219-aad.c
@@ -342,36 +342,17 @@ static void da7219_aad_hptest_work(struct work_struct *work)
 static void da7219_aad_jack_det_work(struct work_struct *work)
 {
 	struct da7219_aad_priv *da7219_aad =
-		container_of(work, struct da7219_aad_priv, jack_det_work);
+		container_of(work, struct da7219_aad_priv, jack_det_work.work);
 	struct snd_soc_component *component = da7219_aad->component;
-	u8 srm_st;
 
-	mutex_lock(&da7219_aad->jack_det_mutex);
-
-	srm_st = snd_soc_component_read(component, DA7219_PLL_SRM_STS) & DA7219_PLL_SRM_STS_MCLK;
-	msleep(da7219_aad->gnd_switch_delay * ((srm_st == 0x0) ? 2 : 1) - 4);
 	/* Enable ground switch */
 	snd_soc_component_update_bits(component, 0xFB, 0x01, 0x01);
-
-	mutex_unlock(&da7219_aad->jack_det_mutex);
 }
 
-
 /*
  * IRQ
  */
 
-static irqreturn_t da7219_aad_pre_irq_thread(int irq, void *data)
-{
-
-	struct da7219_aad_priv *da7219_aad = data;
-
-	if (!da7219_aad->jack_inserted)
-		schedule_work(&da7219_aad->jack_det_work);
-
-	return IRQ_WAKE_THREAD;
-}
-
 static irqreturn_t da7219_aad_irq_thread(int irq, void *data)
 {
 	struct da7219_aad_priv *da7219_aad = data;
@@ -392,6 +373,18 @@ static irqreturn_t da7219_aad_irq_thread(int irq, void *data)
 	/* Read status register for jack insertion & type status */
 	statusa = snd_soc_component_read(component, DA7219_ACCDET_STATUS_A);
 
+	if (events[DA7219_AAD_IRQ_REG_A] & DA7219_E_JACK_INSERTED_MASK) {
+		u8 srm_st;
+		int delay = 0;
+
+		srm_st = snd_soc_component_read(component,
+					DA7219_PLL_SRM_STS) & DA7219_PLL_SRM_STS_MCLK;
+		delay = (da7219_aad->gnd_switch_delay * ((srm_st == 0x0) ? 2 : 1) - 2);
+		queue_delayed_work(da7219_aad->aad_wq,
+							&da7219_aad->jack_det_work,
+							msecs_to_jiffies(delay));
+	}
+
 	/* Clear events */
 	regmap_bulk_write(da7219->regmap, DA7219_ACCDET_IRQ_EVENT_A,
 			  events, DA7219_AAD_IRQ_REG_MAX);
@@ -400,9 +393,6 @@ static irqreturn_t da7219_aad_irq_thread(int irq, void *data)
 		events[DA7219_AAD_IRQ_REG_A], events[DA7219_AAD_IRQ_REG_B],
 		statusa);
 
-	if (!da7219_aad->jack_inserted)
-		cancel_work_sync(&da7219_aad->jack_det_work);
-
 	if (statusa & DA7219_JACK_INSERTION_STS_MASK) {
 		/* Jack Insertion */
 		if (events[DA7219_AAD_IRQ_REG_A] &
@@ -430,9 +420,9 @@ static irqreturn_t da7219_aad_irq_thread(int irq, void *data)
 			if (statusa & DA7219_JACK_TYPE_STS_MASK) {
 				report |= SND_JACK_HEADSET;
 				mask |=	SND_JACK_HEADSET | SND_JACK_LINEOUT;
-				schedule_work(&da7219_aad->btn_det_work);
+				queue_work(da7219_aad->aad_wq, &da7219_aad->btn_det_work);
 			} else {
-				schedule_work(&da7219_aad->hptest_work);
+				queue_work(da7219_aad->aad_wq, &da7219_aad->hptest_work);
 			}
 		}
 
@@ -465,6 +455,7 @@ static irqreturn_t da7219_aad_irq_thread(int irq, void *data)
 			da7219_aad->jack_inserted = false;
 
 			/* Cancel any pending work */
+			cancel_delayed_work_sync(&da7219_aad->jack_det_work);
 			cancel_work_sync(&da7219_aad->btn_det_work);
 			cancel_work_sync(&da7219_aad->hptest_work);
 
@@ -964,13 +955,19 @@ int da7219_aad_init(struct snd_soc_component *component)
 	snd_soc_component_update_bits(component, DA7219_ACCDET_CONFIG_1,
 			    DA7219_BUTTON_CONFIG_MASK, 0);
 
+	da7219_aad_handle_gnd_switch_time(component);
+
+	da7219_aad->aad_wq = create_singlethread_workqueue("da7219-aad");
+	if (!da7219_aad->aad_wq) {
+		dev_err(component->dev, "Failed to create aad workqueue\n");
+		return -ENOMEM;
+	}
+
+	INIT_DELAYED_WORK(&da7219_aad->jack_det_work, da7219_aad_jack_det_work);
 	INIT_WORK(&da7219_aad->btn_det_work, da7219_aad_btn_det_work);
 	INIT_WORK(&da7219_aad->hptest_work, da7219_aad_hptest_work);
-	INIT_WORK(&da7219_aad->jack_det_work, da7219_aad_jack_det_work);
-
-	mutex_init(&da7219_aad->jack_det_mutex);
 
-	ret = request_threaded_irq(da7219_aad->irq, da7219_aad_pre_irq_thread,
+	ret = request_threaded_irq(da7219_aad->irq, NULL,
 				   da7219_aad_irq_thread,
 				   IRQF_TRIGGER_LOW | IRQF_ONESHOT,
 				   "da7219-aad", da7219_aad);
@@ -984,8 +981,6 @@ int da7219_aad_init(struct snd_soc_component *component)
 	regmap_bulk_write(da7219->regmap, DA7219_ACCDET_IRQ_MASK_A,
 			  &mask, DA7219_AAD_IRQ_REG_MAX);
 
-	da7219_aad_handle_gnd_switch_time(component);
-
 	return 0;
 }
 
@@ -1002,8 +997,10 @@ void da7219_aad_exit(struct snd_soc_component *component)
 
 	free_irq(da7219_aad->irq, da7219_aad);
 
+	cancel_delayed_work_sync(&da7219_aad->jack_det_work);
 	cancel_work_sync(&da7219_aad->btn_det_work);
 	cancel_work_sync(&da7219_aad->hptest_work);
+	destroy_workqueue(da7219_aad->aad_wq);
 }
 
 /*
@@ -1031,4 +1028,5 @@ int da7219_aad_probe(struct i2c_client *i2c)
 
 MODULE_DESCRIPTION("ASoC DA7219 AAD Driver");
 MODULE_AUTHOR("Adam Thomson <Adam.Thomson.Opensource@diasemi.com>");
+MODULE_AUTHOR("David Rau <David.Rau.opensource@dm.renesas.com>");
 MODULE_LICENSE("GPL");
diff --git a/sound/soc/codecs/da7219-aad.h b/sound/soc/codecs/da7219-aad.h
index be87ee47edde..fbfbf3e67918 100644
--- a/sound/soc/codecs/da7219-aad.h
+++ b/sound/soc/codecs/da7219-aad.h
@@ -197,9 +197,8 @@ struct da7219_aad_priv {
 
 	struct work_struct btn_det_work;
 	struct work_struct hptest_work;
-	struct work_struct jack_det_work;
-
-	struct mutex  jack_det_mutex;
+	struct delayed_work jack_det_work;
+	struct workqueue_struct *aad_wq;
 
 	struct snd_soc_jack *jack;
 	bool micbias_resume_enable;
-- 
2.17.1

