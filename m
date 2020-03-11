Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DEDE180D82
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Mar 2020 02:29:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E4A4D1657;
	Wed, 11 Mar 2020 02:28:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E4A4D1657
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583890157;
	bh=PJ81/ZqXoZrV12MCpPrcUXl57HM/vZYSisQaW9VRjpQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bKXQYhxbckcH2xMPbYER3CNg/k640Aq50oEbwflb39hiWPtp1xfx5iLTV1CwVOxU7
	 olOEUUg2XQEMacAtkh5or0FiUDeRewGZOSrsZfOOKb3BkiZ0rK2g/pV01cnVDE8u63
	 6Erl61K9TzV6zqWDc5SjTHZ4LofPK2cIz73b2doc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DD972F800DA;
	Wed, 11 Mar 2020 02:27:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 53488F80217; Wed, 11 Mar 2020 02:27:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com
 [IPv6:2607:f8b0:4864:20::d43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4DBB6F800DA
 for <alsa-devel@alsa-project.org>; Wed, 11 Mar 2020 02:27:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4DBB6F800DA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.b="yVjYPpaM"
Received: by mail-io1-xd43.google.com with SMTP id k4so236341ior.4
 for <alsa-devel@alsa-project.org>; Tue, 10 Mar 2020 18:27:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZavdonYmkl3wlcs1lhyu+z2iJ6IJI3+VUSxgGeipNzk=;
 b=yVjYPpaMagnKXtEel886rKmupvLX35i/9nWuGgyc+Q+1RhLnBU8+9Yj3HBeFdhGSEs
 8oOKNwGCYDQvwQf+0N5lnlgCpFY41VamKalAJESyXrRugnrA6+CKxx44aArCY+mdBYhL
 cuoFsCI11F75Q9ILZPoH3I/ir9d5prgqCLUhsUOd4/HPGZCNoZ/jl9m79szo2DY/RW7a
 T74FKyPdqAU1L0oqwu+bYoKQgcWzPdOiyFsTYsr7vwktVFIueK+ERlLY2NEmllmd0C5+
 J97irUMjlY0dNrPiU1h8VE9HMKsf+zGcOWJyjy0YR6q+CSeYV/axCrLOEaCRsW4ZOXLX
 HZoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZavdonYmkl3wlcs1lhyu+z2iJ6IJI3+VUSxgGeipNzk=;
 b=sElBO5oDkiFwRP5SinjmkOI/T/Otsd2R/BVh36E3W6aQL4j7CV5qygvJL2gtlELCQS
 ZDCntqpAqIeShbLmtzHJqUdavXsaho2yKNPX/eJ3wwLfIXNmkOMaAZloloumAerRS09s
 rRthMxQhVF5dipC1KgEagRDWBe41fIMTP9105wEZ87WzuHhnqI3EQYHOXCu7PkoVP8Vv
 BNx7TM7lyQKZsmmXScirpeE/87GGZfDiRlAz/MoHJzEYAxD6w90zA7/A1XlqSvL/2x0j
 fA9C9ZmQQ0QRijBX13pCZpcnYZ8axsitfGeG7S9IB1IlIXHKViKjpsoqDUOOkttDnyQB
 /cHw==
X-Gm-Message-State: ANhLgQ1E1lSogUZuhHOX3TRoz6LwD9phJNG4RicwAXQInVxxQG1YwUVk
 voz9SlknHD7lZgumf0l/BDb4hrKWI/8TTbYmO25fXQ==
X-Google-Smtp-Source: ADFU+vuq3gfStWve/MADCIiN5Wmxxnagakf7kcLBigcmvkyB3oXM+Li99BpGlD/tE+9FEnhAhajOJhxoC9o0xw9LRdw=
X-Received: by 2002:a5d:8952:: with SMTP id b18mr795008iot.40.1583890046936;
 Tue, 10 Mar 2020 18:27:26 -0700 (PDT)
MIME-Version: 1.0
References: <87y2s7vgxb.wl-kuninori.morimoto.gx@renesas.com>
 <87tv2vvgvq.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87tv2vvgvq.wl-kuninori.morimoto.gx@renesas.com>
From: "Sridharan, Ranjani" <ranjani.sridharan@intel.com>
Date: Tue, 10 Mar 2020 18:27:16 -0700
Message-ID: <CAFQqKeXD+W6WMB7sp8H5m1k6Sc5_FEvKv4O6d0YE_F5pr-cofw@mail.gmail.com>
Subject: Re: [PATCH 3/7] ASoC: soc-dapm: Merge for_each_rtd_cpu/codec_dais()
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
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

On Tue, Mar 10, 2020 at 6:10 PM Kuninori Morimoto <
kuninori.morimoto.gx@renesas.com> wrote:

>
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>
> Now we can use for_each_rtd_dais().
> Let's use it instead of for_each_rtd_cpu/codec_dais().
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  sound/soc/soc-dapm.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
>
> diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
> index e00a465a7c32..3a3fbf167383 100644
> --- a/sound/soc/soc-dapm.c
> +++ b/sound/soc/soc-dapm.c
> @@ -4433,14 +4433,11 @@ void snd_soc_dapm_connect_dai_link_widgets(struct
> snd_soc_card *card)
>  static void soc_dapm_stream_event(struct snd_soc_pcm_runtime *rtd, int
> stream,
>         int event)
>  {
> -       struct snd_soc_dai *codec_dai;
> -       struct snd_soc_dai *cpu_dai;
> +       struct snd_soc_dai *dai;
>         int i;
>
> -       for_each_rtd_cpu_dais(rtd, i, cpu_dai)
> -               soc_dapm_dai_stream_event(cpu_dai, stream, event);
> -       for_each_rtd_codec_dais(rtd, i, codec_dai)
> -               soc_dapm_dai_stream_event(codec_dai, stream, event);
> +       for_each_rtd_cpu_dais(rtd, i, dai)
>
typo here? should be for_each_rtd_dais()?
Thanks,
Ranjani
