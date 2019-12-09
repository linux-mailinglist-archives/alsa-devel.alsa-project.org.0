Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 38E10116E42
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Dec 2019 14:55:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A5C2886F;
	Mon,  9 Dec 2019 14:55:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A5C2886F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575899751;
	bh=hxd/oLil3U+lQ21Y/yikvQo8RDDtcD+hKyT7QQUhHiA=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=UZKsjj5VcQn+I91ojWOg62QKF54FaiHwepnMOvGxDY91Fx69EbDcczrNYojoxeEW1
	 98BCXN0nq6Bkdu/NgxWpxZ7suk3kgnxc4xLrUQVDnYJTemmEgwQPLuc5AaLuXZpO8K
	 srRM2KlZwyyOgID/9eO8XUKFfbPHR7VTmYn3whl8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 02C84F800C4;
	Mon,  9 Dec 2019 14:54:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A8C74F8023E; Mon,  9 Dec 2019 14:54:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED autolearn=disabled version=3.4.0
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 61589F8011E
 for <alsa-devel@alsa-project.org>; Mon,  9 Dec 2019 14:53:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 61589F8011E
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 1C4F51A0789;
 Mon,  9 Dec 2019 14:53:59 +0100 (CET)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com
 [134.27.226.22])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 101611A0781;
 Mon,  9 Dec 2019 14:53:59 +0100 (CET)
Received: from fsr-ub1864-103.ro-buh02.nxp.com
 (fsr-ub1864-103.ea.freescale.net [10.171.82.17])
 by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id B375C20564;
 Mon,  9 Dec 2019 14:53:58 +0100 (CET)
From: Daniel Baluta <daniel.baluta@nxp.com>
To: broonie@kernel.org
Date: Mon,  9 Dec 2019 15:53:53 +0200
Message-Id: <20191209135353.17427-1-daniel.baluta@nxp.com>
X-Mailer: git-send-email 2.17.1
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: alsa-devel@alsa-project.org, Daniel Baluta <daniel.baluta@nxp.com>,
 linux-kernel@vger.kernel.org, kuninori.morimoto.gx@renesas.com
Subject: [alsa-devel] [PATCH] ASoC: simple-card: Don't create separate link
	when platform is present
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

In normal sound case all DAIs are detected as CPU-Codec.
simple_dai_link_of supports the presence of a platform but it counts
it as a CPU DAI resulting in the creation of an extra link.

Adding a platform property to a link description like:

simple-audio-card,dai-link {
	cpu {
		sound-dai = <&sai1>;
	};
	plat {
		sound-dai = <&dsp>;
	};
	codec {
		sound-dai = <&wm8960>;
	}

will result in the creation of two links:
	* sai1 <-> wm8960
	* dsp  <-> wm8960

which is obviously not what we want. We just want one single link
with:
	* sai1 <-> wm8960 (and platform set to dsp).

Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
---
 sound/soc/generic/simple-card.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/sound/soc/generic/simple-card.c b/sound/soc/generic/simple-card.c
index 10b82bf043d1..55e9f8800b3e 100644
--- a/sound/soc/generic/simple-card.c
+++ b/sound/soc/generic/simple-card.c
@@ -371,6 +371,7 @@ static int simple_for_each_link(struct asoc_simple_priv *priv,
 	do {
 		struct asoc_simple_data adata;
 		struct device_node *codec;
+		struct device_node *plat;
 		struct device_node *np;
 		int num = of_get_child_count(node);
 
@@ -381,6 +382,9 @@ static int simple_for_each_link(struct asoc_simple_priv *priv,
 			ret = -ENODEV;
 			goto error;
 		}
+		/* get platform */
+		plat = of_get_child_by_name(node, is_top ?
+					    PREFIX "plat" : "plat");
 
 		/* get convert-xxx property */
 		memset(&adata, 0, sizeof(adata));
@@ -389,6 +393,8 @@ static int simple_for_each_link(struct asoc_simple_priv *priv,
 
 		/* loop for all CPU/Codec node */
 		for_each_child_of_node(node, np) {
+			if (plat == np)
+				continue;
 			/*
 			 * It is DPCM
 			 * if it has many CPUs,
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
