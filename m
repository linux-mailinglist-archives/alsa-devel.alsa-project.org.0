Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EE31313AAB3
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jan 2020 14:22:21 +0100 (CET)
Received: from alsa1.perex.cz (unknown [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6B2752DE2;
	Tue, 14 Jan 2020 10:49:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6B2752DE2
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CAF90F8014E;
	Tue, 14 Jan 2020 10:48:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D85C0F8014E; Tue, 14 Jan 2020 10:48:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CD741F800E9
 for <alsa-devel@alsa-project.org>; Tue, 14 Jan 2020 10:48:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CD741F800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="IQMFSASc"
Received: by mail-wm1-x341.google.com with SMTP id d73so12954288wmd.1
 for <alsa-devel@alsa-project.org>; Tue, 14 Jan 2020 01:48:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Av6R897MwPJYaUFbeySb8X+lrEgD6Ka/Lapd1oVQYxQ=;
 b=IQMFSAScN6150muQWE3TPyVLfIYy0czJHjwNWVAgkyvZgWPfBZ+eHuwWrjU1XkCaIP
 DK/TXzdz1mtJgYtcji134GMFQefvifRjx7TqE8h36Lj4HSs/GsBOaYILyJehZmDsajIg
 t9uAfiqDLs4MKErEtIrh9nKww4ji7pd2U1GEXPelhtjGAVG6ICG1HLRphdUhdUxFITFg
 Z1BdJJu8eGpHBCF/WmOeTlFtACpLVc0Ue6IhkfuXapPqfUjR94BFfuGBrkLNGJiCO0Rk
 6+ZZBu7YwK982Nr0ckvTTz8CjmqNjbQ4TK77dvdEQJo2QWw0Zb4T0Z3ivkC4LyB/u3tC
 FHMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Av6R897MwPJYaUFbeySb8X+lrEgD6Ka/Lapd1oVQYxQ=;
 b=UqmYG4E3YC0fzthOejCqPtgfpVC7jmtvwTt5Wi91BIP2Uekv+Q2lsbdk+/MiTN1Ksj
 fIunbWc/D69q+LrekRzE+7J31VlTfs2zhp/dgr+AWH+T3GzdVEwG8A5jIw/fTgDlE/aX
 mT7WF/PDlX9f3y/Jcj2oGmL4qqHBtm3f6nLTsCN5lv79FaJYMH2JFO9SAFY23DJA2YL5
 GCa7caHkKd2BibBO0hYKw68euiBwxHLaecg+p4oKoQNyP1FwsHbRDp3UmXfNG4ZOU2ZT
 iFq3sLcWbJ5R87QunJRxoYGCyBKk7cmQ11RD/Gkuyk92y5ByaYRden3tG5mrQJ/7qbzN
 Tw1w==
X-Gm-Message-State: APjAAAUqSnpFO4lAyzBD2BlKNWjmiNEdVXkzXtEpcn/G8ZR9Yl5fMw3L
 gLeZWUpXL5zpJIlI3J6WyGfHEA==
X-Google-Smtp-Source: APXvYqxf5aQ6H3nRjfBxIr795lLJZTMPfkO87+3kIpo/fctg5qDkW97JHna4R1IxAedKKdSVGpwsXQ==
X-Received: by 2002:a7b:c851:: with SMTP id c17mr26738795wml.71.1578995291824; 
 Tue, 14 Jan 2020 01:48:11 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.gmail.com with ESMTPSA id k16sm19277659wru.0.2020.01.14.01.48.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jan 2020 01:48:11 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: vkoul@kernel.org
Date: Tue, 14 Jan 2020 09:48:06 +0000
Message-Id: <20200114094806.15846-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Cc: robh@kernel.org, alsa-devel@alsa-project.org, broonie@kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 linux-kernel@vger.kernel.org
Subject: [alsa-devel] [PATCH] dt-bindings: soundwire: fix example
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

As wsa881x schema mentions #sound-dai-cells as required property,
so update soundwire-controller.yaml example so that dt_bindings_check
does not fail as below:

Documentation/devicetree/bindings/soundwire/soundwire-controller.example.dt.yaml:
speaker@0,1: '#sound-dai-cells' is a required property
Documentation/devicetree/bindings/soundwire/soundwire-controller.example.dt.yaml:
speaker@0,2: '#sound-dai-cells' is a required property

Reported-by: Rob Herring <robh@kernel.org>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 .../devicetree/bindings/soundwire/soundwire-controller.yaml     | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/soundwire/soundwire-controller.yaml b/Documentation/devicetree/bindings/soundwire/soundwire-controller.yaml
index 1b43993bccdb..330924b8618e 100644
--- a/Documentation/devicetree/bindings/soundwire/soundwire-controller.yaml
+++ b/Documentation/devicetree/bindings/soundwire/soundwire-controller.yaml
@@ -69,6 +69,7 @@ examples:
             reg = <0 1>;
             powerdown-gpios = <&wcdpinctrl 2 0>;
             #thermal-sensor-cells = <0>;
+            #sound-dai-cells = <0>;
         };
 
         speaker@0,2 {
@@ -76,6 +77,7 @@ examples:
             reg = <0 2>;
             powerdown-gpios = <&wcdpinctrl 2 0>;
             #thermal-sensor-cells = <0>;
+            #sound-dai-cells = <0>;
         };
     };
 
-- 
2.21.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
