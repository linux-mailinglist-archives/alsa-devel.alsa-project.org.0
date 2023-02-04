Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BF17068AAFE
	for <lists+alsa-devel@lfdr.de>; Sat,  4 Feb 2023 16:43:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2D596A4A;
	Sat,  4 Feb 2023 16:42:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2D596A4A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675525422;
	bh=ejWQaXS+prjy1yHiV2fLKwqaTIvoz8298+g/OYNjYnc=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=CPIorsL2BPd+d2Q/QdFBfxgByRJbGzvfPXmVxP2KhjQ25XdOl6ew20zfIEovmqqLw
	 V6dy58BThoTtkRGkdQHQgGripq8AtzOMywqYsZzRVY1JNl+f1JUQbQgNnO3ggw3hJ8
	 o/j0MGo1+qki5Va1UBWMQYzh+MW8dKTB+BofUkZ0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8CC8CF8001D;
	Sat,  4 Feb 2023 16:42:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8A03EF804C2; Sat,  4 Feb 2023 16:42:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-oa1-x2b.google.com (mail-oa1-x2b.google.com
 [IPv6:2001:4860:4864:20::2b])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 37ED5F800E3
 for <alsa-devel@alsa-project.org>; Sat,  4 Feb 2023 16:42:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 37ED5F800E3
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=DKJGJs0/
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-16a27344a17so803841fac.4
 for <alsa-devel@alsa-project.org>; Sat, 04 Feb 2023 07:42:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
 :reply-to; bh=n4T2gR4inBhn5Zg0PEfb8tXM9CckMPfSDtx2cMHr3k8=;
 b=DKJGJs0/Xb1yBT2NqMQ6UTgGYyWRIxnrVxdBYMJeow6zJSLfc314iMCzRSIzFod0yS
 xQMkkk/qOYbUJSEGTMJi52yDAwgaNzYHuMpoqO9O+/Efn5HD0OCavj2DRY1gUJ9+Rs+U
 DSRmgrXu2R9XsKyK2q3MfLGcO/FTU2b/kWZTnQ3HG+vB5OMVWanPgukWY21lZATO0LVm
 YDRXBpwDFto24yPcQGku892WrX+xdsjFyxIBs+ObfLFzshtcJExbJwibOXsJmurDAO06
 YoBXf684uiaNKpwdEdwitHoNze35gGPS5VzG/kvkKqwPx2MwSSyLpJvWMRmkdhIHujLR
 uR4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=n4T2gR4inBhn5Zg0PEfb8tXM9CckMPfSDtx2cMHr3k8=;
 b=pVRnZDdQBDChkmSfsULTEho6Rbq1mjxoE3yFCvsn0g25pbSQie4mY0LxSWDQ7aleTV
 y3Gdbfa/u5Lp3WWHeJzjE47jFuG1JoYjUlunnyyvcKgxFoXZbHd1FF4llD2tKC6ifReQ
 QCQEvTodn3R1Z5k+gk63WEWk36IW18rjR4AOwof7mcNZ6eoE/RTr5ee2M+8tXitFFBn9
 ia5Cp8xacZ3LtkACQ16GXuolzAZF6UoQZo/UGgZnirto7XZgBQswJOoGl6x1lPmARHNf
 YWtkEbtFWfOEHdWSkoKUK0otmGCRAT5LeHrnAxE8HwQ0/BETloIgNUfQ4zZcs5yuBQ5H
 T2pA==
X-Gm-Message-State: AO0yUKWeIsO/FPPYPFYH6tJJ65dN+WntVOh0yH8cWOGrJNnAneuV2kQ6
 Kl+gyenc+EzIQ3uI/gbnrR4=
X-Google-Smtp-Source: AK7set8KIoyG6jWnMNQeX0frA8g+nNoRl/c9P57JjQtqX9fHJhpEioWx+Ywr7ngCAAfr6DGY835OYw==
X-Received: by 2002:a05:6871:58c:b0:163:2779:d81f with SMTP id
 u12-20020a056871058c00b001632779d81fmr10098593oan.34.1675525345686; 
 Sat, 04 Feb 2023 07:42:25 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 bq4-20020a0568201a0400b0051a6cb524b6sm520312oob.2.2023.02.04.07.42.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Feb 2023 07:42:24 -0800 (PST)
Date: Sat, 4 Feb 2023 07:42:22 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] ASoC: da7219: Fix pole orientation detection on OMTP
 headsets when playing music
Message-ID: <20230204154222.GA877819@roeck-us.net>
References: <20230117195645.GA83401@roeck-us.net>
 <OS3PR01MB66416CEF9F6E5AE62D194BACCDC49@OS3PR01MB6641.jpnprd01.prod.outlook.com>
 <20230119161221.GA981953@roeck-us.net>
 <OS3PR01MB66416C10BF8E6400C84DAD02CDD09@OS3PR01MB6641.jpnprd01.prod.outlook.com>
 <38f09c4d-70d1-f65f-6e9b-4ad84eda4059@roeck-us.net>
 <Y9kE1cSUg2CQM5vq@sirena.org.uk>
 <20230202155101.GB1373010@roeck-us.net>
 <Y9vtIISfmpICi+9u@sirena.org.uk>
 <8f89eeac-b3ef-4137-80df-6cf044873b05@roeck-us.net>
 <Y9wQygzbFyOWl54r@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y9wQygzbFyOWl54r@sirena.org.uk>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "support.opensource@diasemi.com" <support.opensource@diasemi.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "tiwai@suse.com" <tiwai@suse.com>,
 David Rau <david.rau.zg@renesas.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Thu, Feb 02, 2023 at 07:36:42PM +0000, Mark Brown wrote:
> 
> > > they have the potential to actually lock up are the cancel_work_sync()
> > > calls but they were unchanged and the backtrace you showed was showing
> > > the thread in the msleep().  My guess would be that you've got systems
> > > where there are very frequent jack detection events (potentiallly with
> > > broken accessories, or possibly due to the ground switch putting things
> > > into the wrong priority) and that the interrupt is firing again as soon
> > > as the thread unmasks the primary interrupt which means it never
> > > actually stops running.
> 
> > That is what I strongly suspect is happening. I don't know why exactly
> > the interrupt is firing continuously, but the hang is always in msleep().
> > One possibility might be that the event is actually a disconnect event,
> > and that enabling and immediately disabling the ground switch causes
> > another interrupt, which is then handled immediately, causing the hang.
> 
> Could be.  I'd be willing to guess that it's not just one event but
> rather a stream of events of some kind.  Possibly if it's due to the
> ground switch it's spuriously detecting a constant stream of button
> presses for the affected systems, which don't produce any UI visible
> result which would cause users to pull the accessory for whatever
> reason?  Whatever's going on I bet it's broken accessories triggering it.
> 

That seems to be unlikely. The average number of crashes per affected
system is 1.92, which points to something the users are doing and less
to a broken accessory. We do observe crashes due to broken accessories,
but in those cases the number of crashes per system tends to be much
higher.

Anyway, below is a patch with a possible fix. Of course, I still don't
know what the patch originally tried to fix, so it might not do much if
anything good. For example, it keeps button detection in the interrupt
handler to avoid dropping button events, so if spurious button detection
as you suspected is indeed (part of) the problem we might still see
a large number of interrupts.

Guenter

---
From 81dbe47c94d8d97ce7919a5ec4d4269c55b56ae6 Mon Sep 17 00:00:00 2001
From: Guenter Roeck <linux@roeck-us.net>
Date: Thu, 2 Feb 2023 16:09:14 -0800
Subject: [RFC] ASoC: da7219: Prevent hung task errors in interrupt handler

Commit 969357ec94e6 ("ASoC: da7219: Fix pole orientation detection on
OMTP headsets when playing music") tried to improve pole orientation
on certain headsets. Part of the change was to add a long sleep in
the beginning of the interrupt handler, followed by enabling the
ground switch

Unfortunately, this results in hung tasks in the threaded interrupt
handler.

INFO: task irq/105-da7219-:2556 blocked for more than 122 seconds.
Not tainted 5.10.159-20945-g4390861bfc33 #1
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:irq/105-da7219- state:D stack: 0 pid: 2556 ppid: 2 flags:0x00004080
Call Trace:
 __schedule+0x3b0/0xddb
 schedule+0x44/0xa8
 schedule_timeout+0xae/0x241
 ? run_local_timers+0x4e/0x4e
 msleep+0x2c/0x38
 da7219_aad_irq_thread+0x66/0x2b0
 irq_thread_fn+0x22/0x4d
 irq_thread+0x131/0x1cb
 ? irq_forced_thread_fn+0x5f/0x5f
 ? irq_thread_fn+0x4d/0x4d
 kthread+0x142/0x153
 ? synchronize_irq+0xe0/0xe0
 ? kthread_blkcg+0x31/0x31
 ret_from_fork+0x1f/0x30

Solve the problem by enabling the ground switch immediately and only
after an insertion has been detected. Delay pole orientation detection
until after the chip reports that detection is complete plus an
additional time depending on the chip configuration. Do this by
implementing ground switch detection in a delayed worker.

Fixes: 969357ec94e6 ("ASoC: da7219: Fix pole orientation detection on OMTP headsets when playing music")
Cc: David Rau <david.rau.zg@renesas.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 sound/soc/codecs/da7219-aad.c | 156 ++++++++++++++++++++++------------
 sound/soc/codecs/da7219-aad.h |   3 +
 2 files changed, 105 insertions(+), 54 deletions(-)

diff --git a/sound/soc/codecs/da7219-aad.c b/sound/soc/codecs/da7219-aad.c
index c55b033d89da..47685c996bda 100644
--- a/sound/soc/codecs/da7219-aad.c
+++ b/sound/soc/codecs/da7219-aad.c
@@ -8,6 +8,7 @@
  */
 
 #include <linux/module.h>
+#include <linux/mutex.h>
 #include <linux/platform_device.h>
 #include <linux/clk.h>
 #include <linux/i2c.h>
@@ -339,6 +340,82 @@ static void da7219_aad_hptest_work(struct work_struct *work)
 				    SND_JACK_HEADSET | SND_JACK_LINEOUT);
 }
 
+static void da7219_aad_handle_removal(struct da7219_aad_priv *da7219_aad)
+{
+	struct snd_soc_component *component = da7219_aad->component;
+	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
+	struct da7219_priv *da7219 = snd_soc_component_get_drvdata(component);
+
+	da7219_aad->jack_inserted = false;
+
+	/* Cancel any pending work */
+	cancel_work_sync(&da7219_aad->btn_det_work);
+	cancel_work_sync(&da7219_aad->hptest_work);
+
+	/* Un-drive headphones/lineout */
+	snd_soc_component_update_bits(component, DA7219_HP_R_CTRL,
+				      DA7219_HP_R_AMP_OE_MASK, 0);
+	snd_soc_component_update_bits(component, DA7219_HP_L_CTRL,
+				      DA7219_HP_L_AMP_OE_MASK, 0);
+
+	/* Ensure button detection disabled */
+	snd_soc_component_update_bits(component, DA7219_ACCDET_CONFIG_1,
+				      DA7219_BUTTON_CONFIG_MASK, 0);
+
+	da7219->micbias_on_event = false;
+
+	/* Disable mic bias */
+	snd_soc_dapm_disable_pin(dapm, "Mic Bias");
+	snd_soc_dapm_sync(dapm);
+
+	/* Disable ground switch */
+	snd_soc_component_update_bits(component, 0xFB, 0x01, 0x00);
+
+	snd_soc_jack_report(da7219_aad->jack, 0, DA7219_AAD_REPORT_ALL_MASK);
+}
+
+static void da7219_aad_insertion_work(struct work_struct *work)
+{
+	struct da7219_aad_priv *da7219_aad =
+		container_of(work, struct da7219_aad_priv, hptest_work);
+	struct snd_soc_component *component = da7219_aad->component;
+	u8 statusa;
+
+	mutex_lock(&da7219_aad->insertion_mutex);
+
+	if (!da7219_aad->jack_inserted)
+		goto unlock;
+
+	/* Read status register for jack insertion & type status */
+	statusa = snd_soc_component_read(component, DA7219_ACCDET_STATUS_A);
+	if (!(statusa & DA7219_JACK_INSERTION_STS_MASK)) {
+		da7219_aad_handle_removal(da7219_aad);
+		goto unlock;
+	}
+
+	/*
+	 * If 4-pole, then enable button detection, else perform
+	 * HP impedance test to determine output type to report.
+	 *
+	 * We schedule work here as the tasks themselves can
+	 * take time to complete, and in particular for hptest
+	 * we want to be able to check if the jack was removed
+	 * during the procedure as this will invalidate the
+	 * result. By doing this as work, the IRQ thread can
+	 * handle a removal, and we can check at the end of
+	 * hptest if we have a valid result or not.
+	 */
+	if (statusa & DA7219_JACK_TYPE_STS_MASK) {
+		schedule_work(&da7219_aad->btn_det_work);
+		snd_soc_jack_report(da7219_aad->jack, SND_JACK_HEADSET,
+				    SND_JACK_HEADSET | SND_JACK_LINEOUT);
+	} else {
+		schedule_work(&da7219_aad->hptest_work);
+	}
+
+unlock:
+	mutex_unlock(&da7219_aad->insertion_mutex);
+}
 
 /*
  * IRQ
@@ -348,23 +425,21 @@ static irqreturn_t da7219_aad_irq_thread(int irq, void *data)
 {
 	struct da7219_aad_priv *da7219_aad = data;
 	struct snd_soc_component *component = da7219_aad->component;
-	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
 	struct da7219_priv *da7219 = snd_soc_component_get_drvdata(component);
 	u8 events[DA7219_AAD_IRQ_REG_MAX];
-	u8 statusa, srm_st;
+	u8 statusa;
 	int i, report = 0, mask = 0;
 
-	srm_st = snd_soc_component_read(component, DA7219_PLL_SRM_STS) & DA7219_PLL_SRM_STS_MCLK;
-	msleep(da7219_aad->gnd_switch_delay * ((srm_st == 0x0) ? 2 : 1) - 4);
-	/* Enable ground switch */
-	snd_soc_component_update_bits(component, 0xFB, 0x01, 0x01);
+	mutex_lock(&da7219_aad->insertion_mutex);
 
 	/* Read current IRQ events */
 	regmap_bulk_read(da7219->regmap, DA7219_ACCDET_IRQ_EVENT_A,
 			 events, DA7219_AAD_IRQ_REG_MAX);
 
-	if (!events[DA7219_AAD_IRQ_REG_A] && !events[DA7219_AAD_IRQ_REG_B])
+	if (!events[DA7219_AAD_IRQ_REG_A] && !events[DA7219_AAD_IRQ_REG_B]) {
+		mutex_unlock(&da7219_aad->insertion_mutex);
 		return IRQ_NONE;
+	}
 
 	/* Read status register for jack insertion & type status */
 	statusa = snd_soc_component_read(component, DA7219_ACCDET_STATUS_A);
@@ -378,36 +453,29 @@ static irqreturn_t da7219_aad_irq_thread(int irq, void *data)
 		statusa);
 
 	if (statusa & DA7219_JACK_INSERTION_STS_MASK) {
+		u8 srm_st;
+
+		srm_st = snd_soc_component_read(component, DA7219_PLL_SRM_STS) &
+							DA7219_PLL_SRM_STS_MCLK;
+
 		/* Jack Insertion */
 		if (events[DA7219_AAD_IRQ_REG_A] &
 		    DA7219_E_JACK_INSERTED_MASK) {
 			report |= SND_JACK_MECHANICAL;
 			mask |= SND_JACK_MECHANICAL;
 			da7219_aad->jack_inserted = true;
+
+			/* Enable ground switch */
+			snd_soc_component_update_bits(component, 0xFB, 0x01, 0x01);
 		}
 
 		/* Jack type detection */
 		if (events[DA7219_AAD_IRQ_REG_A] &
 		    DA7219_E_JACK_DETECT_COMPLETE_MASK) {
-			/*
-			 * If 4-pole, then enable button detection, else perform
-			 * HP impedance test to determine output type to report.
-			 *
-			 * We schedule work here as the tasks themselves can
-			 * take time to complete, and in particular for hptest
-			 * we want to be able to check if the jack was removed
-			 * during the procedure as this will invalidate the
-			 * result. By doing this as work, the IRQ thread can
-			 * handle a removal, and we can check at the end of
-			 * hptest if we have a valid result or not.
-			 */
-			if (statusa & DA7219_JACK_TYPE_STS_MASK) {
-				report |= SND_JACK_HEADSET;
-				mask |=	SND_JACK_HEADSET | SND_JACK_LINEOUT;
-				schedule_work(&da7219_aad->btn_det_work);
-			} else {
-				schedule_work(&da7219_aad->hptest_work);
-			}
+			int delay = da7219_aad->gnd_switch_delay *
+						((srm_st == 0x0) ? 2 : 1) - 4;
+
+			schedule_delayed_work(&da7219_aad->insertion_work, delay);
 		}
 
 		/* Button support for 4-pole jack */
@@ -431,40 +499,16 @@ static irqreturn_t da7219_aad_irq_thread(int irq, void *data)
 				}
 			}
 		}
+		snd_soc_jack_report(da7219_aad->jack, report, mask);
 	} else {
 		/* Jack removal */
 		if (events[DA7219_AAD_IRQ_REG_A] & DA7219_E_JACK_REMOVED_MASK) {
-			report = 0;
-			mask |= DA7219_AAD_REPORT_ALL_MASK;
-			da7219_aad->jack_inserted = false;
-
-			/* Cancel any pending work */
-			cancel_work_sync(&da7219_aad->btn_det_work);
-			cancel_work_sync(&da7219_aad->hptest_work);
-
-			/* Un-drive headphones/lineout */
-			snd_soc_component_update_bits(component, DA7219_HP_R_CTRL,
-					    DA7219_HP_R_AMP_OE_MASK, 0);
-			snd_soc_component_update_bits(component, DA7219_HP_L_CTRL,
-					    DA7219_HP_L_AMP_OE_MASK, 0);
-
-			/* Ensure button detection disabled */
-			snd_soc_component_update_bits(component, DA7219_ACCDET_CONFIG_1,
-					    DA7219_BUTTON_CONFIG_MASK, 0);
-
-			da7219->micbias_on_event = false;
-
-			/* Disable mic bias */
-			snd_soc_dapm_disable_pin(dapm, "Mic Bias");
-			snd_soc_dapm_sync(dapm);
-
-			/* Disable ground switch */
-			snd_soc_component_update_bits(component, 0xFB, 0x01, 0x00);
+			cancel_delayed_work(&da7219_aad->insertion_work);
+			da7219_aad_handle_removal(da7219_aad);
 		}
 	}
 
-	snd_soc_jack_report(da7219_aad->jack, report, mask);
-
+	mutex_unlock(&da7219_aad->insertion_mutex);
 	return IRQ_HANDLED;
 }
 
@@ -938,6 +982,9 @@ int da7219_aad_init(struct snd_soc_component *component)
 	snd_soc_component_update_bits(component, DA7219_ACCDET_CONFIG_1,
 			    DA7219_BUTTON_CONFIG_MASK, 0);
 
+	mutex_init(&da7219_aad->insertion_mutex);
+
+	INIT_DELAYED_WORK(&da7219_aad->insertion_work, da7219_aad_insertion_work);
 	INIT_WORK(&da7219_aad->btn_det_work, da7219_aad_btn_det_work);
 	INIT_WORK(&da7219_aad->hptest_work, da7219_aad_hptest_work);
 
@@ -973,6 +1020,7 @@ void da7219_aad_exit(struct snd_soc_component *component)
 
 	free_irq(da7219_aad->irq, da7219_aad);
 
+	cancel_delayed_work_sync(&da7219_aad->insertion_work);
 	cancel_work_sync(&da7219_aad->btn_det_work);
 	cancel_work_sync(&da7219_aad->hptest_work);
 }
diff --git a/sound/soc/codecs/da7219-aad.h b/sound/soc/codecs/da7219-aad.h
index 21fdf53095cc..b1b7f8ba45bd 100644
--- a/sound/soc/codecs/da7219-aad.h
+++ b/sound/soc/codecs/da7219-aad.h
@@ -10,6 +10,7 @@
 #ifndef __DA7219_AAD_H
 #define __DA7219_AAD_H
 
+#include <linux/mutex.h>
 #include <linux/timer.h>
 #include <sound/soc.h>
 #include <sound/jack.h>
@@ -194,6 +195,8 @@ struct da7219_aad_priv {
 
 	u8 btn_cfg;
 
+	struct mutex insertion_mutex;
+	struct delayed_work insertion_work;
 	struct work_struct btn_det_work;
 	struct work_struct hptest_work;
 
-- 
2.39.1

