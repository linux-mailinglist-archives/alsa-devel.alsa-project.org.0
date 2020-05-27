Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 73A071E50CF
	for <lists+alsa-devel@lfdr.de>; Wed, 27 May 2020 23:59:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 077DE17C7;
	Wed, 27 May 2020 23:58:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 077DE17C7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1590616779;
	bh=FxaI0OUQM7gMug3fWaa0sWWyL5w7dBkYlAzN4afPIds=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gBE6PG5N25VA2mBfcl0omGVjUVYdbiuecfoghs2oraEWV50f76VsH5qUVQCVaszs8
	 PN2GgLcs+dx5A43kLnS/ikLoBGKWXhyIy0yFGbWl/JfcrUjKPGAOqOA2m5v1g5jQdf
	 Yi3q7JjLroy8tWVWxwng0qDqaKZ3Rf0VxYn8PqO4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EBC3BF800CD;
	Wed, 27 May 2020 23:57:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6F3E0F8016F; Wed, 27 May 2020 23:57:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H2,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 92333F800CD
 for <alsa-devel@alsa-project.org>; Wed, 27 May 2020 23:57:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 92333F800CD
Received: from mail-qt1-f169.google.com ([209.85.160.169]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1M58SY-1jcy7v0FW8-0016N3 for <alsa-devel@alsa-project.org>; Wed, 27 May
 2020 23:57:51 +0200
Received: by mail-qt1-f169.google.com with SMTP id w90so2618290qtd.8
 for <alsa-devel@alsa-project.org>; Wed, 27 May 2020 14:57:50 -0700 (PDT)
X-Gm-Message-State: AOAM530OadCwOf0n1jUpSlWmfu56kUE89TseSNF5B+eC3xQyU6401uTD
 fTP8JBYCl5/zwclpQmvxPda3ys9Ljhn02/0TdL0=
X-Google-Smtp-Source: ABdhPJzip70H1KwYX1s5TKJluQwoj7pMFq4UElZk7BE7UqzNUerzc1aReF2z3NGYv6cclDoxnTuN1MbNjmBT6MxK6Nk=
X-Received: by 2002:ac8:306d:: with SMTP id g42mr43805qte.18.1590616669783;
 Wed, 27 May 2020 14:57:49 -0700 (PDT)
MIME-Version: 1.0
References: <20200527193730.930412-1-arnd@arndb.de>
 <20200527205658.GM5308@sirena.org.uk>
In-Reply-To: <20200527205658.GM5308@sirena.org.uk>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 27 May 2020 23:57:33 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2WrCGFtYx52sMu2rsWQFq6kKhEFWGEk2Tn+4gEQTLxBw@mail.gmail.com>
Message-ID: <CAK8P3a2WrCGFtYx52sMu2rsWQFq6kKhEFWGEk2Tn+4gEQTLxBw@mail.gmail.com>
Subject: Re: [PATCH] ASoC: rt5682: split i2c driver into separate module
To: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:Idg/DwW0J5hHqRVQ+iuvASihsZ7N21pckd3JK2OmO9RQTt67wiV
 88xQDqCCjoDMCSAff2KBk1RijdHpx0K9kIxC4KHJVdUQA5DCeklvoyPOys8jtVpxqbX88PW
 r8OlH102svGK8j5ghQ2JP0ICYWm/OdczuRRN5kiTz2sf7Y9HoHSO6xkpzbw4hXWxg5yoJP6
 VgRRNsJVDW9IRqu0hC1bg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:qG6cHnO+wB0=:v7Eqz/zOHU+ULYUIHds/PO
 qwHHcviTTDkK2lLx2CPEtxMPfua9NijmYYuKUQtiUIE5Xa5m8o+PJGOyCg8DDsWCxZVvJ6+Zx
 NZl7ohco2H91Y+jlwFJqXsy8EYMyXF1+Rc9n+QEqYqo1bIvrgcydmhmCBsLcKyIkZJogC1Ic9
 PRW9Vy9nkydn946MVf35g1giKVj1ki4A4QUWrnrDwT4no98YSdNMS5rUtQPSX7YgNVFrO/LkV
 20gRLyC4D61Gwha7VsYj4JXQ/vTJXBnAM2hyiv0l2g2BmXRhEZcC55SW+kj++8oAAZPXjW3W7
 XtFBl7gMgxGKBeHJk1ayIdTLbCrk9qzKK875D3RIMIoxB79T7vEcSKUivClVH5czjR1Py89A5
 +zXLUYEiTklUyIWHrDqkUWP+0w74QWrglL5pSKuPDc0dLwTQ0vgci0reu0rpG7f2aSF6SN/y/
 y3DzBNcWmhttci8/iQ/Ws2krBIqEvkVwz5p05hLQTE18XhRJvzpd3l8ilcqmAQNyXxEVowWEJ
 5y+M6mjOAS/+785JwU9pg0V891qi7mvU2Ur2chTFCcd8OwYn7NgoAANZhR2hXhWCLv+p2vx8H
 kyRQFgyhOvtHRuSsiUDSQugsp63s4RT2pgLiTGo33hqJr9n99bOO4143RtUKIxp2lfJpvMrL8
 6nryBqRf2J1pXimlgfXM1nmicXfzsmOVpusB1mcHj9jOySF0JbHVyQiOYJtBvRV7PnJv28R1/
 +Lll71f89V3gKFSXFP3XDwCM4WRvg4sLlrF9ougD3vnEzeaC6i06uCUUe2pwwzNBeSmw0SVNt
 T06ktGbuHfGvvJpvEal3XUHlEuPLZzAh9YlBH09+JTa2yhG88I=
Cc: Oder Chiou <oder_chiou@realtek.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Akshu Agrawal <akshu.agrawal@amd.com>
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

On Wed, May 27, 2020 at 10:57 PM Mark Brown <broonie@kernel.org> wrote:
>
> On Wed, May 27, 2020 at 09:34:13PM +0200, Arnd Bergmann wrote:
>
> > index 000000000000..c891aa80757f
> > --- /dev/null
> > +++ b/sound/soc/codecs/rt5682-i2c.c
> > @@ -0,0 +1,341 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * rt5682.c  --  RT5682 ALSA SoC audio component driver
> > + *
>
> Please keep the entire comment C++ so things look more intentional.

That's the kind of change I was trying to avoid by just moving
things around, but I've done that now in both files.

> > +static const char *rt5682_supply_names[RT5682_NUM_SUPPLIES] = {
> > +     "AVDD",
> > +     "MICVDD",
> > +     "VBAT",
> > +};
>
> I'm *fairly* sure the device needs power even with Soundwire?

I have no idea how this is done with ACPI. I'm moving it
back as an exported symbol. There should probably be
some abstraction that handles this in the common part of
the driver along with some of the other bits of
rt5682_i2c_probe, but really don't want to shake things up
too much and would let this be done by whoever needs to add
DT support to the soundwire driver in the future and is able
to test the changes.

> > +static void rt5682_jd_check_handler(struct work_struct *work)
> > +{
> > +     struct rt5682_priv *rt5682 = container_of(work, struct rt5682_priv,
> > +             jd_check_work.work);
>
> > +static int rt5682_parse_dt(struct rt5682_priv *rt5682, struct device *dev)
> > +{
> > +
> > +     device_property_read_u32(dev, "realtek,dmic1-data-pin",
> > +             &rt5682->pdata.dmic1_data_pin);
> > +     device_property_read_u32(dev, "realtek,dmic1-clk-pin",
> > +             &rt5682->pdata.dmic1_clk_pin);
>
> This doesn't look very I2C specific either, nor do chunks of the rest of
> the code.  The usual pattern with this stuff is to have the bus specific
> code do bus specific stuff like setting up the regmap and then call into
> a common init function for the shared parts of the chip.  I'd expect a
> bit more unshared code here but not this much.

Right, I was surprised the soundwire portion does not tie into
device tree at all, and none of the other soundwire codecs seem
to either and no dts files reference it, though there is some code
for the subsystem and a binding.

     Arnd
