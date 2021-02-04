Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 728B330F20C
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Feb 2021 12:26:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E1BFD1703;
	Thu,  4 Feb 2021 12:26:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E1BFD1703
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612438014;
	bh=St3uIVFJnZk2Zyzop2eRiUVk2L+A2VGw+mbjfgyLL90=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=RHlrttU9zk1ol8MZmvLCwu2TH3S8Sm8R2PZcuxljdD8kyqFPrX/3IchVbdkuNU2z7
	 QkJEeVonutVcv1UggDbCgMfHi0d1SmMWjhrFJo+i6CLcJC7T0Hi2t4cwZYpaNHjTR5
	 V+/cDXN5R2bAfSi/FjAHFnOOqNO2Ea2ENOSFIIww=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3682AF80154;
	Thu,  4 Feb 2021 12:25:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2A577F801F7; Thu,  4 Feb 2021 12:25:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3B0C8F80155
 for <alsa-devel@alsa-project.org>; Thu,  4 Feb 2021 12:25:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3B0C8F80155
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="Yt5pLFvS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612437913;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=O9zlWR0Ptd4cBCm9i9fSIyawVum/k/FT8xpGrME5Bgc=;
 b=Yt5pLFvSJWP6O2wOtZcX6SZu2yZ1d4G7VXXwJai/Fx++xwDGCLQPw5F4klPuQVWEQk/W2l
 04+ALKrnGl7kPyY7NeY5nt+L4DMXEb+4onq/iogIzuBwGpSBwEPSGi75FhiNzjq8mrbaEj
 KhTnJ+Dml9YCEB6BJaCd4fzobBWvIug=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-164-F2sYatScNCqx_MCzhUf3AA-1; Thu, 04 Feb 2021 06:25:09 -0500
X-MC-Unique: F2sYatScNCqx_MCzhUf3AA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B2E87107ACF5;
 Thu,  4 Feb 2021 11:25:07 +0000 (UTC)
Received: from x1.localdomain (ovpn-112-112.ams2.redhat.com [10.36.112.112])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 72ECD5B698;
 Thu,  4 Feb 2021 11:25:03 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Lee Jones <lee.jones@linaro.org>, MyungJoo Ham <myungjoo.ham@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Jie Yang <yang.jie@linux.intel.com>, Mark Brown <broonie@kernel.org>
Subject: [PATCH v4 resend 00/13] MFD/extcon/ASoC: Rework arizona codec
 jack-detect support
Date: Thu,  4 Feb 2021 12:24:49 +0100
Message-Id: <20210204112502.88362-1-hdegoede@redhat.com>
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

Hi all,

Here is v4 of my series to rework the arizona codec jack-detect support
to use the snd_soc_jack helpers instead of direct extcon reporting.

This is a resend with some extra *-by tags collected and with the extcon
folks added to the "To:" list, which I somehow missed with the original
v4 posting, sorry.

This is done by reworking the extcon driver into an arizona-jackdet
library and then modifying the codec drivers to use that directly,
replacing the old separate extcon child-devices and extcon-driver.

This brings the arizona-codec jack-detect handling inline with how
all other ASoC codec driver do this. This was developed and tested on
a Lenovo Yoga Tablet 1051L with a WM5102 codec.

This was also tested by Charles Keepax, one of the Cirrus Codec folks.

This depends on the previously posted "[PATCH v4 0/5] MFD/ASoC: Add
support for Intel Bay Trail boards with WM5102 codec" series and there
are various interdependencies between the patches in this series.

Lee Jones, the MFD maintainer has agreed to take this series upstream
through the MFD tree and to provide an immutable branch for the ASoC
and extcon subsystems to merge.

Mark and extcon-maintainers may we have your ack for merging these
through the MFD tree ?

Regards,

Hans


Hans de Goede (13):
  mfd: arizona: Drop arizona-extcon cells
  extcon: arizona: Fix some issues when HPDET IRQ fires after the jack
    has been unplugged
  extcon: arizona: Fix various races on driver unbind
  extcon: arizona: Fix flags parameter to the gpiod_get("wlf,micd-pol")
    call
  extcon: arizona: Always use pm_runtime_get_sync() when we need the
    device to be awake
  ASoC/extcon: arizona: Move arizona jack code to
    sound/soc/codecs/arizona-jack.c
  ASoC: arizona-jack: Move jack-detect variables to struct arizona_priv
  ASoC: arizona-jack: Use arizona->dev for runtime-pm
  ASoC: arizona-jack: convert into a helper library for codec drivers
  ASoC: arizona-jack: Use snd_soc_jack to report jack events
  ASoC: arizona-jack: Cleanup logging
  ASoC: arizona: Make the wm5102, wm5110, wm8997 and wm8998 drivers use
    the new jack library
  ASoC: Intel: bytcr_wm5102: Add jack detect support

 MAINTAINERS                                   |   3 +-
 drivers/extcon/Kconfig                        |   8 -
 drivers/extcon/Makefile                       |   1 -
 drivers/mfd/arizona-core.c                    |  20 -
 sound/soc/codecs/Makefile                     |   2 +-
 .../soc/codecs/arizona-jack.c                 | 577 +++++++-----------
 sound/soc/codecs/arizona.h                    |  44 ++
 sound/soc/codecs/wm5102.c                     |  12 +-
 sound/soc/codecs/wm5110.c                     |  12 +-
 sound/soc/codecs/wm8997.c                     |  14 +-
 sound/soc/codecs/wm8998.c                     |   9 +
 sound/soc/intel/boards/bytcr_wm5102.c         |  28 +-
 12 files changed, 325 insertions(+), 405 deletions(-)
 rename drivers/extcon/extcon-arizona.c => sound/soc/codecs/arizona-jack.c (76%)

-- 
2.29.2

