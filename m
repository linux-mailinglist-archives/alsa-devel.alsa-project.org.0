Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 32FFE58CEE4
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Aug 2022 22:09:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AF60083A;
	Mon,  8 Aug 2022 22:09:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AF60083A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1659989397;
	bh=0g83UTK48vpEd3FsyoaAIoeSS78wrTvZibjRymbLww0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QlkVexMlnMxiUeKuC6PHVs7DfLyHlTkKBzZfVvD9j/X0Faci5uU6/Dy3dvvyj80o5
	 n0SKfjLyKjEvtCSsTnNz5L2GS94P0djvB5RNBAtt9RZkE1DSB+leEj4g1niXxwQb2w
	 x1nyCZXQdEDJcl8Cybc+9AseS4RJd8kdRWbOSj2E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3847DF8013D;
	Mon,  8 Aug 2022 22:08:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 320FFF8049C; Mon,  8 Aug 2022 22:08:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from vps0.lunn.ch (vps0.lunn.ch [185.16.172.187])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2CCD0F8013D
 for <alsa-devel@alsa-project.org>; Mon,  8 Aug 2022 22:08:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2CCD0F8013D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch
 header.b="Zu/6NTWt"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=mCH4Ky6LNxIz3EUvjmENi2wH/GDJf2ZQNALt04Jbl6M=; b=Zu/6NTWt6HC9WgZRwp7AyyegdH
 5drn41sivwpGtYz6kAC95f3lS2NipoJZek9gryL+xL+bIOhZQVVESLK8PPl7TKrPAeJ92ra/YLMFk
 x4AcVvZr2Nm366FdFHJOEJOLuYEWA3e/n7DHKG3xDlS11vB4N0oWXD+cBOSjtq7CZ/pE=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1oL92j-00CkuA-Uz; Mon, 08 Aug 2022 22:08:05 +0200
Date: Mon, 8 Aug 2022 22:08:05 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Andrew Davis <afd@ti.com>
Subject: Re: [PATCH 5/5] dt-bindings: Drop Dan Murphy
Message-ID: <YvFtJRJHToDrfpkN@lunn.ch>
References: <20220808104712.54315-1-krzysztof.kozlowski@linaro.org>
 <20220808104712.54315-6-krzysztof.kozlowski@linaro.org>
 <43b3c497-97fd-29aa-a07b-bcd6413802c4@linaro.org>
 <6ae15e00-36a4-09a8-112e-553ed8c5f4da@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6ae15e00-36a4-09a8-112e-553ed8c5f4da@ti.com>
Cc: linux-fbdev@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-iio@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>,
 Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org,
 Lars-Peter Clausen <lars@metafoo.de>, Lee Jones <lee@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
 Jean Delvare <jdelvare@suse.com>,
 Michael Hennerich <Michael.Hennerich@analog.com>, linux-pm@vger.kernel.org,
 Tim Harvey <tharvey@gateworks.com>, Mark Brown <broonie@kernel.org>,
 linux-hwmon@vger.kernel.org, Robert Jones <rjones@gateworks.com>,
 netdev@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Sebastian Reichel <sre@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Jonathan Cameron <jic23@kernel.org>
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

> Either way, I have several of these parts and can support these. Feel free
> to replace Dan's email with my email if that works better.

Please could you submit a patch to MAINTAINERS replacing Dan's name
with your. I see lots of bounces from PHY driver patches because the
get_maintainers script returns his address.

Thanks
	Andrew
