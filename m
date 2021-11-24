Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5930045CFD1
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Nov 2021 23:08:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7BF6317E6;
	Wed, 24 Nov 2021 23:07:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7BF6317E6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637791704;
	bh=+dF1qh0+Gqkva+s7T5FctA4V9oME9sOpX1bTESqLD/Y=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kDVSfThVYg3DgsnKoEU8bvqbRAgFnRpB7/vWQEQ5I68eCo7Z3pdP6wLKkUc5jSwOd
	 6vmvD0XNWcFXZa8UhpKtgWNda063ABWLxsweIsfrFBIFbYILkHD6O/mND7Kw8QTMpw
	 bPzjc8SYXCTvvqhdkQ0vu0oAnnMLUDOBgaN7wG6c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 47742F804EB;
	Wed, 24 Nov 2021 23:06:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A9783F804AD; Wed, 24 Nov 2021 23:06:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B444EF8014D
 for <alsa-devel@alsa-project.org>; Wed, 24 Nov 2021 23:06:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B444EF8014D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="NnGQjYeM"
Received: by mail-lj1-x230.google.com with SMTP id u22so8382035lju.7
 for <alsa-devel@alsa-project.org>; Wed, 24 Nov 2021 14:06:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=piUl9l4MQ9w1o9KgxY94nBJ6EwDi73VAxTX3rtlk9+s=;
 b=NnGQjYeMF7hAh3MvNIYc14WpNok1tPGHyd1qnl/CGxuC+gbNQCaXAPra1OaALM+Bcj
 Ba16/vKJx+czY7gUhwlanY6zp1lXw2Z0rH0G8iZNes7WdJkB0wspYS+G/h61RDgKJSR0
 MGHSYJZfcQKuLEEC17W5xAId3EV/xQkQZBqjGUVtA+NGMq/VLLBMuffjjTlKbnu3dwFw
 V0kvvVOREK4dIEKpxxid4r23XsFL91vPkgOVTUw4E98V5/KCjrgQnG2gIcTBUskM+Aeb
 2AL6qhW/16WZmPfp8lLHwhGJ6DWls1++NZr2CDkSIHB8Sg+y0OQUBbmeS33FhJq1UkTZ
 dSZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=piUl9l4MQ9w1o9KgxY94nBJ6EwDi73VAxTX3rtlk9+s=;
 b=rxupLyFo8S/lRiMWwcK2O6GYE0sM4Rubt3Ir+S2z8ahW/q3+aO74SKzv/4Eh+N/0dp
 xawH9mY5C9IHPJ9dOsxpZ7BHSKVul+ZqSv9D6KDo3OFt9neBZ1Pc484o6y7oX84V4Gdk
 9xYfhkTqm52x3APdr6fFUB4x7nAR67kp4iTuPqCaEGHZhLz7JhTIYuEkjiaLF09puP6m
 NPwTEMriXFA7SsqxTad8hej2kwtCmpi2yuYybguYeOzvhiQdwCKa7GwYxdo3vX+mrQRH
 72q9m2nLY86E5I/b9X28SpjBxT5a4UiGw5MIL7qvgwd7h1U+xthrCqLsE1uweMbY6lX3
 fvWQ==
X-Gm-Message-State: AOAM5310QnbNiXvddWiczKrbfbw0pAGvcd2auQ2/vf32Gj/DRgwimsxg
 8J9KLVpv6o2aASZi+l3JDhY=
X-Google-Smtp-Source: ABdhPJyC5uiCLhekgH2zxjYZ7iOS2JEJsVe0rvh5Rs4pecyXEimPxIdfdARMrq1pZ88KSK26qXk7Jg==
X-Received: by 2002:a2e:9017:: with SMTP id h23mr19436751ljg.13.1637791592719; 
 Wed, 24 Nov 2021 14:06:32 -0800 (PST)
Received: from localhost.localdomain (94-29-48-99.dynamic.spd-mgts.ru.
 [94.29.48.99])
 by smtp.gmail.com with ESMTPSA id w17sm93266ljh.15.2021.11.24.14.06.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Nov 2021 14:06:32 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Agneli <poczt@protonmail.ch>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v1 03/20] ASoC: dt-bindings: tegra20-i2s: Document new nvidia,
 fixed-parent-rate property
Date: Thu, 25 Nov 2021 01:00:40 +0300
Message-Id: <20211124220057.15763-4-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211124220057.15763-1-digetx@gmail.com>
References: <20211124220057.15763-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Document new nvidia,fixed-parent-rate property which instructs that this
board wants parent clock to stay at a fixed rate. It allows to prevent
conflicts between audio components that share same parent PLL. For
instance, this property allows to have HDMI audio, speaker and headphones
in the system playing audio simultaneously, which is a common pattern for
consumer devices.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 .../devicetree/bindings/sound/nvidia,tegra20-i2s.yaml      | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra20-i2s.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra20-i2s.yaml
index cd87eb4ef995..28f964c759f6 100644
--- a/Documentation/devicetree/bindings/sound/nvidia,tegra20-i2s.yaml
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra20-i2s.yaml
@@ -42,6 +42,13 @@ properties:
       - const: rx
       - const: tx
 
+  nvidia,fixed-parent-rate:
+    description: |
+      Specifies whether board prefers parent clock to stay at a fixed rate.
+      This allows multiple Tegra20 audio components work simultaneously by
+      limiting number of supportable audio rates.
+    type: boolean
+
 required:
   - compatible
   - reg
-- 
2.33.1

