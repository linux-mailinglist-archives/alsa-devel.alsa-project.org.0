Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 00284791E38
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Sep 2023 22:27:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7A828827;
	Mon,  4 Sep 2023 22:26:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7A828827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693859268;
	bh=T24WVy9Sy1NoDLdhSAKU0ob01Ix3oWcdUfap4kiOeCw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=MpYEdm8u0KcIbk2Enm2su/GbEDScN2f9lwqOOPp2Ehzy5tc5Y/ozdN9QfrJCbPhC8
	 /GcLOE9mB68NFWKzEeJAMbJgKfZ0Ja/O3Lx/HmaT9f8RrQ/z8EAruMbtgXLfpuuNQF
	 Owa4uvRaWpQqtY6IWD+vhHBpaCwxV3FIYPwaRO7M=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1A827F80537; Mon,  4 Sep 2023 22:26:57 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C4D12F80431;
	Mon,  4 Sep 2023 22:26:57 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 216D2F8047D; Mon,  4 Sep 2023 22:26:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com
 [IPv6:2607:f8b0:4864:20::1132])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6F6F8F800AA
	for <alsa-devel@alsa-project.org>; Mon,  4 Sep 2023 22:26:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6F6F8F800AA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=I0q/PcSp
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-59231a1ca9eso17195237b3.1
        for <alsa-devel@alsa-project.org>;
 Mon, 04 Sep 2023 13:26:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693859209; x=1694464009;
 darn=alsa-project.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zOPCv2NI+axDv4gb4abMd4AMNhAMpkyYYjA0xE2SSU0=;
        b=I0q/PcSpETEz3TKL50yLfrqdgZup/uyaXJb4NstFMK4JjCt9irQBTc/lah0YIv5zuH
         wBWbdSDr6jg119uWRjvCqMmnrLGEunFH552d27+1Y043mP2/JZ7uJxsr9fvEYVJo4s9F
         maMY/kzRW5fmDFLqOGDWhbHVLcTqPmplJfwwyNd9IckloK5GHdqjodUrrBHbORucVPJf
         GE6+HqDwbeKI2W4zrBhLT3G+zp+hk9+BIVR9NxteY5AwjqHoYr9Bq1CcE0wbtula3CGT
         8YJSH+z9406ddPkDuiMPtRqYdp+f2/p2dpXIbmsR+0HtiV0r2jLEN5dEuCVy9ELLE/fT
         dgPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693859209; x=1694464009;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zOPCv2NI+axDv4gb4abMd4AMNhAMpkyYYjA0xE2SSU0=;
        b=OgqG3iB3UlbGRMmTvkvDhZ1+DSURJw5qLa+iWPBJ1hBuHuz1VsfIY94GOO/j7qkHju
         gJFJWBvOi9N2zy0nmRjeUok6VlQWszylzAFPL0qnm9i5gGjcf8GYtNF60CbXMwgmtgxX
         mTf25vYsKwYms3GWh1hlclNYBqRsCKlF2ZxOOo247CrXzBuMnoEgLLtHddhcGeSbbeq0
         x4BqRMc//Z200Uo0scIiAEy/eYbLwp3SyuteumOWwTNF4a5uNYCXzrCkvCb3tCSJGMR0
         NzeUI9dxyqNcE7Wu9WX3kF9rnhdWH5iMPxdnR5REpQzzEzE6koBdnqXFQ6c1kb/b+b1o
         jtqg==
X-Gm-Message-State: AOJu0YzXRPZEhsgsn/+zZw0yLJZeTyShmzp+dae3zpjB5W3j6T8OdM0r
	WDqyr66U5kNCfrA1Kabe8DHrjAES3UYhBvHg3hkH5A==
X-Google-Smtp-Source: 
 AGHT+IGYxkclG89PUKOkDm67cPaVgl3DF1XdYgrU2viuEanv3N60lpWFmpZI/6uf+KY5yjj97vqPkmRPUzx+tp+//GE=
X-Received: by 2002:a25:40d:0:b0:d78:4638:d52c with SMTP id
 13-20020a25040d000000b00d784638d52cmr10982720ybe.34.1693859209653; Mon, 04
 Sep 2023 13:26:49 -0700 (PDT)
MIME-Version: 1.0
References: <20230904114621.4457-1-wangweidong.a@awinic.com>
 <20230904114621.4457-4-wangweidong.a@awinic.com>
 <5ea76d3f-c9dd-10f5-4f9a-7b32b535ab5c@linaro.org>
 <598febde-429e-4319-98d4-4306a7f8bfe8@sirena.org.uk>
 <0360d279-b535-f3f2-9651-07dff2df2e37@linaro.org>
In-Reply-To: <0360d279-b535-f3f2-9651-07dff2df2e37@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 4 Sep 2023 22:26:38 +0200
Message-ID: 
 <CACRpkdbWE3enEjweZZQSQpdUDvCPXxQZfzOReS9YvZ2mxmevAg@mail.gmail.com>
Subject: Re: [PATCH V1 3/3] ASoC: codecs: Add aw87390 amplifier driver
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Mark Brown <broonie@kernel.org>, wangweidong.a@awinic.com,
 lgirdwood@gmail.com,
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	perex@perex.cz, tiwai@suse.com, rf@opensource.cirrus.com,
	herve.codina@bootlin.com, shumingf@realtek.com, rdunlap@infradead.org,
	13916275206@139.com, ryans.lee@analog.com, ckeepax@opensource.cirrus.com,
	yijiangtao@awinic.com, liweilei@awinic.com, colin.i.king@gmail.com,
	trix@redhat.com, alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, zhangjianming@awinic.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: EZEQE2XZJJNLX6BEMTR5PBNWS5NWZHRO
X-Message-ID-Hash: EZEQE2XZJJNLX6BEMTR5PBNWS5NWZHRO
X-MailFrom: linus.walleij@linaro.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EZEQE2XZJJNLX6BEMTR5PBNWS5NWZHRO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Sep 4, 2023 at 3:02=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
> On 04/09/2023 14:30, Mark Brown wrote:
> > On Mon, Sep 04, 2023 at 02:17:43PM +0200, Krzysztof Kozlowski wrote:
> >> On 04/09/2023 13:46, wangweidong.a@awinic.com wrote:
> >
> >>> +   ret =3D regmap_read(regmap, AW87390_ID_REG, &chip_id);
> >>> +   if (ret) {
> >>> +           dev_err(&i2c->dev, "%s read chipid error. ret =3D %d\n", =
__func__, ret);
> >>> +           return ret;
> >>> +   }
> >
> >>> +   if (chip_id !=3D AW87390_CHIP_ID) {
> >>> +           dev_err(&i2c->dev, "unsupported device\n");
> >
> >> Why? The compatible tells it cannot be anything else.
> >
> > This is very common good practice, as well as validating communication
>
> No, it is neither common nor good. The kernel's job is not to verify the
> supplied DTS. Rob also made here a point:
>
> https://lore.kernel.org/all/CAL_Jsq+wcrOjh7+0c=3Dmrg+Qz6dbhOUE-VEeQ4FoWC3=
Y7ENoyfQ@mail.gmail.com/

I disagree, if a vendor one day decides to mount a new version of a
component without notifying the community or users this is really
helpful.

The function is named "probe()" for a reason, as in "inspect
the hardware and see what we find" this has always been the case
I think.

Yours,
Linus Walleij
