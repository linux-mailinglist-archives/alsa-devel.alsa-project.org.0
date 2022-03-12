Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 067084D7B36
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Mar 2022 08:05:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9349517F6;
	Mon, 14 Mar 2022 08:04:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9349517F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647241539;
	bh=XynmdvbYhf/M7r2ksuxrbt8VVYykiMb0DXuUMpOg4TU=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ayVwE9UD+b8tGns3+F/auFyWLeQT39pSrZSkWFCGf4xwWJI0h/CX8s3gpHDqRm0iU
	 sfUFeEt25a1zqxmU95OAS2psPpk1yYOIQnkcod1iNyHZ+eKYHCPIbqPFsxhfkTBYgH
	 kekLG55HT2rkwvp8CnPI2POVHU7O4DA935Rw6g88=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 87D04F805B0;
	Mon, 14 Mar 2022 07:59:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C8666F804AC; Sat, 12 Mar 2022 14:29:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from smtp-relay-internal-0.canonical.com
 (smtp-relay-internal-0.canonical.com [185.125.188.122])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CA93BF80171
 for <alsa-devel@alsa-project.org>; Sat, 12 Mar 2022 14:29:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CA93BF80171
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com
 header.b="wGSnEqAg"
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 0A2153F62E
 for <alsa-devel@alsa-project.org>; Sat, 12 Mar 2022 13:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1647091754;
 bh=OCrj2Lr7nKg3/D4n6AH2mK+/SAYpiHPGeQpPG1FkFdg=;
 h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
 b=wGSnEqAgjHrDfvY7OzkWEWtQb/612fnlsOvlWmaAjYkT9PzOj0BTAHOilqNTXxAKT
 4014KhJzvuqJ7H+VKrfrPSLZEuMpAlmXMvZJE16BZafTlnH0MVnjG81EvK5geWY73y
 sYaJbr127WhQIt6eBwQbPh4Vyp3a4QHl+reo+PasrQ9ltRLQR8/BRNO+eEAnzpJxU7
 2aD3pxOeyinORmunyP3i73v+Q39kNJNBtSXXmbOkolD5gjcIdA6XdfNtWq5QEG2vbw
 LdqfeGxeeC5CLrJSuyiqY+8h+A5zo2UWSXCp5ZjN4OBkziBIVXsrEB7+6LKXydGYID
 ybosZQT9iob8g==
Received: by mail-wm1-f71.google.com with SMTP id
 84-20020a1c0257000000b00389a203e5adso3227231wmc.2
 for <alsa-devel@alsa-project.org>; Sat, 12 Mar 2022 05:29:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OCrj2Lr7nKg3/D4n6AH2mK+/SAYpiHPGeQpPG1FkFdg=;
 b=Jh+fqHvjBv+CfChjoQlA9bwUXsLxbjVFk32u2n4+4tUrguN3jfreY0kHEKqhGTY6mo
 BtCCnTbeE3u9+i2a0sut1kd1jSBqhbT+WkoqN/M60sOzMfTXEa7Ge5yhnaz3O9r7Ojs/
 YRTxbf6xqUzOGc1BdLgwf7GEVFckM/3YM9FSoLP6ryRHUT3P51toqr66W9rHVPcuLR4L
 Us6KWFJC5Mg4sCAA+ogDDQC/3Cfz24E6U9lOVqWP+BF8L5/8ZIszilsUrQnx/i/r6spa
 fvvtXX4fQu2pCIb/KnLYrQaRWjdPI2sPNjcHWTAPehjMiOYYiRllDdRfpcvjpe1K/c4T
 SuRg==
X-Gm-Message-State: AOAM532GFrpvXrp45WWn1hdivWao1TMUHkStO6Zb5grAkQ5i++eq4L4T
 xH1GhIkVkSWBkQX/D70pJgRduGXbz11DOPQKU7B7BUdjYbLswcNDKOpLo3D2t13LCLv8yWU65N6
 HR/UExyWDa8lbRkgS2cFFjUOJBAOqnusG54MGHcXR
X-Received: by 2002:a5d:4dca:0:b0:1f0:2543:e10e with SMTP id
 f10-20020a5d4dca000000b001f02543e10emr10689853wru.60.1647091753472; 
 Sat, 12 Mar 2022 05:29:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx08jwnIztDnOLiXVDOEbPcafrm/CtfYrKe3rhTTULaSTSBSgqOJ8fo2V1YMqeSSpK6UdbZbQ==
X-Received: by 2002:a5d:4dca:0:b0:1f0:2543:e10e with SMTP id
 f10-20020a5d4dca000000b001f02543e10emr10689827wru.60.1647091753256; 
 Sat, 12 Mar 2022 05:29:13 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-174-239.adslplus.ch.
 [188.155.174.239]) by smtp.gmail.com with ESMTPSA id
 p22-20020a1c5456000000b00389e7e62800sm5751550wmi.8.2022.03.12.05.29.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 12 Mar 2022 05:29:12 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>
Subject: [PATCH v4 00/11] Fix broken usage of driver_override (and kfree of
 static memory)
Date: Sat, 12 Mar 2022 14:28:45 +0100
Message-Id: <20220312132856.65163-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 14 Mar 2022 07:58:50 +0100
Cc: linux-hyperv@vger.kernel.org, Stuart Yoder <stuyoder@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, linux-pci@vger.kernel.org,
 Jason Wang <jasowang@redhat.com>, linux-remoteproc@vger.kernel.org,
 alsa-devel@alsa-project.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Vineeth Vijayan <vneethv@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 "K. Y. Srinivasan" <kys@microsoft.com>, Fabio Estevam <festevam@gmail.com>,
 linux-clk@vger.kernel.org, linux-s390@vger.kernel.org,
 Wei Liu <wei.liu@kernel.org>, Stephen Hemminger <sthemmin@microsoft.com>,
 Abel Vesa <abel.vesa@nxp.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Dexuan Cui <decui@microsoft.com>, Andy Gross <agross@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-spi@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Bjorn Helgaas <bhelgaas@google.com>, virtualization@lists.linux-foundation.org,
 linux-arm-kernel@lists.infradead.org,
 Laurentiu Tudor <laurentiu.tudor@nxp.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Haiyang Zhang <haiyangz@microsoft.com>,
 Peter Oberparleiter <oberpar@linux.ibm.com>, linux-kernel@vger.kernel.org,
 Sven Schnelle <svens@linux.ibm.com>, Shawn Guo <shawnguo@kernel.org>
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

Dependencies, merging and stable
================================
1. All patches, including last three fixes, depend on the first patch
   introducing the helper.
2. Merging idea: everything via driver core (Greg KH?).
2. The last three commits - fixes - are probably not backportable
   directly, because of this dependency. I don't know how to express
   this dependency here, since stable-kernel-rules.rst mentions only commits as
   possible dependencies.

[1] https://lore.kernel.org/all/1550484960-2392-3-git-send-email-krzk@kernel.org/

Best regards,
Krzysztof

Krzysztof Kozlowski (11):
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
  rpmsg: Fix kfree() of static memory on setting driver_override

 drivers/amba/bus.c              | 28 +++--------------
 drivers/base/driver.c           | 56 +++++++++++++++++++++++++++++++++
 drivers/base/platform.c         | 28 +++--------------
 drivers/bus/fsl-mc/fsl-mc-bus.c | 25 +++------------
 drivers/clk/imx/clk-scu.c       |  7 ++++-
 drivers/hv/vmbus_drv.c          | 28 +++--------------
 drivers/pci/pci-sysfs.c         | 28 +++--------------
 drivers/rpmsg/rpmsg_core.c      |  3 +-
 drivers/rpmsg/rpmsg_internal.h  | 13 ++++++--
 drivers/rpmsg/rpmsg_ns.c        | 14 +++++++--
 drivers/s390/cio/cio.h          |  6 +++-
 drivers/s390/cio/css.c          | 28 +++--------------
 drivers/slimbus/qcom-ngd-ctrl.c | 13 +++++++-
 drivers/spi/spi.c               | 26 +++------------
 drivers/vdpa/vdpa.c             | 29 +++--------------
 include/linux/amba/bus.h        |  6 +++-
 include/linux/device/driver.h   |  2 ++
 include/linux/fsl/mc.h          |  6 ++--
 include/linux/hyperv.h          |  6 +++-
 include/linux/pci.h             |  6 +++-
 include/linux/platform_device.h |  6 +++-
 include/linux/rpmsg.h           |  6 ++--
 include/linux/spi/spi.h         |  2 ++
 include/linux/vdpa.h            |  4 ++-
 24 files changed, 171 insertions(+), 205 deletions(-)

-- 
2.32.0

