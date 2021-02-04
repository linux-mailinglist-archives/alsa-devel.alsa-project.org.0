Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E69C9312006
	for <lists+alsa-devel@lfdr.de>; Sat,  6 Feb 2021 21:42:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 670421675;
	Sat,  6 Feb 2021 21:41:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 670421675
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612644156;
	bh=qf0BDzm4MTBSdcM47YvvqeKZpPzndzvDAP3ODNo+qts=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bajQXuTKUKWWOno3zqAklQPzKd7JzrErL5HeHcBcDvKudkeifggNcv3tJ55xy+Wdo
	 1J/gjEy9f+8Bsc8OPz/mVVImj47wbfZl8uIFHER0JTMN7jDXAD4BcXw9NfftfEt6Cg
	 JGPo4HxGc+kOxgfDW7PZD74lzFZKu2F4qj0Lgbys=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BB487F80425;
	Sat,  6 Feb 2021 21:39:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DB7DCF80171; Thu,  4 Feb 2021 18:00:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk
 [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B0384F80152
 for <alsa-devel@alsa-project.org>; Thu,  4 Feb 2021 17:59:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B0384F80152
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk
 header.b="PWpDFRnC"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wbVme97LTyZtZvghkEGRoTiuc1SViBhjvsMeN4jw9jo=; b=PWpDFRnC/pQI+UGrPjtu0HbEN
 L43RKr1nxKtBjtMtRi4xXHxwvekb3ibhraif6lER0dky75uQXrGFEXQG6NhjCA1fCxUTz+ddAydTm
 bKGNXkikKkpPPxYKlnRpcmercjWMc157NMyq5VGBlktOBU4v01FOUgoDwrAz/6rmXKc3s5uGItTGb
 dNZ/w+Dn4u+hez+MLEwKJ4lcAEjJtpMn+NmpWK3E6iHfHaP25TIOZvIkmdEqS/QgEh2MDEP2cCleD
 QaNVcBSlDNa3dxdHeD+0ZqIiVN2POoOv7P4kP6Hmp/WoLdRJMDuQzDE1oihQUuFsLZjY16MLN5oha
 hd1Wb2fKg==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:39166)
 by pandora.armlinux.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <linux@armlinux.org.uk>)
 id 1l7hyz-0006q2-Je; Thu, 04 Feb 2021 16:59:53 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1l7hyx-0005Kk-Sm; Thu, 04 Feb 2021 16:59:51 +0000
Date: Thu, 4 Feb 2021 16:59:51 +0000
From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [GIT PULL] immutable branch for amba changes targeting v5.12-rc1
Message-ID: <20210204165951.GB1463@shell.armlinux.org.uk>
References: <20210126165835.687514-1-u.kleine-koenig@pengutronix.de>
 <20210202135350.36nj3dmcoq3t7gcf@pengutronix.de>
 <YBlcTXlxemmC2lgr@kroah.com>
 <20210204165224.GA1463@shell.armlinux.org.uk>
 <YBwnUrQqlAz2LDPI@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YBwnUrQqlAz2LDPI@kroah.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Sat, 06 Feb 2021 21:39:08 +0100
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
 coresight@lists.linaro.org,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 Vladimir Zapolskiy <vz@mleia.com>, Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>, Mark Brown <broonie@kernel.org>,
 Matt Mackall <mpm@selenic.com>, Daniel Vetter <daniel@ffwll.ch>,
 Dan Williams <dan.j.williams@intel.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>, linux-crypto@vger.kernel.org,
 kernel@pengutronix.de, Leo Yan <leo.yan@linaro.org>, dmaengine@vger.kernel.org
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

On Thu, Feb 04, 2021 at 05:56:50PM +0100, Greg Kroah-Hartman wrote:
> On Thu, Feb 04, 2021 at 04:52:24PM +0000, Russell King - ARM Linux admin wrote:
> > On Tue, Feb 02, 2021 at 03:06:05PM +0100, Greg Kroah-Hartman wrote:
> > > I'm glad to take this through my char/misc tree, as that's where the
> > > other coresight changes flow through.  So if no one else objects, I will
> > > do so...
> > 
> > Greg, did you end up pulling this after all? If not, Uwe produced a v2.
> > I haven't merged v2 yet as I don't know what you've done.
> 
> I thought you merged this?

I took v1, and put it in a branch I've promised in the past not to
rebase/rewind. Uwe is now asking for me to take a v2 or apply a patch
on top.

The only reason to produce an "immutable" branch is if it's the basis
for some dependent work and you need that branch merged into other
people's trees... so the whole "lets produce a v2" is really odd
workflow... I'm confused about what I should do, and who has to be
informed which option I take.

I'm rather lost here too.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
