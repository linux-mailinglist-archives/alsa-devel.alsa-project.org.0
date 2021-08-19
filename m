Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C9DA93F205A
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Aug 2021 21:07:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 53F391682;
	Thu, 19 Aug 2021 21:06:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 53F391682
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629400038;
	bh=D5m3uRDzHgxxpHX4TgIfeKuOO9R71dWNkZPiZVSaehI=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=BkSg6QWcHaM4ZXbLXYmeKPxPnc2rhWBs5sziUAIFGK8rv6QZS7RCJEQ7DjzRz6Zx5
	 p2hT+6W4p2seJAUnryKh8N9klBN0itU/t9Gp2H8KsCbunHrYegoyoML9OfaHvpvmrR
	 TTgzW4bAos9OIF3/2k0sJYejYnEjEzzqqWhpd0pA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A0146F8026D;
	Thu, 19 Aug 2021 21:06:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1BC4EF80272; Thu, 19 Aug 2021 21:05:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6EBD9F800EC
 for <alsa-devel@alsa-project.org>; Thu, 19 Aug 2021 21:05:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6EBD9F800EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="S4WMrp1O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629399950;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=JRp+GRYjdvQm40AfGyUZxP70WcUKnCmS/X2SPZDGQm0=;
 b=S4WMrp1OBdPSkcrVU8jX8FNsXqg5ZOrU30Pt5uih+hLaHoGnp781oKI5Xupw0JixaB6PMd
 AOQT4zksRfrkJJ2KjRxKYasMhsTC7Gp3+SgLItMFBkqaaE2JherUaWC8CkS6k2PHfEuCH2
 93ShCmUvp2dJsnux8W4Z54eG4mIgfHM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-532-k2gPbnknM_mTHKbLT5392w-1; Thu, 19 Aug 2021 15:05:49 -0400
X-MC-Unique: k2gPbnknM_mTHKbLT5392w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6A558801B3C;
 Thu, 19 Aug 2021 19:05:47 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.192.43])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B0CAE1971B;
 Thu, 19 Aug 2021 19:05:44 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Jie Yang <yang.jie@linux.intel.com>, Mark Brown <broonie@kernel.org>
Subject: [PATCH v2 0/6] ASoC: Intel/rt5640: Add support for HP Elite Pad
 1000G2 jack-detect
Date: Thu, 19 Aug 2021 21:05:37 +0200
Message-Id: <20210819190543.784415-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Cc: Hans de Goede <hdegoede@redhat.com>, alsa-devel@alsa-project.org,
 Bard Liao <bard.liao@intel.com>
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

Changes in v2:
- Rebase on asoc/for-next
- New patch: "ASoC: Intel: bytct_rt5640: Add a separate "Headset Mic 2"
  DAPM pin for the mic on the 2nd jack"
- Addressed Pierre-Louis' comments about calling
  acpi_dev_add_driver_gpios() twice

Original cover-letter:

The HP Elitepad 1000 G2 tablet has 2 headset jacks:

1. on the dock which uses the output of the codecs built-in HP-amp +
the standard IN2 input which is always used with the headset-jack.

2. on the tablet itself, this uses the line-out of the codec + an external
HP-amp, which gets enabled by the ALC5642 codec's GPIO1 pin; and IN1 for
the headset-mic.

The codec's GPIO1 is also its only IRQ output pin, so this means that
the codec's IRQ cannot be used on this tablet. Instead the jack-detect
is connected directly to GPIOs on the main SoC. The dock has a helper
chip which also detects if a headset-mic is present or not, so there
are 2 GPIOs for the jack-detect status of the dock. The tablet jack
uses a single GPIO which indicates if a jack is present or not.

Differentiating between between headphones vs a headset on the tablet jack
is done by using the usual mic-bias over-current-detection mechanism.

Regards,

Hans


Hans de Goede (6):
  ASoC: rt5640: Move rt5640_disable_jack_detect() up in the rt5640.c
    file
  ASoC: rt5640: Delay requesting IRQ until the machine-drv calls
    set_jack
  ASoC: rt5640: Add optional hp_det_gpio parameter to
    rt5640_detect_headset()
  ASoC: rt5640: Add rt5640_set_ovcd_params() helper
  ASoC: Intel: bytct_rt5640: Add a separate "Headset Mic 2" DAPM pin for
    the mic on the 2nd jack
  ASoC: Intel: bytcr_rt5640: Add support for HP Elite Pad 1000G2
    jack-detect

 sound/soc/codecs/rt5640.c             | 136 ++++++++++++----------
 sound/soc/codecs/rt5640.h             |   6 +
 sound/soc/intel/boards/bytcr_rt5640.c | 158 +++++++++++++++++++++++++-
 3 files changed, 234 insertions(+), 66 deletions(-)

-- 
2.31.1

