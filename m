Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AADDE7E9D
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Oct 2019 03:43:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2CCC521A5;
	Tue, 29 Oct 2019 03:42:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2CCC521A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572316993;
	bh=9w4+bvXygTn0Lr9BvpAqYMA4uBAbd4rniORMyr1Ilq8=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iIkA0FmlcRlaHlG9A3rbNy5qLLxIsv/yhO+INR+77e7UsfrnyrFKxrLMNS4VmBkGu
	 voWzIUV4buNIkIeFsuGtWVuK9/1EveM+URijPrNnPyO2Zz6ruV8ox5Zbs2wgCspINw
	 e9y1o+7zG5JZ7Z7vX7pSw8HrlyYY4WuFE90BXWSs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3B0DFF80392;
	Tue, 29 Oct 2019 03:41:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1B2B7F80392; Tue, 29 Oct 2019 03:41:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,PRX_BODY_14,
 SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED,USER_IN_DEF_SPF_WL
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 02F9CF80269
 for <alsa-devel@alsa-project.org>; Tue, 29 Oct 2019 03:41:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 02F9CF80269
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="VLQKO+JO"
Received: by mail-wr1-x444.google.com with SMTP id r1so11932714wrs.9
 for <alsa-devel@alsa-project.org>; Mon, 28 Oct 2019 19:41:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ZeDXYfJYer9ewRjx0PKDp7gkl9UyDafoP/CtcLx8QMs=;
 b=VLQKO+JOvP8uz/jmVZM9OjdCfHDXyDMWpkMpTUHQHfjmA84+CUWD7XxXQNaduG/DhK
 WpLIlhGmDUXteBLSWlDLv3lLQKGl9plS/P7jNHsE1n2OgqkcjY1MB0T3Q0WBTvNA1F40
 PLq6JygSU3JQITuvsF6azO0JElsbcTQp8BtSk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ZeDXYfJYer9ewRjx0PKDp7gkl9UyDafoP/CtcLx8QMs=;
 b=FSapqL0vu1P6Ul4jIrs3A/ybD7jVcNkVi5inOA4zB319NFriP0c1Lo/6G6kjuTCzP3
 mvbH/K7EG7hO5nBYo++FkRgRoOMqX3ZxVP3iXYZ7JH9JVTUpb+sLu9vgO6PmwUfzAFyY
 lWRPC1LCeTc4XpxKH0CFwvEmjPBupKsxSc/sJh5VV/VRQX7P/bfKNeelcWfcaTJ1CkiN
 uwX2dRWk99tKM7K7XlY9MehpztDUIcWXU2ustoGHW9/g+tJZp0G2WmTak02VCirP30qB
 EjWqElbjnVjbaiKxaJ+A3worCSM9AE0KAtZ5YZB6eCfh1xVZuSkRZe1YEWuvi4RusZ3j
 zGpQ==
X-Gm-Message-State: APjAAAWc7QQ6n2Gu6eQzHnnDsBE4WUwUPIW6749A9unIGIKUDXHNNjO3
 uHBfR0h7anp8FwDoRgRyDG3En5B7xm88pJ9MLFeoyA==
X-Google-Smtp-Source: APXvYqyc+JXXHY09WmrhUa6gx/7O5d2iKpnoJiK3FXpiuNcBFCoy0/gMtIdx+mtcV6BqjcvdZ3c6ru0/7R8MCJ1fJrA=
X-Received: by 2002:adf:e806:: with SMTP id o6mr15942278wrm.139.1572316882248; 
 Mon, 28 Oct 2019 19:41:22 -0700 (PDT)
MIME-Version: 1.0
References: <20191025133007.11190-4-cychiang@chromium.org>
 <201910290345.w2EEW5S3%lkp@intel.com>
In-Reply-To: <201910290345.w2EEW5S3%lkp@intel.com>
From: Cheng-yi Chiang <cychiang@chromium.org>
Date: Tue, 29 Oct 2019 10:40:55 +0800
Message-ID: <CAFv8NwJYrpT=hCFwWfbdRvC971X-XGS-mjEBJrggQTJ02nhv7g@mail.gmail.com>
To: kbuild test robot <lkp@intel.com>
Cc: Mark Rutland <mark.rutland@arm.com>,
 "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, Heiko Stuebner <heiko@sntech.de>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, linux-kernel <linux-kernel@vger.kernel.org>,
 Hans Verkuil <hverkuil@xs4all.nl>, Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Takashi Iwai <tiwai@suse.com>,
 linux-rockchip@lists.infradead.org, Dylan Reid <dgreid@chromium.org>,
 devicetree@vger.kernel.org, Tzung-Bi Shih <tzungbi@chromium.org>,
 Jonas Karlman <jonas@kwiboo.se>, Liam Girdwood <lgirdwood@gmail.com>,
 Russell King <rmk+kernel@armlinux.org.uk>, Rob Herring <robh+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 kbuild-all@lists.01.org, Doug Anderson <dianders@chromium.org>,
 Mark Brown <broonie@kernel.org>, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [alsa-devel] [PATCH v8 3/6] ASoC: rockchip_max98090: Optionally
 support HDMI use case
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

On Tue, Oct 29, 2019 at 3:10 AM kbuild test robot <lkp@intel.com> wrote:
>
> Hi Cheng-Yi,
>
> I love your patch! Yet something to improve:
>
> [auto build test ERROR on rockchip/for-next]
> [also build test ERROR on v5.4-rc5 next-20191028]
> [if your patch is applied to the wrong git tree, please drop us a note to help
> improve the system. BTW, we also suggest to use '--base' option to specify the
> base tree in git format-patch, please see https://stackoverflow.com/a/37406982]
>
> url:    https://github.com/0day-ci/linux/commits/Cheng-Yi-Chiang/Add-HDMI-jack-support-on-RK3288/20191028-212502
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git for-next
> config: i386-allmodconfig (attached as .config)
> compiler: gcc-7 (Debian 7.4.0-14) 7.4.0
> reproduce:
>         # save the attached .config to linux build tree
>         make ARCH=i386
>
> If you fix the issue, kindly add following tag
> Reported-by: kbuild test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>):
>
>    sound/soc/rockchip/snd-soc-rockchip-max98090: struct of_device_id is 196 bytes.  The last of 3 is:
>    0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x72 0x6f 0x63 0x6b 0x63 0x68 0x69 0x70 0x2c 0x72 0x6f 0x63 0x6b 0x63 0x68 0x69 0x70 0x2d 0x61 0x75 0x64 0x69 0x6f 0x2d 0x6d 0x61 0x78 0x39 0x38 0x30 0x39 0x30 0x2d 0x68 0x64 0x6d 0x69 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x10 0x00 0x00 0x00
> >> FATAL: sound/soc/rockchip/snd-soc-rockchip-max98090: struct of_device_id is not terminated with a NULL entry!

Please ignore this error for v8 patch series because the change in
rockchip_max98090.c of of_device_id is removed in v9 patch series.
Thanks!

>
> ---
> 0-DAY kernel test infrastructure                Open Source Technology Center
> https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
