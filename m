Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D60DAD50A2
	for <lists+alsa-devel@lfdr.de>; Sat, 12 Oct 2019 17:17:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 55C4B1673;
	Sat, 12 Oct 2019 17:16:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 55C4B1673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570893446;
	bh=RBum3+mLYTOHTkQuNbqnl0AqwLqeYwnIMUGnItV9m9E=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nhuEo+AXTM8FvtW+vJApmSjNmDcEsSiqpBIHBIl5F9d0nJuzxg8MMNa+k9SmomFIO
	 WarOqOVzdI+VjZoDHd5sJVLZHSLAgy7gX+R6aow8vae1uQdHGGT7sJRXYpw6twSUFf
	 j5kfHtmo2lPpw7m4NFYvuPIsqCGQF+/haf6EbHV0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 84370F8038F;
	Sat, 12 Oct 2019 17:15:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8F6DBF8038F; Sat, 12 Oct 2019 17:15:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled
 version=3.4.0
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com
 [IPv6:2607:f8b0:4864:20::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C2A1EF80322
 for <alsa-devel@alsa-project.org>; Sat, 12 Oct 2019 17:15:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C2A1EF80322
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="CqWF2eYv"
Received: by mail-oi1-x242.google.com with SMTP id m16so10441418oic.5
 for <alsa-devel@alsa-project.org>; Sat, 12 Oct 2019 08:15:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9TuWZL8fm8tHubBKGz9o0y6mbP3/Vd2gcfxdZuF+lAc=;
 b=CqWF2eYvWlLpv7EIKbCwalYdS6XRVZD0rFMMYIRCkqkANq2NwTpkAUqOfMHn0IWCx1
 3Z2xC2U42EnINUij8UZl+S1lALDqhByRstgB/wNMIMojBTjznQeD+2ikKMljQaU1JrZ9
 tOzzHAHRG45EV3LDV+RMkFVHoWbhwtVV+5nQDCxeyCGTF8C28+AjNRlWSqiuVSRNquEO
 zY+y/8Q16X88W/cBsWsJbK7AcARaAVuBgxk4jdcNd2UkPlr6x8b3dRAif5z52rSqwt6P
 kNYaiRwz6LpaZF6lBNnMWYoCohklK0x/u+h+wfa5jI/hqCZfahfCy6dsXVjnkq25uvZh
 7GcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9TuWZL8fm8tHubBKGz9o0y6mbP3/Vd2gcfxdZuF+lAc=;
 b=gE8hP7BI35tJ50dCBq2b2HN6W005jHrrHG3TzauXsq6NPsTxFUfzsyTD/mXqDeViDT
 n7H2Gyg6k8bWzVXA/SQqFLluBj3v39f+WxHl0OFXDIPJYNLynGNYtBeEWpbatRWbRTHB
 OPGs6HSkfVlL4wLRQoG1+jy4uiNT7fNVe831AaHlij2ZdAGBDVYjOzsqhH1HRo5d3nLN
 Ttw1zbnyRC/4nn/D8AubWx0pAaxiuL0V0ACa4B7K51TfDTboC20Uv+6/WWTkle4LQ0qk
 bs4wLTCGDJSPnLXRT3hdcifrXce+OrsFmFntTklNLs8LC4Yh+ff3acN6SOqiJjj5iGwx
 uz+Q==
X-Gm-Message-State: APjAAAUu5bmXzQw5LjUKKa9sPm5GDnu0ilfkF5XWFhJcp3bOreXrnJ8f
 WvbYLFaOVYrESyBuBj/qGk8tU9+eH0reSQ7qi+WY2g==
X-Google-Smtp-Source: APXvYqwLyLRZZEIcDIb3bCKrTvubetBOeIB24B4ZwAkkq8gO5Z4Qs11iRGUNSNx8o4VRiLo7+XBfa1Ebo2ZgAANyXe0=
X-Received: by 2002:aca:4382:: with SMTP id q124mr17255559oia.23.1570893333325; 
 Sat, 12 Oct 2019 08:15:33 -0700 (PDT)
MIME-Version: 1.0
References: <20191005085509.187179-1-tzungbi@google.com>
 <20191005164320.09.Iec97a3f137148cdf316056612590b3e0b302f5f3@changeid>
 <20191011152029.GA18877@bogus>
In-Reply-To: <20191011152029.GA18877@bogus>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Sat, 12 Oct 2019 23:15:22 +0800
Message-ID: <CA+Px+wWRSyL4fHg_9VE1xu5ToP7dG+o+ooVKj3ucp8rB9Td_kw@mail.gmail.com>
To: Rob Herring <robh@kernel.org>
Cc: Gwendal Grignou <gwendal@google.com>, devicetree@vger.kernel.org,
 ALSA development <alsa-devel@alsa-project.org>,
 Jimmy Cheng-Yi Chiang <cychiang@google.com>,
 Nicolas Boichat <drinkcat@google.com>, Mark Brown <broonie@kernel.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Benson Leung <bleung@google.com>, Dylan Reid <dgreid@google.com>
Subject: Re: [alsa-devel] [PATCH v2 09/10] ASoC: dt-bindings: mt8183: add
	ec-codec
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

On Fri, Oct 11, 2019 at 11:20 PM Rob Herring <robh@kernel.org> wrote:
>
> On Sat, Oct 05, 2019 at 04:55:08PM +0800, Tzung-Bi Shih wrote:
> > Add an optional property "ec-codec".  If specified, mt8183 could use the
> > "wake on voice" feature offered by EC codec.
> >
> > Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
> > ---
> >  .../bindings/sound/mt8183-mt6358-ts3a227-max98357.txt          | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/sound/mt8183-mt6358-ts3a227-max98357.txt b/Documentation/devicetree/bindings/sound/mt8183-mt6358-ts3a227-max98357.txt
> > index 17ff3892f439..decaa013a07e 100644
> > --- a/Documentation/devicetree/bindings/sound/mt8183-mt6358-ts3a227-max98357.txt
> > +++ b/Documentation/devicetree/bindings/sound/mt8183-mt6358-ts3a227-max98357.txt
> > @@ -6,12 +6,15 @@ Required properties:
> >
> >  Optional properties:
> >  - mediatek,headset-codec: the phandles of ts3a227 codecs
> > +- mediatek,ec-codec: the phandle of EC codecs.
> > +                     See google,cros-ec-codec.txt for more details.
>
> Not the best designed audio binding here. We really should just have
> links to codecs and then you can look at the codec nodes to determine
> the type.

Did you mean: we should use an "audio-codec" array.  In the machine
driver, we should maintain a table of correspondence of compatible
string and the related context.  And use of_device_is_compatible( ) to
determine their types?  Something similar to
https://elixir.bootlin.com/linux/v5.3.5/source/sound/soc/rockchip/rk3399_gru_sound.c#L436

>
> >
> >  Example:
> >
> >       sound {
> >               compatible = "mediatek,mt8183_mt6358_ts3a227_max98357";
>
> Don't you need to add EC codec to this? Just kidding. Just highlighting
> the weirdness of this binding.

Could you explain some?  I cannot understand the "weird" here.  I
thought add the property "mediatek,ec-codec" could be enough.
Or did you mean: the compatible string should reflect the EC codec presence?

>
> >               mediatek,headset-codec = <&ts3a227>;
> > +             mediatek,ec-codec = <&ec_codec>;
> >               mediatek,platform = <&afe>;
> >       };
> >
> > --
> > 2.23.0.581.g78d2f28ef7-goog
> >
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
