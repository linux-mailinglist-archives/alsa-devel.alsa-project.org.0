Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E81A77BF30
	for <lists+alsa-devel@lfdr.de>; Wed, 31 Jul 2019 13:22:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3271A170A;
	Wed, 31 Jul 2019 13:21:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3271A170A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564572151;
	bh=njMyr8YeLIV0ljfRCQHCb7z4i8FzZyZU4XOd5mk5J7E=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sTiZ2jbrhJjrl+xnGoFXG0sEGiugSViRjLCmnYBwmrVTBrs+9dkpMSDssiy/DuhMx
	 wzQl4TrICVyzLOdIYVzN0xxbgTkt1/Z+tNXQeUS1ktwtuJBSCN4QQ/7GhTAjSlgTo6
	 8Xuqzued4wcT5F+JJPpgE+di973bE4/IyVJXDVVk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C37A5F80507;
	Wed, 31 Jul 2019 13:20:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 14617F80133; Wed, 31 Jul 2019 13:19:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_PASS, URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B1B47F80133
 for <alsa-devel@alsa-project.org>; Wed, 31 Jul 2019 13:19:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B1B47F80133
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="PJKCzsXg"
Received: by mail-wr1-x434.google.com with SMTP id g17so69243842wrr.5
 for <alsa-devel@alsa-project.org>; Wed, 31 Jul 2019 04:19:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=iwm4409GkWSovNI5a28ZeCS8PpOJ5Po1sAR5h0Q4NOk=;
 b=PJKCzsXg02GfsV86/cw/f0DH7KxeKUmb+cOQqTvmpYx2AMUeoD1o0XZsGpzMELUNQX
 4/QZ5OFf5xGIuBMSzaDjOFymvkKZ3nXAD4JrzDt8V3sqZ8/656TN+XigWvf/ooS7BdOz
 EdfAY7IXmfQo91bXW8Wg7H/yjbNJwNCSfJsGOSHv0y6f4BbZtlcGB0j4iXAqk0TWOQGe
 EhHIFkDrm/q1K++ZrnJEw/60WVMs4DRqgyOYh3M2vhuSkQEX2HEBzagXdUF2OWPDdwEr
 +VOQLU1LOzaifKYyHgAFCEznHO3/HUWiT6T5VvP4m17Mla0g556Gt2RS6HAhub8xSRPW
 R7eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=iwm4409GkWSovNI5a28ZeCS8PpOJ5Po1sAR5h0Q4NOk=;
 b=pTrs14gDFtOeJ5+hx1xNn3fGjG9GC9tGU1yNEIHWsaqg7hDjNa9TAElM9xJOZBMI2s
 ZbpcNYcP8J55y7tSZN7mwxKDP4eTFLIq3WF70cjq2y7OjIKlGBuEmz1ZQQdqp/7Mrs6N
 456HVwbF3leaCyBl4WEWdTuTGQdUB51B3AtUjmtijzobSm/lUA2WcQa80bS3nyEsz3QP
 OTWdiFwMZMfOyj0WQTgv/oxk+ZukunSJJTJ9qM5Vaax7A4vDz5MBOpKYgBXYSpeiQnpr
 FU2/QkS2qHDjl67oKmVLdAqNbz8ZMy12cUPreJq5N3mABBf/ko/685rXMjvFSiyd2aip
 xtKg==
X-Gm-Message-State: APjAAAWeQpm3ZOYEECjklOnJT9LJCfgLxuCdkkN75K5Ay8zOF+Vf4EPY
 p4GGpi2U5hPBSxPfpVC/XLA=
X-Google-Smtp-Source: APXvYqyusirBoYaJR6jtqQDE+MJXX+qRWwQpfIKjRG9oNIFQoc6F7W7Yrb2A9IBm1sQmBxCcX0qtQw==
X-Received: by 2002:adf:df8b:: with SMTP id z11mr77357896wrl.62.1564571985817; 
 Wed, 31 Jul 2019 04:19:45 -0700 (PDT)
Received: from localhost.localdomain ([212.146.100.6])
 by smtp.gmail.com with ESMTPSA id b8sm88035205wmh.46.2019.07.31.04.19.44
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 31 Jul 2019 04:19:45 -0700 (PDT)
From: Andra Danciu <andradanciu1997@gmail.com>
To: broonie@kernel.org
Date: Wed, 31 Jul 2019 14:19:29 +0300
Message-Id: <20190731111930.20230-2-andradanciu1997@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190731111930.20230-1-andradanciu1997@gmail.com>
References: <20190731111930.20230-1-andradanciu1997@gmail.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, ckeepax@opensource.cirrus.com,
 daniel.baluta@nxp.com, kmarinushkin@birdec.tech, m.felsch@pengutronix.de,
 piotrs@opensource.cirrus.com, tiwai@suse.com, nh6z@nh6z.net,
 lgirdwood@gmail.com, paul@crapouillou.net, vkoul@kernel.org,
 robh+dt@kernel.org, srinivas.kandagatla@linaro.org, anders.roxell@linaro.org,
 rf@opensource.wolfsonmicro.com, linux-kernel@vger.kernel.org,
 jbrunet@baylibre.com
Subject: [alsa-devel] [PATCH 1/2] dt-bindings: sound: Add bindings for
	UDA1334 codec
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

The UDA1334 is an NXP audio codec, supports the I2S-bus data format
and has basic features such as de-emphasis (at 44.1 kHz sampling
rate) and mute. Product information can be found at:
https://www.nxp.com/pages/low-power-audio-dac-with-pll:UDA1334

Cc: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Andra Danciu <andradanciu1997@gmail.com>
---
 Documentation/devicetree/bindings/sound/uda1334.txt | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/uda1334.txt

diff --git a/Documentation/devicetree/bindings/sound/uda1334.txt b/Documentation/devicetree/bindings/sound/uda1334.txt
new file mode 100644
index 000000000000..f64071b25e8d
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/uda1334.txt
@@ -0,0 +1,17 @@
+UDA1334 audio CODEC
+
+This device uses simple GPIO pins for controlling codec settings.
+
+Required properties:
+
+  - compatible : "nxp,uda1334"
+  - nxp,mute-gpios: a GPIO spec for the MUTE pin.
+  - nxp,deemph-gpios: a GPIO spec for the De-emphasis pin
+
+Example:
+
+uda1334: audio-codec {
+	compatible = "nxp,uda1334";
+	nxp,mute-gpios = <&gpio1 8 GPIO_ACTIVE_LOW>;
+	nxp,deemph-gpios = <&gpio3 3 GPIO_ACTIVE_LOW>;
+};
-- 
2.11.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
