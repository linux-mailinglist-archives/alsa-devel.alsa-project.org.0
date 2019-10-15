Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BA0D7D6FBF
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Oct 2019 08:52:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5B4F31666;
	Tue, 15 Oct 2019 08:52:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5B4F31666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571122379;
	bh=O9DSA8X0UfT+e0wyLsjhaXI/hkB71zgLvmJbcFIYf40=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iAV2gRKRcRyqOoOq2qXnoYq99HRm11oUMwoHDS1ikIkkAZLQCDN7c471HEfuOei42
	 Jb6I75oIMbnSPIPU8w93Wn9G/7QRfqpdsRBIgFPvSX1NhpvAKSksm+H32zuUldWAVh
	 9zX5QhY3V6trtIeH/btG1SZlh/EYRCFagE25N3J4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9C180F805FA;
	Tue, 15 Oct 2019 08:50:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 93CC9F805FB; Tue, 15 Oct 2019 08:50:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EDA51F805F5
 for <alsa-devel@alsa-project.org>; Tue, 15 Oct 2019 08:50:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EDA51F805F5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="slm8pkCb"
Received: by mail-wr1-x442.google.com with SMTP id b9so22357067wrs.0
 for <alsa-devel@alsa-project.org>; Mon, 14 Oct 2019 23:50:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UyoOKWxtyUBKIdJ9AivCjTmLmYh/M5kwGnE07ZEd8k4=;
 b=slm8pkCbTmzSxRYywXw8xFTANkCx0v04w8oDnSatZPBF8CeHAOuQKALMtCOrlWNqvp
 9Y190kzlRwduQFtQbpiuEccGqGdTlp3GuwLd3hmYbgjNB9Vl1DkBQRXnjtYMNUvAVBBP
 jUi1e7tTF4a7B2HZAwJ7t0PS1LzyQ+iQtEUVulG7HL/xnX9awdCGE5JCqJWK89GzN5jE
 osSq98YSv1WJJu+1BloqS1J6biZIzS2F3fL8iwKBau5rMy94CislhcuOCw9XvVpC4jUt
 v+u7BjRYfIoJXappoh/KMiV8NziWZDSkHwnWZD+iKPWe4EqjYOLIbR9kejZZ2TUKTkdC
 U1kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UyoOKWxtyUBKIdJ9AivCjTmLmYh/M5kwGnE07ZEd8k4=;
 b=aABSIDrxX9JNzPJrvfBHxUilK60NKdcpTWgH6Wq/sbb04sGGURyEfDTBPR3ShgCq01
 uf7T0cu2cv9Mh6eOV/Ic26vLl29H7gN8ydThITu1xb/yVbFAZXvKMJt+DcRNTVdYoOPa
 dlSCBwEF2GlQySb/sk9YDp9hVlaXb2/0+JWiaw4ntOBE56mQiems/SJOE8TnqOB1a4CL
 X2KhDjs79uyvqd13jCw6FHUfJ4SsH9JzmoApxFdijy2Xd6KjWupU6as1Vu16B7/ngEAH
 6V2yOpTTWrYYIZC65m8HhM5SCxkSfsYUvwyWr3cW1CeOfkyijU31fMryOvkzWOoE2R/u
 8/Ng==
X-Gm-Message-State: APjAAAXb5mwv07wvndcrppFBX+tbzL5HoSOpmUq8mRBz9ja85QttW/CL
 +/ZkPHdrkKP4fHFZPgXKHlko8JqXPIDIQwkkyR62pFoV
X-Google-Smtp-Source: APXvYqwiWNbG06jTEMUPaJGoSYetBRY16BnUuvp5/DA6puPSWgY2ws/aR6yb6QnCm93Ijrnzz0fhvPmHBLul54xQqxo=
X-Received: by 2002:a5d:4ace:: with SMTP id y14mr17682994wrs.131.1571122209257; 
 Mon, 14 Oct 2019 23:50:09 -0700 (PDT)
MIME-Version: 1.0
References: <87ftju67pi.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87ftju67pi.wl-kuninori.morimoto.gx@renesas.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Tue, 15 Oct 2019 09:49:58 +0300
Message-ID: <CAEnQRZBd3kxbu8SkjnW5OsW4MhYCGpwU0qLrWVjHJMqTnNiKUA@mail.gmail.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: Re: [alsa-devel] [PATCH] ASoC: simple-card: fixup
	simple_dai_link_of_dpcm() comment
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

On Tue, Oct 15, 2019 at 5:52 AM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
>
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>
> The comment is wrong.
> This patch fixup it.
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>

> ---
>  sound/soc/generic/simple-card.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/sound/soc/generic/simple-card.c b/sound/soc/generic/simple-card.c
> index fc9c753..10b82bf 100644
> --- a/sound/soc/generic/simple-card.c
> +++ b/sound/soc/generic/simple-card.c
> @@ -149,7 +149,7 @@ static int simple_dai_link_of_dpcm(struct asoc_simple_priv *priv,
>         if (li->cpu) {
>                 int is_single_links = 0;
>
> -               /* BE is dummy */
> +               /* Codec is dummy */
>                 codecs->of_node         = NULL;
>                 codecs->dai_name        = "snd-soc-dummy-dai";
>                 codecs->name            = "snd-soc-dummy";
> @@ -179,7 +179,7 @@ static int simple_dai_link_of_dpcm(struct asoc_simple_priv *priv,
>         } else {
>                 struct snd_soc_codec_conf *cconf;
>
> -               /* FE is dummy */
> +               /* CPU is dummy */
>                 cpus->of_node           = NULL;
>                 cpus->dai_name          = "snd-soc-dummy-dai";
>                 cpus->name              = "snd-soc-dummy";
> --
> 2.7.4
>
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
