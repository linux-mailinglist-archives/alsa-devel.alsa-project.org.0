Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C9741256F52
	for <lists+alsa-devel@lfdr.de>; Sun, 30 Aug 2020 18:24:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 41A1218EC;
	Sun, 30 Aug 2020 18:23:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 41A1218EC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598804652;
	bh=IbKj4ffvk9Aj45UeB+AMz4FbegmiLdfiI62JVdEx/gA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=W46vConolZU/pNwVWQiDiSaKKZjumtJUVSePauaiTqsi8q06YGUFb5eebSY9aQSvz
	 gHu8s3ub4bqBK/ZXGIhtkkGA65I5dWXmGoa7KES9IYBRuEuIerZQOkFkN+vPtiZXpV
	 qRYOGueKbn5rXXSg74V+r/EBfkfIcIFhe7sveamE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6EDBBF80217;
	Sun, 30 Aug 2020 18:22:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 94A5BF8020D; Sun, 30 Aug 2020 18:22:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-vs1-xe43.google.com (mail-vs1-xe43.google.com
 [IPv6:2607:f8b0:4864:20::e43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 63DBCF8012E
 for <alsa-devel@alsa-project.org>; Sun, 30 Aug 2020 18:22:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 63DBCF8012E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="e6gDQeM+"
Received: by mail-vs1-xe43.google.com with SMTP id x2so2044245vsp.13
 for <alsa-devel@alsa-project.org>; Sun, 30 Aug 2020 09:22:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Z06b0kU9wn19cfBXnF5Y+xrjYDF9DOBSpgPz6QyB+UE=;
 b=e6gDQeM+scr90I8EBtpkiubS50gqjj1637ZJiexV9K+RaCcCN9QW2/FNQhlcWitbE2
 u/DHZ7xjURb5sKwMwYWnfThwBItFTs1ibu477EpbwoEY/oWjmluCks0AvrFrjf+sjdOR
 WKwpjVk8LbLc85cQTkazXFRedDSGV0cHQjudI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Z06b0kU9wn19cfBXnF5Y+xrjYDF9DOBSpgPz6QyB+UE=;
 b=dN3I1hilYGGmPARbRN4GMNrfMKUVuypEqTVPLV5yfek0kobh4QcZqXHJxCzrZBYhzh
 3Oe0HPu93duc1mUHZIrtwmsMzyOgDYJ7nou7aRdrbzTIaMiSanAj7I+nuVqvvjRqp6iz
 kdffBhGSV0+ndBdMKEdeDFDatAbOV2t7rIvnbiZ7o5z88aj6q2zy52m3P8vbhirWntIn
 TNRDvAe0YdLDSPgoJghkDbABMfo4D0wlLJCouY/A5lw4TbVfS/laYI7C4m0c5O4hGUgl
 Rgav5G+qCKBp5M0Esk5ZY/E/yyjgywU2buULHfXHCzLxK8Ky+ZFEHNEFoGlL4mPOo4Pg
 Ot/w==
X-Gm-Message-State: AOAM533Z2z5OeEgZcdU33vyrB2q7dZqhk9WXFQyaEDqKKphc+E4sALAH
 jCx5cDdjnlr0bu5mIgTgNlzFeWV+ZUaKSg==
X-Google-Smtp-Source: ABdhPJxBMvmvucd9AETLyq68+hbUUHyh9Y6Gwmmz+VGEken8dX/pN2vYsdfVWmpYq2piwwYcHJDNnw==
X-Received: by 2002:a67:804e:: with SMTP id b75mr3590588vsd.138.1598804536070; 
 Sun, 30 Aug 2020 09:22:16 -0700 (PDT)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com.
 [209.85.217.53])
 by smtp.gmail.com with ESMTPSA id l11sm1013104vka.24.2020.08.30.09.22.14
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 30 Aug 2020 09:22:15 -0700 (PDT)
Received: by mail-vs1-f53.google.com with SMTP id v138so2054264vsv.7
 for <alsa-devel@alsa-project.org>; Sun, 30 Aug 2020 09:22:14 -0700 (PDT)
X-Received: by 2002:a67:1c86:: with SMTP id c128mr3728071vsc.219.1598804534454; 
 Sun, 30 Aug 2020 09:22:14 -0700 (PDT)
MIME-Version: 1.0
References: <20200828162005.1.I4f67f494c4f759b0e5c7f487e040dfdcf16e0876@changeid>
 <CAFv8NwL-s0c_nFWKHmBKgPVeLXwGWdgV+fUtw8MLBJw2D3ox1w@mail.gmail.com>
In-Reply-To: <CAFv8NwL-s0c_nFWKHmBKgPVeLXwGWdgV+fUtw8MLBJw2D3ox1w@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Sun, 30 Aug 2020 09:22:02 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WTUKfcoBdVhpWm1ULyh8PvJj1O8eDxHTG_EBUbkNj9xw@mail.gmail.com>
Message-ID: <CAD=FV=WTUKfcoBdVhpWm1ULyh8PvJj1O8eDxHTG_EBUbkNj9xw@mail.gmail.com>
Subject: Re: [PATCH] ASoC: rt5682: Prefer async probe
To: Cheng-yi Chiang <cychiang@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Cc: Oder Chiou <oder_chiou@realtek.com>,
 "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, linux-kernel <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>
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

Hi,

On Sun, Aug 30, 2020 at 4:05 AM Cheng-yi Chiang <cychiang@chromium.org> wrote:
>
> > @@ -294,6 +294,7 @@ static struct i2c_driver rt5682_i2c_driver = {
> >                 .name = "rt5682",
> >                 .of_match_table = rt5682_of_match,
> >                 .acpi_match_table = rt5682_acpi_match,
> > +               .probe_type = PROBE_PREFER_ASYNCHRONOUS,
>
>
> One thing I am wondering is that there has not been any usage in codec
> driver for this.
> I think every codec driver can use this, and take the benefit of a
> possible faster boot time ?

One possibility is that they are all enabled as modules instead of
builtin to the kernel so nobody ever thought to do it.  Modules are
always probed asynchronously, so this flag is basically a no-op there
(and, in fact, for anything that can be built as a module we have even
more certainty that async probe is safe).

In the case of the Chrome OS 5.4 tree it's possible this driver should
be moved to a module.  However, even if we do that my patch is still
fine and would be helpful if anyone has a reason to build this driver
in.  Similar patches could likely be made to other codecs and would
similarly speed up boots in cases where codecs were builtin.

-Doug
