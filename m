Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E47AF8042C3
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Dec 2023 00:46:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4E85C82B;
	Tue,  5 Dec 2023 00:46:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4E85C82B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701733609;
	bh=1zBsJDDD9Gkb4I2RaTNgsJpic8iI6hTl0hGIwsd2WEs=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=AloTpVM3vh2P+4LVKwm0SVDY7Q+wJgTFw4thfKeIIvj4VFbbS5Glxwo9b9A+c7Fkp
	 pP0mGkphW/KUAHoFUvhlb+LtJwZrL/yuPUsirEPmrmVMY5VxeV8KJZTXZ+ZJCdhOSl
	 dxfCZaw8UpimbDNkIOFhnXFQrqflPeg1gllyog4A=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 15373F80578; Tue,  5 Dec 2023 00:46:28 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7CF54F802BE;
	Tue,  5 Dec 2023 00:46:27 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3C457F8025F; Tue,  5 Dec 2023 00:46:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from irl.hu (irl.hu [95.85.9.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with UTF8SMTPS id D6AF8F800AC
	for <alsa-devel@alsa-project.org>; Tue,  5 Dec 2023 00:46:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D6AF8F800AC
Received: from fedori.lan (51b68398.dsl.pool.telekom.hu
 [::ffff:81.182.131.152])
  (AUTH: CRAM-MD5 soyer@irl.hu, )
  by irl.hu with ESMTPSA
  id 000000000006FC81.00000000656E64C3.00114EBB;
 Tue, 05 Dec 2023 00:46:11 +0100
From: Gergo Koteles <soyer@irl.hu>
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
  Baojun Xu <baojun.xu@ti.com>, Jaroslav Kysela <perex@perex.cz>,
  Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
  Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
  Gergo Koteles <soyer@irl.hu>
Subject: [PATCH 0/2] ALSA: hda/tas2563: Add tas253 HDA driver
Date: Tue,  5 Dec 2023 00:45:36 +0100
Message-ID: <cover.1701733441.git.soyer@irl.hu>
X-Mailer: git-send-email 2.43.0
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mime-Autoconverted: from 8bit to 7bit by courier 1.0
Message-ID-Hash: XLBCXU3RSOAZ7VRJCX6IM2XWKNESQPEN
X-Message-ID-Hash: XLBCXU3RSOAZ7VRJCX6IM2XWKNESQPEN
X-MailFrom: soyer@irl.hu
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XLBCXU3RSOAZ7VRJCX6IM2XWKNESQPEN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The ta2563 is a smart amplifier. Similar to tas2562 but with DSP. Some 
Lenovo laptops have it to drive the bass speakers. By default, it is in 
software shutdown state.

To make the DSP work it needs a firmware and some calibration data.
The latter can be read from the EFI in Lenovo laptops.

For the correct configuration it needs additional register data.
It captured after running the Windows driver.

The firmware can be extracted as TAS2563Firmware.bin from the Windows 
driver with innoextract.
https://download.lenovo.com/consumer/mobiles/h5yd037fbfyy7kd0.exe

The driver will search for it as TAS2563-17AA3870.bin with the 14ARB7.

It uses the default program/configuration, and has no controls for these yet.

The amplifier works without firmware, but I don't know how safe is it, 
that's why the firmware is required.

Gergo Koteles (2):
  ASoc: tas2563: DSP Firmware loading support
  ALSA: hda/tas2563: Add tas2563 HDA driver

 {sound/soc/codecs => include/sound}/tas2562.h |   8 +
 include/sound/tas25xx-dsp.h                   | 100 ++++
 sound/pci/hda/Kconfig                         |  14 +
 sound/pci/hda/Makefile                        |   2 +
 sound/pci/hda/patch_realtek.c                 |  22 +-
 sound/pci/hda/tas2563_hda_i2c.c               | 508 ++++++++++++++++++
 sound/soc/codecs/Kconfig                      |   7 +
 sound/soc/codecs/Makefile                     |   2 +
 sound/soc/codecs/tas2562.c                    |   2 +-
 sound/soc/codecs/tas25xx-dsp.c                | 282 ++++++++++
 10 files changed, 942 insertions(+), 5 deletions(-)
 rename {sound/soc/codecs => include/sound}/tas2562.h (90%)
 create mode 100644 include/sound/tas25xx-dsp.h
 create mode 100644 sound/pci/hda/tas2563_hda_i2c.c
 create mode 100644 sound/soc/codecs/tas25xx-dsp.c


base-commit: ffc253263a1375a65fa6c9f62a893e9767fbebfa
-- 
2.43.0

