Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DB2E4ACF82
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Feb 2022 04:14:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 423031720;
	Tue,  8 Feb 2022 04:13:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 423031720
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644290082;
	bh=rxS8dDC4zafXfN6Nj23MYMKYfReVrqhGsZ8HfulDj7o=;
	h=Date:Subject:From:To:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Nhc70LpF0v3TDfOPvupmPjuwuuSvHlppUWAbLr8vOxVy58E/MsfsYJ60f56SYPBg9
	 C8SAQ4y5UgYsseurkSqIxlp4NLp+lhQ36UrVKbIP0IPdw8KFQV0yUC3ZkaPMPctpgr
	 uSCTiK6G3YPEagVp6tuCwEiogGn+ycAD3qL9rOBk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 96216F800F0;
	Tue,  8 Feb 2022 04:13:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B8153F8013C; Tue,  8 Feb 2022 04:13:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL
 autolearn=disabled version=3.4.0
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com
 [IPv6:2607:f8b0:4864:20::b4a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8809AF800F0
 for <alsa-devel@alsa-project.org>; Tue,  8 Feb 2022 04:13:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8809AF800F0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="LRooLhjf"
Received: by mail-yb1-xb4a.google.com with SMTP id
 2-20020a251302000000b006118f867dadso32765514ybt.12
 for <alsa-devel@alsa-project.org>; Mon, 07 Feb 2022 19:13:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=AIZ/knnwAKeb/BKuZaLULYu/UPf7imccggwpo1VmmoU=;
 b=LRooLhjfDEzbuItD6IuJxZtuFd26gy99kjvMR6fLnHJe5dJr66zdonhVpSyoBXoFG1
 zfRPUxZGwOw25mdUxklh9s+EUPyUDJ75Vb1CdWTLTZsfU7GK05kBLH7MPuPoC1ujna/H
 FIitNTZshopGp7U/Oj54x9chdeILa5PJg0gUpzn8CoiKew8B7Mzol01sLojS7LmXT6ui
 Il68t5PWrfcrMRGy6256bhpt8HKmW/K2K+Kt+t3xIzXn1QOIlJYjYaGFV5CiPk17YXB2
 KE00qodHkjqzfvEBOOTU6m1WsHdRd+anCIUXIYsYb9ztIoUhI07zvNkuYKqkBMiID1uY
 5Hqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=AIZ/knnwAKeb/BKuZaLULYu/UPf7imccggwpo1VmmoU=;
 b=yX5z9LzDURrx/wf0KvApC6gHwF58oOOP7HPjcRasEpJ0r+5mshaXSoLkSINfKqrr9W
 YtvODbK3d+Q74qm6LJFVqHO6ePkYeCtm2utI5CrqNIaI4qJtiJnicP0w2nfhH+LaJI7G
 +8uAALAyEjWdir5SLS9S5juD3lRX6OVnJooM3zhTxmDakJcdh+iSN3R5kqDLRo5M7dF6
 /2nXlaZL0C4VWIirH+NecCp33QHkwejg/Xv9MSp+rNIdBu9szxkJYKEQ2a5xL/Zz4hqK
 1J+nsKoz7Xekikp0Qq7RFzn6KWCVDfL53PobakdjTrsLK8+M/py1b8CmpQd6iD17E9f5
 sVrQ==
X-Gm-Message-State: AOAM533EkoN/wcyLFWiM9wy9VytYeUibHtHHVvaOvnfgZjDPSBEkqhJk
 w+EEoYXQ3eNR6PcsDJyXL7hbfXk1Abji
X-Google-Smtp-Source: ABdhPJzzFjsZhO0447mYnQrzEUxP6u2E7S74KuYeOZ8nSpGEuuSAJs0p+hEcd5fdvF05cSubltgQWz3J3tIV
X-Received: from tzungbi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:d041:828a:7048:cfc9])
 (user=tzungbi job=sendgmr) by 2002:a81:a781:: with SMTP id
 e123mr3110938ywh.63.1644290005913; Mon, 07 Feb 2022 19:13:25 -0800 (PST)
Date: Tue,  8 Feb 2022 11:12:42 +0800
Message-Id: <20220208031242.227563-1-tzungbi@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.35.0.263.gb82422642f-goog
Subject: [PATCH] MAINTAINERS: update cros_ec_codec maintainers
From: Tzung-Bi Shih <tzungbi@google.com>
To: broonie@kernel.org, cychiang@chromium.org, bleung@chromium.org
Content-Type: text/plain; charset="UTF-8"
Cc: tzungbi@google.com, alsa-devel@alsa-project.org,
 chrome-platform@lists.linux.dev
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

Updates cros_ec_codec maintainers.

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 .../devicetree/bindings/sound/google,cros-ec-codec.yaml          | 1 +
 MAINTAINERS                                                      | 1 +
 2 files changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/google,cros-ec-codec.yaml b/Documentation/devicetree/bindings/sound/google,cros-ec-codec.yaml
index 77adbebed824..c3e9f3485449 100644
--- a/Documentation/devicetree/bindings/sound/google,cros-ec-codec.yaml
+++ b/Documentation/devicetree/bindings/sound/google,cros-ec-codec.yaml
@@ -8,6 +8,7 @@ title: Audio codec controlled by ChromeOS EC
 
 maintainers:
   - Cheng-Yi Chiang <cychiang@chromium.org>
+  - Tzung-Bi Shih <tzungbi@google.com>
 
 description: |
   Google's ChromeOS EC codec is a digital mic codec provided by the
diff --git a/MAINTAINERS b/MAINTAINERS
index 568152aa9973..a1f4fd15e770 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4573,6 +4573,7 @@ F:	drivers/platform/chrome/
 
 CHROMEOS EC CODEC DRIVER
 M:	Cheng-Yi Chiang <cychiang@chromium.org>
+M:	Tzung-Bi Shih <tzungbi@google.com>
 R:	Guenter Roeck <groeck@chromium.org>
 L:	chrome-platform@lists.linux.dev
 S:	Maintained
-- 
2.35.0.263.gb82422642f-goog

