Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 80759D6FC0
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Oct 2019 08:53:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CC95F1672;
	Tue, 15 Oct 2019 08:52:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CC95F1672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571122392;
	bh=NuQn7SZyoj24CEIjEWn8W6GoG4+9gXtcuKr7qI8NP4I=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ULxIsanQRNcRbBW2LA/CSvksnxtZxBYmmZsTD7LoZVgcLbgR+gGR0DWfPPjgaTwCU
	 y0C8tMOhQ7gclQ0HS7SUEFDUzjzFSCnVrzK622QLNdpRQzcwqIA5JZOu/mY/snYfHF
	 y0Hk8tEqfZnA1pQXmiwEGDfcCBGKb+wiTMifcb8k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DBD64F80600;
	Tue, 15 Oct 2019 08:50:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 62313F805FF; Tue, 15 Oct 2019 08:50:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CCCC7F804A9
 for <alsa-devel@alsa-project.org>; Tue, 15 Oct 2019 08:50:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CCCC7F804A9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="DrDJYUtC"
Received: by mail-wm1-x344.google.com with SMTP id 7so19502964wme.1
 for <alsa-devel@alsa-project.org>; Mon, 14 Oct 2019 23:50:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KCM+QVn9qhwl3rLoG3Kbu6rHvOtYsU8cT188s9EWql4=;
 b=DrDJYUtCyUbXlprwr3jWv2EaUEAaT7FEfxO4NXZykV25YRr2+WYYc9tOe/DjfgWoh/
 kTGKHgmkcfmtgAeX44UXjdLD8ZSB4g9iZ+02uyCkNOOCLWquXcuclWJO7RNEi7x2wx27
 1RSKjATeMgpJQsHcx9IPl6ddw20uBUWniHjF0da7j/bJMK/wf23MvViG1Yhh5PuHJsW2
 jcQGSP3nNrgnRMhfV6WbjIGx3odzFo9YHcc9e58DsAgGpzl9lKvNDYVoc13qGly0Ey7b
 rvvkFLGZMeQxj8WTc3ORWmjExQEkerbxwruMfZOIpHJ9/8W03tGE/D/vpwr7J9OxQw6n
 IyVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KCM+QVn9qhwl3rLoG3Kbu6rHvOtYsU8cT188s9EWql4=;
 b=eOJv+CDEkksT3pXUvrVGsOuUK8U0a1mpk9b1b4+tEMCBUuat0uFpWhLQqDbHtsOz3d
 Z7CMys3tc0NDcjcgMBC85mF/O44VcIHUfzEgiIhwzF3ToCjYTpaqed3AJ0B5635QiVXA
 SGPfikV4AwRyS5i/WnOx9TrhdhWMS5hwWY6/ohhpVGlUnIaWxJvW0X2XbOiyRnA0UJ0D
 VDc9yq6ZNG9+Etg68YP/zqLRAWafWNHu5EhQAnGHJgzJEBNhEWwGIodu0KRhuyGd63Zi
 ZJAHUknsrjoYudCzBoz7PONEnVXbOjVvyVyYbpU23UzmLhzPkRgmvsMnUIEnvIcEcoES
 WcnA==
X-Gm-Message-State: APjAAAVxd7eL+Vxy+g7ADfSOlJcl6UQuXRY4y04iycjjCOmaMTB2gLTD
 EGUxAxzYLoj2VCjTS5KRJNKykQuKZPhMNEfqMtI=
X-Google-Smtp-Source: APXvYqymI9FR/vb6gxZVfVEbvDaaL3Y7A5pjfrjn2ugNzlETULuOdjng9ETUQ00hDJpxP0SwXfbTOKeBP5CtzNbbNd4=
X-Received: by 2002:a05:600c:2308:: with SMTP id
 8mr17339499wmo.73.1571122233469; 
 Mon, 14 Oct 2019 23:50:33 -0700 (PDT)
MIME-Version: 1.0
References: <87eeze67p7.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87eeze67p7.wl-kuninori.morimoto.gx@renesas.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Tue, 15 Oct 2019 09:50:22 +0300
Message-ID: <CAEnQRZCGN=-LEaUXsWqyJYXLK98WAAVLcP-yB0Jf3yZ+J0N-tA@mail.gmail.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: Re: [alsa-devel] [PATCH] ASoC: audio-graph: fixup
	graph_dai_link_of_dpcm() comment
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
>
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>


>
> The comment is wrong.
> This patch fixup it.
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>

> ---
>  sound/soc/generic/audio-graph-card.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/sound/soc/generic/audio-graph-card.c b/sound/soc/generic/audio-graph-card.c
> index 6007e63..9ad35d9 100644
> --- a/sound/soc/generic/audio-graph-card.c
> +++ b/sound/soc/generic/audio-graph-card.c
> @@ -232,7 +232,7 @@ static int graph_dai_link_of_dpcm(struct asoc_simple_priv *priv,
>         if (li->cpu) {
>                 int is_single_links = 0;
>
> -               /* BE is dummy */
> +               /* Codec is dummy */
>                 codecs->of_node         = NULL;
>                 codecs->dai_name        = "snd-soc-dummy-dai";
>                 codecs->name            = "snd-soc-dummy";
> @@ -263,7 +263,7 @@ static int graph_dai_link_of_dpcm(struct asoc_simple_priv *priv,
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
