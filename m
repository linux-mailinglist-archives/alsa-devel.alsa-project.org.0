Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A0436A225C
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Aug 2019 19:34:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7B9BD1679;
	Thu, 29 Aug 2019 19:33:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7B9BD1679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567100055;
	bh=7ycOWxLv36T9/glFbCzbpCW1cYcFxKcJQmXY6fiYQo0=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KYAjwM/lWZVuBorJGh84tCQaHiFWpz4TZh3wuiewpMLWhvG/i6d63fjvZGr8YRQm/
	 y6uRO/md6zXdde4brDayXDU57626z75AQXwtjavwvF9r/itLxTnb2SOCFc0gBofKvW
	 YZm/vCHACeNmp07Xde5WmWn/C1MeQZBUqiR163QI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3D5CFF80273;
	Thu, 29 Aug 2019 19:32:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 001CCF801ED; Thu, 29 Aug 2019 19:32:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from www1102.sakura.ne.jp (www1102.sakura.ne.jp [219.94.129.142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B24DBF800E7
 for <alsa-devel@alsa-project.org>; Thu, 29 Aug 2019 19:32:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B24DBF800E7
Received: from fsav301.sakura.ne.jp (fsav301.sakura.ne.jp [153.120.85.132])
 by www1102.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id x7THWCqf023729;
 Fri, 30 Aug 2019 02:32:12 +0900 (JST)
 (envelope-from katsuhiro@katsuster.net)
Received: from www1102.sakura.ne.jp (219.94.129.142)
 by fsav301.sakura.ne.jp (F-Secure/fsigk_smtp/530/fsav301.sakura.ne.jp);
 Fri, 30 Aug 2019 02:32:12 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/530/fsav301.sakura.ne.jp)
Received: from localhost.localdomain (118.153.231.153.ap.dti.ne.jp
 [153.231.153.118]) (authenticated bits=0)
 by www1102.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id x7THW6NO023682
 (version=TLSv1.2 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
 Fri, 30 Aug 2019 02:32:12 +0900 (JST)
 (envelope-from katsuhiro@katsuster.net)
From: Katsuhiro Suzuki <katsuhiro@katsuster.net>
To: Mark Brown <broonie@kernel.org>, David Yang <yangxiaohua@everest-semi.com>,
 Daniel Drake <drake@endlessm.com>, Hans de Goede <hdegoede@redhat.com>
Date: Fri, 30 Aug 2019 02:32:05 +0900
Message-Id: <20190829173205.11805-3-katsuhiro@katsuster.net>
X-Mailer: git-send-email 2.23.0.rc1
In-Reply-To: <20190829173205.11805-1-katsuhiro@katsuster.net>
References: <20190829173205.11805-1-katsuhiro@katsuster.net>
MIME-Version: 1.0
Cc: Katsuhiro Suzuki <katsuhiro@katsuster.net>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
Subject: [alsa-devel] [PATCH 3/3] ASoC: es8316: add DT-bindings
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

This patch adds missing DT-bindings document for Everest ES8316.

Signed-off-by: Katsuhiro Suzuki <katsuhiro@katsuster.net>
---
 .../bindings/sound/everest,es8316.txt         | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/everest,es8316.txt

diff --git a/Documentation/devicetree/bindings/sound/everest,es8316.txt b/Documentation/devicetree/bindings/sound/everest,es8316.txt
new file mode 100644
index 000000000000..aefcff9c48a2
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/everest,es8316.txt
@@ -0,0 +1,20 @@
+Everest ES8316 audio CODEC
+
+This device supports both I2C and SPI.
+
+Required properties:
+
+  - compatible  : should be "everest,es8316"
+  - reg : the I2C address of the device for I2C
+  - clocks : a list of phandle, should contain entries for clock-names
+  - clock-names : should include as follows:
+         "mclk" : master clock (MCLK) of the device
+
+Example:
+
+es8316: codec@11 {
+	compatible = "everest,es8316";
+	reg = <0x11>;
+	clocks = <&clks 10>;
+	clock-names = "mclk";
+};
-- 
2.23.0.rc1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
