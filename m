Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A0A52A0378
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Oct 2020 11:57:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EE6E915F9;
	Fri, 30 Oct 2020 11:56:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EE6E915F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604055431;
	bh=iBvVasztsVuBuZsKe21MFAWJHvz+dijIZSe0dDuaS9U=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BWA4tye2MVCmhePmgurL3hOnYxTNQl10FEq7ZgIRlTfuPsYTQL1SN87iHLDnd7lwB
	 gR3tILhJw0z6Q4wAw+dFDLJiNL0P9MxhOTzLAZXLnbaFFpCM/hHir+uO95wSfnC6CU
	 EECyenMb4BDbia122zIez+9RGtda931ECSCUJwk8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4B5C2F80249;
	Fri, 30 Oct 2020 11:55:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 51C3BF80212; Fri, 30 Oct 2020 11:55:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A4007F800FF
 for <alsa-devel@alsa-project.org>; Fri, 30 Oct 2020 11:55:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A4007F800FF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="cjplITYQ"
Received: by mail-lj1-x243.google.com with SMTP id m8so314985ljj.0
 for <alsa-devel@alsa-project.org>; Fri, 30 Oct 2020 03:55:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OrDPQCETMONsdP1Wo5HDq5W2Iv1t7cbpuMuL/V4LMYs=;
 b=cjplITYQXQCRVceOSq28/kTtGwdbqumx3pVwhPkbIPzBWV9e8DJ77sLhvzUVaUrySo
 br4uT+RnaqqI3JBrwn5G8MQXj9fJ/08Y/iqO17312PkfdI45gGGVEX+R1JhiuSGgACLt
 m9V6o3BEpPQ3SmnS20Wuog9+qrP+XfV4oZImU6SAJ78N4ksYTMljgAoYLk++PxTjig93
 0aaFLVJ1sT1cdQhkgosIDxv8tha554npZmsyjaapwvOI09iU0o0lolyeLfIzLMkj2KCF
 TgQB87wggPvnaUzn8d8Zdmm22xv5L/p3rL24aCGk4/YocDFQXK8iSkj3FXdM3Bz2/RAf
 mpVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OrDPQCETMONsdP1Wo5HDq5W2Iv1t7cbpuMuL/V4LMYs=;
 b=t0J7//V2d3ffSLJU5u6tmDFZQkjgubfVoTLWbK1NyXKh5T2nzP4sURY+TB2asHhva6
 Lq7WCHuFCKJ+8UYsrBgQ/4OpIZ6vnXfNYwQIJ83SjleqeQi3dEPU5uGUm+qwIxB/hT/T
 cDEdXf2kh9se4j61UjraOkrSWCbWOxMZ8QJyRaVMx0MaXpco1gsyO9RKm/XbtRObk2VR
 nEDhtIs2f1naZd3lIgWwqbnaMi4xDcbso9GN7NLViVqufIRvV44p/elivxhtZiSDy8HR
 Zx9YwTti4mWWIg9Iw0GZSVSL7TjUF8PfCE1RbO5Xhcn7lxZtYTic/KD77vD2Urd4HPBY
 J6Ug==
X-Gm-Message-State: AOAM531XxKyf6r8oRP6JXNOPKqD6FPI6qDxuWPEi2EXExz220aSfFZkD
 zoDL9aBQOlwjznn1Lzu8FpiTN8VSICm5zWHZ+9wIbg==
X-Google-Smtp-Source: ABdhPJycAMjwXBhWulmIAxPPXg555+umIsvAMkLA9slwAM3OVfq3XW7rn4jgCP2nM9o7uwVxEWU34jDZIEEnl1YrXl4=
X-Received: by 2002:a2e:9449:: with SMTP id o9mr83255ljh.457.1604055327434;
 Fri, 30 Oct 2020 03:55:27 -0700 (PDT)
MIME-Version: 1.0
References: <20201030075724.1616766-1-ajye_huang@compal.corp-partner.google.com>
 <20201030075724.1616766-3-ajye_huang@compal.corp-partner.google.com>
 <CA+Px+wXPRg7aDU5+vr6R_BxuFfhuDeG3iEQeAUKWNtX8YmVC1Q@mail.gmail.com>
In-Reply-To: <CA+Px+wXPRg7aDU5+vr6R_BxuFfhuDeG3iEQeAUKWNtX8YmVC1Q@mail.gmail.com>
From: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
Date: Fri, 30 Oct 2020 18:55:16 +0800
Message-ID: <CALprXBZ+NmR8Y4sMkh4Y-N_FG+rGEOhUBVTKXRXNFp8H+f0btw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] ASoC: qcom: sc7180: Modify machine driver for 2mic
To: Tzung-Bi Shih <tzungbi@google.com>
Content-Type: text/plain; charset="UTF-8"
Cc: Douglas Anderson <dianders@chromium.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, ALSA development <alsa-devel@alsa-project.org>,
 Banajit Goswami <bgoswami@codeaurora.org>,
 Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Ajye Huang <ajye.huang@gmail.com>,
 Patrick Lai <plai@codeaurora.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Mark Brown <broonie@kernel.org>, Rohit kumar <rohitkr@codeaurora.org>,
 Andy Gross <agross@kernel.org>, Tzung-Bi Shih <tzungbi@chromium.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Srini Kandagatla <srinivas.kandagatla@linaro.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>,
 Cheng-Yi Chiang <cychiang@chromium.org>
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

On Fri, Oct 30, 2020 at 5:23 PM Tzung-Bi Shih <tzungbi@google.com> wrote:
>
> On Fri, Oct 30, 2020 at 3:57 PM Ajye Huang <ajye.huang@gmail.com> wrote:
> > +static struct gpio_desc *dmic_sel;
> > +static int dmic_switch;
>
> If you really need them, you should put them in struct sc7180_snd_data.
>
Thank you, I will do it.
> > +static int dmic_set(struct snd_kcontrol *kcontrol,
> > +                   struct snd_ctl_elem_value *ucontrol)
> > +{
> > +       if (dmic_sel) {
>
> if (IS_ERR(dmic_sel))
> But I think you don't need to check dmic_sel.  Suppose your _probe()
> already returned error, the code here shouldn't be called.
>
OK, I will remove the discriminant if (dmic_sel) {
> > +               dmic_switch = ucontrol->value.integer.value[0];
>
> Looks like it can be a local variable.  You don't need to save dmic_switch.
But dmic_get() will need dmic_switch, should i keep dmic_switch?
static int dmic_get(struct snd_kcontrol *kcontrol,
    struct snd_ctl_elem_value *ucontrol)
{
ucontrol->value.integer.value[0] = dmic_switch;
return 0;
}
