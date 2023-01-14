Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EBE1A66AFCC
	for <lists+alsa-devel@lfdr.de>; Sun, 15 Jan 2023 08:53:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 125A34619;
	Sun, 15 Jan 2023 08:52:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 125A34619
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673769216;
	bh=gMU2qV2VgM+YENiKJhH+abvn4ddBqKL0P0RzB5p/M9M=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=XWfxe0og4WaffdqShKEDtv24QWycs7S3kfcLwHs6GABJgWxZIQJB4OQLzBBeoBADH
	 JsSEwQ4bYz6s81LS4+L70EvRt+t79wb5mUUvTSZQJyVdQewmX3d9HD2aNMyzhT2i6t
	 bUnXK0c8kY2M7uI3Mog9I4jowXGYHrvWjDFRS6dI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EAC22F805BB;
	Sun, 15 Jan 2023 08:48:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D205BF804CA; Sat, 14 Jan 2023 20:47:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3E83DF8025F
 for <alsa-devel@alsa-project.org>; Sat, 14 Jan 2023 20:47:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3E83DF8025F
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=J80B8qRk
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CB48460C08;
 Sat, 14 Jan 2023 19:47:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DA54C433D2;
 Sat, 14 Jan 2023 19:47:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1673725667;
 bh=gMU2qV2VgM+YENiKJhH+abvn4ddBqKL0P0RzB5p/M9M=;
 h=From:To:Cc:Subject:Date:From;
 b=J80B8qRk5QOTG8JqtnwvGlTRxhA2TlX3aGgUGykutFA28xkS1L79HoIMWUQtYDCTj
 dCd/689zlAuf5mMLONRyOIcLBGJAawuKZj0GNZM0DDyfIiv63g6cOGVUdPbGjzGOeK
 43nrrY1DnPSIiCsMQ1mdGBgd09ZbU7hmOt/yvu59q2hP3l8M/NAyQ9o/F9B/CQK0on
 fE3yWz8n685HzaXhQIOLWmaeEhVdi+exUo8YNDBbMl6cPP11Fb39GIRiU/kHrDNDvZ
 HNsfKIJOXgJf6U3sjs1605a6/2LOgx2m45e2P4jaM8tXl63pcbaHE+AD8eIJbaVA1T
 Q5DrM4P1UlMBg==
From: SeongJae Park <sj@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH 1/2] Docs/subsystem-apis: Remove '[The ]Linux' prefixes from
 titles of listed documents
Date: Sat, 14 Jan 2023 19:47:40 +0000
Message-Id: <20230114194741.115855-1-sj@kernel.org>
X-Mailer: git-send-email 2.25.1
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
Cc: alsa-devel@alsa-project.org, "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, dri-devel@lists.freedesktop.org,
 Takashi Iwai <tiwai@suse.com>, David Airlie <airlied@gmail.com>,
 linux-watchdog@vger.kernel.org, Wim Van Sebroeck <wim@linux-watchdog.org>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Iwona Winiarska <iwona.winiarska@intel.com>, openbmc@lists.ozlabs.org,
 linux-doc@vger.kernel.org, linux-pci@vger.kernel.org,
 Guenter Roeck <linux@roeck-us.net>, Jean Delvare <jdelvare@suse.com>,
 Daniel Vetter <daniel@ffwll.ch>, linux-pm@vger.kernel.org,
 linux-input@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 linux-hwmon@vger.kernel.org, SeongJae Park <sj@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Some documents that listed on subsystem-apis have 'Linux' or 'The Linux'
title prefixes.  It's duplicated information, and makes finding the
document of interest with human eyes not easy.  Remove the prefixes from
the titles.

Signed-off-by: SeongJae Park <sj@kernel.org>
---
 Documentation/PCI/index.rst        | 6 +++---
 Documentation/cpu-freq/index.rst   | 6 +++---
 Documentation/crypto/index.rst     | 6 +++---
 Documentation/driver-api/index.rst | 6 +++---
 Documentation/gpu/index.rst        | 6 +++---
 Documentation/hwmon/index.rst      | 6 +++---
 Documentation/input/index.rst      | 6 +++---
 Documentation/mm/index.rst         | 6 +++---
 Documentation/peci/index.rst       | 6 +++---
 Documentation/scheduler/index.rst  | 6 +++---
 Documentation/scsi/index.rst       | 6 +++---
 Documentation/sound/index.rst      | 6 +++---
 Documentation/virt/index.rst       | 6 +++---
 Documentation/watchdog/index.rst   | 6 +++---
 14 files changed, 42 insertions(+), 42 deletions(-)

diff --git a/Documentation/PCI/index.rst b/Documentation/PCI/index.rst
index c17c87af1968..e73f84aebde3 100644
--- a/Documentation/PCI/index.rst
+++ b/Documentation/PCI/index.rst
@@ -1,8 +1,8 @@
 .. SPDX-License-Identifier: GPL-2.0
 
-=======================
-Linux PCI Bus Subsystem
-=======================
+=================
+PCI Bus Subsystem
+=================
 
 .. toctree::
    :maxdepth: 2
diff --git a/Documentation/cpu-freq/index.rst b/Documentation/cpu-freq/index.rst
index 2fe32dad562a..de25740651f7 100644
--- a/Documentation/cpu-freq/index.rst
+++ b/Documentation/cpu-freq/index.rst
@@ -1,8 +1,8 @@
 .. SPDX-License-Identifier: GPL-2.0
 
-==============================================================================
-Linux CPUFreq - CPU frequency and voltage scaling code in the Linux(TM) kernel
-==============================================================================
+========================================================================
+CPUFreq - CPU frequency and voltage scaling code in the Linux(TM) kernel
+========================================================================
 
 Author: Dominik Brodowski  <linux@brodo.de>
 
diff --git a/Documentation/crypto/index.rst b/Documentation/crypto/index.rst
index 21338fa92642..da5d5ad2bdf3 100644
--- a/Documentation/crypto/index.rst
+++ b/Documentation/crypto/index.rst
@@ -1,6 +1,6 @@
-=======================
-Linux Kernel Crypto API
-=======================
+==========
+Crypto API
+==========
 
 :Author: Stephan Mueller
 :Author: Marek Vasut
diff --git a/Documentation/driver-api/index.rst b/Documentation/driver-api/index.rst
index d3a58f77328e..b208e0dac3a0 100644
--- a/Documentation/driver-api/index.rst
+++ b/Documentation/driver-api/index.rst
@@ -1,6 +1,6 @@
-========================================
-The Linux driver implementer's API guide
-========================================
+==============================
+Driver implementer's API guide
+==============================
 
 The kernel offers a wide variety of interfaces to support the development
 of device drivers.  This document is an only somewhat organized collection
diff --git a/Documentation/gpu/index.rst b/Documentation/gpu/index.rst
index b99dede9a5b1..eee5996acf2c 100644
--- a/Documentation/gpu/index.rst
+++ b/Documentation/gpu/index.rst
@@ -1,6 +1,6 @@
-==================================
-Linux GPU Driver Developer's Guide
-==================================
+============================
+GPU Driver Developer's Guide
+============================
 
 .. toctree::
 
diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
index fe2cc6b73634..c2b3c1a822dd 100644
--- a/Documentation/hwmon/index.rst
+++ b/Documentation/hwmon/index.rst
@@ -1,6 +1,6 @@
-=========================
-Linux Hardware Monitoring
-=========================
+===================
+Hardware Monitoring
+===================
 
 .. toctree::
    :maxdepth: 1
diff --git a/Documentation/input/index.rst b/Documentation/input/index.rst
index 9888f5cbf6d5..35581cd18e91 100644
--- a/Documentation/input/index.rst
+++ b/Documentation/input/index.rst
@@ -1,6 +1,6 @@
-=============================
-The Linux Input Documentation
-=============================
+===================
+Input Documentation
+===================
 
 Contents:
 
diff --git a/Documentation/mm/index.rst b/Documentation/mm/index.rst
index 4aa12b8be278..5a94a921ea40 100644
--- a/Documentation/mm/index.rst
+++ b/Documentation/mm/index.rst
@@ -1,6 +1,6 @@
-=====================================
-Linux Memory Management Documentation
-=====================================
+===============================
+Memory Management Documentation
+===============================
 
 Memory Management Guide
 =======================
diff --git a/Documentation/peci/index.rst b/Documentation/peci/index.rst
index 989de10416e7..930e75217c33 100644
--- a/Documentation/peci/index.rst
+++ b/Documentation/peci/index.rst
@@ -1,8 +1,8 @@
 .. SPDX-License-Identifier: GPL-2.0-only
 
-====================
-Linux PECI Subsystem
-====================
+==============
+PECI Subsystem
+==============
 
 .. toctree::
 
diff --git a/Documentation/scheduler/index.rst b/Documentation/scheduler/index.rst
index b430d856056a..1aac972a652f 100644
--- a/Documentation/scheduler/index.rst
+++ b/Documentation/scheduler/index.rst
@@ -1,6 +1,6 @@
-===============
-Linux Scheduler
-===============
+=========
+Scheduler
+=========
 
 .. toctree::
     :maxdepth: 1
diff --git a/Documentation/scsi/index.rst b/Documentation/scsi/index.rst
index 7c5f5f8f614e..919f3edfe1bf 100644
--- a/Documentation/scsi/index.rst
+++ b/Documentation/scsi/index.rst
@@ -1,8 +1,8 @@
 .. SPDX-License-Identifier: GPL-2.0
 
-====================
-Linux SCSI Subsystem
-====================
+==============
+SCSI Subsystem
+==============
 
 .. toctree::
    :maxdepth: 1
diff --git a/Documentation/sound/index.rst b/Documentation/sound/index.rst
index 4d7d42acf6df..5abed5fc6485 100644
--- a/Documentation/sound/index.rst
+++ b/Documentation/sound/index.rst
@@ -1,6 +1,6 @@
-===================================
-Linux Sound Subsystem Documentation
-===================================
+=============================
+Sound Subsystem Documentation
+=============================
 
 .. toctree::
    :maxdepth: 2
diff --git a/Documentation/virt/index.rst b/Documentation/virt/index.rst
index 56e003ff28ff..7fb55ae08598 100644
--- a/Documentation/virt/index.rst
+++ b/Documentation/virt/index.rst
@@ -1,8 +1,8 @@
 .. SPDX-License-Identifier: GPL-2.0
 
-============================
-Linux Virtualization Support
-============================
+======================
+Virtualization Support
+======================
 
 .. toctree::
    :maxdepth: 2
diff --git a/Documentation/watchdog/index.rst b/Documentation/watchdog/index.rst
index c177645081d8..4603f2511f58 100644
--- a/Documentation/watchdog/index.rst
+++ b/Documentation/watchdog/index.rst
@@ -1,8 +1,8 @@
 .. SPDX-License-Identifier: GPL-2.0
 
-======================
-Linux Watchdog Support
-======================
+================
+Watchdog Support
+================
 
 .. toctree::
     :maxdepth: 1
-- 
2.25.1

