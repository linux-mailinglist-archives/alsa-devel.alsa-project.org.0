Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4063D70E024
	for <lists+alsa-devel@lfdr.de>; Tue, 23 May 2023 17:15:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5F912820;
	Tue, 23 May 2023 17:14:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5F912820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684854937;
	bh=cKnE6MOfSRRFJRCk9xV4VRZ0DGjqhFr8a4myCmk3KAc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=se1qZTvIVmMInXYhbG9QpLNxNMtlxD+beQsWPY31xeDenOWJ7+AJ56fkCagXCnJzU
	 J6a5vDmM9VjVS/vYKaHER+BjtA6A4Ah4G3AzsC162rzJkKjIIhafJkbgON2/U0hflv
	 bH59aKkfZyZvtIR98kWvLvhfGrDcdK9F0lTvSTFk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E11C0F805CB; Tue, 23 May 2023 17:12:57 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 56193F805C2;
	Tue, 23 May 2023 17:12:57 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 25D4BF805AA; Tue, 23 May 2023 17:12:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7713AF80579
	for <alsa-devel@alsa-project.org>; Tue, 23 May 2023 17:12:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7713AF80579
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=OJWTwCnl
Received: (Authenticated sender: herve.codina@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPA id 3D8ECC0008;
	Tue, 23 May 2023 15:12:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1684854770;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DrMZ95BLnGjcDr2P+qmpgq0WbufG1vHwF/RueaYJS28=;
	b=OJWTwCnlWn+Xthk0Xfek+s2r5juF2h7SNMSfs+CDSVW51lOc8n36dXjfmK4BGPJBYbTAPt
	86JjRd4Mcrd49qLXHvDbArKC/E8hki2QuxdslB+MaEZqxwzDROqTu3G8Z0Oz5C6eQX+enW
	1FEIgs2cKR0VhE8GLUYxb3DvhzjllrjjdzEjgxzsfnZWENwkRrwuSFZJ1V6owA63QJX4at
	E+lI4csyxxNOldCH4gEdjII1NaSjAe/tFPmI74ueGDSpFa0nTIg+UIMmKFywgHxEA6Z5du
	0P+mF8ZkTdK3AP4vyWzvlgggQVXF+c6HB2D3ptw9OPIUQUqHT2gaJZ7N9lx2tQ==
From: Herve Codina <herve.codina@bootlin.com>
To: Herve Codina <herve.codina@bootlin.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-iio@vger.kernel.org,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: [PATCH v2 6/9] ASoC: soc-dapm.h: Add a helper to build a DAPM widget
 dynamically
Date: Tue, 23 May 2023 17:12:20 +0200
Message-Id: <20230523151223.109551-7-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230523151223.109551-1-herve.codina@bootlin.com>
References: <20230523151223.109551-1-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: UCAOEZ4DYNLKB3M6WO7S566VWSU7GKRK
X-Message-ID-Hash: UCAOEZ4DYNLKB3M6WO7S566VWSU7GKRK
X-MailFrom: herve.codina@bootlin.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UCAOEZ4DYNLKB3M6WO7S566VWSU7GKRK/>
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
index 87f8e1793af1..6b62fe5c779c 100644
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
2.40.1

