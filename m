Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ABA5C61A39
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Jul 2019 07:06:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2E1821671;
	Mon,  8 Jul 2019 07:05:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2E1821671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562562376;
	bh=VJru9IoT/8R4Ocmqd6gxk35wn1n2y+7w2p5dHvfH+fI=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tNOOzlo/B7N8oSFl20TVGZ16vmNj67jHx6ZmWC7C6EW9NrwMFcy0bh9lkMx3CK2ad
	 oPONP0Bx1hl+rml9K9jFNbT5uF7yOJgRd0Yt0FH+/iejSFJMmsQ1rhRS+Bjnrd9z7m
	 y5NGwRr2It7/x6Am/cNXOxYMEz4F8hRWNcqd6v9g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 45246F80269;
	Mon,  8 Jul 2019 07:04:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BF57BF80268; Mon,  8 Jul 2019 07:04:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,PDS_NO_HELO_DNS,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_IN_DEF_SPF_WL autolearn=disabled
 version=3.4.0
Received: from mail-vs1-xe42.google.com (mail-vs1-xe42.google.com
 [IPv6:2607:f8b0:4864:20::e42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E46C3F800E2
 for <alsa-devel@alsa-project.org>; Mon,  8 Jul 2019 07:04:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E46C3F800E2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="Kr9xgzIg"
Received: by mail-vs1-xe42.google.com with SMTP id k9so7362481vso.5
 for <alsa-devel@alsa-project.org>; Sun, 07 Jul 2019 22:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Div9/ExPBXeNPwe6gkanRSA20V8261vIipkTc2adVjM=;
 b=Kr9xgzIgvJODL4j4Tar0NRNKMTIXggQEPJlw7ZTjjNYm575FxLii/NRilTRRlb5wa9
 BWu/yi/4QHA/SF4dJDPdiho9Fx9QFL7y+FAMY/c8IVi1NMs8YVjKbGVOIrjJYJzX4EsW
 nPrzbFSUsGbfcqx1g1C4zlpLeDlnrse6Nv5Vg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Div9/ExPBXeNPwe6gkanRSA20V8261vIipkTc2adVjM=;
 b=omMMhT+Eye3HXNTrr75mPTGzo3rZrU6FIQUx7Si8YKZ23OxAFPF+9Gt722/Ip9f5hX
 wmhlVFBWbSqBkYB+ZfWJnbBpJngrwCBFaSloV2mkgfZv8pgCXPAyyi91aZjDlLWzHlMQ
 N+lX76p7jw8mMK72ReWWgNpwXGliWxCvUJwQEqMTYWfQULNx3KKC65rOjcBC1upqZRDu
 oHTzHUsYDVYLWsIOjJPdfbYm9m3dMh3/FfDHLaDrexI8AR29HW5jFHtw9lt+xPRJKGEt
 qGEQylbJbv34UxH2WSmc+ijT7RgH4DT3dIV6OjHqS1bI20UjJ+6UH0P9FZiupCr2zvde
 1xyg==
X-Gm-Message-State: APjAAAVlpguYz2dvg/9mAEhqkYjRCRgwGpf7rUXAf/fT43IQweFIEiTL
 pfmbhF7YaJ7TiyLJ0jhknomvOFFmC8fGuPeCI/e25w==
X-Google-Smtp-Source: APXvYqzKI5qNNsiRKRIHZBN2EiiQYggki+EnjIVPY+3PoX163CFHFiFOgVyx1S9hteBUIbxFauiJMzT56Q8PxxERB2o=
X-Received: by 2002:a67:f7cd:: with SMTP id a13mr6748465vsp.163.1562562261162; 
 Sun, 07 Jul 2019 22:04:21 -0700 (PDT)
MIME-Version: 1.0
References: <20190705042623.129541-1-cychiang@chromium.org>
 <20190705042623.129541-2-cychiang@chromium.org>
 <CA+Px+wXtmf9dQQP7ywPLp7Qbbvqau=WnO3qhZ8+qmbJD1gjx+A@mail.gmail.com>
 <20190705121240.GA20625@sirena.org.uk>
In-Reply-To: <20190705121240.GA20625@sirena.org.uk>
From: Cheng-yi Chiang <cychiang@chromium.org>
Date: Mon, 8 Jul 2019 13:03:53 +0800
Message-ID: <CAFv8NwLP-hUBW8FZW5kooaggeNRG7LAEd2pd_-70YBrVMY-+CQ@mail.gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: ALSA development <alsa-devel@alsa-project.org>,
 Doug Anderson <dianders@chromium.org>, Heiko Stuebner <heiko@sntech.de>,
 Liam Girdwood <lgirdwood@gmail.com>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Takashi Iwai <tiwai@suse.com>, tzungbi@chromium.org,
 Hans Verkuil <hverkuil@xs4all.nl>, Tzung-Bi Shih <tzungbi@google.com>,
 Russell King <rmk+kernel@armlinux.org.uk>, Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel@ffwll.ch>, linux-rockchip@lists.infradead.org,
 Dylan Reid <dgreid@chromium.org>, linux-arm-kernel@lists.infradead.org
Subject: Re: [alsa-devel] [PATCH 1/4] ASoC: hdmi-codec: Add an op to set
 callback function for plug event
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

On Fri, Jul 5, 2019 at 8:12 PM Mark Brown <broonie@kernel.org> wrote:
>
> On Fri, Jul 05, 2019 at 03:08:37PM +0800, Tzung-Bi Shih wrote:
> > On Fri, Jul 5, 2019 at 12:26 PM Cheng-Yi Chiang <cychiang@chromium.org> wrote:
>
> > > +typedef void (*hdmi_codec_plugged_cb)(struct platform_device *dev,
> > > +                                     bool plugged);
> > > +
>
> > The callback prototype is "weird" by struct platform_device.  Is it
> > possible to having snd_soc_component instead of platform_device?
>
> Or if it's got to be a device why not just a generic device so
> we're not tied to a particular bus here?

My intention was to invoke the call in dw-hdmi.c like this:

    hdmi->plugged_cb(hdmi->audio,
                                   result == connector_status_connected);

Here hdmi->audio is a platform_device.
I think dw-hdmi can not get  snd_soc_component easily.
I can use a generic device here so the ops is more general.
The calling will be like
    hdmi->plugged_cb(&hdmi->audio->dev,
                                   result == connector_status_connected);
I will update this in v2.
Thanks!
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
