Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C938E7D7C73
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Oct 2023 07:45:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1454483A;
	Thu, 26 Oct 2023 07:44:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1454483A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698299108;
	bh=v88cIuoMfKK/xscvmw4mP2AX4C1KpNxy9EGTFm/wXII=;
	h=Subject:From:To:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=VG9zK4gK96n372+g465LV08cLtzGkfuu/KLP/a11QzrXQ0p6pGXns5cd5Uh9xOar7
	 8s83HCzPkB+qfxufYlmJNqxJPYttlRpKBcCvD4FSrr8gK45Fv/X+uETvRSUZH1rTFK
	 +EueUfMwk0r9/1ZwhZAsK0oCv/TpyRAk5hvx8yFA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5ABD7F8019B; Thu, 26 Oct 2023 07:43:49 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4E776F80157;
	Thu, 26 Oct 2023 07:43:48 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6424EF80165; Thu, 26 Oct 2023 07:41:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CA005F80152
	for <alsa-devel@alsa-project.org>; Thu, 26 Oct 2023 07:41:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CA005F80152
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=f+ctfrYq
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-9ba1eb73c27so76531466b.3
        for <alsa-devel@alsa-project.org>;
 Wed, 25 Oct 2023 22:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698298907; x=1698903707;
 darn=alsa-project.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v88cIuoMfKK/xscvmw4mP2AX4C1KpNxy9EGTFm/wXII=;
        b=f+ctfrYqws041JsJmJtZzVI2v5oDr5NWDqDgTIMJ0mMKOHA7cZ1KJORIYZhQ2rc8sh
         wSB87FdwFhz/jyUOU9vpg36etQyBsNP2hzDpyhL1BFgf09QCjL8WG5iloZoNtheY6Qu0
         3z7ScBuXIWCSrOtoKnYZP3ct1qVhujvhRRtNMHudvksjP7bMXClkX2hQ57yMA6GSqqnW
         glVTkeeibfL4HW37OZDbE3+aDAKhOwkeI6iRtxmnivFgl2OnWcX1VRYAuperoHFeTxsX
         t1bRujy4NcMk3KA84+ZcMTsRqWm7hQu71kqC48wx0/bOKfN3T3bGRu9HsKdGvyNr2qE2
         lIKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698298907; x=1698903707;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=v88cIuoMfKK/xscvmw4mP2AX4C1KpNxy9EGTFm/wXII=;
        b=GCAeDQpMOG7DIjoOCukDQukuN6AAyn9at97vpzoW6qd4ZhgKIGiLHz+TtILxXtmOyI
         224U6Dv78qKWFqh5ut6MJ4G2gmRAKcBIB3vlDVKAQR3pwKi0Ou4C6Sp9oIL4XFz4bI26
         h2D8MucluCxUaoVDfdaTnYP20TaoT9DALo4UL2fkyuHGm/jt6xxPfAJMWWIB2toLGFOv
         Rd3Pk11HAq3qLnm+MgPB4K1LcmT5+R9PkRAKsooyTVRS6uwfFobaKDKvlmzZmHMbaOVI
         u5G8vQgTuh1lmi/pUTEYXus42fctYRatsGyA8S8Y8Jn1FUGeKDxnhUOjOZ5GTpEIh/LZ
         D49g==
X-Gm-Message-State: AOJu0YxwDvzRM82fTKxmULOXZBpZRMKB2UUPjTVlsUbL03oIXaAQK2w8
	6Tti4kwuGYIpxbAnqWHiX/A=
X-Google-Smtp-Source: 
 AGHT+IE/n0OoxifurTDgldQZqpLM8AuCp+gQ7fUFj2/TTGB+7QsX1WZ+ulAcFK2YO66Nv03gm0DH7A==
X-Received: by 2002:a17:907:9286:b0:9b9:facb:d950 with SMTP id
 bw6-20020a170907928600b009b9facbd950mr13315954ejc.72.1698298907263;
        Wed, 25 Oct 2023 22:41:47 -0700 (PDT)
Received: from ?IPv6:2001:a61:3456:4e01:6ae:b55a:bd1d:57fc?
 ([2001:a61:3456:4e01:6ae:b55a:bd1d:57fc])
        by smtp.gmail.com with ESMTPSA id
 h11-20020a1709063b4b00b009b9aa8fffdasm10997701ejf.131.2023.10.25.22.41.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Oct 2023 22:41:46 -0700 (PDT)
Message-ID: <c44c8c13a91a695d758154335b38488c71de1d1c.camel@gmail.com>
Subject: Re: [RFT PATCH 02/17] ASoC: codecs: adau1373: Handle component name
 prefix
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela
 <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Lars-Peter Clausen
 <lars@metafoo.de>, Nuno =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Banajit Goswami
 <bgoswami@quicinc.com>, Oder Chiou <oder_chiou@realtek.com>, Matthias
 Brugger <matthias.bgg@gmail.com>,  AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Sylwester Nawrocki
 <s.nawrocki@samsung.com>, Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,  alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org,  patches@opensource.cirrus.com,
 linux-arm-kernel@lists.infradead.org,  linux-mediatek@lists.infradead.org,
 linux-tegra@vger.kernel.org
Date: Thu, 26 Oct 2023 07:41:45 +0200
In-Reply-To: <20231023095428.166563-3-krzysztof.kozlowski@linaro.org>
References: <20231023095428.166563-1-krzysztof.kozlowski@linaro.org>
	 <20231023095428.166563-3-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
Message-ID-Hash: 2OWRWZIIPPADVXNX3RVO3XMSYAHMR55H
X-Message-ID-Hash: 2OWRWZIIPPADVXNX3RVO3XMSYAHMR55H
X-MailFrom: noname.nuno@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2OWRWZIIPPADVXNX3RVO3XMSYAHMR55H/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 2023-10-23 at 11:54 +0200, Krzysztof Kozlowski wrote:
> Use snd_soc_dapm_widget_name_cmp() helper when comparing widget names,
> to include also the component's name prefix.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

Reviewed-by: Nuno Sa <nuno.sa@analog.com>

> =C2=A0sound/soc/codecs/adau1373.c | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/sound/soc/codecs/adau1373.c b/sound/soc/codecs/adau1373.c
> index b0ab0a69b207..3582c4b968a0 100644
> --- a/sound/soc/codecs/adau1373.c
> +++ b/sound/soc/codecs/adau1373.c
> @@ -834,7 +834,7 @@ static int adau1373_check_aif_clk(struct snd_soc_dapm=
_widget
> *source,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0else
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0clk =3D "SYSCLK2";
> =C2=A0
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return strcmp(source->name, cl=
k) =3D=3D 0;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return snd_soc_dapm_widget_nam=
e_cmp(source, clk) =3D=3D 0;
> =C2=A0}
> =C2=A0
> =C2=A0static int adau1373_check_src(struct snd_soc_dapm_widget *source,

