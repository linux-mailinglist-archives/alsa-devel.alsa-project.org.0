Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ECECF9077E0
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jun 2024 18:09:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2252D1060;
	Thu, 13 Jun 2024 18:09:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2252D1060
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718294974;
	bh=grQASJp14Bt7fZYtPF/BOiWWydFpPjbo/cl/eIyN7Yw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=gkQrhEITDdVV36GWE9CN5WbCyT8NCQvZ3oCXVzjCy3iudXRWhOUJWSR2DoVDHyAGJ
	 iboRd9I3aea7YtoUNGSf67mwGq/buBKA72ta3Of4vae4rYDT/d+rQj0GRon3ohLATW
	 Z8DkZofbT5I0+cVSdBp4m63P4RxphuhBok2Wv+sM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AE078F89794; Thu, 13 Jun 2024 18:02:59 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DADB8F896AA;
	Thu, 13 Jun 2024 18:02:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9D2B0F802DB; Tue,  4 Jun 2024 20:44:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 69250F8003A
	for <alsa-devel@alsa-project.org>; Tue,  4 Jun 2024 20:43:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 69250F8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org
 header.a=rsa-sha256 header.s=google header.b=Gx2FsF1i
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-52baa9026dcso384080e87.3
        for <alsa-devel@alsa-project.org>;
 Tue, 04 Jun 2024 11:43:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1717526596; x=1718131396;
 darn=alsa-project.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3Iay1wNfKZ5p2yKYQUB8UE9csohQVR6x64V5CAu9ZDo=;
        b=Gx2FsF1iMVAn/Upav4mwH418NUVddbryL8JY3dg50yIM/MduSt0IfuU2fGTYYr3o4U
         CRLoMBXOXK6nXZlkoSDB3gBkktN9CkGGa9egbXoRYwuY06zfgeLHyVmP4g+mZCoXodp4
         ptQx5ByouFRj0uQ5lZ16G5O3d1mBMtAd9nNbo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717526596; x=1718131396;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3Iay1wNfKZ5p2yKYQUB8UE9csohQVR6x64V5CAu9ZDo=;
        b=bcvZ6S9f3xUv0GT/qYjwW5vYeh9VBRVLyJV37i7oJYTjppM3rs/UkJNacFsZVvYvvk
         VjA73gF1DCpuMA7XRSp50vD+EUy90Td2UBIt3GhuATZxPTJiENEQpXY1j6Tr0LiLYclM
         nz4b1SHMfq9egS3vKQChU0UFls0aKdH0CH0LKQXhUow8yb4+BDGHYFdLfamcXiDlibZS
         ELZqYj/lZhVlWnURDdZ8+AscgIt8rh0wsbiRWjE2xNDuil//NsB9XMV+eitziHfNTrc7
         fogIEU1RD8jnLc7F0kDBW+rgl1J/HgUuIT7w6RWSFXXevE7m6VnOC8H5PAVAIJWsCGTr
         kXWg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXvEWCccI1pGXRVA57rJdvsZT/JUwnHwT9Ms8OV4fBWgboZUohKEdeJZgbDUAW546IjHYEnehQi0DLdw9VtaY39RSXwx3ruTvBcrA0=
X-Gm-Message-State: AOJu0YzuxHGGxI7J3ianG9d7sJNLWV1gfAjKHbtXpYOpEx0PKlWSKwlV
	LxEoKN8k3VskDHb2ANO8WYnml0muwwGS//hZGbzpOTn1L8Ffth/IRa8IYe7sr8hzLgOi+T7rV6k
	BYv9n5MWY
X-Google-Smtp-Source: 
 AGHT+IG+sbTdDPeSdeQJVRUnBfMVnJKEtnHqU22TNqAu+hU1Pg6xyNbwoRjJZsN6lOwNm504BP6tdw==
X-Received: by 2002:ac2:53ba:0:b0:524:6385:6883 with SMTP id
 2adb3069b0e04-52bab4d4702mr241781e87.37.1717526596452;
        Tue, 04 Jun 2024 11:43:16 -0700 (PDT)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com.
 [209.85.221.50])
        by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-57a35e86c36sm7644355a12.54.2024.06.04.11.43.15
        for <alsa-devel@alsa-project.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Jun 2024 11:43:15 -0700 (PDT)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-35dc9cef36dso5013303f8f.3
        for <alsa-devel@alsa-project.org>;
 Tue, 04 Jun 2024 11:43:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCX//GMhJlVD2/jMqxvH8NfrlOIsaTFoc/gazp9vAjcU368hmlaJg/cARKxSj6fjuDC05kw6AtX9t631xLKg9Vj6ZZcPYPzDNWG8/4Q=
X-Received: by 2002:a17:906:54b:b0:a62:2cae:c02 with SMTP id
 a640c23a62f3a-a69a024ce40mr20818866b.61.1717526574326; Tue, 04 Jun 2024
 11:42:54 -0700 (PDT)
MIME-Version: 1.0
References: <20240603211538.289765-1-andriy.shevchenko@linux.intel.com>
 <Zl9b_Wh_Lx7Aln1q@intel.com>
In-Reply-To: <Zl9b_Wh_Lx7Aln1q@intel.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 4 Jun 2024 11:42:36 -0700
X-Gmail-Original-Message-ID: 
 <CAHk-=whAnzrovfD8MtpRwfbkVxi-W61CqKxYdX+94r_uJeCT7w@mail.gmail.com>
Message-ID: 
 <CAHk-=whAnzrovfD8MtpRwfbkVxi-W61CqKxYdX+94r_uJeCT7w@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] treewide: Align match_string() with
 sysfs_match_string()
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
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
 Linus Walleij <linus.walleij@linaro.org>,
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
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
	Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
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
	Liam Girdwood <lgirdwood@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-MailFrom: torvalds@linuxfoundation.org
X-Mailman-Rule-Hits: max-recipients
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-size; news-moderation; no-subject; digests;
 suspicious-header
Message-ID-Hash: MIO4WWY4LI746SGUZBU4O5CTALRLIMRY
X-Message-ID-Hash: MIO4WWY4LI746SGUZBU4O5CTALRLIMRY
X-Mailman-Approved-At: Thu, 13 Jun 2024 16:02:38 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MIO4WWY4LI746SGUZBU4O5CTALRLIMRY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 4 Jun 2024 at 11:25, Rodrigo Vivi <rodrigo.vivi@intel.com> wrote:
>
> (I believe that the new _match_string(str1, size, str2) deserves a better name,
> but since I'm bad with naming stuff, I don't have any good suggestion)

I hated the enormous cc list, so I didn't reply to all. But clearly
everybody else is just doing so.

Anyway, here's my NAK for this patch with explanation:

    https://lore.kernel.org/all/CAHk-=wg5F99-GZPETsasJd0JB0JGcdmmPeHRxCtT4_i83h8avg@mail.gmail.com/

and part of it was the naming, but there were other oddities there too.

           Linus
