Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 08E1E20598
	for <lists+alsa-devel@lfdr.de>; Thu, 16 May 2019 13:48:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8DBE816DD;
	Thu, 16 May 2019 13:47:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8DBE816DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558007317;
	bh=+KLc6JZmxVyYIQdexY8U6gxYGmA/qsVrzGGE6Om7sPw=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=a/zwHPoPvCwaQUf1RWdgqgarFZZ0nRNOjbpjlK78Nonh4TO2Z8HvObZK2OqJsRp+y
	 M04feooPpSmveTHpJ8Fnwc+/G/+Pv/W8myYneCAtrPpijqsJR9SkUoSudZ6ghvPpii
	 Hnvqoc7gwmZPr8FJ032eMH9TEyZQ9WOnVGido6Lg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E8F0BF896B6;
	Thu, 16 May 2019 13:46:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8DFF4F896B6; Thu, 16 May 2019 13:46:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E0F5CF806E7
 for <alsa-devel@alsa-project.org>; Thu, 16 May 2019 13:46:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E0F5CF806E7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="YoYgQMNP"
Received: by mail-lj1-x242.google.com with SMTP id j24so2842886ljg.1
 for <alsa-devel@alsa-project.org>; Thu, 16 May 2019 04:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5YTu9UrMZBuGZUICk0h5ufsKKVuAqbM3thnFJkrTeAE=;
 b=YoYgQMNP2NxEvzHh4e8cmSlEpysOdip71UP8yT1Ghwrc6fEpJX0/7w1FBKsg6wSaX2
 7JGbu747/mkJzruY9GpL0OWnqSxaAbadcWJprNqD5seyLQggL+iIEl6Fh7goIdzaKZmK
 CfgaZiWLyQiyO8+UGEuAdcjA+2WcGSuIITZd+u+NIjq2feclXtjHNgGfO+XtnkTiFHRW
 jQgx2BrXa4fMLehI3OmYOiGFPlqzl2SxS+/jaJtbOuDBzIbMC5MbTr39gtSbrpTx7JBL
 YHgRpICumkdMvneunyfvGZY2lkti89Qm+CrHdtkNXfR2ZLsEf8HejhZSxdKqPI5PM76W
 OEkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5YTu9UrMZBuGZUICk0h5ufsKKVuAqbM3thnFJkrTeAE=;
 b=Iw57OnFCXr9zuZ4RtI1u0HPvSf0eiOes+7qteE8crAofKRdWjRkS/I2pp6IPtqTAyU
 bXpXXUGISnxY+JFxwv7V44jTxIX1bLJEVZq+1oGQYUyAUqyCpVBE8J54DsawI3SjmkX1
 HtWKT/w7ZudkNa9iYbDmbHZVf4BOG/Sq07vCDoiWRepvpCiK0NiVb7Az3ZYJzkhY3ODu
 K3eYIiOayYUYN8m0wFhg2PtySNxmcv5fPjCVNdTcUfm3mFUbbnUjjHovQmGdaoTqHjur
 b/UjEIJvVYZbRWr+4oJod7r8heEJ9hIVZd5KNAV/wqGr8mbXLAdW2YnED7PkGlGLhdBz
 Zq8A==
X-Gm-Message-State: APjAAAW0F01VOk7nGNI19dCezsoCmSHQ9wfX+HO66Hmfzbpa7yRkbwSg
 r2oCkxfgNfZQCJXxuRk0fSsPtKTouyF3+WZF9EU=
X-Google-Smtp-Source: APXvYqyOTc7WTRsHVZRRQRytwwDnDnOSVzcOLQVDwUcky2CN7MLQfiAG/p4Ojo7rUwnebX/5KBfJwYRza/rrOsR8DGE=
X-Received: by 2002:a2e:994:: with SMTP id 142mr15627606ljj.192.1558007206878; 
 Thu, 16 May 2019 04:46:46 -0700 (PDT)
MIME-Version: 1.0
References: <3e15abaee348468a69005e4240346822320c7f69.1558006714.git.shengjiu.wang@nxp.com>
In-Reply-To: <3e15abaee348468a69005e4240346822320c7f69.1558006714.git.shengjiu.wang@nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 16 May 2019 08:46:36 -0300
Message-ID: <CAOMZO5A7Xtg_pV2VAfmw5NacpRLS=0aGMAazu8p8tOTfa9PrCA@mail.gmail.com>
To: "S.j. Wang" <shengjiu.wang@nxp.com>, Rob Herring <robh+dt@kernel.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>
Cc: "brian.austin@cirrus.com" <brian.austin@cirrus.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "tiwai@suse.com" <tiwai@suse.com>,
 "Paul.Handrigan@cirrus.com" <Paul.Handrigan@cirrus.com>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "broonie@kernel.org" <broonie@kernel.org>
Subject: Re: [alsa-devel] [PATCH V5] ASoC: cs42xx8: add reset-gpios in
	binding document
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

[You should always submit dt-bindings patches to Rob and to the
devicetree list as indicated by checkpatch]

On Thu, May 16, 2019 at 8:42 AM S.j. Wang <shengjiu.wang@nxp.com> wrote:
>
> Add reset-gpios property, which is optional.
>
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>

> +Optional properties:
> +
> +  - reset-gpios : a GPIO spec to define which pin is connected to the chip's
> +    !RESET pin
> +
>  Example:
>
>  cs42888: codec@48 {
> @@ -25,4 +30,5 @@ cs42888: codec@48 {
>         VD-supply = <&reg_audio>;
>         VLS-supply = <&reg_audio>;
>         VLC-supply = <&reg_audio>;
> +       reset-gpios = <&pca9557_b 1 GPIO_ACTIVE_LOW>;

Reviewed-by: Fabio Estevam <festevam@gmail.com>
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
