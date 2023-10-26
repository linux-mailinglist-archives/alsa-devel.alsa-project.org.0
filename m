Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 327297D7C79
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Oct 2023 07:49:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 836C87F1;
	Thu, 26 Oct 2023 07:48:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 836C87F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698299384;
	bh=rG2UysggiUwoOTUDtuwATYwEsAqlGEHP6tlUqmAyNpE=;
	h=Subject:From:To:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=g860j5psetemSXJgekBX7sAAoWqdRvsw1l34ZBE22hepLAPEhxREhOeaYDByGSRXe
	 iWhwiyE39SvQTWFi+VtUjCefty/dmpKjy28SOIaWk2iM1aqKPwOSAlmmNN+9dB+N0h
	 Z4ZghXkB13yEaoEzBCWNt1cg9mnb3yo92eViDdiI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 21752F8014B; Thu, 26 Oct 2023 07:48:52 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 51FC2F80157;
	Thu, 26 Oct 2023 07:48:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 22F71F80165; Thu, 26 Oct 2023 07:43:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E4BA4F80152
	for <alsa-devel@alsa-project.org>; Thu, 26 Oct 2023 07:43:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E4BA4F80152
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=ngRTFKj1
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-53e2dc8fa02so718346a12.2
        for <alsa-devel@alsa-project.org>;
 Wed, 25 Oct 2023 22:43:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698298998; x=1698903798;
 darn=alsa-project.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rG2UysggiUwoOTUDtuwATYwEsAqlGEHP6tlUqmAyNpE=;
        b=ngRTFKj1ZvoOh2s6tRmwU0jJ4FAnEwynSZ/tglfo/Sl1OVL6cw1WhrTZgpvY0AehZ3
         qKOLw9f/M4LGoQ66VzmXwp1hStPlY3vZ7olRZndK2cgzSLcVw3BJNoixbnOfonq3/8kX
         BI/RusTXqmw/B1XvvhtHZqSL+sc1/0KkPRwn8b6PybclkNx5e6zKY2dFG5a30CbkjScy
         yK06jnedAiu5bXt0SCorIGPRDMTTDkCyNH5JMfP6E4Ah5gF6Ep3NvGhc/4oF/J1zDfd8
         zaVyovMH2Z1j7NEt0vrbbd1B5CoodO7/BTZWCMvKnGlEEXjwDHji24HUetvBjSAFOuqG
         AQcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698298998; x=1698903798;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rG2UysggiUwoOTUDtuwATYwEsAqlGEHP6tlUqmAyNpE=;
        b=JM5qTvsJabFDdg58p8px8EM0Nqh0k4SYtreyHvhbV4VCgzedMCxt3HIXjEWoD2/t06
         DnyzIGy6yfFjRLuYDMhJSd1ppfm1WEXeX14QEB4JKzGlQT19/D9VpO+7UF2vt6pxPuu8
         iDhnTx80RE211TUgWdoz4iog7xRFs2O4joTyTw9FnvzO+rcZKSTJrp2lj5t6GEVdSCKo
         F8P3W0+G37PITulfGHs2vS7wRl+cbqJWutewY0L2DeVGCpZNZwxvxXPmaYy5o3+dGyiw
         x1wZ89r26VIk6WoSs7gUgJD83ZIA246djecbKDO3IrgyY3vlLus7KVYeY3x9i8SFt13P
         nDfQ==
X-Gm-Message-State: AOJu0YxTSJl0K3kQxKy19bwtQzE2KN8dIv40Rf6ZSWN1Hsx9fwz1E0eD
	a1sdJoS5QusLz4MyRl3p8+g=
X-Google-Smtp-Source: 
 AGHT+IE2Vvk6/8UrLk+Fqp68uEGIMn/w0ixG329AL4BRaLr6Z9i9Tbw3TAkzOcjxqMEkG/Sa24yY7g==
X-Received: by 2002:a17:907:7285:b0:9b2:be5e:7545 with SMTP id
 dt5-20020a170907728500b009b2be5e7545mr13394942ejc.36.1698298997475;
        Wed, 25 Oct 2023 22:43:17 -0700 (PDT)
Received: from ?IPv6:2001:a61:3456:4e01:6ae:b55a:bd1d:57fc?
 ([2001:a61:3456:4e01:6ae:b55a:bd1d:57fc])
        by smtp.gmail.com with ESMTPSA id
 y19-20020a170906519300b009adc7733f98sm11085906ejk.97.2023.10.25.22.43.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Oct 2023 22:43:17 -0700 (PDT)
Message-ID: <a9bb417341ee2f13c63f13afc1a5a3be330dcf07.camel@gmail.com>
Subject: Re: [RFT PATCH 03/17] ASoC: codecs: adav80x: Handle component name
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
Date: Thu, 26 Oct 2023 07:43:15 +0200
In-Reply-To: <20231023095428.166563-4-krzysztof.kozlowski@linaro.org>
References: <20231023095428.166563-1-krzysztof.kozlowski@linaro.org>
	 <20231023095428.166563-4-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
Message-ID-Hash: PUX4BHDGGLF6L6OYNL5KTYZUUBA5HE5C
X-Message-ID-Hash: PUX4BHDGGLF6L6OYNL5KTYZUUBA5HE5C
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PUX4BHDGGLF6L6OYNL5KTYZUUBA5HE5C/>
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

> =C2=A0sound/soc/codecs/adav80x.c | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/sound/soc/codecs/adav80x.c b/sound/soc/codecs/adav80x.c
> index bb08969c5917..c8c0fc928211 100644
> --- a/sound/soc/codecs/adav80x.c
> +++ b/sound/soc/codecs/adav80x.c
> @@ -229,7 +229,7 @@ static int adav80x_dapm_sysclk_check(struct snd_soc_d=
apm_widget
> *source,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0return 0;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
> =C2=A0
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return strcmp(source->name, cl=
k) =3D=3D 0;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return snd_soc_dapm_widget_nam=
e_cmp(source, clk) =3D=3D 0;
> =C2=A0}
> =C2=A0
> =C2=A0static int adav80x_dapm_pll_check(struct snd_soc_dapm_widget *sourc=
e,

