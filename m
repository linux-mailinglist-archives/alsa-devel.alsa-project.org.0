Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 23BCC1B4BD
	for <lists+alsa-devel@lfdr.de>; Mon, 13 May 2019 13:17:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A11D816C2;
	Mon, 13 May 2019 13:16:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A11D816C2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557746242;
	bh=P8s4tgI1gzKuhNj/Oc1/wYr76zzh8xCwf65t3WLGyCo=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=li5vfyjoR7bdEx4XPdNEZ/WF49DQ1N5NvrCwkDFX6uTf3u4dyQoW5SW/4GCSdwKyW
	 6pHx51YrcyWqKV2n44c4WsGQUHvVb1UyPRObTcx75nXrdg1ZAloEkiDGKdVoeH9IvS
	 CH3wIwkZyf6EQBrtDCbP24gUmOECi7hhF/BwFV3Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1E543F89633;
	Mon, 13 May 2019 13:15:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5273FF89684; Mon, 13 May 2019 13:12:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,RCVD_IN_DNSWL_BLOCKED,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 04A63F80733
 for <alsa-devel@alsa-project.org>; Mon, 13 May 2019 13:12:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 04A63F80733
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="KNkFCUXm"
Received: by mail-ed1-x543.google.com with SMTP id j12so16268402eds.7
 for <alsa-devel@alsa-project.org>; Mon, 13 May 2019 04:12:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sSJpKKtOaPRaJ2njSlc0Hr8McxaKKWYBOWZ1jc3Lolo=;
 b=KNkFCUXmd4nRtY/OXamhwSMyjSblY9iYDyLW/7Dy9vStTfXSe1MiQu4nVAVGxVnyNh
 o3xuFcsFU+7MrHEZAln5yws3QmSAFEb4Rr5S/2BCeT4mRaQjnATCqPXOPNUZbl8hXFCO
 UpiSW+cuVrPtEdWEk4bnI6Rg35MKFUza0Dw1q2/qnlpgaGseLDJw+fVsXiU3Y40oRcIS
 pZaysV/0qluCZjFbYVDXukpcbAv+lTuZEjkIUFhI4GzG51W3kgQ+j9nvLxiDnz0IAH1a
 cWu2GslHRjZUMppjyy1CUwpYBBNopAkD01I44d3iXRojuUnSwF4chMeoib80pZYcodzx
 w1Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sSJpKKtOaPRaJ2njSlc0Hr8McxaKKWYBOWZ1jc3Lolo=;
 b=RDlhMFO4xw0dHeuNXFxk7eMovQG6IK/CIx/VryfzDY+CA0KFXbgQdrXO8FGBxFw8vV
 CurOKzrYsTc3rI9avU0R0c5u+lbmXdhAs/UQd2KXTmZ6LNUuO3eMoCx2gxU68W/swEz8
 Ckr5QTNwkiNMO3RWUp3mflnUPHU/ezq5seTo2ctwnUPMUme40Xf03HEz9yS7C54hclrI
 nDvIZkWvESggkmLINpqM4Ogwj7dgF9p1rCu3N/hGAUC+/yMxjbXGWZPu0O3TJEoUxICW
 NG9agkIEH7XFA8tXEanzBurQGH38ENDT+jIk8QyLZv8RBEkxubyYwY/bV7/GX+/MY7ip
 6aLw==
X-Gm-Message-State: APjAAAUELN9k8a3+R7935V9czBLZjEVzLk+BA28BNsbncFIJo2kw6Ks9
 W+S3ggIt4pC0vG/FSuZdBeQZk6jKI4Tju1Auubg=
X-Google-Smtp-Source: APXvYqy9j1/ftxSAlDMn4oGTpMjDHKVh5q+Hw/bOLNMBvJm+ijQLv8tZllu5OB7gwwVri8ii3X5j4owklvzmd4VPaJk=
X-Received: by 2002:a17:906:6857:: with SMTP id
 a23mr14655557ejs.280.1557745954760; 
 Mon, 13 May 2019 04:12:34 -0700 (PDT)
MIME-Version: 1.0
References: <1557741724-6859-1-git-send-email-viorel.suman@nxp.com>
 <1557741724-6859-2-git-send-email-viorel.suman@nxp.com>
In-Reply-To: <1557741724-6859-2-git-send-email-viorel.suman@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Mon, 13 May 2019 14:12:22 +0300
Message-ID: <CAEnQRZAwz+g_-xKwhECYz=Zc6phFrfj0PE22qXJa2sfAAci7JQ@mail.gmail.com>
To: Viorel Suman <viorel.suman@nxp.com>
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "S.j. Wang" <shengjiu.wang@nxp.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Viorel Suman <viorel.suman@gmail.com>,
 Julia Lawall <Julia.Lawall@lip6.fr>, Mark Brown <broonie@kernel.org>,
 dl-linux-imx <linux-imx@nxp.com>, Colin Ian King <colin.king@canonical.com>,
 Daniel Baluta <daniel.baluta@nxp.com>
Subject: Re: [alsa-devel] [PATCH V2 1/2] ASoC: ak4458: rstn_control - return
 a non-zero on error only
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

On Mon, May 13, 2019 at 1:04 PM Viorel Suman <viorel.suman@nxp.com> wrote:
>
> snd_soc_component_update_bits() may return 1 if operation
> was successful and the value of the register changed.
> Return a non-zero in ak4458_rstn_control for an error only.
>
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> Signed-off-by: Viorel Suman <viorel.suman@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>

> ---
>  sound/soc/codecs/ak4458.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/sound/soc/codecs/ak4458.c b/sound/soc/codecs/ak4458.c
> index eab7c76..baf990a 100644
> --- a/sound/soc/codecs/ak4458.c
> +++ b/sound/soc/codecs/ak4458.c
> @@ -304,7 +304,10 @@ static int ak4458_rstn_control(struct snd_soc_component *component, int bit)
>                                           AK4458_00_CONTROL1,
>                                           AK4458_RSTN_MASK,
>                                           0x0);
> -       return ret;
> +       if (ret < 0)
> +               return ret;
> +
> +       return 0;
>  }
>
>  static int ak4458_hw_params(struct snd_pcm_substream *substream,
> --
> 2.7.4
>
> _______________________________________________
> Alsa-devel mailing list
> Alsa-devel@alsa-project.org
> https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
