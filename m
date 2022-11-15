Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2438B628FE1
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Nov 2022 03:26:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 506111607;
	Tue, 15 Nov 2022 03:25:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 506111607
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668479174;
	bh=Rz/3MLs8ykPP/aXEzv9HPZCuYy8+PYwdadu8aFLmrzk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=b8QFkU8OQc3bC+LPj5+LqnIgtnDj1odT7W7N3mKq4Dp9nwJR1jgOuSSy5LK52fG6X
	 JjbBtb0O8+DcvoDuo+SYJh58clBo/LSHpy6rQw/uDyyJRonbRYIvEhsUpqH6qJcG6C
	 DHxDHKR2OrDVqSi5n8j/gZHS1ZF8pkWHyBHHmfBg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 14512F80563;
	Tue, 15 Nov 2022 03:24:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6441DF8055C; Tue, 15 Nov 2022 03:24:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS,URIBL_ZEN_BLOCKED_OPENDNS autolearn=disabled
 version=3.4.0
Received: from out29-50.mail.aliyun.com (out29-50.mail.aliyun.com
 [115.124.29.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 112BAF800AA
 for <alsa-devel@alsa-project.org>; Tue, 15 Nov 2022 03:24:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 112BAF800AA
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07788765|-1;
 BR=01201311R501S03rulernew998_84748_2000303; CH=blue; DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.00264336-1.88448e-05-0.997338;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047213; MF=wangweidong.a@awinic.com; NM=1;
 PH=DS; RN=17; RT=17; SR=0; TI=SMTPD_---.Q7RJgaa_1668479065; 
Received: from localhost.localdomain(mailfrom:wangweidong.a@awinic.com
 fp:SMTPD_---.Q7RJgaa_1668479065) by smtp.aliyun-inc.com;
 Tue, 15 Nov 2022 10:24:33 +0800
From: wangweidong.a@awinic.com
To: broonie@kernel.org, perex@perex.cz, alsa-devel@alsa-project.org,
 tiwai@suse.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 ckeepax@opensource.cirrus.com, tanureal@opensource.cirrus.com,
 quic_potturu@quicinc.com, pierre-louis.bossart@linux.intel.com,
 cy_huang@richtek.com
Subject: [PATCH V4 0/6] ASoC: codecs: Add Awinic AW883XX audio amplifier driver
Date: Tue, 15 Nov 2022 10:24:17 +0800
Message-Id: <20221115022423.6437-1-wangweidong.a@awinic.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <1668165992-6493-2-git-send-email-wangweidong.a@awinic.com>
References: <1668165992-6493-2-git-send-email-wangweidong.a@awinic.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

v3 -> v4: Specification awinic,aw883xx.yaml pin naming
          Add a description of the awinic,aw883xx.yaml file properties
          Change the name of the node in the awinic,aw883xx.yaml file
          Change the warning: this 'if' clause does not guard 
                 on line 1095 of aw883xx.c
          Change the error: initialization of 'void (*)(struct i2c_client *)'
                 from incompatible pointer type 'int (*)(struct i2c_client *)'
                 on line 1796 of aw883xx.c
          Change the warning: 'aw_pid_2049_reg_access' defined but not used 
                 on line 37 of aw883xx_init.c
          Change the warning: no previous prototype for 'aw883xx_dev_get_int_status'
                 on line 634 of aw883xx_device.c
          Change the warning: no previous prototype for 'aw_dev_get_ra'
                 on line 1000 of aw883xx_device.c
          Change the warning: no previous prototype for 'aw_dev_dsp_fw_update'
                 on line 1062 of aw883xx_device.c


Weidong Wang (6):
  ASoC: codecs: Add i2c and codec registration for aw883xx and their
    associated operation functions
  ASoC: codecs: Added configuration file parsing for aw883xx
  ASoC: codecs: Add aw883xx chip control logic, such as power-on and
    power-off
  ASoC: codecs: Realize aw883xx register configuration and register
    address file
  ASoC: dt-bindings: Add schema for "awinic,aw883xx"
  ASoC:codecs:aw883xx corresponds to the modified Makefile and Kconfig

 .../bindings/sound/awinic,aw883xx.yaml        |   62 +
 sound/soc/codecs/Kconfig                      |   10 +
 sound/soc/codecs/Makefile                     |    7 +
 sound/soc/codecs/aw883xx/aw883xx.c            | 1803 +++++++++++++
 sound/soc/codecs/aw883xx/aw883xx.h            |  155 ++
 sound/soc/codecs/aw883xx/aw883xx_bin_parse.c  | 1294 ++++++++++
 sound/soc/codecs/aw883xx/aw883xx_bin_parse.h  |  145 ++
 sound/soc/codecs/aw883xx/aw883xx_data_type.h  |  148 ++
 sound/soc/codecs/aw883xx/aw883xx_device.c     | 1618 ++++++++++++
 sound/soc/codecs/aw883xx/aw883xx_device.h     |  544 ++++
 sound/soc/codecs/aw883xx/aw883xx_init.c       |  635 +++++
 .../soc/codecs/aw883xx/aw883xx_pid_2049_reg.h | 2300 +++++++++++++++++
 12 files changed, 8721 insertions(+)
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


base-commit: 094226ad94f471a9f19e8f8e7140a09c2625abaa
-- 
2.38.1

