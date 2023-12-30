Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CDEF8221B1
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Jan 2024 20:03:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A9963E99;
	Tue,  2 Jan 2024 20:03:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A9963E99
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1704222212;
	bh=8Ravzv9YjJ24x/D4R+FvGvMLYujnkbJinbqh1xS4Yls=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=pFkXUljuGNnbEYhuDmfXhz/PUu7fXv+yvmzG6rgsNlamQhNWm1qmn2VK69ZuFxrj1
	 b/+PluYix7pL8k2j9qj2aq1/jl2+YVHHBk6dgwJd8j4JZymKtYgRN3Z+1l6KhL77ON
	 Oxd06QGTjgs5CtDkAY13MOf6k6nK0298NhhqL+tQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B2DA4F805D8; Tue,  2 Jan 2024 20:02:51 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 91A1AF805C6;
	Tue,  2 Jan 2024 20:02:50 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4A5F4F8065A; Tue,  2 Jan 2024 19:59:32 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with UTF8SMTPS id 0C77BF8067B
	for <alsa-devel@alsa-project.org>; Tue,  2 Jan 2024 19:54:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0C77BF8067B
Received: from fedori.lan (51b6838a.dsl.pool.telekom.hu
 [::ffff:81.182.131.138])
  (AUTH: CRAM-MD5 soyer@irl.hu, )
  by irl.hu with ESMTPSA
  id 0000000000071EB8.00000000658F5FCE.0014D494;
 Sat, 30 Dec 2023 01:09:50 +0100
From: Gergo Koteles <soyer@irl.hu>
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
  Baojun Xu <baojun.xu@ti.com>, Jaroslav Kysela <perex@perex.cz>,
  Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
  Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
  alsa-devel@alsa-project.org, Gergo Koteles <soyer@irl.hu>
Subject: [PATCH v2 0/4] ALSA: hda/tas2781: Add tas2563 support
Date: Sat, 30 Dec 2023 01:09:41 +0100
Message-ID: <cover.1703891777.git.soyer@irl.hu>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1701906455.git.soyer@irl.hu>
References: <cover.1701906455.git.soyer@irl.hu>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mime-Autoconverted: from 8bit to 7bit by courier 1.0
Message-ID-Hash: EXKAEBWNVPU7GALGDGGKNXDJ7LFBX32P
X-Message-ID-Hash: EXKAEBWNVPU7GALGDGGKNXDJ7LFBX32P
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EXKAEBWNVPU7GALGDGGKNXDJ7LFBX32P/>
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
Link: https://lore.kernel.org/lkml/cover.1701733441.git.soyer@irl.hu/

This series now extends tas2781-hda.

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

The driver will search for it as TAS2XXX3870.bin with the Lenovo Yoga 7 
14ARB7.

The captured registers extracted with TI's regtool: 
https://github.com/soyersoyer/tas2563rca/raw/main/INT8866RCA2.bin

Changes since v1:
- fixes were sent as individual patches
- rebased onto for-next
- adding the missed fixup

Gergo Koteles (4):
  ALSA: hda/tas2781: add ptrs to calibration functions
  ALSA: hda/tas2781: add configurable global i2c address
  ALSA: hda/tas2781: add TAS2563 support for 14ARB7
  ALSA: hda/tas2781: add fixup for Lenovo 14ARB7

 include/sound/tas2781.h           |   8 +++
 sound/pci/hda/patch_realtek.c     |  14 ++++
 sound/pci/hda/tas2781_hda_i2c.c   | 115 ++++++++++++++++++++++++++----
 sound/soc/codecs/tas2781-comlib.c |  15 ++++
 4 files changed, 137 insertions(+), 15 deletions(-)


base-commit: 64bf8dec54cfe57f416884a6b3d54c7f4259e93f
-- 
2.43.0

