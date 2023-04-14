Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E5256E2FFF
	for <lists+alsa-devel@lfdr.de>; Sat, 15 Apr 2023 11:12:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 31B8683B;
	Sat, 15 Apr 2023 11:12:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 31B8683B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681549970;
	bh=zJOHL74Rw2OOuV1HsSBYFOjDRSXsAT2DALnYTa6sv0o=;
	h=To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From:Reply-To:Cc:From;
	b=V4V30BTADQhM6c1xZ0ewV894qtp2YJdwgE8L792Zq7RtG1PgqjwMIBlRLeb2QKpa/
	 3N8I1LdYjD+B+tfhE6sxo8i/pYaA1ckzqJ340uzISnL8DrqscJWLInSs8YbNmZaB/X
	 Xaj1J/KlorAgsKxrJVzWvR5jdiAEUAPIOwlTxtL8=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2C71FF80571;
	Sat, 15 Apr 2023 11:09:36 +0200 (CEST)
To: alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 4/9] dt-bindings: ASoC: Add it68051
Date: Fri, 14 Apr 2023 16:01:58 +0200
In-Reply-To: <20230414140203.707729-1-pan@semihalf.com>
References: <20230414140203.707729-1-pan@semihalf.com>
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
X-Mailman-Approved-At: Sat, 15 Apr 2023 09:09:07 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GINPXK7AJMIF6SNWF3LNF74KVQ44CWK7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: 
 <168154977537.26.15850185939544969041@mailman-core.alsa-project.org>
From: =?utf-8?q?Pawe=C5=82_Anikiel_via_Alsa-devel?=
 <alsa-devel@alsa-project.org>
Reply-To: =?UTF-8?q?Pawe=C5=82=20Anikiel?= <pan@semihalf.com>
Cc: tiwai@suse.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 dinguyen@kernel.org, lars@metafoo.de, nuno.sa@analog.com,
 upstream@semihalf.com, =?UTF-8?q?Pawe=C5=82=20Anikiel?= <pan@semihalf.com>
Content-Type: message/rfc822
Content-Disposition: inline

Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 87266F80529; Fri, 14 Apr 2023 16:03:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3A70DF8023A
	for <alsa-devel@alsa-project.org>; Fri, 14 Apr 2023 16:02:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3A70DF8023A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=semihalf.com header.i=@semihalf.com header.a=rsa-sha256
 header.s=google header.b=to1vKMIM
Received: by mail-lf1-x134.google.com with SMTP id i6so11783900lfp.1
        for <alsa-devel@alsa-project.org>;
 Fri, 14 Apr 2023 07:02:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf.com; s=google; t=1681480967; x=1684072967;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L6n77Uz+PsEL5Zjj7L5BoLRIOYIh+FfJEj7GLcVMFvg=;
        b=to1vKMIM1WC0fNpuIs5zm3Xd24aEi6aKDV9OLiqX3WkQ186p1OuycU1BZvA94dDYsT
         r09kVB9ndrgzrg5+P/PlIVIj6pggSuDLvitGJaAe+apJV9pcgVmTgO5MbPN5TvD/C6IL
         0EtgNlqLzaUciDl3qcozHuoFcBoCWUVp+BLw+RrVuKI8qRirPnozw5rxTutWT69uV17+
         kN29a9NOcNSqMukp4uOHgo0o0MbaVDiICQZpYsoHoF+uMeXyqgAMD1r/CBKX7CUpimbT
         1r/morRdVUAFqIRIASuMeGpTdR3NjQC7ZlYp/eI2C4He8BfW4P+1LR9KmoDtUFbzgXAQ
         vCeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681480967; x=1684072967;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L6n77Uz+PsEL5Zjj7L5BoLRIOYIh+FfJEj7GLcVMFvg=;
        b=WxmqW8pYXPiqlU7SjhZXhAxiJKAuZC/iqxQVcfTooGvpxLT1MF/1RRq9Dq45tXL56h
         G2XUq0baAsZ+JxQUWhfjz1H5Ay4mXa6dclBkmiUqTkSfi/+wfhswODhRHzhp6DqFPHa4
         FYeK85NVjePDbLxzXsIA+iiExS/CKKag2dQlYN/MsiNF41NnJbkoS0RiAOMqT92B/ao9
         08MhpHEHEwYzEyNmCLUrsUB9fzzuNkySBXMklYtPAsNjCHwKQyjkSC+qLVZLSfXF/ozl
         UtKu+qmKFcOuFZpAkugR21uWscFaYyWXtP6/tls3XgTb6oa5F3WPrqUX5Fk0bX+H1tF5
         RWqw==
X-Gm-Message-State: AAQBX9fIb8xiJZFUfFmQUUbX73Brt9MDW5nsAY3HEls4eMKqE2rYzDxi
	yu9BzmgbkwNDO4ZXmonW5nXJatRXNQ5uHhjcDPA/jw==
X-Google-Smtp-Source: 
 AKy350ZSXgVjOCNXI2VQYGW1Lkq/T4J5v7tUI1rYH+arf0uiLVP1zRg1drMxe3NixehsPq/kIrQ5fw==
X-Received: by 2002:a05:6512:4012:b0:4eb:2b62:134f with SMTP id
 br18-20020a056512401200b004eb2b62134fmr2780018lfb.16.1681480966909;
        Fri, 14 Apr 2023 07:02:46 -0700 (PDT)
Received: from panikiel.roam.corp.google.com
 (staticline-31-182-201-26.toya.net.pl. [31.182.201.26])
        by smtp.gmail.com with ESMTPSA id
 15-20020a2eb2cf000000b002a76e2dedbcsm828684ljz.139.2023.04.14.07.02.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Apr 2023 07:02:46 -0700 (PDT)
From: =?UTF-8?q?Pawe=C5=82=20Anikiel?= <pan@semihalf.com>
To: alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 4/9] dt-bindings: ASoC: Add it68051
Date: Fri, 14 Apr 2023 16:01:58 +0200
Message-ID: <20230414140203.707729-5-pan@semihalf.com>
X-Mailer: git-send-email 2.40.0.634.g4ca3ef3211-goog
In-Reply-To: <20230414140203.707729-1-pan@semihalf.com>
References: <20230414140203.707729-1-pan@semihalf.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MailFrom: pan@semihalf.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: GINPXK7AJMIF6SNWF3LNF74KVQ44CWK7
X-Message-ID-Hash: GINPXK7AJMIF6SNWF3LNF74KVQ44CWK7
X-Mailman-Approved-At: Sat, 15 Apr 2023 09:09:07 +0000
CC: tiwai@suse.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 dinguyen@kernel.org, lars@metafoo.de, nuno.sa@analog.com,
 upstream@semihalf.com, =?UTF-8?q?Pawe=C5=82=20Anikiel?= <pan@semihalf.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GINPXK7AJMIF6SNWF3LNF74KVQ44CWK7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add binding for it68051 device.

Signed-off-by: Paweł Anikiel <pan@semihalf.com>
---
 .../bindings/sound/ite,it68051.yaml           | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/ite,it68051.yaml

diff --git a/Documentation/devicetree/bindings/sound/ite,it68051.yaml b/Documentation/devicetree/bindings/sound/ite,it68051.yaml
new file mode 100644
index 000000000000..341c171b8a8a
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/ite,it68051.yaml
@@ -0,0 +1,23 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/ite,it68051.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: it68051 audio codec
+
+maintainers:
+  - Paweł Anikiel <pan@semihalf.com>
+
+properties:
+  compatible:
+    const: ite,it68051
+
+required:
+  - compatible
+
+examples:
+  - |
+    it68051: audio-codec {
+        compatible = "ite,it68051";
+    };
-- 
2.40.0.634.g4ca3ef3211-goog

