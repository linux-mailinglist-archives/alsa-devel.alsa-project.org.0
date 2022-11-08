Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CC844620E18
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Nov 2022 12:05:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5CC3483A;
	Tue,  8 Nov 2022 12:04:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5CC3483A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667905506;
	bh=XaBdxRjUZjWiYi/UU6XdULmnAXVS96JTxTikA1au8DU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=shDOBucTRqEOvYF890lvfAqHhEuaq5K/AY8v46ud486KANFrfQaTg7/vEZYyRXPnD
	 Vh9TWhIvOcxz7bGf0wXGGZSFWyfRODTs9KxdIPbaqYysR/YdtswMd185k4ATD7ddjw
	 8mKmdrXEgjxXA/PmHj0C6I371J5gtArI6RB9IHMU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DA78CF8020D;
	Tue,  8 Nov 2022 12:04:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ED7E2F801D8; Tue,  8 Nov 2022 12:04:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-vs1-xe2e.google.com (mail-vs1-xe2e.google.com
 [IPv6:2607:f8b0:4864:20::e2e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CA361F8016A
 for <alsa-devel@alsa-project.org>; Tue,  8 Nov 2022 12:04:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CA361F8016A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="ZkzY5ETt"
Received: by mail-vs1-xe2e.google.com with SMTP id 128so13275181vse.6
 for <alsa-devel@alsa-project.org>; Tue, 08 Nov 2022 03:04:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XaBdxRjUZjWiYi/UU6XdULmnAXVS96JTxTikA1au8DU=;
 b=ZkzY5ETtu0PETYIEUH10nOly3VcuJtkSlDZS4QtrJ3TMoZG09BAH7UKvNhtr6bh4EI
 KgjB+YXYUVdVddL2B+f84CKvmXVF8qoy/AF5DZ8jppLG+33w9qiiQBCNQkLY2IoGfkiV
 BkKz2ggOccQfHZpvxNc4nAQm22PLy6uKIt+SA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XaBdxRjUZjWiYi/UU6XdULmnAXVS96JTxTikA1au8DU=;
 b=mSJTTg5cfDauehtzLZGdM6baf6gOrtrzNj01UV2+zOxZSVOY7LUtLoVBJ2SyTD+e9+
 1rHNUQ7cURmjYKGGVdNo+znMPilV2Mcb42ULFQwnRw+eUhUTr96NLsn8eKHxwurpMpRY
 clMnbIQSHezMHXWu6FrhDnpcGmh1YTpUysIoHQqoKT9qU21PmwUjS6gD5dfaFnqTsSqO
 dGkGdH3PDKlOhPTcFPfCghu2FYco4NRTaxZzCbYoigifDXYWvDtw8PXeklv92DGd5mpJ
 PSzvAiR1tN6Cfr/9gvm8Ra7qLr7wzxcMkTK0QasfrES07dAvb2akvCR2sk0WJEPO2rc8
 VCtA==
X-Gm-Message-State: ACrzQf17fvcWV57ArD7s76IzHB1QQNrjkYIFIgVdzNhqoaC/eJKblWsk
 GM0qtwXRAoIUW+cyY2OsYXK9vOCHPXJmgOMu9FJVPg==
X-Google-Smtp-Source: AMsMyM6t0mPbG4ToZz5l/tO1gDfCULSYa4MknrJDh9MS6I1IEkQHqfasxxjvZuxONegx0VxazFgJwfSXzMjsEheapQg=
X-Received: by 2002:a05:6102:3c83:b0:3ac:7ce4:1bc0 with SMTP id
 c3-20020a0561023c8300b003ac7ce41bc0mr27621104vsv.65.1667905441651; Tue, 08
 Nov 2022 03:04:01 -0800 (PST)
MIME-Version: 1.0
References: <20221107160437.740353-1-nfraprado@collabora.com>
 <20221107160437.740353-9-nfraprado@collabora.com>
 <b5b61326-298c-9845-eec0-15542f096225@collabora.com>
In-Reply-To: <b5b61326-298c-9845-eec0-15542f096225@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 8 Nov 2022 19:03:50 +0800
Message-ID: <CAGXv+5EwsqE+npF4QYpwWMLb55JMGaXANxo87dyDpYwBxD-E4g@mail.gmail.com>
Subject: Re: [PATCH 8/9] ASoC: mediatek: mt8192-mt6359: Register to module
 device table
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Cc: alsa-devel@alsa-project.org, Miaoqian Lin <linmq006@gmail.com>,
 Tzung-Bi Shih <tzungbi@kernel.org>,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jiaxin Yu <jiaxin.yu@mediatek.com>,
 Mark Brown <broonie@kernel.org>, linux-mediatek@lists.infradead.org,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, kernel@collabora.com,
 linux-arm-kernel@lists.infradead.org
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

On Tue, Nov 8, 2022 at 4:44 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 07/11/22 17:04, N=C3=ADcolas F. R. A. Prado ha scritto:
> > Register the compatibles for this module on the module device table so
> > it can be automatically loaded when a matching device is found on the
> > system.
> >
> > Signed-off-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>

Tested-by: Chen-Yu Tsai <wenst@chromium.org>
