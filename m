Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D1A17A48DB
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Sep 2023 13:54:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3DEB5206;
	Mon, 18 Sep 2023 13:53:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3DEB5206
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695038058;
	bh=Dw/+HpOAfJOjMKnVdyw4qrfy1jycdnHx7yqX5mL1T1k=;
	h=From:To:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=h1X+GDK2VLskeAoVJr93ePmAAOp4NjRK1Inh1XutC9bkqnQ03cQlCatDUk5Wj00s2
	 yPQBmUTFdwJEonIT7Z0oGwRoOzId9awAzXSO5M/DFPMXOQU5LDHTOJQZc018UwRan4
	 4PfLv566EvGQ1e/VnyUasIzyTdtDHm3B/zBHOFSg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8B1E3F8025A; Mon, 18 Sep 2023 13:53:27 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 04646F801D5;
	Mon, 18 Sep 2023 13:53:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CE196F80125; Mon, 18 Sep 2023 13:53:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from out28-149.mail.aliyun.com (out28-149.mail.aliyun.com
 [115.124.28.149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 62200F80125
	for <alsa-devel@alsa-project.org>; Mon, 18 Sep 2023 13:53:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 62200F80125
X-Alimail-AntiSpam: 
 AC=CONTINUE;BC=0.2156935|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.0370854-0.000192717-0.962722;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047193;MF=wangweidong.a@awinic.com;NM=1;PH=DS;RN=27;RT=27;SR=0;TI=SMTPD_---.Ui7aPDz_1695037977;
Received: from ubuntu-VirtualBox..(mailfrom:wangweidong.a@awinic.com
 fp:SMTPD_---.Ui7aPDz_1695037977)
          by smtp.aliyun-inc.com;
          Mon, 18 Sep 2023 19:53:05 +0800
From: wangweidong.a@awinic.com
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	rf@opensource.cirrus.com,
	wangweidong.a@awinic.com,
	herve.codina@bootlin.com,
	shumingf@realtek.com,
	13916275206@139.com,
	ryans.lee@analog.com,
	linus.walleij@linaro.org,
	ckeepax@opensource.cirrus.com,
	povik+lin@cutebit.org,
	arnd@arndb.de,
	harshit.m.mogalapalli@oracle.com,
	u.kleine-koenig@pengutronix.de,
	yang.lee@linux.alibaba.com,
	liweilei@awinic.com,
	yijiangtao@awinic.com,
	trix@redhat.com,
	colin.i.king@gmail.com,
	alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V3 0/5] ASoC: codecs: Add aw87390 amplifier driver
Date: Mon, 18 Sep 2023 19:52:50 +0800
Message-ID: <20230918115255.33171-1-wangweidong.a@awinic.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: PK3Q5GZXURZMWFRMG37YOE34ZENRXICH
X-Message-ID-Hash: PK3Q5GZXURZMWFRMG37YOE34ZENRXICH
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PK3Q5GZXURZMWFRMG37YOE34ZENRXICH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Weidong Wang <wangweidong.a@awinic.com>

The awinic aw87390 is a new high efficiency, low noise,
constant large volume, 6th Smart K audio amplifier.

Add a DT schema for describing awinic aw87390 audio amplifiers.
They are controlled using I2C.

v2 -> v3: Modify the type of "awinic,sync-flag" property to bool
          Modify function return value
          Modify commit information
          Change the name of "sync-flag" to "awinic,sync-flag"

Weidong Wang (5):
  ASoC: dt-bindings: awinic,aw88395: Add properties for multiple PA
    support
  ASoC: dt-bindings: Add schema for "awinic,aw87390"
  ASoC: codecs: Add code for bin parsing compatible with aw87390
  ASoC: codecs: Change the aw88261 variable name and i2c driver name
  ASoC: codecs: Add aw87390 amplifier driver

 .../bindings/sound/awinic,aw87390.yaml        |  58 +++
 .../bindings/sound/awinic,aw88395.yaml        |  16 +
 sound/soc/codecs/Kconfig                      |  15 +-
 sound/soc/codecs/Makefile                     |   2 +
 sound/soc/codecs/aw87390.c                    | 462 ++++++++++++++++++
 sound/soc/codecs/aw87390.h                    |  85 ++++
 sound/soc/codecs/aw88261.c                    |  27 +-
 sound/soc/codecs/aw88261.h                    |   4 +-
 sound/soc/codecs/aw88395/aw88395.c            |   9 +-
 sound/soc/codecs/aw88395/aw88395.h            |   2 +-
 sound/soc/codecs/aw88395/aw88395_device.c     |  47 +-
 sound/soc/codecs/aw88395/aw88395_device.h     |   6 +-
 sound/soc/codecs/aw88395/aw88395_lib.c        |  25 +-
 sound/soc/codecs/aw88395/aw88395_reg.h        |   1 +
 14 files changed, 686 insertions(+), 73 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/awinic,aw87390.yaml
 create mode 100644 sound/soc/codecs/aw87390.c
 create mode 100644 sound/soc/codecs/aw87390.h


base-commit: ce9ecca0238b140b88f43859b211c9fdfd8e5b70
-- 
2.41.0

