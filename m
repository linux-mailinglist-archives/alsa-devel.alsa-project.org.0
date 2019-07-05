Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DE1B660146
	for <lists+alsa-devel@lfdr.de>; Fri,  5 Jul 2019 09:10:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 56A0D169F;
	Fri,  5 Jul 2019 09:09:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 56A0D169F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562310641;
	bh=E8OoQZe+L7ED/EFxe/ZDPRwHGqzaJqI+rPR4KqVhejk=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iHA8R5rXqS80uwbQ3/tpqT+N8ddcqXnt8R43oRi8bAkKun9yzx8LObxAHLY8b4V8o
	 fj1MeZxY0tjO7AJR12qyBvRPwAIlW4pX80vIlLUBiNH7KqMhgmNv3hQLxFqhx1Waue
	 OXjBgG01wlaglCXgEIeOKdNcJlalC0HZvGy3tUxk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9C40FF8011F;
	Fri,  5 Jul 2019 09:08:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E3610F8011F; Fri,  5 Jul 2019 09:08:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,SPF_HELO_NONE,SPF_PASS,
 T_PDS_NO_HELO_DNS,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
 autolearn=disabled version=3.4.0
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 419A0F800E7
 for <alsa-devel@alsa-project.org>; Fri,  5 Jul 2019 09:08:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 419A0F800E7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="gh/Toz6V"
Received: by mail-ot1-x343.google.com with SMTP id r21so3406603otq.6
 for <alsa-devel@alsa-project.org>; Fri, 05 Jul 2019 00:08:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0IIqKWzRaNse3XXjc9VJC174hdKsP3di+1IIb5DajLs=;
 b=gh/Toz6V7CixdKGLGkGy9rPXkrdYpbSEI9toJWHRYaf4kHmQ/0QfMBxGBHsJtDl9i9
 ZwjZg2XdbTSBvk5L41Rc7GwtWbT43JorS2dYawqFZq0UF8xiHjUn30KcpEdiKuzYv91k
 2BB6vbDpC26WiSr5OAiV+1AjkluoSR+vFoFQMvBNdGLTUnZXsqoqP7zX8GOOFaR7IoFU
 P+hfc0NAZuTMJOgudDmWkfHCqRRGjxoW92AgSBMRCJlCTYcgBMm4iLSXUKDrvBhMNGUj
 kOa6/YuH0gC2IBEeHA1yriXC0QfOWUIpElqf+l3HO/EvIv3/ubknXhnXBQU+SJadHsUV
 kP2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0IIqKWzRaNse3XXjc9VJC174hdKsP3di+1IIb5DajLs=;
 b=uWfMJNoIX1C4DhceJSBgiLl16Zfx0+xPJZ++/vtpJrfp2I/SMjB0y22kq7Biuu5qXZ
 IfKFfrgqKXd1GFB+nzlOChFf6hQQRajjwn3/unhVb2kEc8/gkKrV9cc09sNrngOkkpMm
 6FXIGRlVdRiCq3beJ5Ide/L/JQfg+DNJbaCNMWTkSDgu2bLlsIjK0UqwM6lh+F29L5aB
 YM/J4Xf6q9ULQN4vR187FUYCGfT3hsVlOeOz8/DMgbANhrOAC9XaA51+A9Iim2Ou+zj4
 NSf9Jwdffn8JgG6jN6FVHkIff2w0bqvvsXuorwM6VnAgjaL2Kl4vfWtfr1xWRmkIUbsQ
 9lpg==
X-Gm-Message-State: APjAAAXMfLxpfQ9Lku6SqfbTUUa1fTzHfxnY9QSetuw9S5ASmHhrSQeo
 3sUiwB3emPCsCZ1Q6918wtp/ry0evWZ/9U509hsq5A==
X-Google-Smtp-Source: APXvYqzldGMEKIRPPEJ0vaUfI2lFQ29kQgI2QwiHDaDqpSbGSw2Xx3CIMBQjB6qsF1gXZ8S1OcSQCm9TeiE6wueHYB4=
X-Received: by 2002:a9d:4f02:: with SMTP id d2mr1738812otl.328.1562310528818; 
 Fri, 05 Jul 2019 00:08:48 -0700 (PDT)
MIME-Version: 1.0
References: <20190705042623.129541-1-cychiang@chromium.org>
 <20190705042623.129541-2-cychiang@chromium.org>
In-Reply-To: <20190705042623.129541-2-cychiang@chromium.org>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Fri, 5 Jul 2019 15:08:37 +0800
Message-ID: <CA+Px+wXtmf9dQQP7ywPLp7Qbbvqau=WnO3qhZ8+qmbJD1gjx+A@mail.gmail.com>
To: Cheng-Yi Chiang <cychiang@chromium.org>
Cc: ALSA development <alsa-devel@alsa-project.org>, dianders@chromium.org,
 Heiko Stuebner <heiko@sntech.de>, Liam Girdwood <lgirdwood@gmail.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Takashi Iwai <tiwai@suse.com>, tzungbi@chromium.org,
 linux-kernel@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>,
 Andrzej Hajda <a.hajda@samsung.com>, Russell King <rmk+kernel@armlinux.org.uk>,
 Mark Brown <broonie@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel@ffwll.ch>, linux-rockchip@lists.infradead.org,
 dgreid@chromium.org, linux-arm-kernel@lists.infradead.org
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

On Fri, Jul 5, 2019 at 12:26 PM Cheng-Yi Chiang <cychiang@chromium.org> wrote:
> diff --git a/include/sound/hdmi-codec.h b/include/sound/hdmi-codec.h
> index 7fea496f1f34..26c02abb8eba 100644
> --- a/include/sound/hdmi-codec.h
> +++ b/include/sound/hdmi-codec.h
> @@ -47,6 +47,9 @@ struct hdmi_codec_params {
>         int channels;
>  };
>
> +typedef void (*hdmi_codec_plugged_cb)(struct platform_device *dev,
> +                                     bool plugged);
> +
The callback prototype is "weird" by struct platform_device.  Is it
possible to having snd_soc_component instead of platform_device?

>  struct hdmi_codec_pdata;
>  struct hdmi_codec_ops {
>         /*
> @@ -88,6 +91,13 @@ struct hdmi_codec_ops {
>          */
>         int (*get_dai_id)(struct snd_soc_component *comment,
>                           struct device_node *endpoint);
> +
> +       /*
> +        * Hook callback function to handle connector plug event.
> +        * Optional
> +        */
> +       int (*hook_plugged_cb)(struct device *dev, void *data,
> +                              hdmi_codec_plugged_cb fn);
>  };
The first parameter dev could be removed.  Not used.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
