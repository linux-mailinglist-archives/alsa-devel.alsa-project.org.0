Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9425F7ED41
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Aug 2019 09:17:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2D23316CB;
	Fri,  2 Aug 2019 09:16:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2D23316CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564730220;
	bh=YPmL6SdkKZiZNCdtkkJlCjqsZE9OOu3DVs4BDlM8Pg0=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ENQWuYTgSY01H5IwH1pm7iQJsrVvmAyNq8LnNje3T972Nju2jiyOiEeXY6lFjw3W8
	 gTbzsZ9oFtmm1gGuH1w+2giAcd52MsgROvpEZ2XgPcyQAqUX36Y6V71VvIQ9D5C1+Q
	 7dD6anbeKVK7HWLZzN+Z0idQB+550unmB98ToBko=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 04672F80BF3;
	Fri,  2 Aug 2019 08:53:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 091BEF8048E; Wed, 31 Jul 2019 22:09:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3AF66F80133
 for <alsa-devel@alsa-project.org>; Wed, 31 Jul 2019 22:09:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3AF66F80133
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.b="PIUUBnBy"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rn3NfiDEXL+oS6VUOY4mnQO1Et+scTwEHQCpCkBADwE=; b=PIUUBnByQyRMkMGC65MPAbH3v
 bMlAvUmVeuHt9/joMWoQz0I2rMP2LxUacVIVYNPvlFnKF1xaPRAEMuLb/E5C2nzCdb3Rm77OtWPKp
 iCfxZE0OZPA+rLw4ckvP7fYxFk9CdgslaN/TEmJNQKtm0T4+Z/8q7p42cP3GUi//2c7yNXqXJFYNT
 Zqn84uOVfZtk5DnzRYsS8OcjdOCjQ7NSyRKDsTgE9Yv5MUJuU+I3flClQ3gwLdBhCQvwec6sUkDbz
 9LoOXiw2jlR5pTDbwBFdOMiAu4XecH5BAKWEjUVe5Tzz832jRG+dgxixJ5m9vBWnnVp15U9Fq9s+1
 XKgn45ysw==;
Received: from [191.33.152.89] (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hsuu9-0007qH-8b; Wed, 31 Jul 2019 20:08:57 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92)
 (envelope-from <mchehab@bombadil.infradead.org>)
 id 1hsuu6-00079d-61; Wed, 31 Jul 2019 17:08:54 -0300
From: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Jonathan Corbet <corbet@lwn.net>
Date: Wed, 31 Jul 2019 17:08:47 -0300
Message-Id: <cover.1564603513.git.mchehab+samsung@kernel.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 02 Aug 2019 08:52:07 +0200
Cc: Mark Rutland <mark.rutland@arm.com>, Dave Kleikamp <shaggy@kernel.org>,
 alsa-devel@alsa-project.org, Maxime Ripard <maxime.ripard@bootlin.com>,
 jfs-discussion@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Evgeniy Polyakov <zbr@ioremap.net>, linux-cifs@vger.kernel.org,
 Lars-Peter Clausen <lars@metafoo.de>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Chen-Yu Tsai <wens@csie.org>, devicetree@vger.kernel.org,
 Evgeniy Dushistov <dushistov@mail.ru>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mauro Carvalho Chehab <mchehab@infradead.org>, Mark Brown <broonie@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Mathieu Poirier <mathieu.poirier@linaro.org>, samba-technical@lists.samba.org,
 Liam Girdwood <lgirdwood@gmail.com>, linux-iio@vger.kernel.org,
 linux-spi@vger.kernel.org, Steve French <sfrench@samba.org>,
 Rob Herring <robh+dt@kernel.org>, Hartmut Knaack <knaack.h@gmx.de>,
 Jonathan Cameron <jic23@kernel.org>
Subject: [alsa-devel] [PATCH 0/6] ReST conversion patches not applied yet
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi Jon,

As promised, this is the rebased version of the patches that were not applied
from the /26 patch series because you had merge conflicts.

They're all based on your docs-next branch, so should apply fine.

The first one fixes all but one error with a broken reference.

The only broken reference right now is due to a DT patch with was not
accepted (no idea why), but whose driver is upstream.


Mauro Carvalho Chehab (6):
  docs: fix a couple of new broken references
  docs: writing-schema.md: convert from markdown to ReST
  spi: docs: convert to ReST and add it to the kABI bookset
  docs: fs: cifs: convert to ReST and add to admin-guide book
  docs: fs: convert porting to ReST
  docs: w1: convert to ReST and add to the kAPI group of docs

 Documentation/ABI/stable/sysfs-bus-w1         |   2 +-
 .../ABI/stable/sysfs-driver-w1_ds28e04        |   4 +-
 .../ABI/stable/sysfs-driver-w1_ds28ea00       |   2 +-
 .../AUTHORS => admin-guide/cifs/authors.rst}  |  64 +-
 .../CHANGES => admin-guide/cifs/changes.rst}  |   4 +
 Documentation/admin-guide/cifs/index.rst      |  21 +
 .../cifs/introduction.rst}                    |   8 +
 .../cifs/TODO => admin-guide/cifs/todo.rst}   |  87 +--
 .../README => admin-guide/cifs/usage.rst}     | 560 +++++++++++-------
 .../cifs/winucase_convert.pl                  |   0
 Documentation/admin-guide/index.rst           |   1 +
 .../bindings/sound/sun8i-a33-codec.txt        |   2 +-
 Documentation/devicetree/writing-schema.md    | 130 ----
 Documentation/devicetree/writing-schema.rst   | 153 +++++
 Documentation/filesystems/porting.rst         |   2 +-
 Documentation/index.rst                       |   2 +
 .../spi/{butterfly => butterfly.rst}          |  44 +-
 Documentation/spi/index.rst                   |  22 +
 Documentation/spi/{pxa2xx => pxa2xx.rst}      |  95 +--
 .../spi/{spi-lm70llp => spi-lm70llp.rst}      |  17 +-
 .../spi/{spi-sc18is602 => spi-sc18is602.rst}  |   3 +
 .../spi/{spi-summary => spi-summary.rst}      | 105 ++--
 Documentation/spi/{spidev => spidev.rst}      |  30 +-
 Documentation/w1/index.rst                    |  21 +
 .../w1/masters/{ds2482 => ds2482.rst}         |  16 +-
 .../w1/masters/{ds2490 => ds2490.rst}         |   6 +-
 Documentation/w1/masters/index.rst            |  14 +
 Documentation/w1/masters/mxc-w1               |  12 -
 Documentation/w1/masters/mxc-w1.rst           |  17 +
 .../w1/masters/{omap-hdq => omap-hdq.rst}     |  12 +-
 .../w1/masters/{w1-gpio => w1-gpio.rst}       |  21 +-
 Documentation/w1/slaves/index.rst             |  16 +
 .../w1/slaves/{w1_ds2406 => w1_ds2406.rst}    |   4 +-
 .../w1/slaves/{w1_ds2413 => w1_ds2413.rst}    |   9 +
 Documentation/w1/slaves/w1_ds2423             |  47 --
 Documentation/w1/slaves/w1_ds2423.rst         |  54 ++
 .../w1/slaves/{w1_ds2438 => w1_ds2438.rst}    |  10 +-
 .../w1/slaves/{w1_ds28e04 => w1_ds28e04.rst}  |   5 +
 .../w1/slaves/{w1_ds28e17 => w1_ds28e17.rst}  |  16 +-
 .../w1/slaves/{w1_therm => w1_therm.rst}      |  11 +-
 .../w1/{w1.generic => w1-generic.rst}         |  88 +--
 .../w1/{w1.netlink => w1-netlink.rst}         |  89 +--
 MAINTAINERS                                   |   6 +-
 drivers/hwtracing/coresight/Kconfig           |   2 +-
 drivers/iio/dummy/iio_simple_dummy.c          |   2 +-
 drivers/spi/Kconfig                           |   2 +-
 drivers/spi/spi-butterfly.c                   |   2 +-
 drivers/spi/spi-lm70llp.c                     |   2 +-
 fs/jfs/Kconfig                                |   2 +-
 fs/ufs/Kconfig                                |   2 +-
 include/linux/platform_data/sc18is602.h       |   2 +-
 51 files changed, 1126 insertions(+), 722 deletions(-)
 rename Documentation/{filesystems/cifs/AUTHORS => admin-guide/cifs/authors.rst} (60%)
 rename Documentation/{filesystems/cifs/CHANGES => admin-guide/cifs/changes.rst} (91%)
 create mode 100644 Documentation/admin-guide/cifs/index.rst
 rename Documentation/{filesystems/cifs/cifs.txt => admin-guide/cifs/introduction.rst} (98%)
 rename Documentation/{filesystems/cifs/TODO => admin-guide/cifs/todo.rst} (58%)
 rename Documentation/{filesystems/cifs/README => admin-guide/cifs/usage.rst} (72%)
 rename Documentation/{filesystems => admin-guide}/cifs/winucase_convert.pl (100%)
 delete mode 100644 Documentation/devicetree/writing-schema.md
 create mode 100644 Documentation/devicetree/writing-schema.rst
 rename Documentation/spi/{butterfly => butterfly.rst} (71%)
 create mode 100644 Documentation/spi/index.rst
 rename Documentation/spi/{pxa2xx => pxa2xx.rst} (83%)
 rename Documentation/spi/{spi-lm70llp => spi-lm70llp.rst} (88%)
 rename Documentation/spi/{spi-sc18is602 => spi-sc18is602.rst} (97%)
 rename Documentation/spi/{spi-summary => spi-summary.rst} (93%)
 rename Documentation/spi/{spidev => spidev.rst} (90%)
 create mode 100644 Documentation/w1/index.rst
 rename Documentation/w1/masters/{ds2482 => ds2482.rst} (71%)
 rename Documentation/w1/masters/{ds2490 => ds2490.rst} (98%)
 create mode 100644 Documentation/w1/masters/index.rst
 delete mode 100644 Documentation/w1/masters/mxc-w1
 create mode 100644 Documentation/w1/masters/mxc-w1.rst
 rename Documentation/w1/masters/{omap-hdq => omap-hdq.rst} (90%)
 rename Documentation/w1/masters/{w1-gpio => w1-gpio.rst} (75%)
 create mode 100644 Documentation/w1/slaves/index.rst
 rename Documentation/w1/slaves/{w1_ds2406 => w1_ds2406.rst} (96%)
 rename Documentation/w1/slaves/{w1_ds2413 => w1_ds2413.rst} (81%)
 delete mode 100644 Documentation/w1/slaves/w1_ds2423
 create mode 100644 Documentation/w1/slaves/w1_ds2423.rst
 rename Documentation/w1/slaves/{w1_ds2438 => w1_ds2438.rst} (93%)
 rename Documentation/w1/slaves/{w1_ds28e04 => w1_ds28e04.rst} (93%)
 rename Documentation/w1/slaves/{w1_ds28e17 => w1_ds28e17.rst} (88%)
 rename Documentation/w1/slaves/{w1_therm => w1_therm.rst} (95%)
 rename Documentation/w1/{w1.generic => w1-generic.rst} (59%)
 rename Documentation/w1/{w1.netlink => w1-netlink.rst} (77%)

-- 
2.21.0


_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
