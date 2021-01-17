Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C86642F93CE
	for <lists+alsa-devel@lfdr.de>; Sun, 17 Jan 2021 17:08:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 37D39176B;
	Sun, 17 Jan 2021 17:08:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 37D39176B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610899735;
	bh=VR5HvXs9FFSRsaFCsLbSDoRk9Z0PpOpzgCclYQY5eaE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GVy20u5SPwosYDdWyXzztz0zDKJkx4IBVTvBn8VmNQbZGsx+WfB7VFL9lhQhBCy+s
	 xmT2F1l1+ECVdtoDkv9z3iKaW19ZSFF4wOQ671VFyJsZ2mZsLpNvtxQl6TdJMxEFdD
	 buXg6PFaKW8seXapTwr2lzztIKZuysr8xmnkQTkE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4CB9FF804E2;
	Sun, 17 Jan 2021 17:06:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1EE8CF80115; Sun, 17 Jan 2021 17:06:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5D28FF8029B
 for <alsa-devel@alsa-project.org>; Sun, 17 Jan 2021 17:06:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5D28FF8029B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="X0Uv2tot"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610899578;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2RGSTHSwwg6gEqA8kPkjMWWVEuEfPs/kuyZo/i64UhA=;
 b=X0Uv2totSD6LnKH+dTqHnuGBbqDHzoI8pyGEzxUBNxDNPFOnN0Rh5O+00OTtTTXKpBw62P
 Vj81ja0oKOhdgFYpl1E7qNt5IKVbgMcy9hmzqj64eKBFdllpoI2c8s4yKtvHW+ij0Khb/x
 r+SlzEPBFgPXesnLSruXfELG3d6Yjhg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-374-aful1hQuMUqjjhEMYrRnVw-1; Sun, 17 Jan 2021 11:06:14 -0500
X-MC-Unique: aful1hQuMUqjjhEMYrRnVw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D46E510054FF;
 Sun, 17 Jan 2021 16:06:12 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A7AB45C266;
 Sun, 17 Jan 2021 16:06:10 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Lee Jones <lee.jones@linaro.org>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Jie Yang <yang.jie@linux.intel.com>, Mark Brown <broonie@kernel.org>
Subject: [PATCH v2 03/12] ASoC: arizona-jack: Fix some issues when HPDET IRQ
 fires after the jack has been unplugged
Date: Sun, 17 Jan 2021 17:05:46 +0100
Message-Id: <20210117160555.78376-4-hdegoede@redhat.com>
In-Reply-To: <20210117160555.78376-1-hdegoede@redhat.com>
References: <20210117160555.78376-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Cc: alsa-devel@alsa-project.org, Charles Keepax <ckeepax@opensource.cirrus.com>,
 patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
 Hans de Goede <hdegoede@redhat.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>
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

When the jack is partially inserted and then removed again it may be
removed while the hpdet code is running. In this case the following
may happen:

1. The "JACKDET rise" or ""JACKDET fall" IRQ triggers
2. arizona_jackdet runs and takes info->lock
3. The "HPDET" IRQ triggers
4. arizona_hpdet_irq runs, blocks on info->lock
5. arizona_jackdet calls arizona_stop_mic() and clears info->hpdet_done
6. arizona_jackdet releases info->lock
7. arizona_hpdet_irq now can continue running and:
7.1 Calls arizona_start_mic() (if a mic was detected)
7.2 sets info->hpdet_done

Step 7 is undesirable / a bug:
7.1 causes the device to stay in a high power-state (with MICVDD enabled)
7.2 causes hpdet to not run on the next jack insertion, which in turn
    causes the EXTCON_JACK_HEADPHONE state to never get set

This fixes both issues by skipping these 2 steps when arizona_hpdet_irq
runs after the jack has been unplugged.

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 sound/soc/codecs/arizona-jack.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/sound/soc/codecs/arizona-jack.c b/sound/soc/codecs/arizona-jack.c
index aae82db542a5..f7ef247de46a 100644
--- a/sound/soc/codecs/arizona-jack.c
+++ b/sound/soc/codecs/arizona-jack.c
@@ -601,7 +601,7 @@ static irqreturn_t arizona_hpdet_irq(int irq, void *data)
 	struct arizona *arizona = info->arizona;
 	int id_gpio = arizona->pdata.hpdet_id_gpio;
 	unsigned int report = EXTCON_JACK_HEADPHONE;
-	int ret, reading;
+	int ret, reading, state;
 	bool mic = false;
 
 	mutex_lock(&info->lock);
@@ -614,12 +614,11 @@ static irqreturn_t arizona_hpdet_irq(int irq, void *data)
 	}
 
 	/* If the cable was removed while measuring ignore the result */
-	ret = extcon_get_state(info->edev, EXTCON_MECHANICAL);
-	if (ret < 0) {
-		dev_err(arizona->dev, "Failed to check cable state: %d\n",
-			ret);
+	state = extcon_get_state(info->edev, EXTCON_MECHANICAL);
+	if (state < 0) {
+		dev_err(arizona->dev, "Failed to check cable state: %d\n", state);
 		goto out;
-	} else if (!ret) {
+	} else if (!state) {
 		dev_dbg(arizona->dev, "Ignoring HPDET for removed cable\n");
 		goto done;
 	}
@@ -667,7 +666,7 @@ static irqreturn_t arizona_hpdet_irq(int irq, void *data)
 		gpio_set_value_cansleep(id_gpio, 0);
 
 	/* If we have a mic then reenable MICDET */
-	if (mic || info->mic)
+	if (state && (mic || info->mic))
 		arizona_start_mic(info);
 
 	if (info->hpdet_active) {
@@ -675,7 +674,9 @@ static irqreturn_t arizona_hpdet_irq(int irq, void *data)
 		info->hpdet_active = false;
 	}
 
-	info->hpdet_done = true;
+	/* Do not set hp_det done when the cable has been unplugged */
+	if (state)
+		info->hpdet_done = true;
 
 out:
 	mutex_unlock(&info->lock);
-- 
2.28.0

