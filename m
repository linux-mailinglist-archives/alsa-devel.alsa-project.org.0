Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 18A5675EB80
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Jul 2023 08:29:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 801BE83E;
	Mon, 24 Jul 2023 08:28:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 801BE83E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690180169;
	bh=F2V6LJZ0KVEg7UWFdZRvsEqJC/Sh63fRdPzTceE5Gd0=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=oqI5nm8Gd922V2dzndEDrwT1mxrkqKpku0DhD37Fr2rJrG7V48jiZS9QT+xBfsv9t
	 JpGhbjW9eoXSU2ylQQbIM18UV9uqyyjyQk9duKLJuoVsNSJGZN2kHf3Re39X/wrk33
	 +ma1REJb6+Tgfrf/rHiNIYB9TfAP/7jZ8JbYzqcs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DBA6DF8055B; Mon, 24 Jul 2023 08:27:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DBC8CF80310;
	Mon, 24 Jul 2023 08:27:48 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0CED5F8019B; Sun, 23 Jul 2023 09:23:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HELO_DYNAMIC_IPADDR,
	RCVD_IN_DNSWL_HI,RDNS_DYNAMIC,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from out203-205-221-210.mail.qq.com (out203-205-221-210.mail.qq.com
 [203.205.221.210])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2CBF4F800D2
	for <alsa-devel@alsa-project.org>; Sun, 23 Jul 2023 09:23:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2CBF4F800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=foxmail.com header.i=@foxmail.com header.a=rsa-sha256
 header.s=s201512 header.b=HR8t/7nZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1690096984;
	bh=uA1bQ6F3ScWTXuQJewjURf1TMDBQ+1aeSJ31bGjC9EM=;
	h=From:To:Cc:Subject:Date;
	b=HR8t/7nZch5w/7x3CAlnp0uundcxkao+AUPmUW36B/pU9csOicHC7B91ilPd70pFs
	 xuOxx8KRD0LOQNnaJHP5aDlEmN763xLnjec3df/u+fx4ls41nmeUnD5H0+Mwx/M7Mm
	 HKdM4XAQQZI72xjMNgdMBx7cwDajgNe95yuQkpz8=
Received: from localhost.ust.hk ([175.159.123.184])
	by newxmesmtplogicsvrszb6-0.qq.com (NewEsmtp) with SMTP
	id 5C20A80A; Sun, 23 Jul 2023 15:23:02 +0800
X-QQ-mid: xmsmtpt1690096982tdwknz5eh
Message-ID: <tencent_F05F5B0860B41E180AA0A88B1279376CB508@qq.com>
X-QQ-XMAILINFO: NyTsQ4JOu2J2rgist0z0wskKoEKHyOVxX9Znkpt5bRhyb9VtAdlhIo6i1JhRyg
	 85XVjr7LzqQo2hEvAHNer49d4uxQ88lRWNu2DBWPx/apGj1htvBM9b39kq4WGUwjmpbS7+F02Ela
	 4Pj9yaYx6k/2fG9n017Eurar/JQdprpZAlckyqkjl9Fij8eY3c14jwVbjD9qjUDJf7ny7QrCQGcC
	 dZZlqF/ScYLAwKa/jFhk7aO6ahmyjNI7GSGMB9Yt5c0TPVXP8y6g+WZ5okYDfcH0o+cn0KayxY+g
	 wDICZtJmz14b9XRWpGLX1JCC9U2dPJJpbTw+13STSNpfZO2Pi2hjVyKq2JyuIqi6bR44TFTtevqV
	 JolNeNAc2qWl5TYG2SR7pihCnKahwWkJy2LQrI4LYe65p/B25enCeBrwh5O3AE4UrN5bcmJVmxiv
	 o3MLjpSSiZQ9Ckz4I3Sb7h5f0fXHe207Ew2qewUPrMnI1kohVI9QQ+dHv4aZDJrAHTe5Ro8XQKxh
	 ue8+vLNKuAeciSgz3+jgyIh6XcnWeeKtC9A9HA7/jfrZh3O67j8rIOgvk7b3Ena9SNYMlyb7xrPm
	 blS30s0AVXNN0d3lOFJxOVejmqI04DHSLwjiwHoRxDF+8Amlri0sHdoQwmxuXyk/Zm7JEIY9Xvo0
	 Km2cgdM7gIm4aUA512Nu7fja0lcEatO76b3oZ9BHIf8Q8xaXOOvXugR7Qp3tuoZYowoBLnBeT5zm
	 0SPi6lZdFBOcbeJNIkAwg8tC6LUJNQwkqxGXxaVVqBQ6/yKZ9hKdP0cSroP98+uetd4Fv/YfKDrw
	 dEhQAW3Jq1ZXIFA3WvoXM5kfd+k/BU6l4Cr098EzrnGRD//nc/hqTRo9KLRBTsS+QE/wYHdMQAgK
	 nepDWb81U6x9HL8ODKEY38Q8MS07KI5UfoiUeWzteNsTXh0YhNzTCkCD8pwa11gKZnetZkwlt1NP
	 J9HKq5GilOccBRXSTwzW2C2DihRBsZQRpSwqGMaRAGD79UOr1C7ui0sOPtYJL1pjgT0DkxdWIz2X
	 GiKSkujIgCutDdrN7+
X-QQ-XMRINFO: NyFYKkN4Ny6FSmKK/uo/jdU=
From: Zhang Shurong <zhang_shurong@foxmail.com>
To: oder_chiou@realtek.com
Cc: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	Zhang Shurong <zhang_shurong@foxmail.com>
Subject: [PATCH] ASoC: rt5668: add missed regulator_bulk_disable
Date: Sun, 23 Jul 2023 15:23:01 +0800
X-OQ-MSGID: <20230723072301.10106-1-zhang_shurong@foxmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: zhang_shurong@foxmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: ZV3GZVNWKMXM54AYV5MBMKKI7NK6I6B6
X-Message-ID-Hash: ZV3GZVNWKMXM54AYV5MBMKKI7NK6I6B6
X-Mailman-Approved-At: Mon, 24 Jul 2023 06:27:21 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZV3GZVNWKMXM54AYV5MBMKKI7NK6I6B6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The driver forgets to call regulator_bulk_disable()

Add the missed call to fix it.

Fixes: d59fb2856223 ("ASoC: rt5668: add rt5668B codec driver")
Signed-off-by: Zhang Shurong <zhang_shurong@foxmail.com>
---
 sound/soc/codecs/rt5668.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/sound/soc/codecs/rt5668.c b/sound/soc/codecs/rt5668.c
index f04c810fd710..d66c9e9b9185 100644
--- a/sound/soc/codecs/rt5668.c
+++ b/sound/soc/codecs/rt5668.c
@@ -2452,6 +2452,13 @@ static void rt5668_calibrate(struct rt5668_priv *rt5668)
 
 }
 
+static void rt5668_i2c_disable_regulators(void *data)
+{
+	struct rt5668_priv *rt5668 = data;
+
+	regulator_bulk_disable(ARRAY_SIZE(rt5668->supplies), rt5668->supplies);
+}
+
 static int rt5668_i2c_probe(struct i2c_client *i2c)
 {
 	struct rt5668_platform_data *pdata = dev_get_platdata(&i2c->dev);
@@ -2490,6 +2497,11 @@ static int rt5668_i2c_probe(struct i2c_client *i2c)
 		return ret;
 	}
 
+	ret = devm_add_action_or_reset(&i2c->dev, rt5668_i2c_disable_regulators,
+			rt5668);
+	if (ret)
+		return ret;
+
 	ret = regulator_bulk_enable(ARRAY_SIZE(rt5668->supplies),
 				    rt5668->supplies);
 	if (ret != 0) {
-- 
2.41.0

