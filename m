Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E3E7327E9C7
	for <lists+alsa-devel@lfdr.de>; Wed, 30 Sep 2020 15:28:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E7DDB182B;
	Wed, 30 Sep 2020 15:27:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E7DDB182B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601472488;
	bh=qT/A26fuPrUppSrq5X7zh15zn0if/FmwFXCD56QtXLM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tWjOqTPbbFJEhOJGGjkbUbMPo2U4A4G2qwoDDcH+28etL0H8gP1N9QrUgoqfeyh9u
	 sD+p8+ZzI3JGO0v2pyAXqSx/CvpZFnqpNQ3lf9VGaB436fmV4dVnokPRS5PzykqIGl
	 MNcGBBg3AO5D7rjKBC7S1ZhbNmdjUg1ZkGdxs5h8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6A3C2F80292;
	Wed, 30 Sep 2020 15:25:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D8CADF80247; Wed, 30 Sep 2020 15:25:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A90E1F801D8
 for <alsa-devel@alsa-project.org>; Wed, 30 Sep 2020 15:25:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A90E1F801D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="U2pIBGrD"
Received: from mail.kernel.org (unknown [95.90.213.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 08547238E3;
 Wed, 30 Sep 2020 13:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601472321;
 bh=qT/A26fuPrUppSrq5X7zh15zn0if/FmwFXCD56QtXLM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=U2pIBGrDANM5Hk1NnHYRQqWk3D1c402TUOE4+2JzayfX3M7FBCaG7fW2bdCfuvZH8
 v066DljnSS5W23vbw1NnndTrj6jnrVKbV/Ugt4aYW9WlJXMNQvTNz9p0Fd4IGxQHmR
 ZndztyQvMEFv3qDCkAW2gZX0rvl5MqKQdkisKkFc=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
 (envelope-from <mchehab@kernel.org>)
 id 1kNc6g-001XK5-TY; Wed, 30 Sep 2020 15:25:18 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH v4 28/52] docs: remove sound API duplication
Date: Wed, 30 Sep 2020 15:24:51 +0200
Message-Id: <3556fe29bfa0e71c8da26e2d228a021a10ba62e1.1601467849.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1601467849.git.mchehab+huawei@kernel.org>
References: <cover.1601467849.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 linux-kernel@vger.kernel.org, "rd.dunlab@gmail.com" <rd.dunlab@gmail.com>,
 Randy Dunlap <rdunlap@infradead.org>, Pragat Pandya <pragat.pandya@gmail.com>,
 =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 Jason Gunthorpe <jgg@ziepe.ca>, Michael Walle <michael@walle.cc>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Harald Seiler <hws@denx.de>, Leonard Crestez <leonard.crestez@nxp.com>
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

The sound API is documented on two different parts:
under Documentation/driver-api/sound.rst and under
Documentation/sound/kernel-api/alsa-driver-api.rst.

The alsa-driver-api.rst seems more complete, and APIs
are split per type. There's just one missing kernel-doc
markup there.

Add it and drop the duplicated one.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/driver-api/index.rst            |  1 -
 Documentation/driver-api/sound.rst            | 54 -------------------
 .../sound/kernel-api/alsa-driver-api.rst      |  1 +
 3 files changed, 1 insertion(+), 55 deletions(-)
 delete mode 100644 Documentation/driver-api/sound.rst

diff --git a/Documentation/driver-api/index.rst b/Documentation/driver-api/index.rst
index 6e7c702e0268..987d6e74ea6a 100644
--- a/Documentation/driver-api/index.rst
+++ b/Documentation/driver-api/index.rst
@@ -27,7 +27,6 @@ available subsections can be seen below.
    component
    message-based
    infiniband
-   sound
    frame-buffer
    regulator
    iio/index
diff --git a/Documentation/driver-api/sound.rst b/Documentation/driver-api/sound.rst
deleted file mode 100644
index afef6eabc073..000000000000
--- a/Documentation/driver-api/sound.rst
+++ /dev/null
@@ -1,54 +0,0 @@
-Sound Devices
-=============
-
-.. kernel-doc:: include/sound/core.h
-   :internal:
-
-.. kernel-doc:: sound/sound_core.c
-   :export:
-
-.. kernel-doc:: include/sound/pcm.h
-   :internal:
-
-.. kernel-doc:: sound/core/pcm.c
-   :export:
-
-.. kernel-doc:: sound/core/device.c
-   :export:
-
-.. kernel-doc:: sound/core/info.c
-   :export:
-
-.. kernel-doc:: sound/core/rawmidi.c
-   :export:
-
-.. kernel-doc:: sound/core/sound.c
-   :export:
-
-.. kernel-doc:: sound/core/memory.c
-   :export:
-
-.. kernel-doc:: sound/core/pcm_memory.c
-   :export:
-
-.. kernel-doc:: sound/core/init.c
-   :export:
-
-.. kernel-doc:: sound/core/isadma.c
-   :export:
-
-.. kernel-doc:: sound/core/control.c
-   :export:
-
-.. kernel-doc:: sound/core/pcm_lib.c
-   :export:
-
-.. kernel-doc:: sound/core/hwdep.c
-   :export:
-
-.. kernel-doc:: sound/core/pcm_native.c
-   :export:
-
-.. kernel-doc:: sound/core/memalloc.c
-   :export:
-
diff --git a/Documentation/sound/kernel-api/alsa-driver-api.rst b/Documentation/sound/kernel-api/alsa-driver-api.rst
index c8cc651eccf7..d24c64df7069 100644
--- a/Documentation/sound/kernel-api/alsa-driver-api.rst
+++ b/Documentation/sound/kernel-api/alsa-driver-api.rst
@@ -132,3 +132,4 @@ ISA DMA Helpers
 Other Helper Macros
 -------------------
 .. kernel-doc:: include/sound/core.h
+.. kernel-doc:: sound/sound_core.c
-- 
2.26.2

