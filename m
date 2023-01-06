Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FD5265FA49
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Jan 2023 04:30:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6C24213140;
	Fri,  6 Jan 2023 04:29:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6C24213140
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672975842;
	bh=E+7W4itVQmbDlQN6RMH5l9B2iDNdKcnsTKeyKCQsd+o=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=re1pWoQxuabxsBrLSzq3D1dux+mMKjId3KXolFx7v3wW51e99p9xBewrfdbTwuU8/
	 HpPXxMaop5zk0puNLnqdFgWe2VuWbFRtZPOsESfUaqUxM5kDsrEFRKRbDarLVpxhSn
	 n48g3LtTbFi6VhDr9TvxPqChZRO3KmYuNvZnYW8Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 79E0BF8053D;
	Fri,  6 Jan 2023 04:29:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BEBCAF8047B; Fri,  6 Jan 2023 04:29:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
 RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY
 shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from out29-81.mail.aliyun.com (out29-81.mail.aliyun.com
 [115.124.29.81])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4F2D9F8022B
 for <alsa-devel@alsa-project.org>; Fri,  6 Jan 2023 04:29:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4F2D9F8022B
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.0864198|-1; CH=green; DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.00381174-5.27625e-05-0.996136;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047212; MF=wangweidong.a@awinic.com; NM=1;
 PH=DS; RN=26; RT=26; SR=0; TI=SMTPD_---.QlbrouW_1672975717; 
Received: from ubuntu-VirtualBox..(mailfrom:wangweidong.a@awinic.com
 fp:SMTPD_---.QlbrouW_1672975717) by smtp.aliyun-inc.com;
 Fri, 06 Jan 2023 11:28:46 +0800
From: wangweidong.a@awinic.com
To: lgirdwood@gmail.com, broonie@kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, perex@perex.cz, tiwai@suse.com,
 ckeepax@opensource.cirrus.com, rf@opensource.cirrus.com,
 pierre-louis.bossart@linux.intel.com, james.schulman@cirrus.com,
 flatmax@flatmax.com, cezary.rojewski@intel.com, wangweidong.a@awinic.com,
 povik+lin@cutebit.org, yangxiaohua@everest-semi.com,
 daniel.beer@igorinstitute.com, 13691752556@139.com,
 srinivas.kandagatla@linaro.org, jonathan.albrieux@gmail.com, steve@sk2.org,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH V9 0/5] ASoC: codecs: Add Awinic AW883XX audio amplifier driver
Date: Fri,  6 Jan 2023 11:28:30 +0800
Message-Id: <20230106032835.141918-1-wangweidong.a@awinic.com>
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

The Awinic AW883XX is an I2S/TDM input, high efficiency
digital Smart K audio amplifier with an integrated 10.25V
smart boost convert

Add a DT schema for describing Awinic AW883xx audio amplifiers. They are
controlled using I2C

v8 -> v9: Delete extra empty lines
          Use devm_kzalloc instead of kzalloc
          Structure members applied with devm_kzalloc are not initialized to NULL
          DAMP is used for power management
          In Kcontrol, out-of-range values return -EINVAL
          Delete switch Kcontrol
          Use devm_snd_soc_unregister_component instead of snd_soc_unregister_component
          Use aw88395 instead of aw883xx in awinic,aw88395.yaml file
          Add the sound-dai-cells in awinic,aw88395.yaml file
          Use unevaluatedProperties: false in awinic,aw88395.yaml file

Weidong Wang (5):
  ASoC: codecs: Add i2c and codec registration for aw883xx and their
    associated operation functions
  ASoC: codecs: Aw883xx function for ACF file parse and check
  ASoC: codecs: Aw883xx common function for ALSA Audio Driver
  ASoC: codecs: Aw883xx chip register file, data type file and Kconfig
    Makefile
  ASoC: dt-bindings: Add schema for "awinic,aw883xx"

 .../bindings/sound/awinic,aw883xx.yaml        |   53 +
 sound/soc/codecs/Kconfig                      |   10 +
 sound/soc/codecs/Makefile                     |    6 +
 sound/soc/codecs/aw883xx/aw883xx.c            |  579 ++++++
 sound/soc/codecs/aw883xx/aw883xx.h            |   58 +
 sound/soc/codecs/aw883xx/aw883xx_bin_parse.c  | 1067 ++++++++++
 sound/soc/codecs/aw883xx/aw883xx_bin_parse.h  |   92 +
 sound/soc/codecs/aw883xx/aw883xx_data_type.h  |  142 ++
 sound/soc/codecs/aw883xx/aw883xx_device.c     | 1756 +++++++++++++++++
 sound/soc/codecs/aw883xx/aw883xx_device.h     |  196 ++
 .../soc/codecs/aw883xx/aw883xx_pid_2049_reg.h |  383 ++++
 11 files changed, 4342 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/awinic,aw883xx.yaml
 create mode 100644 sound/soc/codecs/aw883xx/aw883xx.c
 create mode 100644 sound/soc/codecs/aw883xx/aw883xx.h
 create mode 100644 sound/soc/codecs/aw883xx/aw883xx_bin_parse.c
 create mode 100644 sound/soc/codecs/aw883xx/aw883xx_bin_parse.h
 create mode 100644 sound/soc/codecs/aw883xx/aw883xx_data_type.h
 create mode 100644 sound/soc/codecs/aw883xx/aw883xx_device.c
 create mode 100644 sound/soc/codecs/aw883xx/aw883xx_device.h
 create mode 100644 sound/soc/codecs/aw883xx/aw883xx_pid_2049_reg.h


base-commit: 1f5abbd77e2c1787e74b7c2caffac97def78ba52
-- 
2.39.0

