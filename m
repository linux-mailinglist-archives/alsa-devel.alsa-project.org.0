Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 68F71506B91
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Apr 2022 13:57:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ED2E518AA;
	Tue, 19 Apr 2022 13:56:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ED2E518AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650369466;
	bh=aIpHw022MxQOLGxVe4Y35f6DVEHj4y5sX2WfiRG84XQ=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=tpA38VknfNRjuGYqGYA7pTBN2T15QTWn3WGK09pCD3BUp8qBGcKC79BeLG4nvvzym
	 iIpK79YsXoqs6VsBY0x4fHk5Ia+jMj9FayVIXNPl9L8X0E4UuQqbuYj5CTq7NYSZDF
	 K5XHuV7L/gpS2iehlQcv7052JXczk7t5CCXIM3tU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 745FAF80579;
	Tue, 19 Apr 2022 13:52:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 693C9F80121; Tue, 19 Apr 2022 13:34:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 46A99F80121
 for <alsa-devel@alsa-project.org>; Tue, 19 Apr 2022 13:34:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 46A99F80121
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="KQats4yW"
Received: by mail-ej1-x62e.google.com with SMTP id lc2so32211146ejb.12
 for <alsa-devel@alsa-project.org>; Tue, 19 Apr 2022 04:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+RS2KaOerzQuwGLCJlNRvQqdlqz9kGKXmmE/o8hIMxc=;
 b=KQats4yWut+GAInZpgo6wlkPKVDagbM3R0tOSjC/tXzsGfNp7h99Zs58vCptEscTpK
 mbbyQT/so7ThPQX6ZBwVgU/6/OMYPhZ3b8NWVo58v/AWgjGj/c13IinU0JZUxgsLmUbX
 wtYV4iKZ7ZxkIIXJYr27Z/OtYMBaCbJnYhLBGRpddVl1U1LTnJSB6NA88CzMeSaiqqqr
 2PHKBRlsALK1YRRnJegN2W7zECiyg6PKkD33wHtut9O6mBuGtDG4eNOOmh7evJgldNFD
 daON6jPbeCRx5RgbYuUVlqa5xdPtHbcMYVioGRHSRAffliIvrFMlh5w4Z4HpNMVbB8RB
 CtMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+RS2KaOerzQuwGLCJlNRvQqdlqz9kGKXmmE/o8hIMxc=;
 b=YUo1V3CxMhcINqxGQuEyBAZGUZaH+KMNGODeZcS9tZXYWNUPCYxL3XViBAUm/p6CNU
 kos+kfeT+J/MWTJ8G1KD8FcZYYw1vwV9LtU8X0BQRRzFXvADS6puzMZhKVPrm8fr1ftH
 tftQyCx6qzxA8xYnsOEeim0RfA5y2JVvIDiCI3xCP/KGRwnAa/DRNFPX6ZHEDqbct7k7
 QG/IgbzzeYY5A96GvnR/RdvJK9v/DHCVD91LQNeaFnECp2KMFDxZtwTijPXljvrGtaWG
 CacyiFdbqvL/qy5Ttlx4ZwIHuyBBJfFJZFP685rEhbedAK4dFg9+FQh/NAiqt9gJVMwM
 goqw==
X-Gm-Message-State: AOAM532I0ge+Wohw5fr3RbmoB9sVHXD+nceQqHpuI9N4IXCn0Q33haim
 MJbnyLbX9gr1fLNZiukF36hzGw==
X-Google-Smtp-Source: ABdhPJzqToh0YQRiewe8EqLT6PK01CMGRMmUim2jYYjkDbBJ++z/iu7RXEodKQaWchfKBfcBWKLKsQ==
X-Received: by 2002:a17:907:6e90:b0:6ef:ef41:ac10 with SMTP id
 sh16-20020a1709076e9000b006efef41ac10mr750787ejc.187.1650368087470; 
 Tue, 19 Apr 2022 04:34:47 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 ce21-20020a170906b25500b006e89869cbf9sm5608802ejb.105.2022.04.19.04.34.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Apr 2022 04:34:46 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>
Subject: [PATCH v7 00/12] Fix broken usage of driver_override (and kfree of
 static memory)
Date: Tue, 19 Apr 2022 13:34:23 +0200
Message-Id: <20220419113435.246203-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 19 Apr 2022 13:52:23 +0200
Cc: linux-hyperv@vger.kernel.org, Stuart Yoder <stuyoder@gmail.com>,
 linux-pci@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 alsa-devel@alsa-project.org, Peter Oberparleiter <oberpar@linux.ibm.com>,
 Vineeth Vijayan <vneethv@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 "K. Y. Srinivasan" <kys@microsoft.com>, linux-clk@vger.kernel.org,
 linux-s390@vger.kernel.org, Wei Liu <wei.liu@kernel.org>,
 Stephen Hemminger <sthemmin@microsoft.com>, Dexuan Cui <decui@microsoft.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>, Andy Gross <agross@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 virtualization@lists.linux-foundation.org, Heiko Carstens <hca@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, linux-arm-msm@vger.kernel.org,
 Haiyang Zhang <haiyangz@microsoft.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-arm-kernel@lists.infradead.org,
 Mathieu Poirier <mathieu.poirier@linaro.org>, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Sven Schnelle <svens@linux.ibm.com>,
 Linus Torvalds <torvalds@linux-foundation.org>
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

Hi,

This is a continuation of my old patchset from 2019. [1]
Back then, few drivers set driver_override wrong. I fixed Exynos
in a different way after discussions. QCOM NGD was not fixed
and a new user appeared - IMX SCU.

It seems "char *" in driver_override looks too consty, so we
tend to make a mistake of storing there string literals.

Changes since latest v7
=======================
1. Patch #1: remove out_free label, document clearing override in kerneldoc and
   in code-comments (Andy).
2. Patch #12 (rpmsg): do not duplicate string (Biju).

Changes since latest v6
=======================
1. Patch #1: Don't check for !dev and handle len==0 (Andy).
2. New patch #11 (rpmsg): split constifying of local variable to a new patch.

Changes since latest v5
=======================
1. Patch #11 (rpmsg): split from previous patch 11 - easier to understand the
   need of it.
2. Fix build issue in patch 12 (rpmsg).

Changes since latest v4
=======================
1. Correct commit msgs and comments after Andy's review.
2. Re-order code in new helper (patch #1) (Andy).
3. Add tags.

Changes since latest v3
=======================
1. Wrap comments, extend comment in driver_set_override() about newline.
2. Minor commit msg fixes.
3. Add tags.

Changes since latest v2
=======================
1. Make all driver_override fields as "const char *", just like SPI
   and VDPA. (Mark)
2. Move "count" check to the new helper and add "count" argument. (Michael)
3. Fix typos in docs, patch subject. Extend doc. (Michael, Bjorn)
4. Compare pointers to reduce number of string readings in the helper.
5. Fix clk-imx return value.

Changes since latest v1 (not the old 2019 solution):
====================================================
https://lore.kernel.org/all/708eabb1-7b35-d525-d4c3-451d4a3de84f@rasmusvillemoes.dk/
1. Add helper for setting driver_override.
2. Use the helper.

Dependencies (and stable):
==========================
1. All patches, including last three fixes, depend on the first patch
   introducing the helper.
2. The last three commits - fixes - are probably not backportable
   directly, because of this dependency. I don't know how to express
   this dependency here, since stable-kernel-rules.rst mentions only commits as
   possible dependencies.

[1] https://lore.kernel.org/all/1550484960-2392-3-git-send-email-krzk@kernel.org/

Best regards,
Krzysztof

Krzysztof Kozlowski (12):
  driver: platform: Add helper for safer setting of driver_override
  amba: Use driver_set_override() instead of open-coding
  fsl-mc: Use driver_set_override() instead of open-coding
  hv: Use driver_set_override() instead of open-coding
  PCI: Use driver_set_override() instead of open-coding
  s390/cio: Use driver_set_override() instead of open-coding
  spi: Use helper for safer setting of driver_override
  vdpa: Use helper for safer setting of driver_override
  clk: imx: scu: Fix kfree() of static memory on setting driver_override
  slimbus: qcom-ngd: Fix kfree() of static memory on setting
    driver_override
  rpmsg: Constify local variable in field store macro
  rpmsg: Fix kfree() of static memory on setting driver_override

 drivers/amba/bus.c              | 28 ++-----------
 drivers/base/driver.c           | 69 +++++++++++++++++++++++++++++++++
 drivers/base/platform.c         | 28 ++-----------
 drivers/bus/fsl-mc/fsl-mc-bus.c | 25 ++----------
 drivers/clk/imx/clk-scu.c       |  7 +++-
 drivers/hv/vmbus_drv.c          | 28 ++-----------
 drivers/pci/pci-sysfs.c         | 28 ++-----------
 drivers/rpmsg/rpmsg_core.c      |  3 +-
 drivers/rpmsg/rpmsg_internal.h  | 13 ++++++-
 drivers/rpmsg/rpmsg_ns.c        | 14 ++++++-
 drivers/s390/cio/cio.h          |  6 ++-
 drivers/s390/cio/css.c          | 28 ++-----------
 drivers/slimbus/qcom-ngd-ctrl.c | 13 ++++++-
 drivers/spi/spi.c               | 26 ++-----------
 drivers/vdpa/vdpa.c             | 29 ++------------
 include/linux/amba/bus.h        |  6 ++-
 include/linux/device/driver.h   |  2 +
 include/linux/fsl/mc.h          |  6 ++-
 include/linux/hyperv.h          |  6 ++-
 include/linux/pci.h             |  6 ++-
 include/linux/platform_device.h |  6 ++-
 include/linux/rpmsg.h           |  6 ++-
 include/linux/spi/spi.h         |  2 +
 include/linux/vdpa.h            |  4 +-
 24 files changed, 184 insertions(+), 205 deletions(-)

-- 
2.32.0

