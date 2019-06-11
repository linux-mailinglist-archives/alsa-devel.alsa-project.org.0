Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 334A74203F
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jun 2019 11:06:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AEECB175D;
	Wed, 12 Jun 2019 11:06:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AEECB175D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560330417;
	bh=O3napZ8TCCQV0QDk2D9WhWJp1r/W7fZOrJ9JaMCPvio=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rhHQMacIueD+o+6VDQaaf/HYre8ASqFP+S4CnE/LMk6ORV5/fylCUbSSgYKhtMFGR
	 gmjZe6ufyLebjIxL3QM0qZBK77JBDfLLI0J2QayCg6onXXnc0ZS2lWCAqDEQ3PflT0
	 sFBFKeCi9iWilJsUhrMinbsuqWOuZvWxfk0byV8g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BBC43F89716;
	Wed, 12 Jun 2019 11:04:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E79C5F89714; Tue, 11 Jun 2019 19:10:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EC94BF80791
 for <alsa-devel@alsa-project.org>; Tue, 11 Jun 2019 19:10:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EC94BF80791
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="m6uDPrf0"
Received: by mail-pg1-x543.google.com with SMTP id s27so7318890pgl.2
 for <alsa-devel@alsa-project.org>; Tue, 11 Jun 2019 10:10:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=QfcRtoONgWVTwtnQoP4rlwBElT3so0FbJIuhPmULhig=;
 b=m6uDPrf0xbKxHOBxlYlJgBJluDseTqpUrZe+FhasYzB64ReBzKMIdV5XGEhIGV9N+T
 GciSYgvch7xUNYa81gxMPnMByXHKgU/Oyv2MWE9wocowq9z8bHYJcScjGr0PcGcTVy4I
 lGX1/Dn9Pq/uG79uFh2Z+2aImHK6qBLTTR6lwi3S0LODaisIL34fRlEQ9XyAQWRucmCq
 gxSvkYh0kzEMswZuMDBdN9iubeyxHBLfT0gAiB/xF3+YWiYhw8eQQakd8aQ1mSs0vc7O
 SCjhUKvcmVw0/pQC222MOMCTzDBLJNwhJoJ9HST5soGEe0+2ih1NjRliyjzmVz3qsaNq
 dc2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=QfcRtoONgWVTwtnQoP4rlwBElT3so0FbJIuhPmULhig=;
 b=QOzND9XUgd0jzHn6a1S0URHw4yrxmaIO6a4RZAHjwvLLQNWsj/rASk5bepLIh01hBF
 ETwSUaMiEdZeiYZGOhoCEaHnFXfaQRmCeA7FydpqXWVecZQFPAk9Ixqzn77GZQaEqhSm
 f6akZVmJOf2FonUAxGQMdIAyP//cNwNyT1WdvSEnFRU37a4XVkIa9PEGMD54PWMtwrci
 J1tDueK//9KnjZGv0TXHQz3Uc5VGnd5mNyzprWXaV3V4riRhLuQUFogmSHEtSSmzMMBT
 LcmVuGH0dlC+4YEO8Uzg0gbBKX244LbQgZIrx+CwcDMWCA749L2mdJaVnp6huyS7oZA8
 h0LQ==
X-Gm-Message-State: APjAAAXmCsemoHrOH8e/sMsqiokaikAvk33bTyjBIkKnF/WFxBkfYEJP
 f6tCh7AUIz9iQzbxAsVAJ9E=
X-Google-Smtp-Source: APXvYqwMksWM0B/q19Q0jWzNmvs/opGNhXpundemVkKe3ekBw/AhIEcAanhmfVC6alp8iLNfynW0+g==
X-Received: by 2002:a63:eb0a:: with SMTP id t10mr19060142pgh.99.1560273033558; 
 Tue, 11 Jun 2019 10:10:33 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
 by smtp.gmail.com with ESMTPSA id p15sm16391934pgj.61.2019.06.11.10.10.31
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 11 Jun 2019 10:10:32 -0700 (PDT)
Date: Tue, 11 Jun 2019 10:10:30 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Message-ID: <20190611171030.GC143729@dtor-ws>
References: <20190604152019.16100-1-enric.balletbo@collabora.com>
 <20190604152019.16100-7-enric.balletbo@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190604152019.16100-7-enric.balletbo@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Wed, 12 Jun 2019 11:04:31 +0200
Cc: gwendal@chromium.org, Heiko Stuebner <heiko@sntech.de>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>, linux-iio@vger.kernel.org,
 alsa-devel@alsa-project.org, Sebastian Reichel <sre@kernel.org>,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>, linux-i2c@vger.kernel.org,
 Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
 Guenter Roeck <groeck@chromium.org>,
 Ravi Chandra Sadineni <ravisadineni@chromium.org>, kernel@collabora.com,
 Fabien Lahoudere <fabien.lahoudere@collabora.com>,
 Rushikesh S Kadam <rushikesh.s.kadam@intel.com>,
 Cheng-Yi Chiang <cychiang@chromium.org>, linux-rtc@vger.kernel.org,
 Lars-Peter Clausen <lars@metafoo.de>, dtor@chromium.org,
 Brian Norris <briannorris@chromium.org>, Evan Green <evgreen@chromium.org>,
 Neil Armstrong <narmstrong@baylibre.com>, Chanwoo Choi <cw00.choi@samsung.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>, Wolfram Sang <wsa@the-dreams.de>,
 linux-input@vger.kernel.org, linux-media@vger.kernel.org,
 linux-pwm@vger.kernel.org, Kees Cook <keescook@chromium.org>,
 linux-pm@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 Jiri Kosina <jikos@kernel.org>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Lee Jones <lee.jones@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Benson Leung <bleung@chromium.org>,
 Alessandro Zummo <a.zummo@towertech.it>, linux-kernel@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>, Hartmut Knaack <knaack.h@gmx.de>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Colin Ian King <colin.king@canonical.com>, Jonathan Cameron <jic23@kernel.org>
Subject: Re: [alsa-devel] [PATCH 06/10] mfd / platform: cros_ec: Reorganize
 platform and mfd includes
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

On Tue, Jun 04, 2019 at 05:20:15PM +0200, Enric Balletbo i Serra wrote:
> There is a bit of mess between cros-ec mfd includes and platform
> includes. For example, we have a linux/mfd/cros_ec.h include that
> exports the interface implemented in platform/chrome/cros_ec_proto.c. Or
> we have a linux/mfd/cros_ec_commands.h file that is non related to the
> multifunction device (in the sense that is not exporting any function of
> the mfd device). This causes crossed includes between mfd and
> platform/chrome subsystems and makes the code difficult to read, apart
> from creating 'curious' situations where a platform/chrome driver includes
> a linux/mfd/cros_ec.h file just to get the exported functions that are
> implemented in another platform/chrome driver.
> 
> In order to have a better separation on what the cros-ec multifunction
> driver does and what the cros-ec core provides move and rework the
> affected includes doing:
> 
>  - Move cros_ec_commands.h to include/linux/platform_data/cros_ec_commands.h
>  - Get rid of the parts that are implemented in the platform/chrome/cros_ec_proto.c
>    driver from include/linux/mfd/cros_ec.h to a new file
>    include/linux/platform_data/cros_ec_proto.h
>  - Update all the drivers with the new includes, so
>    - Drivers that only need to know about the protocol include
>      - linux/platform_data/cros_ec_proto.h
>      - linux/platform_data/cros_ec_commands.h
>    - Drivers that need to know about the cros-ec mfd device also include
>      - linux/mfd/cros_ec.h
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
