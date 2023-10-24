Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3277F7D483E
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Oct 2023 09:16:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 88755857;
	Tue, 24 Oct 2023 09:15:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 88755857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698131806;
	bh=NxzSpg7Z3h5ZMY3R6IkUDv+gf24Sp9HPcUmniAj7zM8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=hF8tOdEmbsily/sKchhOS3LTsMw1CdHhBgof3EUAdMvQ6QiwKFPds0js9sA4ze9LR
	 MbsL3/o0B3Zc8jR9TgvKJWPVqnnoi8joFXvKz1/HU8XMLpZXWU7nS1q80K9zquMdpl
	 WczXelNKMlk/DPfVeI1oBX2Cm/CqCZtSNeKpvcvI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D7DC9F8019B; Tue, 24 Oct 2023 09:15:45 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E8C45F8014B;
	Tue, 24 Oct 2023 09:15:44 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 20E55F8019B; Tue, 24 Oct 2023 09:15:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from out28-196.mail.aliyun.com (out28-196.mail.aliyun.com
 [115.124.28.196])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F3900F8012B
	for <alsa-devel@alsa-project.org>; Tue, 24 Oct 2023 09:14:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F3900F8012B
X-Alimail-AntiSpam: 
 AC=CONTINUE;BC=0.1912555|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_alarm|0.00383916-7.02771e-05-0.996091;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047202;MF=wangweidong.a@awinic.com;NM=1;PH=DS;RN=27;RT=27;SR=0;TI=SMTPD_---.V6azpiD_1698131664;
Received: from ubuntu-VirtualBox..(mailfrom:wangweidong.a@awinic.com
 fp:SMTPD_---.V6azpiD_1698131664)
          by smtp.aliyun-inc.com;
          Tue, 24 Oct 2023 15:14:32 +0800
From: wangweidong.a@awinic.com
To: broonie@kernel.org
Cc: 13916275206@139.com,
	ajye_huang@compal.corp-partner.google.com,
	alsa-devel@alsa-project.org,
	arnd@arndb.de,
	ckeepax@opensource.cirrus.com,
	colin.i.king@gmail.com,
	conor+dt@kernel.org,
	dan.carpenter@linaro.org,
	devicetree@vger.kernel.org,
	harshit.m.mogalapalli@oracle.com,
	herve.codina@bootlin.com,
	krzysztof.kozlowski+dt@linaro.org,
	lgirdwood@gmail.com,
	linus.walleij@linaro.org,
	linux-kernel@vger.kernel.org,
	liweilei@awinic.com,
	perex@perex.cz,
	rf@opensource.cirrus.com,
	robh+dt@kernel.org,
	ryans.lee@analog.com,
	sebastian.reichel@collabora.com,
	shumingf@realtek.com,
	tiwai@suse.com,
	trix@redhat.com,
	wangweidong.a@awinic.com,
	yijiangtao@awinic.com
Subject: [PATCH V2 0/4] ASoC: codecs: Add aw88399 amplifier driver
Date: Tue, 24 Oct 2023 15:14:15 +0800
Message-ID: <20231024071419.85647-1-wangweidong.a@awinic.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <21bfa0bb-d936-402d-9ca9-6bcf181a0f35@sirena.org.uk>
References: <21bfa0bb-d936-402d-9ca9-6bcf181a0f35@sirena.org.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: GXVWWIMSX6A4HX7VW26PTQFECUD5S4NX
X-Message-ID-Hash: GXVWWIMSX6A4HX7VW26PTQFECUD5S4NX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GXVWWIMSX6A4HX7VW26PTQFECUD5S4NX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Weidong Wang <wangweidong.a@awinic.com>

Add the awinic,aw88399 property to the awinic,aw88395.yaml file.

Add i2c and amplifier registration for
aw88399 and their associated operation functions.

v1 -> v2: Modify the reset mode
          Delete AW88399_DSP_I2C_WRITES macros
           and related debugging statements
          Change the value of max_register in aw88399
          Change the value of max_register in aw88261
          Delete the judgment of unnecessary pointers
          Modify the judgment of the ret return value

Weidong Wang (4):
  ASoC: dt-bindings: Add schema for "awinic,aw88399"
  ASoC: codecs: Modify max_register usage error
  ASoC: codecs: Add code for bin parsing compatible with aw88399
  ASoC: codecs: Add aw88399 amplifier driver

 .../bindings/sound/awinic,aw88395.yaml        |    1 +
 sound/soc/codecs/Kconfig                      |   14 +
 sound/soc/codecs/Makefile                     |    2 +
 sound/soc/codecs/aw88261.c                    |    2 +-
 sound/soc/codecs/aw88395/aw88395_lib.c        |    3 +
 sound/soc/codecs/aw88395/aw88395_reg.h        |    1 +
 sound/soc/codecs/aw88399.c                    | 1911 +++++++++++++++++
 sound/soc/codecs/aw88399.h                    |  599 ++++++
 8 files changed, 2532 insertions(+), 1 deletion(-)
 create mode 100644 sound/soc/codecs/aw88399.c
 create mode 100644 sound/soc/codecs/aw88399.h


base-commit: ce55c22ec8b223a90ff3e084d842f73cfba35588
-- 
2.41.0

