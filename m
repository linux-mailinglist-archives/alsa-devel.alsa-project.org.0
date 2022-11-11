Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B7A6C62594F
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Nov 2022 12:27:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4EDB41654;
	Fri, 11 Nov 2022 12:27:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4EDB41654
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668166078;
	bh=KAUI7xfAGNDaeS3tGAhxh6F7dqgYnlZaZtWqgk8kB7U=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PzfdAEtixlqezgiU4jbb6PGsAPEZDkuS8wkczpDnhCwg92ID74N2PXJSHUdlKj6Ub
	 fjZFpj5JWokoqaoS8XoFCJyQTAo3qvNBPRcw8VsC7PNHt9+xgaAINf8x2UkSsnLIpn
	 p9V3kuu1NJDlRjcV4vi27mCgr6NrWbSh1e6jFChA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D34F4F804B1;
	Fri, 11 Nov 2022 12:27:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3912EF8028D; Fri, 11 Nov 2022 12:27:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS,URIBL_ZEN_BLOCKED_OPENDNS autolearn=disabled
 version=3.4.0
Received: from out29-197.mail.aliyun.com (out29-197.mail.aliyun.com
 [115.124.29.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 19260F800F8
 for <alsa-devel@alsa-project.org>; Fri, 11 Nov 2022 12:26:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 19260F800F8
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.09148369|-1;
 BR=01201311R111S77rulernew998_84748_2000303; CH=blue; DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.00461399-8.44262e-05-0.995302;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047187; MF=wangweidong.a@awinic.com; NM=1;
 PH=DS; RN=17; RT=17; SR=0; TI=SMTPD_---.Q5.Set4_1668165997; 
Received: from localhost.localdomain(mailfrom:wangweidong.a@awinic.com
 fp:SMTPD_---.Q5.Set4_1668165997) by smtp.aliyun-inc.com;
 Fri, 11 Nov 2022 19:26:49 +0800
From: wangweidong.a@awinic.com
To: broonie@kernel.org, perex@perex.cz, alsa-devel@alsa-project.org,
 tiwai@suse.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 ckeepax@opensource.cirrus.com, tanureal@opensource.cirrus.com,
 quic_potturu@quicinc.com, pierre-louis.bossart@linux.intel.com,
 cy_huang@richtek.com
Subject: [PATCH V3 0/6] ASoC: codecs: Add Awinic AW883XX audio amplifier driver
Date: Fri, 11 Nov 2022 19:26:26 +0800
Message-Id: <1668165992-6493-1-git-send-email-wangweidong.a@awinic.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <000701d8e7521f78bc05e6a340awinic.com>
References: <000701d8e7521f78bc05e6a340awinic.com>
Cc: duanyibo@awinic.com, Weidong Wang <wangweidong.a@awinic.com>,
 zhaolei@awinic.com, liweilei@awinic.com, yijiangtao@awinic.com,
 zhangjianming@awinic.com
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

From: Weidong Wang <wangweidong.a@awinic.com>

The Awinic AW883XX is an I2S/TDM input, high efficiency
digital Smart K audio amplifier with an integrated 10.25V
smart boost convert

Add a DT schema for describing Awinic AW883xx audio amplifiers. They are
controlled using I2C.

v2 -> v3 :  i2c reads and writes are changed to regmap
            The monitor, calib, and spin files were deleted
            Deleted firmware load retry
            Linux version compatibility and driver version control were removed
            The global variable was deleted
            The renaming of dai was removed
            Platform compatibility was removed
            Simplified log information
            use module_i2c_driver
            Delete the custom interface and use the kernel standard interface


Weidong Wang (6):
  ASoC: codecs: Add i2c and codec registration for aw883xx and their associated operation functions
  ASoC: codecs: Added configuration file parsing for aw883xx
  ASoC: codecs: Add aw883xx chip control logic, such as power-on and power-off
  ASoC: codecs: Realize aw883xx register configuration and register address file
  ASoC: dt-bindings: Add schema for "awinic,aw883xx"
  ASoC:codecs:aw883xx corresponds to the modified Makefile and Kconfig

 .../devicetree/bindings/sound/awinic,aw883xx.yaml  |   60 +
 sound/soc/codecs/Kconfig                           |   10 +
 sound/soc/codecs/Makefile                          |    7 +
 sound/soc/codecs/aw883xx/aw883xx.c                 | 1806 +++++++++++++++
 sound/soc/codecs/aw883xx/aw883xx.h                 |  155 ++
 sound/soc/codecs/aw883xx/aw883xx_bin_parse.c       | 1294 +++++++++++
 sound/soc/codecs/aw883xx/aw883xx_bin_parse.h       |  145 ++
 sound/soc/codecs/aw883xx/aw883xx_data_type.h       |  148 ++
 sound/soc/codecs/aw883xx/aw883xx_device.c          | 1618 +++++++++++++
 sound/soc/codecs/aw883xx/aw883xx_device.h          |  544 +++++
 sound/soc/codecs/aw883xx/aw883xx_init.c            |  549 +++++
 sound/soc/codecs/aw883xx/aw883xx_pid_2049_reg.h    | 2387 ++++++++++++++++++++
 12 files changed, 8723 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/awinic,aw883xx.yaml
 create mode 100644 sound/soc/codecs/aw883xx/aw883xx.c
 create mode 100644 sound/soc/codecs/aw883xx/aw883xx.h
 create mode 100644 sound/soc/codecs/aw883xx/aw883xx_bin_parse.c
 create mode 100644 sound/soc/codecs/aw883xx/aw883xx_bin_parse.h
 create mode 100644 sound/soc/codecs/aw883xx/aw883xx_data_type.h
 create mode 100644 sound/soc/codecs/aw883xx/aw883xx_device.c
 create mode 100644 sound/soc/codecs/aw883xx/aw883xx_device.h
 create mode 100644 sound/soc/codecs/aw883xx/aw883xx_init.c
 create mode 100644 sound/soc/codecs/aw883xx/aw883xx_pid_2049_reg.h

-- 
2.7.4

