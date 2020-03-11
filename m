Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D221183203
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Mar 2020 14:50:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C19A51710;
	Thu, 12 Mar 2020 14:49:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C19A51710
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584021038;
	bh=fPgqpanMx36NoD3q5qdB4wlyAOPZrp3h4KxFVlbT1Ss=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=twD5yVeU230oKJdigB8TeZzIpJLNllNYA3QC7bjokNlOmEOMPi5qYaomYUxmzKixB
	 wwtx44G74JKGl6yGrEuzJpXBbIzZHuWxwBO+sC4zu6gYdCZ7+rqaX/fsVKmFBM9M/K
	 bUegvxQx6jqAfpdknlmIjRMBaLYLnkn5wfR+ak9w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 245BBF802BC;
	Thu, 12 Mar 2020 14:48:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D1B33F801EB; Wed, 11 Mar 2020 18:43:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9AF28F800BE
 for <alsa-devel@alsa-project.org>; Wed, 11 Mar 2020 18:43:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9AF28F800BE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="noA+/Z1E"
Received: by mail-wm1-x341.google.com with SMTP id g62so3118352wme.1
 for <alsa-devel@alsa-project.org>; Wed, 11 Mar 2020 10:43:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=2AsgLfDS4BH//bZzgWykwkfl2H5xfBl7A5I1f5MVUhg=;
 b=noA+/Z1EG3yGGgsXsC3y4RHI7uOm1qZ3feLx1mroJlFFWwEH4nPGzOdJY2WeYCDqko
 rfb5yFjjPfD6VFWhKPBS/cGHC6sJ/xh4uKadBsoJE7yhAW8VVNT5OnxXjUxP9NlSZkB6
 V9UFsnuCu25buJPjoWovmUTCGtLIlxBUE9oZTZX9YAyIRWr6g7FDSwNkP3SALevEnjdy
 X08kf2GRkmZ/F6jb9RlouPZAlvA44bxzRj0VROfW3N6OUFCUpzxY6hHBcdKWgk7Bguak
 OoSslOOoA9z0yf3oATpR/5CEB+uk4Z6HQHw0LEJztYZRESj67kK3amEz4RAZ8AiM1EyF
 sdvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=2AsgLfDS4BH//bZzgWykwkfl2H5xfBl7A5I1f5MVUhg=;
 b=iZ0rvO+yat0itjVBkG7TnEve8E8Lc4XzAco/CRjqB9Hz7qs0RA1KTDEuS/XSj2Ckds
 irA1IhpMxbXOs6dodeFqg34vzgpWuApMsKTGrsp7SJ/oOTWk0rnXTGfaWjQEn1cghSXN
 0UQ5EBy/V7nMCD4ECouYUkbYUrQ10gx8QmG6/4VC+24KTLWERlxWRIQct0ZPKSn6ozHr
 x8T9YdxV+7w9+UiCVEx5xbsVz9ORDKS/tuEJiVwVKtFa94jsQvC5HGCkmpiwYv+fhJua
 85QBK6U0DRt4wkCcMap4VR4G7B08j4bh43ATpydCz/Wm4raa8BNeNFENLCUDiv6XgocX
 1pVQ==
X-Gm-Message-State: ANhLgQ2wzuNyU34k5MJlNOW0C4OHBVocDIp7f3kQacUHA9oOhd616SiM
 d8UWYcLos/sQFGjBVLB97S4=
X-Google-Smtp-Source: ADFU+vsGIHuUFLLALx+EZj11W8sJMVfT8mLaq6XyHbUXZwurQL5aYlv5E13r2MsZ4Y6uPYTI1JfqPQ==
X-Received: by 2002:a1c:ab07:: with SMTP id u7mr4521159wme.23.1583948611726;
 Wed, 11 Mar 2020 10:43:31 -0700 (PDT)
Received: from debian.home (ip51ccf9cd.speed.planet.nl. [81.204.249.205])
 by smtp.gmail.com with ESMTPSA id d1sm8933166wrw.52.2020.03.11.10.43.30
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 11 Mar 2020 10:43:31 -0700 (PDT)
From: Johan Jonker <jbx6244@gmail.com>
To: lgirdwood@gmail.com
Subject: [PATCH v1 2/2] dt-bindings: sound: rockchip-i2s: add #sound-dai-cells
 property
Date: Wed, 11 Mar 2020 18:43:22 +0100
Message-Id: <20200311174322.23813-2-jbx6244@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200311174322.23813-1-jbx6244@gmail.com>
References: <20200311174322.23813-1-jbx6244@gmail.com>
X-Mailman-Approved-At: Thu, 12 Mar 2020 14:48:14 +0100
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, heiko@sntech.de,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-rockchip@lists.infradead.org, broonie@kernel.org,
 linux-arm-kernel@lists.infradead.org
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

'#sound-dai-cells' is required to properly interpret
the list of DAI specified in the 'sound-dai' property,
so add them to 'rockchip-i2s.yaml'

Signed-off-by: Johan Jonker <jbx6244@gmail.com>
---
 Documentation/devicetree/bindings/sound/rockchip-i2s.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/rockchip-i2s.yaml b/Documentation/devicetree/bindings/sound/rockchip-i2s.yaml
index eff06b4b5..7cd0e278e 100644
--- a/Documentation/devicetree/bindings/sound/rockchip-i2s.yaml
+++ b/Documentation/devicetree/bindings/sound/rockchip-i2s.yaml
@@ -77,6 +77,9 @@ properties:
       Required property for controllers which support multi channel
       playback/capture.
 
+  "#sound-dai-cells":
+    const: 0
+
 required:
   - compatible
   - reg
@@ -85,6 +88,7 @@ required:
   - clock-names
   - dmas
   - dma-names
+  - "#sound-dai-cells"
 
 additionalProperties: false
 
@@ -103,4 +107,5 @@ examples:
       dma-names = "tx", "rx";
       rockchip,capture-channels = <2>;
       rockchip,playback-channels = <8>;
+      #sound-dai-cells = <0>;
     };
-- 
2.11.0

