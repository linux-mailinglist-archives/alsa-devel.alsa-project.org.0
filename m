Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B6D179077D6
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jun 2024 18:07:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 09EF2210B;
	Thu, 13 Jun 2024 18:07:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 09EF2210B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718294865;
	bh=FArcXwplL8wN1ALhCuGpUD+BoCuPOB8+aNe29ijJswU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=NaJoDpsidCn61nyjYzMUMKrhHRtKhEDfZDKpMOHret2R5RqatH4PYDgUlYm/yHLKw
	 45+UjqsFG45tk+hfGIYOUdYmym7YtfB+57l2p1nfr7X5x0rZYcIzC2OpZoAGvU1wW4
	 /ksz+xq6MnicMUykNdS4ibMxuFOS1kr4ejeWdBnA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 77C70F896E5; Thu, 13 Jun 2024 18:02:46 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 43446F89725;
	Thu, 13 Jun 2024 18:02:46 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 03075F802DB; Tue,  4 Jun 2024 15:42:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E2289F8003A
	for <alsa-devel@alsa-project.org>; Tue,  4 Jun 2024 15:41:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E2289F8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=bXYkUdIM
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 29396CE116E;
	Tue,  4 Jun 2024 13:41:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BE38C2BBFC;
	Tue,  4 Jun 2024 13:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717508491;
	bh=FArcXwplL8wN1ALhCuGpUD+BoCuPOB8+aNe29ijJswU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bXYkUdIM5G5RAUoPD7MJYr//S1oqHl+LJ3fxfw7lfSFuBw8JhGTBW9PLufCUqHKjY
	 OJVFk7K+rOrq9HuH76qkiJL0A/sTi2rTQodn+TKkQocB/tbQHZeZKu3m3G2lM5wcf0
	 VD97GRCGMBes8MaOHcg8KM5fvFeye/FAQg9SKZN6tpIn5+9U5FE+VZJf0uRZu8AxbF
	 xrs4Rlqn5YOUS7D0btNT9APFrOK0n1Q8HZ/ji58Sj2kGEhPit3yyT7IaR0HjrbKKbe
	 82WAiCP1NrKaOO3384inkZ8fhbN5SYnrWSCyMgS7pEXOOMKSO77chS2wlgGdCmIr5c
	 AAtt4MysOip3g==
Date: Tue, 4 Jun 2024 14:41:26 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Corey Minyard <minyard@acm.org>,
	Allen Pais <apais@linux.microsoft.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
	Perry Yuan <perry.yuan@amd.com>,
 Giovanni Cabiddu <giovanni.cabiddu@intel.com>,
	Herbert Xu <herbert@gondor.apana.org.au>, Nuno Sa <nuno.sa@analog.com>,
 Guenter Roeck <linux@roeck-us.net>,
	Randy Dunlap <rdunlap@infradead.org>, Heiner Kallweit <hkallweit1@gmail.com>,
	Lee Jones <lee@kernel.org>, Samuel Holland <samuel@sholland.org>,
	Elad Nachman <enachman@marvell.com>,
 Arseniy Krasnov <AVKrasnov@sberdevices.ru>,
	Johannes Berg <johannes.berg@intel.com>,
 Gregory Greenman <gregory.greenman@intel.com>,
	Benjamin Berg <benjamin.berg@intel.com>, Bjorn Helgaas <bhelgaas@google.com>,
	Robert Richter <rrichter@amd.com>, Vinod Koul <vkoul@kernel.org>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Linus Walleij <linus.walleij@linaro.org>,
	Hans de Goede <hdegoede@redhat.com>,
 Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
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
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	keyrings@vger.kernel.org, linux-crypto@vger.kernel.org,
 linux-acpi@vger.kernel.org,
	linux-ide@vger.kernel.org, openipmi-developer@lists.sourceforge.net,
	linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-tegra@vger.kernel.org,
	linux-pm@vger.kernel.org, qat-linux@intel.com,
 dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 nouveau@lists.freedesktop.org,
	linux-hwmon@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-leds@vger.kernel.org,
	linux-sunxi@lists.linux.dev, linux-omap@vger.kernel.org,
 linux-mmc@vger.kernel.org,
	linux-mtd@lists.infradead.org, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-phy@lists.infradead.org, linux-gpio@vger.kernel.org,
 platform-driver-x86@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-usb@vger.kernel.org,
 linux-fbdev@vger.kernel.org,
	linux-bcachefs@vger.kernel.org, linux-hardening@vger.kernel.org,
 cgroups@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org, linux-mm@kvack.org,
 apparmor@lists.ubuntu.com,
	linux-security-module@vger.kernel.org, linux-integrity@vger.kernel.org,
 alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
 Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>,
	David Howells <dhowells@redhat.com>, "David S. Miller" <davem@davemloft.net>,
	"Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 Sergey Shtylyov <s.shtylyov@omp.ru>,
	Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>,
	Daniel Scally <djrscally@gmail.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
 Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
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
	Daniel Vetter <daniel@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@redhat.com>, Jean Delvare <jdelvare@suse.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Pavel Machek <pavel@ucw.cz>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>, Tony Lindgren <tony@atomide.com>,
	Adrian Hunter <adrian.hunter@intel.com>, Hu Ziji <huziji@marvell.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
	Potnuri Bharat Teja <bharat@chelsio.com>, Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Miri Korenblit <miriam.rachel.korenblit@intel.com>,
 Kalle Valo <kvalo@kernel.org>,
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
 Oliver O'Halloran <oohall@gmail.com>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 JC Kuo <jckuo@nvidia.com>, Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Sebastian Reichel <sre@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Helge Deller <deller@gmx.de>,
 Brian Foster <bfoster@redhat.com>,
	Zhihao Cheng <chengzhihao1@huawei.com>, Tejun Heo <tj@kernel.org>,
 Zefan Li <lizefan.x@bytedance.com>,
	Johannes Weiner <hannes@cmpxchg.org>, Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Ben Segall <bsegall@google.com>,
 Mel Gorman <mgorman@suse.de>,
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
Subject: Re: [PATCH v1 1/1] treewide: Align match_string() with
 sysfs_match_string()
Message-ID: <3ojs6btxgava4dcasys5tnrg5vsrqlshagcg7otvrdgfcwwje4@lcrd3r6gkfcs>
References: <20240603211538.289765-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240603211538.289765-1-andriy.shevchenko@linux.intel.com>
X-MailFrom: andi.shyti@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: IBLWXBCD6IQZULX4XZA5QYCMMDR7PJND
X-Message-ID-Hash: IBLWXBCD6IQZULX4XZA5QYCMMDR7PJND
X-Mailman-Approved-At: Thu, 13 Jun 2024 16:02:21 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IBLWXBCD6IQZULX4XZA5QYCMMDR7PJND/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Andy,

On Sun, Jun 02, 2024 at 06:57:12PM +0300, Andy Shevchenko wrote:
> Make two APIs look similar. Hence convert match_string() to be
> a 2-argument macro. In order to avoid unneeded churn, convert
> all users as well. There is no functional change intended.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

nice patch, I checked some (maybe most) of your changes. There
are a few unrelated changes which I don't mind, but there are two
errors where the error value changes from ENODEV to EINVAL.

Find the comments through the line.

...

> diff --git a/drivers/cpufreq/amd-pstate.c b/drivers/cpufreq/amd-pstate.c
> index 1b7e82a0ad2e..b6f52f44625f 100644
> --- a/drivers/cpufreq/amd-pstate.c
> +++ b/drivers/cpufreq/amd-pstate.c
> @@ -1117,9 +1117,9 @@ static ssize_t store_energy_performance_preference(
>  	if (ret != 1)
>  		return -EINVAL;
>  
> -	ret = match_string(energy_perf_strings, -1, str_preference);
> +	ret = __match_string(energy_perf_strings, -1, str_preference);
>  	if (ret < 0)
> -		return -EINVAL;
> +		return ret;

a bit of unrelated changes here, but I guess no one will complain :-)

>  
>  	mutex_lock(&amd_pstate_limits_lock);
>  	ret = amd_pstate_set_energy_pref_index(cpudata, ret);

...

> diff --git a/drivers/mmc/host/sdhci-xenon-phy.c b/drivers/mmc/host/sdhci-xenon-phy.c
> index cc9d28b75eb9..1865e26ae736 100644
> --- a/drivers/mmc/host/sdhci-xenon-phy.c
> +++ b/drivers/mmc/host/sdhci-xenon-phy.c
> @@ -135,15 +135,14 @@ struct xenon_emmc_phy_regs {
>  	u32 logic_timing_val;
>  };
>  
> -static const char * const phy_types[] = {
> -	"emmc 5.0 phy",
> -	"emmc 5.1 phy"
> -};
> -
>  enum xenon_phy_type_enum {
>  	EMMC_5_0_PHY,
>  	EMMC_5_1_PHY,
> -	NR_PHY_TYPES
> +};
> +
> +static const char * const phy_types[] = {
> +	[EMMC_5_0_PHY] = "emmc 5.0 phy",
> +	[EMMC_5_1_PHY] = "emmc 5.1 phy",
>  };

Another unrelated cleanup, but I don't complain

>  enum soc_pad_ctrl_type {

...

> -	tablet_found = match_string(tablet_chassis_types,
> -				    ARRAY_SIZE(tablet_chassis_types),
> -				    chassis_type) >= 0;
> -	if (!tablet_found)
> -		return -ENODEV;
> +	ret = match_string(tablet_chassis_types, chassis_type);
> +	if (ret < 0)
> +		return ret;

This is a logical change though, because we are changing from
-ENODEV to -EINVAL. Even if it might look the right thing, but
still, it's a logical change.

>  
>  	ret = hp_wmi_perform_query(HPWMI_SYSTEM_DEVICE_MODE, HPWMI_READ,
>  				   system_device_mode, zero_if_sup(system_device_mode),
> @@ -490,9 +487,7 @@ static bool is_omen_thermal_profile(void)
>  	if (!board_name)
>  		return false;
>  
> -	return match_string(omen_thermal_profile_boards,
> -			    ARRAY_SIZE(omen_thermal_profile_boards),
> -			    board_name) >= 0;
> +	return match_string(omen_thermal_profile_boards, board_name) >= 0;
>  }
>  
>  static int omen_get_thermal_policy_version(void)

...

> diff --git a/drivers/thermal/intel/int340x_thermal/processor_thermal_rfim.c b/drivers/thermal/intel/int340x_thermal/processor_thermal_rfim.c
> index e56db75a94fb..dbd176b0fb1f 100644
> --- a/drivers/thermal/intel/int340x_thermal/processor_thermal_rfim.c
> +++ b/drivers/thermal/intel/int340x_thermal/processor_thermal_rfim.c
> @@ -111,7 +111,7 @@ static ssize_t suffix##_show(struct device *dev,\
>  		match_strs = (const char **)fivr_strings;\
>  		mmio_regs = tgl_fivr_mmio_regs;\
>  	} \
> -	ret = match_string(match_strs, -1, attr->attr.name);\
> +	ret = __match_string(match_strs, -1, attr->attr.name);\
>  	if (ret < 0)\
>  		return ret;\
>  	reg_val = readl((void __iomem *) (proc_priv->mmio_base + mmio_regs[ret].offset));\
> @@ -145,7 +145,7 @@ static ssize_t suffix##_store(struct device *dev,\
>  		mmio_regs = tgl_fivr_mmio_regs;\
>  	} \
>  	\
> -	ret = match_string(match_strs, -1, attr->attr.name);\
> +	ret = __match_string(match_strs, -1, attr->attr.name);\
>  	if (ret < 0)\
>  		return ret;\
>  	if (mmio_regs[ret].read_only)\
> diff --git a/drivers/thermal/intel/int340x_thermal/processor_thermal_wt_req.c b/drivers/thermal/intel/int340x_thermal/processor_thermal_wt_req.c
> index f298e7442662..57f456befb34 100644
> --- a/drivers/thermal/intel/int340x_thermal/processor_thermal_wt_req.c
> +++ b/drivers/thermal/intel/int340x_thermal/processor_thermal_wt_req.c
> @@ -50,7 +50,7 @@ static ssize_t workload_type_store(struct device *dev,
>  	if (ret != 1)
>  		return -EINVAL;
>  
> -	ret = match_string(workload_types, -1, str_preference);
> +	ret = __match_string(workload_types, -1, str_preference);

We could even thing of a "match_string_terminated" (or a better
name), but maybe it's too much?

>  	if (ret < 0)
>  		return ret;
>  

...

> -	c->auth_hash_algo = match_string(hash_algo_name, HASH_ALGO__LAST,
> -					 c->auth_hash_name);
> -	if ((int)c->auth_hash_algo < 0) {
> +	err = __match_string(hash_algo_name, HASH_ALGO__LAST, c->auth_hash_name);
> +	if (err < 0) {
>  		ubifs_err(c, "Unknown hash algo %s specified",
>  			  c->auth_hash_name);
> -		return -EINVAL;
> +		return err;

This is correct!

>  	}
> +	c->auth_hash_algo = err;
>  
>  	snprintf(hmac_name, CRYPTO_MAX_ALG_NAME, "hmac(%s)",
>  		 c->auth_hash_name);

...

> +int __match_string(const char * const *array, size_t n, const char *string);
> +
> +/**
> + * match_string - matches given string in an array
> + * @_a: array of strings
> + * @_s: string to match with
> + *
> + * Helper for __match_string(). Calculates the size of @a automatically.

/@a/@_a/

> + */
> +#define match_string(_a, _s) __match_string(_a, ARRAY_SIZE(_a), _s)
> +

...

> diff --git a/security/apparmor/lsm.c b/security/apparmor/lsm.c
> index 6239777090c4..e3fc94b4c7e5 100644
> --- a/security/apparmor/lsm.c
> +++ b/security/apparmor/lsm.c
> @@ -1820,9 +1820,9 @@ static int param_set_audit(const char *val, const struct kernel_param *kp)
>  	if (apparmor_initialized && !aa_current_policy_admin_capable(NULL))
>  		return -EPERM;
>  
> -	i = match_string(audit_mode_names, AUDIT_MAX_INDEX, val);
> +	i = __match_string(audit_mode_names, AUDIT_MAX_INDEX, val);

pity here... this could have been a match_string, but the
MAX_INDEX is hardcoded outside the enum.

>  	if (i < 0)
> -		return -EINVAL;
> +		return i;
>  
>  	aa_g_audit = i;
>  	return 0;

...

> diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
> index 16dad4a45443..7064f4cae549 100644
> --- a/sound/soc/soc-dapm.c
> +++ b/sound/soc/soc-dapm.c
> @@ -769,14 +769,13 @@ static int dapm_connect_mux(struct snd_soc_dapm_context *dapm,
>  		item = 0;
>  	}
>  
> -	i = match_string(e->texts, e->items, control_name);
> +	i = __match_string(e->texts, e->items, control_name);
>  	if (i < 0)
> -		return -ENODEV;
> +		return i;

Also this return value is wrong.

Andi

>  
>  	path->name = e->texts[i];
>  	path->connect = (i == item);
>  	return 0;
> -
>  }
>  
>  /* set up initial codec paths */
> -- 
> 2.43.0.rc1.1336.g36b5255a03ac
> 
