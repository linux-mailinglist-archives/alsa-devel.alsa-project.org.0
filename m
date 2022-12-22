Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BCC8E654113
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Dec 2022 13:33:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 48D6841EC;
	Thu, 22 Dec 2022 13:32:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 48D6841EC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1671712409;
	bh=tecNgTbjn6sEq8BvjVPFTwSdBDjQWJSRskBRDOZ/IOs=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=TNajq+Z5jz4VIoSnjdVhqSsUGB6piNXpodDkcZPXgbplK2sFu2KytLq7RBBIT+qUc
	 C+x9jDf9gxM8u2AKD969TWyBXCx+ygUT+XEDunZ3xwPJrpwLq+HplCHoDL9wr4hqA9
	 CiwxGnWiZHChKslhl2Uwv/DNYQgZcoOEbgzLRJcM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E9038F80507;
	Thu, 22 Dec 2022 13:32:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3148CF8032B; Thu, 22 Dec 2022 13:32:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from out29-224.mail.aliyun.com (out29-224.mail.aliyun.com
 [115.124.29.224])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4C918F8026D
 for <alsa-devel@alsa-project.org>; Thu, 22 Dec 2022 13:32:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4C918F8026D
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.08830656|-1; CH=green;
 DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.00327242-5.26072e-05-0.996675;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047201; MF=wangweidong.a@awinic.com; NM=1;
 PH=DS; RN=28; RT=28; SR=0; TI=SMTPD_---.QbObWQR_1671712327; 
Received: from ubuntu-VirtualBox..(mailfrom:wangweidong.a@awinic.com
 fp:SMTPD_---.QbObWQR_1671712327) by smtp.aliyun-inc.com;
 Thu, 22 Dec 2022 20:32:16 +0800
From: wangweidong.a@awinic.com
To: lgirdwood@gmail.com, broonie@kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, perex@perex.cz, tiwai@suse.com,
 ckeepax@opensource.cirrus.com, rf@opensource.cirrus.com,
 peter.ujfalusi@linux.intel.com, pierre-louis.bossart@linux.intel.com,
 james.schulman@cirrus.com, flatmax@flatmax.com, ryan.lee.analog@gmail.com,
 jonathan.albrieux@gmail.com, tanureal@opensource.cirrus.com,
 povik+lin@cutebit.org, 13691752556@139.com, cezary.rojewski@intel.com,
 stephan@gerhold.net, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH V7 0/5] ASoC: codecs: Add Awinic AW883XX audio amplifier driver
Date: Thu, 22 Dec 2022 20:32:01 +0800
Message-Id: <20221222123205.106353-1-wangweidong.a@awinic.com>
X-Mailer: git-send-email 2.38.1
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
Cc: duanyibo@awinic.com, Weidong Wang <wangweidong.a@awinic.com>,
 zhaolei@awinic.com, liweilei@awinic.com, yijiangtao@awinic.com,
 zhangjianming@awinic.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Weidong Wang <wangweidong.a@awinic.com>

The Awinic AW883XX is an I2S/TDM input, high efficiency
digital Smart K audio amplifier with an integrated 10.25V
smart boost convert

Add a DT schema for describing Awinic AW883xx audio amplifiers. They are
controlled using I2C

v6 -> v7: Change name-prefix.yaml to dai-common.yaml in awinic,aw883xx.yaml file
          Delete redundant header files
          Use EINVAL and so on instead of custom error return values
          Remove unnecessary comment
          No longer assign NULL to pointer
          Change the way the if statement is written
          Use devm_kcalloc instead of devm_kzalloc
          Use crc8 and crc32 that come with linux          

Weidong Wang (5):
  ASoC: codecs: Add i2c and codec registration for aw883xx and their
    associated operation functions
  ASoC: codecs: Aw883xx function for ACF file parse and check
  ASoC: codecs: Aw883xx common function for ALSA Audio Driver
  ASoC: codecs: Aw883xx chip register file, data type file and Kconfig
    Makefile
  ASoC: dt-bindings: Add schema for "awinic,aw883xx"

 .../bindings/sound/awinic,aw883xx.yaml        |   49 +
 sound/soc/codecs/Kconfig                      |   10 +
 sound/soc/codecs/Makefile                     |    6 +
 sound/soc/codecs/aw883xx/aw883xx.c            |  706 +++++++
 sound/soc/codecs/aw883xx/aw883xx.h            |   61 +
 sound/soc/codecs/aw883xx/aw883xx_bin_parse.c  | 1138 ++++++++++
 sound/soc/codecs/aw883xx/aw883xx_bin_parse.h  |  123 ++
 sound/soc/codecs/aw883xx/aw883xx_data_type.h  |  143 ++
 sound/soc/codecs/aw883xx/aw883xx_device.c     | 1840 +++++++++++++++++
 sound/soc/codecs/aw883xx/aw883xx_device.h     |  201 ++
 .../soc/codecs/aw883xx/aw883xx_pid_2049_reg.h |  490 +++++
 11 files changed, 4767 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/awinic,aw883xx.yaml
 create mode 100644 sound/soc/codecs/aw883xx/aw883xx.c
 create mode 100644 sound/soc/codecs/aw883xx/aw883xx.h
 create mode 100644 sound/soc/codecs/aw883xx/aw883xx_bin_parse.c
 create mode 100644 sound/soc/codecs/aw883xx/aw883xx_bin_parse.h
 create mode 100644 sound/soc/codecs/aw883xx/aw883xx_data_type.h
 create mode 100644 sound/soc/codecs/aw883xx/aw883xx_device.c
 create mode 100644 sound/soc/codecs/aw883xx/aw883xx_device.h
 create mode 100644 sound/soc/codecs/aw883xx/aw883xx_pid_2049_reg.h


base-commit: 9d2f6060fe4c3b49d0cdc1dce1c99296f33379c8
-- 
2.38.1

