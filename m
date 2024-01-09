Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E624827D75
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Jan 2024 04:45:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5DAFC82C;
	Tue,  9 Jan 2024 04:45:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5DAFC82C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1704771911;
	bh=1IirnRXaj1MUEQGJO0zbDoWzQpnWpqMe52m35Flc2QA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=bo8R0iZs8xwcq5hEXruY1a94g7uB85YdrsswSbqlNL9DiEQaAMrRuy6yxoLzeFe9a
	 nEQKWknlSZKPeaG1cmi565nNebzWryLN613GYFOkj1UzqkkOVOdsjrL7SO4Wlku2h5
	 JO9D3hLMAmsRS3yDaIkEDtFfnuX/LT8UKkA+A8kE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E50D1F8059F; Tue,  9 Jan 2024 04:44:38 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 74D2AF8057F;
	Tue,  9 Jan 2024 04:44:38 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3ACFFF80254; Tue,  9 Jan 2024 04:44:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1076CF8014B
	for <alsa-devel@alsa-project.org>; Tue,  9 Jan 2024 04:44:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1076CF8014B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=Ex1tChwu
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2cc7b9281d1so32136121fa.1
        for <alsa-devel@alsa-project.org>;
 Mon, 08 Jan 2024 19:44:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1704771866; x=1705376666;
 darn=alsa-project.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1IirnRXaj1MUEQGJO0zbDoWzQpnWpqMe52m35Flc2QA=;
        b=Ex1tChwucnsAeJsIEnOchikxV553hcw7Z2BfSoTp/8jooH9slpNkOlWQvu1ThdBafm
         SwHP3pZnOIo8udhVdTXaIlTgmSIot+ioCzbmw0lL4y0hXh/87IRAQfmTdGG/JTSpIFfJ
         f/tq6Gi/XoxblT2MM3VkuuAd2tcxAgGarAqW8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704771866; x=1705376666;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1IirnRXaj1MUEQGJO0zbDoWzQpnWpqMe52m35Flc2QA=;
        b=hWioYyw0NUNgo4oGLKvtdSAreDYK2kEBMPbdQ8CVn3a3/k9mbZjsbZ1QqYiz9l4QqD
         wn37gj6/5Vw5RjY9xDs0UXzM/r0Twr9XurjP7+6ssseYz0NvEgWpTEHsZ6vvcfx8yiPa
         aR+LTH8Ko3lwDd66VvGdS4/EneHeixz0YkfOJOBHSaPjY1JllCn0Xuy9pK5lRDojKpiG
         wyzUZyH4XnH//+o5NTKmq2ca7nXnaa//6TIdLR8o6Z4WJP0kEiKpw8K0bzDzjXxE0HKp
         UbFFXBahh2MBqxPQuzbIsWvRDLZR9myINSB13FcpTujYC9355ft2BCgj/DZfK0YjxkXD
         TgTA==
X-Gm-Message-State: AOJu0YxM1ayx6xsrBuBeXExUbsr3vX0af2b1o8xsfIc19BvAGTVhPA1/
	T9fzbrYg3q6eqERJSq/QcPvvKnjvxTMuCqeiZ3N7O/4kmf8u
X-Google-Smtp-Source: 
 AGHT+IHYdJnZJ+ia5j3MDP+U7FWEJutaJ/CAtYrvXrMKolc4lrDjHs3uboOZeTMPAaG800e+FJBUDwDxKqaytC01MRg=
X-Received: by 2002:a2e:9b18:0:b0:2cc:7718:edfe with SMTP id
 u24-20020a2e9b18000000b002cc7718edfemr2040200lji.41.1704771865390; Mon, 08
 Jan 2024 19:44:25 -0800 (PST)
MIME-Version: 1.0
References: <20240108204508.691739-1-nfraprado@collabora.com>
In-Reply-To: <20240108204508.691739-1-nfraprado@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 9 Jan 2024 11:44:14 +0800
Message-ID: 
 <CAGXv+5G_7OA8m=KENsLbu3wig9D_LOA+oWswQK34wEHtzHXOhQ@mail.gmail.com>
Subject: Re: [PATCH] ASoC: mediatek: mt8192: Check existence of dai_name
 before dereferencing
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
Cc: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 kernel@collabora.com,
	Jaroslav Kysela <perex@perex.cz>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
	=?UTF-8?Q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado_via_Alsa=2Ddevel?=
 <alsa-devel@alsa-project.org>,
	Rob Herring <robh@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: UG5OSLYGCNRUOQ4EWTPCM3KZKXXJ472F
X-Message-ID-Hash: UG5OSLYGCNRUOQ4EWTPCM3KZKXXJ472F
X-MailFrom: wenst@chromium.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UG5OSLYGCNRUOQ4EWTPCM3KZKXXJ472F/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Jan 9, 2024 at 4:47=E2=80=AFAM N=C3=ADcolas F. R. A. Prado
<nfraprado@collabora.com> wrote:
>
> Following commit 13f58267cda3 ("ASoC: soc.h: don't create dummy
> Component via COMP_DUMMY()"), the dai_name field is only populated for
> dummy components after the card is registered. This causes a null
> pointer dereference in the mt8192-mt6359 sound card driver's probe
> function when searching for a dai_name among all the card's dai links.
>
> Verify that the dai_name is non-null before passing it to strcmp. While
> at it, also check that there's at least one codec.
>
> Reported-by: "kernelci.org bot" <bot@kernelci.org>
> Closes: https://linux.kernelci.org/test/case/id/6582cd6d992645c680e13478/
> Fixes: 13f58267cda3 ("ASoC: soc.h: don't create dummy Component via COMP_=
DUMMY()")
> Signed-off-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
Tested-by: Chen-Yu Tsai <wenst@chromium.org>

Audio now works again on my MT8192 Hayato.
