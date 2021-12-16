Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A2D8A4766D1
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Dec 2021 01:01:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 201E21AD4;
	Thu, 16 Dec 2021 01:00:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 201E21AD4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639612909;
	bh=Lqktvflmfh6uv7SAIXMHRlWRmXxVd+ScedQVUhs++84=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=nq0KvA1mplsK+dKKkEhHTBpbOUJQiFYvFfYNtAPjvBVbrRVpZlke09qXx2b4WYF17
	 yyiccXlppXVdok4Ps4aLK2W1QsViyPXe//rqijizGn1IKNT9C1XrdcNv9x5kiCf0Qr
	 nvdtGmZOlWneVUyyFr3CvHvskt6JPv1LgYL4bGPs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 996FDF80157;
	Thu, 16 Dec 2021 01:00:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0002FF800B0; Thu, 16 Dec 2021 01:00:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 83D9EF800B0
 for <alsa-devel@alsa-project.org>; Thu, 16 Dec 2021 01:00:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 83D9EF800B0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Gx6LKnSW"
Received: by mail-pl1-x62a.google.com with SMTP id v19so17940826plo.7
 for <alsa-devel@alsa-project.org>; Wed, 15 Dec 2021 16:00:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ssAv+iRlv4UpHtVbVbUHxNlU+DyIsEYcdL28Jk/tCBo=;
 b=Gx6LKnSWviOFjpb2HIsXHJEJQlrVg/+1Zj/CZZOMO2OERikDcAFFMQlQLjioo9Qgio
 IZOhHgnpvZzoYbiQVsncctWk+buuWoZebQSXcvkq5fuoc1sfobQe6F08oFqWoSZzItpL
 skA3EUjJ1JSmOSlKArU0XHYV92Fml5R5b2cvgQBGdEPhTYGP3R9wluJwbz6VxB8ystNH
 uueZtCOR+m0y0nmWHADW/glw4RCp/MoVEW1HbeG2PNMlTxCtR6MiIOvHgZHNOHTSIDGm
 4JyHvnvZrMRQc8N5CPkDyQmHBt53+jcwUbA+RtMGY4V345MOh9txUmQLgkyU2mOn82HV
 wlYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=ssAv+iRlv4UpHtVbVbUHxNlU+DyIsEYcdL28Jk/tCBo=;
 b=0bfKBD0ON0kwRdiuQsB0VlQPlDNF9XcS83J+IeAK1wQsSSDcMXn8jRk+KXGc7Cqtrc
 mR33RiSUCzaVApGXnhWtjYdVmS1FlNiF6rejEtDsFrS8ZjB00SkDmJdHRbh6U//Pudxy
 wpBXJfPBLrpSV+mbH9WDnteC7xnUndr2TtB/LliaY5ldXrv40Fv1wGMsxJVnMqWvPhGG
 bUFXtPvr4128at2+oHIxU9mkg2ude//Uhu19BocoQqtUQppjzL5uQfcR8IADxKkxoww0
 /A7hedXa0Mg1WEulVz9/K5AOkUMVDIDZ8C9tjA/Bzjs6zXyjvtf1wM//n60j0ycg+pUh
 10vw==
X-Gm-Message-State: AOAM533F3dxGAa5eh9wbEOTMwgeD0jyZJWoT/7m6zspP17qiLpkiIAGE
 w4idD9uZ7KY3sB0+pz6HUnU=
X-Google-Smtp-Source: ABdhPJyjJ+CadUjOKltKk7og9xd9+jFRGhm+zLfjHVf32hf8e9juIwdCiZOuawoi56AYHzbZj7Kk1g==
X-Received: by 2002:a17:902:ecc9:b0:142:f90:f4a1 with SMTP id
 a9-20020a170902ecc900b001420f90f4a1mr13677671plh.73.1639612827332; 
 Wed, 15 Dec 2021 16:00:27 -0800 (PST)
Received: from localhost.localdomain ([150.249.232.163])
 by smtp.gmail.com with ESMTPSA id o9sm3231402pgs.65.2021.12.15.16.00.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Dec 2021 16:00:27 -0800 (PST)
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v2] ASoC: dt-bindings: audio-graph-port: enable both
 flag/phandle for bitclock/frame-master
Date: Thu, 16 Dec 2021 09:00:18 +0900
Message-Id: <20211216000018.2641925-1-kuninori.morimoto.gx@renesas.com>
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
v1 -> v2

	- anyOf -> oneOf

 .../devicetree/bindings/sound/audio-graph-port.yaml      | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/audio-graph-port.yaml b/Documentation/devicetree/bindings/sound/audio-graph-port.yaml
index 43e7f86e3b23..476dcb49ece6 100644
--- a/Documentation/devicetree/bindings/sound/audio-graph-port.yaml
+++ b/Documentation/devicetree/bindings/sound/audio-graph-port.yaml
@@ -42,10 +42,15 @@ patternProperties:
         $ref: /schemas/types.yaml#/definitions/flag
       frame-master:
         description: Indicates dai-link frame master.
-        $ref: /schemas/types.yaml#/definitions/phandle
+        oneOf:
+          - $ref: /schemas/types.yaml#/definitions/flag
+          - $ref: /schemas/types.yaml#/definitions/phandle
       bitclock-master:
         description: Indicates dai-link bit clock master
-        $ref: /schemas/types.yaml#/definitions/phandle
+        oneOf:
+          - $ref: /schemas/types.yaml#/definitions/flag
+          - $ref: /schemas/types.yaml#/definitions/phandle
+
       dai-format:
         description: audio format.
         items:
-- 
2.25.1

