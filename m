Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EB8E694172
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Feb 2023 10:39:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 585FF847;
	Mon, 13 Feb 2023 10:38:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 585FF847
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676281167;
	bh=KjwcqPPyVysCNEXgm49rjUUyqorecBzFx7iFhVajNwk=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=kUHuakvCAUiejPirpeUWcjLFao4N03dJt2HmuYnroyzmxn4NL2FWePOFA9FPtXbbG
	 DVMapMkSNVv2q6Atz15e889mlL46y6/F0l/FHucnYre3grCaSzTroXxVq+26AE3e02
	 KBmgHqGyRaw/58xzjTVOKKEF75Wh0BXnjFzhpKt0=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5E42AF80534;
	Mon, 13 Feb 2023 10:37:35 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0B74FF804B0; Mon, 13 Feb 2023 10:37:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from out28-77.mail.aliyun.com (out28-77.mail.aliyun.com
 [115.124.28.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BFB35F804D6
	for <alsa-devel@alsa-project.org>; Mon, 13 Feb 2023 10:37:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BFB35F804D6
X-Alimail-AntiSpam: 
 AC=CONTINUE;BC=0.1776371|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.0848819-0.000824855-0.914293;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047213;MF=wangweidong.a@awinic.com;NM=1;PH=DS;RN=21;RT=21;SR=0;TI=SMTPD_---.RKjcWqW_1676281017;
Received: from ubuntu-VirtualBox..(mailfrom:wangweidong.a@awinic.com
 fp:SMTPD_---.RKjcWqW_1676281017)
          by smtp.aliyun-inc.com;
          Mon, 13 Feb 2023 17:36:58 +0800
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
Subject: [PATCH 3/3][next] ASoC: codecs: Modify error implicit declaration of
  function 'gpiod_set_value_cansleep'
Date: Mon, 13 Feb 2023 17:36:49 +0800
Message-Id: <20230213093649.22928-4-wangweidong.a@awinic.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230213093649.22928-1-wangweidong.a@awinic.com>
References: <20230213093649.22928-1-wangweidong.a@awinic.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: FRSKFJ2CKQIWSDCOUIWGT4KIFF4SRZXI
X-Message-ID-Hash: FRSKFJ2CKQIWSDCOUIWGT4KIFF4SRZXI
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FRSKFJ2CKQIWSDCOUIWGT4KIFF4SRZXI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Weidong Wang <wangweidong.a@awinic.com>

Add select GPIOLIB to the sound/soc/codecs/Kconfig file

Signed-off-by: Ben Yi <yijiangtao@awinic.com>
Signed-off-by: Weidong Wang <wangweidong.a@awinic.com>
---
 sound/soc/codecs/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index ab7b0696d01d..4621674e68bf 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -614,6 +614,7 @@ config SND_SOC_AW88395
 	select CRC8
 	select CRC32
 	select REGMAP_I2C
+	select GPIOLIB
 	select SND_SOC_AW88395_LIB
 	help
 	  this option enables support for aw88395 Smart PA.
-- 
2.39.1

