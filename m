Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 18279221D3A
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Jul 2020 09:22:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A90B71607;
	Thu, 16 Jul 2020 09:21:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A90B71607
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594884137;
	bh=QzAIy3WcNYaqI1YVC6MG03iWRhYAIVKVHJ5UFwQxn7Q=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=PEkEr64g2KIfOm2wzNiNYN4zwrPxqVKINENVFpSiSKkzwELvcae3l4Yr15t/gaGdb
	 AATdZWxRGUImxoidKK1uiyPCk4OM7VKPknIxNuCOKjrmht4wosxADNfMW5onvW/1Ar
	 SyaoO0iDfJpoKXXxKCgLHjX0J4shzGC/xtSZ2QDc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F18C5F802D2;
	Thu, 16 Jul 2020 09:18:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 47815F802BC; Thu, 16 Jul 2020 05:09:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 36FADF8020C
 for <alsa-devel@alsa-project.org>; Thu, 16 Jul 2020 05:08:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 36FADF8020C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="ntnEdubb"
Received: by mail-pj1-x1044.google.com with SMTP id mn17so4094161pjb.4
 for <alsa-devel@alsa-project.org>; Wed, 15 Jul 2020 20:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/eo13gw5fJCvhJnxKm6L26qmA1xy2iBEtE20aAjPg9o=;
 b=ntnEdubbdqpGPgOV96gJLeIOeDJD9bl8sWEZchgJzsbJoRlAxafbTPHiU+bBiSM9Ay
 Bb6I6dJreCIWt+SNvx3uSnD715S/LsJbtTBKRxlploZohP5A0IMBAo41xfxzSg+BNCgv
 UyZA7zqZ2jt8SIod07xOd5QbCCRaueqNa4gOI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/eo13gw5fJCvhJnxKm6L26qmA1xy2iBEtE20aAjPg9o=;
 b=bl3nNwZ5F+vk1B16L+uTs34cu5lY58xsmp2Fdr0AR0aCTZPWgPhotmkJssMZtYSF41
 9J74O+Q63hy3ixxNgTAXelta44JUlR3JuWWBq29HiYmNBLOz2V/g1ptrjjOOaMVci/zS
 p15fM651yi+a5zyxPGJwETIJslai8UUw0BwxkzjONGgPwOCrdeKakpcB/BAD3/i+dqfP
 bEo60oT1apR7FByQc6CmK95fMNyh68ZoXJ+whiWSRNoBrZiz7UJiCkb5QOHDjR9xVCto
 cqfg5xTB/fXMI+YjvXsSKgTFmMMiAcfy9JDdziTyaISY4LRdZXyy1dIcOyXQK/kQd0Ct
 cCnQ==
X-Gm-Message-State: AOAM530z/QHxT49wYWWXl88/RgrPafqF6VKg+jNa3oXtxP2Y9z9gakN/
 SFJU7j2taED2NFGZ8I/mo+4CRw==
X-Google-Smtp-Source: ABdhPJyJvjSFUmwOZKl8hOEZtdbgisML9TaMY9zA2DquJ5wPNkSNvu+LzxqBXFwknWNq3+GQp8EoZw==
X-Received: by 2002:a17:902:ee8b:: with SMTP id
 a11mr1923650pld.26.1594868932899; 
 Wed, 15 Jul 2020 20:08:52 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id x7sm2909172pfp.96.2020.07.15.20.08.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jul 2020 20:08:51 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 0/3] Modernize tasklet callback API
Date: Wed, 15 Jul 2020 20:08:44 -0700
Message-Id: <20200716030847.1564131-1-keescook@chromium.org>
X-Mailer: git-send-email 2.25.1
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

Hi,

This is the infrastructure changes to prepare the tasklet API for
conversion to passing the tasklet struct as the callback argument instead
of an arbitrary unsigned long. The first patch details why this is useful
(it's the same rationale as the timer_struct changes from a bit ago:
less abuse during memory corruption attacks, more in line with existing
ways of doing things in the kernel, save a little space in struct,
etc). Notably, the existing tasklet API use is much less messy, so there
is less to clean up.

It's not clear to me which tree this should go through... Greg since it
starts with a USB clean-up, -tip for timer or interrupt, or if I should
just carry it. I'm open to suggestions, but if I don't hear otherwise,
I'll just carry it.

My goal is to have this merged for v5.9-rc1 so that during the v5.10
development cycle the new API will be available. The entire tree of
changes is here[1] currently, but to split it up by maintainer the
infrastructure changes need to be landed first.

Review and Acks appreciated! :)

Thanks,

-Kees

[1] https://github.com/allenpais/tasklets/commits/tasklets_V2

Kees Cook (2):
  usb: gadget: udc: Avoid tasklet passing a global
  treewide: Replace DECLARE_TASKLET() with DECLARE_TASKLET_OLD()

Romain Perier (1):
  tasklet: Introduce new initialization API

 drivers/input/keyboard/omap-keypad.c   |  2 +-
 drivers/input/serio/hil_mlc.c          |  2 +-
 drivers/net/wan/farsync.c              |  4 +--
 drivers/s390/crypto/ap_bus.c           |  2 +-
 drivers/staging/most/dim2/dim2.c       |  2 +-
 drivers/staging/octeon/ethernet-tx.c   |  2 +-
 drivers/tty/vt/keyboard.c              |  2 +-
 drivers/usb/gadget/udc/snps_udc_core.c |  6 ++---
 drivers/usb/host/fhci-sched.c          |  2 +-
 include/linux/interrupt.h              | 37 ++++++++++++++++++++++----
 kernel/backtracetest.c                 |  2 +-
 kernel/debug/debug_core.c              |  2 +-
 kernel/irq/resend.c                    |  2 +-
 kernel/softirq.c                       | 18 ++++++++++++-
 net/atm/pppoatm.c                      |  2 +-
 net/iucv/iucv.c                        |  2 +-
 sound/drivers/pcsp/pcsp_lib.c          |  2 +-
 17 files changed, 66 insertions(+), 25 deletions(-)

-- 
2.25.1

