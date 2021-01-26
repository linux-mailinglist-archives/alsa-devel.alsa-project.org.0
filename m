Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 107633053A2
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Jan 2021 07:54:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AA3A2177D;
	Wed, 27 Jan 2021 07:54:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AA3A2177D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611730498;
	bh=O0SzqxA4Kl1KwDzTg7qIYL/SSQiArMLG1FuFoNh2OcI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=j3JRdcykMO5U5nbrPyVl3s3GxNgvmNc/gMgwdK+92N8vtV80dL3hKd55pwDjXTP1F
	 S+abWxXGdy1oyPOmw6Q20thc3W72IwZGBfUYJ+2mEe0p2z4qO3ZIAVDDuDSHAtsTpV
	 o8UmHpuRtELX+EICz2Ou7A6OkWpHtm8x8ElShgC0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BD2B9F804E3;
	Wed, 27 Jan 2021 07:52:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0517FF8015B; Tue, 26 Jan 2021 20:06:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk
 [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D57E9F80130
 for <alsa-devel@alsa-project.org>; Tue, 26 Jan 2021 20:06:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D57E9F80130
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk
 header.b="ad84LgFW"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
 Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zUcP2Ekow40wDr8LQu56g1JOWBLSxsWCwNUDwttWnJY=; b=ad84LgFWJ8FgdoRvBSNVnAdb+
 0I6Sw5zFHnURG6DddKEQ8HbimmJVGhfZNBE+p4AhrkuGcqgL8wXJS/82Ulh3PCv17KG3N45R7A4lo
 nmAWv3AnHF/mSc9xZD1jBN9qCv/KUXD01csQwhWLG+rkGDTkxKX1bLlQ1gn5TyX5Nq4qryobh41F5
 DB4HHmb9nD2Xu3mV8TLNo+8B+nWoKTBy48lo4Q1JucKdB4IQ7QCREGM7mwYt646OKNjClWNUO1E6M
 j60U9ebf7BAEOHy7IwgCDiy4Xjl4pjGwcbLID7o2kdNIzvVrdpvSEcEUXs6vOb5LBBAMtPHo30HE4
 oAMpwR9Vw==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:53070)
 by pandora.armlinux.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <linux@armlinux.org.uk>)
 id 1l4TeW-0004lN-0N; Tue, 26 Jan 2021 19:05:24 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1l4TeJ-00042E-C4; Tue, 26 Jan 2021 19:05:11 +0000
Date: Tue, 26 Jan 2021 19:05:11 +0000
From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH v3 4/5] amba: Make the remove callback return void
Message-ID: <20210126190511.GK1551@shell.armlinux.org.uk>
References: <20210126165835.687514-1-u.kleine-koenig@pengutronix.de>
 <20210126165835.687514-5-u.kleine-koenig@pengutronix.de>
 <3e42b2ea-c713-31b2-9c86-c49a70d8e1f4@arm.com>
 <20210126175652.3caoqfnsky2es42f@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210126175652.3caoqfnsky2es42f@pengutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Wed, 27 Jan 2021 07:52:19 +0100
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Cornelia Huck <cohuck@redhat.com>,
 kvm@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Linus Walleij <linus.walleij@linaro.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 dri-devel@lists.freedesktop.org, Eric Anholt <eric@anholt.net>,
 linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
 Jiri Slaby <jirislaby@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 Alexandre Torgue <alexandre.torgue@st.com>, linux-rtc@vger.kernel.org,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 linux-serial@vger.kernel.org, linux-input@vger.kernel.org,
 Guenter Roeck <linux@roeck-us.net>, Mike Leach <mike.leach@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, coresight@lists.linaro.org,
 Vladimir Zapolskiy <vz@mleia.com>, Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>, Mark Brown <broonie@kernel.org>,
 linux-fbdev@vger.kernel.org, Matt Mackall <mpm@selenic.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, kernel@pengutronix.de,
 linux-arm-kernel@lists.infradead.org, Alessandro Zummo <a.zummo@towertech.it>,
 linux-watchdog@vger.kernel.org, Mathieu Poirier <mathieu.poirier@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-mmc@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>, linux-crypto@vger.kernel.org,
 Daniel Vetter <daniel@ffwll.ch>, Leo Yan <leo.yan@linaro.org>,
 dmaengine@vger.kernel.org, alsa-devel@alsa-project.org
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

On Tue, Jan 26, 2021 at 06:56:52PM +0100, Uwe Kleine-König wrote:
> I'm surprised to see that the remove callback introduced in 2952ecf5df33
> ("coresight: etm4x: Refactor probing routine") has an __exit annotation.

In general, remove callbacks should not have an __exit annotation.
__exit _can_ be discarded at link time for built-in stuff.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
