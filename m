Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 500559FDEDC
	for <lists+alsa-devel@lfdr.de>; Sun, 29 Dec 2024 13:57:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E57D46055A;
	Sun, 29 Dec 2024 13:57:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E57D46055A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1735477059;
	bh=U+lFPXKPpGhCF3pIQJ+J2uM9+UEO3/rE6nofsZnRYG0=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=BPvfvU/hkGeftB0TftDAAfHu6HMMTGpKba8KcM3sH3vIWJdLIMcptkmlO0H4Qetaf
	 dNkxQ7uyXWJ64FsQssb/RJDavvsAh1R0wg0ur2sztC9xkgHDHISZwD+JN4qglNjyvX
	 w0kuEzFh0zG8HJIP7pjQ+oMhIamLMkjnlZtMVKFU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 57238F80633; Sun, 29 Dec 2024 13:56:30 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2E128F80631;
	Sun, 29 Dec 2024 13:56:30 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 736D7F80171; Fri, 20 Dec 2024 08:12:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
	FREEMAIL_FROM,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 09E26F80104
	for <alsa-devel@alsa-project.org>; Fri, 20 Dec 2024 08:11:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 09E26F80104
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Z5jbhGB4
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-385eed29d17so794028f8f.0
        for <alsa-devel@alsa-project.org>;
 Thu, 19 Dec 2024 23:11:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734678718; x=1735283518;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qxJg4W4ceRLI3xU0GNrM6kdx1W1KOEHbJ60meRiAmv8=;
        b=Z5jbhGB4cpa66ew2eAi90JkSVGpDBPY5CH4hUi/EitHi5qMta3gQRVKQ2vVc1iV/Et
         vP5j5Auvh0GoKdmFrEL75kIi/Q3o5X9Sh9Pd/tCUwQXrdlwZcY3Thyz/pMpNPl0ln+VS
         /K+UWoNOm/D8wAtl+TkruGqrfy6OV0y+xqUAaNhdWQ27jmfjT1O4YidjTjtmRFttEqpH
         CkCYijlLuIwmZghLxFStC1eZnVjiH+LUAdhVuq4T1W0EsdhqD8Nd8Df3/jDz2K9DwB0z
         gjkV92DWLFbi3wLD2oeyZkvqhx0cy9VaN7C2rFh02/WFMkc/PgkskD909GT8cqpnVJ5+
         PXgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734678718; x=1735283518;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qxJg4W4ceRLI3xU0GNrM6kdx1W1KOEHbJ60meRiAmv8=;
        b=XcB0H6tjgc4bfasQMN/b3LEQzp4dkzAv5XoW0cAixKIZCoRIqdQDq6hQJq6ZX2dBsP
         P36+eHLkAJ4MngRm06LcqJCUEdn9nPhwSpZX04ENsRZL7bS+mOGTMpXo/QHw+dwDnMOO
         4tZXB92EIgFmxmM+bN+5dDZhOxQtxvmK/xQgVCM92BBXiPlDTviwLuOKPN+StUrdVRE1
         tBQYnnxu/oWecj5CkovirCWvyp05xedGoCda9mDs+f6nTPt1oElCWkRLV+YRFHgMJBDi
         FEenaRS1IuVfDtDdYzXieGljXjj0MfhWx89sYR/QuAhjI9O9EoSfNARk3QvP6Yf0hDjG
         Ra/w==
X-Gm-Message-State: AOJu0YxLEs2BEG/yGhHAaUUYGzUfXMh86obihmaoFGe4CQbc6uYhQdhC
	8JrzQv5ksDEfSn1WEIkRaZMTWjfuTJyqJMSaAL8y7dCSQeCWmpoh
X-Gm-Gg: ASbGncufIQaY09Sj30pBQuwa4y46k39yUOK9P3sxHM8hxEJ0GodG76l9kwY9kDBmzyq
	26qfVFj8LBTLqtd8rA3jpAv57gd8ZwpETRvUTZHDpAyBgwIglNZBsuFJQvS+6mtH77pi4IHJ0IB
	UNmwnw42bIcIggk4avL7iWErczP1eYCe7xOmeu+Lzr2GMETnBidOGTGvZSFLV3KszXPOKgyOmep
	PkprwRBuuYA0KfNm8Q3fmFirQJSszuwdOzTPrnj2uF3CHpqQ5buZa1VwkiQuw/ewtkDraV/TKlV
	1WI=
X-Google-Smtp-Source: 
 AGHT+IH3fSbI2/+wmvOWLHZ/lpyuNVQawnOms/LTI4+/xcIe2KHeAdDdUp7xaLT1ViMFkFD+K/fEFQ==
X-Received: by 2002:a5d:5f8b:0:b0:385:fd31:ca34 with SMTP id
 ffacd0b85a97d-38a223fda01mr1452337f8f.54.1734678718290;
        Thu, 19 Dec 2024 23:11:58 -0800 (PST)
Received: from localhost.localdomain ([95.43.220.235])
        by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a1c89e1c0sm3349454f8f.77.2024.12.19.23.11.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2024 23:11:57 -0800 (PST)
From: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	tony@atomide.com
Cc: alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
Subject: [RFC PATCH] soc: audio-graph-card2: use correct endpoint when getting
 link parameters
Date: Fri, 20 Dec 2024 09:11:26 +0200
Message-Id: <20241220071126.1066691-1-ivo.g.dimitrov.75@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: ivo.g.dimitrov.75@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: GEUGNUQMYOHKKHWJVJULL5SSBLXU2DKD
X-Message-ID-Hash: GEUGNUQMYOHKKHWJVJULL5SSBLXU2DKD
X-Mailman-Approved-At: Sun, 29 Dec 2024 12:56:09 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GEUGNUQMYOHKKHWJVJULL5SSBLXU2DKD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

We may have multiple links between ports, with each link
having different parameters. Currently, no matter the topology,
it is always port endpoint 0 that is used when setting parameters.

On a complex sound system, like the one found on Motorola droid4,
hifi and voice DAIs require differents formats (i2s vs dsp_a)
and curently it is impossible to use DT to set that.
 
Implementing the change leads to partially dropping of at least
0dedbde5062d (ASoC: cpcap: Implement set_tdm_slot for voice call
support), as core does most of what is needed to configure voice DAI.

We (on Maemo Leste ) use the patch (along with few others) to have
voice calls working properly on d4 through UCM.

The patch is for linux 6.6, I want to know whether the
approach would be accepted before sending a proper patch for
current master.

the original commit message follows:

When link parameters are parsed, it is always endpoint@0 that is used and
parameters set to other endpoints are ignored.

Fix that by using endpoint that is set in DT when parsing link parameters.

Signed-off-by: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
---
 sound/soc/generic/audio-graph-card2.c | 59 +++++++++++++--------------
 1 file changed, 28 insertions(+), 31 deletions(-)

diff --git a/sound/soc/generic/audio-graph-card2.c b/sound/soc/generic/audio-graph-card2.c
index b1c675c6b6db..163a20c8ffee 100644
--- a/sound/soc/generic/audio-graph-card2.c
+++ b/sound/soc/generic/audio-graph-card2.c
@@ -508,17 +508,16 @@ static int __graph_parse_node(struct asoc_simple_priv *priv,
 
 static int graph_parse_node(struct asoc_simple_priv *priv,
 			    enum graph_type gtype,
-			    struct device_node *port,
+			    struct device_node *ep,
 			    struct link_info *li, int is_cpu)
 {
-	struct device_node *ep;
 	int ret = 0;
+	struct device_node *port = of_get_parent(ep);
+	bool is_multi = graph_lnk_is_multi(port);
 
-	if (graph_lnk_is_multi(port)) {
+	if (is_multi) {
 		int idx;
 
-		of_node_get(port);
-
 		for (idx = 0;; idx++) {
 			ep = graph_get_next_multi_ep(&port);
 			if (!ep)
@@ -532,9 +531,8 @@ static int graph_parse_node(struct asoc_simple_priv *priv,
 		}
 	} else {
 		/* Single CPU / Codec */
-		ep = port_to_endpoint(port);
+		of_node_put(port);
 		ret = __graph_parse_node(priv, gtype, ep, li, is_cpu, 0);
-		of_node_put(ep);
 	}
 
 	return ret;
@@ -591,22 +589,20 @@ static void graph_parse_daifmt(struct device_node *node,
 }
 
 static void graph_link_init(struct asoc_simple_priv *priv,
-			    struct device_node *port,
+			    struct device_node *ep,
 			    struct link_info *li,
 			    int is_cpu_node)
 {
 	struct snd_soc_dai_link *dai_link = simple_priv_to_link(priv, li->link);
-	struct device_node *ep;
+	struct device_node *port = of_get_parent(ep);
+	bool is_multi = graph_lnk_is_multi(port);
 	struct device_node *ports;
 	unsigned int daifmt = 0, daiclk = 0;
 	unsigned int bit_frame = 0;
 
-	if (graph_lnk_is_multi(port)) {
-		of_node_get(port);
+	if (is_multi) {
 		ep = graph_get_next_multi_ep(&port);
 		port = of_get_parent(ep);
-	} else {
-		ep = port_to_endpoint(port);
 	}
 
 	ports = of_get_parent(port);
@@ -642,6 +638,9 @@ static void graph_link_init(struct asoc_simple_priv *priv,
 	dai_link->ops		= &graph_ops;
 	if (priv->ops)
 		dai_link->ops	= priv->ops;
+
+	of_node_put(port);
+	of_node_put(ports);
 }
 
 int audio_graph2_link_normal(struct asoc_simple_priv *priv,
@@ -650,7 +649,7 @@ int audio_graph2_link_normal(struct asoc_simple_priv *priv,
 {
 	struct device_node *cpu_port = lnk;
 	struct device_node *cpu_ep = port_to_endpoint(cpu_port);
-	struct device_node *codec_port = of_graph_get_remote_port(cpu_ep);
+	struct device_node *codec_ep = of_graph_get_remote_endpoint(cpu_ep);
 	int ret;
 
 	/*
@@ -658,20 +657,20 @@ int audio_graph2_link_normal(struct asoc_simple_priv *priv,
 	 * see
 	 *	__graph_parse_node() :: DAI Naming
 	 */
-	ret = graph_parse_node(priv, GRAPH_NORMAL, codec_port, li, 0);
+	ret = graph_parse_node(priv, GRAPH_NORMAL, codec_ep, li, 0);
 	if (ret < 0)
 		goto err;
 
 	/*
 	 * call CPU, and set DAI Name
 	 */
-	ret = graph_parse_node(priv, GRAPH_NORMAL, cpu_port, li, 1);
+	ret = graph_parse_node(priv, GRAPH_NORMAL, cpu_ep, li, 1);
 	if (ret < 0)
 		goto err;
 
-	graph_link_init(priv, cpu_port, li, 1);
+	graph_link_init(priv, cpu_ep, li, 1);
 err:
-	of_node_put(codec_port);
+	of_node_put(codec_ep);
 	of_node_put(cpu_ep);
 
 	return ret;
@@ -684,7 +683,6 @@ int audio_graph2_link_dpcm(struct asoc_simple_priv *priv,
 {
 	struct device_node *ep = port_to_endpoint(lnk);
 	struct device_node *rep = of_graph_get_remote_endpoint(ep);
-	struct device_node *rport = of_graph_get_remote_port(ep);
 	struct snd_soc_dai_link *dai_link = simple_priv_to_link(priv, li->link);
 	struct simple_dai_props *dai_props = simple_priv_to_props(priv, li->link);
 	int is_cpu = asoc_graph_is_ports0(lnk);
@@ -718,7 +716,7 @@ int audio_graph2_link_dpcm(struct asoc_simple_priv *priv,
 		dai_link->dynamic		= 1;
 		dai_link->dpcm_merged_format	= 1;
 
-		ret = graph_parse_node(priv, GRAPH_DPCM, rport, li, 1);
+		ret = graph_parse_node(priv, GRAPH_DPCM, rep, li, 1);
 		if (ret)
 			goto err;
 	} else {
@@ -751,7 +749,7 @@ int audio_graph2_link_dpcm(struct asoc_simple_priv *priv,
 		dai_link->no_pcm		= 1;
 		dai_link->be_hw_params_fixup	= asoc_simple_be_hw_params_fixup;
 
-		ret = graph_parse_node(priv, GRAPH_DPCM, rport, li, 0);
+		ret = graph_parse_node(priv, GRAPH_DPCM, rep, li, 0);
 		if (ret < 0)
 			goto err;
 	}
@@ -761,11 +759,10 @@ int audio_graph2_link_dpcm(struct asoc_simple_priv *priv,
 
 	snd_soc_dai_link_set_capabilities(dai_link);
 
-	graph_link_init(priv, rport, li, is_cpu);
+	graph_link_init(priv, rep, li, is_cpu);
 err:
 	of_node_put(ep);
 	of_node_put(rep);
-	of_node_put(rport);
 
 	return ret;
 }
@@ -777,7 +774,7 @@ int audio_graph2_link_c2c(struct asoc_simple_priv *priv,
 {
 	struct snd_soc_dai_link *dai_link = simple_priv_to_link(priv, li->link);
 	struct device_node *port0, *port1, *ports;
-	struct device_node *codec0_port, *codec1_port;
+	struct device_node *codec0_ep, *codec1_ep;
 	struct device_node *ep0, *ep1;
 	u32 val = 0;
 	int ret = -EINVAL;
@@ -834,31 +831,31 @@ int audio_graph2_link_c2c(struct asoc_simple_priv *priv,
 	ep0 = port_to_endpoint(port0);
 	ep1 = port_to_endpoint(port1);
 
-	codec0_port = of_graph_get_remote_port(ep0);
-	codec1_port = of_graph_get_remote_port(ep1);
+	codec0_ep = of_graph_get_remote_endpoint(ep0);
+	codec1_ep = of_graph_get_remote_endpoint(ep1);
 
 	/*
 	 * call Codec first.
 	 * see
 	 *	__graph_parse_node() :: DAI Naming
 	 */
-	ret = graph_parse_node(priv, GRAPH_C2C, codec1_port, li, 0);
+	ret = graph_parse_node(priv, GRAPH_C2C, codec1_ep, li, 0);
 	if (ret < 0)
 		goto err2;
 
 	/*
 	 * call CPU, and set DAI Name
 	 */
-	ret = graph_parse_node(priv, GRAPH_C2C, codec0_port, li, 1);
+	ret = graph_parse_node(priv, GRAPH_C2C, codec0_ep, li, 1);
 	if (ret < 0)
 		goto err2;
 
-	graph_link_init(priv, codec0_port, li, 1);
+	graph_link_init(priv, codec0_ep, li, 1);
 err2:
 	of_node_put(ep0);
 	of_node_put(ep1);
-	of_node_put(codec0_port);
-	of_node_put(codec1_port);
+	of_node_put(codec0_ep);
+	of_node_put(codec1_ep);
 err1:
 	of_node_put(ports);
 	of_node_put(port0);
-- 
2.30.2

