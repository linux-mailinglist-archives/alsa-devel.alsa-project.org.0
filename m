Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E56D76AA91
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Jul 2019 16:24:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 804581679;
	Tue, 16 Jul 2019 16:23:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 804581679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563287077;
	bh=tuQ6b5mQSihVb+FrjhdfjKZw37sZjHL1nyrhbUluFVQ=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ckCK+x5xLaTjUEqeg7NFwGUIZ+rhfG9eiFRW9K0yxR8vckUPgPtfYSIL1nMV1s9Oe
	 AfGypL2xJJ8/6XICInq0SS3uNok7Xy8f0XeWASAqB9Ir6c82bgLF6SjJRTwvK+q9Nf
	 d+il7YJdsCOwYaESJIAJrAJLDbmC0BH8q38r1mBs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A58B1F803F3;
	Tue, 16 Jul 2019 16:22:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DED31F80376; Tue, 16 Jul 2019 16:18:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
 DKIM_INVALID,DKIM_SIGNED,ENV_AND_HDR_SPF_MATCH,NML_ADSP_CUSTOM_MED,
 SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_SPF_WL autolearn=disabled version=3.4.0
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EE77DF800C6
 for <alsa-devel@alsa-project.org>; Tue, 16 Jul 2019 16:16:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EE77DF800C6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="qYBVXqle"
Received: by mail-ot1-x343.google.com with SMTP id h59so17333246otb.10
 for <alsa-devel@alsa-project.org>; Tue, 16 Jul 2019 07:16:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jVq/zyKNmBTqyWzD5MQLwwT+e3xMbKqpQWodHdoZ+Mk=;
 b=qYBVXqle+7vCUqLEVGwc67lXP5F/twwhlFE5Z3mnLHfQaL3woXgBZgCVi92TBDhjeJ
 2xYZtFtWIO5evm6dUtiAoTEGoDOsm7fC7AJucP0UX9gFrIopG668rPCYstFNF/deP0NO
 Yow3WDYPuKUXWR6NI8bIKWpEgK5Io9YYvt0wF0VNxQOMp4A/Yvrc6EGJuKBoAyR7WEFk
 BKTpMnxxGFDKUSaSEHeIdUeyft5UdLs/UKvUocHQGm9LDJsZL1rqSQe42AuAX+b4dBhv
 mjMEEk6vcD90usHttnGty2wR67IuGbimfqxxuyyfVqldMtrUTdVGUz7HAU4v4CZXe41f
 chrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jVq/zyKNmBTqyWzD5MQLwwT+e3xMbKqpQWodHdoZ+Mk=;
 b=GRFl0UV+bolKtoOd87G2YSu5zm+Wn+GDasa94nS+c1saEbFrr05L+y+9GMEcXc28ob
 KowxBl7XwpU6yEUnZb70pK2Tmd1VIOWHbNNfEIOEbW4igjoqgWcgcov00QCBNW3z/qgf
 9Ak32cwGz7zzbi3CVqtlPOjBlr/+Wy3uuRAdyvK6JTtN63AWkgb1vffzN8uVX+EMngYR
 KJ5LJtQ0gioVeSMLE7hSi83KPY9cZX17HzWqlIJQd3LSoa5mxzY55JJsmeRjTdbjcws3
 ZrUPMsgaQagUkEHIeuMB9vr6ddGehqWRlPe80bWvVU9NSbMI1LkBh+g2DndwlIROin9i
 7UlA==
X-Gm-Message-State: APjAAAVuCJHf5N738Dwqk+/6+Y7gDk/F9+h4Xr9yobWreO4VA6gNch78
 p3EbZffRfJLT78cfsSHx98kv0p2Q8MumYLALfywUNg==
X-Google-Smtp-Source: APXvYqwN9uylP2hsCV6+LMaCJG6qvXFU449tm2O5OEbnNN4gNeP8+80YgzfQ+LB6vAKflWj5X25PTd+HkjgUEvFFruA=
X-Received: by 2002:a05:6830:1cd:: with SMTP id
 r13mr12627965ota.99.1563286603085; 
 Tue, 16 Jul 2019 07:16:43 -0700 (PDT)
MIME-Version: 1.0
References: <20190716115725.66558-1-cychiang@chromium.org>
 <20190716115725.66558-6-cychiang@chromium.org>
In-Reply-To: <20190716115725.66558-6-cychiang@chromium.org>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Tue, 16 Jul 2019 22:16:32 +0800
Message-ID: <CA+Px+wXK9gJKZwzsG8BXh1gmoEyscxtMzB_VCrHz-nenBEL9AQ@mail.gmail.com>
To: Cheng-Yi Chiang <cychiang@chromium.org>
Cc: ALSA development <alsa-devel@alsa-project.org>,
 Douglas Anderson <dianders@chromium.org>, Heiko Stuebner <heiko@sntech.de>,
 Liam Girdwood <lgirdwood@gmail.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Takashi Iwai <tiwai@suse.com>,
 tzungbi@chromium.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Hans Verkuil <hverkuil@xs4all.nl>, Andrzej Hajda <a.hajda@samsung.com>,
 Russell King <rmk+kernel@armlinux.org.uk>, Mark Brown <broonie@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel@ffwll.ch>, linux-rockchip@lists.infradead.org,
 dgreid@chromium.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [alsa-devel] [PATCH v4 5/5] ASoC: rockchip_max98090: Add HDMI
	jack support
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

On Tue, Jul 16, 2019 at 7:58 PM Cheng-Yi Chiang <cychiang@chromium.org> wrote:
>
> diff --git a/sound/soc/rockchip/rockchip_max98090.c b/sound/soc/rockchip/rockchip_max98090.c
> index c82948e383da..c81c4acda917 100644
> --- a/sound/soc/rockchip/rockchip_max98090.c
> +++ b/sound/soc/rockchip/rockchip_max98090.c
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
In the patch, you should select SND_SOC_HDMI_CODEC, because the patch
uses hdmi_codec_set_jack_detect which depends on hdmi-codec.c.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
