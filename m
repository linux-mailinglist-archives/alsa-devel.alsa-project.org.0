Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 223D919E4CB
	for <lists+alsa-devel@lfdr.de>; Sat,  4 Apr 2020 13:55:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4527E1684;
	Sat,  4 Apr 2020 13:54:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4527E1684
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586001311;
	bh=+0qzPleM6LaDg7z9hgC73FCUyZiBTSFAjdFv7h5QrkQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rV2Qqhugld6pld0q5hZIfo9Ub4mIGDDXg2IPlqNQ/DgkLbv/WEabuzLMvSC7VOi7n
	 TG3ywPQqxsIRq4cdLsUigGgvCTvyAJ5JV0/tp7VKFilz8VFaZJ1QsraIsC0xmTac6c
	 OsX55cPi+gQymRBoYgQSGDQzlr8JaojYu8nXoUNg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2DD77F801F2;
	Sat,  4 Apr 2020 13:52:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B9585F80148; Sat,  4 Apr 2020 13:52:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5919CF80146
 for <alsa-devel@alsa-project.org>; Sat,  4 Apr 2020 13:52:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5919CF80146
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="IQ1elwuQ"
Received: by mail-wm1-x342.google.com with SMTP id z7so9807580wmk.1
 for <alsa-devel@alsa-project.org>; Sat, 04 Apr 2020 04:52:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=NEH69Or2hzeYwgynW/zdgYOrxtAvoDOcH/4r2+cx3GQ=;
 b=IQ1elwuQfrv7z7KBKqsfXe+nJtZ9EpUmkp/QEgxZh1eGAsSzPCh4Pw9aelJPkO1lwd
 GeHg5B8Yg8SksRakKG3s5qyUWai+DwoUPCZzPAX9VG59mZ3lxjpIlgM0qT2LqFV6RMDS
 EzQPLB+oY5i/+g/hbAt3vmNL/foVckzdilsQWAa85V+uD0PM+vwECrMcaaBiGOvtVXMO
 aOuDKZxfO2lKiCVnsOC0uXYKUNBEplAHX6PjShJbIFLpuaLTL+JD2FH7FdjUgA778seH
 R9zIV+cnmbX28Q/5I+reBqMmD5G6QBn6dCZ1GnBrfcinWAFvtlhPJuY7FBJqNa7HtoEE
 ZlKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=NEH69Or2hzeYwgynW/zdgYOrxtAvoDOcH/4r2+cx3GQ=;
 b=fxwrCeLFFChocMj3jVBtdHZz6DHdc+Ry66PPhDrTB6JV95zqSMiGID1Vg4b81UF5RG
 uxGAfBh9qD0Zs3vFRy60groxnvYyG03z3gnlE/lAIveoIHgsZZW1rnDeA1eUwlaRadov
 JKYgYvROkHHVv3QyUIDT2mTVBg27+SXGInHCMFAwjkk4JQleza8a+psU+/SNirCwR3LE
 4fkQdxldgDHR9B8gXOgP1+cwvUObMdQg8TxO5OZN9T67Ja4lbuxT0Szf1Os8tkBHTC82
 bJTqZPMnB1a8fUdl7oHYBRM5ZVCQOlI1T6xjx7r9qCFkdwiYNF7bkBPpir8GKsarrDNI
 2ciw==
X-Gm-Message-State: AGi0PuZ+JBCFCzAcxWnKqsUgK/ktsD6xa54rx07XQNWfjwgY3so7ImqH
 puvUg5+Z8DKYO7Mtq30DHbk=
X-Google-Smtp-Source: APiQypLsS+luw94/uZOvPuvg8cKZwf3UNkI9eP06vdLN8Yj2UZWLbMLjom9VgzDkuQr2GPlhAP/WPg==
X-Received: by 2002:a1c:cc11:: with SMTP id h17mr13428237wmb.39.1586001153735; 
 Sat, 04 Apr 2020 04:52:33 -0700 (PDT)
Received: from debian.home (ip51ccf9cd.speed.planet.nl. [81.204.249.205])
 by smtp.gmail.com with ESMTPSA id g186sm16183276wmg.36.2020.04.04.04.52.32
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 04 Apr 2020 04:52:33 -0700 (PDT)
From: Johan Jonker <jbx6244@gmail.com>
To: lgirdwood@gmail.com
Subject: [PATCH v3 2/3] dt-bindings: sound: rockchip-spdif: add
 #sound-dai-cells property
Date: Sat,  4 Apr 2020 13:52:24 +0200
Message-Id: <20200404115225.4314-2-jbx6244@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200404115225.4314-1-jbx6244@gmail.com>
References: <20200404115225.4314-1-jbx6244@gmail.com>
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
so add them to 'rockchip-spdif.yaml'

Signed-off-by: Johan Jonker <jbx6244@gmail.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
Changes v3:
  Add reviewed by
---
 Documentation/devicetree/bindings/sound/rockchip-spdif.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/rockchip-spdif.yaml b/Documentation/devicetree/bindings/sound/rockchip-spdif.yaml
index bfd44fd8e..f381dbbf5 100644
--- a/Documentation/devicetree/bindings/sound/rockchip-spdif.yaml
+++ b/Documentation/devicetree/bindings/sound/rockchip-spdif.yaml
@@ -57,6 +57,9 @@ properties:
       The phandle of the syscon node for the GRF register.
       Required property on RK3288.
 
+  "#sound-dai-cells":
+    const: 0
+
 required:
   - compatible
   - reg
@@ -65,6 +68,7 @@ required:
   - clock-names
   - dmas
   - dma-names
+  - "#sound-dai-cells"
 
 if:
   properties:
@@ -90,4 +94,5 @@ examples:
       clock-names = "mclk", "hclk";
       dmas = <&dmac1_s 8>;
       dma-names = "tx";
+      #sound-dai-cells = <0>;
     };
-- 
2.11.0

