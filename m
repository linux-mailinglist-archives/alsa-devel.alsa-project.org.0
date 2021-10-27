Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BC15643DBF4
	for <lists+alsa-devel@lfdr.de>; Thu, 28 Oct 2021 09:27:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 570EF16BF;
	Thu, 28 Oct 2021 09:26:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 570EF16BF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635406033;
	bh=fxd0Dw1qDU3ZyGHWDre2PnZHu6dkT9wIjZ1ZmlRe5xo=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=o/YmqTjD9WP5iGQK33SQwa1/V92O4V/Us5R4Noull5atJY7MZlLTVHGnQR3MNf4nI
	 B6Ej+zxjUtL/aD4MRj3iX7i6rn5Pd2TPRFYwEzhoMUj2PjU2THDk/2QLxbP/4PfTRe
	 /Vwof+gID0f0brWipYcne9rno78ReDf5ob259GWo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C2B2CF804E2;
	Thu, 28 Oct 2021 09:25:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 19DCDF8025A; Wed, 27 Oct 2021 08:11:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E6DE8F800FF
 for <alsa-devel@alsa-project.org>; Wed, 27 Oct 2021 08:11:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E6DE8F800FF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com
 header.b="qpkz848/"
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19QIJReu011037; 
 Wed, 27 Oct 2021 08:11:51 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=nT19xZKAS1g6Wr2Uc3j1zTC0eEqLF61U2hb0csAByE8=;
 b=qpkz848/RtyF6rGQB646MxF7l3lRxh06i/JQDEq4QXdNf0bBls4oIzPKu9hJoks6f/Qu
 zZ5EPSZzQPRMBZmURzYyXHIGJHoV4pRjFM5QrtfySALfgLuclLRwFWXOohJuaq9ZdXXU
 1A/tvhP9HqzAkj7qPpIoRWuTrxgBM2xIlkxBQmQxMEry3YegaYhl15hpEr+uFaZRHM09
 G2djmdsXb1j1BFg4VMmDFOY0NS6CiVjZ+SJVVgVnIEPs22BxO+HytLu9jDmcsJjCYtyk
 jzPyozDJ9b4xRK9AsLTKfGq8y+d1KoyRnwgOYG+KGwS3rDJRaK+8FSk1qCrfTltXZ7Qd XQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3bxputjf0c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Oct 2021 08:11:51 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0ACD410002A;
 Wed, 27 Oct 2021 08:11:49 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E23C3218104;
 Wed, 27 Oct 2021 08:11:48 +0200 (CEST)
Received: from lmecxl0573.lme.st.com (10.75.127.51) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Wed, 27 Oct
 2021 08:11:45 +0200
Subject: Re: dt-bindings: treewide: Update @st.com email address to
 @foss.st.com
To: Marc Zyngier <maz@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski@canonical.com>
References: <20211020065000.21312-1-patrice.chotard@foss.st.com>
 <22fb6f19-21eb-dcb5-fa31-bb243d4a7eaf@canonical.com>
 <878ryoc4dc.wl-maz@kernel.org>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <82492eb2-5a5e-39a2-a058-5e2ba75323e0@foss.st.com>
Date: Wed, 27 Oct 2021 08:11:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <878ryoc4dc.wl-maz@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-27_01,2021-10-26_01,2020-04-07_01
X-Mailman-Approved-At: Thu, 28 Oct 2021 09:25:10 +0200
Cc: Ludovic Barre <ludovic.barre@foss.st.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>, dri-devel@lists.freedesktop.org,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Jassi Brar <jassisinghbrar@gmail.com>, Jose
 Abreu <joabreu@synopsys.com>, olivier moysan <olivier.moysan@foss.st.com>,
 Guenter Roeck <linux@roeck-us.net>, ohad ben-cohen <ohad@wizery.com>,
 linux-pm@vger.kernel.org, Matt Mackall <mpm@selenic.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 linux-spi@vger.kernel.org, linux-crypto@vger.kernel.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 david airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 thierry reding <thierry.reding@gmail.com>, linux-i2c@vger.kernel.org,
 lars-peter
 clausen <lars@metafoo.de>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 linux-clk@vger.kernel.org, Fabien Dessenne <fabien.dessenne@foss.st.com>,
 Jagan Teki <jagan@amarulasolutions.com>, linux-media@vger.kernel.org,
 linux-watchdog@vger.kernel.org, Amelie Delaunay <amelie.delaunay@foss.st.com>,
 linux-gpio@vger.kernel.org, Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org,
 Mathieu Poirier <mathieu.poirier@linaro.org>, stephen boyd <sboyd@kernel.org>,
 pascal Paillet <p.paillet@foss.st.com>,
 maxime coquelin <mcoquelin.stm32@gmail.com>,
 jonathan cameron <jic23@kernel.org>, Le Ray <erwan.leray@foss.st.com>,
 linux-iio@vger.kernel.org, michael turquette <mturquette@baylibre.com>,
 Amit Kucheria <amitk@kernel.org>, alsa-devel@alsa-project.org,
 linux-mtd@lists.infradead.org, Laurent
 Pinchart <laurent.pinchart@ideasonboard.com>,
 benjamin gaignard <benjamin.gaignard@linaro.org>,
 linux-phy@lists.infradead.org, sam ravnborg <sam@ravnborg.org>,
 linux-rtc@vger.kernel.org, Kishon Vijay Abraham I <kishon@ti.com>,
 arnaud pouliquen <arnaud.pouliquen@foss.st.com>,
 Mark Brown <broonie@kernel.org>, Mauro Carvalho
 Chehab <mchehab@kernel.org>,
 Christophe Kerello <christophe.kerello@foss.st.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Sebastian Reichel <sre@kernel.org>,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 baolin wang <baolin.wang7@gmail.com>, "david s . miller" <davem@davemloft.net>,
 Vignesh Raghavendra <vigneshr@ti.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-remoteproc@vger.kernel.org,
 alexandre torgue <alexandre.torgue@foss.st.com>,
 bjorn andersson <bjorn.andersson@linaro.org>,
 Paul Cercueil <paul@crapouillou.net>,
 Lionel Debieve <lionel.debieve@foss.st.com>, Lee Jones <lee.jones@linaro.org>,
 Marek Vasut <marex@denx.de>, Ahmad
 Fatoum <a.fatoum@pengutronix.de>, herbert xu <herbert@gondor.apana.org.au>,
 Hugues Fruchet <hugues.fruchet@foss.st.com>, linux-serial@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 dillon min <dillon.minfei@gmail.com>, Alessandro
 Zummo <a.zummo@towertech.it>, netdev@vger.kernel.org,
 yannick fertre <yannick.fertre@foss.st.com>, vinod koul <vkoul@kernel.org>,
 philippe
 cornu <philippe.cornu@foss.st.com>, daniel vetter <daniel@ffwll.ch>, Richard
 Weinberger <richard@nod.at>, dmaengine@vger.kernel.org
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

Hi Marc

On 10/20/21 1:39 PM, Marc Zyngier wrote:
> On Wed, 20 Oct 2021 08:45:02 +0100,
> Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com> wrote:
>>
>> On 20/10/2021 08:50, patrice.chotard@foss.st.com wrote:
>>> From: Patrice Chotard <patrice.chotard@foss.st.com>
>>>
>>> Not all @st.com email address are concerned, only people who have
>>> a specific @foss.st.com email will see their entry updated.
>>> For some people, who left the company, remove their email.
>>>
>>
>> Please split simple address change from maintainer updates (removal,
>> addition).
>>
>> Also would be nice to see here explained *why* are you doing this.
> 
> And why this can't be done with a single update to .mailmap, like
> anyone else does.

Thanks for the tips, yes, it will be simpler.

Thanks
Patrice

> 
> 	M.
> 
