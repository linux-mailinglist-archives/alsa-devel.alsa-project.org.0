Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F1B1C4C9F4E
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Mar 2022 09:35:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1A15A195A;
	Wed,  2 Mar 2022 09:34:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1A15A195A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646210120;
	bh=BBHgRQ3y/ig5M514Y+sh2bqAQa9lbPl4X2kAoWddprg=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=SO+xf72JmtSYmMQ0Qd2DxmmGjwlF99lCk1/HfIA+OL6YTU3wpxBpX30uURXPbk+EC
	 XUJFRXwjS8C1zZ2E9iBqcWF04gOtG6Cykw87Vcan9f/QBR80m9D/lf2qvsvoKmeFyf
	 lk1HhcapW6VQemMa8rZQgf21YigsFmH+Hn6I8NBU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 31804F80054;
	Wed,  2 Mar 2022 09:33:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 530C5F80155; Sun, 27 Feb 2022 14:52:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from smtp-relay-internal-1.canonical.com
 (smtp-relay-internal-1.canonical.com [185.125.188.123])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 910BDF80128
 for <alsa-devel@alsa-project.org>; Sun, 27 Feb 2022 14:52:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 910BDF80128
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com
 header.b="TZZSta9W"
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 97FBF3FCAE
 for <alsa-devel@alsa-project.org>; Sun, 27 Feb 2022 13:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1645969951;
 bh=beBPqukoSZCIAAv6gBbQLkWehzWMNdiQtzWlJ1M8u3o=;
 h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
 b=TZZSta9W+opM9tp2PKfOogdUrLpMwdIf9jfb1m7WN47LWElIJvO5EWW1q7BWacJRI
 oKY/bDMzk2v3WhXVcX3fG4Pwgt5zboLIgwjTy5b82CbBrmFOSRTGy/6Wd5qCgn5fxr
 w3EF1AiYbxAHC29+e20vk61kWzNh8nRv45QaL3jdraU6zGzUu4QZTtIrA1EzA6YDZd
 okfq0pPxyVH4O8K0zkCjcGIMRjRM47eIFay+vt90ImuYYrGgmn5tdeUjF70x/uZFXZ
 AvTiOJw6siowoae8AqBIyD8Fmga/7L40DAf9FQAnD461/1mcBr6JF0YPtOZfzyB0BX
 Ms8QPBF+n6BjQ==
Received: by mail-ed1-f72.google.com with SMTP id
 s7-20020a508dc7000000b0040f29ccd65aso4264342edh.1
 for <alsa-devel@alsa-project.org>; Sun, 27 Feb 2022 05:52:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=beBPqukoSZCIAAv6gBbQLkWehzWMNdiQtzWlJ1M8u3o=;
 b=cLZ88ro0P5vteF6WrrbeV4WCfrGPv+kikYi/iDxVej8+cNMXrWsWT1qf70YAbC6XAt
 AjBJmWCrYzddxk7Wu8bxplrl7oYBd1QpuLJNoIyzP8sxDWkLECaaN+56ooBRyBZ8+X6f
 V3IikvB7D2aaikKjjpg2nGwKKcZcqLXR4Ofmhmi8YXoSbMQPntetapdturzINGd9eDcw
 KySemDLk6YCo94nwwvvH8NQxan+yO2g3M0d7xt1KM+QTW5BRxOqiA2TqqPKTqCV5LNVY
 RXmJ55pMkd6r2JaK5fetUD5bN/gh+s0aUhoYZ46BbPCSWhbDHDq1dYhiAisUltdMiWBx
 oo2Q==
X-Gm-Message-State: AOAM533cDnqGq+hayLGPbvf0q2paAn6YfyrKV4eIF/GjkOTAPvgSC0MJ
 DbSfkFGUKt92w1Ys41cVGpt7UlXhNjU0UWG9Kp7pV/eror1kTBw+cr+zFz27Wux2d1o6MRNRwb0
 xGa5RmCSr2JxPZBs8pg+q5StlxB/w+BtHRoJOppUm
X-Received: by 2002:a05:6402:50d4:b0:413:2a27:6b56 with SMTP id
 h20-20020a05640250d400b004132a276b56mr15602850edb.228.1645969951011; 
 Sun, 27 Feb 2022 05:52:31 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyMchrZ/z130i6cHNU0MCCxUHxTeH+44NX7i1itMtaADlHbWFNXu2qsfZhNkboTf+/7DLObYg==
X-Received: by 2002:a05:6402:50d4:b0:413:2a27:6b56 with SMTP id
 h20-20020a05640250d400b004132a276b56mr15602826edb.228.1645969950731; 
 Sun, 27 Feb 2022 05:52:30 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-181-108.adslplus.ch.
 [188.155.181.108]) by smtp.gmail.com with ESMTPSA id
 r22-20020a17090638d600b006d584aaa9c9sm3393333ejd.133.2022.02.27.05.52.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Feb 2022 05:52:30 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Stuart Yoder <stuyoder@gmail.com>,
 Laurentiu Tudor <laurentiu.tudor@nxp.com>, Abel Vesa <abel.vesa@nxp.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, "K. Y. Srinivasan" <kys@microsoft.com>,
 Haiyang Zhang <haiyangz@microsoft.com>,
 Stephen Hemminger <sthemmin@microsoft.com>, Wei Liu <wei.liu@kernel.org>,
 Dexuan Cui <decui@microsoft.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Vineeth Vijayan <vneethv@linux.ibm.com>,
 Peter Oberparleiter <oberpar@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, Andy Gross <agross@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Mark Brown <broonie@kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, NXP Linux Team <linux-imx@nxp.com>,
 linux-arm-kernel@lists.infradead.org, linux-hyperv@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-s390@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-spi@vger.kernel.org,
 virtualization@lists.linux-foundation.org,
 Linus Torvalds <torvalds@linux-foundation.org>
Subject: [PATCH v3 00/11] Fix broken usage of driver_override (and kfree of
 static memory)
Date: Sun, 27 Feb 2022 14:52:03 +0100
Message-Id: <20220227135214.145599-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 02 Mar 2022 09:33:34 +0100
Cc: Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
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

Krzysztof Kozlowski (11):
  driver: platform: Add helper for safer setting of driver_override
  amba: Use driver_set_override() instead of open-coding
  fsl-mc: Use driver_set_override() instead of open-coding
  hv: Use driver_set_override() instead of open-coding
  PCI: Use driver_set_override() instead of open-coding
  s390: cio: Use driver_set_override() instead of open-coding
  spi: Use helper for safer setting of driver_override
  vdpa: Use helper for safer setting of driver_override
  clk: imx: scu: Fix kfree() of static memory on setting driver_override
  slimbus: qcom-ngd: Fix kfree() of static memory on setting
    driver_override
  rpmsg: Fix kfree() of static memory on setting driver_override

 drivers/amba/bus.c              | 28 +++---------------
 drivers/base/driver.c           | 51 +++++++++++++++++++++++++++++++++
 drivers/base/platform.c         | 28 +++---------------
 drivers/bus/fsl-mc/fsl-mc-bus.c | 25 +++-------------
 drivers/clk/imx/clk-scu.c       |  7 ++++-
 drivers/hv/vmbus_drv.c          | 28 +++---------------
 drivers/pci/pci-sysfs.c         | 28 +++---------------
 drivers/rpmsg/rpmsg_core.c      |  3 +-
 drivers/rpmsg/rpmsg_internal.h  | 13 +++++++--
 drivers/rpmsg/rpmsg_ns.c        | 14 +++++++--
 drivers/s390/cio/cio.h          |  7 ++++-
 drivers/s390/cio/css.c          | 28 +++---------------
 drivers/slimbus/qcom-ngd-ctrl.c | 13 ++++++++-
 drivers/spi/spi.c               | 26 +++--------------
 drivers/vdpa/vdpa.c             | 29 +++----------------
 include/linux/amba/bus.h        |  7 ++++-
 include/linux/device/driver.h   |  2 ++
 include/linux/fsl/mc.h          |  6 ++--
 include/linux/hyperv.h          |  7 ++++-
 include/linux/pci.h             |  7 ++++-
 include/linux/platform_device.h |  7 ++++-
 include/linux/rpmsg.h           |  6 ++--
 include/linux/spi/spi.h         |  2 ++
 include/linux/vdpa.h            |  4 ++-
 24 files changed, 171 insertions(+), 205 deletions(-)

-- 
2.32.0

