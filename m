Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 408174BC50B
	for <lists+alsa-devel@lfdr.de>; Sat, 19 Feb 2022 03:47:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CF55917C9;
	Sat, 19 Feb 2022 03:46:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CF55917C9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645238867;
	bh=DQm3dzVCY1FyK1nVTRS3Y8VEmZfIVCq9w/XynD1Yj4Q=;
	h=In-Reply-To:References:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mM9n2Nu3LkYhYTK/GV4gViRdGrbfkd8dbwty78qF2Al8E5Aypn8+FmDI4naQHLC9+
	 gIn2YxCT/8cVUgy5PUAPNUwqNUCN6xc0mATekDCmFvqzQiyREH0aGhy1pXa2k1cx+4
	 zZAOMq6eRmOjzfMT+81m2g1iIw775y+ZAWJTI6nc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 407FEF8016B;
	Sat, 19 Feb 2022 03:46:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8CF06F8016A; Sat, 19 Feb 2022 03:46:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY
 autolearn=disabled version=3.4.0
Received: from mail-oo1-xc2d.google.com (mail-oo1-xc2d.google.com
 [IPv6:2607:f8b0:4864:20::c2d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DAF1AF80118
 for <alsa-devel@alsa-project.org>; Sat, 19 Feb 2022 03:46:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DAF1AF80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="PhWFIs+R"
Received: by mail-oo1-xc2d.google.com with SMTP id
 w10-20020a4ae08a000000b0031bdf7a6d76so5822076oos.10
 for <alsa-devel@alsa-project.org>; Fri, 18 Feb 2022 18:46:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=DQm3dzVCY1FyK1nVTRS3Y8VEmZfIVCq9w/XynD1Yj4Q=;
 b=PhWFIs+RJpcr112/Fdp4ospixnQKGstbiHUuquknUgzAbkRicCb5xc6wiV/c0B23wO
 su1uhMIWVBnzciMlN37pXRteUNFruOlD8eWek/kU2o3rK3aND6Rli4kf0nZ0yoYzcezL
 3fsYiVrV+KODKAj59h3YVuNk6nO0Egvk657TE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc:content-transfer-encoding;
 bh=DQm3dzVCY1FyK1nVTRS3Y8VEmZfIVCq9w/XynD1Yj4Q=;
 b=DasxeAzNDMB7IoGTcefq/8/LEH5ENCk/BWxATNsAVOce6MFudTR2ZrtR92jisjTD7S
 GzJzhqTkZJF7iG+KdlSV3I2S7D+Bms6exO8rLKnB4mEf1TSBmU8J4J1TqNdUKAnH0CMa
 SzENzqv+tKQv/JkmYsavKFCe+twDZ/9N465U/KNuYKydGICDrRXWcSUBJy00Bi+PSdBh
 2cxqvnu+ocf8pmE9OYzsVgCtfwRjZhG1rdwZxw+oQTvryjvdx58NzlmMey0oe6OpWOEp
 Ppoq3FDeT82WOT/xJSi8DHWzgmZNH7pLo2ikUEYwY+Gy0PFPlHkgOWLk+TbSICpnGZ5g
 TY/A==
X-Gm-Message-State: AOAM5327/j+6+ld3cGN0H++CfaIgFReeCECz5gMMbT9f3rXmaHCFnaJQ
 Gfc6UpjIxXkRH/X6bZQF5vMh19a9mW5+1QhjDichag==
X-Google-Smtp-Source: ABdhPJzFvL6nErM3soIDJLjgaoUiL8QWvYjB63p3eOVAaiDWZwdZorNdm+S4sLm3ReMhkrjp8/WuExFuCR1PoiRprhU=
X-Received: by 2002:a05:6870:5829:b0:c8:9f42:f919 with SMTP id
 r41-20020a056870582900b000c89f42f919mr4194397oap.54.1645238796075; Fri, 18
 Feb 2022 18:46:36 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 18 Feb 2022 18:46:35 -0800
MIME-Version: 1.0
In-Reply-To: <09b00fe9-1770-1723-3c4c-6c494da87e8d@linaro.org>
References: <1644851994-22732-1-git-send-email-quic_srivasam@quicinc.com>
 <1644851994-22732-8-git-send-email-quic_srivasam@quicinc.com>
 <a209336a-9108-f1ac-ee6d-a838df115c6d@linaro.org>
 <b663f63f-4a5a-3a2a-9be7-fa7258ce93c5@quicinc.com>
 <09b00fe9-1770-1723-3c4c-6c494da87e8d@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Fri, 18 Feb 2022 18:46:35 -0800
Message-ID: <CAE-0n5009g2WwnTsmUeKs5jgrnrUf21SgEL1s65C3FL+HJefkQ@mail.gmail.com>
Subject: Re: [PATCH v6 7/7] pinctrl: qcom: Update clock voting as optional
To: Linus Walleij <linus.walleij@linaro.org>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>, agross@kernel.org,
 alsa-devel@alsa-project.org, 
 bgoswami@codeaurora.org, bjorn.andersson@linaro.org, broonie@kernel.org, 
 devicetree@vger.kernel.org, judyhsiao@chromium.org, lgirdwood@gmail.com, 
 linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, perex@perex.cz, quic_plai@quicinc.com, 
 robh+dt@kernel.org, rohitkr@codeaurora.org, tiwai@suse.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Cc: Venkata Prasad Potturu <quic_potturu@quicinc.com>
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

Quoting Srinivas Kandagatla (2022-02-16 07:38:02)
>
>
> On 16/02/2022 14:41, Srinivasa Rao Mandadapu wrote:
> >
> > On 2/16/2022 7:50 PM, Srinivas Kandagatla wrote:
> > Thanks for Your Time Srini!!!
> >>
> >> On 14/02/2022 15:19, Srinivasa Rao Mandadapu wrote:
> >>> diff --git a/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c
> >>> b/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c
> >>> index 5bf30d97..4277e31 100644
> >>> --- a/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c
> >>> +++ b/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c
> >>> @@ -143,6 +143,7 @@ static const struct lpi_pinctrl_variant_data
> >>> sc7280_lpi_data =3D {
> >>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .ngroups =3D ARRAY_SIZE(sc7280_groups)=
,
> >>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .functions =3D sc7280_functions,
> >>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .nfunctions =3D ARRAY_SIZE(sc7280_func=
tions),
> >>> +=C2=A0=C2=A0=C2=A0 .is_clk_optional =3D 1,
> >>
> >> This is forcefully set assuming that sc7280 is always used in ADSP
> >> bypass mode. Which is not correct.
> >>
> >> Can't you use devm_clk_bulk_get_optional instead?
> >
> > Yes. Agreed. Initially used devm_clk_bulk_get_optional, but Bjorn
> > suggested for conditional check instead of optional.
> >
> > Again Shall we go for optional clock voting?
>
> That means that the condition has to be dynamic based on the platform
> using DSP or not. Which is impossible to deduce without some help from DT=
.
>
> I would prefer to stay with optional clock unless Bjorn has some strong
> objection on not using int.

I think we need the combination of optional API and bool flag. My
understanding is it's optional on sc7280, but not on the previous
revision, so we want to be very strict on previous revision and less
strict on sc7280. Hence the flag. Maybe we should change it to
clk_required and then assume optional going forward. Then the callsite
can use one or the other API?
