Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 455A9162951
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Feb 2020 16:21:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E53AE1685;
	Tue, 18 Feb 2020 16:20:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E53AE1685
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582039261;
	bh=JPxHxmU8AkIXdwE/mBODY+MsHQOBMFztx0eE00t7nxI=;
	h=References:From:To:Subject:In-reply-to:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qoCCkkEqk8cJBZ9davYHUVoY+3i9hzHHfCZhYZJSr3OXiD7PnOCJ/GywNxJ/BwPaF
	 hqs9OwdoHyLfCKwasG73sQcsUtCcXDsV3D0cDNYBMBFxZvg9j0ne8D9YrQfyVhcIur
	 co4DlV/rg2G3Ylbb7rHa8BupdSWXsP2lFZSqH2kI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 16362F80137;
	Tue, 18 Feb 2020 16:19:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AA97CF80148; Tue, 18 Feb 2020 16:19:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2CAC8F80137
 for <alsa-devel@alsa-project.org>; Tue, 18 Feb 2020 16:19:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2CAC8F80137
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="zDq1sa10"
Received: by mail-wm1-x342.google.com with SMTP id a6so3345732wme.2
 for <alsa-devel@alsa-project.org>; Tue, 18 Feb 2020 07:19:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version;
 bh=JPxHxmU8AkIXdwE/mBODY+MsHQOBMFztx0eE00t7nxI=;
 b=zDq1sa10e5lFrhxQwmWsk9PP/Zqve+Pj9G5zjjgERLh8WpFa1BDaRXedwqCPJO3LEU
 uRq1pVQwad9ZdsnkXRBv8qMqICkEK5jMPy0CTMOfPEGqylF2ktDmuZKBq3dNeqZLjYMN
 eeI2k6Rom3Wa17U8JVWrKnkyF9X90A5kXede9MFPOtFEOB+kccO12G6B04jd1MyOg1Pq
 pj7jxPX7VH2cbu6TlWTIOzzcIgEjeODCCs+8So4W/2AusI8HeUbUYmYTiYo2sAGeiD8g
 NZIWALRTUBMeCtEdtGy2T9HtrpLvT009CD76dHNriYcLx/NEadRDDAYJO0QB+/qgnC4f
 cS6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version;
 bh=JPxHxmU8AkIXdwE/mBODY+MsHQOBMFztx0eE00t7nxI=;
 b=TE4cqQRNBIu1R4FngI6Kl83E4vu/HVFJdqyjLdWsOaB4o7I6VhrhaW9qCLgFeg5vvN
 n5KoGIsy+fjp4rU4rgYgq9eKDJvHEw0d0RR5Q+pHHmZsfhIK4dfV+G7Ltrrd/FnX/i2r
 fxR0oCFlFfshssfBiDhV8ba1QYKN3+k53xCMmmI4NtwZx3zI3oeXijGhN0cgmlGL1eq1
 1zSRmmJHU2taJzIwj3zh+Hmep5Srq3Uu/XLr3kP/wFJ8lH2KIzUYCJyGnNQnTg1Yq/ZD
 EGN50EhkG4IReb9t4bYSIe4RKyObzRMG2lhm8ySI+UWEkcQiM+eUpp7TAPdjk2d8KlTI
 sI5g==
X-Gm-Message-State: APjAAAUklx/ovDzohBlVVQTuZuBQ6YzBZwCUi08bJ28IGKWa/jmoOAaN
 oNbIQ4fKlFLx5pQT1gjZvscaYQ==
X-Google-Smtp-Source: APXvYqxGboUSdKLNAg8RpEjAeJQnsUFol6BX6M6mCPurTPlomezlvF9k8U+3ruvotcQJvfLnP3JT+w==
X-Received: by 2002:a1c:491:: with SMTP id 139mr3746815wme.117.1582039154988; 
 Tue, 18 Feb 2020 07:19:14 -0800 (PST)
Received: from localhost (cag06-3-82-243-161-21.fbx.proxad.net.
 [82.243.161.21])
 by smtp.gmail.com with ESMTPSA id q1sm6469393wrw.5.2020.02.18.07.19.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2020 07:19:14 -0800 (PST)
References: <20200218103824.26708-1-stephan@gerhold.net>
User-agent: mu4e 1.3.3; emacs 26.3
From: Jerome Brunet <jbrunet@baylibre.com>
To: Stephan Gerhold <stephan@gerhold.net>, Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] ASoC: soc-pcm: fix regression in soc_new_pcm()
In-reply-to: <20200218103824.26708-1-stephan@gerhold.net>
Date: Tue, 18 Feb 2020 16:19:13 +0100
Message-ID: <1jd0abrki6.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Sameer Pujar <spujar@nvidia.com>, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


On Tue 18 Feb 2020 at 11:38, Stephan Gerhold <stephan@gerhold.net> wrote:

> Commit af4bac11531f ("ASoC: soc-pcm: crash in snd_soc_dapm_new_dai")
> swapped the SNDRV_PCM_STREAM_* parameter in the
> snd_soc_dai_stream_valid(cpu_dai, ...) checks. But that works only
> for codec2codec links. For normal links it breaks registration of
> playback/capture-only PCM devices.
>
> E.g. on qcom/apq8016_sbc there is usually one playback-only and one
> capture-only PCM device, but they disappeared after the commit.
>
> The codec2codec case was added in commit a342031cdd08
> ("ASoC: create pcm for codec2codec links as well") as an extra check
> (e.g. `playback = playback && cpu_playback->channels_min`).

That particular check was there when I worked on that change but I seems
I messed up when I rebased on Kuninori's work regarding
snd_soc_dai_stream_valid() which happened more or less at the same time.

>
> We should be able to simplify the code by checking directly for
> the correct stream type in the loop.
> This also fixes the regression because we check for PLAYBACK for
> both codec and cpu dai again when codec2codec is not used.
>
> Cc: Sameer Pujar <spujar@nvidia.com>
> Cc: Jerome Brunet <jbrunet@baylibre.com>
> Fixes: af4bac11531f ("ASoC: soc-pcm: crash in snd_soc_dapm_new_dai")
> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>

Looks good and works with the codec-to-codec links on Amlogic aiu. Thx !

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>
Tested-by: Jerome Brunet <jbrunet@baylibre.com>
