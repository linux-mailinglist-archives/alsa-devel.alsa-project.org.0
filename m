Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AD4F49B75
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Jun 2019 09:49:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 025E116EA;
	Tue, 18 Jun 2019 09:48:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 025E116EA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560844144;
	bh=qzq4HURb9jah3rWCpPzJ7xQRPZn1rJhAb32HXgwpBds=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=QPl9K9eEMcLy3UfBRzn0zxupPbl14qxN+kp3ArTOZreG6G2VctlXKJaed8IiIg63l
	 IcrEGXSj1GauQNk2AzQU30F7HGS27P6hAnrmXXGLURl6Qz76rJJS4xpmNu8gegKlUX
	 AYFrSvScG0UnrHteT63q1nTUbuymCcTTocN77qkg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 271FDF8971C;
	Tue, 18 Jun 2019 09:47:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F3A25F8971C; Tue, 18 Jun 2019 09:47:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp.codeaurora.org (smtp.codeaurora.org [198.145.29.96])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3F8AAF89682
 for <alsa-devel@alsa-project.org>; Tue, 18 Jun 2019 09:47:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3F8AAF89682
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=codeaurora.org header.i=@codeaurora.org
 header.b="Ha8bMCN3"; 
 dkim=pass (1024-bit key) header.d=codeaurora.org header.i=@codeaurora.org
 header.b="AJRlHDpQ"
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
 id 3D1C861196; Tue, 18 Jun 2019 07:47:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
 s=default; t=1560844063;
 bh=D8JyNyYQMG42MJKDGfv6oBPbBafP5TQu0Vg1i4fF/j0=;
 h=From:To:Cc:Subject:Date:From;
 b=Ha8bMCN3EhFA1SmOCFa+el/IhVGWGCPwsT3ct9Wr/XOU9ejrslVf6yuqzuunGSv2b
 5b+yvBFd/OcaA1sXb2bmIrvpYUW8jGeHcCA2/nZ5jtJyivzQTGSNTVnsWaoQ9hEwuG
 fxQl3TFy29bU+UQuT7mn4nlgXk3vfJINO5dIPzCU=
Received: from localhost (i-global254.qualcomm.com [199.106.103.254])
 (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: bgoswami@smtp.codeaurora.org)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 765D66090F;
 Tue, 18 Jun 2019 07:47:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
 s=default; t=1560844061;
 bh=D8JyNyYQMG42MJKDGfv6oBPbBafP5TQu0Vg1i4fF/j0=;
 h=From:To:Cc:Subject:Date:From;
 b=AJRlHDpQw4AyFOvhVGf+Z38mi1+SuBYvY+znuAL5l9ztuzau3dwQ+QEvPui7onQbk
 O9Q/zmJQ4dv9nVrIaRTbkBFi8sJqSmJSIZHUw9HVoBWDrd5P1rwLt7WD8y4UaGwYmk
 IS+0mwZE46a2C5OUV5U+yLvT7d3QegdSJ5vf+uX4=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 765D66090F
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 spf=none smtp.mailfrom=bgoswami@codeaurora.org
From: bgoswami@codeaurora.org
To: broonie@kernel.org
Date: Tue, 18 Jun 2019 00:47:38 -0700
Message-Id: <1560844059-5897-1-git-send-email-bgoswami@codeaurora.org>
X-Mailer: git-send-email 1.9.1
Cc: alsa-devel@alsa-project.org, Banajit Goswami <bgoswami@codeaurora.org>,
 srinivas.kandagatla@linaro.org, plai@codeaurora.org
Subject: [alsa-devel] [PATCH] ASoC: soc-core: export function to find
	components
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

From: Banajit Goswami <bgoswami@codeaurora.org>

Drivers may need to use the ASoC core function to
find out whether a particular component is already
registered with ASoC core or not.
Export the function so that drivers can use it outside
of the file.

Signed-off-by: Banajit Goswami <bgoswami@codeaurora.org>
---
 include/sound/soc.h  |  2 ++
 sound/soc/soc-core.c | 13 ++++++++++++-
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index 482b4ea..def975f 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -1405,6 +1405,8 @@ int snd_soc_component_update_bits_async(struct snd_soc_component *component,
 void snd_soc_component_async_complete(struct snd_soc_component *component);
 int snd_soc_component_test_bits(struct snd_soc_component *component,
 	unsigned int reg, unsigned int mask, unsigned int value);
+struct snd_soc_component *soc_find_component(
+	const struct device_node *of_node, const char *name);
 
 /* component wide operations */
 int snd_soc_component_set_sysclk(struct snd_soc_component *component,
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 41c0cfa..50a9977 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -741,7 +741,17 @@ int snd_soc_resume(struct device *dev)
 static const struct snd_soc_dai_ops null_dai_ops = {
 };
 
-static struct snd_soc_component *soc_find_component(
+/**
+ * soc_find_component: find a component from component_list in ASoC core
+ *
+ * @of_node: of_node of the component to query.
+ * @name: name of the component to query.
+ *
+ * function to find out if a component is already registered with ASoC core.
+ *
+ * Returns component handle for success, else NULL error.
+ */
+struct snd_soc_component *soc_find_component(
 	const struct device_node *of_node, const char *name)
 {
 	struct snd_soc_component *component;
@@ -764,6 +774,7 @@ static struct snd_soc_component *soc_find_component(
 
 	return NULL;
 }
+EXPORT_SYMBOL(soc_find_component);
 
 static int snd_soc_is_matching_component(
 	const struct snd_soc_dai_link_component *dlc,
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
