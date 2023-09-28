Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A768E7B18D0
	for <lists+alsa-devel@lfdr.de>; Thu, 28 Sep 2023 13:00:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0CB77E7E;
	Thu, 28 Sep 2023 12:59:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0CB77E7E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695898819;
	bh=LcES4dB99BZ2kRfi5alygAKTwlfbvnsSYmxjB4e5RtE=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=Kes/hkew2JNtwGADwvwxVrCKuTePSrQ0i/i6X7fhpz3raQKp5jUJoE8jrQXhQx5he
	 ggGims9QcZ686zRxNcOR3mBsdgOfDs1up0JnfNUe3l/cvQmnJQ/ronNHBxyuwYVxfv
	 68YUlRBmtfVdS9ly6epq92GH7oaNNaP8HbZZCGjA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6A781F805B0; Thu, 28 Sep 2023 12:58:30 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 126CFF805A0;
	Thu, 28 Sep 2023 12:58:30 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3D1CFF805A0; Thu, 28 Sep 2023 12:58:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from out28-1.mail.aliyun.com (out28-1.mail.aliyun.com
 [115.124.28.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D9B5EF805A1
	for <alsa-devel@alsa-project.org>; Thu, 28 Sep 2023 12:58:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D9B5EF805A1
X-Alimail-AntiSpam: 
 AC=CONTINUE;BC=0.1038123|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.00093891-0.000127708-0.998933;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047190;MF=wangweidong.a@awinic.com;NM=1;PH=DS;RN=30;RT=30;SR=0;TI=SMTPD_---.UqYH8d0_1695898685;
Received: from ubuntu-VirtualBox..(mailfrom:wangweidong.a@awinic.com
 fp:SMTPD_---.UqYH8d0_1695898685)
          by smtp.aliyun-inc.com;
          Thu, 28 Sep 2023 18:58:13 +0800
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
Subject: [PATCH V6 04/10] ASoC: codecs: Rename "sound-channel" to
 "awinic,audio-channel"
Date: Thu, 28 Sep 2023 18:57:21 +0800
Message-ID: <20230928105727.47273-5-wangweidong.a@awinic.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230928105727.47273-1-wangweidong.a@awinic.com>
References: <20230928105727.47273-1-wangweidong.a@awinic.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: KDJL7PBDYYH3LWK3QTV6A2KOLJHCL223
X-Message-ID-Hash: KDJL7PBDYYH3LWK3QTV6A2KOLJHCL223
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KDJL7PBDYYH3LWK3QTV6A2KOLJHCL223/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Weidong Wang <wangweidong.a@awinic.com>

Rename "sound-channel" to "awinic,audio-channel",
this is to be consistent with the "awinic,aw88395.yaml" file

Signed-off-by: Weidong Wang <wangweidong.a@awinic.com>
---
 sound/soc/codecs/aw88261.c                | 2 +-
 sound/soc/codecs/aw88395/aw88395_device.c | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/aw88261.c b/sound/soc/codecs/aw88261.c
index a697b5006b45..7df641592330 100644
--- a/sound/soc/codecs/aw88261.c
+++ b/sound/soc/codecs/aw88261.c
@@ -1189,7 +1189,7 @@ static void aw88261_parse_channel_dt(struct aw88261 *aw88261)
 	u32 channel_value = AW88261_DEV_DEFAULT_CH;
 	u32 sync_enable = false;
 
-	of_property_read_u32(np, "sound-channel", &channel_value);
+	of_property_read_u32(np, "awinic,audio-channel", &channel_value);
 	of_property_read_u32(np, "sync-flag", &sync_enable);
 
 	aw_dev->channel = channel_value;
diff --git a/sound/soc/codecs/aw88395/aw88395_device.c b/sound/soc/codecs/aw88395/aw88395_device.c
index 25b32cdceeec..5ca4172cb788 100644
--- a/sound/soc/codecs/aw88395/aw88395_device.c
+++ b/sound/soc/codecs/aw88395/aw88395_device.c
@@ -1584,15 +1584,15 @@ static void aw88395_parse_channel_dt(struct aw_device *aw_dev)
 	u32 channel_value;
 	int ret;
 
-	ret = of_property_read_u32(np, "sound-channel", &channel_value);
+	ret = of_property_read_u32(np, "awinic,audio-channel", &channel_value);
 	if (ret) {
 		dev_dbg(aw_dev->dev,
-			"read sound-channel failed,use default 0");
+			"read audio-channel failed,use default 0");
 		aw_dev->channel = AW88395_DEV_DEFAULT_CH;
 		return;
 	}
 
-	dev_dbg(aw_dev->dev, "read sound-channel value is: %d",
+	dev_dbg(aw_dev->dev, "read audio-channel value is: %d",
 			channel_value);
 	aw_dev->channel = channel_value;
 }
-- 
2.41.0

