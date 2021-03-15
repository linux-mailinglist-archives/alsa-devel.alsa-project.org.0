Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B6EF33C2E9
	for <lists+alsa-devel@lfdr.de>; Mon, 15 Mar 2021 17:59:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DBD4D17E1;
	Mon, 15 Mar 2021 17:58:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DBD4D17E1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615827572;
	bh=V50DLHwwgPw9VNIMeyaHP6rinDduzRgBIO4HGWNv8Kc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ewj/4vnk+wdz+385b13DYo2fD5Heh1zdqyRdDnj6jxsZPdeey6ZUF6EqMFelfVtRa
	 A7EMlSWgZXN+9lpJDsYgE12lXBNIeVAlfNsURuMkIgm2pnXnqegnHSyUCwItFNsvLZ
	 hTObpFB65JHRnchk1EUEAWdQBgyLf2Yua6UAz6Xc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0315CF8032B;
	Mon, 15 Mar 2021 17:57:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6A6E9F80272; Mon, 15 Mar 2021 17:57:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 94F4BF8013F
 for <alsa-devel@alsa-project.org>; Mon, 15 Mar 2021 17:56:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 94F4BF8013F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="hgOmJNEg"
Received: by mail-wm1-x32a.google.com with SMTP id d191so8516345wmd.2
 for <alsa-devel@alsa-project.org>; Mon, 15 Mar 2021 09:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Dw9cMYL3jtOlJaAZjl852OdyP+MrjSkhGMQF/GJ7398=;
 b=hgOmJNEgjoKRZJFLsQvmXzKGK0x6KpA7ts+E75YZSi7QZn+qZOS507y4wZdiB+K3yg
 qFF1KpqSP0gXwhKwQN8Bcd/gkNIkpaaRM92zi50lqMRsFVUxQTA0BgSZOapRo76i7GOe
 vlF9+LLtakDwOMZdFtlrxrdwoBnGLV3zdCF6TTyth2SEfCJZa6/JpAnHBR0n02NhLbdd
 MIBEXh5gV/lIxkZOdATeu8l2jsaZ0kTAFDaQyZCAF5LHrdvFkHMFo4DcsCNyCc0Dp5n7
 kxlaFq9kX3YOzm2tjYEwdDfzPNKIs/8fYgLJRwUwXM9gyflouEMti7ucdkQrRVRKO1DO
 NTNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Dw9cMYL3jtOlJaAZjl852OdyP+MrjSkhGMQF/GJ7398=;
 b=JkT5w9ucN2EmRjRNhjWqn7GS+/2SB9WHOuFBjMQTxnetpf9VFWoWQR/QTF+L3q/Prg
 JlH0FYhZVjqDszVN7SdV/Xgw4Wx4+O6Go3dyPCjemqaD5tD89Syrvzmm4pKi5JKcB0Hs
 9EN/1CwGTvOjXKK2x2xYVRUAK71BLZ7SGiOdLtHzjvE94WFMpmTYZiGbCiUTW1Y/92tz
 dY7udVP5EmEFdr2LK2oDERFUnbmxPiAbQWHaCcX26635Z4DgfaKRCq8Pw7pFEMpkOn0Q
 +94Vqrweh4mnlDegEz5vr761HzvZ6oZYGUc+TYkS8boBN7qu9CKvOxXqPjjJqjhhh4w1
 JRvQ==
X-Gm-Message-State: AOAM533B3qWzBl4sMjIbttLqvli2Mwi4dakE8mlXFZWaqqb/jgn29hA1
 YUmgUCYddkiDEWE8dYEa82p1mg==
X-Google-Smtp-Source: ABdhPJzMBv0pTbvIZlo/UdYjOAw45gYOiv83AQPqWmAq4/LN3KCPnChY4V557WPxobTeEkMKedyQfQ==
X-Received: by 2002:a1c:e389:: with SMTP id a131mr630946wmh.78.1615827417971; 
 Mon, 15 Mar 2021 09:56:57 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id o2sm227656wmc.23.2021.03.15.09.56.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Mar 2021 09:56:57 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org,
	vkoul@kernel.org
Subject: [PATCH v4 4/5] ASoC: dt-bindings: wsa881x: add bindings for port
 mapping
Date: Mon, 15 Mar 2021 16:56:49 +0000
Message-Id: <20210315165650.13392-5-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20210315165650.13392-1-srinivas.kandagatla@linaro.org>
References: <20210315165650.13392-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: robh@kernel.org, alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 pierre-louis.bossart@linux.intel.com, linux-kernel@vger.kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, sanyog.r.kale@intel.com,
 yung-chuan.liao@linux.intel.com
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

WSA881x SoundWire device ports are statically assigned to master ports
at design time. So add bindings required to specify these mappings!

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 .../devicetree/bindings/sound/qcom,wsa881x.yaml          | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,wsa881x.yaml b/Documentation/devicetree/bindings/sound/qcom,wsa881x.yaml
index ea44d03e58ca..491ce1270cb5 100644
--- a/Documentation/devicetree/bindings/sound/qcom,wsa881x.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,wsa881x.yaml
@@ -26,6 +26,13 @@ properties:
     description: GPIO spec for Powerdown/Shutdown line to use
     maxItems: 1
 
+  qcom,port-mapping:
+    description: |
+      Specifies static port mapping between slave and master ports.
+      In the order of slave port index.
+    maxItems: 4
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+
   '#thermal-sensor-cells':
     const: 0
 
@@ -54,6 +61,7 @@ examples:
             powerdown-gpios = <&wcdpinctrl 2 0>;
             #thermal-sensor-cells = <0>;
             #sound-dai-cells = <0>;
+            qcom,port-mapping = <1 2 3 7>;
         };
 
         speaker@0,2 {
@@ -62,6 +70,7 @@ examples:
             powerdown-gpios = <&wcdpinctrl 2 0>;
             #thermal-sensor-cells = <0>;
             #sound-dai-cells = <0>;
+            qcom,port-mapping = <4 5 6 8>;
         };
     };
 
-- 
2.21.0

