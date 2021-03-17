Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D4A43401DC
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Mar 2021 10:21:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9419516CF;
	Thu, 18 Mar 2021 10:20:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9419516CF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616059302;
	bh=j0OPnDllQsRoW0h/oSyvxgSIesk7DszIn6gQSxTnQ/s=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=kdvkjtsXKhaouN87w+0KNSjcDOlQYgR4ti/767xRHz/sFFc65jU3tB45H+xz101HC
	 3xouV3TuOdxxcwsoJLeTPL/P/SG98kwFsG4qPjXwlEFbh+iCVUTqKyVsodSN9gbbdH
	 1VndTBoi5ZGld6rNO6DrIQkgvmI0jlG+IGTby1Zg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8528FF804E6;
	Thu, 18 Mar 2021 10:16:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A8950F8021C; Wed, 17 Mar 2021 21:39:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 56068F80124
 for <alsa-devel@alsa-project.org>; Wed, 17 Mar 2021 21:39:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 56068F80124
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="S3tPk3MQ"
Received: by mail-pl1-x629.google.com with SMTP id v8so154754plz.10
 for <alsa-devel@alsa-project.org>; Wed, 17 Mar 2021 13:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=1Sz1C+2ZFN+q+zvGzAvorWvnnUr4dg3QlHRxSjGhysc=;
 b=S3tPk3MQF11R+zuq0bgUR4hIronf/vGlpAZP8O0PrITEMiApnIaYB2gGRF8civJFzG
 uv42cNXJcclm8RiH2qgoBhDJjYxyuNJy5iLZLVXFNiivvS7hw+mHBI6Tzy72P62tGmvT
 1GkGK472gU41lrvh5Y6sVWwA1etkLBAwl+p5xionYlrn0yqSVJ6/urPFBIKcRdasEfBS
 svgv7YI2/O4JP31rdfnFpoUDJMo6/84COiIjgODO7m+rc+MrmceX556r95FFRHpe5kjd
 u9xcYqZqE+ODmy0EdhxPhYUbQY/+OIa7GZmvqUbtIplm5jjwULt7MKa73j7yI33VrvHd
 5J7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=1Sz1C+2ZFN+q+zvGzAvorWvnnUr4dg3QlHRxSjGhysc=;
 b=ODQPBHDhAcLhrY93pnqJGxpE4ChkrFjbbgl+lowHeBV8qK2GhGMyT9PAodekQQeVpm
 iTTEfRPI+AF7u80/br4iLKbOAy97xWhAHr+OLFSeotyUkswoClYbglY250T2tP4g7aJ7
 X6okkN5V7e6msfdJuINp7E/f1q9Ot41zKJ9VtXZV7RKL0AOZQnQVoDwOsNcnLSOFwXah
 IlknXQ32th+ptmhKZADwZoIaORRDw/+MV9itBW5atyTx7Fh/HEDBGmhJ5knISp3Y111L
 6GF116oGl4f8bK4qnh2Bdp3vM10cRhbfm6nJVPuJy5c3P88a7qr9rEprgCjeRXoAzj5V
 aW9w==
X-Gm-Message-State: AOAM531pjSBNBo3JBSUFhEkXzv9EP+Sw0QfI1736OiBKduO3lQ9Eqao2
 MBGhk07iHAvPV70UfMifzsf8S9vuOhklZA==
X-Google-Smtp-Source: ABdhPJyHvqNXWYiQFlP6lBYKHTioS2TG/xF/vjbAFcAFZq1pVwHMhocEMc7WfbfkZ/8lZtxPaM3jiA==
X-Received: by 2002:a17:902:8c8d:b029:e5:e1fc:a587 with SMTP id
 t13-20020a1709028c8db02900e5e1fca587mr6300488plo.12.1616013582130; 
 Wed, 17 Mar 2021 13:39:42 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:600d:a089:85d1:b0af:d6ff:42d8])
 by smtp.googlemail.com with ESMTPSA id x2sm14513099pga.60.2021.03.17.13.39.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Mar 2021 13:39:41 -0700 (PDT)
From: Aditya Srivastava <yashsri421@gmail.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: ctxfi: fix comment syntax in file headers
Date: Thu, 18 Mar 2021 02:09:32 +0530
Message-Id: <20210317203932.23993-1-yashsri421@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Thu, 18 Mar 2021 10:16:09 +0100
Cc: yashsri421@gmail.com, linux-kernel@vger.kernel.org, tiwai@suse.com,
 pierre-louis.bossart@linux.intel.com, lukas.bulwahn@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
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

The opening comment mark '/**' is used for highlighting the beginning of
kernel-doc comments.
There are files in sound/pci/ctxfi which follow this syntax in their file
headers, i.e. start with '/**' like comments, which causes unexpected
warnings from kernel-doc.

E.g., running scripts/kernel-doc -none on sound/pci/ctxfi/ctresource.c
causes this warning:
"warning: wrong kernel-doc identifier on line:
 * Copyright (C) 2008, Creative Technology Ltd. All Rights Reserved."

Similarly for other files too.

Provide a simple fix by replacing the kernel-doc like comment syntax with
general format, i.e. "/*", to prevent kernel-doc from parsing it.

Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
---
 sound/pci/ctxfi/ct20k1reg.h  | 2 +-
 sound/pci/ctxfi/ct20k2reg.h  | 2 +-
 sound/pci/ctxfi/ctamixer.c   | 2 +-
 sound/pci/ctxfi/ctamixer.h   | 2 +-
 sound/pci/ctxfi/ctatc.c      | 2 +-
 sound/pci/ctxfi/ctatc.h      | 2 +-
 sound/pci/ctxfi/ctdaio.c     | 2 +-
 sound/pci/ctxfi/ctdaio.h     | 2 +-
 sound/pci/ctxfi/cthardware.h | 2 +-
 sound/pci/ctxfi/cthw20k1.h   | 2 +-
 sound/pci/ctxfi/cthw20k2.h   | 2 +-
 sound/pci/ctxfi/ctimap.h     | 2 +-
 sound/pci/ctxfi/ctmixer.h    | 2 +-
 sound/pci/ctxfi/ctpcm.h      | 2 +-
 sound/pci/ctxfi/ctresource.c | 2 +-
 sound/pci/ctxfi/ctresource.h | 2 +-
 sound/pci/ctxfi/ctsrc.c      | 2 +-
 sound/pci/ctxfi/ctsrc.h      | 2 +-
 sound/pci/ctxfi/ctvmem.c     | 2 +-
 sound/pci/ctxfi/ctvmem.h     | 2 +-
 20 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/sound/pci/ctxfi/ct20k1reg.h b/sound/pci/ctxfi/ct20k1reg.h
index d4bfee499fb1..05bb006c0f4c 100644
--- a/sound/pci/ctxfi/ct20k1reg.h
+++ b/sound/pci/ctxfi/ct20k1reg.h
@@ -1,5 +1,5 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
-/**
+/*
  * Copyright (C) 2008, Creative Technology Ltd. All Rights Reserved.
  */
 
diff --git a/sound/pci/ctxfi/ct20k2reg.h b/sound/pci/ctxfi/ct20k2reg.h
index af94ea66fdda..02f67828eabe 100644
--- a/sound/pci/ctxfi/ct20k2reg.h
+++ b/sound/pci/ctxfi/ct20k2reg.h
@@ -1,5 +1,5 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
-/**
+/*
  * Copyright (C) 2008, Creative Technology Ltd. All Rights Reserved.
  */
 
diff --git a/sound/pci/ctxfi/ctamixer.c b/sound/pci/ctxfi/ctamixer.c
index d4ff377eb3a3..da6e6350ceaf 100644
--- a/sound/pci/ctxfi/ctamixer.c
+++ b/sound/pci/ctxfi/ctamixer.c
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0-only
-/**
+/*
  * Copyright (C) 2008, Creative Technology Ltd. All Rights Reserved.
  *
  * @File	ctamixer.c
diff --git a/sound/pci/ctxfi/ctamixer.h b/sound/pci/ctxfi/ctamixer.h
index 4fafb397abed..4498e6139d0e 100644
--- a/sound/pci/ctxfi/ctamixer.h
+++ b/sound/pci/ctxfi/ctamixer.h
@@ -1,5 +1,5 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
-/**
+/*
  * Copyright (C) 2008, Creative Technology Ltd. All Rights Reserved.
  *
  * @File	ctamixer.h
diff --git a/sound/pci/ctxfi/ctatc.c b/sound/pci/ctxfi/ctatc.c
index f8ac96cf38a4..78f35e88aed6 100644
--- a/sound/pci/ctxfi/ctatc.c
+++ b/sound/pci/ctxfi/ctatc.c
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0-only
-/**
+/*
  * Copyright (C) 2008, Creative Technology Ltd. All Rights Reserved.
  *
  * @File    ctatc.c
diff --git a/sound/pci/ctxfi/ctatc.h b/sound/pci/ctxfi/ctatc.h
index ac31b32b277b..0bc7b71d910b 100644
--- a/sound/pci/ctxfi/ctatc.h
+++ b/sound/pci/ctxfi/ctatc.h
@@ -1,5 +1,5 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
-/**
+/*
  * Copyright (C) 2008, Creative Technology Ltd. All Rights Reserved.
  *
  * @File	ctatc.h
diff --git a/sound/pci/ctxfi/ctdaio.c b/sound/pci/ctxfi/ctdaio.c
index 4cb47b5a792c..f589da045342 100644
--- a/sound/pci/ctxfi/ctdaio.c
+++ b/sound/pci/ctxfi/ctdaio.c
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0-only
-/**
+/*
  * Copyright (C) 2008, Creative Technology Ltd. All Rights Reserved.
  *
  * @File	ctdaio.c
diff --git a/sound/pci/ctxfi/ctdaio.h b/sound/pci/ctxfi/ctdaio.h
index 431583bb0a3e..bd6310f48013 100644
--- a/sound/pci/ctxfi/ctdaio.h
+++ b/sound/pci/ctxfi/ctdaio.h
@@ -1,5 +1,5 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
-/**
+/*
  * Copyright (C) 2008, Creative Technology Ltd. All Rights Reserved.
  *
  * @File	ctdaio.h
diff --git a/sound/pci/ctxfi/cthardware.h b/sound/pci/ctxfi/cthardware.h
index 9e6b83bd432d..f406b626a28c 100644
--- a/sound/pci/ctxfi/cthardware.h
+++ b/sound/pci/ctxfi/cthardware.h
@@ -1,5 +1,5 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
-/**
+/*
  * Copyright (C) 2008, Creative Technology Ltd. All Rights Reserved.
  *
  * @File	cthardware.h
diff --git a/sound/pci/ctxfi/cthw20k1.h b/sound/pci/ctxfi/cthw20k1.h
index b7cbe82d71bd..ffb019abf651 100644
--- a/sound/pci/ctxfi/cthw20k1.h
+++ b/sound/pci/ctxfi/cthw20k1.h
@@ -1,5 +1,5 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
-/**
+/*
  * Copyright (C) 2008, Creative Technology Ltd. All Rights Reserved.
  *
  * @File	cthw20k1.h
diff --git a/sound/pci/ctxfi/cthw20k2.h b/sound/pci/ctxfi/cthw20k2.h
index 797b13dcd84c..6993a3d5277a 100644
--- a/sound/pci/ctxfi/cthw20k2.h
+++ b/sound/pci/ctxfi/cthw20k2.h
@@ -1,5 +1,5 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
-/**
+/*
  * Copyright (C) 2008, Creative Technology Ltd. All Rights Reserved.
  *
  * @File	cthw20k2.h
diff --git a/sound/pci/ctxfi/ctimap.h b/sound/pci/ctxfi/ctimap.h
index 79bc94bce4d5..49b1bb831410 100644
--- a/sound/pci/ctxfi/ctimap.h
+++ b/sound/pci/ctxfi/ctimap.h
@@ -1,5 +1,5 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
-/**
+/*
  * Copyright (C) 2008, Creative Technology Ltd. All Rights Reserved.
  *
  * @File	ctimap.h
diff --git a/sound/pci/ctxfi/ctmixer.h b/sound/pci/ctxfi/ctmixer.h
index 770dc18a85e8..e812f6c93b41 100644
--- a/sound/pci/ctxfi/ctmixer.h
+++ b/sound/pci/ctxfi/ctmixer.h
@@ -1,5 +1,5 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
-/**
+/*
  * Copyright (C) 2008, Creative Technology Ltd. All Rights Reserved.
  *
  * @File	ctmixer.h
diff --git a/sound/pci/ctxfi/ctpcm.h b/sound/pci/ctxfi/ctpcm.h
index dfa1c62f7d1e..8b39bdd262b4 100644
--- a/sound/pci/ctxfi/ctpcm.h
+++ b/sound/pci/ctxfi/ctpcm.h
@@ -1,5 +1,5 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
-/**
+/*
  * Copyright (C) 2008, Creative Technology Ltd. All Rights Reserved.
  *
  * @File	ctpcm.h
diff --git a/sound/pci/ctxfi/ctresource.c b/sound/pci/ctxfi/ctresource.c
index 6d0a01b189e1..81ad26934518 100644
--- a/sound/pci/ctxfi/ctresource.c
+++ b/sound/pci/ctxfi/ctresource.c
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0-only
-/**
+/*
  * Copyright (C) 2008, Creative Technology Ltd. All Rights Reserved.
  *
  * @File	ctresource.c
diff --git a/sound/pci/ctxfi/ctresource.h b/sound/pci/ctxfi/ctresource.h
index 93e47488a1c1..fdbfd808816d 100644
--- a/sound/pci/ctxfi/ctresource.h
+++ b/sound/pci/ctxfi/ctresource.h
@@ -1,5 +1,5 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
-/**
+/*
  * Copyright (C) 2008, Creative Technology Ltd. All Rights Reserved.
  *
  * @File	ctresource.h
diff --git a/sound/pci/ctxfi/ctsrc.c b/sound/pci/ctxfi/ctsrc.c
index 37c18ce84974..bd4697b44233 100644
--- a/sound/pci/ctxfi/ctsrc.c
+++ b/sound/pci/ctxfi/ctsrc.c
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0-only
-/**
+/*
  * Copyright (C) 2008, Creative Technology Ltd. All Rights Reserved.
  *
  * @File	ctsrc.c
diff --git a/sound/pci/ctxfi/ctsrc.h b/sound/pci/ctxfi/ctsrc.h
index 1204962280c8..1124daf50c9b 100644
--- a/sound/pci/ctxfi/ctsrc.h
+++ b/sound/pci/ctxfi/ctsrc.h
@@ -1,5 +1,5 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
-/**
+/*
  * Copyright (C) 2008, Creative Technology Ltd. All Rights Reserved.
  *
  * @File	ctsrc.h
diff --git a/sound/pci/ctxfi/ctvmem.c b/sound/pci/ctxfi/ctvmem.c
index bde28aa9e139..7a805c4a58e1 100644
--- a/sound/pci/ctxfi/ctvmem.c
+++ b/sound/pci/ctxfi/ctvmem.c
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0-only
-/**
+/*
  * Copyright (C) 2008, Creative Technology Ltd. All Rights Reserved.
  *
  * @File    ctvmem.c
diff --git a/sound/pci/ctxfi/ctvmem.h b/sound/pci/ctxfi/ctvmem.h
index 54818a3c245d..da54cbcdb0be 100644
--- a/sound/pci/ctxfi/ctvmem.h
+++ b/sound/pci/ctxfi/ctvmem.h
@@ -1,5 +1,5 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
-/**
+/*
  * Copyright (C) 2008, Creative Technology Ltd. All Rights Reserved.
  *
  * @File    ctvmem.h
-- 
2.17.1

