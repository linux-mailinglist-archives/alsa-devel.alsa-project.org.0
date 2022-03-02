Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CC8954CA031
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Mar 2022 10:01:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7152118EB;
	Wed,  2 Mar 2022 10:01:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7152118EB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646211713;
	bh=RbXjCq2vc9KTjJ2ViOIg4WEUsqUh0ts1JySeSDecJPA=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=L3EJYzrZ3rfjX5dJgkIoZvwBoPlj1OP0ihYqeSuWG5yrrQre03dGw+PW+4k09vvYe
	 rNDBD2x8IhGfT33Wd1ymB1bbcYJamp3goM5QEvn2q1gASilmpflFpHYYXy++1hCI/t
	 I2m8BsOuyDRqJO0CH5eLypNH+9d801LqG/9fKHkk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7E979F808CB;
	Wed,  2 Mar 2022 09:34:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D17E1F80227; Wed,  2 Mar 2022 03:07:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 79D3FF80054
 for <alsa-devel@alsa-project.org>; Wed,  2 Mar 2022 03:06:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 79D3FF80054
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="CeKdGh4H"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 332E9CE20C2;
 Wed,  2 Mar 2022 02:06:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45615C340EE;
 Wed,  2 Mar 2022 02:06:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646186812;
 bh=RbXjCq2vc9KTjJ2ViOIg4WEUsqUh0ts1JySeSDecJPA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=CeKdGh4HJ5xY8VnlinUJxQ4c1yi48El5NRql2ZCTIP2Mmz0h+R9wG20554NXflcMb
 h6p72p9M9T34mgM1urwfL0Ac2+setqTN/Hus8HEP5hSlYeKrX8CP+Je136zRGYM7VA
 w1pjE71yLhWfV68Lf6cJfJbdXpWGyL0GKTqAv/ac1YdSambaOKcoPt74fztMyceRi0
 5dvchGms8HIYcCELtkRrsq91AyGKV8jHUTZngeLt8ODz7/UTURXidE5aF4tRsfmx/S
 3akqly+ZZPX8OcHC4ilBq/WvlehbRgEdqm1HbTL1VkHGK5IVG2BcNKHdXUlJV0iXmx
 dVIuoFk3QvPLw==
Date: Tue, 1 Mar 2022 18:06:50 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: Another pass removing cases of 'allOf'
 containing a '$ref'
Message-ID: <20220301180650.6188a66c@kicinski-fedora-PC1C0HJN.hsd1.ca.comcast.net>
In-Reply-To: <20220228213802.1639658-1-robh@kernel.org>
References: <20220228213802.1639658-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Wed, 02 Mar 2022 09:33:35 +0100
Cc: alsa-devel@alsa-project.org, linux-usb@vger.kernel.org,
 Vignesh Raghavendra <vigneshr@ti.com>, Sam Ravnborg <sam@ravnborg.org>,
 linux-remoteproc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Sebastian Reichel <sre@kernel.org>, linux-phy@lists.infradead.org,
 Thierry Reding <thierry.reding@gmail.com>, linux-mtd@lists.infradead.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Pavel Machek <pavel@ucw.cz>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Guenter Roeck <groeck@chromium.org>, Lee Jones <lee.jones@linaro.org>,
 linux-leds@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Richard Weinberger <richard@nod.at>, Kishon Vijay Abraham I <kishon@ti.com>,
 linux-input@vger.kernel.org, devicetree@vger.kernel.org,
 linux-pm@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-arm-kernel@lists.infradead.org,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>
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

On Mon, 28 Feb 2022 15:38:02 -0600 Rob Herring wrote:
> Another pass at removing unnecessary use of 'allOf' with a '$ref'.
> 
> json-schema versions draft7 and earlier have a weird behavior in that
> any keywords combined with a '$ref' are ignored (silently). The correct
> form was to put a '$ref' under an 'allOf'. This behavior is now changed
> in the 2019-09 json-schema spec and '$ref' can be mixed with other
> keywords.

Acked-by: Jakub Kicinski <kuba@kernel.org>
