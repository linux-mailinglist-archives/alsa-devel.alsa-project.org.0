Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 63A026BA2D
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Jul 2019 12:30:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A68F41683;
	Wed, 17 Jul 2019 12:29:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A68F41683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563359421;
	bh=T2DcnE8XM0xwglSrJ5XuTBE0cWVD/+8EyYl5nBBWabE=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ahUnmaIuh/t/at1jqFwiV89vtX52Zsf3mfg4RERsckcVACIcN+xFE74U0BcYPJlHM
	 QGKxJsB/LuWns3D2vhLnahsEApqv7/R3hrxrCRZS3sBfCg8wC8Z6Q9XsQo8LnsrP4a
	 JTHbBCDrl4nRA9fwGGceYK+e+ehxiRaWOjpOhw2Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C7135F80363;
	Wed, 17 Jul 2019 12:28:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 72565F80363; Wed, 17 Jul 2019 12:28:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled
 version=3.4.0
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com
 [IPv6:2607:f8b0:4864:20::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5D826F8015B
 for <alsa-devel@alsa-project.org>; Wed, 17 Jul 2019 12:28:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5D826F8015B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="JDhYZ/XL"
Received: by mail-oi1-x244.google.com with SMTP id s184so18070073oie.9
 for <alsa-devel@alsa-project.org>; Wed, 17 Jul 2019 03:28:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3OqUE647HuitrzeN56x9jTuLb2Ydo4APiMUt/N1U1gk=;
 b=JDhYZ/XLSp5p+uzs8xtZ+lDFSxyDX6a3a83vp7yY0oH7QR/JUG3nl7G/bfr2BVUVVt
 AT9BWdwzjWgFGhHaPLqfM2IfAKu5tUziTQa2yq6iXjC1JXAIXDIL1bnk3A60xCcqM8v1
 iHXfabVCBA+o6US93D2wHx2oKFBhG9ostlX0XsIagP4+oak+j0c4An6AaDbPkN0LuELE
 sbSIgxgH+PAC7n3MJ4/wXWHhsuSGKXPdLnObSXx350+qAr5xmhsnP0WJC6CsTXqWdSD+
 HwOrD5rSZE1vq3fGbC6Ihq5Zkdwq7tmp9dJjt8JIhcj2TFk/S5P93TXmZQmTmaWwZ/NV
 JatA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3OqUE647HuitrzeN56x9jTuLb2Ydo4APiMUt/N1U1gk=;
 b=fOfrg86J+D/nK2qFFX2Vkbb56OAhce3UC7PINKHkg3Q/UpQSnzDmzf+0+N5BKaSa+6
 Tpd1XLAAdIjrhrbiNR9hqqJAkRwjpVzAIRsZrbI3yWvuMOaiXUIs0hbx3YdVhdNNP4PM
 znmk/baeqyfvndlR8MrxI1afOqhRzD0ogiZfPZpc62iHL7Rc7goI25rmNb1zMjJfDEEc
 heLy2tvwIkdQhYWJQudpHjlGDnqxUYVK5lwue7Yd6B74jsh+gsP4Hf8aO4YYRafqXEXo
 BdpstTHzT7rZy353MByDViuJnNjrBeMg5aeSGZBFjspJNZ48zRx99zY/LfYVqI3EeKLQ
 6T7w==
X-Gm-Message-State: APjAAAX6oAIjE9FFnKtsXoTvTe5KXI3M64JcmkUeOEuxHyAD+rWYU6qm
 +Ou/uBAiOz0FRtnJnWRNMJ2s0d7Wkm5K5bsfUBiWgA==
X-Google-Smtp-Source: APXvYqwWwXVZ/BZHTjaG86aX6+cX+YF7cjf0miBCE15x0Nd7s4TeCOAZk+HlSzO1mf3x+jEgUAq8Br9lxzMLzaRz5tc=
X-Received: by 2002:aca:544b:: with SMTP id i72mr20169753oib.174.1563359308762; 
 Wed, 17 Jul 2019 03:28:28 -0700 (PDT)
MIME-Version: 1.0
References: <20190717083327.47646-1-cychiang@chromium.org>
In-Reply-To: <20190717083327.47646-1-cychiang@chromium.org>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Wed, 17 Jul 2019 18:28:17 +0800
Message-ID: <CA+Px+wX4gbntkd6y8NN8xwXpZLD4MH9rTeHcW9+Ndtw=3_mWBw@mail.gmail.com>
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
Subject: Re: [alsa-devel] [PATCH v5 0/5] Add HDMI jack support on RK3288
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

On Wed, Jul 17, 2019 at 4:33 PM Cheng-Yi Chiang <cychiang@chromium.org> wrote:
>
> This patch series supports HDMI jack reporting on RK3288, which uses
> DRM dw-hdmi driver and hdmi-codec codec driver.
>
> The previous discussion about reporting jack status using hdmi-notifier
> and drm_audio_component is at
>
> https://lore.kernel.org/patchwork/patch/1083027/
>
> The new approach is to use a callback mechanism that is
> specific to hdmi-codec.
>
> Changes from v4 to v5:
> - synopsys/Kconfig: Remove the incorrect dependency change in v4.
> - rockchip/Kconfig: Add dependency of hdmi-codec when it is really need
>   for jack support.
>
> Cheng-Yi Chiang (5):
>   ASoC: hdmi-codec: Add an op to set callback function for plug event
>   drm: bridge: dw-hdmi: Report connector status using callback
>   drm: dw-hdmi-i2s: Use fixed id for codec device
>   ASoC: rockchip_max98090: Add dai_link for HDMI
>   ASoC: rockchip_max98090: Add HDMI jack support
>
LGTM.

Reviewed-by: Tzung-Bi Shih <tzungbi@google.com>
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
