Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 82EF546CCA5
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Dec 2021 05:43:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EEF9E230C;
	Wed,  8 Dec 2021 05:42:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EEF9E230C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638938586;
	bh=+66BPnYSMyGn7XYqYzhPcLKMsBIhKw4jMLinryvUPu0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=sF5yV5bD3zEFYr6Sv+NR+rvQaLtY33QDD8OTA7HqnciUXv78vfnJQ6qc4OWv+RJ99
	 3BlQQHj3DM/z73iwrIdkybVxMYfCPeIPCmdMCKzlqSvzal50NwGlm3+3ASiiX7HnhF
	 R7O085VD74xWpHWIziiXZmsBn9qgtW/BzOZ2nC6U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 56A3FF800AB;
	Wed,  8 Dec 2021 05:41:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0407BF804E5; Wed,  8 Dec 2021 05:41:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8A2D5F800AB
 for <alsa-devel@alsa-project.org>; Wed,  8 Dec 2021 05:41:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8A2D5F800AB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="oWcfD5Xc"
Received: by mail-pg1-x533.google.com with SMTP id 137so1032802pgg.3
 for <alsa-devel@alsa-project.org>; Tue, 07 Dec 2021 20:41:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gVTXx2Ftul3axT9kG8wb/hHelrk+iyq3wOYFqWlWjWk=;
 b=oWcfD5XcW0oT9QFTheXHFeLXwtCC85oNZb8SpB3TnmgJmQgEaF2RvSXun/lAaoTTLn
 cUNhQlmRfL9ts8Yr+zpOIuQp0wWgqy7/6K7CDt6WERgsv0lc8h8CmyYLRDb4Yh5g3Hmh
 x1bpMJ/+rpJauk9VAdSxWjo3RiSYO2u2eEwo15VHIOuba1OcvFT/no/dfewvTd+YzJ7t
 m5wXVhaMvjcyWjeKMbynqLt1BFnov51x1kxoICPkAYX051Y9SvX8puihTyZjM7xFz+zU
 SRIvuYmKEFw2TWB2RYfSCObmlbpwY6Ifsiy7tx3NjceTY+63A4OEShHOYVmnzpXM+bqH
 xfVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=gVTXx2Ftul3axT9kG8wb/hHelrk+iyq3wOYFqWlWjWk=;
 b=FmjBClmGAeP3O0aWOqoCBdi1HypfAFN1ROAP2szGAl5/lkuCo3ON4tf1W3HIOgECzg
 1y5JIi9TdsgsbWhhyk0NHQDeDTr4BxhnuvuOuWiLyMqJMFoPz0hQlF9YusXEGzZMEiwi
 Lr0wlf83nVWwSMvV3JexM7Nb1JuTNXh/MCuYmae+0jIzTIGv5zB4MJFethETZrOwtnIl
 SWTJBL2PDRNakOG5XispHyXzyrAy+d/cO4VWenw9/SjPsW09hTq/PwvUIFwQDll42pIY
 c7pDVPvDrqusMhWEPdp75Z6Q/527nDacpwraMt69fdQVEHkeq5u6uFQaKw/d+BFYOsot
 f8ag==
X-Gm-Message-State: AOAM533mKMqOCSxEA4/zw8hOlQy3qp0lPB2GdJ9P8ew7rD5v3qyT1dpr
 ouH8CDyAfKYJK9eTqgAb6mk=
X-Google-Smtp-Source: ABdhPJxs2WOshOlJoxL1kNg/Hwp/A6wY4SGHd6+tt5PnePyQJwe3IBGTnJriHXVFxjPsS/FNyLIfvg==
X-Received: by 2002:a63:1166:: with SMTP id 38mr27404118pgr.368.1638938496739; 
 Tue, 07 Dec 2021 20:41:36 -0800 (PST)
Received: from localhost.localdomain (fs76eeeb6c.tkyc601.ap.nuro.jp.
 [118.238.235.108])
 by smtp.gmail.com with ESMTPSA id l2sm1469249pfc.42.2021.12.07.20.41.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Dec 2021 20:41:36 -0800 (PST)
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>
Subject: [PATCH 1/1] ASoC: dt-bindings: audio-graph-port: enable both
 flag/phandle for bitclock/frame-master
Date: Wed,  8 Dec 2021 13:41:03 +0900
Message-Id: <20211208044103.405292-1-kuninori.morimoto.gx@renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
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

From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

snd_soc_daifmt_parse_clock_provider_raw() is handling both
bitclock/frame-master, and is supporting both flag/phandle.
Current DT is assuming it is flag style.
This patch allows both case.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 .../bindings/sound/audio-graph-port.yaml      | 23 +++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/audio-graph-port.yaml b/Documentation/devicetree/bindings/sound/audio-graph-port.yaml
index 43e7f86e3b23..6c3645a0d36b 100644
--- a/Documentation/devicetree/bindings/sound/audio-graph-port.yaml
+++ b/Documentation/devicetree/bindings/sound/audio-graph-port.yaml
@@ -14,6 +14,24 @@ select: false
 allOf:
   - $ref: /schemas/graph.yaml#/$defs/port-base
 
+definitions:
+  flag_or_phandle:
+    oneOf:
+      - type: boolean
+        const: true
+      - type: 'null'
+      - type: array
+        minItems: 1
+        maxItems: 1
+        items:
+          type: array
+          items:
+            phandle: true
+            type: integer
+            maximum: 0xffffffff
+          minItems: 1
+          maxItems: 1
+
 properties:
   prefix:
     description: "device name prefix"
@@ -42,10 +60,11 @@ patternProperties:
         $ref: /schemas/types.yaml#/definitions/flag
       frame-master:
         description: Indicates dai-link frame master.
-        $ref: /schemas/types.yaml#/definitions/phandle
+        $ref: "#/definitions/flag_or_phandle"
       bitclock-master:
         description: Indicates dai-link bit clock master
-        $ref: /schemas/types.yaml#/definitions/phandle
+        $ref: "#/definitions/flag_or_phandle"
+
       dai-format:
         description: audio format.
         items:
-- 
2.25.1

