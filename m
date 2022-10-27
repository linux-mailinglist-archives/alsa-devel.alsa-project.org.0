Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 97537610189
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Oct 2022 21:21:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 38C8F2B23;
	Thu, 27 Oct 2022 21:20:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 38C8F2B23
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666898485;
	bh=9dJxbXEMErZ8t4h221dFyy5GrBkDKxqglNeRuSY+Z/g=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WlCJ3G3JUHeFuAwf5KTqNNuPqVXq97NWWs/yu0EFtQU4bYPn7jFw8Ecl7CYrR6Wgm
	 yruhuOzTfsxdk/pKeX8e+HiEoRgHoyLA0LiSslQRCXQ7TxhxHXXW41eh8qbVwpaf7+
	 FUMFwma6ATyWZfApxjjDRGRfweAEyfT+78uKxSu4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 72215F804AD;
	Thu, 27 Oct 2022 21:20:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 48D17F804D9; Thu, 27 Oct 2022 21:20:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_76,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5F3AEF8025A
 for <alsa-devel@alsa-project.org>; Thu, 27 Oct 2022 21:20:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5F3AEF8025A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com
 header.b="FypfZf5g"
Received: from notapiano (zone.collabora.co.uk [167.235.23.81])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 (Authenticated sender: nfraprado)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id BBDB56602901;
 Thu, 27 Oct 2022 20:20:19 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1666898421;
 bh=9dJxbXEMErZ8t4h221dFyy5GrBkDKxqglNeRuSY+Z/g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FypfZf5gz1/t1Dy1SoKKAZSlLago1tiIZqAALtt3IgovT3zAVCXjfcOmrNqwIS1aP
 Gaa/GAv1u3u2e2bPzAlZYiPMhF8eFmio8m/O5y6aNlvPparNWktBtZNcL/avsAa+am
 aJpCspM6ZVSGJqRL7wk8jPiFH50wPWVWXaLPIggshnXGzN9og4wpWZq6tvu5MzElaN
 OIdPdzsCKlpGgdQ55qs6Zkm5iG1XHQ2V/yA8DUDfXKOlKhFolaL23es4vcsjnDIohg
 cw8JZnCYN81y2EmbyGeS6DqxuQFTKExsI85c21xzDBRfLhVK30cEDqXBiF2hKuhAR8
 T6ojLQorHHHbg==
Date: Thu, 27 Oct 2022 15:20:15 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Subject: Re: [PATCH v2 2/4] ASoC: dt-bindings: realtek, rt5682s: Add AVDD and
 MICVDD supplies
Message-ID: <20221027192015.qbmf4bwwok63wytz@notapiano>
References: <20221024220015.1759428-1-nfraprado@collabora.com>
 <20221024220015.1759428-3-nfraprado@collabora.com>
 <CAGXv+5HJo5x2ieOegmv5vkfh+rTevdR_fri-7PeK+Gd+GXVjNw@mail.gmail.com>
 <20221027143627.nbbketezqunkclxh@notapiano>
 <CAGXv+5Hki=VsvZrtANujFYseBp0Lxj4WVf3nzT7cx1kkMmWPFg@mail.gmail.com>
 <CAGXv+5EZO0+Af-Fmz8JW0SiV+b5He8ZSrinJ3TtaCP0vEoW1Mg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGXv+5EZO0+Af-Fmz8JW0SiV+b5He8ZSrinJ3TtaCP0vEoW1Mg@mail.gmail.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Derek Fang <derek.fang@realtek.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, kernel@collabora.com,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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

On Thu, Oct 27, 2022 at 11:11:08AM -0700, Chen-Yu Tsai wrote:
> On Thu, Oct 27, 2022 at 10:48 AM Chen-Yu Tsai <wenst@chromium.org> wrote:
> >
> > On Thu, Oct 27, 2022 at 7:36 AM Nícolas F. R. A. Prado
> > <nfraprado@collabora.com> wrote:
> > >
> > > On Tue, Oct 25, 2022 at 01:12:49PM -0700, Chen-Yu Tsai wrote:
> > > > On Mon, Oct 24, 2022 at 3:01 PM Nícolas F. R. A. Prado
> > > > <nfraprado@collabora.com> wrote:
> > > > >
> > > > > The rt5682s codec can have two supplies: AVDD and MICVDD. They are
> > > >
> > > > The actual chip also has LDO1_IN (for digital core and charge pump)
> > > > and DBVDD (for I/O). However in the Chromebook designs these two
> > > > and AVDD are all provided from the same power rail, through separate
> > > > filter banks.
> > >
> > > What about rt5682 (no s), does that chip also have these same supplies?
> 
> (Missed this question)
> 
> The RT5682 has the same supplies, plus the VBAT one.
> 
> ChenYu
> 
> > > Also, since you already gave the purpose of these other supplies, could you also
> > > tell the purpose of AVDD, MICVDD and (for rt5682) VBAT? That way I could add
> > > some description for them in the binding.
> >
> > As Mark mentioned in his reply, these are quite standard names.
> >
> > AVDD is for the analog bits. MICVDD is for the microphone bias.
> > VBAT is called battery power in the datasheet. The block diagram
> > shows it going through an internal controllable LDO whose output
> > then powers MICVDD. This could be used in designs that don't
> > include a suitable external supply for MICVDD. If MICVDD is provided,
> > then one would turn the internal LDO off.
> >
> > So either VBAT or MICVDD has to be provided.

So if I get this right we should be making the following supplies required:
AVDD
VBAT or MICVDD (on rt5682s there's no VBAT so just MICVDD)

And for LDO1_ON and DBVDD what would be the best way to model? Should we make
them required in the binding as well and add them pointing to the same regulator
from AVDD in the chromebook DT or just leave them as optional?

Thanks,
Nícolas

> >
> > ChenYu
> >
> > > Thanks,
> > > Nícolas
> > >
> > > >
> > > > Neither does the datasheet specify the ordering of AVDD, DBVDD, and
> > > > LDO1_IN for power sequencing, just that three should be toggled together.
> > > >
> > > > Should we model these? Or wait until some design actually splits these?
> > > [..]
