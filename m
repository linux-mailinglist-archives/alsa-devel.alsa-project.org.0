Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D80D50B8E1
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Apr 2022 15:43:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2CC1916F4;
	Fri, 22 Apr 2022 15:43:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2CC1916F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650635031;
	bh=6qz24JeYkT/szoUulUC11ktMbSMxaia2ZM53W0WWa5k=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hmd5QJ6fs5g2qhdcs6ntXKtC7kBLO1YVF97nVLS1GvL25kkAAkcJCiLWCWXjoAW3b
	 VgfvrwE6DAvcDHNHmgACg7VokHPoIsJkWBE70Mh90KtXvTROESOvrS12YWx3bMC9GI
	 Ks8zSE5ow9/BoJVNJZ9nWQtv/pnI+bWuoRuaEq9Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B2AFBF8062D;
	Fri, 22 Apr 2022 15:32:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 12154F80269; Tue, 19 Apr 2022 18:42:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 59920F80116
 for <alsa-devel@alsa-project.org>; Tue, 19 Apr 2022 18:42:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 59920F80116
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="OQbcZhU1"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id AD2AB6186B;
 Tue, 19 Apr 2022 16:42:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0C57C385AD;
 Tue, 19 Apr 2022 16:42:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650386559;
 bh=6qz24JeYkT/szoUulUC11ktMbSMxaia2ZM53W0WWa5k=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=OQbcZhU1YyaWiVoymRlCpzVRaDV6+oOUhic1Kg4DXMriEEdQTb3Ol248UgeiguRcV
 AADXBOzx4zqgQNOk8kqSzTZHT8QIWeMxKyU23zO+RJE2VESVS0XI60vTW/g7muIAwS
 8PC9xUtDQIiLYabZtjUMpFcY4iEN8SE8ABotebLwqZt2mev8Theryu21oiciT6uNJG
 jkegeWr772BxLlRDA+zY95CIesNGVFaK7EjAjyLas9VMV8jQ2YcKVPWTYE+Of1svA5
 xXLxVX0vDq/uA9rastXjDbWACQcopxN6Tk8sAWc6oesLyUD/wEISCwtksws8Opfw6K
 j1eP3Wy/Abdpw==
From: Arnd Bergmann <arnd@kernel.org>
To: robert.jarzmik@free.fr,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 29/48] Input: wm97xx - switch to using threaded IRQ
Date: Tue, 19 Apr 2022 18:37:51 +0200
Message-Id: <20220419163810.2118169-30-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20220419163810.2118169-1-arnd@kernel.org>
References: <20220419163810.2118169-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 22 Apr 2022 15:31:42 +0200
Cc: Ulf Hansson <ulf.hansson@linaro.org>, linux-usb@vger.kernel.org,
 Philipp Zabel <philipp.zabel@gmail.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, Sergey Lapin <slapin@ossfans.org>,
 linux-fbdev@vger.kernel.org, Dominik Brodowski <linux@dominikbrodowski.net>,
 linux-kernel@vger.kernel.org, linux-ide@vger.kernel.org,
 linux-mtd@lists.infradead.org, Tomas Cech <sleep_walker@suse.com>,
 linux-clk@vger.kernel.org, linux-leds@vger.kernel.org,
 linux-rtc@vger.kernel.org, Helge Deller <deller@gmx.de>,
 Marek Vasut <marek.vasut@gmail.com>, Paul Parsons <lost.distance@yahoo.com>,
 Linus Walleij <linus.walleij@linaro.org>, Arnd Bergmann <arnd@arndb.de>,
 linux-pm@vger.kernel.org, linux-input@vger.kernel.org,
 Haojian Zhuang <haojian.zhuang@gmail.com>, Lubomir Rintel <lkundrak@v3.sk>,
 Mark Brown <broonie@kernel.org>, dri-devel@lists.freedesktop.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Stephen Boyd <sboyd@kernel.org>, patches@opensource.cirrus.com,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-mmc@vger.kernel.org,
 linux-mips@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
 alsa-devel@alsa-project.org, Daniel Mack <daniel@zonque.org>
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

From: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Instead of manually disabling and enabling interrupts and scheduling work
to access the device, let's use threaded oneshot interrupt handler. It
simplifies things.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/input/touchscreen/wm97xx-core.c | 42 +++++--------------------
 include/linux/wm97xx.h                  |  1 -
 2 files changed, 7 insertions(+), 36 deletions(-)

diff --git a/drivers/input/touchscreen/wm97xx-core.c b/drivers/input/touchscreen/wm97xx-core.c
index 1b58611c8084..2757c7768ffe 100644
--- a/drivers/input/touchscreen/wm97xx-core.c
+++ b/drivers/input/touchscreen/wm97xx-core.c
@@ -285,11 +285,12 @@ void wm97xx_set_suspend_mode(struct wm97xx *wm, u16 mode)
 EXPORT_SYMBOL_GPL(wm97xx_set_suspend_mode);
 
 /*
- * Handle a pen down interrupt.
+ * Codec PENDOWN irq handler
+ *
  */
-static void wm97xx_pen_irq_worker(struct work_struct *work)
+static irqreturn_t wm97xx_pen_interrupt(int irq, void *dev_id)
 {
-	struct wm97xx *wm = container_of(work, struct wm97xx, pen_event_work);
+	struct wm97xx *wm = dev_id;
 	int pen_was_down = wm->pen_is_down;
 
 	/* do we need to enable the touch panel reader */
@@ -343,27 +344,6 @@ static void wm97xx_pen_irq_worker(struct work_struct *work)
 	if (!wm->pen_is_down && wm->mach_ops->acc_enabled)
 		wm->mach_ops->acc_pen_up(wm);
 
-	wm->mach_ops->irq_enable(wm, 1);
-}
-
-/*
- * Codec PENDOWN irq handler
- *
- * We have to disable the codec interrupt in the handler because it
- * can take up to 1ms to clear the interrupt source. We schedule a task
- * in a work queue to do the actual interaction with the chip.  The
- * interrupt is then enabled again in the slow handler when the source
- * has been cleared.
- */
-static irqreturn_t wm97xx_pen_interrupt(int irq, void *dev_id)
-{
-	struct wm97xx *wm = dev_id;
-
-	if (!work_pending(&wm->pen_event_work)) {
-		wm->mach_ops->irq_enable(wm, 0);
-		queue_work(wm->ts_workq, &wm->pen_event_work);
-	}
-
 	return IRQ_HANDLED;
 }
 
@@ -374,12 +354,9 @@ static int wm97xx_init_pen_irq(struct wm97xx *wm)
 {
 	u16 reg;
 
-	/* If an interrupt is supplied an IRQ enable operation must also be
-	 * provided. */
-	BUG_ON(!wm->mach_ops->irq_enable);
-
-	if (request_irq(wm->pen_irq, wm97xx_pen_interrupt, IRQF_SHARED,
-			"wm97xx-pen", wm)) {
+	if (request_threaded_irq(wm->pen_irq, NULL, wm97xx_pen_interrupt,
+				 IRQF_SHARED | IRQF_ONESHOT,
+				 "wm97xx-pen", wm)) {
 		dev_err(wm->dev,
 			"Failed to register pen down interrupt, polling");
 		wm->pen_irq = 0;
@@ -509,7 +486,6 @@ static int wm97xx_ts_input_open(struct input_dev *idev)
 	wm->codec->dig_enable(wm, 1);
 
 	INIT_DELAYED_WORK(&wm->ts_reader, wm97xx_ts_reader);
-	INIT_WORK(&wm->pen_event_work, wm97xx_pen_irq_worker);
 
 	wm->ts_reader_min_interval = HZ >= 100 ? HZ / 100 : 1;
 	if (wm->ts_reader_min_interval < 1)
@@ -560,10 +536,6 @@ static void wm97xx_ts_input_close(struct input_dev *idev)
 
 	wm->pen_is_down = 0;
 
-	/* Balance out interrupt disables/enables */
-	if (cancel_work_sync(&wm->pen_event_work))
-		wm->mach_ops->irq_enable(wm, 1);
-
 	/* ts_reader rearms itself so we need to explicitly stop it
 	 * before we destroy the workqueue.
 	 */
diff --git a/include/linux/wm97xx.h b/include/linux/wm97xx.h
index 462854f4f286..85bd8dd3caea 100644
--- a/include/linux/wm97xx.h
+++ b/include/linux/wm97xx.h
@@ -281,7 +281,6 @@ struct wm97xx {
 	unsigned long ts_reader_min_interval; /* Minimum interval */
 	unsigned int pen_irq;		/* Pen IRQ number in use */
 	struct workqueue_struct *ts_workq;
-	struct work_struct pen_event_work;
 	u16 acc_slot;			/* AC97 slot used for acc touch data */
 	u16 acc_rate;			/* acc touch data rate */
 	unsigned pen_is_down:1;		/* Pen is down */
-- 
2.29.2

