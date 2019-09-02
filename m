Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 21217A4D40
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Sep 2019 04:09:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 93FCF1690;
	Mon,  2 Sep 2019 04:08:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 93FCF1690
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567390155;
	bh=bb617jMrZcTdeJuNhy9kbUdlRGqwUxA0HzWlSkSgM4o=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Xwc8wFAEl5vVfmcBjh4RCDCDvqnSm/rYzUl6/TVaNy5wfc8eN79JZJXHysMzKGil2
	 ip5f8WCMpm53FZBfiG/yDj3S5vlZguxnXv9EiUPDRk+jcXfLfPmuPQEOFmn58yXo6i
	 ciS1/y+d3xGKiTM2U1OGyrTwR96Swzmj4Up1ZC04=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DA794F80392;
	Mon,  2 Sep 2019 04:07:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 491E6F80394; Mon,  2 Sep 2019 04:07:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID, DKIM_VALID_AU, HEADER_FROM_DIFFERENT_DOMAINS, SPF_HELO_NONE,
 SPF_PASS, 
 URIBL_BLOCKED,USER_IN_DEF_SPF_WL autolearn=disabled version=3.4.0
Received: from mail-vs1-xe44.google.com (mail-vs1-xe44.google.com
 [IPv6:2607:f8b0:4864:20::e44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 76F57F8011E
 for <alsa-devel@alsa-project.org>; Mon,  2 Sep 2019 04:07:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 76F57F8011E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="lPR+RAf4"
Received: by mail-vs1-xe44.google.com with SMTP id b187so8257890vsc.9
 for <alsa-devel@alsa-project.org>; Sun, 01 Sep 2019 19:07:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SteZi7Jc1Qj/ZWEovebsg0xMt+f3c5vmQftu053JsS8=;
 b=lPR+RAf4lLbHFKrG7BKbpxKO2o5PIV6QPEk5yeLJsGuOupELQ4EX6PQ2n7tlyefFjX
 5TueBZwuZlQptLjVpdiWoRTQzixxBywwaHL2Q/9NxpVlWZua4yL5HvNYQaptM2F6I5gj
 urBmtznxWX5SXt9UN7RdKLsmNWsgswpCy+GTA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SteZi7Jc1Qj/ZWEovebsg0xMt+f3c5vmQftu053JsS8=;
 b=MsyLT1GioiV0A66d6fDjHp0Sk3d46wmQVgdf/2lXroa+p/9gHoA9qlWy7HlrDQDTbh
 0EdnoZi8WkEFmC77tUZvDalgAhIKtjuLkURQn3DhqSVArErfTrCjDND6AeoDFkvF/0uz
 FLcBxWJaynh7hJ1VheuqU/sEvTumYHV3L0aREPTxaFshNPYow4RrLZ4CHjh0l6KudDxm
 4TuSGPPRNa153Vjpv5/IKQY41tcECpx6/utoLcJQI4VRSSoya+FV1t+c167VfwLcVC7R
 X4yqw04XFvccCcY12CSUd6l65vYwaHn1RObUtX0JjpZ1273z3lNOSucKt8l79JBFMS+a
 bckg==
X-Gm-Message-State: APjAAAUZ9PPNp/uPBKWId+0rw6S2Y4Lc7j7wwibDnpBB/QV3PPRw3qEt
 g0vvrCjfnsSxbEZekCADbytwdVF+TOOkQ6klLiEblw==
X-Google-Smtp-Source: APXvYqygVljSvGbaEG8FKuJz0otOZOZdwZTpv0TbVOTes8YfHOyxR97RLOewIUCIM3Ih7DIGVB5YrjsGpPU2Agxjvyo=
X-Received: by 2002:a67:de08:: with SMTP id q8mr4571764vsk.119.1567390042918; 
 Sun, 01 Sep 2019 19:07:22 -0700 (PDT)
MIME-Version: 1.0
References: <20190829042957.150929-1-cychiang@chromium.org>
 <HE1PR06MB4011FA45247F186BB83DFF04ACBF0@HE1PR06MB4011.eurprd06.prod.outlook.com>
In-Reply-To: <HE1PR06MB4011FA45247F186BB83DFF04ACBF0@HE1PR06MB4011.eurprd06.prod.outlook.com>
From: Cheng-yi Chiang <cychiang@chromium.org>
Date: Mon, 2 Sep 2019 10:06:55 +0800
Message-ID: <CAFv8NwLq-cJqj0MB=rzKuqr3g0n3Y-nHor4w8ntiFXytoHpdLw@mail.gmail.com>
To: Jonas Karlman <jonas@kwiboo.se>
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "tzungbi@chromium.org" <tzungbi@chromium.org>,
 "kuninori.morimoto.gx@renesas.com" <kuninori.morimoto.gx@renesas.com>,
 "zhengxing@rock-chips.com" <zhengxing@rock-chips.com>,
 "cain.cai@rock-chips.com" <cain.cai@rock-chips.com>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "jeffy.chen@rock-chips.com" <jeffy.chen@rock-chips.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "dianders@chromium.org" <dianders@chromium.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 "a.hajda@samsung.com" <a.hajda@samsung.com>,
 "eddie.cai@rock-chips.com" <eddie.cai@rock-chips.com>,
 "Laurent.pinchart@ideasonboard.com" <Laurent.pinchart@ideasonboard.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "enric.balletbo@collabora.com" <enric.balletbo@collabora.com>,
 "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>,
 "dgreid@chromium.org" <dgreid@chromium.org>,
 "sam@ravnborg.org" <sam@ravnborg.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [alsa-devel] [PATCH] drm: dw-hdmi-i2s: enable audio clock in
	audio_startup
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

On Sun, Sep 1, 2019 at 6:04 PM Jonas Karlman <jonas@kwiboo.se> wrote:
>
> On 2019-08-29 06:29, Cheng-Yi Chiang wrote:
> > In the designware databook, the sequence of enabling audio clock and
> > setting format is not clearly specified.
> > Currently, audio clock is enabled in the end of hw_param ops after
> > setting format.
> >
> > On some monitors, there is a possibility that audio does not come out.
> > Fix this by enabling audio clock in audio_startup ops
> > before hw_param ops setting format.
> >
> > Signed-off-by: Cheng-Yi Chiang <cychiang@chromium.org>
> > ---
> >  drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c
> > index 5cbb71a866d5..08b4adbb1ddc 100644
> > --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c
> > +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c
> > @@ -69,6 +69,14 @@ static int dw_hdmi_i2s_hw_params(struct device *dev, void *data,
> >       hdmi_write(audio, conf0, HDMI_AUD_CONF0);
> >       hdmi_write(audio, conf1, HDMI_AUD_CONF1);
> >
> > +     return 0;
> > +}
> > +
> > +static int dw_hdmi_i2s_audio_startup(struct device *dev, void *data)
> > +{
> > +     struct dw_hdmi_i2s_audio_data *audio = data;
> > +     struct dw_hdmi *hdmi = audio->hdmi;
> > +
> >       dw_hdmi_audio_enable(hdmi);
> >
> >       return 0;
> > @@ -105,6 +113,7 @@ static int dw_hdmi_i2s_get_dai_id(struct snd_soc_component *component,
> >  }
> >
> >  static struct hdmi_codec_ops dw_hdmi_i2s_ops = {
> > +     .audio_startup = dw_hdmi_i2s_audio_startup,
>
> A small white space nit, there should be a tab and not space to align the equal sign above.

ACK. Will fix in v2.
>
> Also this patch do not cleanly apply to drm-misc-next or linux-next after
> fc1ca6e01d0a "drm/bridge: dw-hdmi-i2s: add .get_eld support" was merged.

ACK. Will rebase in v2.
>
>
>
>
> This patch does fix an issue I have observed on my Rockchip devices where audio would not always
> came out after switching between audio streams having different rate and channels parameters.
> I used to carry [1] to fix that issue, but this seems like a more sane fix.
>
> [1] https://github.com/Kwiboo/linux-rockchip/commit/4862e4044532b8b480fa3a0faddc197586623808
>
> With above fixed,
>
> Reviewed-by: Jonas Karlman <jonas@kwiboo.se>


Thanks a lot!

>
>
> Regards,
> Jonas
>
> >       .hw_params      = dw_hdmi_i2s_hw_params,
> >       .audio_shutdown = dw_hdmi_i2s_audio_shutdown,
> >       .get_dai_id     = dw_hdmi_i2s_get_dai_id,
>
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
