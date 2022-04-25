Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C4B450E95A
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Apr 2022 21:18:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0ABF7185F;
	Mon, 25 Apr 2022 21:17:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0ABF7185F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650914288;
	bh=BHkbFieUvGnwX2fhvhgDpQRcmifkCIZjsIOPpiD3XkA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Iu7/6iRdqs9UcXhUVoseCNpy/ZGOt95yRDXzP9612ZxkjZ574LIvXjaJqVRZ7y2+Z
	 WOD0ICJoHsFqQ0NPMTqneH2/+4eyXEX9CTIBGEVl7zOdja2ROP1SjOioA+du16woth
	 E8YfFV36mLG1sMHghweBY9Os6X3WsaiSUjOoA8GM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 38A81F80507;
	Mon, 25 Apr 2022 21:16:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8BF49F804FD; Mon, 25 Apr 2022 21:16:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [IPv6:2607:f8b0:4864:20::d2d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0FA76F804FD
 for <alsa-devel@alsa-project.org>; Mon, 25 Apr 2022 21:16:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0FA76F804FD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="HWUjQGjT"
Received: by mail-io1-xd2d.google.com with SMTP id i196so16968678ioa.1
 for <alsa-devel@alsa-project.org>; Mon, 25 Apr 2022 12:16:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BxXxbzDjMenOqOAuojI2CslyTve9CHii7Q71V+UKLO0=;
 b=HWUjQGjTzvT8tPqeHwwkOAz3LzZEfCIbSnYQf6SVoztUA7hat0ZixdZA/SEU1HB63l
 iiFkfAmsOXb9jf6i4I/6BqPPvtaXaTQ3sxHeTXKnm71pgQWPRVPk2QZIRboz839RKaIB
 a8PVuvEhcLywAOWvFLwKiH+nrSxoGZ3dpc9P2XdOI2Bw3/2EhwsANwtMke6TvwLbiESi
 Tp22esfRZTtjTm/oGGFI3+frGveI+bpiwVLUX1MWZhnDlETOY+FD1DUs1FJMV/glyKos
 44ErCjmrqwSfCr137D8iuxlaj4ptevsjqj2f/4dIuEonsJuYujhShNiaW+pl22awGmaP
 t8Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BxXxbzDjMenOqOAuojI2CslyTve9CHii7Q71V+UKLO0=;
 b=LumP3PCuN2QHauS3jNuDFDNlWyIy1BmrHZ5+B86uNzTeotsN/BLF0JrZm4ct7A83/5
 t4RY40ZQIlHlvxwWySJimbmo+oPDyaIZq5uyk+dQB464RwW0W5FpodynjaFoeaDDIJlR
 kR8DhaYAhoOEYNSoEKw62cgyXfJ3lkJpvCPg0pbtmYLRAAk4Ab4KMyTqwOzx7LVwLdxf
 tN3soZyCCrgmrFTh+9CI5WqZVci+ccHHQvcwzpSw419eHyee1YTDKa42GgpkpwkkJMx/
 toEWLlRxKKIqzjn5xojQNNjzRiU9N+dsYbCyxIheHRvxo+hoW3fGyLZtlPVc8fMDVbNt
 I+ew==
X-Gm-Message-State: AOAM532jzVw/pGpDgswOEZkfGZWbZ3udyYpm27NYbhU+2a5zbK6wOfrp
 tmh+bpWvJ36uh5FSFm1fdYo=
X-Google-Smtp-Source: ABdhPJxev6uY+K4lFE+dwSobCuC0fgQnuqyexP+hWilAeYlV1th45k/U4gn4yj/huTdNrWFVi74THw==
X-Received: by 2002:a05:6638:dc9:b0:323:68d6:e15a with SMTP id
 m9-20020a0566380dc900b0032368d6e15amr8001454jaj.238.1650914200168; 
 Mon, 25 Apr 2022 12:16:40 -0700 (PDT)
Received: from localhost.localdomain (cpe-65-29-252-111.wi.res.rr.com.
 [65.29.252.111]) by smtp.gmail.com with ESMTPSA id
 m14-20020a92c52e000000b002cd804f045dsm5322842ili.1.2022.04.25.12.16.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Apr 2022 12:16:39 -0700 (PDT)
From: Daniel Kaehn <kaehndan@gmail.com>
To: tiwai@suse.com
Subject: [PATCH v4 1/2] dt-bindings: sound: Add generic serial MIDI device
Date: Mon, 25 Apr 2022 14:16:02 -0500
Message-Id: <20220425191602.770932-2-kaehndan@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220425191602.770932-1-kaehndan@gmail.com>
References: <20220425191602.770932-1-kaehndan@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Daniel Kaehn <kaehndan@gmail.com>
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

Adds dt-binding for snd-serial-generic serial MIDI driver

Signed-off-by: Daniel Kaehn <kaehndan@gmail.com>
---
 .../devicetree/bindings/sound/serialmidi.yaml | 41 +++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/serialmidi.yaml

diff --git a/Documentation/devicetree/bindings/sound/serialmidi.yaml b/Documentation/devicetree/bindings/sound/serialmidi.yaml
new file mode 100644
index 000000000000..38ef49a0c2f9
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/serialmidi.yaml
@@ -0,0 +1,41 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/serialmidi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Generic Serial MIDI Device
+
+maintainers:
+  - Daniel Kaehn <kaehndan@gmail.com>
+
+description: |
+  Generic MIDI interface using a serial device. Can only be set to use standard speeds
+  corresponding to supported baud rates of the underlying serial device. If standard MIDI
+  speed of 31.25 kBaud is needed, configure the clocks of the underlying serial device
+  so that a requested speed of 38.4 kBaud resuts in the standard MIDI baud rate.
+
+properties:
+  compatible:
+    const: serialmidi
+
+  speed:
+    maxItems: 1
+    description: |
+      Speed to set the serial port to when the MIDI device is opened.
+      If not specified, the underlying serial device is allowed to use its configured default speed.
+
+required:
+  - compatible
+
+additionalProperties: false
+
+examples:
+  - |
+    serial {
+        midi {
+            compatible = "serialmidi";
+            speed = <38400>;
+        };
+    };
-- 
2.33.0

