Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E3D246CAB5E
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Mar 2023 19:03:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7D30C20C;
	Mon, 27 Mar 2023 19:02:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7D30C20C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679936604;
	bh=G5s84JOt25AW8ke97a6lNdbG8l944vOvO2QyKPHShWs=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=dYZIV3YichdF0ll6LfqNtJnNjG/0bPqjFrFSXCcFsy+Ug/Vumi5hKl8Yn3sKTIU/3
	 mso1Xi2vz3pj376zOYOov9PMkMz+336BIYEddtoZhszxnpk+prJEavIaAcwEncRVZ1
	 wbUGEbguPx3tn3uKZAziF0XwlHn0dTy5yF/PlHp0=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B6A3DF8024E;
	Mon, 27 Mar 2023 19:02:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AF4D2F80272; Mon, 27 Mar 2023 19:02:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com
 [209.85.160.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 51D3DF80249
	for <alsa-devel@alsa-project.org>; Mon, 27 Mar 2023 19:02:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 51D3DF80249
Received: by mail-oa1-f47.google.com with SMTP id
 586e51a60fabf-17aeb49429eso9964391fac.6
        for <alsa-devel@alsa-project.org>;
 Mon, 27 Mar 2023 10:02:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679936541;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SeYOWo17NBb5LwjtRv9cwvlWMOg9Mhp9twhBeVekPd8=;
        b=qT/ZOiQkYhOhBxnnhQXOamC6b6hLtR5VUDbu6BC3iFw1EOcowOYcwuvVsJr9JsVQwC
         zfZsitIobS4sezozBiMd/683J3JldR0B1dhMoQmsxUaf4Yh7NurBiO5uhV/TQGQzdN9Q
         VOeumfPbjXCE7jkwU5AEdmggbcQFfvll2otUVGdjVsV3pzfot7AAAIxd3XDVvf0eOiEk
         /e75uzz0dn3Xwem1weUyLqPLcDJM5isCQ5bobQmhGv9KyciWABi7Rc9op9Sw5sHx74do
         XSBELv8H+L+LvrSau71kX7LSe2PlGI53QOjGAsvQZjczWb9K7rIlUgx9z+8jWvMZRIxF
         2IZA==
X-Gm-Message-State: AO0yUKW0fVJK2uwHsz6uK9t4D8WWaqJdPfJUt8I4EnNx3PHpKtO2lNiB
	YtgG3FN5D8A1hHuqcgBi+Q==
X-Google-Smtp-Source: 
 AKy350bYJwV674V/NT/QiO8BH27KTt+gXSM0CYfo27RZ2Hy/c9vYRecH/gvO1mw2vV9rm/kYGBxvUw==
X-Received: by 2002:a05:6870:3385:b0:177:8358:d03e with SMTP id
 w5-20020a056870338500b001778358d03emr7884692oae.16.1679936540740;
        Mon, 27 Mar 2023 10:02:20 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id
 y81-20020acae154000000b003878631adaesm2916056oig.52.2023.03.27.10.02.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Mar 2023 10:02:19 -0700 (PDT)
Received: (nullmailer pid 4107685 invoked by uid 1000);
	Mon, 27 Mar 2023 17:02:18 -0000
From: Rob Herring <robh@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Souradeep Chowdhury <quic_schowdhu@quicinc.com>
Subject: [PATCH] dt-bindings: soc: qcom: Drop unneeded quotes
Date: Mon, 27 Mar 2023 12:02:04 -0500
Message-Id: <20230327170205.4106310-1-robh@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 7626FOYUI6PYN6H4TWMTWRCZEURUQZH2
X-Message-ID-Hash: 7626FOYUI6PYN6H4TWMTWRCZEURUQZH2
X-MailFrom: robherring2@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7626FOYUI6PYN6H4TWMTWRCZEURUQZH2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Cleanup bindings dropping unneeded quotes. Once all these are fixed,
checking for this can be enabled in yamllint.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/soc/qcom/qcom,apr.yaml     | 4 ++--
 Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml     | 4 ++--
 Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml | 4 ++--
 Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml | 4 ++--
 Documentation/devicetree/bindings/soc/qcom/qcom,smem.yaml    | 4 ++--
 Documentation/devicetree/bindings/soc/qcom/qcom,spm.yaml     | 4 ++--
 Documentation/devicetree/bindings/soc/qcom/qcom,wcnss.yaml   | 2 +-
 7 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,apr.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,apr.yaml
index 6026c21736d8..dfcd41429d25 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,apr.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,apr.yaml
@@ -1,8 +1,8 @@
 # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: "http://devicetree.org/schemas/soc/qcom/qcom,apr.yaml#"
-$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+$id: http://devicetree.org/schemas/soc/qcom/qcom,apr.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Qualcomm APR/GPR (Asynchronous/Generic Packet Router)
 
diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
index c98aab209bc5..14dd29471c80 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
@@ -1,8 +1,8 @@
 # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: "http://devicetree.org/schemas/soc/qcom/qcom,eud.yaml#"
-$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+$id: http://devicetree.org/schemas/soc/qcom/qcom,eud.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Qualcomm Embedded USB Debugger
 
diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml
index ab4df0205285..8a4b7ba3aaf6 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml
@@ -1,8 +1,8 @@
 # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: "http://devicetree.org/schemas/soc/qcom/qcom,geni-se.yaml#"
-$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+$id: http://devicetree.org/schemas/soc/qcom/qcom,geni-se.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: GENI Serial Engine QUP Wrapper Controller
 
diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml
index 16fd67c0bd1f..abb3bfde85a8 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml
@@ -1,8 +1,8 @@
 # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: "http://devicetree.org/schemas/soc/qcom/qcom,smd-rpm.yaml#"
-$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+$id: http://devicetree.org/schemas/soc/qcom/qcom,smd-rpm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Qualcomm Resource Power Manager (RPM) over SMD/GLINK
 
diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,smem.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,smem.yaml
index 497614ddf005..bc7815d985e4 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,smem.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,smem.yaml
@@ -1,8 +1,8 @@
 # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: "http://devicetree.org/schemas/soc/qcom/qcom,smem.yaml#"
-$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+$id: http://devicetree.org/schemas/soc/qcom/qcom,smem.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Qualcomm Shared Memory Manager
 
diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,spm.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,spm.yaml
index aca3d40bcccb..20c8cd38ff0d 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,spm.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,spm.yaml
@@ -1,8 +1,8 @@
 # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: "http://devicetree.org/schemas/soc/qcom/qcom,spm.yaml#"
-$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+$id: http://devicetree.org/schemas/soc/qcom/qcom,spm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Qualcomm Subsystem Power Manager
 
diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,wcnss.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,wcnss.yaml
index 0e6fd57d658d..74bb92e31554 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,wcnss.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,wcnss.yaml
@@ -20,7 +20,7 @@ properties:
 
   firmware-name:
     $ref: /schemas/types.yaml#/definitions/string
-    default: "wlan/prima/WCNSS_qcom_wlan_nv.bin"
+    default: wlan/prima/WCNSS_qcom_wlan_nv.bin
     description:
       Relative firmware image path for the WLAN NV blob.
 
-- 
2.39.2

