Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BEF7179B154
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Sep 2023 01:51:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CEF39E0E;
	Tue, 12 Sep 2023 01:51:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CEF39E0E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694476311;
	bh=adOXuiv+aiNDhRqt57ZwKXgQ8u8PsVpo6Xx0LtJhTj0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=op79ZdGwfgIl07efqB118bi6KN6cd3li7BilH6wyvVtQ0MMIoqW+hzHkkZhAEl9hy
	 SdcjjyJZERWPGAJHopMvY3hGo7L2i11jtYJlsKgbvzOwzA8H/fFFZ2e/7XPhXC7rua
	 BlCSOhqVk7/qxZeLmeKr6H1dnMg95cYrKbHYtZkI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E6C58F80603; Tue, 12 Sep 2023 01:48:39 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E37EDF80603;
	Tue, 12 Sep 2023 01:48:38 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 72019F805F5; Tue, 12 Sep 2023 01:48:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20720.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::720])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 45804F805A1
	for <alsa-devel@alsa-project.org>; Tue, 12 Sep 2023 01:48:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 45804F805A1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=I6Jmr/qu
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gCA9SnG3Zz4p2leM1LFpwTYKOYXdCVBWMhNafI54aw9pEUQsLCPxeYrbo64AA2cWT5YVtghvEh32DvjkGUfrbikGFU0lOEbXxhVe0aUWubDYAAiSxfhpZ7SUfG4KLWS9jDVJfTBPgYSLhg5x/QPu5i9q2gD5k0AsGJrqOasyYE4DmwizzZsNFV4JBxGJHLGSaTz65uOpYorU5ZMB2P0v0auLB2Ionv9FA/l4YgsUDaAi/V9iOgXDpQx13xijkUBfVWyGP1iE3wC7mb3Z4sL49YUDOKE0212nYxDvJy7WW2eqIDDOWFnEnkEhoVs5ocC941CVM9wzeyeY48ZWj5LJ8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yYE6XvI5GtniFhYdrcy1Vb48EScrcyHPrEvV2pZ/KP0=;
 b=fAMYSELRQSJ/z1Fco2VgSWvyqG1jghWZmJBkH6WLH+mwT38zpUkPeys9AKbxE237QKwF9502P8aQNBc2jv8mcHGXW2fggdrDUbU45EqYJ3f1WmzFhdZrtDvbRiwI0P4+MYGesR+uZZWro+JwuBd5mTbOZGMKqcT4TbQDCUj6Oh+s2hWLSqOm2BG7HTOvZMgzPoc7hC26X8riEGsmyJ0y5BAXk4I/cYHfefDJd62qnv4uyEN69cO4Y3KPy8gpdakahAVnaKt6nHVmtYpDzW8iUnjo8BXp28ArScS2I28LaWfZCa0mbDSs7k/NFW5pA10YXbK/0EXlLxwdAKNfLsbxhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yYE6XvI5GtniFhYdrcy1Vb48EScrcyHPrEvV2pZ/KP0=;
 b=I6Jmr/quMaWw6BRNsOSZPN4ERDx3hAjiR2XFQEfHkadgKvTqWaefiB46G7Upl0foQMp6oydbjezQJIJZqDhuxNbsb8BzsDugSPwcEorKuLMoHA0YSkHLu77Sq1yCfNqa+l4LKLEUhzrtI+UTYg+6D8Yj8BcrL8SQT3cCjdP2lE4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB6192.jpnprd01.prod.outlook.com (2603:1096:400:4b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.37; Mon, 11 Sep
 2023 23:48:28 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8c08:d94c:8e54:9b5d]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8c08:d94c:8e54:9b5d%6]) with mapi id 15.20.6768.036; Mon, 11 Sep 2023
 23:48:28 +0000
Message-ID: <87y1hcqnjo.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
 Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Olivier Moysan <olivier.moysan@foss.st.com>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
Subject: [PATCH 13/54] ASoC: stm: convert not to use asoc_xxx()
In-Reply-To: <87h6o0s275.wl-kuninori.morimoto.gx@renesas.com>
References: <87h6o0s275.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 11 Sep 2023 23:48:27 +0000
X-ClientProxiedBy: TYCPR01CA0040.jpnprd01.prod.outlook.com
 (2603:1096:405:1::28) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB6192:EE_
X-MS-Office365-Filtering-Correlation-Id: 247a98b6-965a-428d-26b2-08dbb32198cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	YEsbPcjvsq7usJlYuwGOJl99/+Z7tMt0H6rPNQ+ArybAmbxKemyEeGNH3la5FLJJafDnog64E+8opEk5kEQ9PWgNJdZYUWIqxKqPPdzinnPIl5zAxGpInATCCcPc3xlU9Q9NcSzVTK3hju1c758J9sQ99OEWFJ0So6jEgwMrugflACRQNmabzy+pBXi/Ljl6QzWevXbezGNNJk1n2hfpRpOZRdSQyDB1zWun24GIA06R1fVf5qYatXzdcv3UZ9I1690pZvuD+mb6Xq6Z0R0yfOdJSY1OZuq1sdtZViiO5ThRjrIsnFdY7J4+b7QdcC70eQS15e7jdK5kMuTor4klgIohApL839FPJjqVBNgkd+qPXmBW54sHWu13XquJbx9Q9/pheOq4CIVnPLVqxOowNTe+EVtSaBO/NDBITwMwQdqvF0CzQ4+i1FYqDUVJtGUjOe3g73oGpLeEPMhBsgkbZxP4e3/RBimtiCESxCM04MpUTGLw8CH73iA1zkg8w+nNBKsckLD/LrO4L1x/+1WVLPsgESsa4Prb0pUrriHmJtbq6FXMgcaUQWxwQvceJi1iltkyi8jfxDQzKgWtPf5VKryL5SplVN6mZnvpG3xW45/en2ZgHo8vMFxRTtxBjLtGRcxGqYrdStMa4fX5uOv3WA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(396003)(366004)(376002)(136003)(39860400002)(1800799009)(186009)(451199024)(6506007)(6486002)(52116002)(6512007)(478600001)(83380400001)(2616005)(26005)(2906002)(66946007)(66476007)(66556008)(4326008)(5660300002)(316002)(110136005)(41300700001)(8936002)(8676002)(86362001)(36756003)(38100700002)(38350700002)(21314003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?s6auR+ciB8fUN9oWZqtZXYWLvygHKxjqly+xPhF5kv2UtOn5854p/99I3hHG?=
 =?us-ascii?Q?T4DzgOqeq5jCBp3ijCyLy122lAPyc5WWl7wY5DGmEmtU+yt5Ad4kLYiYzYWQ?=
 =?us-ascii?Q?KWn6UlMJWP4c8WY43aYRo+HdCHZpkKCvlfXnnnOJ3A9QC3JOYNTcRUiF1FEG?=
 =?us-ascii?Q?mxiSPe2lc3oSQqbvrj3GPjFN4z0hWzeLuaJwkqud10NbXZ4yXKfp3DP810Gr?=
 =?us-ascii?Q?I2D1ZidAzwkfRKFYPmz/kiTTe0JWr2JcnU4bwnmirmAx/6+tmCCLgC7ZkEPl?=
 =?us-ascii?Q?GHIgzqyejyexVOV6OZy/N9hcFk4Bi0H2Or/akg6P5fXkN2zYSrfV20ci/1Go?=
 =?us-ascii?Q?mO9Y5Deea/5bTqwsjPTJIQT5uzIfqA8IcIs+TZQ96uhilJt67IOsnKEBYeow?=
 =?us-ascii?Q?AgnXwyWoGZc1cYwA98JC23emYsTvGnmJ1B+O8hKruHRv4M8JgAzQWDvb1DpR?=
 =?us-ascii?Q?H5JK1RoEZXL3KZljgo+YVn2A996mgbyT9uPygnQurg+M/yELWUMzzOnwFcSx?=
 =?us-ascii?Q?yx9yTKjbXGkXHsPZYQsewsWDuUXxykuZdreBehHmj0k3OQX+1Hu7oCneGcrN?=
 =?us-ascii?Q?SQ9nQI21Cv8CgJ56zfO/irIk6TuZ2+eSxtWPxWp6VPXbAPY81joiaWjpAP8b?=
 =?us-ascii?Q?W2d0NzMORBuw3GB1hk3X5oKrPheG2itCu6fS5LRm474tsOwFe/7iUPMI2wkT?=
 =?us-ascii?Q?8AuV33Mv6Q20GSPgyN4TbSiPN1uvHsqL6s908QiPUBehBqkO/1aVPBrVNCWB?=
 =?us-ascii?Q?iaqnK8wjmgu0Q2PXKHx9uquqIV2zJm8od57SyHwDq4NSxxsU3nxPjJfGtN+K?=
 =?us-ascii?Q?Z9RXcvABUmt0BiJ3Gqjuiml7iFZ1prvujCVtVRiCCzYsD5oRj5raXORhfxTm?=
 =?us-ascii?Q?zbCpv1ZPF2Twj5XDbqnHXijMwuWrcUTkMlOhexw2k5vDN5Jg0N2rvtX8H5Ea?=
 =?us-ascii?Q?dWOi4iqRSrfhSSxSMlX7KdcRk+ZFPdXuXOXrRFGFTD5uzTkWGr7KSqHf7MOy?=
 =?us-ascii?Q?fef6hi9xIYO9xSf9N1lpm/uAH6uKDmfb8IzszMRBz9/a/ed5DEkp/XnsYmXs?=
 =?us-ascii?Q?P2uKVDSqU/frJ+mTvQLcNqbQim1B4zkb8y/ZFv6D28pjm2Ptifzcvis4p041?=
 =?us-ascii?Q?GoWyNESYKYIsDwCdF8Y9KdpCrFYreuKBkjuHoMt7OO+59tRAerq/aYg/6eec?=
 =?us-ascii?Q?i3Dqpr0uZ0P2MtYnEyXuIEFid/BzepQSGkPsLi+vPlTv0zIG42PUUStQSMhQ?=
 =?us-ascii?Q?1w2zAfdCYnsldoJ0P6d6Hxq79oYl/AEuxE1zyIx0sSVtH4/pKr/WkwbmfshD?=
 =?us-ascii?Q?QqxjInCCJtEPR5qCcMk+Cqr5RCaaYcnVyNM7kyutC7dSKSks7LokzUolW50x?=
 =?us-ascii?Q?u6IwRxY8NPdo37MkhPTJiIOFJZXoTF493Cg31muiYOVsD1yiYKiPjdk0k3pt?=
 =?us-ascii?Q?gCY+/lEe2cSTWkbq3psNK01EYyOvuuu/m6piRw4u2VnxGk33cZ2EJJUYTqJO?=
 =?us-ascii?Q?qx2N6/kKNEwBBmwQ00jxP+wVkeGDIf3qEbs6mo8d3zrGSBnqNXZ4kVtSzlG5?=
 =?us-ascii?Q?jufHphEo23fMXkHkuPxxowxrGySOIADWWANIX8qXTThR37tut9ICBcHKHw9X?=
 =?us-ascii?Q?Z4rxz6etgQXkNqFhPK8Xtos=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 247a98b6-965a-428d-26b2-08dbb32198cc
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2023 23:48:28.2938
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 9FWC27uYw8WcR6ikYw/g7Iy5gbyJMr3znnrBXxWn0bJS51FxBu04veHV6Bb8EbN4nlb7woG1iwho4KsPvJ2VOIrJVGy3l6Dv0j735hTetbVYBN/hiaKOkyDBAhCh5Sjz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6192
Message-ID-Hash: KDMVF4R2UMH4SRQ7MECEA2ENPE3L2PJ4
X-Message-ID-Hash: KDMVF4R2UMH4SRQ7MECEA2ENPE3L2PJ4
X-MailFrom: kuninori.morimoto.gx@renesas.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KDMVF4R2UMH4SRQ7MECEA2ENPE3L2PJ4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

ASoC is now unified asoc_xxx() into snd_soc_xxx().
This patch convert asoc_xxx() to snd_soc_xxx().

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/stm/stm32_adfsdm.c  | 24 ++++++++++++------------
 sound/soc/stm/stm32_sai_sub.c |  4 ++--
 2 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/sound/soc/stm/stm32_adfsdm.c b/sound/soc/stm/stm32_adfsdm.c
index a8fff73786413..fb5dd9a68bea8 100644
--- a/sound/soc/stm/stm32_adfsdm.c
+++ b/sound/soc/stm/stm32_adfsdm.c
@@ -167,7 +167,7 @@ static void stm32_memcpy_32to16(void *dest, const void *src, size_t n)
 static int stm32_afsdm_pcm_cb(const void *data, size_t size, void *private)
 {
 	struct stm32_adfsdm_priv *priv = private;
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(priv->substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(priv->substream);
 	u8 *pcm_buff = priv->pcm_buff;
 	u8 *src_buff = (u8 *)data;
 	unsigned int old_pos = priv->pos;
@@ -212,9 +212,9 @@ static int stm32_afsdm_pcm_cb(const void *data, size_t size, void *private)
 static int stm32_adfsdm_trigger(struct snd_soc_component *component,
 				struct snd_pcm_substream *substream, int cmd)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct stm32_adfsdm_priv *priv =
-		snd_soc_dai_get_drvdata(asoc_rtd_to_cpu(rtd, 0));
+		snd_soc_dai_get_drvdata(snd_soc_rtd_to_cpu(rtd, 0));
 
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_START:
@@ -233,8 +233,8 @@ static int stm32_adfsdm_trigger(struct snd_soc_component *component,
 static int stm32_adfsdm_pcm_open(struct snd_soc_component *component,
 				 struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct stm32_adfsdm_priv *priv = snd_soc_dai_get_drvdata(asoc_rtd_to_cpu(rtd, 0));
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct stm32_adfsdm_priv *priv = snd_soc_dai_get_drvdata(snd_soc_rtd_to_cpu(rtd, 0));
 	int ret;
 
 	ret =  snd_soc_set_runtime_hwparams(substream, &stm32_adfsdm_pcm_hw);
@@ -247,9 +247,9 @@ static int stm32_adfsdm_pcm_open(struct snd_soc_component *component,
 static int stm32_adfsdm_pcm_close(struct snd_soc_component *component,
 				  struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct stm32_adfsdm_priv *priv =
-		snd_soc_dai_get_drvdata(asoc_rtd_to_cpu(rtd, 0));
+		snd_soc_dai_get_drvdata(snd_soc_rtd_to_cpu(rtd, 0));
 
 	priv->substream = NULL;
 
@@ -260,9 +260,9 @@ static snd_pcm_uframes_t stm32_adfsdm_pcm_pointer(
 					    struct snd_soc_component *component,
 					    struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct stm32_adfsdm_priv *priv =
-		snd_soc_dai_get_drvdata(asoc_rtd_to_cpu(rtd, 0));
+		snd_soc_dai_get_drvdata(snd_soc_rtd_to_cpu(rtd, 0));
 
 	return bytes_to_frames(substream->runtime, priv->pos);
 }
@@ -271,9 +271,9 @@ static int stm32_adfsdm_pcm_hw_params(struct snd_soc_component *component,
 				      struct snd_pcm_substream *substream,
 				      struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct stm32_adfsdm_priv *priv =
-		snd_soc_dai_get_drvdata(asoc_rtd_to_cpu(rtd, 0));
+		snd_soc_dai_get_drvdata(snd_soc_rtd_to_cpu(rtd, 0));
 
 	priv->pcm_buff = substream->runtime->dma_area;
 
@@ -286,7 +286,7 @@ static int stm32_adfsdm_pcm_new(struct snd_soc_component *component,
 {
 	struct snd_pcm *pcm = rtd->pcm;
 	struct stm32_adfsdm_priv *priv =
-		snd_soc_dai_get_drvdata(asoc_rtd_to_cpu(rtd, 0));
+		snd_soc_dai_get_drvdata(snd_soc_rtd_to_cpu(rtd, 0));
 	unsigned int size = DFSDM_MAX_PERIODS * DFSDM_MAX_PERIOD_SIZE;
 
 	snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV,
diff --git a/sound/soc/stm/stm32_sai_sub.c b/sound/soc/stm/stm32_sai_sub.c
index 0acc848c1f004..8bcb98d9b64e6 100644
--- a/sound/soc/stm/stm32_sai_sub.c
+++ b/sound/soc/stm/stm32_sai_sub.c
@@ -1249,8 +1249,8 @@ static int stm32_sai_pcm_process_spdif(struct snd_pcm_substream *substream,
 				       unsigned long bytes)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	struct stm32_sai_sub_data *sai = dev_get_drvdata(cpu_dai->dev);
 	int *ptr = (int *)(runtime->dma_area + hwoff +
 			   channel * (runtime->dma_bytes / runtime->channels));
-- 
2.25.1

