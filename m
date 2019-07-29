Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DFBA5791C8
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Jul 2019 19:07:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4C0CF17F8;
	Mon, 29 Jul 2019 19:06:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4C0CF17F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564420061;
	bh=pAZEKhrch8aBxid1ZxAXE5x3WwDGbqMY/uaO1qMQH7w=;
	h=Date:From:To:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=m8WOsD50TkkOa8cyfaPTM0TzZiJJLVlP6C8mHLP0fbqFRGxMKhr+JpExr9zNTvusZ
	 H7Y9+OtwTWneSBh+FF4QWn20nPcY2+29ruo3iGZ79NrqpwOo9wfInmbbz0TWPA08qz
	 7GubDNAsVjVIrb9A3FYfZ1NhXnWgchHwQeD8uJQo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6D038F80483;
	Mon, 29 Jul 2019 19:05:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 172F5F8048D; Mon, 29 Jul 2019 19:05:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from crapouillou.net (outils.crapouillou.net [89.234.176.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 84ADEF800BF
 for <alsa-devel@alsa-project.org>; Mon, 29 Jul 2019 19:05:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 84ADEF800BF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net
 header.b="tGIbEOve"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1564419948; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6ct5sfA9aKEmr8hMlVPpfoX1PCyM/MxIecN3pTsFsbo=;
 b=tGIbEOveRSTKHoZcpg/izsWRXZB3sJbHvlT52bDMqqruC35KNldtJ6Z1UumMknOBTmqxkS
 L0QxFFWQrtfalRctJpTe/AFwPD5hYLu/miXPRxLnpxQZvMuW30gWEtzMHrKJVpyhyW4MrF
 oruZx2tu/qGuw0Xp6xod1DxlnpMTbLU=
Date: Mon, 29 Jul 2019 13:05:21 -0400
From: Paul Cercueil <paul@crapouillou.net>
To: Richard Weinberger <richard.weinberger@gmail.com>
Message-Id: <1564419921.1759.1@crapouillou.net>
In-Reply-To: <CAFLxGvyi0+0E3M12A7cRoHfEKd8-7Yr8EMG9J=2XcjCxPWY5pA@mail.gmail.com>
References: <20190725220215.460-1-paul@crapouillou.net>
 <CAFLxGvyi0+0E3M12A7cRoHfEKd8-7Yr8EMG9J=2XcjCxPWY5pA@mail.gmail.com>
MIME-Version: 1.0
Cc: Mark Rutland <mark.rutland@arm.com>, linux-fbdev@vger.kernel.org,
 James Hogan <jhogan@kernel.org>, alsa-devel <alsa-devel@alsa-project.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>, linux-mips@vger.kernel.org,
 od@zcrc.me, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>, Lee Jones <lee.jones@linaro.org>,
 Artur Rojek <contact@artur-rojek.eu>, Richard Weinberger <richard@nod.at>,
 linux-pm@vger.kernel.org, Paul Burton <paul.burton@mips.com>,
 Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
 Jean Delvare <jdelvare@suse.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Mark Brown <broonie@kernel.org>, linux-hwmon@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, Ralf Baechle <ralf@linux-mips.org>,
 LKML <linux-kernel@vger.kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Sebastian Reichel <sre@kernel.org>,
 dmaengine@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH 00/11] JZ4740 SoC cleanup
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
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi Richard,


Le lun. 29 juil. 2019 =E0 7:23, Richard Weinberger =

<richard.weinberger@gmail.com> a =E9crit :
> On Fri, Jul 26, 2019 at 12:02 AM Paul Cercueil <paul@crapouillou.net> =

> wrote:
>> =

>>  Hi,
>> =

>>  This patchset converts the Qi LB60 MIPS board to devicetree and =

>> makes it
>>  use all the shiny new drivers that have been developed or updated
>>  recently.
>> =

>>  All the crappy old drivers and custom code can be dropped since they
>>  have been replaced by better alternatives.
>> =

>>  Some of these alternatives are not yet in 5.3-rc1 but have already =

>> been
>>  accepted by their respective maintainer for inclusion in 5.4-rc1.
>> =

>>  To upstream this patchset, I think that as soon as MIPS maintainers
>>  agree to take patches 01-03/11 and 11/11, the other patches can go
>>  through their respective maintainer's tree.
> =

> Was this series tested with the Ben Nanonote device?
> I have one of these and from time to time I upgrade the kernel on it.

Yes! Artur (Cc'd) tested it.

You can test it yourself, after merging this patchset with:
https://git.kernel.org/pub/scm/linux/kernel/git/vkoul/slave-dma.git =

branch next,
git://git.freedesktop.org/git/drm-misc branch drm-misc-next.

These will be in 5.4-rc1.

Cheers,
-Paul


_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
