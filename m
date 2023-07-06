Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 03609749AB4
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Jul 2023 13:34:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C2D851D7;
	Thu,  6 Jul 2023 13:33:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C2D851D7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688643253;
	bh=u1sugy+c3nVGP/iho1DaQIfG4jVgFs5hzVRI6xDnA4g=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=WrSpKwY5dZ6vwVTzINQJAwl4vbNmURTmdX4MWYrIaTJ3laAjWeFSuYpyqve3O7VNt
	 qIJNOsgYjWjQKN+1julm/yx3METJg+7xXf580RpdktCRCwLyHa3TijiruAyXHNpbWd
	 hh3H6ckN75di6TQdq6kThLrMl4iVgu90d313CzEM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 23307F80153; Thu,  6 Jul 2023 13:33:22 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7081BF80124;
	Thu,  6 Jul 2023 13:33:22 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 567F7F80125; Thu,  6 Jul 2023 13:33:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 054FFF800E4
	for <alsa-devel@alsa-project.org>; Thu,  6 Jul 2023 13:33:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 054FFF800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=JxJO+d4u
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-676cc97ca74so127473b3a.1
        for <alsa-devel@alsa-project.org>;
 Thu, 06 Jul 2023 04:33:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688643188; x=1691235188;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OBA///uk720bFWE3dLLyUaJz2IB5x6XkswygeQlz+4Q=;
        b=JxJO+d4uzSTxJ2fF2toUC9woxojvsRwpyUY80xQLq8t2WNJGj/HNq8LIlhTp9+7bX2
         BtIQlcsqjrjc8f1JkTTXTY1Gupt8OSQ2IZrxCzwQIIr1PGKbK0AqdgZUiHXq7iLP+Nss
         q4/SUhu1n1adAYLLficaE/KFjO19z1hQO0m7oCo5hoIz2/uQyxBF4MhSHtKV3kie0b5Q
         zJIG4yBT2SkdSceiEHpG7A4ZjmTIGZdPYQYYTU1/AT637rEh9dnURlnNZZgqRGlDw1mZ
         lRk/nv7Y4kjWhSGp1y7ssfGFYMmRvayjk9FhQg4TuNUIY5vv7wODHj2uadbXh26TLZok
         AQLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688643188; x=1691235188;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OBA///uk720bFWE3dLLyUaJz2IB5x6XkswygeQlz+4Q=;
        b=MHGLO7YIlEv7fe4kDo3uvJWTkinZ93bam4VXlBAeMVekxs0g6h31gAW3Dlb8+eNhfa
         RNjb0vouWwagIVu7JlfsI1NRyou9eVyY19lsMH6n035ljYyGW2tNUFXKfkOMfPMlNdoq
         t0840UQc4n9Hxnz0AbVjlyuscVlrvGkn1UwWuwKmcyfXLgExpu8+4nV0lrcTbbKBtoki
         qMUjFzh2S35hKcKfUH2pW4ot1LnKLxVHBnPsItz5aFiDu1qUaO18oKQPVlZZxz30B/jp
         Vt+T91rfbvJPSgB2MZDL7BTuZ+1oVVO7z0dkdNo8D8R4Svftrn8xuhmZuzSZB/ul7yKz
         9TFw==
X-Gm-Message-State: ABy/qLYcoxKuVaN+G38pSM14Qjtny8LPpqEkbyNcpzoDnZDaz3BsBIF7
	NfPsGkBLZlRwzZV22xtcQ5ZZFkvyAAZIas2Maz8=
X-Google-Smtp-Source: 
 APBJJlGFh/kKWEOFbD8l2/GsLDJj5JTKw1DEIDejRqTb9QUKteSEj/kbrP0Li8/S3pvYkKSEWGyxurF18028Ok6EdhE=
X-Received: by 2002:a05:6a20:54a9:b0:12d:77e:ba3 with SMTP id
 i41-20020a056a2054a900b0012d077e0ba3mr2051265pzk.0.1688643188564; Thu, 06 Jul
 2023 04:33:08 -0700 (PDT)
MIME-Version: 1.0
References: <1652963808-14515-1-git-send-email-shengjiu.wang@nxp.com>
 <CAOMZO5DtpoH0dLDX3=Sv4UUpX_=66VEZPsJUWQNnYviApfMLKQ@mail.gmail.com>
 <20230706084706.bzwsbi3zisx5m5rl@fatal.se>
 <CAOMZO5CCdaodWQrHUQgMizoES=jfEtw-sNJZG-DJMpRD8tZW9g@mail.gmail.com>
 <CAA+D8ANAg7bs0A35c7Af3_-5sLaqvT1RoKfCbzYi=z=t_q9LUw@mail.gmail.com>
In-Reply-To: 
 <CAA+D8ANAg7bs0A35c7Af3_-5sLaqvT1RoKfCbzYi=z=t_q9LUw@mail.gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 6 Jul 2023 08:32:57 -0300
Message-ID: 
 <CAOMZO5BtrKwrMwrjVDbYn3ivt2uV9rzbSDxd8qfiYjOBMvKBgg@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsl_sai: Enable MCTL_MCLK_EN bit for master mode
To: Shengjiu Wang <shengjiu.wang@gmail.com>
Cc: Andreas Henriksson <andreas@fatal.se>,
 Shengjiu Wang <shengjiu.wang@nxp.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Linux-ALSA <alsa-devel@alsa-project.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	=?UTF-8?Q?Hans_S=C3=B6derlund?= <hans.soderlund@realbit.se>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: BAM6QABC3U5K7PIFE64BIIO6T2KIA5ST
X-Message-ID-Hash: BAM6QABC3U5K7PIFE64BIIO6T2KIA5ST
X-MailFrom: festevam@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BAM6QABC3U5K7PIFE64BIIO6T2KIA5ST/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, Jul 6, 2023 at 8:19=E2=80=AFAM Shengjiu Wang <shengjiu.wang@gmail.c=
om> wrote:

> No, this is the code in probe().
> The code with the issue is in fsl_sai_set_bclk().

Yes, I put it in the wrong place.

> The clean way for fixing is to remove the code in fsl_sai_set_bclk()
> and add "fsl,sai-mclk-direction-output;" property in dts for some
> node.

Yes, what about this?

--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -507,7 +507,7 @@ static int fsl_sai_set_bclk(struct snd_soc_dai
*dai, bool tx, u32 freq)
                                   savediv / 2 - 1);
        }

-       if (sai->soc_data->max_register >=3D FSL_SAI_MCTL) {
+       if (sai->soc_data->max_register >=3D FSL_SAI_MCTL  &&
sai->mclk_direction_output) {
                /* SAI is in master mode at this point, so enable MCLK */
                regmap_update_bits(sai->regmap, FSL_SAI_MCTL,
                                   FSL_SAI_MCTL_MCLK_EN, FSL_SAI_MCTL_MCLK_=
EN);
