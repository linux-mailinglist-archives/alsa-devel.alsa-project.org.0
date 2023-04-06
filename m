Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 25FCC6D8F9C
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Apr 2023 08:41:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2196F20C;
	Thu,  6 Apr 2023 08:40:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2196F20C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680763285;
	bh=FpzXCvWsfiC4UQj2ZiOPldH80QOhaMQ8XJIJEGMvz84=;
	h=References:In-Reply-To:From:Date:Subject:To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=H1hRZNQ3ZdSphUK6rhFez1oeo0qPIQ2tJM0SsQkn/Ep6YZMZSt/KnWRKm9SuoQkA2
	 Ny97iXbiAcBMYtgHBeUzOORp81/W+5BGyFxJ0aTelzEG1NElk0g/zoPPLI0w+yuKRg
	 Y8DqZG8GtE/fsf4er4BYOokxl14yt8h7Ul1ir9YQ=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6DBB4F80171;
	Thu,  6 Apr 2023 08:40:34 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C8F5BF80246; Thu,  6 Apr 2023 08:40:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CCCA2F8015B
	for <alsa-devel@alsa-project.org>; Thu,  6 Apr 2023 08:40:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CCCA2F8015B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=fnJmHXkS
Received: by mail-ed1-x52b.google.com with SMTP id ew6so146732505edb.7
        for <alsa-devel@alsa-project.org>;
 Wed, 05 Apr 2023 23:40:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680763218;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ufn8dXIrnh+56Iea4gFx0gEX9oFLFPbZkbSS9EDVPbA=;
        b=fnJmHXkS2uyJjTmT3M6mMzRezWhpgHAgnt756Nb+ik0p9gixZjwrz7Z4/YqDN02THY
         Be58g0grhcXPBndhQETpFchxKaPbVFYpiJmjBg9Lhb2Fg5/uiBYoTC/G4IQwh7t+4lqi
         //UhTEXWr6WY9mRlSMJCl1nfISa9UByZ2o6RKHEm31XxuMu075zVF1gnbEZL82u+1nQL
         Djf9YFGdGf2rBdQaOGFivSZp5laX4lswHSRNqPFbxE+6bpUYdixhefzOh/IRR1DHe2F7
         HG3di5HCADSwluycWG3FxosUxs0jomgIzbAo3etbwibwYndaB0P+MNznCakHUpr9orB+
         gtgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680763218;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ufn8dXIrnh+56Iea4gFx0gEX9oFLFPbZkbSS9EDVPbA=;
        b=RapgGvF8croTqHORicXX09M6I/T044b8g+f6AY/sS8ySWfyQn4NXz0A2O7WGnREez7
         LMPMdV1xfgOsr5TUZ73p5Xgu6wmTLOB2hgd+6zMdgnBkvv4Dv303ZqDglv4usLywvPiw
         qynh1bn/vesYKhgHFEcbQD381vH9lH3LYnC/PJuvE7NNgkhFwIwSDUtX8TMb4LKG5HVW
         vQWhHeXufGSd26YW8HFnyZAkQQfWgzUZJdzmIYxYkhTs4eVStumkeyC3Ae/qozk8vUKO
         ErK73Pt3EuMH+1l1Rcdl/Go2QQpjUrDlr2fMAg/lzrJbwk4/hJ7sWUigLGOHJqUkszcK
         6X6w==
X-Gm-Message-State: AAQBX9dHFcMRX05yo8Xoep5F5T4GDVDgnxiRp39qJUsI4nXKEuy2MUur
	tuQC6nsOFFYGLm0GZ07gp8tbyOlrxnX1/HVQ6ag=
X-Google-Smtp-Source: 
 AKy350ZaitaIP37QKRvJ09Xxq14dBzKuBhP+qsRlaK9rt9XekriZtwV+88QyzbMY8o0YYuKBJFV84rdt3YK3h7b9m5s=
X-Received: by 2002:a17:906:3a8f:b0:947:335f:5a10 with SMTP id
 y15-20020a1709063a8f00b00947335f5a10mr2624674ejd.12.1680763218206; Wed, 05
 Apr 2023 23:40:18 -0700 (PDT)
MIME-Version: 1.0
References: <20230405200341.4911-1-danascape@gmail.com>
 <168074344623.1301612.621743725976519280.robh@kernel.org>
In-Reply-To: <168074344623.1301612.621743725976519280.robh@kernel.org>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Thu, 6 Apr 2023 09:40:06 +0300
Message-ID: 
 <CAEnQRZBCN6JrjvaJSD5dnuLXOUyx8Y9LOucY_Fwqcf4ZZLuwJg@mail.gmail.com>
Subject: Re: [PATCH] ASoC: dt-bindings: wm8904: Convert to dtschema
To: Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: Z7WLQA3OQJIYVTOEYWKBR3OGIPVBA4Y3
X-Message-ID-Hash: Z7WLQA3OQJIYVTOEYWKBR3OGIPVBA4Y3
X-MailFrom: daniel.baluta@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Saalim Quadri <danascape@gmail.com>, devicetree@vger.kernel.org,
 krzysztof.kozlowski+dt@linaro.org, daniel.baluta@nxp.com, robh+dt@kernel.org,
 broonie@kernel.org, patches@opensource.cirrus.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 lgirdwood@gmail.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Z7WLQA3OQJIYVTOEYWKBR3OGIPVBA4Y3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, Apr 6, 2023 at 4:24=E2=80=AFAM Rob Herring <robh@kernel.org> wrote:
>
>
> On Thu, 06 Apr 2023 01:33:41 +0530, Saalim Quadri wrote:
> > Convert the WM8904 audio CODEC bindings to DT schema
> >
> > Signed-off-by: Saalim Quadri <danascape@gmail.com>
> > ---
> >  .../devicetree/bindings/sound/wlf,wm8904.yaml | 66 +++++++++++++++++++
> >  .../devicetree/bindings/sound/wm8904.txt      | 33 ----------
> >  2 files changed, 66 insertions(+), 33 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/sound/wlf,wm8904.=
yaml
> >  delete mode 100644 Documentation/devicetree/bindings/sound/wm8904.txt
> >
>
> Running 'make dtbs_check' with the schema in this patch gives the
> following warnings. Consider if they are expected or the schema is
> incorrect. These may not be new warnings.
>
So, these properties are present in some dts files! We need to
evaluated if they are always expected
or can be optional.

> Note that it is not yet a requirement to have 0 warnings for dtbs_check.
> This will change in the future.
>
> Full log is available here: https://patchwork.ozlabs.org/project/devicetr=
ee-bindings/patch/20230405200341.4911-1-danascape@gmail.com
>
>
> audio-codec@1a: Unevaluated properties are not allowed ('AVDD-supply', 'C=
PVDD-supply', 'DBVDD-supply', 'DCVDD-supply', 'MICVDD-supply' were unexpect=
ed)
>         arch/arm64/boot/dts/freescale/imx8mm-verdin-nonwifi-dahlia.dtb
>         arch/arm64/boot/dts/freescale/imx8mm-verdin-wifi-dahlia.dtb
>
