Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 55DCE2FDC16
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Jan 2021 22:51:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E818C1806;
	Wed, 20 Jan 2021 22:50:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E818C1806
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611179506;
	bh=JJ272Mz2xUU2jYCTsfwKS/0/h7H/269gHec1LuT1ArQ=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=OQ0UwXEx3gtlkazqGy/aR0MMVqTcruhfXaUMSDihKJU8m0paW28CkSFNiZ9gLrKEU
	 Mu++zwr0yyOvq2RpPSa41PfMoKikBQqwO8n33Gs075qGyW+gUeaIcsuX3dmT0awB1s
	 5smmukbVhkfo0ztp2CKsSz0nABgjj6rz5chJeRaY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BFD2BF80227;
	Wed, 20 Jan 2021 22:50:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E5E16F80137; Wed, 20 Jan 2021 22:50:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4850CF80137
 for <alsa-devel@alsa-project.org>; Wed, 20 Jan 2021 22:50:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4850CF80137
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="UXTQ1CQb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611179406;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=q5Tk07cOyzSuWC8UtiKXVVn3bXHByT7HLLQP4dV6lj4=;
 b=UXTQ1CQbqGnep17tlrEENcz8RFB3xoH/KqrUl54RF9qZg4K+D5AVyxtLVwMxvLzZhU2oIH
 jbuKmlLJE6URRlkAnxQDSLo0miI07WzYB+xu3W7njNyNtMx2lRZxUANYYIjxSw2J1tBDO8
 i+tB3vmkaAPzmEHi5JxbSAR+cFyf3r0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-458-Y9rzyxF8MWeuZg_DsNGdJw-1; Wed, 20 Jan 2021 16:50:02 -0500
X-MC-Unique: Y9rzyxF8MWeuZg_DsNGdJw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 22A5015725;
 Wed, 20 Jan 2021 21:50:01 +0000 (UTC)
Received: from x1.localdomain (ovpn-114-1.ams2.redhat.com [10.36.114.1])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 610CE61F38;
 Wed, 20 Jan 2021 21:49:58 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Lee Jones <lee.jones@linaro.org>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Jie Yang <yang.jie@linux.intel.com>, Mark Brown <broonie@kernel.org>
Subject: [PATCH v4 0/5] MFD/ASoC: Add support for Intel Bay Trail boards with
 WM5102 codec
Date: Wed, 20 Jan 2021 22:49:52 +0100
Message-Id: <20210120214957.140232-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Cc: alsa-devel@alsa-project.org, Charles Keepax <ckeepax@opensource.cirrus.com>,
 patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
 Hans de Goede <hdegoede@redhat.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>
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

Hi All,

Here is v4 of my series to add support for Intel Bay Trail based devices
which use a WM5102 codec for audio output/input.

This was developed and tested on a Lenovo Yoga Tablet 1051L.

The MFD and ASoC parts do not have any build-time dependencies
on each other. But the follow-up jack-detect series does have
patches depending on each-other and on this series. So IMHO it
would be best if this entire series would be merged through the
MFD tree to make merging the follow-up series easier.

Mark, if that is ok with you (and you are happy with the ASoC
changes) can you please Ack this ?

Changes in v4:
- Add a comment to the irq-flags override explaining that theoretically
  DSDTs using IRQF_TRIGGER_FALLING could be correct on boards where the
  IRQ controller does not support active low level interrupts

Changes in v3:
- Fix compilation error when CONFIG_ACPI is not set

Changes in v2:
- Split my WM5102 work into 2 series, one series adding basic support
  for Bay Trail boards with a WM5102 codec and a second series with
  the jack-detect work
- Various other minor code tweaks

Hans de Goede (4):
  mfd: arizona: Add MODULE_SOFTDEP("pre: arizona_ldo1")
  mfd: arizona: Replace arizona_of_get_type() with
    device_get_match_data()
  mfd: arizona: Add support for ACPI enumeration of WM5102 connected
    over SPI
  ASoC: Intel: Add DMI quirk table to soc_intel_is_byt_cr()

Pierre-Louis Bossart (1):
  ASoC: Intel: bytcr_wm5102: Add machine driver for BYT/WM5102

 drivers/mfd/arizona-core.c                    |  11 -
 drivers/mfd/arizona-i2c.c                     |  11 +-
 drivers/mfd/arizona-spi.c                     | 138 +++++-
 drivers/mfd/arizona.h                         |   9 -
 sound/soc/intel/boards/Kconfig                |  12 +
 sound/soc/intel/boards/Makefile               |   2 +
 sound/soc/intel/boards/bytcr_wm5102.c         | 465 ++++++++++++++++++
 .../intel/common/soc-acpi-intel-byt-match.c   |  16 +
 sound/soc/intel/common/soc-intel-quirks.h     |  25 +
 9 files changed, 661 insertions(+), 28 deletions(-)
 create mode 100644 sound/soc/intel/boards/bytcr_wm5102.c

Regards,

Hans

