Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 68D2B807CB0
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Dec 2023 01:02:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9896A82A;
	Thu,  7 Dec 2023 01:02:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9896A82A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701907347;
	bh=3gXlQSMa2t6u9qx0R6mBXzPLkS6++7n7m26sDH+W4Os=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=ZTMu8Ax76f2IvT7mFv3XR1YnqYvbps1IIF5qosinh8OEV3ulF35rBwpMTsO2rnGJg
	 IPlRWOculhIYoBFxXOJLAa3r3Kf/phsmYIHD74yvudfXx9uOHKceee9PH5sQJ7JIVU
	 xQ3eGULr4j+e9W1gRzd+IXHxfMDEk/Jbat99oL1w=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 53708F8061E; Thu,  7 Dec 2023 01:01:01 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D528FF80641;
	Thu,  7 Dec 2023 01:00:58 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A9C7FF805A1; Thu,  7 Dec 2023 01:00:37 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with UTF8SMTPS id 485A0F80557
	for <alsa-devel@alsa-project.org>; Thu,  7 Dec 2023 01:00:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 485A0F80557
Received: from fedori.lan (51b690cd.dsl.pool.telekom.hu
 [::ffff:81.182.144.205])
  (AUTH: CRAM-MD5 soyer@irl.hu, )
  by irl.hu with ESMTPSA
  id 00000000000716BB.0000000065710B01.00118FFE;
 Thu, 07 Dec 2023 01:00:01 +0100
From: Gergo Koteles <soyer@irl.hu>
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
  Baojun Xu <baojun.xu@ti.com>, Jaroslav Kysela <perex@perex.cz>,
  Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
  Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
  Gergo Koteles <soyer@irl.hu>
Subject: [PATCH 00/16] ALSA: hda/tas2781: Add tas2563 support
Date: Thu,  7 Dec 2023 00:59:41 +0100
Message-ID: <cover.1701903015.git.soyer@irl.hu>
X-Mailer: git-send-email 2.43.0
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mime-Autoconverted: from 8bit to 7bit by courier 1.0
Message-ID-Hash: 62I3U3QI2GXIBLEDH5WOGLWKJE3IUBPD
X-Message-ID-Hash: 62I3U3QI2GXIBLEDH5WOGLWKJE3IUBPD
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/62I3U3QI2GXIBLEDH5WOGLWKJE3IUBPD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The tas2781-hda driver can be modified to support tas2563 as well.
Before knowing this information, I created another series for a
new driver.
https://lore.kernel.org/lkml/cover.1701733441.git.soyer@irl.hu/

This series now extends tas2781-hda, addresses differences and
fixes various bugs.

The tas2563 is a smart amplifier. Similar to tas2562 but with DSP. Some
Lenovo laptops have it to drive the bass speakers. By default, it is in
software shutdown state.

To make the DSP work it needs a firmware and some calibration data.
The latter can be read from the EFI in Lenovo laptops.

For the correct configuration it needs additional register data.
It captured after running the Windows driver.

The firmware can be extracted as TAS2563Firmware.bin from the Windows
driver with innoextract.
https://download.lenovo.com/consumer/mobiles/h5yd037fbfyy7kd0.exe

The driver will search for it as TAS2XXX3870.bin with the 14ARB7.
The captured registers extracted with TI's regtool:
https://github.com/soyersoyer/tas2563rca/raw/main/INT8866RCA2.bin


Gergo Koteles (16):
  ASoC: tas2781: add support for fw version 0x0503
  ALSA: hda/tas2781: leave hda_component in usable state
  ASoC: tas2781: disable regmap regcache
  ALSA: hda/tas2781: handle missing calibration data
  ALSA: hda/tas2781: fix typos in comment
  ASoC: tas2781: add ptrs to calibration functions
  ALSA: hda/tas2781: load_calibration just load
  ASoC: tas2781: add configurable global_addr
  ALSA: hda/tas2781: add TAS2563 support for 14ARB7
  ASoC: tas2781: check negative indexes
  ASoC: tas2781: use 0 as default prog/conf index
  ASoC: tas2781: move set_drv_data outside tasdevice_init
  ALSA: hda/tas2781: remove sound controls in unbind
  ALSA: hda/tas2781: call cleaner functions only once
  ALSA: hda/tas2781: reset the amp before component_add
  ALSA: hda/tas2781: configure the amp after firmware load

 include/sound/tas2781.h           |   8 +
 sound/pci/hda/tas2781_hda_i2c.c   | 364 +++++++++++++++++++-----------
 sound/soc/codecs/tas2781-comlib.c |  23 +-
 sound/soc/codecs/tas2781-fmwlib.c |  11 +-
 sound/soc/codecs/tas2781-i2c.c    |   2 +
 5 files changed, 270 insertions(+), 138 deletions(-)


base-commit: ffc253263a1375a65fa6c9f62a893e9767fbebfa
-- 
2.43.0

