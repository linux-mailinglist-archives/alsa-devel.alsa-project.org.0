Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D53718F25
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Jun 2023 01:49:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E76FC20C;
	Thu,  1 Jun 2023 01:48:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E76FC20C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685576959;
	bh=zJnYNHg0UBsGBGhBv4w3bQNd1d66q5ErMdkp6yaxMbE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=JxSbP8TJZBkKVMm0vdIhw1X230wCS/p52QDT+ZUNWMe/+b3H4N27+HICt50o9KF7t
	 PLuwnxGeuqtA1ZXWp9f7G649+pVVFMAQhcw3MzpysoJ5geJemmJtGXSgmheFKtThih
	 eikRg2NZZTSQC17jTamx6fVaWSxTzLpvYvs8pKnY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 450CBF80149; Thu,  1 Jun 2023 01:48:27 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 95296F80132;
	Thu,  1 Jun 2023 01:48:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 64B86F8016B; Thu,  1 Jun 2023 01:48:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com
 [IPv6:2607:f8b0:4864:20::136])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B99E6F800C8
	for <alsa-devel@alsa-project.org>; Thu,  1 Jun 2023 01:48:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B99E6F800C8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=K9vtiLja
Received: by mail-il1-x136.google.com with SMTP id
 e9e14a558f8ab-33b0cae115bso772335ab.3
        for <alsa-devel@alsa-project.org>;
 Wed, 31 May 2023 16:48:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1685576890; x=1688168890;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ssi9hji3ougqZcnJfZaYXLr+1zSSxDjh3rVcPrdEtNo=;
        b=K9vtiLjauLAheH/706FVQchuFhyZnP5Lrpl3x/r/LZcYoWfDbldHhY6Pg0wiMMk34L
         FiVrxU1jrZsvA7ha/w7YHVnx6HTokPSvdzsfrMud0L8sX1SK/5Hp03BJU/trjdNGhSop
         PVg4MEQrq4sWRneZnpmf1yFpKHEHWQg7aCf8g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685576890; x=1688168890;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ssi9hji3ougqZcnJfZaYXLr+1zSSxDjh3rVcPrdEtNo=;
        b=RS82IrmQPiWtWdqG+LkBDJ30OgqdXlGuN8s2CY36d68dFerfH2IjQLMZVSZt/D/CbS
         wZ5pOrfKemHbuf1eb6/hLbEUkzEIxTY++U6Le7E61XfyFhMoY6i5JMXM3edsnfsLUcUe
         6qlEE7lxgLRyKc7RkaDVdjbIBtO7DBsmrg21EKVEzPomnFAWMuscn1aIADT6QLCiYPmA
         kqeCETDQL7zjTNkog+iL3nK1NWi/eyBjhbZtMUNhx9BM4ObVHkglBHIKqBE6KIF7mUN4
         kx+XCcZkOqZbDpd5Xewd+o8SNYC7T0x899crGpWuxZysJFNZJAcSenrFuwKACssFHZdT
         FE/g==
X-Gm-Message-State: AC+VfDxJ8s8xKQyfK/lMhXLDJp2omJbGzs1Wz4tR+KH1OP1Eku+7ueUM
	VlfeLYNoTNJkH1qaAQe3T5bQRpOIRoKwtx401qo=
X-Google-Smtp-Source: 
 ACHHUZ5l6bDJ8U+Z6Tmus2ASo+rC5lrdMQE7c+djoMWnCcoZCCdZ5BoJ1l4E2p6TBOpYXToj5Ti+sQ==
X-Received: by 2002:a92:d4c7:0:b0:33c:68aa:7c3b with SMTP id
 o7-20020a92d4c7000000b0033c68aa7c3bmr2388105ilm.25.1685576889738;
        Wed, 31 May 2023 16:48:09 -0700 (PDT)
Received: from mail-il1-f181.google.com (mail-il1-f181.google.com.
 [209.85.166.181])
        by smtp.gmail.com with ESMTPSA id
 f6-20020a056e0204c600b0033bc3a3ea39sm1227538ils.70.2023.05.31.16.48.08
        for <alsa-devel@alsa-project.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 May 2023 16:48:08 -0700 (PDT)
Received: by mail-il1-f181.google.com with SMTP id
 e9e14a558f8ab-33b7f217dd0so61695ab.0
        for <alsa-devel@alsa-project.org>;
 Wed, 31 May 2023 16:48:08 -0700 (PDT)
X-Received: by 2002:a05:6e02:1786:b0:33b:3bf4:9f42 with SMTP id
 y6-20020a056e02178600b0033b3bf49f42mr32601ilu.19.1685576888336; Wed, 31 May
 2023 16:48:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230530072514.22001-1-trevor.wu@mediatek.com>
 <20230530072514.22001-2-trevor.wu@mediatek.com>
In-Reply-To: <20230530072514.22001-2-trevor.wu@mediatek.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 31 May 2023 16:47:56 -0700
X-Gmail-Original-Message-ID: 
 <CAD=FV=X1JURLwZHraNwSMT7vwLNRNw7h0MmpbeWnr1yht6-3VA@mail.gmail.com>
Message-ID: 
 <CAD=FV=X1JURLwZHraNwSMT7vwLNRNw7h0MmpbeWnr1yht6-3VA@mail.gmail.com>
Subject: Re: [PATCH 1/2] ASoC: mediatek: mt8188: fix use-after-free in driver
 remove path
To: Trevor Wu <trevor.wu@mediatek.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, tiwai@suse.com, perex@perex.cz,
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
	alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: FP76BGYB7SAQZHP6DHRQZELA23E6P4FT
X-Message-ID-Hash: FP76BGYB7SAQZHP6DHRQZELA23E6P4FT
X-MailFrom: dianders@chromium.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FP76BGYB7SAQZHP6DHRQZELA23E6P4FT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

On Tue, May 30, 2023 at 12:25=E2=80=AFAM Trevor Wu <trevor.wu@mediatek.com>=
 wrote:
>
> diff --git a/sound/soc/mediatek/mt8188/mt8188-audsys-clk.c b/sound/soc/me=
diatek/mt8188/mt8188-audsys-clk.c
> index be1c53bf4729..05d6f9d78e10 100644
> --- a/sound/soc/mediatek/mt8188/mt8188-audsys-clk.c
> +++ b/sound/soc/mediatek/mt8188/mt8188-audsys-clk.c
> @@ -138,6 +138,29 @@ static const struct afe_gate aud_clks[CLK_AUD_NR_CLK=
] =3D {
>         GATE_AUD6(CLK_AUD_GASRC11, "aud_gasrc11", "top_asm_h", 11),
>  };
>
> +static void mt8188_audsys_clk_unregister(void *data)
> +{
> +       struct mtk_base_afe *afe =3D (struct mtk_base_afe *)data;

The above cast is unnecessary since the compiler lets you assign from
a "void *" to another pointer without a cast. Unnecessary casts are
considered harmful because they suspend the compiler's ability to do
type checking. Other than that, this looks good. Sorry for not
noticing that the same problem affected more than just the driver I
fixed previously.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
