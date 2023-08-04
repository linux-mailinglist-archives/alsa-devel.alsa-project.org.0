Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BB1AF76FFAC
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Aug 2023 13:49:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7CD297F4;
	Fri,  4 Aug 2023 13:48:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7CD297F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691149749;
	bh=U70QTvNrQQhyZ3DojI8omsfooMX+wY3vSldK+/sAZhE=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=aVWvKwnF3jqcjrmqhpc3jUmW37bGMjKQ39+7wMILT5wCl6cBkc1h1kGdbK6lgOrDD
	 uFRG6yzh3MU5EFAShHmjoCDexE6d2s4yCXVVlvBe2e7p+X41fBrZT5B1n/jF4njtMa
	 gQ1/cZQgOZGwYSFJpdnvKrlOSBN8Q/H6uDOjS6MA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 94BF6F802BE; Fri,  4 Aug 2023 13:48:18 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D5D84F802BE;
	Fri,  4 Aug 2023 13:48:17 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3EA5CF80520; Fri,  4 Aug 2023 13:48:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from out28-101.mail.aliyun.com (out28-101.mail.aliyun.com
 [115.124.28.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3C2B0F80087
	for <alsa-devel@alsa-project.org>; Fri,  4 Aug 2023 13:48:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3C2B0F80087
X-Alimail-AntiSpam: 
 AC=CONTINUE;BC=0.1588763|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.00334653-3.04391e-05-0.996623;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047192;MF=wangweidong.a@awinic.com;NM=1;PH=DS;RN=25;RT=25;SR=0;TI=SMTPD_---.U8VaX1a_1691149673;
Received: from ubuntu-VirtualBox..(mailfrom:wangweidong.a@awinic.com
 fp:SMTPD_---.U8VaX1a_1691149673)
          by smtp.aliyun-inc.com;
          Fri, 04 Aug 2023 19:47:55 +0800
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
	shumingf@realtek.com,
	herve.codina@bootlin.com,
	13916275206@139.com,
	ryans.lee@analog.com,
	ckeepax@opensource.cirrus.com,
	sebastian.reichel@collabora.com,
	ajye_huang@compal.corp-partner.google.com,
	povik+lin@cutebit.org,
	yijiangtao@awinic.com,
	trix@redhat.com,
	colin.i.king@gmail.com,
	liweilei@awinic.com,
	alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: zhangjianming@awinic.com
Subject: [PATCH V4 0/3] ASoC: codecs: Add awinic AW88261 audio amplifier
 driver
Date: Fri,  4 Aug 2023 19:47:46 +0800
Message-ID: <20230804114749.215460-1-wangweidong.a@awinic.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: HDGVWTN3LGSOJU3WT6RCMC6ES652TCGB
X-Message-ID-Hash: HDGVWTN3LGSOJU3WT6RCMC6ES652TCGB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HDGVWTN3LGSOJU3WT6RCMC6ES652TCGB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Weidong Wang <wangweidong.a@awinic.com>

The awinic AW88261 is an I2S/TDM input, high efficiency
digital Smart K audio amplifier

v3 -> v4: Modify the dev_err_probe usage
          Changed the use of sizeof in kzalloc
          Changed the function name
          Merge aw88261_device.c into aw88261.c

Weidong Wang (3):
  ASoC: dt-bindings: Add schema for "awinic,aw88261"
  ASoC: codecs: Add code for bin parsing compatible with aw88261
  ASoC: codecs: Add aw88261 amplifier driver

 .../bindings/sound/awinic,aw88395.yaml        |    4 +-
 sound/soc/codecs/Kconfig                      |   15 +
 sound/soc/codecs/Makefile                     |    2 +
 sound/soc/codecs/aw88261.c                    | 1298 +++++++++++++++++
 sound/soc/codecs/aw88261.h                    |  459 ++++++
 sound/soc/codecs/aw88395/aw88395_lib.c        |  193 ++-
 sound/soc/codecs/aw88395/aw88395_reg.h        |    1 +
 7 files changed, 1954 insertions(+), 18 deletions(-)
 create mode 100644 sound/soc/codecs/aw88261.c
 create mode 100644 sound/soc/codecs/aw88261.h


base-commit: c1a515d3c0270628df8ae5f5118ba859b85464a2
-- 
2.41.0

