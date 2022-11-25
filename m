Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BA69638651
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Nov 2022 10:30:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C47601745;
	Fri, 25 Nov 2022 10:29:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C47601745
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669368639;
	bh=cc7fMoaXV7btWeJCHJg6SISxt0MwRUvnDnUqMqPCh6E=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tPbMAZrdPsOLkp9GR+xMeb3tRMiQQpHJcOiLMAuO4v3G5aASgiBz86xMzsztwJSDX
	 AVGaEYk/MAH53DqUuuxoCoeFlBFRpMphSAVUq18pZqumUVgqiZWmdul/ztEZPohLjv
	 dErlDHwwFll78On31XXMifRUgNdz3pey0tO4vuJQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 187A7F80171;
	Fri, 25 Nov 2022 10:28:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 29ADAF805AA; Fri, 25 Nov 2022 10:28:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from out28-171.mail.aliyun.com (out28-171.mail.aliyun.com
 [115.124.28.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 975B1F80171
 for <alsa-devel@alsa-project.org>; Fri, 25 Nov 2022 10:28:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 975B1F80171
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07993368|-1; CH=green;
 DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.0025679-1.80161e-05-0.997414;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047203; MF=wangweidong.a@awinic.com; NM=1;
 PH=DS; RN=17; RT=17; SR=0; TI=SMTPD_---.QGdOKx._1669368449; 
Received: from shaoer-VirtualBox.mshome.net(mailfrom:wangweidong.a@awinic.com
 fp:SMTPD_---.QGdOKx._1669368449) by smtp.aliyun-inc.com;
 Fri, 25 Nov 2022 17:27:39 +0800
From: wangweidong.a@awinic.com
To: broonie@kernel.org, perex@perex.cz, alsa-devel@alsa-project.org,
 tiwai@suse.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 ckeepax@opensource.cirrus.com, tanureal@opensource.cirrus.com,
 quic_potturu@quicinc.com, pierre-louis.bossart@linux.intel.com,
 cy_huang@richtek.com
Subject: [patch v5 0/5] ASoC: codecs: Add Awinic AW883XX audio amplifier driver
Date: Fri, 25 Nov 2022 17:27:22 +0800
Message-Id: <20221125092727.17414-1-wangweidong.a@awinic.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221115022423.6437-2-wangweidong.a@awinic.com>
References: <20221115022423.6437-2-wangweidong.a@awinic.com>
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

v4 -> v5: Remove the encapsulation of the alsa api
          Report the error value in the Kcontrol
          Use dev_dbg instead of pr_debug
          Change the log print level
          Removing software restrictions on volume
          Delete the aw883xx_fw_wrok 
          Apply for gpio using the gpiod api
          Delete the reg node
          Delete the fade_step node
          The fade_step node was removed and the fade_step Kcontrol
            was added
          Delete the description of the reg node from 
            aw883xx,awinic.yaml file
          Delete the sound-channel node from the aw883xx file
          Change the warning: unused variable 'aw883xx_dt_match'
          Change the warning: stack frame size (1272) exceeds 
            limit (1024) in 'aw883xx_dev_cfg_load'

Weidong Wang (5):
  ASoC: codecs: Add i2c and codec registration for aw883xx and
    their associated operation functions
  ASoC: codecs: Implementation of aw883xx configuration file parsing
    function
  ASoC: codecs: aw883xx chip control logic, such as power on and off
  ASoC: codecs: Configure aw883xx chip register as well as Kconfig and
    Makefile
  ASoC: dt-bindings: Add schema for "awinic,aw883xx"

 .../bindings/sound/awinic,aw883xx.yaml        |   49 +
 sound/soc/codecs/Kconfig                      |   10 +
 sound/soc/codecs/Makefile                     |    7 +
 sound/soc/codecs/aw883xx/aw883xx.c            | 1673 ++++++++++++
 sound/soc/codecs/aw883xx/aw883xx.h            |  105 +
 sound/soc/codecs/aw883xx/aw883xx_bin_parse.c  | 1312 ++++++++++
 sound/soc/codecs/aw883xx/aw883xx_bin_parse.h  |  145 ++
 sound/soc/codecs/aw883xx/aw883xx_data_type.h  |  148 ++
 sound/soc/codecs/aw883xx/aw883xx_device.c     | 1629 ++++++++++++
 sound/soc/codecs/aw883xx/aw883xx_device.h     |  543 ++++
 sound/soc/codecs/aw883xx/aw883xx_init.c       |  635 +++++
 .../soc/codecs/aw883xx/aw883xx_pid_2049_reg.h | 2300 +++++++++++++++++
 12 files changed, 8556 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/
  awinic,aw883xx.yaml
 create mode 100644 sound/soc/codecs/aw883xx/aw883xx.c
 create mode 100644 sound/soc/codecs/aw883xx/aw883xx.h
 create mode 100644 sound/soc/codecs/aw883xx/aw883xx_bin_parse.c
 create mode 100644 sound/soc/codecs/aw883xx/aw883xx_bin_parse.h
 create mode 100644 sound/soc/codecs/aw883xx/aw883xx_data_type.h
 create mode 100644 sound/soc/codecs/aw883xx/aw883xx_device.c
 create mode 100644 sound/soc/codecs/aw883xx/aw883xx_device.h
 create mode 100644 sound/soc/codecs/aw883xx/aw883xx_init.c
 create mode 100644 sound/soc/codecs/aw883xx/aw883xx_pid_2049_reg.h


base-commit: 08ad43d554bacb9769c6a69d5f771f02f5ba411c
-- 
2.38.1

