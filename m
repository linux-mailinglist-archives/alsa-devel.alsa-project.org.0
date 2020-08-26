Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BAADB253795
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Aug 2020 20:52:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 519CB179C;
	Wed, 26 Aug 2020 20:51:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 519CB179C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598467954;
	bh=XBr/fnbwBz/TLqTnqck7d9QMDktEe+KFnwu1ysa+BqY=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=H1oLQUL/QjCvkzVVFY8AMdryMCjgmcVUv6nouklYko7AEVpUfPKEKaw/g3vSBUiI2
	 wbARenJ6Z0btRQ0MwW+2qs3dZxQ7WaVUf6fBYJZCL6GBGCmU+I5RmQxsF9xzoEjYl8
	 Z+oV8zOVOC9ChvIFOhemvbkqk8A3O7Y41733FCYg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3F415F80105;
	Wed, 26 Aug 2020 20:49:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 11D2DF8016F; Wed, 26 Aug 2020 20:49:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
 [209.85.166.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E2FA3F8016F
 for <alsa-devel@alsa-project.org>; Wed, 26 Aug 2020 20:48:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E2FA3F8016F
Received: by mail-io1-f66.google.com with SMTP id h4so3238153ioe.5
 for <alsa-devel@alsa-project.org>; Wed, 26 Aug 2020 11:48:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ANVjB6Oqn2d1pZe/e10TGufV/gtKnuBQp7HE23A4Kz8=;
 b=QvVRkc0lPkPa/E0EFSaUJg8mkPI+n5Bo8V5qXEQc4px0Ve/eijZxFB7RxJ8gFEnMW2
 sb0BxxnI/4dgSQd4LRj3pS7bJ+av0qdrjmIQTGJcuq38tgPkv9SGzBgH3tGLP3vW8wjz
 RLJzjTjo3WgJ6Mmgy3svcNadyCEwQJwlq2AVil7ML+q6zoFGT9J9Ty/3PVXVDJswNY5X
 DuTaq6hGiscLInPMpoOTZVmD+bqNfqqVV2qfmh2mrvB6sGDjgO81J6d0bm8luBrwLLmh
 e3ohIP8NQmqzVo80fl8zLzWrZ2noA2NXUDvQN7GPgPQnOqoWXp24WjrwR16ew3I0UGiG
 9oig==
X-Gm-Message-State: AOAM531XM0asEI2PmqXaKt78ArJFGy5jC172Ic0QTKHPYjmefA29hLow
 6T/QTqX5ujUAQk6060wagA==
X-Google-Smtp-Source: ABdhPJxCGQDbXnwHYxRdKiwLONGRlHhRoTm815Iaj2AA0tWZ3EoOypxgdG+IXPtFbxHb2B2WuP+pTw==
X-Received: by 2002:a05:6602:280f:: with SMTP id
 d15mr5477882ioe.200.1598467734302; 
 Wed, 26 Aug 2020 11:48:54 -0700 (PDT)
Received: from xps15.herring.priv ([64.188.179.249])
 by smtp.googlemail.com with ESMTPSA id c2sm1609226iow.6.2020.08.26.11.48.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Aug 2020 11:48:53 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: devicetree@vger.kernel.org
Subject: [PATCH 1/3] dt-bindings: sound: Remove unused 'linux,hdmi-audio'
Date: Wed, 26 Aug 2020 12:48:49 -0600
Message-Id: <20200826184851.3431531-1-robh@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>
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

The binding was added in 2013 and has had no driver since 2015.

Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/sound/hdmi.txt | 16 ----------------
 1 file changed, 16 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/hdmi.txt

diff --git a/Documentation/devicetree/bindings/sound/hdmi.txt b/Documentation/devicetree/bindings/sound/hdmi.txt
deleted file mode 100644
index 56407c30e954..000000000000
--- a/Documentation/devicetree/bindings/sound/hdmi.txt
+++ /dev/null
@@ -1,16 +0,0 @@
-Device-Tree bindings for dummy HDMI codec
-
-Required properties:
-	- compatible: should be "linux,hdmi-audio".
-
-CODEC output pins:
-  * TX
-
-CODEC input pins:
-  * RX
-
-Example node:
-
-	hdmi_audio: hdmi_audio@0 {
-		compatible = "linux,hdmi-audio";
-	};
-- 
2.25.1

