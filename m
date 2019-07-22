Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 724A37008A
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jul 2019 15:06:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DF3141693;
	Mon, 22 Jul 2019 15:06:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DF3141693
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563800813;
	bh=uacj/ezvPbOybb576u92svXG8oFqqWCsCOXHncXrFfw=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=kAcCassyTCQ18c8d1nGt2GZuaIjsnKQwFAhGXBDxy+a0klgeGj796xtRAjbbVCDRo
	 8E2HJzZ8nnYjy05iHyYSMFc2qQ2RYtSqilO03pNKMFCxJT8NKZUWQlkV0yLxozF6E1
	 STQ8v4ULFf6c4kxRVNOHM8PVra5uz2z8q71CLhXc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0D953F803F3;
	Mon, 22 Jul 2019 15:05:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 48C58F803D7; Mon, 22 Jul 2019 15:05:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mo6-p01-ob.smtp.rzone.de (mo6-p01-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5301::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 07637F800E8
 for <alsa-devel@alsa-project.org>; Mon, 22 Jul 2019 15:05:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 07637F800E8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gerhold.net header.i=@gerhold.net
 header.b="Qaftanyx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1563800736;
 s=strato-dkim-0002; d=gerhold.net;
 h=Message-Id:Date:Subject:Cc:To:From:X-RZG-CLASS-ID:X-RZG-AUTH:From:
 Subject:Sender;
 bh=RsAX8kDqEjkHZi13eG+iYrjtF5VikobkUxQqrWt96Gk=;
 b=Qaftanyxiv/tqj49MzQOlWv+f9iH65CmLJx/yTuSFdpClPDkWlTLKC2xP0gjqzAFxb
 fRuXiQVD8JE5xKmGfEFuYidSxnSZY034yLHskwe3ZAtNxeyCIQvaXKwceUe8MerOeAEO
 tpRAfmLWb9DxX38XVPPPd/F7wTgJp2OaTsSaLxbUU8CfHtUnG8euBSYdxzKSmT6oUsLZ
 j4r76SLv41w5f2oTc3SunW+k5+SJvzTgVVw1YWK0Cxjq9B7YG5i/gvOgFrtUhj47Qpzh
 33PK5Ced0sQXqkJC27KX8+MFf+D9/ibf5Ot/hmVReevlNXKKserX3zhViqgp0hzu8C/e
 rSqQ==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXS7IYBkLahKxP4G6N/EiB"
X-RZG-CLASS-ID: mo00
Received: from localhost.localdomain by smtp.strato.de (RZmta 44.24 DYNA|AUTH)
 with ESMTPSA id m0a13fv6MD5YPok
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with
 521 ECDH bits, eq. 15360 bits RSA))
 (Client did not present a certificate);
 Mon, 22 Jul 2019 15:05:34 +0200 (CEST)
From: Stephan Gerhold <stephan@gerhold.net>
To: Mark Brown <broonie@kernel.org>
Date: Mon, 22 Jul 2019 15:03:52 +0200
Message-Id: <20190722130352.95874-1-stephan@gerhold.net>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, Banajit Goswami <bgoswami@codeaurora.org>,
 Stephan Gerhold <stephan@gerhold.net>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Patrick Lai <plai@codeaurora.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: [alsa-devel] [PATCH] ASoC: qcom: apq8016_sbc: Fix oops with
	multiple DAI links
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

apq8016_sbc_parse_of() sets up multiple DAI links, depending on the
number of nodes in the device tree. However, at the moment
CPU and platform components are only allocated for the first link.
This causes an oops when more than one link is defined:

	Internal error: Oops: 96000044 [#1] SMP
	CPU: 0 PID: 1015 Comm: kworker/0:2 Not tainted 5.3.0-rc1 #4
	Call trace:
	 apq8016_sbc_platform_probe+0x1a8/0x3f0
	 platform_drv_probe+0x50/0xa0
	...

Move the allocation inside the loop to ensure that each link is
properly initialized.

Fixes: 98b232ca9e0e ("ASoC: qcom: apq8016_sbc: use modern dai_link style")
Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 sound/soc/qcom/apq8016_sbc.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/sound/soc/qcom/apq8016_sbc.c b/sound/soc/qcom/apq8016_sbc.c
index f60a71990f66..ac75838bbfab 100644
--- a/sound/soc/qcom/apq8016_sbc.c
+++ b/sound/soc/qcom/apq8016_sbc.c
@@ -150,17 +150,17 @@ static struct apq8016_sbc_data *apq8016_sbc_parse_of(struct snd_soc_card *card)
 
 	link = data->dai_link;
 
-	dlc = devm_kzalloc(dev, 2 * sizeof(*dlc), GFP_KERNEL);
-	if (!dlc)
-		return ERR_PTR(-ENOMEM);
+	for_each_child_of_node(node, np) {
+		dlc = devm_kzalloc(dev, 2 * sizeof(*dlc), GFP_KERNEL);
+		if (!dlc)
+			return ERR_PTR(-ENOMEM);
 
-	link->cpus	= &dlc[0];
-	link->platforms	= &dlc[1];
+		link->cpus	= &dlc[0];
+		link->platforms	= &dlc[1];
 
-	link->num_cpus		= 1;
-	link->num_platforms	= 1;
+		link->num_cpus		= 1;
+		link->num_platforms	= 1;
 
-	for_each_child_of_node(node, np) {
 		cpu = of_get_child_by_name(np, "cpu");
 		codec = of_get_child_by_name(np, "codec");
 
-- 
2.22.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
