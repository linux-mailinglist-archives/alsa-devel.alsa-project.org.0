Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8971F852D8B
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Feb 2024 11:12:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ACD5EA4A;
	Tue, 13 Feb 2024 11:11:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ACD5EA4A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707819120;
	bh=mL4XO56Z6BWv4tMNoHpJYHvphFG+5pdC53wWnQvEb5Y=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=YWDSBciw2LgO39HKOOGXpUjJm4dnOrKSgM3y/68HT7KUx7BMbdWIcKwUAq1KNSmBA
	 ggdDoQRpHoBmahjLiZ5I4rFM3Ro0MEh3oaRM5yZoBxnM511peml7CQID7K7B50EVGF
	 sWkog1gRdj9TuKNwVt+bliCFAHv9/BuzT+sFAa94=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 641B7F805AB; Tue, 13 Feb 2024 11:11:27 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9C5AAF8059F;
	Tue, 13 Feb 2024 11:11:26 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A81CEF80238; Tue, 13 Feb 2024 11:11:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BCA07F800BF
	for <alsa-devel@alsa-project.org>; Tue, 13 Feb 2024 11:11:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BCA07F800BF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=D0STckFO
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 77E2A61346;
	Tue, 13 Feb 2024 10:11:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6125C433F1;
	Tue, 13 Feb 2024 10:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707819073;
	bh=mL4XO56Z6BWv4tMNoHpJYHvphFG+5pdC53wWnQvEb5Y=;
	h=From:To:Cc:Subject:Date:From;
	b=D0STckFOFxSAdd91J4HTYXokBfOyGak+23LmZrrtGV8AmqeeGqFOg7G9KY4zrdkQo
	 9fJbaRR9gKmH9eJ/i9WDck6tH3Lh0kNVuNI8I4TYDJZkvjsNAoifcmIfGk/P8DhvaQ
	 F65xBXJ3N/cRhr40DhCUME0JWoxEXNRazJ1M8xnu3euc7YWesbTpIjVJ+WGkZOzu4R
	 g67zJBv1Vz8uDDPz8oZhzsBl6dluwFkNVth8k+9Pz624uJAAvdN/dcHPLX/5aW565v
	 GofS96pPXezVY6x1A5pS55CqTLqMEzRJoRCnAvkg218pRjmFS6UYizMDpd6kn1wbiA
	 DaAlElGw6nIUg==
From: Arnd Bergmann <arnd@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Mohammad Rafi Shaik <quic_mohs@quicinc.com>,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH] ASoC: q6dsp: fix event handler prototype
Date: Tue, 13 Feb 2024 11:10:46 +0100
Message-Id: <20240213101105.459402-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: RN3YCCYJR5IRVOTUY5NPZXERTAEZTTXN
X-Message-ID-Hash: RN3YCCYJR5IRVOTUY5NPZXERTAEZTTXN
X-MailFrom: arnd@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RN3YCCYJR5IRVOTUY5NPZXERTAEZTTXN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Arnd Bergmann <arnd@arndb.de>

clang-16 points out a mismatch in function types that was hidden
by a typecast:

sound/soc/qcom/qdsp6/q6apm-dai.c:355:38: error: cast from 'void (*)(uint32_t, uint32_t, uint32_t *, void *)' (aka 'void (*)(unsigned int, unsigned int, unsigned int *, void *)') to 'q6apm_cb' (aka 'void (*)(unsigned int, unsigned int, void *, void *)') converts to incompatible function type [-Werror,-Wcast-function-type-strict]
  355 |         prtd->graph = q6apm_graph_open(dev, (q6apm_cb)event_handler, prtd, graph_id);
sound/soc/qcom/qdsp6/q6apm-dai.c:499:38: error: cast from 'void (*)(uint32_t, uint32_t, uint32_t *, void *)' (aka 'void (*)(unsigned int, unsigned int, unsigned int *, void *)') to 'q6apm_cb' (aka 'void (*)(unsigned int, unsigned int, void *, void *)') converts to incompatible function type [-Werror,-Wcast-function-type-strict]
  499 |         prtd->graph = q6apm_graph_open(dev, (q6apm_cb)event_handler_compr, prtd, graph_id);

The only difference here is the 'payload' argument, which is not even
used in this function, so just fix its type and remove the cast.

Fixes: 88b60bf047fd ("ASoC: q6dsp: q6apm-dai: Add open/free compress DAI callbacks")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 sound/soc/qcom/qdsp6/q6apm-dai.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6apm-dai.c b/sound/soc/qcom/qdsp6/q6apm-dai.c
index 052e40cb38fe..00bbd291be5c 100644
--- a/sound/soc/qcom/qdsp6/q6apm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6apm-dai.c
@@ -123,7 +123,7 @@ static struct snd_pcm_hardware q6apm_dai_hardware_playback = {
 	.fifo_size =            0,
 };
 
-static void event_handler(uint32_t opcode, uint32_t token, uint32_t *payload, void *priv)
+static void event_handler(uint32_t opcode, uint32_t token, void *payload, void *priv)
 {
 	struct q6apm_dai_rtd *prtd = priv;
 	struct snd_pcm_substream *substream = prtd->substream;
@@ -157,7 +157,7 @@ static void event_handler(uint32_t opcode, uint32_t token, uint32_t *payload, vo
 }
 
 static void event_handler_compr(uint32_t opcode, uint32_t token,
-				uint32_t *payload, void *priv)
+				void *payload, void *priv)
 {
 	struct q6apm_dai_rtd *prtd = priv;
 	struct snd_compr_stream *substream = prtd->cstream;
@@ -352,7 +352,7 @@ static int q6apm_dai_open(struct snd_soc_component *component,
 
 	spin_lock_init(&prtd->lock);
 	prtd->substream = substream;
-	prtd->graph = q6apm_graph_open(dev, (q6apm_cb)event_handler, prtd, graph_id);
+	prtd->graph = q6apm_graph_open(dev, event_handler, prtd, graph_id);
 	if (IS_ERR(prtd->graph)) {
 		dev_err(dev, "%s: Could not allocate memory\n", __func__);
 		ret = PTR_ERR(prtd->graph);
@@ -496,7 +496,7 @@ static int q6apm_dai_compr_open(struct snd_soc_component *component,
 		return -ENOMEM;
 
 	prtd->cstream = stream;
-	prtd->graph = q6apm_graph_open(dev, (q6apm_cb)event_handler_compr, prtd, graph_id);
+	prtd->graph = q6apm_graph_open(dev, event_handler_compr, prtd, graph_id);
 	if (IS_ERR(prtd->graph)) {
 		ret = PTR_ERR(prtd->graph);
 		kfree(prtd);
-- 
2.39.2

