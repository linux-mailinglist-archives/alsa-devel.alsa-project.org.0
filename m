Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 499E87B18D4
	for <lists+alsa-devel@lfdr.de>; Thu, 28 Sep 2023 13:01:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 57378DF8;
	Thu, 28 Sep 2023 13:00:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 57378DF8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695898884;
	bh=AFz9J4YLfj4MsuuqLYXvRgRtjU07b73FmsQ/m+KojjU=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=t8ZlRgj5+KpxFliO87+L9ZfEMV6+jLolWQ6ecw1/CoCmaqAqIj/vEd7DaBsBwtxna
	 6qhPj6X6vH59OJ5mggF3v2SOdJjRtgTYXpxp9lQxpdw5vk1CONJGo/AntIi+ckCkff
	 GqeEjL9oenTy9Oe6k3bZTs8AoP1R1PFG2Tj3xEkw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C3F47F805D6; Thu, 28 Sep 2023 12:58:58 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 77C90F8057D;
	Thu, 28 Sep 2023 12:58:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AE1A3F805D5; Thu, 28 Sep 2023 12:58:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from out28-100.mail.aliyun.com (out28-100.mail.aliyun.com
 [115.124.28.100])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 09737F80552
	for <alsa-devel@alsa-project.org>; Thu, 28 Sep 2023 12:58:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 09737F80552
X-Alimail-AntiSpam: 
 AC=CONTINUE;BC=0.09813568|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_social|0.00100706-9.29909e-05-0.9989;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047190;MF=wangweidong.a@awinic.com;NM=1;PH=DS;RN=30;RT=30;SR=0;TI=SMTPD_---.UqYH9DX_1695898719;
Received: from ubuntu-VirtualBox..(mailfrom:wangweidong.a@awinic.com
 fp:SMTPD_---.UqYH9DX_1695898719)
          by smtp.aliyun-inc.com;
          Thu, 28 Sep 2023 18:58:47 +0800
From: wangweidong.a@awinic.com
To: girdwood@gmail.com,
	broonie@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	wangweidong.a@awinic.com,
	rf@opensource.cirrus.com,
	shumingf@realtek.com,
	herve.codina@bootlin.com,
	rdunlap@infradead.org,
	13916275206@139.com,
	ryans.lee@analog.com,
	linus.walleij@linaro.org,
	ckeepax@opensource.cirrus.com,
	doug@schmorgal.com,
	ajye_huang@compal.corp-partner.google.com,
	harshit.m.mogalapalli@oracle.com,
	arnd@arndb.de,
	yang.lee@linux.alibaba.com,
	u.kleine-koenig@pengutronix.de,
	liweilei@awinic.com,
	yijiangtao@awinic.com,
	trix@redhat.com,
	dan.carpenter@linaro.org,
	colin.i.king@gmail.com,
	alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V6 08/10] ASoC: codecs: Rename "sync-flag" to
 "awinic,sync-flag"
Date: Thu, 28 Sep 2023 18:57:25 +0800
Message-ID: <20230928105727.47273-9-wangweidong.a@awinic.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230928105727.47273-1-wangweidong.a@awinic.com>
References: <20230928105727.47273-1-wangweidong.a@awinic.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: JL43KFANRTIE3U5WARVHDPVKX26IUJNX
X-Message-ID-Hash: JL43KFANRTIE3U5WARVHDPVKX26IUJNX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JL43KFANRTIE3U5WARVHDPVKX26IUJNX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Weidong Wang <wangweidong.a@awinic.com>

Rename "sync-flag" to "awinic,sync-flag", this is to be
consistent with the "awinic,aw88395.yaml" file

Signed-off-by: Weidong Wang <wangweidong.a@awinic.com>
---
 sound/soc/codecs/aw88261.c | 4 +---
 sound/soc/codecs/aw88261.h | 2 +-
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/aw88261.c b/sound/soc/codecs/aw88261.c
index 7df641592330..61179e235fbf 100644
--- a/sound/soc/codecs/aw88261.c
+++ b/sound/soc/codecs/aw88261.c
@@ -1187,13 +1187,11 @@ static void aw88261_parse_channel_dt(struct aw88261 *aw88261)
 	struct aw_device *aw_dev = aw88261->aw_pa;
 	struct device_node *np = aw_dev->dev->of_node;
 	u32 channel_value = AW88261_DEV_DEFAULT_CH;
-	u32 sync_enable = false;
 
 	of_property_read_u32(np, "awinic,audio-channel", &channel_value);
-	of_property_read_u32(np, "sync-flag", &sync_enable);
+	aw88261->phase_sync = of_property_read_bool(np, "awinic,sync-flag");
 
 	aw_dev->channel = channel_value;
-	aw88261->phase_sync = sync_enable;
 }
 
 static int aw88261_init(struct aw88261 **aw88261, struct i2c_client *i2c, struct regmap *regmap)
diff --git a/sound/soc/codecs/aw88261.h b/sound/soc/codecs/aw88261.h
index bd0841fa9b77..734d0f93ced9 100644
--- a/sound/soc/codecs/aw88261.h
+++ b/sound/soc/codecs/aw88261.h
@@ -453,7 +453,7 @@ struct aw88261 {
 	unsigned int mute_st;
 	unsigned int amppd_st;
 
-	unsigned char phase_sync;
+	bool phase_sync;
 };
 
 #endif
-- 
2.41.0

