Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 689384203E
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jun 2019 11:06:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D56241742;
	Wed, 12 Jun 2019 11:05:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D56241742
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560330377;
	bh=v5La4nO2Xk19i9fcvdbP7GZMxA1gnBT3Zk3CKGFOVKE=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nNyl19b+rt92e1Vajo3ezBZ/veKBrDLNe4pE44gswUHyUCoqK/3A+hMyoxCeINsbn
	 q9xZ8UK0VsMgbn+6wQoQGqpif489XFwVH0pKpUh7yR5sDmEaHOyxKtH+TrW6CMt0ZW
	 r6DLeTo69eJBb5mxsKCNssid0MaGPpWQsqIfmx84=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AF7E7F896E3;
	Wed, 12 Jun 2019 11:04:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A0E36F8970F; Tue, 11 Jun 2019 19:09:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8ABD4F80791
 for <alsa-devel@alsa-project.org>; Tue, 11 Jun 2019 19:09:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8ABD4F80791
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="kCPj26LA"
Received: by mail-pl1-x641.google.com with SMTP id i2so5386833plt.1
 for <alsa-devel@alsa-project.org>; Tue, 11 Jun 2019 10:09:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=U9pH+Dkty6RbCUrC13LmsnE/gvgFrgYZYXmlWeMNRJM=;
 b=kCPj26LAaoZdak4PeZmg4hF/4yf/LGBul3j+wm/fWzra9TWq/gGoyEJc1vp8KoV/29
 gLHxpikboEiF68iZh2Ru07kPEFh1Mk+ksmvD+M1Dz90YufLTywoOoLSrD4wO9WKRlmjE
 8XZvzklgNuKGYFoFqBqUYMLfeRW9u6v5ASJX6k82ZZ6UqmGFkrjhiV7utNZ+S/3BYajD
 BMYyJpUUZC+SvFOPIve7vYaggEQVBEVkVChr1J8ATBMHFpTuh6FsATlJgwJgdL2xzHbn
 FGz82MsKW6gGse9WuFfIgkgvgr5tG7NqnDPYjeZ8vod9kQ45MBJ7hkr3/7vwOsN1RXRC
 d8Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=U9pH+Dkty6RbCUrC13LmsnE/gvgFrgYZYXmlWeMNRJM=;
 b=Rtnon8bNyLdsQBJBJtP71eBdiFrUmfzPxrkXd1xxfmgYBkWMpUHUJia9hPKtlhSAzk
 /nNUCULLV9v4VBHG9vbk9UAPjCZFn63RIDnvlq3liw38e+AvKi2GNTX+rzuEOURmi+dh
 pOR+RgyjMxRQ3Xpd+9rq0lvisDQj2kGVTlQ8/T7YG11d6Aol5aPXQvAhaSw3qRnSMHa7
 GhWxZJiA4o0/jx4j8sb6luciqcRvjXNtgwuSEKGbW5e9UnMcTTWLPlBnJCD4pEHLg9bJ
 kzfAiE3gVevvFrd8+fJ0srDHDgSkLuiTN99w5J7YCohqTry+D772+IjW5+EKKqjWhFhs
 klhg==
X-Gm-Message-State: APjAAAVmsTCHQ7hbkMqX/PZ7gK7bbAnG3NKs1MKummQU/iqzW8dcugVa
 5Q7Ghf6xt8eeSjyKHO8LyiE=
X-Google-Smtp-Source: APXvYqzBeuwVdF/y0BwJTigCe1vkCfndlk6drQVY2SJPMyyiy0A2oOWmczADoY+PYUD2414xgLSo2Q==
X-Received: by 2002:a17:902:b094:: with SMTP id
 p20mr11845471plr.337.1560272944275; 
 Tue, 11 Jun 2019 10:09:04 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
 by smtp.gmail.com with ESMTPSA id c142sm22235670pfb.171.2019.06.11.10.09.02
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 11 Jun 2019 10:09:03 -0700 (PDT)
Date: Tue, 11 Jun 2019 10:09:00 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Message-ID: <20190611170900.GB143729@dtor-ws>
References: <20190604152019.16100-1-enric.balletbo@collabora.com>
 <20190604152019.16100-3-enric.balletbo@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190604152019.16100-3-enric.balletbo@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Wed, 12 Jun 2019 11:04:30 +0200
Cc: gwendal@chromium.org, Banajit Goswami <bgoswami@codeaurora.org>,
 Vignesh R <vigneshr@ti.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Wolfram Sang <wsa@the-dreams.de>, linux-iio@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Juergen Fitschen <jfi@ssv-embedded.de>,
 alsa-devel@alsa-project.org, Stefan Agner <stefan@agner.ch>,
 Sebastian Reichel <sre@kernel.org>,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 Karthikeyan Ramasubramanian <kramasub@codeaurora.org>,
 linux-i2c@vger.kernel.org, Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Guenter Roeck <groeck@chromium.org>, kernel@collabora.com, dtor@chromium.org,
 Lars-Peter Clausen <lars@metafoo.de>, Jean Delvare <jdelvare@suse.de>,
 Jacky Bai <ping.bai@nxp.com>, linux-rtc@vger.kernel.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Sean Young <sean@mess.org>, Lee Jones <lee.jones@linaro.org>,
 Patrick Lai <plai@codeaurora.org>, Takashi Iwai <tiwai@suse.com>,
 Shreesha Rajashekar <shreesha.rajashekar@broadcom.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Chanwoo Choi <cw00.choi@samsung.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>, Hans Verkuil <hans.verkuil@cisco.com>,
 linux-input@vger.kernel.org, Elie Morisse <syniurge@gmail.com>,
 linux-media@vger.kernel.org, Ettore Chimenti <ek5.chimenti@gmail.com>,
 linux-pwm@vger.kernel.org, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Arnd Bergmann <arnd@arndb.de>, linux-pm@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, Jiri Kosina <jikos@kernel.org>,
 Marco Felsch <m.felsch@pengutronix.de>,
 Florian Fainelli <f.fainelli@gmail.com>, Dong Aisheng <aisheng.dong@nxp.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Benson Leung <bleung@chromium.org>,
 Douglas Anderson <dianders@chromium.org>,
 Alessandro Zummo <a.zummo@towertech.it>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Ajay Gupta <ajayg@nvidia.com>,
 linux-kernel@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 Jarkko Nikula <jarkko.nikula@linux.intel.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Hartmut Knaack <knaack.h@gmx.de>,
 Eddie James <eajames@linux.vnet.ibm.com>, Jonathan Cameron <jic23@kernel.org>
Subject: Re: [alsa-devel] [PATCH 02/10] mfd / platform: cros_ec: Move
 cros-ec core driver out from MFD
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

On Tue, Jun 04, 2019 at 05:20:11PM +0200, Enric Balletbo i Serra wrote:
> Now, the ChromeOS EC core driver has nothing related to an MFD device, so
> move that driver from the MFD subsystem to the platform/chrome subsystem.
> 
> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>

Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com> # for input

Thanks.

-- 
Dmitry
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
