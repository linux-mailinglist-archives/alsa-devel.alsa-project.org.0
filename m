Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D34B791797
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Sep 2023 14:54:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 18830A4E;
	Mon,  4 Sep 2023 14:53:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 18830A4E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693832053;
	bh=dJKb0XitNSQJuw1nnUIiXYGcl3/HGyv8Mq49ll9MbUo=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=KHOgOz+ZXQoCYjQ2eATKtbd4SrE00aavuTI8tDgF3MIsaJC5gu+K9jzbpa3gDOluN
	 jXOYiT0xjGtYRDGE41sOXAxnfYkQ2kUnEGtb/v6J3ApPHAw/qlxTBSl9IKa9d9lnlB
	 rDKwXqF5do03N2PGyxXSKQXxf0ke4oXs7KnMN7mo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C782DF80494; Mon,  4 Sep 2023 14:53:21 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C4E52F80431;
	Mon,  4 Sep 2023 14:53:20 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 43B31F80494; Mon,  4 Sep 2023 14:53:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 41138F800AA
	for <alsa-devel@alsa-project.org>; Mon,  4 Sep 2023 14:53:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 41138F800AA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=L5l1blop
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-52889bc61b6so1884042a12.0
        for <alsa-devel@alsa-project.org>;
 Mon, 04 Sep 2023 05:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693831993; x=1694436793;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aIqjpwdpePVdstex42t0FFh/Z9QtmxZMAevrmET3IHI=;
        b=L5l1blop67UtX7SnH+ZC/khE9VddKIarBqNtdQvebuujalTOyBEgWzn8V4mmAJwLcq
         FN90n8STAf/knULSkhifsEbYoSzBK0ozZ+8ntFcX/O5FyvpI7GBOWF8UYenEBsBIcvGc
         L9C+WwHOICHKQzs1XBO5intdQyNCQn5Fzvbg7yLCERwOJt47GkBeToXexHFuTMPtoOjC
         4d3aBfMZ5CFa5V9Yy/YaLTWGpp3wTVkv7M9CTupSWfYULDddwG819d23mUsUuwj3RdYG
         WWX3GlK29wFCHW/GbuxfUREXDpSy5cqYLOONV7C87P0amy0aMbYT0XIrQoQzWC8ATkcB
         bIug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693831993; x=1694436793;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aIqjpwdpePVdstex42t0FFh/Z9QtmxZMAevrmET3IHI=;
        b=gm8ee0BiKwxQ+I4SL6kAkV+X14iJN1lKWDVcG4tECz8UOcmD+SqbYmVY2llns1Qkue
         PEVSg6OB59gpxH0P+fh/BPSiSh4grSCStUuFY/QuNRd5uTWQ5KBN8T6Rd5TYatrMZ6eD
         M3MTMLPQWhfExebt/ng1IQQX/rOYRpEZAwfdkRG1ZoWG9xnp03p30RtDzRPz8ZovuuXx
         nKn+nRSnVD7YPIhOE/x6VDYy8qg+VmWrKi8DQxUGffyeE0iIUsvX8DMEvA8qx+XouzW7
         OhVVhMktwKPL2yLHHR8GNNR2Vj+0KTxPOISyrRGbfTRw1Oplx9UVCB4Tt9qPLcMXyTEx
         6B7w==
X-Gm-Message-State: AOJu0YyvmmQ/FXKQykZNDcTdkZ2IT8+zFZ8wX/+b9rCAG0SgTvmryNRs
	llqtTWiKhVPwUJP2iADSEQgYCpQmd9iaYWqJMSI=
X-Google-Smtp-Source: 
 AGHT+IE63vfGdjyiQibNH3OTDuowtAqYlhktHoq0Mw4veIgoS2PhJ5UEmLUJzaEqGF81uazSSSFxRg==
X-Received: by 2002:a05:6402:2d1:b0:522:580f:8c75 with SMTP id
 b17-20020a05640202d100b00522580f8c75mr6774905edx.17.1693831992817;
        Mon, 04 Sep 2023 05:53:12 -0700 (PDT)
Received: from krzk-bin.. (77-252-46-238.static.ip.netia.com.pl.
 [77.252.46.238])
        by smtp.gmail.com with ESMTPSA id
 r14-20020a056402034e00b00523d2a1626esm5836842edw.6.2023.09.04.05.53.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Sep 2023 05:53:12 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Cc: wangweidong.a@awinic.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/3] ASoC: aw88261: drop undocumented, fake sync-flag property
Date: Mon,  4 Sep 2023 14:53:07 +0200
Message-Id: <20230904125309.43350-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: MR5CURCB7SL4ZZIKX46EQUKASKBNC4M2
X-Message-ID-Hash: MR5CURCB7SL4ZZIKX46EQUKASKBNC4M2
X-MailFrom: krzysztof.kozlowski@linaro.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MR5CURCB7SL4ZZIKX46EQUKASKBNC4M2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The Devicetree sync-flag property was never accepted and is not allowed
by bindings.  It is not used by any upstream user, thus considering that
it was never documented, should be dropped.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Not tested on hardware... but feature removed here could not work
according if conforming to documented interface.
---
 sound/soc/codecs/aw88261.c | 22 ++++------------------
 sound/soc/codecs/aw88261.h |  2 --
 2 files changed, 4 insertions(+), 20 deletions(-)

diff --git a/sound/soc/codecs/aw88261.c b/sound/soc/codecs/aw88261.c
index a697b5006b45..a5de7c704e73 100644
--- a/sound/soc/codecs/aw88261.c
+++ b/sound/soc/codecs/aw88261.c
@@ -633,28 +633,17 @@ static int aw88261_dev_stop(struct aw_device *aw_dev)
 	return 0;
 }
 
-static int aw88261_reg_update(struct aw88261 *aw88261, bool force)
+static int aw88261_reg_update(struct aw88261 *aw88261)
 {
 	struct aw_device *aw_dev = aw88261->aw_pa;
 	int ret;
 
-	if (force) {
-		ret = regmap_write(aw_dev->regmap,
-					AW88261_ID_REG, AW88261_SOFT_RESET_VALUE);
-		if (ret)
-			return ret;
-
+	if (aw_dev->prof_cur != aw_dev->prof_index) {
 		ret = aw88261_dev_fw_update(aw88261);
 		if (ret)
 			return ret;
 	} else {
-		if (aw_dev->prof_cur != aw_dev->prof_index) {
-			ret = aw88261_dev_fw_update(aw88261);
-			if (ret)
-				return ret;
-		} else {
-			ret = 0;
-		}
+		ret = 0;
 	}
 
 	aw_dev->prof_cur = aw_dev->prof_index;
@@ -667,7 +656,7 @@ static void aw88261_start_pa(struct aw88261 *aw88261)
 	int ret, i;
 
 	for (i = 0; i < AW88261_START_RETRIES; i++) {
-		ret = aw88261_reg_update(aw88261, aw88261->phase_sync);
+		ret = aw88261_reg_update(aw88261);
 		if (ret) {
 			dev_err(aw88261->aw_pa->dev, "fw update failed, cnt:%d\n", i);
 			continue;
@@ -1187,13 +1176,10 @@ static void aw88261_parse_channel_dt(struct aw88261 *aw88261)
 	struct aw_device *aw_dev = aw88261->aw_pa;
 	struct device_node *np = aw_dev->dev->of_node;
 	u32 channel_value = AW88261_DEV_DEFAULT_CH;
-	u32 sync_enable = false;
 
 	of_property_read_u32(np, "sound-channel", &channel_value);
-	of_property_read_u32(np, "sync-flag", &sync_enable);
 
 	aw_dev->channel = channel_value;
-	aw88261->phase_sync = sync_enable;
 }
 
 static int aw88261_init(struct aw88261 **aw88261, struct i2c_client *i2c, struct regmap *regmap)
diff --git a/sound/soc/codecs/aw88261.h b/sound/soc/codecs/aw88261.h
index 4f3dbf438510..ab9e3c52ecb6 100644
--- a/sound/soc/codecs/aw88261.h
+++ b/sound/soc/codecs/aw88261.h
@@ -452,8 +452,6 @@ struct aw88261 {
 	int frcset_en;
 	unsigned int mute_st;
 	unsigned int amppd_st;
-
-	unsigned char phase_sync;
 };
 
 #endif
-- 
2.34.1

