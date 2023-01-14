Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BA1866AFCD
	for <lists+alsa-devel@lfdr.de>; Sun, 15 Jan 2023 08:53:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A16A04625;
	Sun, 15 Jan 2023 08:52:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A16A04625
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673769229;
	bh=h5oj8uz2mcobJK2H+Hm87QzyJogghFxebdxYASXr6cM=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Lzs2Wmij4NRAiAlUIa/yFf3DEcVPpG+JSmXgdFP5qTjojMsS9Q3gBnISbaXymBtqq
	 3O9QnTN0a0S1TWjxpDyT3uLw0XBgjr8WYPi2aeUjllpgTdbpH0seuVKGlvJ08EhEye
	 QzfwkyKvcgD5Nc2kQYGZq4PNNYTfjH6QGUDxYvQM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6FF94F805C0;
	Sun, 15 Jan 2023 08:48:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 345FCF804BD; Sat, 14 Jan 2023 20:48:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 54F81F804C1
 for <alsa-devel@alsa-project.org>; Sat, 14 Jan 2023 20:47:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 54F81F804C1
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=KiDrcBr9
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id EB6EF60C11;
 Sat, 14 Jan 2023 19:47:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1236C433D2;
 Sat, 14 Jan 2023 19:47:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1673725670;
 bh=h5oj8uz2mcobJK2H+Hm87QzyJogghFxebdxYASXr6cM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=KiDrcBr9xYYjYZegA2r59TFavCdH1lJzSKxoSZ6AnPCL95MfbvVcN/2vpGfdMQsPS
 cEQ2xGXQikIXt/oa7BuEOV6UUTZwitOmkFZ/IQb+AHojukxeVTNXd7gT4AN+4AE5TF
 xNB1KvHvAWsJJQiJjtrAHEfQ7gL3a2YeYtcoQ+/mKfhDWWwOGZOAOFuWdRRkKcBSR0
 1oLifEXl8Pf53b4bHvQbdXl5r9PY9o9nUOziEzSMP57fwtK63MPFONd5i1qND5Tz2V
 HfKNpJPuqhUU/n0FFCruuQnRLZajl/DjGHd0wL593NZ07RyNMpUnjrPASGFfUoszoq
 wt6ROkuSivsgA==
From: SeongJae Park <sj@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH 2/2] Docs: Add some missing SPDX license identifiers of
 subsystem docs
Date: Sat, 14 Jan 2023 19:47:41 +0000
Message-Id: <20230114194741.115855-2-sj@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230114194741.115855-1-sj@kernel.org>
References: <20230114194741.115855-1-sj@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 15 Jan 2023 08:48:19 +0100
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: linux-hwmon@vger.kernel.org, alsa-devel@alsa-project.org,
 SeongJae Park <sj@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>, Maxime Ripard <mripard@kernel.org>,
 Jean Delvare <jdelvare@suse.com>, linux-crypto@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-input@vger.kernel.org,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Guenter Roeck <linux@roeck-us.net>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Some subsystem documents are missing SPDX license identifiers.  Add
those.

Signed-off-by: SeongJae Park <sj@kernel.org>
---
 Documentation/crypto/index.rst     | 2 ++
 Documentation/driver-api/index.rst | 2 ++
 Documentation/gpu/index.rst        | 2 ++
 Documentation/hwmon/index.rst      | 2 ++
 Documentation/input/index.rst      | 2 ++
 Documentation/mm/index.rst         | 2 ++
 Documentation/scheduler/index.rst  | 2 ++
 Documentation/sound/index.rst      | 2 ++
 8 files changed, 16 insertions(+)

diff --git a/Documentation/crypto/index.rst b/Documentation/crypto/index.rst
index da5d5ad2bdf3..95b0870e09b8 100644
--- a/Documentation/crypto/index.rst
+++ b/Documentation/crypto/index.rst
@@ -1,3 +1,5 @@
+.. SPDX-License-Identifier: GPL-2.0
+
 ==========
 Crypto API
 ==========
diff --git a/Documentation/driver-api/index.rst b/Documentation/driver-api/index.rst
index b208e0dac3a0..7a2584ab63c4 100644
--- a/Documentation/driver-api/index.rst
+++ b/Documentation/driver-api/index.rst
@@ -1,3 +1,5 @@
+.. SPDX-License-Identifier: GPL-2.0
+
 ==============================
 Driver implementer's API guide
 ==============================
diff --git a/Documentation/gpu/index.rst b/Documentation/gpu/index.rst
index eee5996acf2c..ff06a6b12c5e 100644
--- a/Documentation/gpu/index.rst
+++ b/Documentation/gpu/index.rst
@@ -1,3 +1,5 @@
+.. SPDX-License-Identifier: GPL-2.0
+
 ============================
 GPU Driver Developer's Guide
 ============================
diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
index c2b3c1a822dd..2186d732654f 100644
--- a/Documentation/hwmon/index.rst
+++ b/Documentation/hwmon/index.rst
@@ -1,3 +1,5 @@
+.. SPDX-License-Identifier: GPL-2.0
+
 ===================
 Hardware Monitoring
 ===================
diff --git a/Documentation/input/index.rst b/Documentation/input/index.rst
index 35581cd18e91..d60bf9cfe005 100644
--- a/Documentation/input/index.rst
+++ b/Documentation/input/index.rst
@@ -1,3 +1,5 @@
+.. SPDX-License-Identifier: GPL-2.0
+
 ===================
 Input Documentation
 ===================
diff --git a/Documentation/mm/index.rst b/Documentation/mm/index.rst
index 5a94a921ea40..c4e9fbacaf38 100644
--- a/Documentation/mm/index.rst
+++ b/Documentation/mm/index.rst
@@ -1,3 +1,5 @@
+.. SPDX-License-Identifier: GPL-2.0
+
 ===============================
 Memory Management Documentation
 ===============================
diff --git a/Documentation/scheduler/index.rst b/Documentation/scheduler/index.rst
index 1aac972a652f..ae0229f5a9cf 100644
--- a/Documentation/scheduler/index.rst
+++ b/Documentation/scheduler/index.rst
@@ -1,3 +1,5 @@
+.. SPDX-License-Identifier: GPL-2.0
+
 =========
 Scheduler
 =========
diff --git a/Documentation/sound/index.rst b/Documentation/sound/index.rst
index 5abed5fc6485..7e67e12730d3 100644
--- a/Documentation/sound/index.rst
+++ b/Documentation/sound/index.rst
@@ -1,3 +1,5 @@
+.. SPDX-License-Identifier: GPL-2.0
+
 =============================
 Sound Subsystem Documentation
 =============================
-- 
2.25.1

