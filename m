Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D264F2D3DE
	for <lists+alsa-devel@lfdr.de>; Wed, 29 May 2019 04:36:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4D74D950;
	Wed, 29 May 2019 04:35:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4D74D950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559097391;
	bh=xvlCULr/9zcKGgNRsrnFYq6J37Yfu6HhU6VuXnAh5kA=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TMV4pp7tpwKEPOzpNqf6408MtM8ycSLc7HH4tkttHAxozitPc1BpD2LpLg1q9TkXQ
	 PMCPXSbHaOvGu7R1Ki8G7jbZqRN49Spky1Aex8vMg9xtt9+EIwgHPMdLQYzJFLpi3k
	 YMRmIyGeswxLyW5pK3D7EefZvGSRFPowHnpsfhP8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BC846F896E0;
	Wed, 29 May 2019 04:34:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AA32FF896E4; Wed, 29 May 2019 04:34:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 PRX_BODY_26,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
 [209.85.166.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 01923F8072E
 for <alsa-devel@alsa-project.org>; Wed, 29 May 2019 04:34:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 01923F8072E
Received: by mail-io1-f66.google.com with SMTP id r185so499676iod.6
 for <alsa-devel@alsa-project.org>; Tue, 28 May 2019 19:34:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=16vRENUAaVkpiHADxLDX2jGaoPlKnqXavEdP3eFZTkA=;
 b=r4NCgYFjKtLP8Ojw3ot2WcVHLbaECMWBNgBU/tXEYVuiZU+CsW4d+fTqlL/ZozkpXK
 ub/HknyAOyfIB6yJY2aVKlNpNaJttQWhcyQgd/YTx69EOnnCBcGcYUbomk7VAeIOklfd
 DCqY/1LoUfybl37+qxuDU+O0T584FztlNCgeLOTd8Js8c1QB8E2Ug7W87kaxwO01dlav
 BOYuCNYHHitlqgMHD2OMTqqqQxmi1hnkoBfWPbqAvaxfvGF1V+rTGOd+usUHuhJzs7Xu
 Sexic9R1xK6tITB7KXgC4q1iaEPagfeqUQdkxsSt1hIa7cEbm4XI48hp5d0MxnmXGzBR
 DuhQ==
X-Gm-Message-State: APjAAAWJ4ZTNRJs9DuOeWx/R2KYbZio4xUgSkdETh3arZJUS3+Rzb59n
 mASGMooOcIqUPZRoYWhBIq6CRqezoeA7IQ==
X-Google-Smtp-Source: APXvYqwsV58COYKNrKgxzmgXbR84cQvCS9HM1oKwhYNzGeHpRI5dLoK71eNKY2HDnITX2mLV/NCuow==
X-Received: by 2002:a5e:db02:: with SMTP id q2mr198404iop.306.1559097277868;
 Tue, 28 May 2019 19:34:37 -0700 (PDT)
Received: from mail-it1-f177.google.com (mail-it1-f177.google.com.
 [209.85.166.177])
 by smtp.gmail.com with ESMTPSA id y7sm5435892ioa.77.2019.05.28.19.34.36
 for <alsa-devel@alsa-project.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 28 May 2019 19:34:37 -0700 (PDT)
Received: by mail-it1-f177.google.com with SMTP id m3so1186901itl.1
 for <alsa-devel@alsa-project.org>; Tue, 28 May 2019 19:34:36 -0700 (PDT)
X-Received: by 2002:a24:91d2:: with SMTP id i201mr5877754ite.88.1559097276557; 
 Tue, 28 May 2019 19:34:36 -0700 (PDT)
MIME-Version: 1.0
References: <1559040459-16488-1-git-send-email-georgii.staroselskii@emlid.com>
In-Reply-To: <1559040459-16488-1-git-send-email-georgii.staroselskii@emlid.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Wed, 29 May 2019 10:34:25 +0800
X-Gmail-Original-Message-ID: <CAGb2v64osE5yVdpCxSRfpkaq2TqeUUiLUbr3wZWW1rawuqxW-Q@mail.gmail.com>
Message-ID: <CAGb2v64osE5yVdpCxSRfpkaq2TqeUUiLUbr3wZWW1rawuqxW-Q@mail.gmail.com>
To: Georgii Staroselskii <georgii.staroselskii@emlid.com>,
 Mark Brown <broonie@kernel.org>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Danny Milosavljevic <dannym@scratchpost.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: Re: [alsa-devel] [PATCH v2] ASoC: sun4i-codec: fix first delay on
	Speaker
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

On Tue, May 28, 2019 at 6:48 PM Georgii Staroselskii
<georgii.staroselskii@emlid.com> wrote:
>
> Allwinner DAC seems to have a delay in the Speaker audio routing. When
> playing a sound for the first time, the sound gets chopped. On a second
> play the sound is played correctly. After some time (~5s) the issue gets
> back.

FYI that is DAPM powering down the amp. You'll here a light pop when that
happens.

> This commit seems to be fixing the same issue as bf14da7 but
> for another codepath.
>
> This is the DTS that was used to debug the problem.
>
> &codec {
>         allwinner,pa-gpios = <&r_pio 0 11 GPIO_ACTIVE_HIGH>; /* PL11 */
>         allwinner,audio-routing =
>                 "Speaker", "LINEOUT";
>
>         status = "okay";
> }
>
> Signed-off-by: Georgii Staroselskii <georgii.staroselskii@emlid.com>
> ---
>  sound/soc/sunxi/sun4i-codec.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/sound/soc/sunxi/sun4i-codec.c b/sound/soc/sunxi/sun4i-codec.c
> index f2deffe..9e1f00e 100644
> --- a/sound/soc/sunxi/sun4i-codec.c
> +++ b/sound/soc/sunxi/sun4i-codec.c
> @@ -1320,6 +1320,15 @@ static int sun4i_codec_spk_event(struct snd_soc_dapm_widget *w,
>         gpiod_set_value_cansleep(scodec->gpio_pa,
>                                  !!SND_SOC_DAPM_EVENT_ON(event));
>
> +       if (SND_SOC_DAPM_EVENT_ON(event)) {
> +               /*
> +                * Need a delay to wait for DAC to push the data. 700ms seems
> +                * to be the best compromise not to feel this delay while
> +                * playing a sound.

It is not that the DAC is not pushing data, it's just the internal headphone
amp needs some time to charge up. So this patch basically adds a delay before
sound is actually pushed out, thereby preventing any sound from being silently
dropped. It doesn't help with the pop on power down though, and the latency
might not be that great.

I wonder if we shouldn't just keep the amplifier section powered up
all the time.
Also it seems not very many codec drivers go all out with DAPM.

Mark, any suggestions on the matter?

ChenYu


> +                */
> +               msleep(700);
> +       }
> +
>         return 0;
>  }
>
> --
> 2.7.4
>
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
