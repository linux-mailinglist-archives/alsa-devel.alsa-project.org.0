Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 69D41620E4A
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Nov 2022 12:10:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 05089868;
	Tue,  8 Nov 2022 12:09:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 05089868
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667905845;
	bh=xcl801rNi7Jh6Jo/hu/Jbz9lZkngLXNu9cMkPtXUrh8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UbYesUDVp2eWJgc6haeyL9QJteeSsm3jv0h3miRShjYxnPMqKBk2E9kgnr9+V33E2
	 H9zrB8KgcfyQdFeprzbp0+KvijYGYjacgpwgQ9II3YpUsHrDJNiQJAob0qREub2EX4
	 x4WHmXJw7akfj8LDQCKoTB8Zm+Ys3M+Im90CRE3E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8D29EF8016A;
	Tue,  8 Nov 2022 12:09:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0317AF801D8; Tue,  8 Nov 2022 12:09:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-ua1-x933.google.com (mail-ua1-x933.google.com
 [IPv6:2607:f8b0:4864:20::933])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C5475F800EC
 for <alsa-devel@alsa-project.org>; Tue,  8 Nov 2022 12:09:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C5475F800EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="ZHUwRUHM"
Received: by mail-ua1-x933.google.com with SMTP id i16so4691499uak.1
 for <alsa-devel@alsa-project.org>; Tue, 08 Nov 2022 03:09:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xcl801rNi7Jh6Jo/hu/Jbz9lZkngLXNu9cMkPtXUrh8=;
 b=ZHUwRUHMlsd+uune7sAXQUqlyoGj17Cph+iZZ0v3cRtb0ZZfwNsfvleGyTzasdKFXI
 QQ5BmiwQJoxP5/GrJF2+TxE0RkhKKX1mgOBOPP/3neMswl6d8ENmV8rZJebfekhajTuV
 xhwoyHRDFghPMry1bA8wATRGJyA8JkSuwUaNU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xcl801rNi7Jh6Jo/hu/Jbz9lZkngLXNu9cMkPtXUrh8=;
 b=NvCgAy1Hb5S7UHHcO14ahSTtOfBm/bBh1L+tLUbTTNZneiluDnJOzUmjy9TcmyxxqR
 YFXizFUe75PhVo0Ft8RxLuKVABcC4gdkB60ToCYLpQIOtQl9p1DZ1c1n6o7SoYe2jqAq
 4OPI8tVHu/Ytp0+ihx6iZjPATdImOEHaDMGLxhFqu069+voHWZOrwWGb9wnNIj028I6+
 ML4Z/q71WEE4jkrZSFgKA6xGrfMk1ySJs6AcX4arCh3N2v7JCrMOzd36vtDbHL6ENHAD
 0ddegOGcqY5sWeaLZnxuFVHvZ3HYYDylXVaUP6IHEMm5llel4bw9EPbSOmhKWe7rZlLH
 DZUw==
X-Gm-Message-State: ACrzQf0mrfuG7/ZNJJSCa2SxCdGOn+vtBhabjypLux4EB2vk1t7/6iEf
 Wb3vVKltHpDB73+bNyCAWottCf9kfF6eS8bCO7sP5A==
X-Google-Smtp-Source: AMsMyM6sjG+3Ik/dtstkJiPnbQ2Nxhh/biLDiEKU7uJHUe6uWGF9l33bHbxbqAeo3fH4zVwtXXQY39IBCfY5SWIe9D0=
X-Received: by 2002:ab0:a95:0:b0:3ad:bbe7:e134 with SMTP id
 d21-20020ab00a95000000b003adbbe7e134mr16528144uak.43.1667905779999; Tue, 08
 Nov 2022 03:09:39 -0800 (PST)
MIME-Version: 1.0
References: <20221107160437.740353-1-nfraprado@collabora.com>
 <20221107160437.740353-10-nfraprado@collabora.com>
 <2f2bdebf-8566-7740-733a-79c6e1938c84@collabora.com>
In-Reply-To: <2f2bdebf-8566-7740-733a-79c6e1938c84@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 8 Nov 2022 19:09:29 +0800
Message-ID: <CAGXv+5EE6OjKcki+40nKLs6wz6iRybpoxD1X4gJ+Z1CDHomtvg@mail.gmail.com>
Subject: Re: [PATCH 9/9] ASoC: mediatek: mt8195-mt6359: Register to module
 device table
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Cc: alsa-devel@alsa-project.org,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 linux-mediatek@lists.infradead.org, Trevor Wu <trevor.wu@mediatek.com>,
 Tzung-Bi Shih <tzungbi@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 kernel@collabora.com, linux-arm-kernel@lists.infradead.org
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

On Tue, Nov 8, 2022 at 4:43 PM AngeloGioacchino Del Regno
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

The module was automatically loaded.
