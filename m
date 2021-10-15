Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C3CA42F575
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Oct 2021 16:33:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2ACA64E;
	Fri, 15 Oct 2021 16:32:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2ACA64E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634308385;
	bh=OFSvcgs2CFcBd9pWRYowcprVnQ2ud4pNxHbhxblpsT8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=aj+uJqfHvtk3fVBJkLB7K3fyaFLKTVSrkcbxhg0rNuL7RHITDN025k47R/uC9m27s
	 DYfhXpdjFz0JVGCW9omBmTnNzKHl5y2wMygiAzvzYkDDfVO1yzF1b0UFFAi5U+tspy
	 FpXHzFQ1LBwR+Lj+tI4M49tU6j43H3g+OJrorBH0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9EE67F8025B;
	Fri, 15 Oct 2021 16:31:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 07983F80269; Fri, 15 Oct 2021 16:31:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5E8A8F8012E
 for <alsa-devel@alsa-project.org>; Fri, 15 Oct 2021 16:31:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5E8A8F8012E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="pmwrGi06"
Received: by mail-lf1-x12a.google.com with SMTP id u21so39417266lff.8
 for <alsa-devel@alsa-project.org>; Fri, 15 Oct 2021 07:31:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BOWkhXmRLradAC/GQ4VVcC6Y/gPQpSI6S5P1Mpfnvk8=;
 b=pmwrGi0629rfj6pWJFXZmdRQx60ZnAi+RezuMqoV9xHr0Moh8bpARW9ZsUFfEyEAy+
 xJCN1guTGVbG4ldgdiJKnYfCOJtkEw/BcPhS02+uRpuAkG8+ALUSU0EgLfApGqvjoIC7
 RFOcJMVZtsvKkdmsFFW8zJiKahdSun5IF2BDzPrV7W3uvcdH+2/Cy9o99gjZ/blLOpMh
 D+XqGp/jW6uiSobidR9H2P3P7xK8yiS7MOtgDCvbDe9mQfmozxiq3CLLQle5G9e1BNQf
 jb6/qumiVxrHnvaqVm0fN9p0sLgZbT8Tecsmv4p9WcbWUuQvSMs1atN0bApMvJWpPgr/
 tVLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BOWkhXmRLradAC/GQ4VVcC6Y/gPQpSI6S5P1Mpfnvk8=;
 b=s50chqi7geR6hgTl4ZAJAhDRvulXeLct0nm6L0zR9w7Z2q/pduVARtP8mirtpVYczk
 9B431ML7Z6Pr8TMPRN5A/Gne71i/3zp0DLX8jwW8aLdyOSlSHoBHtN3HPcsaTT0bGmUy
 2NyXgPmf/jKlxBuyM0VXCVtWeXPcdx9eIpkALqT7rKXgkRaDSv8F8CWoS06NC9RWkitM
 d35VsOiBvxP88HZaeigpQ9covAddsccW62O237yu9h76hTXr2fDM/Yd9qN2EGE0HJb07
 0keNN9Q6XXL368em/IyVqRsPaUfTR+KqACK/0xAdYD80LGSgl5FyzSGmH3bqJ0R1C5cX
 yTTw==
X-Gm-Message-State: AOAM530XslSP374WlkBERVNY34cjoMrxVeTQ2U8x4OZXj9bJ7a8ndirT
 MHct67b5b/8jrFzX3XUM0YM=
X-Google-Smtp-Source: ABdhPJyb7Io5HBfOR1Od1nJE8cceEaoAYKaT4OvEzqEQBBRoD5cqfwoaAwdgJNzZqfJWySJA7xQiIg==
X-Received: by 2002:a2e:7605:: with SMTP id r5mr1552093ljc.301.1634308300111; 
 Fri, 15 Oct 2021 07:31:40 -0700 (PDT)
Received: from localhost.localdomain (84-72-105-84.dclient.hispeed.ch.
 [84.72.105.84])
 by smtp.gmail.com with ESMTPSA id b18sm616475lji.99.2021.10.15.07.31.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Oct 2021 07:31:39 -0700 (PDT)
From: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>
To: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH] ASoC: dt-bindings: rockchip: i2s-tdm: fix rockchip,
 cru requirement
Date: Fri, 15 Oct 2021 16:31:14 +0200
Message-Id: <20211015143115.1445707-1-frattaroli.nicolas@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Rob Herring <robh@kernel.org>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org
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

The behaviour described in the bindings is exactly the opposite
of what it should be, so this patch fixes the description and
adjusts the if conditions for adding rockchip,cru to required.

Fixes: 510f1c133aed ("ASoC: dt-bindings: rockchip: add i2s-tdm bindings")
Signed-off-by: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>
---
 .../devicetree/bindings/sound/rockchip,i2s-tdm.yaml   | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/rockchip,i2s-tdm.yaml b/Documentation/devicetree/bindings/sound/rockchip,i2s-tdm.yaml
index ce3e18b50230..93f5221e9381 100644
--- a/Documentation/devicetree/bindings/sound/rockchip,i2s-tdm.yaml
+++ b/Documentation/devicetree/bindings/sound/rockchip,i2s-tdm.yaml
@@ -86,7 +86,7 @@ properties:
     $ref: /schemas/types.yaml#/definitions/phandle
     description:
       The phandle of the cru.
-      Required if neither trcm-sync-tx-only nor trcm-sync-rx-only are specified.
+      Required if either trcm-sync-tx-only or trcm-sync-rx-only are specified.
 
   rockchip,grf:
     $ref: /schemas/types.yaml#/definitions/phandle
@@ -147,8 +147,13 @@ required:
 allOf:
   - if:
       properties:
-        rockchip,trcm-sync-tx-only: false
-        rockchip,trcm-sync-rx-only: false
+        rockchip,trcm-sync-tx-only: true
+    then:
+      required:
+        - rockchip,cru
+  - if:
+      properties:
+        rockchip,trcm-sync-rx-only: true
     then:
       required:
         - rockchip,cru
-- 
2.33.0

