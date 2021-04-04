Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 60DF735376F
	for <lists+alsa-devel@lfdr.de>; Sun,  4 Apr 2021 10:32:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E386316B4;
	Sun,  4 Apr 2021 10:31:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E386316B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617525158;
	bh=qAPOEVnKw/3YtoEMZ4OttOn1MF5xbIuuDlIPJVxSmp4=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=CokH5Y5jI3l4WcO6zY5g1pK73NhXnBlaLC2sOgRMbD0cE8aM+Xk+83R37aAvaoaMH
	 QV+xTLXOjXqFjGOVuHDqGM/pp/axDAv6N5Mr9y6+LtsjKrosHca7bKulTPv0qp4Uj5
	 YKSqOQRAbcgQgpa1xqgx0Q/OcPWi8o/7e3TuxomU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5C8CAF80168;
	Sun,  4 Apr 2021 10:31:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5741BF8020B; Sun,  4 Apr 2021 10:31:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 31287F80127
 for <alsa-devel@alsa-project.org>; Sun,  4 Apr 2021 10:30:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 31287F80127
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="xIlhusgk"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="GAQBQLT+"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id D2BAE1611;
 Sun,  4 Apr 2021 04:30:53 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Sun, 04 Apr 2021 04:30:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm1; bh=VU2VstdLeCQQJj8nCS0ZUr+xYp
 8GuzyY5oADpX0ITic=; b=xIlhusgk4ZR9YSuXqQjwPRv+bS+aIlScQwb23r5MUw
 pid8RhaPgrq8piwGG1I+mKAig8IDCBZZKj6XUHepaT5fvZOAa7Vm6nhhtKmWBje/
 J70KuaUR6eBumriNN8BpssohljSXxr4iNEZseJmpRikif8g5yuvOCRRdqWdkPw6d
 Wp5rffI17tsEXR+rutvn2n8/fb1u3RI0GukRfHOS9M6D/fz2secBnqPNrEY67B4I
 m3WNpHgmGMkcaE3P+N5kWCuItJmhbAwy86ptXLCQlvOOrAXckboSHx6gpfuLCEys
 QWVs3YEt7gnoaJTi26sFxcFDbrpQ/FLYVH99J8AiKjyQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=VU2VstdLeCQQJj8nC
 S0ZUr+xYp8GuzyY5oADpX0ITic=; b=GAQBQLT+d4F6kZVQM3HhcaFj0/P0BqZuD
 Vk1aahrxUrhxop2V9LHgLAnRtyqFBVaMi9m/Iw/km5qDzsyFydeuZE233mUxoK9V
 2047/RIXBpOwDf1qUgnNehrW0u8naG0w5Fjno2MGI8OPfdPJ+NPvAR9RlFqDXJxv
 do8WunopcEgMN+UXE1xUBIeFC4vtykFe6T+OX8FhIwPcKPYbJJsSCh1jLqTY6e2/
 /dwIbF3DT0gnY7b0yQ1Zg9y+1yLZppWwtgbYaW4QTcObFHyWZXCrsM3sf9ajuHI6
 N/+l88wTuwCHdnSLklnlnvO0lzX1/+OHXnAhMlmwp2Sj9gcE/e7/g==
X-ME-Sender: <xms:PHlpYLQK2uUHfZfOsPTdVxMANjKBWhm7NURVE1fcoGZkg8fkIo2l3A>
 <xme:PHlpYMxiWgFJ-FPMJ3ivcrbd0nbD1gz8XTyWcrRqgvz7xEntpzo0f065eweRT7xQ5
 wkVhDQJoL_mNFuIhm0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudejtddgtdegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
 dttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhh
 ihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepudejteelhfdttd
 ekgfdtueeilefhgfetjeejheekgeevuddvveegieehueeukeejnecukfhppedugedrfedr
 ieehrddujeehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
 homhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:PHlpYA2xr7tamTFzgRv0C-hnG6veb_lZPgupKMy8kWI6UxAxQ5g8ow>
 <xmx:PHlpYLB8v4U8xEPEzkR5bkkT4sr2imu9Qd_lo7vltH9P5fFZNYi29g>
 <xmx:PHlpYEj7EcvJXTSkeIGCCZ3SMxthxtfdjVOH7QInNUljKATnr9smRA>
 <xmx:PXlpYMICyyLf1z7F_dxwQq89S-TVBrOAWKUKfJ3LKAXCQ_C8UhlRkA>
Received: from workstation.flets-east.jp (ae065175.dynamic.ppp.asahi-net.or.jp
 [14.3.65.175])
 by mail.messagingengine.com (Postfix) with ESMTPA id C01021080054;
 Sun,  4 Apr 2021 04:30:51 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de,
	perex@perex.cz
Subject: [PATCH] ALSA: control_led: use helper macro to declare device
 attributes with specific permission
Date: Sun,  4 Apr 2021 17:30:47 +0900
Message-Id: <20210404083047.71048-1-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org
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

It's preferable to use DEVICE_ATTR_XXX() for device attributes with
specific permission instead of DEVICE_ATTR() basis macro.

Fixes: 22d8de62f11b ("ALSA: control - add generic LED trigger module as the new control layer")
Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/core/control_led.c | 37 +++++++++++++++++--------------------
 1 file changed, 17 insertions(+), 20 deletions(-)

diff --git a/sound/core/control_led.c b/sound/core/control_led.c
index 788fd9e275e0..99c5d503638f 100644
--- a/sound/core/control_led.c
+++ b/sound/core/control_led.c
@@ -371,8 +371,7 @@ static void snd_ctl_led_disconnect(struct snd_card *card)
  * sysfs
  */
 
-static ssize_t show_mode(struct device *dev,
-			 struct device_attribute *attr, char *buf)
+static ssize_t mode_show(struct device *dev, struct device_attribute *attr, char *buf)
 {
 	struct snd_ctl_led *led = container_of(dev, struct snd_ctl_led, dev);
 	const char *str;
@@ -386,8 +385,8 @@ static ssize_t show_mode(struct device *dev,
 	return sprintf(buf, "%s\n", str);
 }
 
-static ssize_t store_mode(struct device *dev, struct device_attribute *attr,
-			  const char *buf, size_t count)
+static ssize_t mode_store(struct device *dev, struct device_attribute *attr, const char *buf,
+			  size_t count)
 {
 	struct snd_ctl_led *led = container_of(dev, struct snd_ctl_led, dev);
 	char _buf[16];
@@ -415,16 +414,15 @@ static ssize_t store_mode(struct device *dev, struct device_attribute *attr,
 	return count;
 }
 
-static ssize_t show_brightness(struct device *dev,
-			       struct device_attribute *attr, char *buf)
+static ssize_t brightness_show(struct device *dev, struct device_attribute *attr, char *buf)
 {
 	struct snd_ctl_led *led = container_of(dev, struct snd_ctl_led, dev);
 
 	return sprintf(buf, "%u\n", ledtrig_audio_get(led->trigger_type));
 }
 
-static DEVICE_ATTR(mode, 0644, show_mode, store_mode);
-static DEVICE_ATTR(brightness, 0444, show_brightness, NULL);
+static DEVICE_ATTR_RW(mode);
+static DEVICE_ATTR_RO(brightness);
 
 static struct attribute *snd_ctl_led_dev_attrs[] = {
 	&dev_attr_mode.attr,
@@ -558,22 +556,22 @@ static ssize_t set_led_id(struct snd_ctl_led_card *led_card, const char *buf, si
 	return count;
 }
 
-static ssize_t parse_attach(struct device *dev, struct device_attribute *attr,
-			    const char *buf, size_t count)
+static ssize_t attach_store(struct device *dev, struct device_attribute *attr, const char *buf,
+			    size_t count)
 {
 	struct snd_ctl_led_card *led_card = container_of(dev, struct snd_ctl_led_card, dev);
 	return set_led_id(led_card, buf, count, true);
 }
 
-static ssize_t parse_detach(struct device *dev, struct device_attribute *attr,
-			    const char *buf, size_t count)
+static ssize_t detach_store(struct device *dev, struct device_attribute *attr, const char *buf,
+			    size_t count)
 {
 	struct snd_ctl_led_card *led_card = container_of(dev, struct snd_ctl_led_card, dev);
 	return set_led_id(led_card, buf, count, false);
 }
 
-static ssize_t ctl_reset(struct device *dev, struct device_attribute *attr,
-			 const char *buf, size_t count)
+static ssize_t reset_store(struct device *dev, struct device_attribute *attr, const char *buf,
+			   size_t count)
 {
 	struct snd_ctl_led_card *led_card = container_of(dev, struct snd_ctl_led_card, dev);
 	int err;
@@ -586,8 +584,7 @@ static ssize_t ctl_reset(struct device *dev, struct device_attribute *attr,
 	return count;
 }
 
-static ssize_t ctl_list(struct device *dev,
-			struct device_attribute *attr, char *buf)
+static ssize_t list_show(struct device *dev, struct device_attribute *attr, char *buf)
 {
 	struct snd_ctl_led_card *led_card = container_of(dev, struct snd_ctl_led_card, dev);
 	struct snd_card *card;
@@ -620,10 +617,10 @@ static ssize_t ctl_list(struct device *dev,
 	return buf2 - buf;
 }
 
-static DEVICE_ATTR(attach, 0200, NULL, parse_attach);
-static DEVICE_ATTR(detach, 0200, NULL, parse_detach);
-static DEVICE_ATTR(reset, 0200, NULL, ctl_reset);
-static DEVICE_ATTR(list, 0444, ctl_list, NULL);
+static DEVICE_ATTR_WO(attach);
+static DEVICE_ATTR_WO(detach);
+static DEVICE_ATTR_WO(reset);
+static DEVICE_ATTR_RO(list);
 
 static struct attribute *snd_ctl_led_card_attrs[] = {
 	&dev_attr_attach.attr,
-- 
2.27.0

