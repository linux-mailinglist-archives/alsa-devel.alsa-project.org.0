Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E061052A2B8
	for <lists+alsa-devel@lfdr.de>; Tue, 17 May 2022 15:08:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 817B3E0E;
	Tue, 17 May 2022 15:07:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 817B3E0E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652792916;
	bh=+7qse9sknZ9I3v9Dz/gVbCd+6CC4fL+4nom7gSG0SaM=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=EZgYsVns9HWrA02BZ31ScOWUE9iBOxS6WJafhTasR+j1YxrYsvQ93ghQTgtG6Il6x
	 voPMXwSRLN7hKCIn2YnEZ2hUK3f7zatEYPnYoaKh57++CmMQdWU2ml8nWNZJPy2ZXd
	 wo+5ey/jypNM6lc52EaP3CFW7ZjDT/ABW464R7CE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 38C8BF80519;
	Tue, 17 May 2022 15:07:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C1522F800D8; Mon, 16 May 2022 18:59:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [IPv6:2607:f8b0:4864:20::32f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 66002F800F8
 for <alsa-devel@alsa-project.org>; Mon, 16 May 2022 18:59:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 66002F800F8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="xNCEcWiO"
Received: by mail-ot1-x32f.google.com with SMTP id
 m15-20020a9d608f000000b00606a788887aso10458546otj.0
 for <alsa-devel@alsa-project.org>; Mon, 16 May 2022 09:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SVSiugKnf8wJOdqfsw/q25vFSKAj+trMZCib/b4SHsE=;
 b=xNCEcWiOUolnZIhOk9qAhe8FtKNTtG4QDT4fXmc/QcMlaIRHGYz4A8S+a4ZjvML9/U
 hN5zefWJ7NGp/7Xp7QcDmQBoh8TdCJy/JaCya1YhOyC80YJ6/MAahbaiUScy5TEqisNF
 Sr2iVxyK2WaSKhjWP24w4DlZ/KBux/9tlZrYQFQTET5qgcfs1PKjhP5F9HNb/WbVebre
 vyxNKYUcDEUCYbHj0MxbqZoLtGEeJYK0kZhcbFaJG2N8zCDXo790bDns7NNe3bJ25vgJ
 ZM26/1iZSZP39BGtEA4JZM44t8/QvfyOyAOng2wGnv2z1DNsb3TTcMoz0JWFNV1tCwA0
 Vy5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SVSiugKnf8wJOdqfsw/q25vFSKAj+trMZCib/b4SHsE=;
 b=kLaCIVL4re7aif5jNzEqdujB6WTeYCTu+KKbivSoxxaYD0lFd1X2q0+j5C8KGL35AO
 2ddScW5h8S+PKOXBHEtTF65ciAtQ+Spazqgw2iTioYteW8QbKinKAh6Mu0dBiVJ1kMW9
 qK6r+5KWXQk1CaT9drdT2iN6AP8Y++SyI7Pnee4r0M/h/CXM8lvfYFX4XGmipbKe5vRn
 r5BZgMerqYRPGGurqI1KC5yIfQOgYls1EZk1UtsS2+ipogez8Plx5A6+aA7+A36BPtRD
 YYanD5YOLjYUAW5aFlkfJVPcYKJ81kbrjtwbJWiI5Vkwm4d1+S6xM1kCW5oRfFchazIh
 Tesg==
X-Gm-Message-State: AOAM530o0XFmNtHL8JVfFcD/iG63Ee2l3CqTVe+dQrRztfulsA04C8FX
 Qo2phhWvLkS4dG55OfgzkcwHFL5QmURZktsgo2E=
X-Google-Smtp-Source: ABdhPJzQ7BmCCqxGUIZGnvyc1mw1E81cQoTtZL9xm0IeZZSKzJzyHwgpPQy3DEs0+x5z6lGJSN1KAw==
X-Received: by 2002:a9d:24e7:0:b0:606:56ad:91bb with SMTP id
 z94-20020a9d24e7000000b0060656ad91bbmr6614249ota.40.1652720348007; 
 Mon, 16 May 2022 09:59:08 -0700 (PDT)
Received: from winterfell.papolivre.org (winterfell.papolivre.org.
 [198.58.116.17]) by smtp.gmail.com with ESMTPSA id
 ep36-20020a056870a9a400b000e686d1387bsm5966536oab.21.2022.05.16.09.59.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 09:59:07 -0700 (PDT)
Received: from localhost (unknown
 [IPv6:2804:14d:7224:81d8:1a5f:b39d:3db4:59e8])
 by winterfell.papolivre.org (Postfix) with ESMTPSA id C9C911F296;
 Mon, 16 May 2022 13:59:06 -0300 (-03)
From: Antonio Terceiro <antonio.terceiro@linaro.org>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Mark Brown <broonie@kernel.org>, Shuah Khan <shuah@kernel.org>
Subject: [PATCH] kselftest: alsa: handle cross compilation
Date: Mon, 16 May 2022 13:58:56 -0300
Message-Id: <20220516165856.401452-1-antonio.terceiro@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 17 May 2022 15:07:02 +0200
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
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

Calling just `pkg-config` is adequate for native builds, but finding the
foreign libraries with pkg-config needs pkg-config to be called via its
architecture-specific wrapper. This works in Debian, where there is a
corresponding *-pkg-config wrapper script for each enabled foreign
architecture, just like there are *-gcc, *-ld.

Signed-off-by: Antonio Terceiro <antonio.terceiro@linaro.org>
---
 tools/testing/selftests/alsa/Makefile | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/alsa/Makefile b/tools/testing/selftests/alsa/Makefile
index f64d9090426d..f5675b3c929d 100644
--- a/tools/testing/selftests/alsa/Makefile
+++ b/tools/testing/selftests/alsa/Makefile
@@ -1,8 +1,10 @@
 # SPDX-License-Identifier: GPL-2.0
 #
 
-CFLAGS += $(shell pkg-config --cflags alsa)
-LDLIBS += $(shell pkg-config --libs alsa)
+PKG_CONFIG ?= $(CROSS_COMPILE)pkg-config
+
+CFLAGS += $(shell $(PKG_CONFIG) --cflags alsa)
+LDLIBS += $(shell $(PKG_CONFIG) --libs alsa)
 
 TEST_GEN_PROGS := mixer-test
 
-- 
2.35.1

