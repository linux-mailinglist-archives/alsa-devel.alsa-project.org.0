Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EBA2E1451
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Oct 2019 10:34:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 049941657;
	Wed, 23 Oct 2019 10:34:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 049941657
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571819690;
	bh=nvVlcfMl1QR/2fjD+NqlcdGQGFFheEcMrvH7QVsqbWs=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tE4gRml/Ikf6h0Khd5iu/BcMJ7XOj8lp+JwDtS7CpCEOA6iFQkrPYWGJU1GaO3fWM
	 Pk7sSODzERXOtsWcUMRc4dtPisOXsZX0709QpGm5j9GiEaFfIbB5SDyq4bstNPI07I
	 lEsD+p5TWnD6TK8wr7+wtcMvABkAAEyBtSFHAvuA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9AE9DF80368;
	Wed, 23 Oct 2019 10:33:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2EB8FF80368; Wed, 23 Oct 2019 10:33:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled
 version=3.4.0
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20::341])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 47AC8F80274
 for <alsa-devel@alsa-project.org>; Wed, 23 Oct 2019 10:32:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 47AC8F80274
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="viCUfLzz"
Received: by mail-ot1-x341.google.com with SMTP id z6so16708334otb.2
 for <alsa-devel@alsa-project.org>; Wed, 23 Oct 2019 01:32:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=L8bkA9mtw+vWpI8oRxFifBMw8ummqV2rsVRmeQUbBco=;
 b=viCUfLzzS1NUVQ5Tnwemu4lRHQh7rs8CcijmjomS/9Miv9Fu+1airI68eF8A8nJSyM
 546inlstZ+rsV3j10IwzBsycIFGDPHrgXpTekkK2mvUwZ8G3lCLjyeEM7EQy/lZHZhaB
 E5ZzJt4Q/pPYmawXeV71ABnjju8sA8DJIMrKRYDgXJbiwCuKZsPLIjF+dRKIDvkcbLbB
 PqQsxIkRG98Hk2GjN6zHwsA4r1gwOzIDXX1ehjEkdS0m14uNImJD2Ybj2n3J9f6LxhoR
 vIFuKY91tEAHwK1Lh0VLR3AqD94qvyZtf73j7lbvTR4BDSKOqQihceTRTuyCyrprb6I3
 jZlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=L8bkA9mtw+vWpI8oRxFifBMw8ummqV2rsVRmeQUbBco=;
 b=MGrqEL1su3QelaENwOpqoqW1pySBK5gOFPcEj8gPp2NHEDpDAV4RwJ19oW2z2GfM6M
 tTqCoW3Vw+x9u04Y+ME1FT0usMNDTEqZ3PSj7f+BLUcl1nIYiIkAkqz5iIJDf9QDYNLH
 ZNh3uZZ64jPgRVOF4AnG0SU2ecqtklI2J/fHjh6CXhXgbE0klLRcTLQA6ZF9A658lUtC
 CbQIslnDU7Ffeuh1kugqbFEONVQyPKci0CaIzfp0uvkErTevZvYB4zWubd/oBabPJS5e
 WfmrGU3IZ6S4vPfnpg58Ik1OKtYJbFJxpushft0/Y8jE1eFAeoJxPztutgryVB6F3Uzn
 EjpQ==
X-Gm-Message-State: APjAAAU/uqsEWV0eHmIZSOJTLsylX/QLDnHyXJ9K9YFPJ6To2YcR/O+i
 XQWe7PUCGnxkctPOdjYNmnu8yuEpVLztjPGpCphA4A==
X-Google-Smtp-Source: APXvYqx9C835htw9b+vjF88aUM7e4S/FRS+3eHUvwsbpuC8bReEl39lomHdHjZsPRkBvLfkVQLrdUBNmVyoQXSiyMP0=
X-Received: by 2002:a9d:7d12:: with SMTP id v18mr4103680otn.103.1571819576961; 
 Wed, 23 Oct 2019 01:32:56 -0700 (PDT)
MIME-Version: 1.0
References: <20191023063103.44941-1-maowenan@huawei.com>
In-Reply-To: <20191023063103.44941-1-maowenan@huawei.com>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Wed, 23 Oct 2019 16:32:46 +0800
Message-ID: <CA+Px+wX7-tn-rXeKqnPtp74tU5cLxhJwF6XZ_jeQX-tnAfvO5g@mail.gmail.com>
To: Mao Wenan <maowenan@huawei.com>
Cc: linux-arm-kernel@lists.infradead.org,
 ALSA development <alsa-devel@alsa-project.org>,
 kernel-janitors@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, yuehaibing@huawei.com,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, linux-mediatek@lists.infradead.org,
 =?UTF-8?B?U2h1bmxpIFdhbmcgKOeOi+mhuuWIqSk=?= <shunli.wang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, tglx@linutronix.de,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 KaiChieh Chuang <kaichieh.chuang@mediatek.com>
Subject: Re: [alsa-devel] [PATCH] ASoC: mediatek: Check
	SND_SOC_CROS_EC_CODEC dependency
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

On Wed, Oct 23, 2019 at 2:31 PM Mao Wenan <maowenan@huawei.com> wrote:
>
> If SND_SOC_MT8183_MT6358_TS3A227E_MAX98357A=y,
> below errors can be seen:
> sound/soc/codecs/cros_ec_codec.o: In function `send_ec_host_command':
> cros_ec_codec.c:(.text+0x534): undefined reference to `cros_ec_cmd_xfer_status'
> cros_ec_codec.c:(.text+0x101c): undefined reference to `cros_ec_get_host_event'
>
> This is because it will select SND_SOC_CROS_EC_CODEC
> after commit 2cc3cd5fdc8b ("ASoC: mediatek: mt8183: support WoV"),
> but SND_SOC_CROS_EC_CODEC depends on CROS_EC.
>
> Fixes: 2cc3cd5fdc8b ("ASoC: mediatek: mt8183: support WoV")
> Signed-off-by: Mao Wenan <maowenan@huawei.com>
> ---
>  sound/soc/mediatek/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/sound/soc/mediatek/Kconfig b/sound/soc/mediatek/Kconfig
> index 8b29f39..a656d20 100644
> --- a/sound/soc/mediatek/Kconfig
> +++ b/sound/soc/mediatek/Kconfig
> @@ -125,7 +125,7 @@ config SND_SOC_MT8183_MT6358_TS3A227E_MAX98357A
>         select SND_SOC_MAX98357A
>         select SND_SOC_BT_SCO
>         select SND_SOC_TS3A227E
> -       select SND_SOC_CROS_EC_CODEC
> +       select SND_SOC_CROS_EC_CODEC if CROS_EC
>         help
>           This adds ASoC driver for Mediatek MT8183 boards
>           with the MT6358 TS3A227E MAX98357A audio codec.
> --
> 2.7.4
>

Just realized your patch seems not showing in the list
(https://mailman.alsa-project.org/pipermail/alsa-devel/2019-October/thread.html).
I have no idea why.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
