Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 89AC730D3D1
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Feb 2021 08:07:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 23B3B1783;
	Wed,  3 Feb 2021 08:06:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 23B3B1783
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612336034;
	bh=ucOE/Mmv9i2CWEnQ7wz77HidV63/GBxg2zd12rEmpdc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RKwfUmrPpfbays7Zi2pxWJL0nJc5Zw/7ifkTnCVhwy80hPKzPfyIlKngAmTjgcnId
	 a+usV3sdtRtpba4F1ZZtT3a72o0EI21tSlh5w2Q3IS9OPVztCRcZ5S2dOkGUE6vTVG
	 9Ftgyyq5omVDYZSOM9YRxif6XAuO19E03Q/OQWzE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3B017F804E2;
	Wed,  3 Feb 2021 08:01:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CA2ABF80171; Tue,  2 Feb 2021 15:06:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,PRX_BODY_13,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 22356F80109
 for <alsa-devel@alsa-project.org>; Tue,  2 Feb 2021 15:06:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 22356F80109
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
 header.i=@linuxfoundation.org header.b="mtk8Q3WR"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2821F64DD5;
 Tue,  2 Feb 2021 14:06:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1612274769;
 bh=ucOE/Mmv9i2CWEnQ7wz77HidV63/GBxg2zd12rEmpdc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mtk8Q3WRW8e4rAGIMqVSBpBvOYwFo0HFhgAeLGXuNjXjEG35zPmakj7dmP3Hp3Xxb
 nLQvz66M8T/SeJkpoklGcHv/kplvfAQlGnleUXc+nPaJbcAYzR2bE146XmrkoL8bC8
 WACPjj7XeQXWdVU5Y4Gh/La16odwgfVrinCkNWdA=
Date: Tue, 2 Feb 2021 15:06:05 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [GIT PULL] immutable branch for amba changes targeting v5.12-rc1
Message-ID: <YBlcTXlxemmC2lgr@kroah.com>
References: <20210126165835.687514-1-u.kleine-koenig@pengutronix.de>
 <20210202135350.36nj3dmcoq3t7gcf@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210202135350.36nj3dmcoq3t7gcf@pengutronix.de>
X-Mailman-Approved-At: Wed, 03 Feb 2021 08:01:31 +0100
Cc: linux-fbdev@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>,
 kvm@vger.kernel.org, Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Linus Walleij <linus.walleij@linaro.org>, alsa-devel@alsa-project.org,
 dri-devel@lists.freedesktop.org, Eric Anholt <eric@anholt.net>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig.org@pengutronix.de>,
 linux-i2c@vger.kernel.org, Jiri Slaby <jirislaby@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 Alexandre Torgue <alexandre.torgue@st.com>, linux-rtc@vger.kernel.org,
 Cornelia Huck <cohuck@redhat.com>, Herbert Xu <herbert@gondor.apana.org.au>,
 Takashi Iwai <tiwai@suse.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 David Airlie <airlied@linux.ie>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-serial@vger.kernel.org, linux-input@vger.kernel.org,
 Ulf Hansson <ulf.hansson@linaro.org>, Guenter Roeck <linux@roeck-us.net>,
 Mike Leach <mike.leach@linaro.org>, linux-watchdog@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 coresight@lists.linaro.org, Vladimir Zapolskiy <vz@mleia.com>,
 Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>, Mark Brown <broonie@kernel.org>,
 Matt Mackall <mpm@selenic.com>, Daniel Vetter <daniel@ffwll.ch>,
 Dan Williams <dan.j.williams@intel.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>, Russell King <linux+pull@armlinux.org.uk>,
 linux-crypto@vger.kernel.org, kernel@pengutronix.de,
 Leo Yan <leo.yan@linaro.org>, dmaengine@vger.kernel.org
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

On Tue, Feb 02, 2021 at 02:53:50PM +0100, Uwe Kleine-König wrote:
> Hello,
> 
> the following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:
> 
>   Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.pengutronix.de/git/ukl/linux tags/amba-make-remove-return-void
> 
> for you to fetch changes up to f170b59fedd733b92f58c4d7c8357fbf7601d623:
> 
>   amba: Make use of bus_type functions (2021-02-02 14:26:02 +0100)
> 
> I expect this tag to be merged by Russell King as amba maintainer and by
> Mathieu Poirier (or Greg Kroah-Hartman?) for coresight as there are some
> pending conflicting changes. These are not hard to resolve but also
> non-trivial. Tell me if you need assistance for resolving, also if it's only a
> second pair of eyes to judge your resolution.
> 
> Best regards,
> Uwe
> 
> ----------------------------------------------------------------
> Tag for adaptions to struct amba_driver::remove changing prototype
> 
> ----------------------------------------------------------------
> Uwe Kleine-König (5):
>       amba: Fix resource leak for drivers without .remove
>       amba: reorder functions
>       vfio: platform: simplify device removal
>       amba: Make the remove callback return void
>       amba: Make use of bus_type functions
> 
>  drivers/amba/bus.c                                 | 234 +++++++++++++++++++++++++++++++++------------------------------
>  drivers/char/hw_random/nomadik-rng.c               |   3 +-
>  drivers/dma/pl330.c                                |   3 +-
>  drivers/gpu/drm/pl111/pl111_drv.c                  |   4 +-
>  drivers/hwtracing/coresight/coresight-catu.c       |   3 +-
>  drivers/hwtracing/coresight/coresight-cpu-debug.c  |   4 +-
>  drivers/hwtracing/coresight/coresight-cti-core.c   |   4 +-
>  drivers/hwtracing/coresight/coresight-etb10.c      |   4 +-
>  drivers/hwtracing/coresight/coresight-etm3x-core.c |   4 +-
>  drivers/hwtracing/coresight/coresight-etm4x-core.c |   4 +-
>  drivers/hwtracing/coresight/coresight-funnel.c     |   4 +-
>  drivers/hwtracing/coresight/coresight-replicator.c |   4 +-
>  drivers/hwtracing/coresight/coresight-stm.c        |   4 +-
>  drivers/hwtracing/coresight/coresight-tmc-core.c   |   4 +-
>  drivers/hwtracing/coresight/coresight-tpiu.c       |   4 +-
>  drivers/i2c/busses/i2c-nomadik.c                   |   4 +-
>  drivers/input/serio/ambakmi.c                      |   3 +-
>  drivers/memory/pl172.c                             |   4 +-
>  drivers/memory/pl353-smc.c                         |   4 +-
>  drivers/mmc/host/mmci.c                            |   4 +-
>  drivers/rtc/rtc-pl030.c                            |   4 +-
>  drivers/rtc/rtc-pl031.c                            |   4 +-
>  drivers/spi/spi-pl022.c                            |   5 +-
>  drivers/tty/serial/amba-pl010.c                    |   4 +-
>  drivers/tty/serial/amba-pl011.c                    |   3 +-
>  drivers/vfio/platform/vfio_amba.c                  |  15 ++--
>  drivers/video/fbdev/amba-clcd.c                    |   4 +-
>  drivers/watchdog/sp805_wdt.c                       |   4 +-
>  include/linux/amba/bus.h                           |   2 +-
>  sound/arm/aaci.c                                   |   4 +-
>  30 files changed, 157 insertions(+), 198 deletions(-)
> 
> 


I'm glad to take this through my char/misc tree, as that's where the
other coresight changes flow through.  So if no one else objects, I will
do so...

thanks,

greg k-h
