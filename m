Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 61BCC6F4F55
	for <lists+alsa-devel@lfdr.de>; Wed,  3 May 2023 05:55:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C64C61355;
	Wed,  3 May 2023 05:54:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C64C61355
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683086133;
	bh=6LXELRL34BN4LPhBXSHO4pfAXrYd4OlwOyi8Y9pLNbI=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=E/9NRzPqiMf1U8ZFgnDQ7a398Fyf+SVyL4zwxVPdKbslYFliq5K1QKw4nVk7rgWiS
	 jdkk8fXn2MSPBneMzzgyjNGRo4Lsoo87nFDUYTkT2vnnejavqFpjoGovpgmEUe5YRk
	 zjsvgZugENZeqbZptbZYJjKZHOlc8qZUPUSG4YJE=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EE862F8032B;
	Wed,  3 May 2023 05:54:42 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 39C78F8049E; Wed,  3 May 2023 05:54:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	RCVD_IN_SORBS_WEB,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 43D6AF800EC
	for <alsa-devel@alsa-project.org>; Wed,  3 May 2023 05:54:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 43D6AF800EC
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=rDNoWnGh
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-1aae5c2423dso38699975ad.3
        for <alsa-devel@alsa-project.org>;
 Tue, 02 May 2023 20:54:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683086063; x=1685678063;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6q3+C/O6BV/0gC+jrMbg3MwoGAyt7Cv6nHU3v3zys3I=;
        b=rDNoWnGhJwAj76Ge80sW8/InyLnBi7jwU23z97T9EoARIFUNIbUaF+GQ2D6DSU+vll
         BsowuuPL6I9xhwUYyaiYWWm3C01pX1qNTK7LzYk/ZiqHGEhsel0iJBK5GbeC5O/cIUkL
         dryGwMTYB0/Lsxn6sOHxgqg0DWg6rCzHVtKM6OfSmGKsvLXR1l6emV6kQY8nKt6ppTM8
         K/k1e28rmsxf4toOeLGhuN/YtinfmiH6IjLZGLmiYE4+q512hzPS9bGYvhb2la5246Ka
         cdqT1bMUPyYmrk6CgHTVwxzc7wR1NU2mAmSVJgTUU9GMskLiEM/Lfa3XUrwrP6/sBLay
         ErgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683086063; x=1685678063;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6q3+C/O6BV/0gC+jrMbg3MwoGAyt7Cv6nHU3v3zys3I=;
        b=Vqp1IlaGZ3ejI6j02gvXcRiZA1hH8kMHWsYZoNndsT2+km6FEToc1V3NFu0ONTE8Yc
         XjcKEPdNmFP1BITiC5WCiOIJonhHNM5HRi/M87pSVUvq40R3suW0DCJDdbkRUB0qIH/V
         kr/5DO8uoUtMEdm6qv2j+1Ym/jMM7lbMaEbf+dV8YVETy/RoQTBVW6EptqXiCHmt11tv
         IVp0a3tUR06lPedB5fdY2qCqSRFNC5+BybONA/fj2PYsXI/OM/i2ZDcZ9xA52oSLJGD6
         gdGs6rkJt8ce93B6Eh55+tfkOcpJEX+KnByR1za0bGDJXf/pmTGdul61JDTj1Qiaxg8a
         YRiw==
X-Gm-Message-State: AC+VfDz6REeIcKAnXHuPCl7D7AZMjFQxneQLC8FfFpLxmfg1L1RM2G0Y
	3bAbWchu7dj/JRUM1K9gmxzPaYrD+fQ=
X-Google-Smtp-Source: 
 ACHHUZ4FXkEzCEQcEM1H8rckNkqvjTZZ1HLLDrm2ZrxU2DPEZFArr8JYzLEEi7yxud81InKVTsb4jg==
X-Received: by 2002:a17:902:e88d:b0:1a6:6fe3:df8d with SMTP id
 w13-20020a170902e88d00b001a66fe3df8dmr899006plg.8.1683086063246;
        Tue, 02 May 2023 20:54:23 -0700 (PDT)
Received: from debian.me (subs03-180-214-233-11.three.co.id. [180.214.233.11])
        by smtp.gmail.com with ESMTPSA id
 c7-20020a170902aa4700b001a1faeac240sm20512918plr.186.2023.05.02.20.54.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 May 2023 20:54:22 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
	id EA49D10622E; Wed,  3 May 2023 10:54:19 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux ALSA Subsystem Development <alsa-devel@alsa-project.org>,
	Linux Documentation <linux-doc@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: [PATCH] ALSA: docs: Fix code block indentation in ALSA driver example
Date: Wed,  3 May 2023 10:54:16 +0700
Message-Id: <20230503035416.62722-1-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2821; i=bagasdotme@gmail.com;
 h=from:subject; bh=6LXELRL34BN4LPhBXSHO4pfAXrYd4OlwOyi8Y9pLNbI=;
 b=owGbwMvMwCX2bWenZ2ig32LG02pJDCmBt16EPVP9HMJw1cC8qGTVAZcZf8692rCv/c3y4A//r
 828EGOb3FHKwiDGxSArpsgyKZGv6fQuI5EL7WsdYeawMoEMYeDiFICJqLcz/HdaG928N+2fsO23
 7GWPuuIr9ObPqFrxL47fLLTKoTT8rQzD//LruWeVlM387uu+VpnT0rnkSfrzML3a7PZ5HdJPUph
 mMQIA
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp;
 fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 6R7NZQL5R74XTO5KJNWPX57F7AHJMLFL
X-Message-ID-Hash: 6R7NZQL5R74XTO5KJNWPX57F7AHJMLFL
X-MailFrom: bagasdotme@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Takashi Iwai <tiwai@suse.com>, Jonathan Corbet <corbet@lwn.net>,
 Oswald Buddenhagen <oswald.buddenhagen@gmx.de>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Bagas Sanjaya <bagasdotme@gmail.com>, kernel test robot <lkp@intel.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6R7NZQL5R74XTO5KJNWPX57F7AHJMLFL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Sphinx reports htmldocs warnings:

Documentation/sound/kernel-api/writing-an-alsa-driver.rst:3997: WARNING: Literal block expected; none found.
Documentation/sound/kernel-api/writing-an-alsa-driver.rst:4004: WARNING: Literal block expected; none found.
Documentation/sound/kernel-api/writing-an-alsa-driver.rst:4009: WARNING: Unexpected indentation.
Documentation/sound/kernel-api/writing-an-alsa-driver.rst:4035: WARNING: Literal block expected; none found.

These are due to indentation of example driver snippets which is outside
the code block scope.

Fix these by indenting code blocks in question to the scope.

Fixes: 4d421eebe1465d ("ALSA: docs: writing-an-alsa-driver.rst: polishing")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/linux-doc/202305021822.4U6XOvGf-lkp@intel.com/
Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 .../kernel-api/writing-an-alsa-driver.rst     | 22 +++++++++----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/Documentation/sound/kernel-api/writing-an-alsa-driver.rst b/Documentation/sound/kernel-api/writing-an-alsa-driver.rst
index c0f97b5e424969..4335c98b3d828f 100644
--- a/Documentation/sound/kernel-api/writing-an-alsa-driver.rst
+++ b/Documentation/sound/kernel-api/writing-an-alsa-driver.rst
@@ -3994,21 +3994,21 @@ Driver with A Single Source File
 
    Suppose you have a file xyz.c. Add the following two lines::
 
-  snd-xyz-objs := xyz.o
-  obj-$(CONFIG_SND_XYZ) += snd-xyz.o
+     snd-xyz-objs := xyz.o
+     obj-$(CONFIG_SND_XYZ) += snd-xyz.o
 
 2. Create the Kconfig entry
 
    Add the new entry of Kconfig for your xyz driver::
 
-  config SND_XYZ
-    tristate "Foobar XYZ"
-    depends on SND
-    select SND_PCM
-    help
-      Say Y here to include support for Foobar XYZ soundcard.
-      To compile this driver as a module, choose M here:
-      the module will be called snd-xyz.
+     config SND_XYZ
+       tristate "Foobar XYZ"
+       depends on SND
+       select SND_PCM
+       help
+         Say Y here to include support for Foobar XYZ soundcard.
+         To compile this driver as a module, choose M here:
+         the module will be called snd-xyz.
 
 The line ``select SND_PCM`` specifies that the driver xyz supports PCM.
 In addition to SND_PCM, the following components are supported for
@@ -4032,7 +4032,7 @@ located in the new subdirectory, sound/pci/xyz.
 1. Add a new directory (``sound/pci/xyz``) in ``sound/pci/Makefile``
    as below::
 
-  obj-$(CONFIG_SND) += sound/pci/xyz/
+     obj-$(CONFIG_SND) += sound/pci/xyz/
 
 
 2. Under the directory ``sound/pci/xyz``, create a Makefile::

base-commit: 348551ddaf311c76b01cdcbaf61b6fef06a49144
-- 
An old man doll... just what I always wanted! - Clara

