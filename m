Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F092301503
	for <lists+alsa-devel@lfdr.de>; Sat, 23 Jan 2021 13:15:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 18E811AFD;
	Sat, 23 Jan 2021 13:14:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 18E811AFD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611404103;
	bh=tUDbeXtThwNiFA0rLk0dJrbVcEX4V6Ji+9maG3bxHPY=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=uH9tBRFw9Puy0H5IQ6myzo78ZWxxptW9qdix8LFP0xWoLlDp84z7NoGqzTltM27RO
	 0V0oQFSS+tdvARxs+XxUzhha5nosK40Af8CTd9hjMajy85zLUHY7mq7W1f55oI7jir
	 33OxXzu63cZXvFoulXBm7eppV1b2+Uob0MRktiDc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 87705F80083;
	Sat, 23 Jan 2021 13:13:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 152A0F8026A; Sat, 23 Jan 2021 13:13:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 47710F800FD
 for <alsa-devel@alsa-project.org>; Sat, 23 Jan 2021 13:13:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 47710F800FD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="EecCoCu2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611404003;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=TRc/8JKIHdnuwsBLWS8g2lgeISsIEsmWPeDCN5UFdfc=;
 b=EecCoCu2vNfjsYB5xoTuQderNMe4opI5qbEE4ynjNSJ4julD9UmUqCxvQrFESDZu5o/gZs
 ULudOXrXBC1yylBmvv+nBW8uoahQFajkfrYVIyM3wX9SBp5QHJq3aI7l5Ysmhz6Bf6y8at
 Gp38gl3cUlze3+MMFWvoR24JyPrgKqg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-604-Yb3tGP5POMWUu3VuNBGi-w-1; Sat, 23 Jan 2021 07:13:18 -0500
X-MC-Unique: Yb3tGP5POMWUu3VuNBGi-w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 037DF8018A1;
 Sat, 23 Jan 2021 12:13:17 +0000 (UTC)
Received: from x1.localdomain (ovpn-112-82.ams2.redhat.com [10.36.112.82])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2AB0139A4E;
 Sat, 23 Jan 2021 12:13:13 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Lee Jones <lee.jones@linaro.org>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Jie Yang <yang.jie@linux.intel.com>, Mark Brown <broonie@kernel.org>
Subject: [PATCH v4 00/13] MFD/extcon/ASoC: Rework arizona codec jack-detect
 support
Date: Sat, 23 Jan 2021 13:13:00 +0100
Message-Id: <20210123121313.79530-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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

This is done by reworking the extcon driver into an arizona-jackdet
library and then modifying the codec drivers to use that directly,
replacing the old separate extcon child-devices and extcon-driver.

This brings the arizona-codec jack-detect handling inline with how
all other ASoC codec driver do this. This was developed and tested on
a Lenovo Yoga Tablet 1051L with a WM5102 codec.

There are various interdependencies between the patches in this
series, so IMHO it would be best if this entire series would be merged
through the MFD tree.

Note this series applies on top of my "[PATCH v4 0/5] MFD/ASoC: Add
support for Intel Bay Trail boards with WM5102 codec" series.

Changes in v4:
- Add sound/soc/codecs/arizona-jack.c to the WOLFSON MICROELECTRONICS DRIVERS
  MAINTAINERS section
- Small codying style tweaks to the "ASoC: arizona-jack: Cleanup logging" patch

Changes in v3:
- Move the bugfix patches to earlier in the series so that they
  apply to drivers/extcon/extcon-arizona.c so that they can be
  cherry-picked into the stable series
- Split runtime_pm_get -> runtime_pm_get_sync changes out into their
  own patch
- Simply move drivers/extcon/extcon-arizona.c to
  sound/soc/codecs/arizona-jack.c instead of first adding arizona-jack.c
  as a copy and then later removing extcon-arizona.c
- Some other small tweaks, see individual patch changelogs

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

