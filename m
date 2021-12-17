Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 86E42479363
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Dec 2021 18:59:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DB33A2080;
	Fri, 17 Dec 2021 18:59:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DB33A2080
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639763995;
	bh=2Ol8abKGc+zskkMapnQKJNkYYl2bq1CyrDrpn/+MGgA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=B74eCb+d7ky8RvYQQWKB9NYtqWQBW3TqfA1yxIRY96ozJea6T50y/L6QU9X6HoV6o
	 MkljmNxOIMEqtn+/SSObfaJjS0BqFjF2aBuy/BJ/1azhtEbl3rd8mFRPUcCMv91g2a
	 d2N9S7efDp5DDKvxs8SeETieNFHNZYdBiY5h0I80=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 05FF4F802A0;
	Fri, 17 Dec 2021 18:58:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E7952F804CA; Fri, 17 Dec 2021 18:58:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2F42CF80161
 for <alsa-devel@alsa-project.org>; Fri, 17 Dec 2021 18:58:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2F42CF80161
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="gd63/Dw9"
Received: by mail-lf1-x12f.google.com with SMTP id t3so6172165lfe.12
 for <alsa-devel@alsa-project.org>; Fri, 17 Dec 2021 09:58:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=s/Bk94jGQ1LLUV/eRDOVPSiVwi8PZOkXJ4VQl4ZqdBQ=;
 b=gd63/Dw9Nrlh//jLnmbfLktqpbCfnCD3MEQ9pshOVhQ2eQsgiaFVevrd/BHZ8mEqP/
 4Gw3BmuYCVBIjn5/H8W9nYnUXgTg2/O6WnKwRvGBtPtcsoV3P4BaaNNbRl+zAOMMf56t
 AvWvQO+fG8YS+Nku5Xh0aY7fRG5K7h2H+cObqJtjnNUM9CLiM+Zhqm0+imnsBcpwJUoH
 +znY2TxLKLVZKO5Z39+heBCOZ1JMBODO0DjWMA2rrqye26kYK/T6Jh+pmXMYxIrea17L
 gzJ1yec4Gb60E8nyQGKAXn/8rHwAbnz7meXhwMquCDQztKygRaRVy8zZurWIf3FG/D6j
 kpIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=s/Bk94jGQ1LLUV/eRDOVPSiVwi8PZOkXJ4VQl4ZqdBQ=;
 b=eBq1U9NtApwglXEropCmx6KnkVF2nkp44SfSdcz30bFodaGrHSsCz8qyDAHN+vOarl
 4MywB0T7tUXG1npo8WglG+kDwbqP0w8PXYvgXNYETb0BMaIVX05bY9NM8rQhSYxybvgZ
 yQTlUsANXvvBO2xvMheJf1I9JvDw7Oxa/dPh2BDWFvJN8O7woQN5clv1l2xRU2k3Vn0j
 Rn+5IPsA2MMpXKSbVLVfT0jq/UsYFcHEE3Rash07tkVopruS+fizEnsSc7Xe+jx7T22h
 10cjp7IkUJjxkRKQLqnR6PFrzUW+eG1On/TfgCnqOn0B6bdCks6gh6XqfIdjROgRJFkc
 iqHg==
X-Gm-Message-State: AOAM533V0jHcVOfQDMrVb75qaLxeaoMvQeIvMWaTftny9M8xqX2YdZB+
 kA9MJTf5Qhx2EJEMR1Z0FYY=
X-Google-Smtp-Source: ABdhPJzKaTTjJXre0dua8RwNlcxh74FOq2omKWYA7DY5cm1l0mFZGhkM+tnLSdB8x+VlxMCmD1u4NA==
X-Received: by 2002:a05:6512:3f98:: with SMTP id
 x24mr3789088lfa.87.1639763886133; 
 Fri, 17 Dec 2021 09:58:06 -0800 (PST)
Received: from localhost.localdomain (94-29-63-156.dynamic.spd-mgts.ru.
 [94.29.63.156])
 by smtp.gmail.com with ESMTPSA id w23sm1479244lfa.191.2021.12.17.09.58.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Dec 2021 09:58:05 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Agneli <poczt@protonmail.ch>
Subject: [PATCH v5 03/11] ASoC: dt-bindings: tegra20-i2s: Document new nvidia,
 fixed-parent-rate property
Date: Fri, 17 Dec 2021 20:55:58 +0300
Message-Id: <20211217175606.22645-4-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211217175606.22645-1-digetx@gmail.com>
References: <20211217175606.22645-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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
Acked-by: Thierry Reding <treding@nvidia.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 .../devicetree/bindings/sound/nvidia,tegra20-i2s.yaml      | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra20-i2s.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra20-i2s.yaml
index 4c00fd0943c3..0572aceca8ab 100644
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

