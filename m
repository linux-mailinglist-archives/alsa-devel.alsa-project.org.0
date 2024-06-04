Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 493FC9077BE
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jun 2024 18:04:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 90569DEC;
	Thu, 13 Jun 2024 18:04:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 90569DEC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718294683;
	bh=72AZit+fGSAltF/zxrshQ3AcOBabtAGvP903E1S/6ZE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=sIWgqYbFFGwTculbley6WmPtWx/nEQDLJ2HFQhZXoillvv/CorsdxKML6vGi1DzgF
	 lOG+7tqM1sHPYtsz3un7RJQyJdCP4GyOau8Bf8IuPmbBC2MHmh5FvNIqIXWAko4Fk8
	 6LYafAeqMrxcedQTOFQqtquNHEI2gZQ0Flh76lGg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 79CAAF808C0; Thu, 13 Jun 2024 18:02:11 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E5B5BF8081A;
	Thu, 13 Jun 2024 18:02:10 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D465BF802DB; Tue,  4 Jun 2024 09:46:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BD1EEF80088
	for <alsa-devel@alsa-project.org>; Tue,  4 Jun 2024 09:46:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BD1EEF80088
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=FlmkwxeU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717487199; x=1749023199;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=72AZit+fGSAltF/zxrshQ3AcOBabtAGvP903E1S/6ZE=;
  b=FlmkwxeU65qUu9LmX22DoXf+VVe2eUBCs1xzO+58UKKg498VUDAnQ31E
   KUfwMpUesJlxKmKz5aqXPLM6xTBR+BEzOg6p5bRmtLyBd3ojtRBnRbmb/
   h8ykHjjbcVsiWL7tajg0Ik2DGK5gaQ+kiM8JYccFnDeIXuyDddtR0ciRr
   sk5Tr5y8Ub7Xhh73mCVCtH00jKaa5g4kNNy7QeaOFyDfsK8K6RKXAHJkI
   YVr/1zc1S60kB/mQXfwH1TjcyCx/kJSDszODtUZLcAoTH5W/JXwOIGe6/
   VWcbn25kmlx0RGeACBUjl2eiNPwaRZOaf6BahGjrls7uET2567ejSuuFt
   A==;
X-CSE-ConnectionGUID: RDj1dBW3QkWu2rrTkUGtog==
X-CSE-MsgGUID: DT/ypXB0QSyfK98AKj0Qkw==
X-IronPort-AV: E=McAfee;i="6600,9927,11092"; a="25412054"
X-IronPort-AV: E=Sophos;i="6.08,213,1712646000";
   d="scan'208";a="25412054"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2024 00:46:30 -0700
X-CSE-ConnectionGUID: L1vS2iCsS0qNl7Ekvd+3Hw==
X-CSE-MsgGUID: FcxQSXvDT6KeINvTUaFx8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,213,1712646000";
   d="scan'208";a="37269403"
Received: from mwiniars-desk2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.102])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2024 00:45:40 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, "Rafael J. Wysocki"
 <rafael.j.wysocki@intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Corey Minyard <minyard@acm.org>, Allen Pais
 <apais@linux.microsoft.com>, Sebastian Reichel
 <sebastian.reichel@collabora.com>, Perry Yuan <perry.yuan@amd.com>,
 Giovanni Cabiddu <giovanni.cabiddu@intel.com>, Herbert Xu
 <herbert@gondor.apana.org.au>, Nuno Sa <nuno.sa@analog.com>, Guenter Roeck
 <linux@roeck-us.net>, Randy Dunlap <rdunlap@infradead.org>, Andi Shyti
 <andi.shyti@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>, Lee Jones
 <lee@kernel.org>, Samuel Holland <samuel@sholland.org>, Elad Nachman
 <enachman@marvell.com>, Arseniy Krasnov <AVKrasnov@sberdevices.ru>,
 Johannes Berg <johannes.berg@intel.com>, Gregory Greenman
 <gregory.greenman@intel.com>, Benjamin Berg <benjamin.berg@intel.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Robert Richter <rrichter@amd.com>,
 Vinod Koul <vkoul@kernel.org>, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Linus Walleij <linus.walleij@linaro.org>, Hans de Goede
 <hdegoede@redhat.com>, Ilpo =?utf-8?Q?J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>,
 Nikita Kravets <teackot@gmail.com>, Jiri Slaby <jirislaby@kernel.org>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, Stanley Chang
 <stanley_chang@realtek.com>, Heikki Krogerus
 <heikki.krogerus@linux.intel.com>, Abdel Alkuor <abdelalkuor@geotab.com>,
 Kent Overstreet <kent.overstreet@linux.dev>, Eric Biggers
 <ebiggers@google.com>, Kees Cook <keescook@chromium.org>, Ingo Molnar
 <mingo@kernel.org>, "Steven Rostedt (Google)" <rostedt@goodmis.org>,
 Daniel Bristot de Oliveira <bristot@kernel.org>, Andrew Morton
 <akpm@linux-foundation.org>, Hugh Dickins <hughd@google.com>, Abel Wu
 <wuyun.abel@bytedance.com>, John Johansen <john.johansen@canonical.com>,
 Mimi Zohar <zohar@linux.ibm.com>, Stefan Berger <stefanb@linux.ibm.com>,
 Roberto Sassu <roberto.sassu@huawei.com>, Eric Snowberg
 <eric.snowberg@oracle.com>, Takashi Iwai <tiwai@suse.de>, Takashi Sakamoto
 <o-takashi@sakamocchi.jp>, Jiapeng Chong
 <jiapeng.chong@linux.alibaba.com>, Mark Brown <broonie@kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 keyrings@vger.kernel.org, linux-crypto@vger.kernel.org,
 linux-acpi@vger.kernel.org, linux-ide@vger.kernel.org,
 openipmi-developer@lists.sourceforge.net, linux-clk@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-tegra@vger.kernel.org, linux-pm@vger.kernel.org,
 qat-linux@intel.com, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-hwmon@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-leds@vger.kernel.org,
 linux-sunxi@lists.linux.dev, linux-omap@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org,
 netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-phy@lists.infradead.org, linux-gpio@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-usb@vger.kernel.org, linux-fbdev@vger.kernel.org,
 linux-bcachefs@vger.kernel.org, linux-hardening@vger.kernel.org,
 cgroups@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 linux-mm@kvack.org, apparmor@lists.ubuntu.com,
 linux-security-module@vger.kernel.org, linux-integrity@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
Cc: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin
 <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>,
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Thomas Gleixner
 <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov
 <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, David Howells <dhowells@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Len Brown <lenb@kernel.org>, Sergey Shtylyov
 <s.shtylyov@omp.ru>, Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel
 <cassel@kernel.org>, Daniel Scally <djrscally@gmail.com>, Sakari Ailus
 <sakari.ailus@linux.intel.com>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Florian
 Fainelli <florian.fainelli@broadcom.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>, Broadcom internal kernel review
 list <bcm-kernel-feedback-list@broadcom.com>, Heiko Stuebner
 <heiko@sntech.de>, Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant
 Gaikwad <pgaikwad@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Huang Rui <ray.huang@amd.com>,
 "Gautham R. Shenoy" <gautham.shenoy@amd.com>, Mario Limonciello
 <mario.limonciello@amd.com>, Viresh Kumar <viresh.kumar@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>, Danilo
 Krummrich <dakr@redhat.com>, Jean Delvare <jdelvare@suse.com>, Alexander
 Shishkin <alexander.shishkin@linux.intel.com>, Pavel Machek
 <pavel@ucw.cz>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Tony Lindgren <tony@atomide.com>, Adrian
 Hunter <adrian.hunter@intel.com>, Hu Ziji <huziji@marvell.com>, Ulf
 Hansson <ulf.hansson@linaro.org>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, Potnuri Bharat Teja <bharat@chelsio.com>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Miri Korenblit
 <miriam.rachel.korenblit@intel.com>, Kalle Valo <kvalo@kernel.org>, Mahesh
 J Salgaonkar <mahesh@linux.ibm.com>, Oliver O'Halloran <oohall@gmail.com>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, JC Kuo <jckuo@nvidia.com>,
 Andrew Lunn <andrew@lunn.ch>, Gregory Clement
 <gregory.clement@bootlin.com>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, Sebastian Reichel <sre@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui
 <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, Thinh Nguyen
 <Thinh.Nguyen@synopsys.com>, Helge Deller <deller@gmx.de>, Brian Foster
 <bfoster@redhat.com>, Zhihao Cheng <chengzhihao1@huawei.com>, Tejun Heo
 <tj@kernel.org>, Zefan Li <lizefan.x@bytedance.com>, Johannes Weiner
 <hannes@cmpxchg.org>, Peter Zijlstra <peterz@infradead.org>, Juri Lelli
 <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>, Ben Segall
 <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, Daniel Bristot de
 Oliveira <bristot@redhat.com>, Valentin Schneider <vschneid@redhat.com>,
 Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, Jason Baron <jbaron@akamai.com>, Jim
 Cromie <jim.cromie@gmail.com>, Paul Moore <paul@paul-moore.com>, James
 Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, Dmitry
 Kasatkin <dmitry.kasatkin@gmail.com>, Clemens Ladisch
 <clemens@ladisch.de>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
 <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, Linus Torvalds
 <torvalds@linux-foundation.org>
Subject: Re: [PATCH v1 1/1] treewide: Align match_string() with
 sysfs_match_string()
In-Reply-To: <20240603211538.289765-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240603211538.289765-1-andriy.shevchenko@linux.intel.com>
Date: Tue, 04 Jun 2024 10:45:37 +0300
Message-ID: <87tti9cfry.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MailFrom: jani.nikula@intel.com
X-Mailman-Rule-Hits: max-recipients
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-size; news-moderation; no-subject; digests;
 suspicious-header
Message-ID-Hash: PG3KRENMNJ2ZAFLJA7G5CAMGEX2JG3HI
X-Message-ID-Hash: PG3KRENMNJ2ZAFLJA7G5CAMGEX2JG3HI
X-Mailman-Approved-At: Thu, 13 Jun 2024 16:01:49 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PG3KRENMNJ2ZAFLJA7G5CAMGEX2JG3HI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sun, 02 Jun 2024, Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> Make two APIs look similar. Hence convert match_string() to be
> a 2-argument macro. In order to avoid unneeded churn, convert
> all users as well. There is no functional change intended.

Why do we think it's a good idea to increase and normalize the use of
double-underscore function names across the kernel, like
__match_string() in this case? It should mean "reserved for the
implementation, not to be called directly".

If it's to be used directly, it should be named accordingly, right?

Being in line with __sysfs_match_string() isn't a great argument alone,
because this adds three times the number of __match_string() calls than
there are __sysfs_match_string() calls. It's not a good model to follow.
Arguably both should be renamed.

BR,
Jani.


-- 
Jani Nikula, Intel
