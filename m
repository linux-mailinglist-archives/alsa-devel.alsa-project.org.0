Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 00C12629FFB
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Nov 2022 18:10:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 87CD1168A;
	Tue, 15 Nov 2022 18:09:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 87CD1168A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668532203;
	bh=vHjgMtX+7Xpsuc5Ob4gmlnKJfs/gVgq92Vhr170NcCQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=h1XijCv+wQV4dMJQKb2rfc+QFUmemfRaPXUJKeYKu8tLYlZCLIaHo8wZ5J2kT9nEc
	 E2JTnN8QzkP+BEYZLFo/RDrpeve3BDtA8OEgohFlit0XpcQ4ewaXm3tinbRUttEcfQ
	 mrwi47wRKdd/VlswxYJ1iJoMl/7Nr5WS5Z2hZF3c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7E1CBF80542;
	Tue, 15 Nov 2022 18:08:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F1334F80431; Mon, 14 Nov 2022 22:08:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E32F4F800B6
 for <alsa-devel@alsa-project.org>; Mon, 14 Nov 2022 22:08:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E32F4F800B6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.b="LoY2BISB"
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id CCBD540002;
 Mon, 14 Nov 2022 21:08:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1668460122;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WUcN8Hyfr1CcrMqYvHeNHTB6GPer8+O1tgop6jO/i4o=;
 b=LoY2BISB89oKKYW3bgqoV/6ifu5d0aCRaj643or12/Zq89QFtRZr3S3ZrVgAij0TEk8XXQ
 AhUZdvHzKr7WlOZYmyp79CsK6/2kgZ7LuKbnTNhEy/2F00YleILJTTbt4XWLv6EcWHkddO
 07N+3CbUW3UjsWpTpWswfjJa5YcWwUPAbHvRjcx+CRzClWi6Oemsy2iDr6ntRAimB6b9qB
 xqyjY+iJaKWSW//kWkKE5ce0oW0tNfg2vyhksnqzqDD/LLdbUHis+e1Roj4fwu7T+UZ4Iq
 g/nCFdH3jroKXyOxlPcbfVVZki+yfk+NVUNqr6/xsMpotUg6GrfrQW179o9zdQ==
Date: Mon, 14 Nov 2022 22:08:38 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>, Sekhar Nori <nsekhar@ti.com>,
 Arnd Bergmann <arnd@kernel.org>, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 00/14] ARM: remove unused davinci board & drivers
Message-ID: <166846004404.2111985.9223963351202037616.b4-ty@bootlin.com>
References: <20221019152947.3857217-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221019152947.3857217-1-arnd@kernel.org>
X-Mailman-Approved-At: Tue, 15 Nov 2022 18:08:42 +0100
Cc: alsa-devel@alsa-project.org, linux-staging@lists.linux.dev,
 Michael Turquette <mturquette@baylibre.com>, linux-ide@vger.kernel.org, "Lad,
 Prabhakar" <prabhakar.csengg@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Peter Ujfalusi <peter.ujfalusi@gmail.com>, linux-clk@vger.kernel.org,
 linux-rtc@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>, Lee Jones <lee@kernel.org>,
 Russell King <linux@armlinux.org.uk>,
 Yang Yingliang <yangyingliang@huawei.com>, linux-media@vger.kernel.org,
 David Lechner <david@lechnology.com>, Arnd Bergmann <arnd@arndb.de>,
 linux-input@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Bin Liu <b-liu@ti.com>,
 Alessandro Zummo <a.zummo@towertech.it>, Sergey Shtylyov <s.shtylyov@omp.ru>,
 Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, Marc Zyngier <maz@kernel.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
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

On Wed, 19 Oct 2022 17:29:26 +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> As part of removing all board files that were previously marked as unused,
> I looked through the davinci platform and recursively removed everything
> that has now become unused.
> 
> In particular, this is for all dm3xx support, in addition to the dm64xx
> support removed previously. The remaining support is now for da8xx using
> devicetree only, which means a lot of the da8xx specific device support
> can also go away.
> 
> [...]

Applied, thanks!

[08/14] rtc: remove davinci rtc driver
        commit: 6274ef3c7eb5e9792a708c23757e16b444e4267f

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
