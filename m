Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B4DD245F1C0
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Nov 2021 17:22:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 240B119FD;
	Fri, 26 Nov 2021 17:21:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 240B119FD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637943760;
	bh=G+5sClwCEMLoGZCR5rOKJ7V+lGgpEeTe/4QSydrHLns=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=i4PLcDDQIsMfMkAX92pa0dImpu7Y8zlt7zIzivzEPJO4xBn0u8UmlFnmeLFucUKHj
	 p44Jkp1bOzMiMkKvpzrKkLRwhiVhnqCsyY1H1AgX6xjJNZ4wo8QEaUmj3iIJ9aHDl/
	 lkw4mjed2LhmY/+kracoxQMngy72/wfUJHiEJ4es=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B2864F80516;
	Fri, 26 Nov 2021 17:20:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 254C3F804CF; Fri, 26 Nov 2021 17:19:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1E327F80132
 for <alsa-devel@alsa-project.org>; Fri, 26 Nov 2021 17:19:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1E327F80132
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="LNs+LBfm"
Received: by mail-lf1-x136.google.com with SMTP id c32so25542969lfv.4
 for <alsa-devel@alsa-project.org>; Fri, 26 Nov 2021 08:19:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=po9scD5dBEjtGuaNhMEfvHFzFtb9Ravcd9iJs0UTlhE=;
 b=LNs+LBfmYL28Sq2zZuiCUBRiBODtL+mQpFsAHjq8Zns4ntquqRmiplXDwyVYKjduMI
 FbBQ996hudy2zR49koSrDFj5aYM3xtC0Kaxo2GgTTTeV4X8BH7GgRhIO5Apf8tgxGpz5
 XRw/giTB4gdN0aG+rI4CRwgaLfu98u4su4XqHszD+O3lUkEvkdo569+5zMcgIaKLb0r8
 TljFdnnVI1/a484vxfGIIbtn/uWJJQUAu+Ia18aV2wmvt9mtp8dQICwELCUZ/8Zi2DoA
 x4yqLx6ME4DKZWXHShFuwEmDl8iY+XJ0LJkhqFrjdD6Hpqd3JGLbLBx54DyeuGa2R1Bq
 T9vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=po9scD5dBEjtGuaNhMEfvHFzFtb9Ravcd9iJs0UTlhE=;
 b=2JRHOniCj+M3gcYsue6aYBc8ZDmlX2EbljVu3kCz7ddAKQhncRWPuo717tkMwt3SyM
 7xojzNhD1rp/a+wXCY3YKqhRF4Fc2Ya6aWJx7DJVIafKt6MqaH3StqVSr7XaYCpzHZD1
 rrfnfXG46wxb+aBjQt5ObIEbbwn1gEW7yICZuKUALrxZhDqCds9JbS+uN0NQ+5vdKrjs
 0hfTUFEe9Q3Z6xscPMUh5VVvRiA7JEvwqznx1b+0q9K6e/zXlAeGUEIL7rPm5EsXz9/y
 A9H9tVwBsuvStAN5Pozm5LEmwAbzqx9YE3D6xT16oTp0/G0tq3hVYEOoTztBMzycFQ4J
 072Q==
X-Gm-Message-State: AOAM531CTU4MkvZW6Bq/dw9Nfu2ykTSmmYdTraLoxr08AAf4XecYfmIx
 u6LI2hNHPdn2wEJHUToqVzk=
X-Google-Smtp-Source: ABdhPJxYVWZExVjYtIGn+qzQ1ofRZlsbTingOF1DzMsidrhuUxsrKi22yVGR0OWGg5FMU/aNw7eVXQ==
X-Received: by 2002:ac2:5cd7:: with SMTP id f23mr30678322lfq.153.1637943581509; 
 Fri, 26 Nov 2021 08:19:41 -0800 (PST)
Received: from localhost.localdomain (94-29-48-99.dynamic.spd-mgts.ru.
 [94.29.48.99])
 by smtp.gmail.com with ESMTPSA id t7sm613381lfl.260.2021.11.26.08.19.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Nov 2021 08:19:41 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Agneli <poczt@protonmail.ch>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v2 03/20] ASoC: dt-bindings: tegra20-i2s: Document new nvidia,
 fixed-parent-rate property
Date: Fri, 26 Nov 2021 19:17:50 +0300
Message-Id: <20211126161807.15776-4-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211126161807.15776-1-digetx@gmail.com>
References: <20211126161807.15776-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
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
index ad43b237d9af..68ae124eaf80 100644
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

