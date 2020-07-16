Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 812BC221D3C
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Jul 2020 09:23:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2DCAB15DC;
	Thu, 16 Jul 2020 09:22:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2DCAB15DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594884194;
	bh=Refqs9TMLM3/4TJtwS69GVOk3yoXw06Cl67tHKuQi+A=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=T/9p/4sw/RwXtsx7aEDihhLKHGIYgQxbnWPC45ROUBxkWQYZN7rLBj12uoo3w++7e
	 SoffCuhQTziapFn42PhVmbHaYdMQ+TNsr59vwx/7lBtV1jIiU2OaCDNpHkN6INvfBf
	 hT1QKgwQdOAuq/lbyklpdkku1Y0DgSfU6isgJ6e4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7FBA3F802E9;
	Thu, 16 Jul 2020 09:18:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 72C5AF8028A; Thu, 16 Jul 2020 05:09:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7121DF80276
 for <alsa-devel@alsa-project.org>; Thu, 16 Jul 2020 05:08:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7121DF80276
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="FG/kfdhr"
Received: by mail-pl1-x641.google.com with SMTP id l6so3242971plt.7
 for <alsa-devel@alsa-project.org>; Wed, 15 Jul 2020 20:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PQ3rS81iCqlQj563UE75aUsx51oFdKIvno+SEEG/FG4=;
 b=FG/kfdhrrvpgKNO8XoFAw8rMldsyko1xxMQvI4cYzTokOwgJ4VoV67Xp7ZSUwQyuB1
 pUGFqZBMP6lpP24GnUWphnxjAPTHxBvHDhawoWy2aIc23UsRgkac0gYVUKAPjXZwMzVH
 C32IKdA7MiHJNt49J80WqSESe08lPvA2ln4BQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PQ3rS81iCqlQj563UE75aUsx51oFdKIvno+SEEG/FG4=;
 b=ee7vn4BTObXmwn8eaz6RBqE8v+dcQipF55C0Tmv5DCsz48mY0yLA7DZUNR+UYcKL5s
 RjafncZqii3HySuXfHTA4naMl2W5e6yRvbUsA0LluQ1zMO+6SKAR6TOsd0fwWMikE11Z
 ffeGEoS7nbQeBi3mdFdg3IXXN4HgcbN7kwdzXlPdNQxiLFivTQ3MEH4Dj6cm0SWDK3N9
 0f3xrgA2Nj3e0o8jyUdPKdB4aROQOI1qiGOJcJsk/fhYIkmj2ZA+c6+uHfj+Yns/X50r
 zA7O0NaLz/E4tKH9ghtinU4ctoniiWjciPpd5TISWpSZSELlnaOED1lGgi4c4KIytiq3
 hXXQ==
X-Gm-Message-State: AOAM532pW855+yeIda3e0xeVAy6Rbb+KSRz/JoqyAzRklHfqbcDmaeyL
 x15nkl6KBRl1etGkQ/oelRk4gg==
X-Google-Smtp-Source: ABdhPJyQqOXVFa0AWxv/APlQyrdA+w7DqHfNJLE5LIIILIY1tjbP6/hW3QXi5M1V5H9nUHof0O9/lw==
X-Received: by 2002:a17:902:6181:: with SMTP id
 u1mr1929724plj.205.1594868933459; 
 Wed, 15 Jul 2020 20:08:53 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id q20sm3015469pfn.111.2020.07.15.20.08.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jul 2020 20:08:51 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 1/3] usb: gadget: udc: Avoid tasklet passing a global
Date: Wed, 15 Jul 2020 20:08:45 -0700
Message-Id: <20200716030847.1564131-2-keescook@chromium.org>
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

There's no reason for the tasklet callback to set an argument since it
always uses a global. Instead, use the global directly, in preparation
for converting the tasklet subsystem to modern callback conventions.

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/usb/gadget/udc/snps_udc_core.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/gadget/udc/snps_udc_core.c b/drivers/usb/gadget/udc/snps_udc_core.c
index 3fcded31405a..afdd28f332ce 100644
--- a/drivers/usb/gadget/udc/snps_udc_core.c
+++ b/drivers/usb/gadget/udc/snps_udc_core.c
@@ -96,9 +96,7 @@ static int stop_pollstall_timer;
 static DECLARE_COMPLETION(on_pollstall_exit);
 
 /* tasklet for usb disconnect */
-static DECLARE_TASKLET(disconnect_tasklet, udc_tasklet_disconnect,
-		(unsigned long) &udc);
-
+static DECLARE_TASKLET(disconnect_tasklet, udc_tasklet_disconnect, 0);
 
 /* endpoint names used for print */
 static const char ep0_string[] = "ep0in";
@@ -1661,7 +1659,7 @@ static void usb_disconnect(struct udc *dev)
 /* Tasklet for disconnect to be outside of interrupt context */
 static void udc_tasklet_disconnect(unsigned long par)
 {
-	struct udc *dev = (struct udc *)(*((struct udc **) par));
+	struct udc *dev = udc;
 	u32 tmp;
 
 	DBG(dev, "Tasklet disconnect\n");
-- 
2.25.1

