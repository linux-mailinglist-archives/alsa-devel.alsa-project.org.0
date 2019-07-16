Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 10DEE6AA90
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Jul 2019 16:23:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 99229167C;
	Tue, 16 Jul 2019 16:23:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 99229167C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563287032;
	bh=JJKIKGqrbNXl75ftS8QPsleoLonUSIXjIHhTgZluXRM=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tsg5/8zJAJ5+yA+pySMEkiY1wU+JLsI4qxEAX0qgBK06YvVzAzkhHiTAJmo2UQMqG
	 sNJm/trjKPDA/RHQHEN6Fm9tvzvP0+B37/nJW4jESOuPTAgpj00zziu6jE47SzmbCy
	 mPf+YvIfaTUiZtcTtW/jf/4uw5jNKnjzrq6BbNCc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E13B2F80377;
	Tue, 16 Jul 2019 16:21:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2A4B9F80390; Tue, 16 Jul 2019 16:17:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
 DKIM_INVALID,DKIM_SIGNED,ENV_AND_HDR_SPF_MATCH,NML_ADSP_CUSTOM_MED,
 SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_SPF_WL autolearn=disabled version=3.4.0
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20::341])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 93180F80362
 for <alsa-devel@alsa-project.org>; Tue, 16 Jul 2019 16:14:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 93180F80362
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="WY+b2Mmn"
Received: by mail-ot1-x341.google.com with SMTP id j19so21240067otq.2
 for <alsa-devel@alsa-project.org>; Tue, 16 Jul 2019 07:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7p9kaWKWZ1RnK2eKn4KEJD3Gj9Xqk7kKd80amljZoBA=;
 b=WY+b2MmneuNwICa5DrCLXAuS2Ym/kIa/8fMTCjzzSDHJaRASHD8bq7nmIJgrdweSsS
 lW3jjoD5QcJJIyyvCHoMNUlIZNjTS3gwCcZw+OiFN7hXiOSyH9ADvlW2kxHCOuH2cxIu
 tCPLZkrJeyPGTbnAW+q4j5QO0RReazYEWdOD+nCh71seMSMeaod6xltVYqgLck89i1vJ
 ZZ1RfI48FJt7Kn9XZo+yb2BCK+6bo4ZICo6ZZy7vGtmqivPeeukvE1Lo2owGb9dXyase
 pCjnZbOzTFcDjgWgJHPrhRewV2AbCD6W2rQ9OCijtmE14GAPIzcgj+hn06DV9EbJe+MC
 MqwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7p9kaWKWZ1RnK2eKn4KEJD3Gj9Xqk7kKd80amljZoBA=;
 b=Us9KuTbzeU6NqChUIv6uICBepQYPsqj4hlhRP6ACkR2mBgATQ+qCcKV7t1kXZFltfS
 FAR1dAvIkOt5w5paPw6gY75pslYbYChtC7bSeabbaHk/q6J7ifDoq+/dkWvUyGfjGm3d
 AVpilmTCFR8ZD/PnsIaudHYcNURFujT5Kom9mRo2jfBmM72ExUKZHVvQvvkoYA9z29hh
 AAwUCmTtjyoI9U5z+RHYENOgtSb0L2x6e/hQnokigMoVpTkSfBmS75erKJbrYXIMjzhq
 fO+N1I3A2C37ayBuJwdHyRbCXJYODvLEGaiBqzOq7gdW4diRxWm60MTopIS4u3UuWrdO
 rtLA==
X-Gm-Message-State: APjAAAWogNU+fObjVuV89hTTgljc7bL36V5A5MGfk8UAjq7UvCxVJwwg
 AVKmLgDiCGfpOYwQhqpElzWlEt2w2kZpJGJV8uyj1Q==
X-Google-Smtp-Source: APXvYqxrx8/ntAt3Zd7iJAcVEIJOpeAV8oT/asIVbOOvcJcHbUCdJVyQnJvUXuhuaUoA8KWwL8LQ+jY6q3iS71MyDVI=
X-Received: by 2002:a9d:6195:: with SMTP id g21mr26395560otk.103.1563286487230; 
 Tue, 16 Jul 2019 07:14:47 -0700 (PDT)
MIME-Version: 1.0
References: <20190716115725.66558-1-cychiang@chromium.org>
 <20190716115725.66558-5-cychiang@chromium.org>
In-Reply-To: <20190716115725.66558-5-cychiang@chromium.org>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Tue, 16 Jul 2019 22:14:36 +0800
Message-ID: <CA+Px+wV6RSfv4GL8+EJzXGq2nqzKtH9p23VTo2s30h0To2rQtg@mail.gmail.com>
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
Subject: Re: [alsa-devel] [PATCH v4 4/5] ASoC: rockchip_max98090: Add
	dai_link for HDMI
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
> diff --git a/sound/soc/rockchip/Kconfig b/sound/soc/rockchip/Kconfig
> index b43657e6e655..d610b553ea3b 100644
> --- a/sound/soc/rockchip/Kconfig
> +++ b/sound/soc/rockchip/Kconfig
> @@ -40,9 +40,10 @@ config SND_SOC_ROCKCHIP_MAX98090
>         select SND_SOC_ROCKCHIP_I2S
>         select SND_SOC_MAX98090
>         select SND_SOC_TS3A227E
> +       select SND_SOC_HDMI_CODEC
>         help
>           Say Y or M here if you want to add support for SoC audio on Rockchip
> -         boards using the MAX98090 codec, such as Veyron.
> +         boards using the MAX98090 codec and HDMI codec, such as Veyron.
You should not need to select the option in this patch (but in next
patch), because this patch does not depend on anything from
hdmi-codec.c.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
