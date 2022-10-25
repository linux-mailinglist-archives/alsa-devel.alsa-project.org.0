Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8612C60C1E9
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Oct 2022 04:50:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D24101AD9;
	Tue, 25 Oct 2022 04:50:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D24101AD9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666666250;
	bh=kboK6ijh7YWd0MCFUiK3g+BWSrFg8l85TjRB83KG1vo=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=FbYKTEURkWAO7aowGbpVMXP+o8RiGE28uyTGvepfb3HnZtYIg1R6RsqsT0sW3bHKD
	 8EWdhLAxzpPtARP8LapNI1tsxUaLvjYJ9me2B5/M8AzqDHdueyAHweT7XL+mJyV4ZX
	 K7J0jWduQUIYnVnHWaZ2KJFnlXYNDkQDLfVjXnSs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2C8F8F80448;
	Tue, 25 Oct 2022 04:49:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E9860F80431; Tue, 25 Oct 2022 04:49:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6E125F80240
 for <alsa-devel@alsa-project.org>; Tue, 25 Oct 2022 04:49:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6E125F80240
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="qjeA15SQ"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 38E27B819AC;
 Tue, 25 Oct 2022 02:49:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C948C433D6;
 Tue, 25 Oct 2022 02:49:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666666185;
 bh=kboK6ijh7YWd0MCFUiK3g+BWSrFg8l85TjRB83KG1vo=;
 h=From:To:Cc:Subject:Date:From;
 b=qjeA15SQAyI92KYY0m7sCZ0A4xxCzGWpzCD6IoSogCOadiI0urJBXhw23Qh00eRIQ
 XvCz5eRXcKph1ur1T903+6QpzHyPpx3MTbvLKFBlHe3kp8ukO7P54fusTleYnx/8fr
 A6SXJ6OIhhBgvT3YBVEJgrCBQkH+urcoJdrQYZgGTYudqGb1V04ESAD8PvdbSyjW0+
 fhVP2PH7Y0qsSmeUub/QRPpqFRIXjnzfKg7h/C91DizMoJdSEGYAyxx3XU8XdVWKyz
 rt5v1mWeEckkgjL0ii1C283s+HT3gi2QH5dSywU2MfUACJPi2jrgjN6zGXhZZk2tY3
 o6Gs7H5MPMQ4A==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: broonie@kernel.org
Subject: [PATCH v2] MAINTAINERS: update Tzung-Bi's email address
Date: Tue, 25 Oct 2022 10:49:29 +0800
Message-Id: <20221025024929.2652134-1-tzungbi@kernel.org>
X-Mailer: git-send-email 2.38.0.135.g90850a2211-goog
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, tzungbi@kernel.org, wenst@chromium.org
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
Changes from v1:
- Also update .mailmap.

 .mailmap                                                        | 1 +
 .../devicetree/bindings/sound/google,cros-ec-codec.yaml         | 2 +-
 Documentation/devicetree/bindings/sound/realtek,rt1015p.yaml    | 2 +-
 MAINTAINERS                                                     | 2 +-
 4 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/.mailmap b/.mailmap
index 380378e2db36..84342d781407 100644
--- a/.mailmap
+++ b/.mailmap
@@ -414,6 +414,7 @@ TripleX Chung <xxx.phy@gmail.com> <triplex@zh-kernel.org>
 TripleX Chung <xxx.phy@gmail.com> <zhongyu@18mail.cn>
 Tsuneo Yoshioka <Tsuneo.Yoshioka@f-secure.com>
 Tycho Andersen <tycho@tycho.pizza> <tycho@tycho.ws>
+Tzung-Bi Shih <tzungbi@kernel.org> <tzungbi@google.com>
 Uwe Kleine-König <ukleinek@informatik.uni-freiburg.de>
 Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
 Uwe Kleine-König <ukleinek@strlen.de>
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

