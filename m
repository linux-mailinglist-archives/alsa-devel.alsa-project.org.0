Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EFBC29077F4
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jun 2024 18:12:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3C80E211B;
	Thu, 13 Jun 2024 18:12:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3C80E211B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718295166;
	bh=/L5y1Dv6ivY3eszYnYmdXRYc401x9YYY2yBAmmyUG/k=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=p2oB/vvicEeDS8jYjQLZI2dKhx979MYXCm24qm9mHY0Eg7Z5xZvMB3PLKXqCUDNkZ
	 fuCNIk+ky1S+uPFfPJ7xcksWExP3FQIpVsNoncIyoGgYvhgL7l7EV2e6F4eYIgs+/X
	 kderBjUUATBMFZEFafWviYRxBKzOEVzCf2D5cpss=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D3261F80707; Thu, 13 Jun 2024 18:04:34 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A4942F8060D;
	Thu, 13 Jun 2024 18:04:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6C2CAF8028D; Mon, 10 Jun 2024 10:08:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C3964F80130
	for <alsa-devel@alsa-project.org>; Mon, 10 Jun 2024 10:08:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C3964F80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=B03qN2gY
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-52c525257feso2195119e87.1
        for <alsa-devel@alsa-project.org>;
 Mon, 10 Jun 2024 01:08:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718006892; x=1718611692;
 darn=alsa-project.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/L5y1Dv6ivY3eszYnYmdXRYc401x9YYY2yBAmmyUG/k=;
        b=B03qN2gYft3/xBlWeqQL3Y3Ry2aErt5bXuqoJEQIG8IgG2xNYUlaKM4a2ghcvtUVUu
         GtBTYWjvnU4IQQFsDFDI9hxu7HygUZ3S2hxyLoIW+llZhzOi7AwSehl8AiqNS8yd+p+T
         sIXuyVTFAampXqyex0GZP4mto+W399tIBt1hBkAvrzKF5a/qUm8AaGzFyBRQLChT6je1
         UJ21x+5BhHw3PAapKNK3v26FMbG+FR7rkm1R+oNDVwq/FkIezdzqxL8SbmOHIoEp9Z2R
         V8rm0JyGGSUxg8mU23DqeKZ2Vu1pXI9OtkQjPk2wcVdLgoC06pXZR3tQt3Kcc88a4CRr
         5uzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718006892; x=1718611692;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/L5y1Dv6ivY3eszYnYmdXRYc401x9YYY2yBAmmyUG/k=;
        b=KvaSpX5udkfmUP0zZ4jLuy4LtF9xWETw9k/Zk1bCmIDatwl4C1C00uHd+O8vHu+65x
         2vxqryhoH0Dhhin3iycilvNeGdiX4r4D8PyJuteTsa8x4CHWmq5MWO73VlhMPQLEGYN6
         gImIUXwD+qhD7mFsnf60eZD3C/GOB847lZIZUShLap+mJDgbSgDxFgEndKgnzppIVMUn
         4audYvAiSRs5QH1NtPfhOl51BwPtpPdOBzJAfVTfvO+OuvFSzSr8G0OjC93p3n+lDF3g
         g4lHjQBzQUGsHcS7n+3LBmz9sJky+vT0BIFnIzUw9XvaGuH1puiKpjo9gO/FmRvMb8Ha
         5ieQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUdan5HrROHo5zVIizoZmht1KHhHmt22w3dakBBkJ+R/Pf2v+hwx9HebvlNvD4dBNdogHMQz+mw4IGMgBvhjyfP7nOqImWAVlmCzvc=
X-Gm-Message-State: AOJu0YzMQUiqigXGMN30QBFJqCqfTBP8RVzEkumLehkaMTp4bfXhFGF5
	00hZSLm7OCMwvwBVllaoYq15zMk+veKPs52eVKuyx8d0LIZa6n2DX4fWo8nxz9mzj8kGL4Bfje1
	MqqjIKEje86mbnDoObFGlbH6UUWNj3Y1I5skY4A==
X-Google-Smtp-Source: 
 AGHT+IEoIIaopVbMhKiBzu+ZFeFG117iZrYhuaSy1PLsnicMvCE0nAaF1iUL9hhnUeVtUHqe9i20V059/u6XmSWe6yI=
X-Received: by 2002:a05:6512:234d:b0:52b:be9b:cafe with SMTP id
 2adb3069b0e04-52bbe9bcbadmr5940256e87.21.1718006892189; Mon, 10 Jun 2024
 01:08:12 -0700 (PDT)
MIME-Version: 1.0
References: <20240603211538.289765-1-andriy.shevchenko@linux.intel.com>
 <87tti9cfry.fsf@intel.com>
In-Reply-To: <87tti9cfry.fsf@intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 10 Jun 2024 10:08:00 +0200
Message-ID: 
 <CACRpkdZFPG_YLici-BmYfk9HZ36f4WavCN3JNotkk8cPgCODCg@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] treewide: Align match_string() with
 sysfs_match_string()
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Corey Minyard <minyard@acm.org>,
	Allen Pais <apais@linux.microsoft.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
 Perry Yuan <perry.yuan@amd.com>,
	Giovanni Cabiddu <giovanni.cabiddu@intel.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
	Nuno Sa <nuno.sa@analog.com>, Guenter Roeck <linux@roeck-us.net>,
	Randy Dunlap <rdunlap@infradead.org>, Andi Shyti <andi.shyti@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>, Lee Jones <lee@kernel.org>,
	Samuel Holland <samuel@sholland.org>, Elad Nachman <enachman@marvell.com>,
	Arseniy Krasnov <AVKrasnov@sberdevices.ru>,
 Johannes Berg <johannes.berg@intel.com>,
	Gregory Greenman <gregory.greenman@intel.com>,
 Benjamin Berg <benjamin.berg@intel.com>,
	Bjorn Helgaas <bhelgaas@google.com>, Robert Richter <rrichter@amd.com>,
 Vinod Koul <vkoul@kernel.org>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Nikita Kravets <teackot@gmail.com>, Jiri Slaby <jirislaby@kernel.org>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	Stanley Chang <stanley_chang@realtek.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Abdel Alkuor <abdelalkuor@geotab.com>,
	Kent Overstreet <kent.overstreet@linux.dev>,
 Eric Biggers <ebiggers@google.com>,
	Kees Cook <keescook@chromium.org>, Ingo Molnar <mingo@kernel.org>,
	"Steven Rostedt (Google)" <rostedt@goodmis.org>,
 Daniel Bristot de Oliveira <bristot@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>, Hugh Dickins <hughd@google.com>,
	Abel Wu <wuyun.abel@bytedance.com>,
 John Johansen <john.johansen@canonical.com>,
	Mimi Zohar <zohar@linux.ibm.com>, Stefan Berger <stefanb@linux.ibm.com>,
	Roberto Sassu <roberto.sassu@huawei.com>,
 Eric Snowberg <eric.snowberg@oracle.com>,
	Takashi Iwai <tiwai@suse.de>, Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
 Mark Brown <broonie@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, keyrings@vger.kernel.org,
	linux-crypto@vger.kernel.org, linux-acpi@vger.kernel.org,
	linux-ide@vger.kernel.org, openipmi-developer@lists.sourceforge.net,
	linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
	linux-tegra@vger.kernel.org, linux-pm@vger.kernel.org, qat-linux@intel.com,
	dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org, nouveau@lists.freedesktop.org,
	linux-hwmon@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-leds@vger.kernel.org, linux-sunxi@lists.linux.dev,
	linux-omap@vger.kernel.org, linux-mmc@vger.kernel.org,
	linux-mtd@lists.infradead.org, netdev@vger.kernel.org,
	linux-wireless@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org,
	linux-gpio@vger.kernel.org, platform-driver-x86@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-usb@vger.kernel.org,
	linux-fbdev@vger.kernel.org, linux-bcachefs@vger.kernel.org,
	linux-hardening@vger.kernel.org, cgroups@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org, linux-mm@kvack.org,
	apparmor@lists.ubuntu.com, linux-security-module@vger.kernel.org,
	linux-integrity@vger.kernel.org, alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
 Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, David Howells <dhowells@redhat.com>,
	"David S. Miller" <davem@davemloft.net>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
	Sergey Shtylyov <s.shtylyov@omp.ru>, Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>, Daniel Scally <djrscally@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
 Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Heiko Stuebner <heiko@sntech.de>,
	Peter De Schrijver <pdeschrijver@nvidia.com>,
 Prashant Gaikwad <pgaikwad@nvidia.com>,
	Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
	Huang Rui <ray.huang@amd.com>, "Gautham R. Shenoy" <gautham.shenoy@amd.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
 Viresh Kumar <viresh.kumar@linaro.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@redhat.com>, Jean Delvare <jdelvare@suse.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Pavel Machek <pavel@ucw.cz>,
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
	Tony Lindgren <tony@atomide.com>, Adrian Hunter <adrian.hunter@intel.com>,
 Hu Ziji <huziji@marvell.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
	Potnuri Bharat Teja <bharat@chelsio.com>, Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Miri Korenblit <miriam.rachel.korenblit@intel.com>,
 Kalle Valo <kvalo@kernel.org>,
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
 "Oliver O'Halloran" <oohall@gmail.com>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 JC Kuo <jckuo@nvidia.com>,
	Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Sebastian Reichel <sre@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Helge Deller <deller@gmx.de>, Brian Foster <bfoster@redhat.com>,
	Zhihao Cheng <chengzhihao1@huawei.com>, Tejun Heo <tj@kernel.org>,
	Zefan Li <lizefan.x@bytedance.com>, Johannes Weiner <hannes@cmpxchg.org>,
	Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Daniel Bristot de Oliveira <bristot@redhat.com>,
 Valentin Schneider <vschneid@redhat.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Jason Baron <jbaron@akamai.com>, Jim Cromie <jim.cromie@gmail.com>,
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
	"Serge E. Hallyn" <serge@hallyn.com>,
 Dmitry Kasatkin <dmitry.kasatkin@gmail.com>,
	Clemens Ladisch <clemens@ladisch.de>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
 Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-MailFrom: linus.walleij@linaro.org
X-Mailman-Rule-Hits: max-recipients
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-size; news-moderation; no-subject; digests;
 suspicious-header
Message-ID-Hash: R6I77QC6KZORAFB7K326GD4KAATM4UP5
X-Message-ID-Hash: R6I77QC6KZORAFB7K326GD4KAATM4UP5
X-Mailman-Approved-At: Thu, 13 Jun 2024 16:04:28 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/R6I77QC6KZORAFB7K326GD4KAATM4UP5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Jun 4, 2024 at 9:46=E2=80=AFAM Jani Nikula <jani.nikula@linux.intel=
.com> wrote:

[Maybe slightly off-topic, ranty]

> Why do we think it's a good idea to increase and normalize the use of
> double-underscore function names across the kernel, like
> __match_string() in this case? It should mean "reserved for the
> implementation, not to be called directly".
>
> If it's to be used directly, it should be named accordingly, right?

It's a huge mess. "__" prefix is just so ambiguous I think it just
shouldn't be used or prolifierated, and it usually breaks Rusty Russells
API rules times over.

Consider __set_bit() from <linux/bitops.h>, used all over the place,
in contrast with set_bit() for example, what does "__" represent in
this context that makes __set_bit() different from set_bit()?

It means "non-atomic"...

How does a random contributor know this?

Yeah, you guess it. By the token of "everybody knows that".
(Grep, google, repeat for the number of contributors to the kernel.)

I was considering to send a script to Torvalds to just change all
this to set_bit_nonatomic() (etc) but was hesitating because that
makes the name unambiguous but long. I think I stayed off it
because changing stuff like that all over the place creates churn
and churn is bad.

Yours,
Linus Walleij
