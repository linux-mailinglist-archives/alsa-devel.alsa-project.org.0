Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A567F160F15
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Feb 2020 10:46:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0AE9B1612;
	Mon, 17 Feb 2020 10:45:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0AE9B1612
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581932796;
	bh=8rVID9Qja/pUmEQr94pBhDDbiP/4cNrrK0ErBJyxyyg=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=n3qLN1DpWNVp8BdBkYAkWir2W0H1rtssuXLVlFRzodr036K4zUHcK3ctbeAPm0M1C
	 RfPa3X1BfjZSRkddGrWO3wTjkuWX2cpy9xR3RnJ/99Bu/QLOzijzY9nMEfARRUhQ1r
	 HsTrPs2/EwzF/d9nobRPzMN0/YmM0PL7B9w+wRdI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 12906F800B6;
	Mon, 17 Feb 2020 10:44:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1D130F80172; Mon, 17 Feb 2020 10:44:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 PRX_BODY_26,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
 [209.85.208.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CCAADF800B6
 for <alsa-devel@alsa-project.org>; Mon, 17 Feb 2020 10:44:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CCAADF800B6
Received: by mail-ed1-f67.google.com with SMTP id r21so19951741edq.0
 for <alsa-devel@alsa-project.org>; Mon, 17 Feb 2020 01:44:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=z5Mm0UcTlrataEbH992JlC3fdkxaoZqbYWxeVKMRIWw=;
 b=IKodENxDizjmR3L+fsaFsMH6TlPs6atx8IFVp9tMD7tOIIAo+kVIl3a9R4DiYyQNej
 UBc0lB7j4Mj9IE4ayQmu/OioWBpQmlIhu+w83lynAdzfk+kLTxk77gliHFBtNp73G0tP
 doQP/kJFUx8WqYyMI9CmBKm0RQ5ALwLoAscmcxxnwyun39/TdtzcXaxzZd6zmrYhx3Rk
 9dieRRrrmyKJ059C3V8mdIHchhZnb8lQ3duQAko1E+9vdoLqpR1vbxgmbavV7Fu9M1w9
 yhkySqhUMsmiuA2dlgopmPNqbl1TQt4xzgCg0BcuASM6uir7f4vJY4QPHzMgiluCgQmc
 7y+A==
X-Gm-Message-State: APjAAAXbZB/qJ4PaNf8Kjuh6h/3G2jvH7Zp9qQaEAth3ji4jNW9RdFgK
 MhUzHTaT54gvpR3ki8MPT0yUV+xSH80=
X-Google-Smtp-Source: APXvYqwreAC9yi92jzzRVyl8tidZnWlCmXHHSsRSQyT/e1NhEDwgcYZxoOfhXIYq92KEb1ZO68xwEw==
X-Received: by 2002:a17:906:eceb:: with SMTP id
 qt11mr13646362ejb.119.1581932687948; 
 Mon, 17 Feb 2020 01:44:47 -0800 (PST)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com.
 [209.85.128.53])
 by smtp.gmail.com with ESMTPSA id e22sm477550edq.75.2020.02.17.01.44.47
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Feb 2020 01:44:47 -0800 (PST)
Received: by mail-wm1-f53.google.com with SMTP id t23so16417884wmi.1
 for <alsa-devel@alsa-project.org>; Mon, 17 Feb 2020 01:44:47 -0800 (PST)
X-Received: by 2002:a05:600c:34d:: with SMTP id
 u13mr21930702wmd.77.1581932686942; 
 Mon, 17 Feb 2020 01:44:46 -0800 (PST)
MIME-Version: 1.0
References: <20200217064250.15516-1-samuel@sholland.org>
 <20200217091423.y2muniz3hosquho6@gilmour.lan>
In-Reply-To: <20200217091423.y2muniz3hosquho6@gilmour.lan>
From: Chen-Yu Tsai <wens@csie.org>
Date: Mon, 17 Feb 2020 17:44:36 +0800
X-Gmail-Original-Message-ID: <CAGb2v65GuwLdJ3Rkt1cyU6EroWZ6pim7-sGry5jYBoi=mubpUg@mail.gmail.com>
Message-ID: <CAGb2v65GuwLdJ3Rkt1cyU6EroWZ6pim7-sGry5jYBoi=mubpUg@mail.gmail.com>
To: Maxime Ripard <maxime@cerno.tech>
Cc: Mark Rutland <mark.rutland@arm.com>,
 devicetree <devicetree@vger.kernel.org>,
 Linux-ALSA <alsa-devel@alsa-project.org>, Samuel Holland <samuel@sholland.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Vasily Khoruzhick <anarsoul@gmail.com>, Mark Brown <broonie@kernel.org>,
 =?UTF-8?Q?Myl=C3=A8ne_Josserand?= <mylene.josserand@free-electrons.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: Re: [alsa-devel] [RFC PATCH 00/34] sun8i-codec fixes and new
	features
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

On Mon, Feb 17, 2020 at 5:14 PM Maxime Ripard <maxime@cerno.tech> wrote:
>
> Hi,
>
> On Mon, Feb 17, 2020 at 12:42:16AM -0600, Samuel Holland wrote:
> > The sun8i-codec driver, as used in the Allwinner A33 and A64, currently
> > only exposes a small subset of the available hardware features. In order
> > to use the A64 in a smartphone (the PinePhone), I've added the necessary
> > functionality to the driver:
> >   * The full set of supported DAI format options
> >   * Support for AIF2 and AIF3
> >   * Additional routing knobs
> >   * Additional volume controls
> >
> > Unfortunately, due to preexisting issues with the driver, there are some
> > breaking changes, as explained further in the commit messages:
> >   * The LRCK inversion issue means we need a new compatible for the A64.
> >   * Some controls are named inaccurately, so they are renamed.
> >   * Likewise, the DAPM widgets used in device trees were either named
> >     wrong, or the device trees were using the wrong widgets in the first
> >     place. (Specifically, the links between the analog codec and digital
> >     codec happen at the ADC and DAC, not AIF1.)
> >
> > I tended to take the philosophy of "while I'm breaking things, I might
> > as well do them right", so I've probably made a few more changes than
> > absolutely necessary. I'm not sure about where all of the policy
> > boundaries are, about how far I should go to maintain compatibility. For
> > example, for the DT widget usage, I could:
> >   * Rename everything and update the DTS files (which is what I did)
> >   * Keep the old (misleading/wrong) name for the widgets, but repurpose
> >     them to work correctly
> >       (i.e. "ADC Left" would be named "AIF1 Slot 0 Left ADC", but it
> >        would work just like "ADC Left" does in this patchset)
> >   * Keep the old widgets around as a compatibility layer, but add new
> >     widgets and update the in-tree DTS files to use them
> >       (i.e. "ADC Left" would have a path from "AIF1 Slot 0 Left ADC",
> >        but "AIF1 Slot 0 Left ADC" would be a no-op widget)
> >   * Something else entirely
>
> I'm not sure this is really a concern here. We need to maintain the
> compatibility with old DT's, but those will have an A33 compatible
> too, and as far as I can see, you're not changing anything for that
> compatible, so we're in the clear?
>
> If not, then the third option would probably be the best, especially
> since it's only a couple of them.

Unfortunately the description for both chips are shared, and they're wrong.
So we probably need a new compatible (or a new driver)... or like options
2 or 3, keep the DT visible endpoints (but deprecate them), and route them
to a new set of proper widgets.

ChenYu
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
