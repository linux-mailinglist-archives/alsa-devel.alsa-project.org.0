Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D02FC69416E
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Feb 2023 10:39:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 10F46207;
	Mon, 13 Feb 2023 10:38:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 10F46207
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676281147;
	bh=vKc1OuHFB2ch7WY3s3LjqCk5OvLaMGbcCXaVMPkv8No=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=aKxiPcXyUHMjWC8wRdr10Ag+bslCi5dYMK/z70azB9Zq2KmmUI5UeM2TjZvRVaer5
	 CO4PH389xHcXwFP1oNn/dFc18tS+Rgud3LYo+zkamBqrTHZrD0uzZoY+c4S+YeqRje
	 gmY6oypEQcLiH72wpjBd2SHBoBFNBd6NDSL/40R0=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5FB45F80527;
	Mon, 13 Feb 2023 10:37:27 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 715F4F804B4; Mon, 13 Feb 2023 10:37:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from out28-171.mail.aliyun.com (out28-171.mail.aliyun.com
 [115.124.28.171])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F092AF804B0
	for <alsa-devel@alsa-project.org>; Mon, 13 Feb 2023 10:37:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F092AF804B0
X-Alimail-AntiSpam: 
 AC=CONTINUE;BC=0.08069851|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_alarm|0.00672893-0.000500749-0.99277;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047201;MF=wangweidong.a@awinic.com;NM=1;PH=DS;RN=21;RT=21;SR=0;TI=SMTPD_---.RKjcWdk_1676281011;
Received: from ubuntu-VirtualBox..(mailfrom:wangweidong.a@awinic.com
 fp:SMTPD_---.RKjcWdk_1676281011)
          by smtp.aliyun-inc.com;
          Mon, 13 Feb 2023 17:36:53 +0800
From: wangweidong.a@awinic.com
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	krzysztof.kozlowski@linaro.org,
	rf@opensource.cirrus.com,
	pierre-louis.bossart@linux.intel.com,
	ckeepax@opensource.cirrus.com,
	shumingf@realtek.com,
	herve.codina@bootlin.com,
	james.schulman@cirrus.com,
	doug@schmorgal.com,
	yang.lee@linux.alibaba.com,
	trix@redhat.com,
	colin.i.king@gmail.com,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3][next] ASoC: codecs: Modify error implicit declaration of
 function and misspelling
Date: Mon, 13 Feb 2023 17:36:46 +0800
Message-Id: <20230213093649.22928-1-wangweidong.a@awinic.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: H2IY5M27AIUFXL6QBJDKYPMOZPE667YT
X-Message-ID-Hash: H2IY5M27AIUFXL6QBJDKYPMOZPE667YT
X-MailFrom: wangweidong.a@awinic.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: wangweidong.a@awinic.com, liweilei@awinic.com, zhaolei@awinic.com,
 yijiangtao@awinic.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/H2IY5M27AIUFXL6QBJDKYPMOZPE667YT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Weidong Wang <wangweidong.a@awinic.com>

Change the function name aw88395_plack_event to aw88395_playback_event
Change hdrlen to hdr_len
Add select GPIOLIB to the sound/soc/codecs/Kconfig file

Weidong Wang (3):
  ASoC: codecs: Fixed a spelling error in the function name
  ASoC: codecs: Modify the log print statement
  ASoC: codecs: Modify error: implicit declaration of  function
    'gpiod_set_value_cansleep'

 sound/soc/codecs/Kconfig               | 1 +
 sound/soc/codecs/aw88395/aw88395.c     | 4 ++--
 sound/soc/codecs/aw88395/aw88395_lib.c | 2 +-
 3 files changed, 4 insertions(+), 3 deletions(-)


base-commit: 6ba8a227fd19d19779005fb66ad7562608e1df83
-- 
2.39.1

