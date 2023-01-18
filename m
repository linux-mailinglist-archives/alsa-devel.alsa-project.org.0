Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BE42B671CB8
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Jan 2023 13:54:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1693577F1;
	Wed, 18 Jan 2023 13:54:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1693577F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674046490;
	bh=NXtxseaayGYKr1CkJYmxKFAs2wC1YMd++TmZod7Ir9Y=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=oBsVbO/zqs+KinWgJdH3tQervbawTbLbVLYyoPhuu2uPy9JhSUFDZ1h2jUV89flqt
	 m6w1vj4r4rIfZEDA1scAaApssM9JblojDMiLfVvvHW7m9/+VSl1PLJEbe8cO3TFDhv
	 TwK9DG1SB2+j9LViHC5seeLR95ClEatvuQDa176k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EE9EEF80558;
	Wed, 18 Jan 2023 13:52:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 75B5CF80548; Wed, 18 Jan 2023 13:52:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AC7DAF8024C
 for <alsa-devel@alsa-project.org>; Wed, 18 Jan 2023 13:52:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AC7DAF8024C
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=axis.com header.i=@axis.com header.a=rsa-sha256
 header.s=axis-central1 header.b=gpW+jnwM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis.com; q=dns/txt; s=axis-central1; t=1674046353;
 x=1705582353; h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=c9tQ6467axGUUkqK8Hn/WxBs1AovQDwhp7i0J3ZaltU=;
 b=gpW+jnwMV4nOsabNvXk6zjlp/n4LKEjysekyJsNxmWpo8UoTd8QpAh9i
 A5uL0H1SVqwz+434j3NB0lY9lGSM8lDowqZufEhqu6z+uI0MLFWkOE7P9
 cndCLF5pPhZxghzLncGy2AvWpl7Olo76oyuHVPqm+wNshdggTvngDCUTH
 8951hOxdvBZsn5rJZoAkpSZ0XOaLliK1T6vR8+xQmiAB2VNs5fjTXbj87
 ONTkwEH8viD9HRAmsv5WpFw9wv+76qF90pVpG5zUc0aWnTlaCk3a+nqaU
 XvdfAEd80tarI1pw2Gq2JwJ098FPxGgctUMQh+tHsQhtWqoVgBy+j2oWo g==;
From: Astrid Rost <astrid.rost@axis.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Jaroslav Kysela
 <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v1 3/4] ASoC: ts3a227e: add set_jack and
 get_jack_supported_type
Date: Wed, 18 Jan 2023 13:52:25 +0100
Message-ID: <20230118125226.333214-4-astrid.rost@axis.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230118125226.333214-1-astrid.rost@axis.com>
References: <20230118125226.333214-1-astrid.rost@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, kernel@axis.com, linux-kernel@vger.kernel.org,
 Astrid Rost <astrid.rost@axis.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Add set_jack and get_jack_supported_type
to allow simple-card-utils to add a jack for it.

Signed-off-by: Astrid Rost <astrid.rost@axis.com>
---
 sound/soc/codecs/ts3a227e.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/ts3a227e.c b/sound/soc/codecs/ts3a227e.c
index 2305a472d132..212dfd2b60ed 100644
--- a/sound/soc/codecs/ts3a227e.c
+++ b/sound/soc/codecs/ts3a227e.c
@@ -258,7 +258,22 @@ int ts3a227e_enable_jack_detect(struct snd_soc_component *component,
 }
 EXPORT_SYMBOL_GPL(ts3a227e_enable_jack_detect);
 
-static struct snd_soc_component_driver ts3a227e_soc_driver;
+static int ts3a227e_set_jack(struct snd_soc_component *component,
+			     struct snd_soc_jack *jack, void *data)
+{
+	return ts3a227e_enable_jack_detect(component, jack);
+}
+
+static int ts3a227e_get_supported_jack_type(struct snd_soc_component *component)
+{
+	return TS3A227E_JACK_MASK;
+}
+
+static const struct snd_soc_component_driver ts3a227e_soc_driver = {
+	.name = "ti,ts3a227e",
+	.set_jack = ts3a227e_set_jack,
+	.get_jack_supported_type = ts3a227e_get_supported_jack_type,
+};
 
 static const struct regmap_config ts3a227e_regmap_config = {
 	.val_bits = 8,
-- 
2.30.2

