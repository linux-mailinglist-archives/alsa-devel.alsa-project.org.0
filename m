Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F17286BF74
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Feb 2024 04:26:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3700182C;
	Thu, 29 Feb 2024 04:26:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3700182C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709177185;
	bh=URSVAvnamrUIMZvqYHj/KzfXDvU7CZtyXmsItvlHW/g=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Kkbg4nWvOELXL6MGs8f/7BnytNUACjS0M+zzuQDRrzKH5qeWKJTbmJF8jssaKeDhk
	 G9QckVvrW1XHXnKgg2ZKHs7Kog2B2Hrc6fNg/EszojjSh6vTgre1FPHuxWF6bq4AbA
	 ar5PicU1T77ryxm4rt7P9Fy43ZGutIVLBEr3BJEw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2E10FF805AD; Thu, 29 Feb 2024 04:25:50 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7A64DF80588;
	Thu, 29 Feb 2024 04:25:50 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 54D4CF801C0; Thu, 29 Feb 2024 04:25:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0E145F80088
	for <alsa-devel@alsa-project.org>; Thu, 29 Feb 2024 04:25:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0E145F80088
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=GBIWRlag
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2d240d8baf6so5129181fa.3
        for <alsa-devel@alsa-project.org>;
 Wed, 28 Feb 2024 19:25:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1709177142; x=1709781942;
 darn=alsa-project.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=URSVAvnamrUIMZvqYHj/KzfXDvU7CZtyXmsItvlHW/g=;
        b=GBIWRlagUSid5xSZoMcTyeu1hA10LLgapBOHEP3UK1tHg89f7JKMQLJApldvBOWW+M
         JrFCT068iL1YbrgGrO1GK9mGjLpmQ3Bfow8s047lfbSmzR4kKzMjEKDPkRKIbeWK5Tu8
         A26NppppvR4nQXwnVgJf9VFtqRsPTgwD3oKHM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709177142; x=1709781942;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=URSVAvnamrUIMZvqYHj/KzfXDvU7CZtyXmsItvlHW/g=;
        b=GxROavQzzG2cKg2sluCYYhCfIzUlyxxx6PQuQTkJic82xEgdgRp2TJWL95qUwm3fkE
         aGqCQrqsOnDJhj1MQ084ABPvFnjiQgVwPIsKWi6hDgCaLyvAOimF8p6DJNjLXfinR1tK
         N+XevDwhHik0Oy7kexk0zvThlpX/oSAUWDsDTR1J6D66e6tgPXzRRu9bEVeKxRWQsG+e
         biQByX0zNM06RoD65Qgb7IVqP0teewaaxYmlf1PaJGc8hU7kn7DcFiJSuV/z05DfFSLJ
         U4wlRiHTULYVfwaRZjqeDtq8/1bWRfF4LRMQq8wkTpPfrCBAoasKQMEquQsJa7ltl484
         ZLiQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVaT+o/+fGlkvP4f6rPjvp8rmj9iKqzIz0UhLjDStyGb2nDBRUL6Kd/Z5U9Xs1jmvbz4KA/aSJTGUhB2sI0/ZPRqodYZ74fEAfXmsI=
X-Gm-Message-State: AOJu0YwGaQKf6vEvl9jOrLOLsrX/TIL/e3ciVudDX4VJZLfeK+oPA6G4
	UM7YprRdLdF3W78NG4p+Laagh6sOxVkp+wY7a1vIEsV4hzqKEnRCnLSmtXybjSwU+xUvFATTDcy
	gaJE1xjZC0GShpxgsMfmm1SgGDSyj7mSZF9tN
X-Google-Smtp-Source: 
 AGHT+IF6HtrFqiF4ILXIhOeoglLnKyYMIt97o4GxwpCNIyH7ScABce8rbUiq2DMajV+r4BPBHpxVsoL7H4u3odSmJ9Q=
X-Received: by 2002:ac2:597b:0:b0:512:ba41:51f with SMTP id
 h27-20020ac2597b000000b00512ba41051fmr425568lfp.50.1709177142115; Wed, 28 Feb
 2024 19:25:42 -0800 (PST)
MIME-Version: 1.0
References: <20240227120939.290143-1-angelogioacchino.delregno@collabora.com>
 <20240227120939.290143-3-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240227120939.290143-3-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 29 Feb 2024 11:25:31 +0800
Message-ID: 
 <CAGXv+5Hpv323oGAr_t6C=akNybypPUYO31ez2rFD2oCRs3O8GQ@mail.gmail.com>
Subject: Re: [PATCH 02/22] ASoC: mediatek: mt8192-afe-pcm: Simplify with
 dev_err_probe()
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, robh@kernel.org,
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
Message-ID-Hash: 24G5XZROV6K6TZWHEL4376FMYCJ6QOHJ
X-Message-ID-Hash: 24G5XZROV6K6TZWHEL4376FMYCJ6QOHJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/24G5XZROV6K6TZWHEL4376FMYCJ6QOHJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Feb 27, 2024 at 8:10=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Simplify the probe function by switching error prints to return
> dev_err_probe(), lowering the lines count; while at it, also
> beautify some messages and change some others' level from warn
> to error.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
