Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BF797AE609
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Sep 2023 08:35:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 48324EEC;
	Tue, 26 Sep 2023 08:35:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 48324EEC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695710157;
	bh=82xofIYd5o+WpoSLani/R9AQGFOPNRAoZ9g4wzOarLI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LmIsLaa/ndPcW8Gyu7nIucp92xBX/cKp1DcFDqqNXFUcZNB7IP1tqFkaKOAnE1r+q
	 YRe+r4ldP4ceK2Mfj4XmV5P96I/OFbXV+zFOprYiCYXGYUEixZ26QbyW5RUMPdW+EK
	 fmQZm5X2jtNFNeyfUqDfczTX4Ocyf1K4VvjvTFLA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 52C0BF80621; Tue, 26 Sep 2023 08:27:07 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C8F83F80618;
	Tue, 26 Sep 2023 08:27:06 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A96CCF80768; Tue, 26 Sep 2023 08:27:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20707.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::707])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 70A83F80614
	for <alsa-devel@alsa-project.org>; Tue, 26 Sep 2023 08:27:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 70A83F80614
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=p4EP6i7u
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FaE6NRq7Ct4R2DSQuk+wW+s4IzAw/QwYeeYWvPBFC/6G9AJnG/Lsjnl1oosZp8yJqPDdAQ2CkIy20P7ig27XV/kJWHT3WNvdHsCGJA0Ts3HmU8geT3399iYMcYTMWs06THaOQ3avukxBJsv833uF4ymyt60p+9/XzL5cbKdBroUpJYxZjZwVkr4/MZZ/k2JTXEHNCDZcuPxu5WCNGba7AugBdmRwGuCf0C5KGSIqbFQ9ayQ/O3LxWDuyS3vFNwju14izhVAhhlRiVp6kEGguBPQrpbJDZoTt1s8SBRdoWq8F0LzuNh/R1VCv9htvefb1WKbomPOOzO58OYQ4eiRjSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=auD6hv+BQvoVmPLvC3C1Tl3oe3cFYZpE2qtcQoHgC4A=;
 b=TXoboTVVB60d2goakUw3dWWYpUeNjB/gC0RL34dpKp1eIDBaNeyAwBta93DRYbeD1hcAf6X+u52xK4o2YRaKlVJGgoi1fAjHiXahyEELlW4qQf8xIT8f50Rfmx8Jb5PJfMD9Hb9PoZu2VIjSSCce0m+f3v04FuAXTbn9y0m2ArhxZG8en2FZ2GU8hto++33RX0NvNP7nCZHW0fhcClhSCLz/TcYZq5w/fsonpLZbj8UZPXsXmPmP/EbRu6sWKQZb5PX8i1Y7NkTFZzaA6IEQqqZvjpNoiZk4deBTzpt9omUdYJ7wwiPMvgtGMNp+OFqcGo7SEsaVdCML3+JRckh39g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=auD6hv+BQvoVmPLvC3C1Tl3oe3cFYZpE2qtcQoHgC4A=;
 b=p4EP6i7uEfT8eFPyyobmGQaA8zoQNY9vRkkNi0OgKRTjHRW11C0AmxJGCxBalExVH+Q0Upnwj3q9BkKdXqFcOAnwUbhSiiyvQxDWxR/jYVDaGQw/UDGmoGWen4kQccxYkWEqiveF4by7iQl3G6AHBCKS8W7GnYSCV4K7vYj/CSQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS3PR01MB10043.jpnprd01.prod.outlook.com (2603:1096:604:1e6::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Tue, 26 Sep
 2023 06:26:54 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c%6]) with mapi id 15.20.6813.027; Tue, 26 Sep 2023
 06:26:54 +0000
Message-ID: <87bkdpfo0i.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
Subject: [PATCH v2 52/54] ASoC: soc-component: convert not to use asoc_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
In-Reply-To: <87edilihhg.wl-kuninori.morimoto.gx@renesas.com>
References: <87edilihhg.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 26 Sep 2023 06:26:54 +0000
X-ClientProxiedBy: TYCP286CA0001.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:26c::7) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS3PR01MB10043:EE_
X-MS-Office365-Filtering-Correlation-Id: b4b89c66-eac0-40c6-f02d-08dbbe5993c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	mbfTOOEWPehjYnDrtHztpumqLGFRqXEtZ1aHd9F1Sd7CwM+dp6oVqbIHODhb0yqTkoONhvlOr9lwNefr/MDuncIZTR8+Hv1qLgS7qYl1j+DH4sqKgjgseu7yDXfqAQR38DLxM7Gh+knnYqVj9HW3g5vNLMNRVcQgD26HKCsqsYG+V3EAPUJwbJibeNeazWOUYk3h9Jiine5cD8qtiqDdTh0XN7j3So0Xq2ZxfKxTAxqJBmGsIm2xFkMvdN1s6DN1nKC7PPiplH18Exzli4RkeY5CUg4Yi0JsXdydyMBpnRIonb8B5g3FIRcNCu6riq1cJP8aB6dTOM7SsbCKujbcrTKmHXfzS6G4d5oiYZWzverTLXD2EDcOI+f4i1zCODhTPrj/gC9rhzpE/X6CklMaWfebt0aFvB6XhP7yrcQzTE5v1lZCgaTE7/1I4WRphqpCjfpEoZGe/apR4V/BFW6D8X8wDsl2B1WL5kmmpS4B4CO8HirRogB7YVaXXr3IFDxjMppWaePi/nXKWPeD+Ukcg+jqKuKgFfS3dfEWMP/hm3l/AqQdyNvnhOBu/jPhAXXXSeYrTxS3puEUOvdoOG52SEeNOWcsfH2X/auktEY7BSMk0AgctP8/nYC+VaB6DSBAZSchYqgVuoX7dWH357k7Ag==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(39860400002)(396003)(376002)(346002)(136003)(230922051799003)(451199024)(1800799009)(186009)(2906002)(110136005)(66556008)(66946007)(66476007)(316002)(4326008)(8936002)(8676002)(41300700001)(5660300002)(2616005)(26005)(83380400001)(36756003)(86362001)(38100700002)(38350700002)(6506007)(6486002)(6512007)(52116002)(478600001)(21314003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?1cPmNGGHgkfsyKES31cJ9fWtVOo/sAFij6ZKgu2ggD9RHC3dpV7o1ldNjX3s?=
 =?us-ascii?Q?wXJ/g4BG91ahDaE7kJv4S+OvCy7BoM5PnlSMXuWP6n7ZiBoa00F9eAa1DV34?=
 =?us-ascii?Q?0JNJPK61rmkMfX+MSOayhY1mdteDAYc9f2bRzq6yR8bu80BVgdLs08LBML31?=
 =?us-ascii?Q?THq3NsMDt/bpV2Z8nQlapvUXkV19idDQw7287LziPXATXBjmADZEO8CT8CdR?=
 =?us-ascii?Q?0FrLvJX3jFGYA1ejGA8EZYlSKlzQn/6KUX6aQyIkmf9q1ym7QzXQ5mB5KTMY?=
 =?us-ascii?Q?r20K8GQaqYfs2lV85RmXJXW7EuXpQZ0H2/b5aQrpif8WNC9VaPWz9WS1iMFp?=
 =?us-ascii?Q?DXdnO5UYIhB+8Xcj5lgMUp8wZYVgyRePdexdyRijiP9FuEdhpAbaW8wOszgx?=
 =?us-ascii?Q?2h2sKEGcoGgHhJPSs+wqZQDjNbrJGR3otpTKnKkhYBH/mffJ1wz57MFSfvB/?=
 =?us-ascii?Q?JEWXoiYT5hLfxdLMF+8mUNKaBuz9A8j3AquEKSUIs/HqJ8ybd61QWYsiA9D/?=
 =?us-ascii?Q?QKpcwKaNIethO7bZXj1yvO4aUQsxhsR/AWx0mIcl7/CVBwSAgvirxopc3hh9?=
 =?us-ascii?Q?yU+uQ+grxvkZXxBGStjKLo6rdqTaVmHeZ5ifsIhxy/r9F9pSXJ8xjE/gGkLJ?=
 =?us-ascii?Q?siDOHryQixp9NIyftvVo68vmlwMn0xsz+3fJDh8r00HHGjSs0O/y0FmmovAU?=
 =?us-ascii?Q?8DDqTEVetQgxfMSWKlKcovPCaB0SL3vNOWtRgdXH3n+zN8prpIzFZf1BEVKb?=
 =?us-ascii?Q?eWc8FKKFKX603hQk3cqcpcCBODmvOihUExT+8ZW+NwQ7V8MbMTuDwDHc7bHD?=
 =?us-ascii?Q?y39FD/tJL9bYAPCZPQMe79TTz7R9DcqR41Ufk6DfwGSjdqQap1+oaIA059Xo?=
 =?us-ascii?Q?e532AibzQs2kH11lt1fcNIb/UUJeYKgYL+cx24g55cup7RBqF3j65f0f3t+s?=
 =?us-ascii?Q?o4PPBLbm/AE9lV1qIAONKCh6lgiiUuFWRvCX0qvqVjfgzIcxli125MFa5wrP?=
 =?us-ascii?Q?p+m6jbJThQFsDFFlTqYum/leBDspAr87Cv7cY/1NZb2PMu5p5XeGIfL+Wwbu?=
 =?us-ascii?Q?btksZrOWnjJ4hCKQ9z7dtv4KxSlc9QQaTj81pdxzyorbTDdVAW3js7/nw6IY?=
 =?us-ascii?Q?duBa5ocW80nJhTOSAH2oZgFpC4R/5p6hnAE8/W3J83zAOewrNYj3dJhA5+M/?=
 =?us-ascii?Q?FzLfEFMlP7EMGWTu38b8PGkhXypoVUamG1cjpRR/WROAcaGfGsxfcE6JFWrC?=
 =?us-ascii?Q?vN693bqtKpSpZSVvfUeAOYUPeztjpu1N9yhGbC1lGR1bhCvO7SILOeiCzijS?=
 =?us-ascii?Q?KEtSfHcLbTJZwR2HgkihVg9wSstQPVGXSZXUU0De/29GSn/DaQDSnGPuJIFN?=
 =?us-ascii?Q?3+C8FwGr+oBZQD7dq8cASTNEpjoGG20EQM3LiphbIgNlQJgyC/Nyee+3aaky?=
 =?us-ascii?Q?aQZkZl8Z7kMQgE94j6Vz1XhX5LfUr5liqmBN/0awxJaPyCmO9U7sG1sXHlDx?=
 =?us-ascii?Q?HSpEjsjV83ZNIeilBV6cyd7evdksEFHmyN3TtG7nV84bCzG/70dJ0tblScsB?=
 =?us-ascii?Q?RLNVCKNXoWMsVBtel0JCHxp/r6X1mdX6pwWspS6tcXXtVaYOvywOQb7CLqJ1?=
 =?us-ascii?Q?C2AnidZ/oBoL2Jul6okMeKg=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 b4b89c66-eac0-40c6-f02d-08dbbe5993c8
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2023 06:26:54.4724
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 8m7+TpldZP7ld0dw5W2Of9pSqEBhMHAmZ7aLQZnuZxjXU6t8Hu/4jNNP6GX4yE14XF8HS0vgaeNQnBKr9PMDm6FtEC5hJOttPN7f9jSVMsx7osKVcQbsbtRazhtrr6Hb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB10043
Message-ID-Hash: C7PVFEOH555SEAARONNQJUYCZLOH7QZO
X-Message-ID-Hash: C7PVFEOH555SEAARONNQJUYCZLOH7QZO
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/C7PVFEOH555SEAARONNQJUYCZLOH7QZO/>
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
 sound/soc/soc-component.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
index ba7c0ae82e00..69198de39e79 100644
--- a/sound/soc/soc-component.c
+++ b/sound/soc/soc-component.c
@@ -962,7 +962,7 @@ EXPORT_SYMBOL_GPL(snd_soc_component_test_bits);
 
 int snd_soc_pcm_component_pointer(struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_component *component;
 	int i;
 
@@ -992,7 +992,7 @@ void snd_soc_pcm_component_delay(struct snd_pcm_substream *substream,
 				 snd_pcm_sframes_t *cpu_delay,
 				 snd_pcm_sframes_t *codec_delay)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_component *component;
 	snd_pcm_sframes_t delay;
 	int i;
@@ -1019,7 +1019,7 @@ void snd_soc_pcm_component_delay(struct snd_pcm_substream *substream,
 int snd_soc_pcm_component_ioctl(struct snd_pcm_substream *substream,
 				unsigned int cmd, void *arg)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_component *component;
 	int i;
 
@@ -1036,7 +1036,7 @@ int snd_soc_pcm_component_ioctl(struct snd_pcm_substream *substream,
 
 int snd_soc_pcm_component_sync_stop(struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_component *component;
 	int i, ret;
 
@@ -1056,7 +1056,7 @@ int snd_soc_pcm_component_copy(struct snd_pcm_substream *substream,
 			       int channel, unsigned long pos,
 			       struct iov_iter *iter, unsigned long bytes)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_component *component;
 	int i;
 
@@ -1073,7 +1073,7 @@ int snd_soc_pcm_component_copy(struct snd_pcm_substream *substream,
 struct page *snd_soc_pcm_component_page(struct snd_pcm_substream *substream,
 					unsigned long offset)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_component *component;
 	struct page *page;
 	int i;
@@ -1094,7 +1094,7 @@ struct page *snd_soc_pcm_component_page(struct snd_pcm_substream *substream,
 int snd_soc_pcm_component_mmap(struct snd_pcm_substream *substream,
 			       struct vm_area_struct *vma)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_component *component;
 	int i;
 
@@ -1141,7 +1141,7 @@ void snd_soc_pcm_component_free(struct snd_soc_pcm_runtime *rtd)
 
 int snd_soc_pcm_component_prepare(struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_component *component;
 	int i, ret;
 
@@ -1159,7 +1159,7 @@ int snd_soc_pcm_component_prepare(struct snd_pcm_substream *substream)
 int snd_soc_pcm_component_hw_params(struct snd_pcm_substream *substream,
 				    struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_component *component;
 	int i, ret;
 
@@ -1180,7 +1180,7 @@ int snd_soc_pcm_component_hw_params(struct snd_pcm_substream *substream,
 void snd_soc_pcm_component_hw_free(struct snd_pcm_substream *substream,
 				   int rollback)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_component *component;
 	int i, ret;
 
@@ -1214,7 +1214,7 @@ static int soc_component_trigger(struct snd_soc_component *component,
 int snd_soc_pcm_component_trigger(struct snd_pcm_substream *substream,
 				  int cmd, int rollback)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_component *component;
 	int i, r, ret = 0;
 
@@ -1285,7 +1285,7 @@ void snd_soc_pcm_component_pm_runtime_put(struct snd_soc_pcm_runtime *rtd,
 
 int snd_soc_pcm_component_ack(struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_component *component;
 	int i;
 
-- 
2.25.1

