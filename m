Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ED4FE43DC00
	for <lists+alsa-devel@lfdr.de>; Thu, 28 Oct 2021 09:28:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6F4A816B8;
	Thu, 28 Oct 2021 09:27:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6F4A816B8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635406091;
	bh=zjWLLIs0abhz/P6dxN0/+XDtBoeSfVrrcfpyRgVACBQ=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EBu5PJihay+T/L8eh91DsQG5Z0X8LbK/dtCvGok9BvHV9B7EbCLUB1Q+AdfFKewKX
	 5plP1iXlvVWYd8j7gkxEih1mFHcIN6f1kCFBu+hDe3J/dcLH7Ni7amRaBtT0lJowxt
	 oumYIXtiLW4hy2kwQ9TQb/WXWgWsGzNnSUfGGNv8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CBF0BF804FA;
	Thu, 28 Oct 2021 09:25:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 97615F8025A; Wed, 27 Oct 2021 18:58:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.6 required=5.0 tests=KHOP_HELO_FCRDNS, PRX_BODY_93, 
 SPF_HELO_NONE, SPF_NONE, T_FILL_THIS_FORM_SHORT,
 UNPARSEABLE_RELAY, URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtprelay.hostedemail.com (smtprelay0074.hostedemail.com
 [216.40.44.74])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6C340F8010A
 for <alsa-devel@alsa-project.org>; Wed, 27 Oct 2021 18:58:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6C340F8010A
Received: from omf01.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
 by smtprelay06.hostedemail.com (Postfix) with ESMTP id 83DAE18224D8A;
 Wed, 27 Oct 2021 16:58:41 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by
 omf01.hostedemail.com (Postfix) with ESMTPA id 34EC11727C; 
 Wed, 27 Oct 2021 16:57:52 +0000 (UTC)
Message-ID: <20ffb5604269f9add568b343701d42097c599c89.camel@perches.com>
Subject: Re: dt-bindings: treewide: Update @st.com email address to
 @foss.st.com
From: Joe Perches <joe@perches.com>
To: Patrice CHOTARD <patrice.chotard@foss.st.com>, Marc Zyngier
 <maz@kernel.org>,  Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Date: Wed, 27 Oct 2021 09:57:50 -0700
In-Reply-To: <865a4055-5c2f-0793-bdce-9f04eac167d2@foss.st.com>
References: <20211020065000.21312-1-patrice.chotard@foss.st.com>
 <22fb6f19-21eb-dcb5-fa31-bb243d4a7eaf@canonical.com>
 <878ryoc4dc.wl-maz@kernel.org>
 <82492eb2-5a5e-39a2-a058-5e2ba75323e0@foss.st.com>
 <865a4055-5c2f-0793-bdce-9f04eac167d2@foss.st.com>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Stat-Signature: d7f39g9ut4x78f1qzm6ux4u3z7warbny
X-Rspamd-Server: rspamout02
X-Rspamd-Queue-Id: 34EC11727C
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1/mP1yO9Xb7wezovkJWdqP2VR+2BHiCxac=
X-HE-Tag: 1635353872-396338
X-Mailman-Approved-At: Thu, 28 Oct 2021 09:25:10 +0200
Cc: Ludovic Barre <ludovic.barre@foss.st.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>, dri-devel@lists.freedesktop.org,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Jassi Brar <jassisinghbrar@gmail.com>, Jose Abreu <joabreu@synopsys.com>,
 olivier moysan <olivier.moysan@foss.st.com>,
 Guenter Roeck <linux@roeck-us.net>, ohad ben-cohen <ohad@wizery.com>,
 linux-pm@vger.kernel.org, Matt Mackall <mpm@selenic.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 linux-spi@vger.kernel.org, linux-crypto@vger.kernel.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 david airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 thierry reding <thierry.reding@gmail.com>, linux-i2c@vger.kernel.org,
 lars-peter clausen <lars@metafoo.de>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, linux-clk@vger.kernel.org,
 Fabien Dessenne <fabien.dessenne@foss.st.com>,
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
 linux-mtd@lists.infradead.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 benjamin gaignard <benjamin.gaignard@linaro.org>,
 linux-phy@lists.infradead.org, sam ravnborg <sam@ravnborg.org>,
 linux-rtc@vger.kernel.org, Kishon Vijay Abraham I <kishon@ti.com>,
 arnaud pouliquen <arnaud.pouliquen@foss.st.com>,
 Mark Brown <broonie@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
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
 Marek Vasut <marex@denx.de>, Ahmad Fatoum <a.fatoum@pengutronix.de>,
 herbert xu <herbert@gondor.apana.org.au>,
 Hugues Fruchet <hugues.fruchet@foss.st.com>, linux-serial@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 dillon min <dillon.minfei@gmail.com>, Alessandro Zummo <a.zummo@towertech.it>,
 netdev@vger.kernel.org, yannick fertre <yannick.fertre@foss.st.com>,
 vinod koul <vkoul@kernel.org>, philippe cornu <philippe.cornu@foss.st.com>,
 daniel vetter <daniel@ffwll.ch>, Richard Weinberger <richard@nod.at>,
 dmaengine@vger.kernel.org
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

On Wed, 2021-10-27 at 15:56 +0200, Patrice CHOTARD wrote:
> On 10/27/21 8:11 AM, Patrice CHOTARD wrote:
> > On 10/20/21 1:39 PM, Marc Zyngier wrote:
> > > On Wed, 20 Oct 2021 08:45:02 +0100,
> > > Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com> wrote:
> > > > On 20/10/2021 08:50, patrice.chotard@foss.st.com wrote:
> > > > > From: Patrice Chotard <patrice.chotard@foss.st.com>
> > > > > 
> > > > > Not all @st.com email address are concerned, only people who have
> > > > > a specific @foss.st.com email will see their entry updated.
> > > > > For some people, who left the company, remove their email.
> > > > Also would be nice to see here explained *why* are you doing this.
> > > 
> > > And why this can't be done with a single update to .mailmap, like
> > > anyone else does.
> > 
> > Thanks for the tips, yes, it will be simpler.
> 
> I made a try by updating .mailmap with adding a new entry with my @foss.st.com email :
> 
>  Pali Rohár <pali@kernel.org> <pali.rohar@gmail.com>
>  Paolo 'Blaisorblade' Giarrusso <blaisorblade@yahoo.it>
> +Patrice Chotard <patrice.chotard@foss.st.com> <patrice.chotard@st.com>
>  Patrick Mochel <mochel@digitalimplant.org>
>  Paul Burton <paulburton@kernel.org> <paul.burton@imgtec.com>
> 
> But when running ./scripts/get_maintainer.pl Documentation/devicetree/bindings/arm/sti.yaml, by old email is still displayed
> 
> Rob Herring <robh+dt@kernel.org> (maintainer:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS)
> Patrice Chotard <patrice.chotard@st.com> (in file)
> devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS)
> linux-kernel@vger.kernel.org (open list)
> 
> By default, the get_maintainer.pl script is using .mailmap file ($email_use_mailmap = 1).
> 
> It seems there is an issue with get_maintainer.pl and maintainer name/e-mail found in yaml file ?

I'm of two minds whether it's an "issue" actually.

get_maintainer is not the only tool used to create email
address lists.

Some actually read files like MAINTAINERS or .dts or .yaml
files directly to find maintainer addresses.

So If your name and email address is listed in an source file
where nominally active email addresses are entered then I
believe .mailmap should not modify it.

So I believe email addresses in each file should be updated
in preference to using a mailmap entry for nominally active
email addresses in these files.

---

$ cat Documentation/devicetree/bindings/arm/sti.yaml
# SPDX-License-Identifier: GPL-2.0
%YAML 1.2
---
$id: http://devicetree.org/schemas/arm/sti.yaml#
$schema: http://devicetree.org/meta-schemas/core.yaml#

title: ST STi Platforms Device Tree Bindings

maintainers:
  - Patrice Chotard <patrice.chotard@st.com>



