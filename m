Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 25D8C4C45A2
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Feb 2022 14:14:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B08B51B0C;
	Fri, 25 Feb 2022 14:13:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B08B51B0C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645794852;
	bh=aAilajr8KQhcuQdz5PlpOpvx6d0adrdXSDRjc8J4J+w=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=QqLIP6gSCrVKD9IgHQcCZG0koxg/OylsXh01OO9/B4L033ldUR+uZ9864ZT6rlwF5
	 pXy3brMu+n7ZwxdHO8msGUR7UAGMWSlwE1EXsTJlKQtPeDmCJilCwkwxqpRXiJkyWz
	 n69Jo37aLxxfAZx/AjjRNaHOHWoxVmsvdpIXevx0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 09129F80536;
	Fri, 25 Feb 2022 14:11:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9CB18F80237; Wed, 23 Feb 2022 20:14:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from smtp-relay-internal-1.canonical.com
 (smtp-relay-internal-1.canonical.com [185.125.188.123])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 15CEBF8025D
 for <alsa-devel@alsa-project.org>; Wed, 23 Feb 2022 20:14:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 15CEBF8025D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com
 header.b="APrfaR2T"
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 4953F405F2
 for <alsa-devel@alsa-project.org>; Wed, 23 Feb 2022 19:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1645643642;
 bh=7G3yQO1ggdyvs1MDXGTTghLlHGfX3RftlATUX++IZLE=;
 h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
 b=APrfaR2T3Yv7ozsc6wPixVJh7k8BgK5D2eR3MdEeuJUXHS/3w64oIyym5P6lsmyRB
 Eyi+cHKfefmRd9OpmVXskdsOV77L4l1CPMQ4O+qt0A+iN/KKOH+YqhOC87Mk50xuXt
 VZCSnXGhaxTWH26GAr9NLWWZP5JRAGu1o/TbBqF7fw/ydRknkVW1+n1wsp1lTsgxQp
 mfOoFV27o7c13s1HGMjfFG8mewUNeXIT7d9eRyR4KgwEEtRmRMIJkOJMQZyOJ7Ht72
 dwYl3uZKr4cC7cVfvq8WyWtw00dBOxVcP9AOMNSteJnYjViHbhowYpQ6gdV50jP5kR
 7P0zRFogas5gg==
Received: by mail-ej1-f69.google.com with SMTP id
 13-20020a170906328d00b006982d0888a4so7427258ejw.9
 for <alsa-devel@alsa-project.org>; Wed, 23 Feb 2022 11:14:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7G3yQO1ggdyvs1MDXGTTghLlHGfX3RftlATUX++IZLE=;
 b=i1IQnrVZecOYBasMael9kbXRsXJ7cq8sAqzpH1DrmjmIoDG+bmK1VaBdBvs9a/rUfk
 +wktkgm8Dc5MPtl89Vg1jMr0Fhn734Ehk3dW2RaVTGHV//qDOfEVxnScv2afIl0I51Vv
 ZaXW5TgkdVGvyYbEW496uowQB4meWCsIa1BdlMYEA/BUlZpxkWb5zz5k0slZoqeWisgy
 l80ZI5TTmr0FisuWPgh0EcUT5XdoRzdNgspvO6jc/s9W7CdBw7pBDF6UK1LfF+VDJ/yY
 tRlszKqWYVCRro5rxDN6Wq1S6bPE8BLby7Kt3IHfa4V+Y4HtQMXfHyWmR9vFurAVL/7i
 eDDw==
X-Gm-Message-State: AOAM533p4KIt0x0dS6yibqMO5zdmvAxLhGlBjhxvPwfgto8Gbotv7qHC
 0NYJlHFoCb9kM2KM5h0RLzC9sSLLy3tutgGvALlj5IgzZUrvNLdthaqOthbnxVnr9NMxUpWhNm5
 +vY6CCxNs0eK8v5IPAYP/KDo60GjeEtOyEHxeDCKO
X-Received: by 2002:a17:907:3e1d:b0:6d1:cb2e:a5f7 with SMTP id
 hp29-20020a1709073e1d00b006d1cb2ea5f7mr912406ejc.34.1645643627831; 
 Wed, 23 Feb 2022 11:13:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzGBRIhr5hXOOi9m1HuHlbXHVVNJ7NbK5fFuNrM/4KQXFCcM1cXqPM7bQRPgfLpUUwT4AX8Nw==
X-Received: by 2002:a17:907:3e1d:b0:6d1:cb2e:a5f7 with SMTP id
 hp29-20020a1709073e1d00b006d1cb2ea5f7mr912389ejc.34.1645643627533; 
 Wed, 23 Feb 2022 11:13:47 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-181-108.adslplus.ch.
 [188.155.181.108])
 by smtp.gmail.com with ESMTPSA id q5sm212611ejc.115.2022.02.23.11.13.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Feb 2022 11:13:47 -0800 (PST)
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
Subject: [PATCH v2 00/11] Fix broken usage of driver_override (and kfree of
 static memory)
Date: Wed, 23 Feb 2022 20:12:59 +0100
Message-Id: <20220223191310.347669-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 25 Feb 2022 14:11:18 +0100
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

Changes of latest since v1 (not the old 2019 solution):
=======================================================
https://lore.kernel.org/all/708eabb1-7b35-d525-d4c3-451d4a3de84f@rasmusvillemoes.dk/
1. Add helper for setting driver_override.
2. Use the helper.

Dependencies (and stable):
==========================
1. All patches, including last three fixes, depend on first patch
   introducing the helper.
2. The last three commits - fixes - are probably not backportable
   directly, because of this dependency. I don't know how to express
   it here, since stable-kernel-rules.rst mentions only commits as
   possible dependencies.

[1] https://lore.kernel.org/all/1550484960-2392-3-git-send-email-krzk@kernel.org/

Best regards,
Krzysztof

Krzysztof Kozlowski (11):
  driver: platform: add and use helper for safer setting of
    driver_override
  amba: use helper for safer setting of driver_override
  fsl-mc: use helper for safer setting of driver_override
  hv: vmbus: use helper for safer setting of driver_override
  pci: use helper for safer setting of driver_override
  s390: cio: use helper for safer setting of driver_override
  spi: use helper for safer setting of driver_override
  vdpa: use helper for safer setting of driver_override
  clk: imx: scu: fix kfree() of static memory on setting driver_override
  slimbus: qcom-ngd: fix kfree() of static memory on setting
    driver_override
  rpmsg: fix kfree() of static memory on setting driver_override

 drivers/amba/bus.c              | 24 +++---------------
 drivers/base/driver.c           | 44 +++++++++++++++++++++++++++++++++
 drivers/base/platform.c         | 24 +++---------------
 drivers/bus/fsl-mc/fsl-mc-bus.c | 22 +++--------------
 drivers/clk/imx/clk-scu.c       |  7 +++++-
 drivers/hv/vmbus_drv.c          | 24 +++---------------
 drivers/pci/pci-sysfs.c         | 24 +++---------------
 drivers/rpmsg/rpmsg_internal.h  | 13 ++++++++--
 drivers/rpmsg/rpmsg_ns.c        | 14 +++++++++--
 drivers/s390/cio/css.c          | 24 +++---------------
 drivers/slimbus/qcom-ngd-ctrl.c | 12 ++++++++-
 drivers/spi/spi.c               | 20 +++------------
 drivers/vdpa/vdpa.c             | 25 +++----------------
 include/linux/device/driver.h   |  1 +
 include/linux/platform_device.h |  6 ++++-
 include/linux/spi/spi.h         |  2 +-
 16 files changed, 123 insertions(+), 163 deletions(-)

-- 
2.32.0

