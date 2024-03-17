Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 756EA87DF75
	for <lists+alsa-devel@lfdr.de>; Sun, 17 Mar 2024 20:00:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E055A2392;
	Sun, 17 Mar 2024 20:00:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E055A2392
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1710702017;
	bh=eEcx4nr4CbIEDZ73FBW/lYmpnu9poaFi2q+u8EJ46Mw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=BxnV6esXHZmQIeOjFdTWJI8X4IUF9+6wkC/12IQ3eoovW+KyuG4muqFetZiSalGs4
	 WLF67xtveOJoI4Ub1bLOBhB2NsM5IKxk4XrdABrXbrPoWEYihYic2rl525Dx04PS86
	 HYDfnRCEDAPyom+s6nOJgbGy1nvyEDWcOjqcYeLc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 10BA5F805A0; Sun, 17 Mar 2024 19:59:44 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 346E1F80588;
	Sun, 17 Mar 2024 19:59:44 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 227DBF804E7; Sun, 17 Mar 2024 19:59:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E8EDFF80088
	for <alsa-devel@alsa-project.org>; Sun, 17 Mar 2024 19:59:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E8EDFF80088
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=uCBEPEV1
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 39F1F60B8D
	for <alsa-devel@alsa-project.org>; Sun, 17 Mar 2024 18:59:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EE6BC43142
	for <alsa-devel@alsa-project.org>; Sun, 17 Mar 2024 18:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710701971;
	bh=eEcx4nr4CbIEDZ73FBW/lYmpnu9poaFi2q+u8EJ46Mw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=uCBEPEV1gr+2IkxufoufHbKV/Hwg8Y0wWD+OHizYnQdEXMNQHS/RcdRclYDy1A8EW
	 bi8poEYqV/Zk/Po7wyoIpSas+hqxz6b36Q53fjyl12TDIaPB3KtS0ctQPNNNAUW9L7
	 nfODjhUhRNY1P2IAnjc4Oy2uJQlM/S/DmZhqi/e/b2rnUi8PexVO7pMzHfD/fHA6g0
	 DO39BeyqFEMLWrjHdy25PaxBm1+p+J+/MvRuSvldYt63SPbLUo667c+yIxKU2dNJsg
	 dsCAKiI2fqkJmC5NR3qBFpJj4ulkL7bfGIsF8YS4MoId8KklwTeLpLL9M2dQi69tQd
	 mW7DE2rJ22mSw==
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-513d717269fso3385201e87.0
        for <alsa-devel@alsa-project.org>;
 Sun, 17 Mar 2024 11:59:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXo9qP4PrNk6LVfr26Wi6rKz8XXlaWPQHdjAhyS63HP5Q8k+36uBwPriCxJNw4YCOQBbItCTrdYGVDfBMZhYLMndoPjqogpOmC0nWA=
X-Gm-Message-State: AOJu0Yzsd2khQkf2lT32vvguyd7m60ABQeeGhDmWnvjgJW4zwqjREU45
	pnTgOxl8IPLqQw8lySOJX01bQ7uatY1lsW6w9SqpkyEbgGdd39K0DAibK7nnOU9C5aWNEHqbjCq
	rQyXNM0/r9+2ZUQKHZ9pno7eRnw==
X-Google-Smtp-Source: 
 AGHT+IHXmDQcoBpEG7P/jd72N8SjRsw/4nVttA2xS0/VB/Czg98Z6kMH1XdW6JGvB1L6zB1PG/og5ahKug3PnUqqfnM=
X-Received: by 2002:a05:6512:606:b0:513:cd77:4a88 with SMTP id
 b6-20020a056512060600b00513cd774a88mr6175517lfe.29.1710701969239; Sun, 17 Mar
 2024 11:59:29 -0700 (PDT)
MIME-Version: 1.0
References: <20240313110147.1267793-1-angelogioacchino.delregno@collabora.com>
 <20240313110147.1267793-20-angelogioacchino.delregno@collabora.com>
In-Reply-To: 
 <20240313110147.1267793-20-angelogioacchino.delregno@collabora.com>
From: Rob Herring <robh@kernel.org>
Date: Sun, 17 Mar 2024 12:58:58 -0600
X-Gmail-Original-Message-ID: 
 <CAL_Jsq+zDc3vwAJHgWwSvauXr2-1NMbbznbj3v1PyMv+9UA5wA@mail.gmail.com>
Message-ID: 
 <CAL_Jsq+zDc3vwAJHgWwSvauXr2-1NMbbznbj3v1PyMv+9UA5wA@mail.gmail.com>
Subject: Re: [PATCH v3 19/22] ASoC: dt-bindings: mt8192: Document
 audio-routing and dai-link subnode
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: broonie@kernel.org, wenst@chromium.org, lgirdwood@gmail.com,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	matthias.bgg@gmail.com, perex@perex.cz, tiwai@suse.com,
	trevor.wu@mediatek.com, maso.huang@mediatek.com,
	xiazhengqiao@huaqin.corp-partner.google.com, arnd@arndb.de,
	kuninori.morimoto.gx@renesas.com, shraash@google.com, amergnat@baylibre.com,
	nicolas.ferre@microchip.com, u.kleine-koenig@pengutronix.de,
	dianders@chromium.org, frank.li@vivo.com, allen-kh.cheng@mediatek.com,
	eugen.hristev@collabora.com, claudiu.beznea@tuxon.dev,
	jarkko.nikula@bitmer.com, jiaxin.yu@mediatek.com, alpernebiyasak@gmail.com,
	ckeepax@opensource.cirrus.com, zhourui@huaqin.corp-partner.google.com,
	nfraprado@collabora.com, alsa-devel@alsa-project.org,
	shane.chien@mediatek.com, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
	kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: NNOBGPWXSFC5EQGFP6BADB6O67ZYC6EP
X-Message-ID-Hash: NNOBGPWXSFC5EQGFP6BADB6O67ZYC6EP
X-MailFrom: robh@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NNOBGPWXSFC5EQGFP6BADB6O67ZYC6EP/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Mar 13, 2024 at 5:02=E2=80=AFAM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Document the dai-link subnodes and the audio-routing property, allowing
> to describe machine specific audio hardware and links in device tree.
>
> While at it, also deprecate the old properties which were previously
> used with the driver's partially hardcoded configuration.
>
> Also, since describing machine specific audio hardware and links replaces
> the now deprecated old logic doing the same in a driver hardcoded fashion=
,
> it is not allowed to have both the old and new properties together.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>  .../sound/mt8192-mt6359-rt1015-rt5682.yaml    | 139 ++++++++++++++++--
>  1 file changed, 129 insertions(+), 10 deletions(-)

Reviewed-by: Rob Herring <robh@kernel.org>
