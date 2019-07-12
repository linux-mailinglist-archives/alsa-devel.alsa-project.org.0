Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A2CD66AFB
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Jul 2019 12:40:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F2593166C;
	Fri, 12 Jul 2019 12:39:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F2593166C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562928033;
	bh=yO82OWuvqa/tmyr8DzsPGgCeo7KXxM6FhVlfP0cHPig=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lfJLp+7z3S9dLZ+mHh7j+HpgcS2D4jp0BH5MSpxW08G5Bxqy8cVLG3RArcV7XSB0Q
	 3vmLghyi16oVO/UGIbgL9xojzPbXEBDahbOhHa2tG3K+9JPz7PzhUPDdy+iYGcAUdC
	 8yGv775D7WZkMfha3ocoWP1JgrlpOhvB68E2Eh4c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 45341F802A2;
	Fri, 12 Jul 2019 12:38:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 862C9F802A0; Fri, 12 Jul 2019 12:38:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,PDS_NO_HELO_DNS,
 RCVD_IN_DNSWL_BLOCKED, SPF_HELO_NONE, SPF_PASS, URIBL_BLOCKED,
 USER_IN_DEF_SPF_WL autolearn=disabled version=3.4.0
Received: from mail-ua1-x943.google.com (mail-ua1-x943.google.com
 [IPv6:2607:f8b0:4864:20::943])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5C636F800D8
 for <alsa-devel@alsa-project.org>; Fri, 12 Jul 2019 12:38:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5C636F800D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="ZZWCRPdC"
Received: by mail-ua1-x943.google.com with SMTP id s4so3811736uad.7
 for <alsa-devel@alsa-project.org>; Fri, 12 Jul 2019 03:38:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NFlnVgtsH1wq+XzR7Jf0TraeqzPpP2anw1H9Vmw2tvM=;
 b=ZZWCRPdCfXzrnVtRzZdwa1ITRmB3qxf5geOYMDfWQUsSK85+lC95yAWwXfIWtojj3Z
 +U5nZwLyKEoHiF/KfrDvTV3RQwC3bWT6oq5DVauijG88SJsDnIFShBwLwjLw75Qqi3Pw
 uvgV0slD6iFweegv0PnpZ9YeoJUKQTa3aoJqg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NFlnVgtsH1wq+XzR7Jf0TraeqzPpP2anw1H9Vmw2tvM=;
 b=qbdFVyhJxiH20qsx7dZLrdVHSTE5RENM2n7OLQJ6jyFccyWF29bioLYH92bbPg99yx
 RlsABxPw6ijSwnD2jUgjE9agGWa1XomLS6FAwiiouonOH39rOHkcWJVHRRTDWAWdrdUs
 /fW1jwYuVQl5WR+PnAxdL8VtKqRxqM3YNtbcGY/cnFsvXzC7A2GSdy2OPL4o+3ryNfVK
 FQW0zwY24XkuQ7sIhwcBps261jsoPE+IhdDAKFk3zUXI0d5T7cbjIKJuCCNZLbKZZ5Tv
 J6x9u2Mzww58NVGibvbe7PH6n0ZSUmIr33HwVaJQYSL3rka6mc+zNjil9XEQpsAeXfT9
 ttLg==
X-Gm-Message-State: APjAAAVPCjUJo07wAYfZN2AjIzodQk1anB08SRuS2qTmQETSVDyPIUSM
 pRgOCCqmsjYEevTjx/le3QY2wFlw7GMBgaO/nnE/9Q==
X-Google-Smtp-Source: APXvYqwr8ViLkFyuDpuZsdv+4CeIPeQhpf+eg0vAcxLw4Fe8TNWMbS82tIBGOSDng7L1p4Sa5VlGPV5eMJFqWsRho94=
X-Received: by 2002:a9f:3605:: with SMTP id r5mr8414289uad.131.1562927921086; 
 Fri, 12 Jul 2019 03:38:41 -0700 (PDT)
MIME-Version: 1.0
References: <20190712100443.221322-1-cychiang@chromium.org>
 <20190712100443.221322-6-cychiang@chromium.org>
In-Reply-To: <20190712100443.221322-6-cychiang@chromium.org>
From: Cheng-yi Chiang <cychiang@chromium.org>
Date: Fri, 12 Jul 2019 18:38:14 +0800
Message-ID: <CAFv8NwKOhAz4B1da5MarXkVfavya6AYsvURa1Tq4LW=_nyZjiw@mail.gmail.com>
To: linux-kernel <linux-kernel@vger.kernel.org>
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, Doug Anderson <dianders@chromium.org>,
 Heiko Stuebner <heiko@sntech.de>, linux-rockchip@lists.infradead.org,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 tzungbi@chromium.org, Hans Verkuil <hverkuil@xs4all.nl>,
 Andrzej Hajda <a.hajda@samsung.com>, Russell King <rmk+kernel@armlinux.org.uk>,
 Mark Brown <broonie@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel@ffwll.ch>, Dylan Reid <dgreid@chromium.org>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [alsa-devel] [PATCH v3 5/5] FROMLIST: ASoC: rockchip_max98090:
	Add HDMI jack support
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

On Fri, Jul 12, 2019 at 6:06 PM Cheng-Yi Chiang <cychiang@chromium.org> wrote:
>
> In machine driver, create a jack and let hdmi-codec report jack status.
>
> Signed-off-by: Cheng-Yi Chiang <cychiang@chromium.org>
> ---
>  sound/soc/rockchip/rockchip_max98090.c | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>
> diff --git a/sound/soc/rockchip/rockchip_max98090.c b/sound/soc/rockchip/rockchip_max98090.c
> index c82948e383da..c81c4acda917 100644
> --- a/sound/soc/rockchip/rockchip_max98090.c
> +++ b/sound/soc/rockchip/rockchip_max98090.c
> @@ -134,6 +134,25 @@ enum {
>         DAILINK_HDMI,
>  };
>
> +static struct snd_soc_jack rk_hdmi_jack;
> +
> +static int rk_hdmi_init(struct snd_soc_pcm_runtime *runtime)
> +{
> +       struct snd_soc_card *card = runtime->card;
> +       struct snd_soc_component *component = runtime->codec_dai->component;
> +       int ret;
> +
> +       /* enable jack detection */
> +       ret = snd_soc_card_jack_new(card, "HDMI Jack", SND_JACK_LINEOUT,
> +                                   &rk_hdmi_jack, NULL, 0);
> +       if (ret) {
> +               dev_err(card->dev, "Can't new HDMI Jack %d\n", ret);
> +               return ret;
> +       }
> +
> +       return hdmi_codec_set_jack_detect(component, &rk_hdmi_jack);
> +}
> +
>  /* max98090 and HDMI codec dai_link */
>  static struct snd_soc_dai_link rk_dailinks[] = {
>         [DAILINK_MAX98090] = {
> @@ -151,6 +170,7 @@ static struct snd_soc_dai_link rk_dailinks[] = {
>                 .ops = &rk_aif1_ops,
>                 .dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF |
>                         SND_SOC_DAIFMT_CBS_CFS,
> +               .init = rk_hdmi_init,
>                 SND_SOC_DAILINK_REG(hdmi),
>         }
>  };
> --
> 2.22.0.510.g264f2c817a-goog
>

Sorry for the wrong title.
I forgot to remove FROMLIST in the title.
I'll wait for comments on other patches and fix the title in v4.
Thanks!
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
