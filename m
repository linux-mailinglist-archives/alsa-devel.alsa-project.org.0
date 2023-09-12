Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E692079C770
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Sep 2023 09:01:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E68A9AE9;
	Tue, 12 Sep 2023 09:00:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E68A9AE9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694502077;
	bh=4aQRpTcd35i0dcJx5yzoxRA2LALgDG/ocbAWiqfPU1E=;
	h=From:To:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=ig1gw9dWyf20ziah3Qc5rQXoi5RsKVikwqRT8ZVGiFPTZcRL7vCwGvoEWHBRoZsHZ
	 5PV2/2ha3t/Uxfz6bPX/7KMiZ4DslA4AvyyNENaTk1SS3ymoKZ+wCQfo52ToKx5CYW
	 X17o7Ng6RFXtOdihCVOVZB2C2infHA+pjCuj0FUg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7FEB7F8055A; Tue, 12 Sep 2023 08:59:41 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id ED3AFF8055A;
	Tue, 12 Sep 2023 08:59:40 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6B304F8055C; Tue, 12 Sep 2023 08:59:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from out28-53.mail.aliyun.com (out28-53.mail.aliyun.com
 [115.124.28.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2EB89F8007C
	for <alsa-devel@alsa-project.org>; Tue, 12 Sep 2023 08:59:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2EB89F8007C
X-Alimail-AntiSpam: 
 AC=CONTINUE;BC=0.1304974|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.0360657-0.000255713-0.963679;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047190;MF=wangweidong.a@awinic.com;NM=1;PH=DS;RN=27;RT=27;SR=0;TI=SMTPD_---.Ud9doWb_1694501939;
Received: from ubuntu-VirtualBox..(mailfrom:wangweidong.a@awinic.com
 fp:SMTPD_---.Ud9doWb_1694501939)
          by smtp.aliyun-inc.com;
          Tue, 12 Sep 2023 14:59:07 +0800
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
	ckeepax@opensource.cirrus.com,
	herve.codina@bootlin.com,
	wangweidong.a@awinic.com,
	13916275206@139.com,
	ryans.lee@analog.com,
	linus.walleij@linaro.org,
	sebastian.reichel@collabora.com,
	fido_max@inbox.ru,
	povik+lin@cutebit.org,
	arnd@arndb.de,
	harshit.m.mogalapalli@oracle.com,
	liweilei@awinic.com,
	yijiangtao@awinic.com,
	colin.i.king@gmail.com,
	trix@redhat.com,
	alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V2 0/5] ASoC: codecs: Add aw87390 amplifier driver
Date: Tue, 12 Sep 2023 14:58:47 +0800
Message-ID: <20230912065852.347000-1-wangweidong.a@awinic.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 2GMLL6J7O52NNCRTI5IJKXSK2GFYVWTT
X-Message-ID-Hash: 2GMLL6J7O52NNCRTI5IJKXSK2GFYVWTT
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2GMLL6J7O52NNCRTI5IJKXSK2GFYVWTT/>
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

v1 -> v2 : Added properties in awinic,aw88395 file
           Remove fade-enable because the functionality is
            duplicated in the aw88395 driver
           Modify dev_err_probe usage
           Delete unused header files
           Change the i2c driver name
           Modify the way a function returns a value

Weidong Wang (5):
  ASoC: dt-bindings: Adds properties to "awinic,aw88395"
  ASoC: dt-bindings: Add schema for "awinic,aw87390"
  ASoC: codecs: Add code for bin parsing compatible with aw87390
  ASoC: codecs: Change the aw88261 variable name and i2c driver name
  ASoC: codecs: Add aw87390 amplifier driver

 .../bindings/sound/awinic,aw87390.yaml        |  58 +++
 .../bindings/sound/awinic,aw88395.yaml        |  19 +
 sound/soc/codecs/Kconfig                      |  15 +-
 sound/soc/codecs/Makefile                     |   2 +
 sound/soc/codecs/aw87390.c                    | 462 ++++++++++++++++++
 sound/soc/codecs/aw87390.h                    |  85 ++++
 sound/soc/codecs/aw88261.c                    |  23 +-
 sound/soc/codecs/aw88261.h                    |   2 +-
 sound/soc/codecs/aw88395/aw88395.c            |   9 +-
 sound/soc/codecs/aw88395/aw88395.h            |   2 +-
 sound/soc/codecs/aw88395/aw88395_device.c     |  47 +-
 sound/soc/codecs/aw88395/aw88395_device.h     |   6 +-
 sound/soc/codecs/aw88395/aw88395_lib.c        |  23 +-
 sound/soc/codecs/aw88395/aw88395_reg.h        |   1 +
 14 files changed, 685 insertions(+), 69 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/awinic,aw87390.yaml
 create mode 100644 sound/soc/codecs/aw87390.c
 create mode 100644 sound/soc/codecs/aw87390.h


base-commit: 0bb80ecc33a8fb5a682236443c1e740d5c917d1d
-- 
2.41.0

