Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 72BFB2E32DE
	for <lists+alsa-devel@lfdr.de>; Sun, 27 Dec 2020 22:17:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 01D3D17AA;
	Sun, 27 Dec 2020 22:17:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 01D3D17AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1609103879;
	bh=tp457z1sgx3wayrw71wcCYr8XuJwA0ZKje4gLro2Y9Y=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CqKnqwzD15tOXB+5sYml2s/xxxF/eCMCWKh19uGEapkxX2OXpbrAR/fveaSJUvgf1
	 ns9UeVDj9cTQBnoPbwDqb42F1fTqmOqyguh7wyjETV7xj+cTNQmDUIl6y9vApAPmNf
	 l56iAwXdhyReGi7u7QrvdzmsCmI4VGMNKqfNpNlk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D80E4F80519;
	Sun, 27 Dec 2020 22:13:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C6DF6F80506; Sun, 27 Dec 2020 22:13:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0CA13F804ED
 for <alsa-devel@alsa-project.org>; Sun, 27 Dec 2020 22:13:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0CA13F804ED
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="U/5BFl3c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609103585;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BQxH9sfLP7XIGfK19mSlNx10DBn63OAUabiHWwiQZDU=;
 b=U/5BFl3cJogmwWFz5vmvu8ofQeY7J36p6FVNG8t/S8g5jq0tRjDqFvCFwPl8nQjt65mnCZ
 S7NCDLDfa8+d228poE0Z/3VPlChVSme0FHCI/007lfQHnZnRYqYcHENsOb/jldA7E5VdRN
 fS0LXcMY4/BITG3GZj7FZZomQqjqL/8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-332-Zx5DIo6UMRCFaw8hnoxYng-1; Sun, 27 Dec 2020 16:13:00 -0500
X-MC-Unique: Zx5DIo6UMRCFaw8hnoxYng-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 373811800D42;
 Sun, 27 Dec 2020 21:12:59 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-112-25.ams2.redhat.com [10.36.112.25])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 08FFF1ACB9;
 Sun, 27 Dec 2020 21:12:56 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Lee Jones <lee.jones@linaro.org>, MyungJoo Ham <myungjoo.ham@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Jie Yang <yang.jie@linux.intel.com>, Mark Brown <broonie@kernel.org>
Subject: [PATCH 09/14] extcon: arizona: Add arizona_set_extcon_state() helper
Date: Sun, 27 Dec 2020 22:12:27 +0100
Message-Id: <20201227211232.117801-10-hdegoede@redhat.com>
In-Reply-To: <20201227211232.117801-1-hdegoede@redhat.com>
References: <20201227211232.117801-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Cc: Hans de Goede <hdegoede@redhat.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
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

All the callers of extcon_set_state_sync() log an error on failure,
without doing any further error-handling (as there is nothing they
can do about the error).

Factor this out into a helper to remove some duplicate code.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/extcon/extcon-arizona.c | 47 ++++++++++++---------------------
 1 file changed, 17 insertions(+), 30 deletions(-)

diff --git a/drivers/extcon/extcon-arizona.c b/drivers/extcon/extcon-arizona.c
index 145ca5cd40d5..d5b3231744f9 100644
--- a/drivers/extcon/extcon-arizona.c
+++ b/drivers/extcon/extcon-arizona.c
@@ -595,6 +595,16 @@ static int arizona_hpdet_do_id(struct arizona_extcon_info *info, int *reading,
 	return 0;
 }
 
+static void arizona_set_extcon_state(struct arizona_extcon_info *info,
+				     unsigned int id, bool state)
+{
+	int ret;
+
+	ret = extcon_set_state_sync(info->edev, id, state);
+	if (ret)
+		dev_err(info->arizona->dev, "Failed to set extcon state: %d\n", ret);
+}
+
 static irqreturn_t arizona_hpdet_irq(int irq, void *data)
 {
 	struct arizona_extcon_info *info = data;
@@ -648,11 +658,7 @@ static irqreturn_t arizona_hpdet_irq(int irq, void *data)
 	else
 		report = EXTCON_JACK_HEADPHONE;
 
-	ret = extcon_set_state_sync(info->edev, report, true);
-	if (ret != 0)
-		dev_err(arizona->dev, "Failed to report HP/line: %d\n",
-			ret);
-
+	arizona_set_extcon_state(info, report, true);
 done:
 	/* Reset back to starting range */
 	regmap_update_bits(arizona->regmap,
@@ -727,9 +733,7 @@ static void arizona_identify_headphone(struct arizona_extcon_info *info)
 	pm_runtime_put_autosuspend(info->dev);
 
 	/* Just report headphone */
-	ret = extcon_set_state_sync(info->edev, EXTCON_JACK_HEADPHONE, true);
-	if (ret != 0)
-		dev_err(arizona->dev, "Failed to report headphone: %d\n", ret);
+	arizona_set_extcon_state(info, EXTCON_JACK_HEADPHONE, true);
 
 	if (info->mic)
 		arizona_start_mic(info);
@@ -781,10 +785,7 @@ static void arizona_start_hpdet_acc_id(struct arizona_extcon_info *info)
 
 err:
 	/* Just report headphone */
-	ret = extcon_set_state_sync(info->edev, EXTCON_JACK_HEADPHONE, true);
-	if (ret != 0)
-		dev_err(arizona->dev, "Failed to report headphone: %d\n", ret);
-
+	arizona_set_extcon_state(info, EXTCON_JACK_HEADPHONE, true);
 	info->hpdet_active = false;
 }
 
@@ -904,11 +905,7 @@ static int arizona_micdet_reading(void *priv)
 
 		arizona_identify_headphone(info);
 
-		ret = extcon_set_state_sync(info->edev,
-					      EXTCON_JACK_MICROPHONE, true);
-		if (ret != 0)
-			dev_err(arizona->dev, "Headset report failed: %d\n",
-				ret);
+		arizona_set_extcon_state(info, EXTCON_JACK_MICROPHONE, true);
 
 		/* Don't need to regulate for button detection */
 		ret = regulator_allow_bypass(info->micvdd, true);
@@ -1175,12 +1172,7 @@ static irqreturn_t arizona_jackdet(int irq, void *data)
 
 	if (info->last_jackdet == present) {
 		dev_dbg(arizona->dev, "Detected jack\n");
-		ret = extcon_set_state_sync(info->edev,
-					      EXTCON_MECHANICAL, true);
-
-		if (ret != 0)
-			dev_err(arizona->dev, "Mechanical report failed: %d\n",
-				ret);
+		arizona_set_extcon_state(info, EXTCON_MECHANICAL, true);
 
 		info->detecting = true;
 		info->mic = false;
@@ -1216,13 +1208,8 @@ static irqreturn_t arizona_jackdet(int irq, void *data)
 					 info->micd_ranges[i].key, 0);
 		input_sync(info->input);
 
-		for (i = 0; i < ARRAY_SIZE(arizona_cable) - 1; i++) {
-			ret = extcon_set_state_sync(info->edev,
-					arizona_cable[i], false);
-			if (ret != 0)
-				dev_err(arizona->dev,
-					"Removal report failed: %d\n", ret);
-		}
+		for (i = 0; i < ARRAY_SIZE(arizona_cable) - 1; i++)
+			arizona_set_extcon_state(info, arizona_cable[i], false);
 
 		/*
 		 * If the jack was removed during a headphone detection we
-- 
2.28.0

