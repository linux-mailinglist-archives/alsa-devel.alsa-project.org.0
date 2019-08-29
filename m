Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D195A2988
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Aug 2019 00:18:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A4AEB165F;
	Fri, 30 Aug 2019 00:17:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A4AEB165F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567117122;
	bh=/6KSDvGFY91DAl4HF2O+VCdBlkKpT+UoqLoH0CJeUTs=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LbgLXqSdmLbShpI6gsRidR4ftW3F0AA43tGYzdImVKBVH2O31lvI9r4ZxdXRcRGxy
	 yAkbhcMhwGQ0DaQtNPWFwR7I/iTxhtvGsNHbv18jyWMe1qUNGEy9my+E4gASFQbQu/
	 1NjMJ+xwf3KphrCNMlhjcJXltt2aTuPl9fZPfSQ4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 66EB2F80148;
	Fri, 30 Aug 2019 00:16:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 443D4F80148; Fri, 30 Aug 2019 00:16:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 66C63F800E7
 for <alsa-devel@alsa-project.org>; Fri, 30 Aug 2019 00:16:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 66C63F800E7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="Way9cSCI"
Received: by mail-io1-xd41.google.com with SMTP id z3so10216071iog.0
 for <alsa-devel@alsa-project.org>; Thu, 29 Aug 2019 15:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eiH72N61VDWmVxItzkF6zksnlwjwA2NHJACDtY2Xycg=;
 b=Way9cSCIYfArenznA8oYHlnHTJabAbfOvU8IBuvW3W6wFHlllPVoSIv2T/WNlJ0q6e
 SoUznNz9PMqM6gzVg33TP/25HbF7F99Rzcq7p8kxHA9bjWkVaWA3Kmw0x8gROWIYNNGo
 szQWao+/UlAj8ndbqomemYcpAzbSPosUn43N0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eiH72N61VDWmVxItzkF6zksnlwjwA2NHJACDtY2Xycg=;
 b=s1tCIWgnkVHfzH5d7Mv25lQZc7Al6Lr34aq4xIQ6CAyhvmMyRcoqm+QXc8PxBAZw39
 OBGbJMDUswL+9Q4v4ZIVIUujvlX+5qQa+hk0tKxt602MW+t9tq0cC4GrABTOAUyHbLvU
 36mMW7gi3g+Gx7K9jEmaFWVDvqcr0WPqp5VyhnWYTiQ3NG6d5YchAfBQqzqTr2pMe7sk
 B8uoyVW2VoHJBQuBjV8S8mbRjaFGdx7Qvr94wjI4YhaW5Uti0I5oEmgdO9+CU/MsrXyd
 yS25IXvDlYEgTJ3Q4ZN35SreB8KA6YJJf8Oxqdcl1VTX8BkuUI4qVZvlf7l3pbYiI+jE
 NgNw==
X-Gm-Message-State: APjAAAU3BnFjYnczrzE0nwWC2ebHPXhkxo5Qdd1dXjll6W2xmUgOQAJe
 HxnHxKwQO+eGHy7BAb8J5pK1rHW+18Y=
X-Google-Smtp-Source: APXvYqwDwqaR8DeGukQJZMi1ARvMZ59LLBJbEpf+eslGOb87R2WUF1o7ejF70vqdnoMSjFUuSbP3sQ==
X-Received: by 2002:a6b:cf0c:: with SMTP id o12mr1060736ioa.103.1567117010960; 
 Thu, 29 Aug 2019 15:16:50 -0700 (PDT)
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com.
 [209.85.166.48])
 by smtp.gmail.com with ESMTPSA id v12sm3554115ios.16.2019.08.29.15.16.49
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Aug 2019 15:16:49 -0700 (PDT)
Received: by mail-io1-f48.google.com with SMTP id u185so6306205iod.10
 for <alsa-devel@alsa-project.org>; Thu, 29 Aug 2019 15:16:49 -0700 (PDT)
X-Received: by 2002:a6b:d006:: with SMTP id x6mr13702031ioa.218.1567117008526; 
 Thu, 29 Aug 2019 15:16:48 -0700 (PDT)
MIME-Version: 1.0
References: <20190829042957.150929-1-cychiang@chromium.org>
In-Reply-To: <20190829042957.150929-1-cychiang@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 29 Aug 2019 15:16:36 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Xb_SkUTkVRpOX7B+B0AdT3cOB+JamNyXzq_UQK3mvz1A@mail.gmail.com>
Message-ID: <CAD=FV=Xb_SkUTkVRpOX7B+B0AdT3cOB+JamNyXzq_UQK3mvz1A@mail.gmail.com>
To: Cheng-Yi Chiang <cychiang@chromium.org>
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 tzungbi@chromium.org, =?UTF-8?B?6YOR5YW0?= <zhengxing@rock-chips.com>,
 kuninori.morimoto.gx@renesas.com, Andrzej Hajda <a.hajda@samsung.com>,
 David Airlie <airlied@linux.ie>,
 =?UTF-8?B?6ZmI5riQ6aOe?= <jeffy.chen@rock-chips.com>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 =?UTF-8?B?6JSh6Im65Lyf?= <cain.cai@rock-chips.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Eddie Cai <eddie.cai@rock-chips.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Dylan Reid <dgreid@chromium.org>, Sam Ravnborg <sam@ravnborg.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Jerome Brunet <jbrunet@baylibre.com>
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

Hi,

On Wed, Aug 28, 2019 at 9:30 PM Cheng-Yi Chiang <cychiang@chromium.org> wrote:
>
> In the designware databook, the sequence of enabling audio clock and
> setting format is not clearly specified.
> Currently, audio clock is enabled in the end of hw_param ops after
> setting format.
>
> On some monitors, there is a possibility that audio does not come out.
> Fix this by enabling audio clock in audio_startup ops
> before hw_param ops setting format.
>
> Signed-off-by: Cheng-Yi Chiang <cychiang@chromium.org>
> ---
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c
> index 5cbb71a866d5..08b4adbb1ddc 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c
> @@ -69,6 +69,14 @@ static int dw_hdmi_i2s_hw_params(struct device *dev, void *data,
>         hdmi_write(audio, conf0, HDMI_AUD_CONF0);
>         hdmi_write(audio, conf1, HDMI_AUD_CONF1);
>
> +       return 0;
> +}
> +
> +static int dw_hdmi_i2s_audio_startup(struct device *dev, void *data)
> +{
> +       struct dw_hdmi_i2s_audio_data *audio = data;
> +       struct dw_hdmi *hdmi = audio->hdmi;
> +
>         dw_hdmi_audio_enable(hdmi);
>
>         return 0;
> @@ -105,6 +113,7 @@ static int dw_hdmi_i2s_get_dai_id(struct snd_soc_component *component,
>  }
>
>  static struct hdmi_codec_ops dw_hdmi_i2s_ops = {
> +       .audio_startup = dw_hdmi_i2s_audio_startup,
>         .hw_params      = dw_hdmi_i2s_hw_params,
>         .audio_shutdown = dw_hdmi_i2s_audio_shutdown,
>         .get_dai_id     = dw_hdmi_i2s_get_dai_id,
> --

I am no expert on audio stuff, but this seems sane to me.  If you
happened to spin it for another reason, it might seem slightly nicer
to put the setting of ".audio_startup" adjacent to the setting of
".audio_shutdown" in the struct.

I have tested your patch on Chrome OS 4.19 and it definitely fixes the
problems I saw.  Chrome OS 4.19 is a little different than upstream
and I'm not setup to test HDMI audio directly on upstream, but I did
at least confirm that my problem _wasn't_ magically fixed by any of
these patches that I found upstream (I picked them into my tree and
still saw the problem):

fc1ca6e01d0a drm/bridge: dw-hdmi-i2s: add .get_eld support
43e88f670a5e drm/bridge: dw-hdmi-i2s: enable only the required i2s lanes
46cecde310bb drm/bridge: dw-hdmi-i2s: reset audio fifo before applying
new params
0c6098859176 drm/bridge: dw-hdmi-i2s: set the channel allocation
17a1e555b608 drm/bridge: dw-hdmi-i2s: enable lpcm multi channels
da5f5bc92f49 drm/bridge: dw-hdmi: set channel count in the infoframes
2a2a3d2ff799 drm/bridge: dw-hdmi: move audio channel setup out of ahb
8067f62bccaf drm/bridge: dw-hdmi-i2s: support more i2s format

Thus:

Reviewed-by: Douglas Anderson <dianders@chromium.org>
Tested-by: Douglas Anderson <dianders@chromium.org>

-Doug
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
