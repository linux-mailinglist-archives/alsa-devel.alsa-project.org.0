Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 70B7D10341A
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Nov 2019 07:07:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0884B169C;
	Wed, 20 Nov 2019 07:06:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0884B169C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574230028;
	bh=NwrZp+fdNZNzy3t4456q2po3wuw8fefJGamipccjXhQ=;
	h=Date:In-Reply-To:References:From:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YVjXFe1/EFFAGe0+12peFO4PMme6E81unkK3YN/jSsZ4ZAW5GHf1HBRnqHDidZEzO
	 g5Ee/4qXhxGvkJ7IpvcjsYndjoR8SVBz3tiHv4m7FElvWyFp1qLRbW0RzzFzWCe4Xz
	 XAWvuEIVYWRb66DgksDqXhXvnTz09GflO6whkAgg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C0FE6F80157;
	Wed, 20 Nov 2019 07:04:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 788EAF8013E; Wed, 20 Nov 2019 07:03:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID, DKIM_VALID_AU, SPF_HELO_NONE,
 USER_IN_DEF_DKIM_WL autolearn=disabled version=3.4.0
Received: from mail-pg1-x54a.google.com (mail-pg1-x54a.google.com
 [IPv6:2607:f8b0:4864:20::54a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C8CCBF8013D
 for <alsa-devel@alsa-project.org>; Wed, 20 Nov 2019 07:03:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C8CCBF8013D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="cy7Dprxu"
Received: by mail-pg1-x54a.google.com with SMTP id t11so17211864pgm.2
 for <alsa-devel@alsa-project.org>; Tue, 19 Nov 2019 22:03:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=Rj5jKMrZLCyz1LkWVBkT6xeM2EOIBG2OeJCuLSdQyq8=;
 b=cy7DprxuzzBiGwynCwOPCMA/gABy2u6CBHvgksnBVdgwyk4DkB9RKyfwjqXis9Zvyx
 TxGY4SNqBGrriA97Ka1TRUWSFlGb7pJXKtymnP7Raphw64hn1KU/YdnKlCfbxHjlJaFb
 lVb4sKR9PWt/H4kQeirIHlN9QyYj8HRSlz8xB7Dt9Iukd5N+WrkLH1eFU/GsCL8+WNX2
 scNwpZp30AxKsKmVqSjHdOBUXIBB4UcFJjltEGjzbtGizV3cU3KVVyTiYUAPSuhutpo+
 nz5jLqMpOEnKJ1eu6p3UCDR9veCa3i9i6MNrDeYCAI8iAhxY0lq1M3BDyTeX1PMw4z9w
 5NlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=Rj5jKMrZLCyz1LkWVBkT6xeM2EOIBG2OeJCuLSdQyq8=;
 b=dsr+thFqmxU0X/OLxhSM8wrtfXLBDI4iF6NzdkbIzVn8s2lpO6UaeqWjQqBTnfnzFe
 t1P97mbKDeKwpQmuic5iAMNzVScupS9nJNXzt7N3qrg/NF+NNnpyQB+VwctuNXrka27H
 CFIiMwd7rscf8siJb4hDU993Lv2F/SiM/m5PsfSgaShZUUzzt90ogiy2pV/eG6t1MdNq
 vJtUfdy0CMRooZ/9ub6RLWmLefdOTYWylrXbW8NZ6Kd1YqRxtNJj2f3vAGInjD79fzWX
 BZoRq5KTptO/G+9qHYfZQDGyIpjbwmFGi0T64hXsl0I4YdDKi8fNgX46/NaaNnjUY5tR
 WUUQ==
X-Gm-Message-State: APjAAAW7+HyvuKMMw3cX409//9VtS00Pw7Wx+oVO8SCjSwtQOIUur+xw
 tfgIWidvMiuXXFosuyIZxfMZYSlE+xd2
X-Google-Smtp-Source: APXvYqyo4En1X/QR4yxh4H9iVKWVF9f94uhM9ShZSL1D1sF8tDgijt3I9rk0VHTfMBX/LZkojHHn43drUlnb
X-Received: by 2002:a63:d617:: with SMTP id q23mr1295833pgg.146.1574229804189; 
 Tue, 19 Nov 2019 22:03:24 -0800 (PST)
Date: Wed, 20 Nov 2019 14:02:56 +0800
In-Reply-To: <20191120060256.212818-1-tzungbi@google.com>
Message-Id: <20191120060256.212818-4-tzungbi@google.com>
Mime-Version: 1.0
References: <20191120060256.212818-1-tzungbi@google.com>
X-Mailer: git-send-email 2.24.0.432.g9d3f5f5b63-goog
From: Tzung-Bi Shih <tzungbi@google.com>
To: broonie@kernel.org
Cc: tzungbi@google.com, alsa-devel@alsa-project.org, dgreid@google.com,
 cychiang@google.com
Subject: [alsa-devel] [PATCH 3/3] ASoC: max98090: fix possible race
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
                        read 0x1
                        assert ULK == 0 (2).

In the case (2), both max98090_interrupt and max98090_pll_work read
the same clear-on-read register.  max98090_pll_work would falsely
thought PLL is locked.

There are 2 possible options:
A. turn off ULK interrupt before scheduling max98090_pll_work; and turn
on again before exiting max98090_pll_work.
B. remove the second thread of execution.

Adopts option B which is more straightforward.

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 sound/soc/codecs/max98090.c | 8 ++------
 sound/soc/codecs/max98090.h | 1 -
 2 files changed, 2 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/max98090.c b/sound/soc/codecs/max98090.c
index 2ccdfb2383b7..75abe98dfc44 100644
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
@@ -2268,7 +2266,7 @@ static irqreturn_t max98090_interrupt(int irq, void *data)
 
 	if (active & M98090_ULK_MASK) {
 		dev_dbg(component->dev, "M98090_ULK_MASK\n");
-		schedule_work(&max98090->pll_work);
+		max98090_pll_work(max98090);
 	}
 
 	if (active & M98090_JDET_MASK) {
@@ -2431,7 +2429,6 @@ static int max98090_probe(struct snd_soc_component *component)
 			  max98090_pll_det_enable_work);
 	INIT_WORK(&max98090->pll_det_disable_work,
 		  max98090_pll_det_disable_work);
-	INIT_WORK(&max98090->pll_work, max98090_pll_work);
 
 	/* Enable jack detection */
 	snd_soc_component_write(component, M98090_REG_JACK_DETECT,
@@ -2484,7 +2481,6 @@ static void max98090_remove(struct snd_soc_component *component)
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
