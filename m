Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B513620D76
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Nov 2022 11:37:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 00789207;
	Tue,  8 Nov 2022 11:36:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 00789207
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667903827;
	bh=E3Cq16f4srZv5JhdCUqlCp1PJogpYl4DDCmpnjVe/8I=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aVMq0lx/We20cEs4kjE1wAiEJX8SVCnPaHSNf7lhjC2dNHarJZ9pS2ybAuTt/hBVG
	 L2NYc4NVzQthbwCRmaQKI7FIbuSBaZ29iA5y7xKBvDEHgPWlflIAFIOCiaY6eiv8lB
	 OhEj+oOWqq/bhgpfYfGaPc6cLDTnP8QPpD7EWZ+A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 88A35F8020D;
	Tue,  8 Nov 2022 11:36:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0303EF801D8; Tue,  8 Nov 2022 11:36:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-vs1-xe36.google.com (mail-vs1-xe36.google.com
 [IPv6:2607:f8b0:4864:20::e36])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E0D2DF800EC
 for <alsa-devel@alsa-project.org>; Tue,  8 Nov 2022 11:36:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E0D2DF800EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="c/tDJvrT"
Received: by mail-vs1-xe36.google.com with SMTP id z189so13232603vsb.4
 for <alsa-devel@alsa-project.org>; Tue, 08 Nov 2022 02:36:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XIwMGfWyNQ7s5l6wql3uvlBpgJdlvAeJW6d0366qQQs=;
 b=c/tDJvrT2wHv4vJWmTx3PQDFAb+Y/XJPBG2EIptwqdCWhYX5CAktQnHNOx40Ot5Hmj
 YVogdQ9uwLEYZlZs9fS18niOIAsddaAjWEtKbbTiy4+k+7WbFQWRqOa+z0XprQfI2pTy
 embv6SCWU66djSMx502aQWrD5bB8ckF5PZvik=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XIwMGfWyNQ7s5l6wql3uvlBpgJdlvAeJW6d0366qQQs=;
 b=z2l/9s9VMy2X0XBjMdnDgHr2lI7/BFOVHCQ/ba780O9fDle57c4EmbUtz1lCW7bUqN
 vRnbF3FpO0kwsSBXl/74mE1C/jlKAhbGLIwyohfgZOBVMhykwQIXVQQ9HzAztku2EdsS
 ieVWUtDJeOZg5iUfJoyt+rCn059qGtkpGseQnr3yDxYRBC4h/tF8qTWrMnEoqqhdR3mT
 fjDB/vr6KkkTFUJLxTgC7gi3Lc+0j9u+a+m+c/gj4I+tZJj4c7JWkD+WKY6eTvZkl2JK
 z1S3IU64lG7l+JZrLGBkhXp+wyPchm9XJl4steK+2Ct9WY0GhHNHn1UVEUQ8UTLyFNdd
 McyA==
X-Gm-Message-State: ACrzQf07T0kk06HDZRHLO5HHkpuRlBraNj1LgbgLkKQRuB9UVvZ4VDFT
 xtLLyUKgY/i1y3r1Z0usMY0iEb6nulvOzr1ZsVvE+Q==
X-Google-Smtp-Source: AMsMyM5jLCmjiXZ4jvSVXS8J/qTXmQOOIgSjI3NrNmXTmWAuW0AmzL7SRcukaw4oeCm789X2QNm3ZTTOWYDLc8Q7zvc=
X-Received: by 2002:a05:6102:3c83:b0:3ac:7ce4:1bc0 with SMTP id
 c3-20020a0561023c8300b003ac7ce41bc0mr27570121vsv.65.1667903761637; Tue, 08
 Nov 2022 02:36:01 -0800 (PST)
MIME-Version: 1.0
References: <20221107160437.740353-1-nfraprado@collabora.com>
In-Reply-To: <20221107160437.740353-1-nfraprado@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 8 Nov 2022 18:35:50 +0800
Message-ID: <CAGXv+5FRdA+OaA-tEE6Aa1avb1YtacqcE5e=A6ZpBFsCaLQRJw@mail.gmail.com>
Subject: Re: [PATCH 0/9] ASoC: mediatek: Register machine drivers to module
 device table
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Cc: Miaoqian Lin <linmq006@gmail.com>, kernel@collabora.com,
 Tzung-Bi Shih <tzungbi@kernel.org>, alsa-devel@alsa-project.org,
 "chunxu.li" <chunxu.li@mediatek.com>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Jiaxin Yu <jiaxin.yu@mediatek.com>, Mark Brown <broonie@kernel.org>,
 linux-mediatek@lists.infradead.org, Trevor Wu <trevor.wu@mediatek.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Ajye Huang <ajye_huang@compal.corp-partner.google.com>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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

On Tue, Nov 8, 2022 at 12:05 AM N=C3=ADcolas F. R. A. Prado
<nfraprado@collabora.com> wrote:
>
>
> Some ASoC machine drivers for MediaTek platforms were not being
> registered to the module device table, preventing them to be
> automatically loaded when built as modules. This series adds the missing
> registration to the drivers.
>
>
> N=C3=ADcolas F. R. A. Prado (9):
>   ASoC: mediatek: mt2701-cs42448: Register to module device table
>   ASoC: mediatek: mt2701-wm8960: Register to module device table
>   ASoC: mediatek: mt6797-mt6351: Register to module device table
>   ASoC: mediatek: mt8183-da7219: Register to module device table
>   ASoC: mediatek: mt8183-mt6358: Register to module device table
>   ASoC: mediatek: mt8186-da7219: Register to module device table
>   ASoC: mediatek: mt8186-rt5682: Register to module device table
>   ASoC: mediatek: mt8192-mt6359: Register to module device table
>   ASoC: mediatek: mt8195-mt6359: Register to module device table

Thanks! This was on my TODO list. Whole series is

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
