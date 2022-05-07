Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F34F51E5A8
	for <lists+alsa-devel@lfdr.de>; Sat,  7 May 2022 10:44:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DA9F1185B;
	Sat,  7 May 2022 10:43:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DA9F1185B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651913041;
	bh=yOoWgA/38A+siDsvmOPZWw5WWH9WPv66A4z9Pdm3Pus=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=g20Z4ucgzPom3VNvjRLA6UlpQT13hZ5Z8zF/cOD4/eIAyGKmdHj6qsjB1ChA90YNX
	 2fkXbiPdqGpBpWI0gtx9m33h7c7gAeY9BuJLt8hT9HHfaBDGdgQkQqSmoe8CsZJ5mB
	 6XYzyBaR73MVB2YsFTUWy6VCUQNgS/n2jmGwHtl0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 49885F80054;
	Sat,  7 May 2022 10:43:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0855EF80152; Sat,  7 May 2022 10:43:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1B675F800D3
 for <alsa-devel@alsa-project.org>; Sat,  7 May 2022 10:42:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1B675F800D3
Received: from mail-yw1-f179.google.com ([209.85.128.179]) by
 mrelayeu.kundenserver.de (mreue010 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MSLAe-1nP6PO0dJo-00SboV for <alsa-devel@alsa-project.org>; Sat, 07 May 2022
 10:42:54 +0200
Received: by mail-yw1-f179.google.com with SMTP id
 00721157ae682-2f7c424c66cso102868877b3.1
 for <alsa-devel@alsa-project.org>; Sat, 07 May 2022 01:42:53 -0700 (PDT)
X-Gm-Message-State: AOAM532izYpP0KHHVkEDNuUWShOIMJVaN9zfhJmHa2hp1ZwdQfchMj3r
 cIHvOnLCN0X36NYQ3ZQLouLZQpQcFeDXohTSOmk=
X-Google-Smtp-Source: ABdhPJz41aUj/+pW1sZWxLrXajtnNs3IdnmCkPvNJurEZtj0IpvMA1ea1Z+O8FJy68YG/6GjY7AECeBWF00pOfGqm4g=
X-Received: by 2002:a81:9213:0:b0:2f6:eaae:d22f with SMTP id
 j19-20020a819213000000b002f6eaaed22fmr6217535ywg.249.1651912972980; Sat, 07
 May 2022 01:42:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220507021424.12180-1-yuehaibing@huawei.com>
In-Reply-To: <20220507021424.12180-1-yuehaibing@huawei.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Sat, 7 May 2022 10:42:36 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3haxtEjZL4jZ9a1xbZdEGAgG=NxDwWQ=syvQArett2Fw@mail.gmail.com>
Message-ID: <CAK8P3a3haxtEjZL4jZ9a1xbZdEGAgG=NxDwWQ=syvQArett2Fw@mail.gmail.com>
Subject: Re: [PATCH v2 -next] ASoC: mediatek: mt8195: Fix build warning
 without CONFIG_OF
To: YueHaibing <yuehaibing@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:+zZ1EUigMURtpdpVb/Ohg9LzkukXr7YtK93s/4oPMETMGjM1Di1
 Rxnh7xj+HCPxzehNAP9qe2A55yszWZhY15EyInaCMJCsWGrI6MSPqUJrQxLiGm/LMXHqVM4
 kPmw8gRUYylcPIN3cKikC/69oJrQrUYTa3YMA2M8euUre5LH6HoOmhLIVJLNVZD/lXVJPob
 FFevCkzlnu2FKwpaR9M8A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:lYTdShBKBMU=:EYSCWENI1e9HXwnXMjdvXE
 JAUTQZzvTUg6MHglVkbQDs5j3iLMZ/oIHfLGuYu0By5im3JZudAS4RucXM2hm1cmec0VN3ZSn
 jg9WGzMQqaiLGb4rbl/8Pa/27XcwQDh8C213nnBRbzYMkOsjFik/8FN6prnQNphtH0ScQ2OIo
 ba5MEZwPoOUg0p2aB7K4fvGXSF1/Add1lBluWOs1//70gsF5cFbY17h/nSaNW6pGegAcwM5aF
 DMBE7xIqsfJk/Tleh7P9uZhzi26SuE4e/9APyfbGD9Sdn3U8++ZZkgU7nxW6ywowYP7ooJ8k3
 SXQ2oABhu/P9n8LUDMtKR9Jj1+GqicfYIG/t9sEax0OqQ4aifhzy9oko3beDowWnCPsmOzXj+
 S/mYj8AVPnD+ta3jaYzvz8gjJ+QZgEIFjbrCX2sNfsl/NUGPoW6oLhTjQoj0kZ0Z4kvSptbbr
 MkEvPWgi7DGsVVFLxjDnreBmxL3h1n+wjvHXVVMuHAGTZikJwtWHM1Vw2jlhhowPTLJFga6zJ
 VTTO3Mx1vCjmLCGkXMCz/7EE/BgtNTKjGwOWTpU1idw7y4QvkGP0hYg3gf/RFgyVkAiyVxf/w
 02l7YqBFpv4wsgjFBwY39jDyalNOCFJgv3KTiU1rJRIIdWPQ5MAmOtSF0Kku2H+J5q+6Le18K
 yHbMGvjJYq7fiPtCrOiC6d1+cmg8vHDtVrOrzwMsMhlgFgQfuAbVSlWKwIXOnKVXnBLE=
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Arnd Bergmann <arnd@arndb.de>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Tzung-Bi Shih <tzungbi@google.com>, Mark Brown <broonie@kernel.org>,
 "moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>,
 Trevor Wu <trevor.wu@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
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

On Sat, May 7, 2022 at 4:14 AM YueHaibing <yuehaibing@huawei.com> wrote:
>
> sound/soc/mediatek/mt8195/mt8195-mt6359.c:1639:32: warning: =E2=80=98mt81=
95_mt6359_max98390_rt5682_card=E2=80=99 defined but not used [-Wunused-vari=
able]
>  1639 | static struct mt8195_card_data mt8195_mt6359_max98390_rt5682_card=
 =3D {
>       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> sound/soc/mediatek/mt8195/mt8195-mt6359.c:1634:32: warning: =E2=80=98mt81=
95_mt6359_rt1011_rt5682_card=E2=80=99 defined but not used [-Wunused-variab=
le]
>  1634 | static struct mt8195_card_data mt8195_mt6359_rt1011_rt5682_card =
=3D {
>       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> sound/soc/mediatek/mt8195/mt8195-mt6359.c:1629:32: warning: =E2=80=98mt81=
95_mt6359_rt1019_rt5682_card=E2=80=99 defined but not used [-Wunused-variab=
le]
>  1629 | static struct mt8195_card_data mt8195_mt6359_rt1019_rt5682_card =
=3D {
>       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>
> Since all users of this driver do need CONFIG_OF anyway, there is no
> need to save a few bytes on kernel builds while CONFIG_OF disabled, so
> just remove the #ifdef to fix this warning.
>
> Fixes: 86a6b9c9dfff ("ASoC: mediatek: mt8195: add machine support for max=
98390 and rt5682")
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
> v2: remove #ifdef block as Arnd suggested

Looks good to me,

Acked-by: Arnd Bergmann <arnd@arndb.de>
