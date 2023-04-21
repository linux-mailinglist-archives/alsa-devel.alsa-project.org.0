Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A79C6EAAB3
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Apr 2023 14:43:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 481D1E87;
	Fri, 21 Apr 2023 14:43:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 481D1E87
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1682081034;
	bh=8Htbhu7v5lTV9ZIKbKs01NnX/J3Dy7SaAOQXd0SsXL8=;
	h=To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From:Reply-To:Cc:From;
	b=MdOHzYdzYlK+XfNaQr1BsPZp0ZirmqIWp5Hfi4Nje3ZuRWInE04VgfihDCWuGzWpK
	 A+Efmg8ZSlOBFTi2YyqP08SGV9q+/yE9bVwDeFxkWQ9q3FXyvb4GcmHw+XukjRtxj1
	 2pwECkZ9KbuXkEsE3Z/I/YT1n0jz3cWLlvR33wpU=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BFD81F8053B;
	Fri, 21 Apr 2023 14:42:08 +0200 (CEST)
To: Herve Codina <herve.codina@bootlin.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 3/4] ASoC: soc-dapm.h: Add a helper to build a DAPM widget
 dynamically
Date: Fri, 21 Apr 2023 14:41:21 +0200
In-Reply-To: <20230421124122.324820-1-herve.codina@bootlin.com>
References: <20230421124122.324820-1-herve.codina@bootlin.com>
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LD7Z7XPHRUNDSUN7RCXMAZ2QXC647ICI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: 
 <168208092763.26.5617699221755278498@mailman-core.alsa-project.org>
From: Herve Codina via Alsa-devel <alsa-devel@alsa-project.org>
Reply-To: Herve Codina <herve.codina@bootlin.com>
Cc: alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: message/rfc822
Content-Disposition: inline

Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CAF53F8053D; Fri, 21 Apr 2023 14:42:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 46F9DF80534
	for <alsa-devel@alsa-project.org>; Fri, 21 Apr 2023 14:42:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 46F9DF80534
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=EBy4SLN3
Received: (Authenticated sender: herve.codina@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPA id AFC324000A;
	Fri, 21 Apr 2023 12:42:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1682080921;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ReUlzkjE4Wu5oxkDFDACc0QGLsw/liPYYYIVObV0csA=;
	b=EBy4SLN3K1xBNjJvOdgJT6PUfEQL9bFvtJnkKZY46KL21NgKdoRGRLuXY2Ng5RVJCaQUsK
	GUAjgQdTVTG41iA642TMsVC4zRI8weITdr7eKSHZvuCV1Q5xCkm8Jbl77IjpdbpUulDUiX
	AsR9HA/raMQtAMUCJOFuJPfaI0RECjhMyOz7Albr5ZYlsRCx1iz32soaxO3gFjAiprgSuv
	cIxyMyYohgaG33z6C43NJ8liKsqhp27aY2E8che4fAx5gExva8v9hS1l3cwoZzOoA0YZ43
	4sasYv521gJLU5JtIUz/jn78fj2GCk6QXZiocudJcA47ux7IaLWyQXpxTA88AQ==
From: Herve Codina <herve.codina@bootlin.com>
To: Herve Codina <herve.codina@bootlin.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 3/4] ASoC: soc-dapm.h: Add a helper to build a DAPM widget
 dynamically
Date: Fri, 21 Apr 2023 14:41:21 +0200
Message-Id: <20230421124122.324820-4-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230421124122.324820-1-herve.codina@bootlin.com>
References: <20230421124122.324820-1-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: LD7Z7XPHRUNDSUN7RCXMAZ2QXC647ICI
X-Message-ID-Hash: LD7Z7XPHRUNDSUN7RCXMAZ2QXC647ICI
X-MailFrom: herve.codina@bootlin.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LD7Z7XPHRUNDSUN7RCXMAZ2QXC647ICI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The SND_SOC_DAPM_* helpers family are used to build widgets array in a
static way.

Introduce SND_SOC_DAPM_WIDGET() in order to use the SND_SOC_DAPM_*
helpers family in a dynamic way. The different SND_SOC_DAPM_* parameters
can be computed by the code and the widget can be built based on this
parameter computation.
For instance:
  static int create_widget(char *input_name)
  {
	struct snd_soc_dapm_widget widget;
	char name*;
	...
	name = input_name;
	if (!name)
		name = "default";

	widget = SND_SOC_DAPM_WIDGET(SND_SOC_DAPM_INPUT(name));
	...
  }

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 include/sound/soc-dapm.h | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/include/sound/soc-dapm.h b/include/sound/soc-dapm.h
index 64915ebd641e..d6bb97fba8c9 100644
--- a/include/sound/soc-dapm.h
+++ b/include/sound/soc-dapm.h
@@ -276,7 +276,17 @@ struct soc_enum;
 	.reg = SND_SOC_NOPM, .event = dapm_pinctrl_event, \
 	.event_flags = SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD }
 
-
+/*
+ * Helper to create a widget 'dynamically'
+ * This can be used with any of the SND_SOC_DAPM_* widget helper.
+ * For instance:
+ *  struct snd_soc_dapm_widget widget;
+ *  ...
+ *  widget = SND_SOC_DAPM_WIDGET(SND_SOC_DAPM_INPUT(input_name));
+ */
+#define SND_SOC_DAPM_WIDGET(_widget)({ \
+		struct snd_soc_dapm_widget _w[1] = { _widget }; \
+	_w[0]; })
 
 /* dapm kcontrol types */
 #define SOC_DAPM_DOUBLE(xname, reg, lshift, rshift, max, invert) \
-- 
2.39.2

