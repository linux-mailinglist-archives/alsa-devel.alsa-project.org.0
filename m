Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BA1FF620E41
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Nov 2022 12:09:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 55101852;
	Tue,  8 Nov 2022 12:08:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 55101852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667905772;
	bh=x8DK9DM/Joeyp25Jhq2KddrijoW7OgJ/0JO/zDAQJYg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VtsQNUu33gNFuadcjwRLIc5tcHaRlgdekC2fnOdkiwW30lFuECKXLX5rjd6G3deM8
	 vN9v/QS2fvOiOI8t4MOJIXNVLUULnc+2o7ehF5ILJ+OxfFhBciCCX6n4CcC8eybWhP
	 4BfjZI0oTbMc8edSHLm6fXvJyfnrGjfViC4ciL+A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EA32DF800EC;
	Tue,  8 Nov 2022 12:08:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E85EFF801D8; Tue,  8 Nov 2022 12:08:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-qv1-xf31.google.com (mail-qv1-xf31.google.com
 [IPv6:2607:f8b0:4864:20::f31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A6544F8016A
 for <alsa-devel@alsa-project.org>; Tue,  8 Nov 2022 12:08:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A6544F8016A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="TF3AHNNg"
Received: by mail-qv1-xf31.google.com with SMTP id lf15so9552256qvb.9
 for <alsa-devel@alsa-project.org>; Tue, 08 Nov 2022 03:08:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=x8DK9DM/Joeyp25Jhq2KddrijoW7OgJ/0JO/zDAQJYg=;
 b=TF3AHNNgNmarMWCmKT2AxYiRqmkKw+uexQPQmFLX5fXEDsnWkPR86A+jxYLcTD1Lsa
 MIjNCE8srNStKLl3eDfGlhooKcjNJP2Q8pPuHKMBBLMAhTkYGn/V7O6NediSHfb3erH5
 R5hsTLUAHena8ne63j8sqGMVTwkpNmKgs4OnA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=x8DK9DM/Joeyp25Jhq2KddrijoW7OgJ/0JO/zDAQJYg=;
 b=Bqvqa6Pi8yjQeOc6f15eAQ34Ss1m42aJ3Jo1zQEfmg2QoX/g3/PhklcNNAzfsNTpEM
 beby2kUHf33OoB1kvrshodlSxurg1wQZygjTTaE4kwOFIDWhtdw/wgJvf0HcBioVlgBk
 8nlTJpWiPx7oIG1YNzpb18eOJbOcsUw9diCSEpvXwmXgHQjhyyM5V4TYuOPdiG0unJE5
 4n4D9VZSJXnVHuCJjHXoWO8FfDsls049vE/STzsFxwDxzloFP8ldGpyXsq9TLLqUUSCa
 +RVB/wia02tlGIuR91tMdTnrOre7wO9FXu+EChZakamtWZwl1jCqoeiGE86jJ/w4/ACr
 ur4A==
X-Gm-Message-State: ACrzQf38LgDJiV1/ZFQACWMuXijZm3BFZ7vxMeH/mCCDxV1LHqpHAFGL
 w5qPGOU5bvEbi7/4QVMhwj4oERVxMP3E4T2hfT7hAxxwFaE=
X-Google-Smtp-Source: AMsMyM5djY2N0rMudnF2ERzIwk+3mqJ8PLMEwSyNwM/8eFgA1p1IJVrnAU5RggXbDYPpgI1QKxXoiTWAh6dBFuguGZU=
X-Received: by 2002:a1f:9116:0:b0:3a2:362b:fea9 with SMTP id
 t22-20020a1f9116000000b003a2362bfea9mr27061022vkd.11.1667905283579; Tue, 08
 Nov 2022 03:01:23 -0800 (PST)
MIME-Version: 1.0
References: <20221107160437.740353-1-nfraprado@collabora.com>
 <20221107160437.740353-6-nfraprado@collabora.com>
In-Reply-To: <20221107160437.740353-6-nfraprado@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 8 Nov 2022 19:01:12 +0800
Message-ID: <CAGXv+5Gyo_VvioV5HWabvQgX3xkM8nj3Ty8AossQgq89qmg00A@mail.gmail.com>
Subject: Re: [PATCH 5/9] ASoC: mediatek: mt8183-mt6358: Register to module
 device table
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Cc: alsa-devel@alsa-project.org, Tzung-Bi Shih <tzungbi@kernel.org>,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jiaxin Yu <jiaxin.yu@mediatek.com>,
 Mark Brown <broonie@kernel.org>, linux-mediatek@lists.infradead.org,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, kernel@collabora.com,
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

On Tue, Nov 8, 2022 at 12:06 AM N=C3=ADcolas F. R. A. Prado
<nfraprado@collabora.com> wrote:
>
> Register the compatibles for this module on the module device table so
> it can be automatically loaded when a matching device is found on the
> system.
>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Signed-off-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>

Tested-by: Chen-Yu Tsai <wenst@chromium.org>
