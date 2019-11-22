Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AC89810671C
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Nov 2019 08:35:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A9E62182B;
	Fri, 22 Nov 2019 08:34:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A9E62182B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574408103;
	bh=OPRq2i/2Y7+mFaOYogWw04UB/NBHCxUz01IR1Y1ymIg=;
	h=Date:In-Reply-To:References:From:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HaWznr2kSHjYJIMl5ndAjToYX/zpJsw34j4mjIffPmCSWW7lEKgK9qJxIbO4lwFko
	 DY7bZksPN+PEkJ3ZKKL9k+zaRSlhZsWL6yvLoY7u0mEH/4gfPrYVRGPXqv7secJ1uH
	 O41hfvw1GoIJC4W7uv2CQxBYf8ydGndz02mr1fww=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8ACFDF8019B;
	Fri, 22 Nov 2019 08:31:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7AB3EF8019B; Fri, 22 Nov 2019 08:31:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
 autolearn=disabled version=3.4.0
Received: from mail-pf1-x449.google.com (mail-pf1-x449.google.com
 [IPv6:2607:f8b0:4864:20::449])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 11C86F80162
 for <alsa-devel@alsa-project.org>; Fri, 22 Nov 2019 08:31:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 11C86F80162
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="BiELqLyO"
Received: by mail-pf1-x449.google.com with SMTP id s24so3839226pfd.0
 for <alsa-devel@alsa-project.org>; Thu, 21 Nov 2019 23:31:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=PJpF59WXyuQHuwY6Mo3791oOyLy5jjBEnMXAd4F3z7k=;
 b=BiELqLyOFOoHHtS40EzMRCc6c8tsaD/r6/B/PF6zYTbzKKF4WlXi8CArxxrGpYPrio
 O1PqLhQRmnyJ4X8NI9svwXMAcevGlSp7obtxfpXg0mAtRwLA+uHLuwD0Q4vajJmeqJrb
 SOWDNysK1UBVRikgzmwOlW2RsDox+nhbuk/yoeLQfzrAJuKOuxws5hhOgjKK5xbSst3g
 akRPxwSsn2FfnXON5WlEFzMGWoKJvnDrE9g46ZoBEPkAbU8BGFF+JPKl6XYOYIiGZcsk
 vAtPQHefVB1LghGdsMbj+tHr0wHEpXTkI47KidFsS+XShnEhnWYI+fDMRxMuoMIs7LZq
 fekg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=PJpF59WXyuQHuwY6Mo3791oOyLy5jjBEnMXAd4F3z7k=;
 b=PumQqF6BQfA2TrbYxn3aqaT9kdTViyjwq0W9LJV2K3Oq6zcPznyHFiXZguBxFjQxfE
 Vujd+MhD9Yz3b+K25iQ753CtEV88uzfG2u7ieFSStBjJiDY+KJdWt9DoIji8KwhAqel/
 L826JGF/8OFN2Db0TPl/k+uOXyz9JsIumnjVp2HDMd3NQm0uQ9ycPrDwtirEhsEQ7hNb
 dJEpBougGqW+A6LxpdAwz5arq6ltTz/uLezwm3lHDYfGjDM6XUUca9Rrey+Nw6EUhbDk
 fkq+BhDmjGhUbRCpLsi4AgFvFcQBvns7E1A6x5ie+Dd1IKE5fRS4UGZdnP5i+WOcwpYx
 Pjow==
X-Gm-Message-State: APjAAAUTmU0DoaZYkhP9t/ZE2OtMgfS+df3aN3z3C6QMzpVzPuVmim9c
 YgZhfzk19XeE5ZBe1sLvzxglck1Ler71
X-Google-Smtp-Source: APXvYqxFZzP2xr5z4HWURpTt3DD+Ik3b4MHFFZaH8Jz91pZ/Hvp25A6/v5YwNFqamJOq7EPx8ryblXTdfNjl
X-Received: by 2002:a63:6c4:: with SMTP id 187mr14584066pgg.421.1574407900399; 
 Thu, 21 Nov 2019 23:31:40 -0800 (PST)
Date: Fri, 22 Nov 2019 15:31:14 +0800
In-Reply-To: <20191122073114.219945-1-tzungbi@google.com>
Message-Id: <20191122073114.219945-4-tzungbi@google.com>
Mime-Version: 1.0
References: <20191122073114.219945-1-tzungbi@google.com>
X-Mailer: git-send-email 2.24.0.432.g9d3f5f5b63-goog
From: Tzung-Bi Shih <tzungbi@google.com>
To: broonie@kernel.org, pierre-louis.bossart@linux.intel.com
Cc: tzungbi@google.com, alsa-devel@alsa-project.org, dgreid@google.com,
 cychiang@google.com
Subject: [alsa-devel] [PATCH v2 3/3] ASoC: max98090: fix possible race
	conditions
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

max98090_interrupt() and max98090_pll_work() run in 2 different threads.
There are 2 possible races:

Note: M98090_REG_DEVICE_STATUS = 0x01.
Note: ULK == 0, PLL is locked; ULK == 1, PLL is unlocked.

max98090_interrupt      max98090_pll_work
----------------------------------------------
schedule max98090_pll_work
                        restart max98090 codec
receive ULK INT
                        assert ULK == 0
schedule max98090_pll_work (1).

In the case (1), the PLL is locked but max98090_interrupt unnecessarily
schedules another max98090_pll_work.

max98090_interrupt      max98090_pll_work      max98090 codec
----------------------------------------------------------------------
                                               ULK = 1
receive ULK INT
read 0x01
                                               ULK = 0 (clear on read)
schedule max98090_pll_work
                        restart max98090 codec
                                               ULK = 1
receive ULK INT
read 0x01
                                               ULK = 0 (clear on read)
                        read 0x01
                        assert ULK == 0 (2).

In the case (2), both max98090_interrupt and max98090_pll_work read
the same clear-on-read register.  max98090_pll_work would falsely
thought PLL is locked.
Note: the case (2) race is introduced by the previous commit ("ASoC:
max98090: exit workaround earlier if PLL is locked") to check the status
and exit the loop earlier in max98090_pll_work.

There are 2 possible solution options:
A. turn off ULK interrupt before scheduling max98090_pll_work; and turn
on again before exiting max98090_pll_work.
B. remove the second thread of execution.

Option A cannot fix the case (2) race because it still has 2 threads
access the same clear-on-read register simultaneously.  Although we
could suppose the register is volatile and read the status via I2C could
be much slower than the hardware raises the bits.

Option B introduces a maximum 10~12 msec penalty delay in the interrupt
handler.  However, it could only punish the jack detection by extra
10~12 msec.

Adopts option B which is the better solution overall.

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 sound/soc/codecs/max98090.c | 8 ++------
 sound/soc/codecs/max98090.h | 1 -
 2 files changed, 2 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/max98090.c b/sound/soc/codecs/max98090.c
index f531e5a11bdd..e46b6ada13b1 100644
--- a/sound/soc/codecs/max98090.c
+++ b/sound/soc/codecs/max98090.c
@@ -2103,10 +2103,8 @@ static void max98090_pll_det_disable_work(struct work_struct *work)
 			    M98090_IULK_MASK, 0);
 }
 
-static void max98090_pll_work(struct work_struct *work)
+static void max98090_pll_work(struct max98090_priv *max98090)
 {
-	struct max98090_priv *max98090 =
-		container_of(work, struct max98090_priv, pll_work);
 	struct snd_soc_component *component = max98090->component;
 	unsigned int pll;
 	int i;
@@ -2275,7 +2273,7 @@ static irqreturn_t max98090_interrupt(int irq, void *data)
 
 	if (active & M98090_ULK_MASK) {
 		dev_dbg(component->dev, "M98090_ULK_MASK\n");
-		schedule_work(&max98090->pll_work);
+		max98090_pll_work(max98090);
 	}
 
 	if (active & M98090_JDET_MASK) {
@@ -2438,7 +2436,6 @@ static int max98090_probe(struct snd_soc_component *component)
 			  max98090_pll_det_enable_work);
 	INIT_WORK(&max98090->pll_det_disable_work,
 		  max98090_pll_det_disable_work);
-	INIT_WORK(&max98090->pll_work, max98090_pll_work);
 
 	/* Enable jack detection */
 	snd_soc_component_write(component, M98090_REG_JACK_DETECT,
@@ -2491,7 +2488,6 @@ static void max98090_remove(struct snd_soc_component *component)
 	cancel_delayed_work_sync(&max98090->jack_work);
 	cancel_delayed_work_sync(&max98090->pll_det_enable_work);
 	cancel_work_sync(&max98090->pll_det_disable_work);
-	cancel_work_sync(&max98090->pll_work);
 	max98090->component = NULL;
 }
 
diff --git a/sound/soc/codecs/max98090.h b/sound/soc/codecs/max98090.h
index 57965cd678b4..a197114b0dad 100644
--- a/sound/soc/codecs/max98090.h
+++ b/sound/soc/codecs/max98090.h
@@ -1530,7 +1530,6 @@ struct max98090_priv {
 	struct delayed_work jack_work;
 	struct delayed_work pll_det_enable_work;
 	struct work_struct pll_det_disable_work;
-	struct work_struct pll_work;
 	struct snd_soc_jack *jack;
 	unsigned int dai_fmt;
 	int tdm_slots;
-- 
2.24.0.432.g9d3f5f5b63-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
