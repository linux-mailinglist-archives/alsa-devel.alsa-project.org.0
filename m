Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BD8FA60C180
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Oct 2022 04:06:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4CD432C38;
	Tue, 25 Oct 2022 04:05:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4CD432C38
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666663572;
	bh=jgATh42Z1P6tQf6L2xACDKgfBlOCg0weBvz2WYq67NM=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=mrDIL3skYCKwVrYBOATQ4Of8hkq4cOlgUqcWnvcGB7ZqhjV5r2h4+HzyH4MPJodtP
	 S59rdzI9GGNLu9DH/+BbxNfALtKhXyDMK1wMM45m7TlmeD4420MEja7Y9znthkcIBW
	 7kC7cyZphBMk7lANydjx5B0LlqH4fHSJyZB2nN7E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E8724F80448;
	Tue, 25 Oct 2022 04:05:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 461F0F80431; Tue, 25 Oct 2022 04:05:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B0AA1F80115
 for <alsa-devel@alsa-project.org>; Tue, 25 Oct 2022 04:05:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B0AA1F80115
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="EBKNB1LS"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E4CC8616EE
 for <alsa-devel@alsa-project.org>; Tue, 25 Oct 2022 02:05:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E552C433C1;
 Tue, 25 Oct 2022 02:04:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666663500;
 bh=jgATh42Z1P6tQf6L2xACDKgfBlOCg0weBvz2WYq67NM=;
 h=From:To:Cc:Subject:Date:From;
 b=EBKNB1LSEaJQ1dcT+Es+tsmtVmzOfbgaUmIf4H/HtPyHJ9AzMxfS+2URXKjh+ctN/
 RC4tGiwan7qOVfLLoqLZBcVOIX1UI68rf8welKL9uBt0mMiU9STBxDpBa/4+pFP6wi
 38bc+fmCprIReuHXNf9GDC49kqXuA1hhscKjdbfVDZ7HgEwf8qBfVqRgeqxXy4Z2nE
 hsmjOVYkMnytabXZJSgc7cJrDvQ3nWW21bcivhIE3bWuCdaSU+uLxQ95IYQjD/7TNl
 LjXCMeEzYrkqLwFhw5vkNP0MSi9RYDQA+FmMTHJ3DlvPOtjv/xgUjJH6ZOPlgZRqUu
 +dP2FA6oMxrRQ==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: broonie@kernel.org
Subject: [PATCH] MAINTAINERS: update Tzung-Bi's email address
Date: Tue, 25 Oct 2022 10:04:44 +0800
Message-Id: <20221025020444.2618586-1-tzungbi@kernel.org>
X-Mailer: git-send-email 2.38.0.135.g90850a2211-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, tzungbi@kernel.org
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

Use kernel.org account instead.

Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
 .../devicetree/bindings/sound/google,cros-ec-codec.yaml         | 2 +-
 Documentation/devicetree/bindings/sound/realtek,rt1015p.yaml    | 2 +-
 MAINTAINERS                                                     | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/google,cros-ec-codec.yaml b/Documentation/devicetree/bindings/sound/google,cros-ec-codec.yaml
index c3e9f3485449..dea293f403d9 100644
--- a/Documentation/devicetree/bindings/sound/google,cros-ec-codec.yaml
+++ b/Documentation/devicetree/bindings/sound/google,cros-ec-codec.yaml
@@ -8,7 +8,7 @@ title: Audio codec controlled by ChromeOS EC
 
 maintainers:
   - Cheng-Yi Chiang <cychiang@chromium.org>
-  - Tzung-Bi Shih <tzungbi@google.com>
+  - Tzung-Bi Shih <tzungbi@kernel.org>
 
 description: |
   Google's ChromeOS EC codec is a digital mic codec provided by the
diff --git a/Documentation/devicetree/bindings/sound/realtek,rt1015p.yaml b/Documentation/devicetree/bindings/sound/realtek,rt1015p.yaml
index 1d73204451b1..ea7d4900ee4a 100644
--- a/Documentation/devicetree/bindings/sound/realtek,rt1015p.yaml
+++ b/Documentation/devicetree/bindings/sound/realtek,rt1015p.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Realtek rt1015p codec devicetree bindings
 
 maintainers:
-  - Tzung-Bi Shih <tzungbi@google.com>
+  - Tzung-Bi Shih <tzungbi@kernel.org>
 
 description: |
   Rt1015p is a rt1015 variant which does not support I2C and
diff --git a/MAINTAINERS b/MAINTAINERS
index cf0f18502372..f9749afc0b9d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4906,7 +4906,7 @@ F:	drivers/platform/chrome/
 
 CHROMEOS EC CODEC DRIVER
 M:	Cheng-Yi Chiang <cychiang@chromium.org>
-M:	Tzung-Bi Shih <tzungbi@google.com>
+M:	Tzung-Bi Shih <tzungbi@kernel.org>
 R:	Guenter Roeck <groeck@chromium.org>
 L:	chrome-platform@lists.linux.dev
 S:	Maintained
-- 
2.38.0.135.g90850a2211-goog

