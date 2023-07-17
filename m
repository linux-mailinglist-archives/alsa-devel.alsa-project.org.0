Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 69A91756232
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Jul 2023 14:00:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 359A1DF4;
	Mon, 17 Jul 2023 13:59:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 359A1DF4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689595206;
	bh=7gruwPqWWrVdFy2imFpHonFUbCcu7VRkIJ3zye5zptM=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=i4tqgGYsdf8uWqgxC/Tuutc17WVaA9dzdT8Z2zPrpdDBscBHkibW1AKDKR3SHX1yv
	 b5gbN8YvLVYKeVydzICDB3Hw7vYsJPYblPXLonkc0YZl4SHKp8W58XsQAXDJcR1Bs1
	 5PWfkFnzKJ+0Im6FDBSqnu186NiqvCtCn9XpVwy8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6ABE7F80552; Mon, 17 Jul 2023 13:59:07 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7A3EDF80527;
	Mon, 17 Jul 2023 13:59:07 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 20C72F80535; Mon, 17 Jul 2023 13:59:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from out28-52.mail.aliyun.com (out28-52.mail.aliyun.com
 [115.124.28.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 15852F8007E
	for <alsa-devel@alsa-project.org>; Mon, 17 Jul 2023 13:58:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 15852F8007E
X-Alimail-AntiSpam: 
 AC=CONTINUE;BC=0.1215566|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.0282188-0.000419799-0.971361;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047213;MF=wangweidong.a@awinic.com;NM=1;PH=DS;RN=25;RT=25;SR=0;TI=SMTPD_---.TvogKtF_1689595126;
Received: from ubuntu-VirtualBox..(mailfrom:wangweidong.a@awinic.com
 fp:SMTPD_---.TvogKtF_1689595126)
          by smtp.aliyun-inc.com;
          Mon, 17 Jul 2023 19:58:48 +0800
From: wangweidong.a@awinic.com
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	rf@opensource.cirrus.co,
	wangweidong.a@awinic.com,
	shumingf@realtek.com,
	herve.codina@bootlin.com,
	flatmax@flatmax.com,
	ckeepax@opensource.cirrus.com,
	doug@schmorgal.com,
	fido_max@inbox.ru,
	pierre-louis.bossart@linux.intel.com,
	kiseok.jo@irondevice.com,
	liweilei@awinic.com,
	colin.i.king@gmail.com,
	trix@redhat.com,
	alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: yijiangtao@awinic.com,
	zhangjianming@awinic.com
Subject: [PATCH V1 0/5]  ASoC: codecs: Add Awinic AW88261 audio amplifier
 driver
Date: Mon, 17 Jul 2023 19:58:40 +0800
Message-ID: <20230717115845.297991-1-wangweidong.a@awinic.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: MJDS3AAC7E2MK4EF2OG2U2YZR2VP2SJN
X-Message-ID-Hash: MJDS3AAC7E2MK4EF2OG2U2YZR2VP2SJN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MJDS3AAC7E2MK4EF2OG2U2YZR2VP2SJN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Weidong Wang <wangweidong.a@awinic.com>

The AW88261 is an I2S/TDM input, high efficiency
digital Smart K audio amplifier with an integrated 10.25V
smart boost convert

Add a DT schema for describing Awinic aw88261 audio amplifiers. They are
controlled using I2C.

Weidong Wang (5):
  ASoC: codecs: Add i2c and codec registration for aw88261 and their
    associated operation functions
  ASoC: codecs: aw88261 function for ALSA Audio Driver
  ASoC: codecs: ACF bin parsing and check library file for aw88261
  ASoC: codecs: aw88261 chip register file, data type file and Kconfig
    Makefile
  ASoC: dt-bindings: Add schema for "awinic,aw88261"

 .../bindings/sound/awinic,aw88261.yaml        |  53 +
 sound/soc/codecs/Kconfig                      |  17 +
 sound/soc/codecs/Makefile                     |   5 +
 sound/soc/codecs/aw88261/aw88261.c            | 539 ++++++++++
 sound/soc/codecs/aw88261/aw88261.h            |  52 +
 sound/soc/codecs/aw88261/aw88261_data_type.h  | 144 +++
 sound/soc/codecs/aw88261/aw88261_device.c     | 959 +++++++++++++++++
 sound/soc/codecs/aw88261/aw88261_device.h     | 114 ++
 sound/soc/codecs/aw88261/aw88261_lib.c        | 997 ++++++++++++++++++
 sound/soc/codecs/aw88261/aw88261_lib.h        |  91 ++
 sound/soc/codecs/aw88261/aw88261_reg.h        | 377 +++++++
 11 files changed, 3348 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/awinic,aw88261.yaml
 create mode 100644 sound/soc/codecs/aw88261/aw88261.c
 create mode 100644 sound/soc/codecs/aw88261/aw88261.h
 create mode 100644 sound/soc/codecs/aw88261/aw88261_data_type.h
 create mode 100644 sound/soc/codecs/aw88261/aw88261_device.c
 create mode 100644 sound/soc/codecs/aw88261/aw88261_device.h
 create mode 100644 sound/soc/codecs/aw88261/aw88261_lib.c
 create mode 100644 sound/soc/codecs/aw88261/aw88261_lib.h
 create mode 100644 sound/soc/codecs/aw88261/aw88261_reg.h


base-commit: 8d7868c41df58edabc4e408d119a1aef58a54d9d
-- 
2.41.0

