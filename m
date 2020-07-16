Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F3FD221D3B
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Jul 2020 09:22:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B3CF71670;
	Thu, 16 Jul 2020 09:21:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B3CF71670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594884158;
	bh=kShQui1LiOLC0A8LVo0WTMxYxlLz/UfMiF9xhe9Lo1M=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IP1YK7EEY//5V9C6rHNbJ73ksRAvAUk7Jv07dkhcMz9Nw+DhvcoTMoo7qlus/buav
	 QXaKQvueBJe58MjpcF5IUZeRumH1K8FSdDx5ejDiRh4s0f4O/WR4CyefO294VvaBYZ
	 oKl7uGyta4EPBUXoEXqzKr9P6X8dZgAtyv/p40WY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 18392F802E2;
	Thu, 16 Jul 2020 09:18:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1AE48F8028A; Thu, 16 Jul 2020 05:09:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3A25BF8026A
 for <alsa-devel@alsa-project.org>; Thu, 16 Jul 2020 05:08:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3A25BF8026A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="dTugxUNj"
Received: by mail-pj1-x1044.google.com with SMTP id b92so3964378pjc.4
 for <alsa-devel@alsa-project.org>; Wed, 15 Jul 2020 20:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8vJxKwUVpAhdj4wYAl5b2tdLtDhCjBtUhiOv5fUux8k=;
 b=dTugxUNjGm8SBhEVwZ0yB8FvtZrzhFOHuSpiIvNE2E3SjUjSrIE1w14I52dw3Uk8b5
 3VAafc7gUmjsQ/YS7Xjq8i7OhMMWVeWrbTF8mKhc0S9n4IAuIzChi1+9oaZlREtdDKow
 3jCsslDzAr0zlil4XVqBtq+3neBsSD18zU00A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8vJxKwUVpAhdj4wYAl5b2tdLtDhCjBtUhiOv5fUux8k=;
 b=GNR1SSYD+K5DvsfXyDDpfYeKKGfQyo60MUfYT+T72PW8/6m3wnBJaanFw2gcZs/2UZ
 zpsjcxJLMckkB3NP/IIYigB1H92xbytqNlHJLnk8doOSm2sNw/DhxiSskd1qq2ZPnX4l
 MLNJQT0es4xrFIFKHzRHhKrqrxcZjbYOtSRp30CKPFYszY6bMyY4wYuSdvA2g0zZjMQ2
 7dnFVnnlPL+k/yXYm4w2j//IAk4Qh4yC2l2pENipJx+48r0+CYiyv2Q8VZkYGUvD4aMi
 2xE37jOZD2Z6vQeIE30JRjX9RNZmDmqq8roqrrhV6L11jcK7MB2kXWJ+jaAFEX8fZnq1
 ehUw==
X-Gm-Message-State: AOAM533Kl4HxfL+68zDdT/OI8B+imW07Q0v4LvOAirbNfTw5pHZRYX1V
 ZbY28AyAuRyRNyRoOJExDb8Lvw==
X-Google-Smtp-Source: ABdhPJxTrfzJCqi7BCSMsLwnF0LnH2/m3v4TdrKv4bsn5z85zApyPj+eDhaQfjttTIQn/Q1hTEyF2g==
X-Received: by 2002:a17:902:6181:: with SMTP id
 u1mr1929746plj.205.1594868934031; 
 Wed, 15 Jul 2020 20:08:54 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id 19sm3209358pfy.193.2020.07.15.20.08.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jul 2020 20:08:52 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 3/3] tasklet: Introduce new initialization API
Date: Wed, 15 Jul 2020 20:08:47 -0700
Message-Id: <20200716030847.1564131-4-keescook@chromium.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200716030847.1564131-1-keescook@chromium.org>
References: <20200716030847.1564131-1-keescook@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 16 Jul 2020 09:18:09 +0200
Cc: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 Oscar Carter <oscar.carter@gmx.com>, Mitchell Blank Jr <mitch@sfgoth.com>,
 kernel-hardening@lists.openwall.com, Peter Zijlstra <peterz@infradead.org>,
 kgdb-bugreport@lists.sourceforge.net,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, alsa-devel@alsa-project.org,
 Allen Pais <allen.lkml@gmail.com>,
 Christian Gromm <christian.gromm@microchip.com>, Will Deacon <will@kernel.org>,
 devel@driverdev.osuosl.org, Jonathan Corbet <corbet@lwn.net>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 "David S. Miller" <davem@davemloft.net>,
 Masahiro Yamada <masahiroy@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Julian Wiedmann <jwi@linux.ibm.com>,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Nishka Dasgupta <nishkadg.linux@gmail.com>, Jiri Slaby <jslaby@suse.com>,
 Jakub Kicinski <kuba@kernel.org>, Guenter Roeck <linux@roeck-us.net>,
 Wambui Karuga <wambui.karugax@gmail.com>, Kees Cook <keescook@chromium.org>,
 Vasily Gorbik <gor@linux.ibm.com>, linux-s390@vger.kernel.org,
 linux-kernel@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>,
 linux-input@vger.kernel.org, Ursula Braun <ubraun@linux.ibm.com>,
 Stephen Boyd <swboyd@chromium.org>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Thomas Gleixner <tglx@linutronix.de>, Felipe Balbi <balbi@kernel.org>,
 Kyungtae Kim <kt0755@gmail.com>, netdev@vger.kernel.org,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Douglas Anderson <dianders@chromium.org>,
 Kevin Curtis <kevin.curtis@farsite.co.uk>, linux-usb@vger.kernel.org,
 Jason Wessel <jason.wessel@windriver.com>,
 Romain Perier <romain.perier@gmail.com>, Karsten Graul <kgraul@linux.ibm.com>
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

From: Romain Perier <romain.perier@gmail.com>

Nowadays, modern kernel subsystems that use callbacks pass the data
structure associated with a given callback as argument to the callback.
The tasklet subsystem remains one which passes an arbitrary unsigned
long to the callback function. This has several problems:

- This keeps an extra field for storing the argument in each tasklet
  data structure, it bloats the tasklet_struct structure with a redundant
  .data field

- No type checking can be performed on this argument. Instead of
  using container_of() like other callback subsystems, it forces callbacks
  to do explicit type cast of the unsigned long argument into the required
  object type.

- Buffer overflows can overwrite the .func and the .data field, so
  an attacker can easily overwrite the function and its first argument
  to whatever it wants.

Add a new tasklet initialization API, via DECLARE_TASKLET() and
tasklet_setup(), which will replace the existing ones.

This work is greatly inspired by the timer_struct conversion series,
see commit e99e88a9d2b0 ("treewide: setup_timer() -> timer_setup()")

To avoid problems with both -Wcast-function-type (which is enabled in
the kernel via -Wextra is several subsystems), and with mismatched
function prototypes when build with Control Flow Integrity enabled,
this adds the "use_callback" member to let the tasklet caller choose
which union member to call through. Once all old API uses are removed,
this and the .data member will be removed as well. (On 64-bit this does
not grow the struct size as the new member fills the hole after atomic_t,
which is also "int" sized.)

Signed-off-by: Romain Perier <romain.perier@gmail.com>
Co-developed-by: Allen Pais <allen.lkml@gmail.com>
Signed-off-by: Allen Pais <allen.lkml@gmail.com>
Co-developed-by: Kees Cook <keescook@chromium.org>
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 include/linux/interrupt.h | 24 +++++++++++++++++++++++-
 kernel/softirq.c          | 18 +++++++++++++++++-
 2 files changed, 40 insertions(+), 2 deletions(-)

diff --git a/include/linux/interrupt.h b/include/linux/interrupt.h
index b911196f03eb..15570b237e53 100644
--- a/include/linux/interrupt.h
+++ b/include/linux/interrupt.h
@@ -608,10 +608,30 @@ struct tasklet_struct
 	struct tasklet_struct *next;
 	unsigned long state;
 	atomic_t count;
-	void (*func)(unsigned long);
+	bool use_callback;
+	union {
+		void (*func)(unsigned long data);
+		void (*callback)(struct tasklet_struct *t);
+	};
 	unsigned long data;
 };
 
+#define DECLARE_TASKLET(name, _callback)		\
+struct tasklet_struct name = {				\
+	.count = ATOMIC_INIT(0),			\
+	.callback = _callback,				\
+	.use_callback = true,				\
+}
+
+#define DECLARE_TASKLET_DISABLED(name, _callback)	\
+struct tasklet_struct name = {				\
+	.count = ATOMIC_INIT(1),			\
+	.callback = _callback,				\
+}
+
+#define from_tasklet(var, callback_tasklet, tasklet_fieldname)	\
+	container_of(callback_tasklet, typeof(*var), tasklet_fieldname)
+
 #define DECLARE_TASKLET_OLD(name, _func)		\
 struct tasklet_struct name = {				\
 	.count = ATOMIC_INIT(0),			\
@@ -691,6 +711,8 @@ extern void tasklet_kill(struct tasklet_struct *t);
 extern void tasklet_kill_immediate(struct tasklet_struct *t, unsigned int cpu);
 extern void tasklet_init(struct tasklet_struct *t,
 			 void (*func)(unsigned long), unsigned long data);
+extern void tasklet_setup(struct tasklet_struct *t,
+			  void (*callback)(struct tasklet_struct *));
 
 /*
  * Autoprobing for irqs:
diff --git a/kernel/softirq.c b/kernel/softirq.c
index c4201b7f42b1..292e7c2d2333 100644
--- a/kernel/softirq.c
+++ b/kernel/softirq.c
@@ -547,7 +547,10 @@ static void tasklet_action_common(struct softirq_action *a,
 				if (!test_and_clear_bit(TASKLET_STATE_SCHED,
 							&t->state))
 					BUG();
-				t->func(t->data);
+				if (t->use_callback)
+					t->callback(t);
+				else
+					t->func(t->data);
 				tasklet_unlock(t);
 				continue;
 			}
@@ -573,6 +576,18 @@ static __latent_entropy void tasklet_hi_action(struct softirq_action *a)
 	tasklet_action_common(a, this_cpu_ptr(&tasklet_hi_vec), HI_SOFTIRQ);
 }
 
+void tasklet_setup(struct tasklet_struct *t,
+		   void (*callback)(struct tasklet_struct *))
+{
+	t->next = NULL;
+	t->state = 0;
+	atomic_set(&t->count, 0);
+	t->callback = callback;
+	t->use_callback = true;
+	t->data = 0;
+}
+EXPORT_SYMBOL(tasklet_setup);
+
 void tasklet_init(struct tasklet_struct *t,
 		  void (*func)(unsigned long), unsigned long data)
 {
@@ -580,6 +595,7 @@ void tasklet_init(struct tasklet_struct *t,
 	t->state = 0;
 	atomic_set(&t->count, 0);
 	t->func = func;
+	t->use_callback = false;
 	t->data = data;
 }
 EXPORT_SYMBOL(tasklet_init);
-- 
2.25.1

