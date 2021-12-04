Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 99F124685AA
	for <lists+alsa-devel@lfdr.de>; Sat,  4 Dec 2021 15:40:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 299B122D1;
	Sat,  4 Dec 2021 15:39:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 299B122D1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638628835;
	bh=+yFzHirHX3Xclw/SmIm5qWAgpVbPdV5afTLP2mMhsRk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KcoLkIx+tf3IOwCBOwaALPp+xo9b+mj3Ary3WMTM5ua0ghZCK/kRfP3MBOSR/IelB
	 vsJKb1FsoQdFBe6bj0JBQtepwWsR42rP74oNPyMreQ8sdh1coXlilD4f3B9TkAXX4P
	 aTmk1XLaCAO4hv+lvq1H7KfVQhmweP9zK1mt7XCM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E1B08F80518;
	Sat,  4 Dec 2021 15:37:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A38D2F804F1; Sat,  4 Dec 2021 15:37:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C9048F804A9
 for <alsa-devel@alsa-project.org>; Sat,  4 Dec 2021 15:37:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C9048F804A9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="RNaLxgDC"
Received: by mail-lf1-x129.google.com with SMTP id f18so13795800lfv.6
 for <alsa-devel@alsa-project.org>; Sat, 04 Dec 2021 06:37:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TqYniy4pFRsXD92ySrc+ZxB/2v4IriL3y3/YUqS2PUE=;
 b=RNaLxgDCs6qXg/TwLlIXZzcLh4LJees5fE8xDEIukdb/OT7zBkOn507I9wRfW4w4xa
 niemSTpkq4n0nexvCghsEPDaa2xSzvEpS/WsEmx4EV03PZVyKUZtZlS7Cti2Kn+4gMYF
 J708JdarR4uxOSBnidMRRSiy2W6zsI1gXcaV3YFCIDJElDuSQASMDSwzTEERDBY6z/GJ
 Tu5cJSkY8ZKkzpgGoDlyMSgeZiQ9HNZLslB40hhiwbDCqsRMTPi2uMzO0H3DlBuUQz5i
 izOVMOtEV1I3PCwg+dtNL+UPSlH1eXaeVBZ7mKfa2tjeCrhdqFWl6mFiJFpGYAtZigR4
 SdmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TqYniy4pFRsXD92ySrc+ZxB/2v4IriL3y3/YUqS2PUE=;
 b=NmRZJpU3W2k7uHqvAayPs2l3Sg3MBQdgoehU0uWT0IA8BS6RieWelrL410EbfGafpY
 3nnmyoODAE6gMIq06h61R+/soiXqUp7R9G8qA94zcvt6SHyjzAqZn+k8WaUM4GyVp7gh
 gv4uWuVo1My0YbrKloxMpAi5XA3madU6KtuqIsdynMPMFWV0y1b4+jP+yGfwMcCzZmIN
 +W1QPMvAj9SF8IRpx07GugBaNQ3Z81E2Hg6yK6WCCvze/T1UCX8Fg3pvk33CCY38ONAr
 98AYUvf7Fm/Hx7Ui7kSq52hBreCeGEjZULO9Q8VrUuiPkIU3s9fviuNVtTnmS06Ack3J
 y1gg==
X-Gm-Message-State: AOAM53014E/jUBfp6nY5bAVwdDeTBxaFh27R0pLnM48CH+lE1TGhdgsT
 mziNhYmfim+ydqPy1RIeAU0=
X-Google-Smtp-Source: ABdhPJxlNR6C8CFHLRo5rqVDCMsVLSUpmIzAdsrAsZFFI4Y2oRrvmEXZzQFyeVHAejMo+rAPaIrc5w==
X-Received: by 2002:ac2:518b:: with SMTP id u11mr24097394lfi.498.1638628653644; 
 Sat, 04 Dec 2021 06:37:33 -0800 (PST)
Received: from localhost.localdomain (94-29-46-111.dynamic.spd-mgts.ru.
 [94.29.46.111])
 by smtp.gmail.com with ESMTPSA id g36sm782934lfv.16.2021.12.04.06.37.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Dec 2021 06:37:33 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Agneli <poczt@protonmail.ch>
Subject: [PATCH v4 03/22] ASoC: dt-bindings: tegra20-i2s: Document new nvidia,
 fixed-parent-rate property
Date: Sat,  4 Dec 2021 17:37:06 +0300
Message-Id: <20211204143725.31646-4-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211204143725.31646-1-digetx@gmail.com>
References: <20211204143725.31646-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 linux-tegra@vger.kernel.org
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

Reviewed-by: Rob Herring <robh@kernel.org>
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

