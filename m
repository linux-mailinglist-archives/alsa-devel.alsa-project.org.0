Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 01312668BE7
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Jan 2023 06:54:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 04D5372E2;
	Fri, 13 Jan 2023 06:53:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 04D5372E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673589258;
	bh=X73VGfmyH3O6gTDgaJnGtLenseSQ+lbtsUqh/dDMlNQ=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=LPrHCJtFAJauZ/Hz7QjEabEPVM+XQ7S7OGdT8Quj/WKJ+LYznCaUW6ms5GWeYuffP
	 4A4OMIu/aLypXouvSpOyvH0jyJB3SK6Fw4Wl0aZQdY9OSlR3TmPDo12xnCvk70/3bp
	 +A1oW+7bhnBf2wLnPChZR9Fh3pNXjxYTa4lfJmys=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AA844F8019B;
	Fri, 13 Jan 2023 06:53:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1E4B9F803DC; Fri, 13 Jan 2023 06:53:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_DNSWL_NONE,
 RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY
 shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from out28-217.mail.aliyun.com (out28-217.mail.aliyun.com
 [115.124.28.217])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 12C5CF8026D
 for <alsa-devel@alsa-project.org>; Fri, 13 Jan 2023 06:53:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 12C5CF8026D
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.08223306|-1; CH=green;
 DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.0236966-0.000586858-0.975717;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047205; MF=wangweidong.a@awinic.com; NM=1;
 PH=DS; RN=23; RT=23; SR=0; TI=SMTPD_---.QrY0tRj_1673589183; 
Received: from ubuntu-VirtualBox..(mailfrom:wangweidong.a@awinic.com
 fp:SMTPD_---.QrY0tRj_1673589183) by smtp.aliyun-inc.com;
 Fri, 13 Jan 2023 13:53:11 +0800
From: wangweidong.a@awinic.com
To: lgirdwood@gmail.com, broonie@kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, perex@perex.cz, tiwai@suse.com,
 ckeepax@opensource.cirrus.com, rf@opensource.cirrus.com,
 pierre-louis.bossart@linux.intel.com, james.schulman@cirrus.com,
 wangweidong.a@awinic.com, flatmax@flatmax.com, jonathan.albrieux@gmail.com,
 povik+lin@cutebit.org, 13691752556@139.com, shumingf@realtek.com,
 ryan.lee.analog@gmail.com, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH V10 0/5] ASoC: codecs: Add Awinic AW88395 audio amplifier
 driver
Date: Fri, 13 Jan 2023 13:52:56 +0800
Message-Id: <20230113055301.189541-1-wangweidong.a@awinic.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: yijiangtao@awinic.com, zhaolei@awinic.com, liweilei@awinic.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Weidong Wang <wangweidong.a@awinic.com>

The Awinic AW88395 is an I2S/TDM input, high efficiency
digital Smart K audio amplifier with an integrated 10.25V
smart boost convert

Add a DT schema for describing Awinic AW88395 audio amplifiers. They are
controlled using I2C

v9 -> v10: Modified return before unlock
           Change the way the if statement is written
           Use __le16 instead of unsigned short
           Rename the file, changing aw883xx to aw88395
           Change variable name
           Modify the Makefile and Kconfig

Weidong Wang (5):
  ASoC: codecs: Add i2c and codec registration for aw88395 and their
    associated operation functions
  ASoC: codecs: ACF bin parsing and check library file for aw88395
  ASoC: codecs: Aw88395 function for ALSA Audio Driver
  ASoC: codecs: Aw88395 chip register file, data type file and Kconfig
    Makefile
  ASoC: dt-bindings: Add schema for "awinic,aw88395"

 .../bindings/sound/awinic,aw88395.yaml        |   53 +
 sound/soc/codecs/Kconfig                      |   17 +
 sound/soc/codecs/Makefile                     |    5 +
 sound/soc/codecs/aw88395/aw88395.c            |  580 ++++++
 sound/soc/codecs/aw88395/aw88395.h            |   58 +
 sound/soc/codecs/aw88395/aw88395_data_type.h  |  142 ++
 sound/soc/codecs/aw88395/aw88395_device.c     | 1748 +++++++++++++++++
 sound/soc/codecs/aw88395/aw88395_device.h     |  194 ++
 sound/soc/codecs/aw88395/aw88395_lib.c        | 1066 ++++++++++
 sound/soc/codecs/aw88395/aw88395_lib.h        |   92 +
 sound/soc/codecs/aw88395/aw88395_reg.h        |  383 ++++
 11 files changed, 4338 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/awinic,aw88395.yaml
 create mode 100644 sound/soc/codecs/aw88395/aw88395.c
 create mode 100644 sound/soc/codecs/aw88395/aw88395.h
 create mode 100644 sound/soc/codecs/aw88395/aw88395_data_type.h
 create mode 100644 sound/soc/codecs/aw88395/aw88395_device.c
 create mode 100644 sound/soc/codecs/aw88395/aw88395_device.h
 create mode 100644 sound/soc/codecs/aw88395/aw88395_lib.c
 create mode 100644 sound/soc/codecs/aw88395/aw88395_lib.h
 create mode 100644 sound/soc/codecs/aw88395/aw88395_reg.h


base-commit: d9fc1511728c15df49ff18e49a494d00f78b7cd4
-- 
2.39.0

