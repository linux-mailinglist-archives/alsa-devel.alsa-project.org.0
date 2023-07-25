Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DA3547617CF
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Jul 2023 13:58:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 499301526;
	Tue, 25 Jul 2023 13:57:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 499301526
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690286286;
	bh=ZaIsJpCEDvVIZug7skhV4GpYPjc3TGtBs2gBcQB5kYI=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=HPnCFS1baYbJEL6r7/twMy95CTCxiVWEk9jCFvycK/3vsDwGPtUB/xfdhYCJi8QqS
	 qAEf21X6hcTnb3dREnLz5uC0h5nfj587RMBqyHrsHCG4YuZgPoTZ3eg65WiAL7593V
	 lkgXuq56pKd3fxZt4xPcIjlLpZ1Z9VTGowPWZ1gY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 07029F80163; Tue, 25 Jul 2023 13:57:15 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 614D8F80535;
	Tue, 25 Jul 2023 13:57:15 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 39E24F80544; Tue, 25 Jul 2023 13:57:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from out28-101.mail.aliyun.com (out28-101.mail.aliyun.com
 [115.124.28.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 150CEF80149
	for <alsa-devel@alsa-project.org>; Tue, 25 Jul 2023 13:57:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 150CEF80149
X-Alimail-AntiSpam: 
 AC=CONTINUE;BC=0.2463095|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.0329975-0.000205957-0.966797;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047199;MF=wangweidong.a@awinic.com;NM=1;PH=DS;RN=25;RT=25;SR=0;TI=SMTPD_---.U.y2wd._1690286211;
Received: from ubuntu-VirtualBox..(mailfrom:wangweidong.a@awinic.com
 fp:SMTPD_---.U.y2wd._1690286211)
          by smtp.aliyun-inc.com;
          Tue, 25 Jul 2023 19:56:54 +0800
From: wangweidong.a@awinic.com
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	rf@opensource.cirrus.com,
	shumingf@realtek.com,
	wangweidong.a@awinic.com,
	povik+lin@cutebit.org,
	13916275206@139.com,
	herve.codina@bootlin.com,
	ryans.lee@analog.com,
	ckeepax@opensource.cirrus.com,
	ajye_huang@compal.corp-partner.google.com,
	sebastian.reichel@collabora.com,
	yijiangtao@awinic.com,
	trix@redhat.com,
	colin.i.king@gmail.com,
	liweilei@awinic.com,
	alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: zhangjianming@awinic.com
Subject: [PATCH V2 0/4] ASoC: codecs: Add Awinic AW88261 audio amplifier
 driver
Date: Tue, 25 Jul 2023 19:56:45 +0800
Message-ID: <20230725115649.67560-1-wangweidong.a@awinic.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: QSH4KGGUT3M4BMD2P4G5ZTMS7UMBQQ5X
X-Message-ID-Hash: QSH4KGGUT3M4BMD2P4G5ZTMS7UMBQQ5X
X-MailFrom: wangweidong.a@awinic.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QSH4KGGUT3M4BMD2P4G5ZTMS7UMBQQ5X/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Weidong Wang <wangweidong.a@awinic.com>

The awinic AW88261 is an I2S/TDM input, high efficiency
digital Smart K audio amplifier

v1 -> v2: Use dev_err_prober instead of dev_err
          Delete unwanted dev_dbg
          Delect print messages on allocation errors.
          The commit information has been changed
          Delete EXPORT_SYMBOL_GPL
          Modify {} usage errors
          The aw88395_lib file is compatible with the bin parsing part of aw88261

Weidong Wang (4):
  ASoC: codecs: Add code for bin parsing compatible with aw88261
  ASoC: codecs: Add aw88261 audio amplifier driver
  ASoC: codecs: aw88261 device related operation functions
  ASoC: codecs: aw88261 chip register file, Kconfig and Makefile

 .../bindings/sound/awinic,aw88395.yaml        |   4 +-
 sound/soc/codecs/Kconfig                      |  13 +
 sound/soc/codecs/Makefile                     |   3 +
 sound/soc/codecs/aw88261/aw88261.c            | 517 +++++++++++
 sound/soc/codecs/aw88261/aw88261.h            |  52 ++
 sound/soc/codecs/aw88261/aw88261_device.c     | 876 ++++++++++++++++++
 sound/soc/codecs/aw88261/aw88261_device.h     |  79 ++
 sound/soc/codecs/aw88261/aw88261_reg.h        | 377 ++++++++
 sound/soc/codecs/aw88395/aw88395_lib.c        | 194 +++-
 sound/soc/codecs/aw88395/aw88395_reg.h        |   1 +
 10 files changed, 2098 insertions(+), 18 deletions(-)
 create mode 100644 sound/soc/codecs/aw88261/aw88261.c
 create mode 100644 sound/soc/codecs/aw88261/aw88261.h
 create mode 100644 sound/soc/codecs/aw88261/aw88261_device.c
 create mode 100644 sound/soc/codecs/aw88261/aw88261_device.h
 create mode 100644 sound/soc/codecs/aw88261/aw88261_reg.h


base-commit: 0b5547c51827e053cc754db47d3ec3e6c2c451d2
-- 
2.41.0

