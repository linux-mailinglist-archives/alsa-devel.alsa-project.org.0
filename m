Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 332A72A015C
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Oct 2020 10:25:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B16F115F9;
	Fri, 30 Oct 2020 10:24:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B16F115F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604049902;
	bh=ay49ZuyRPtJVdPhUgkJo//uZDhOmks0uGr3aMiJbUUg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OtTuguCBWwqMzeTF/yqhgqgk6gbejjU6UgDQhv5ZdbYgLgrNHZLktot14EjLvnEad
	 vM44SssZuJhW+7UV5ZcGEQFoj0HsE4sff9KsS4nNti1AQ6p64d/Df2MxmKOQH4YBWc
	 hMXXboxdXXjB/UIC54FtVzfqaOkZvjBAQQ2VZRMI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EE09AF800FF;
	Fri, 30 Oct 2020 10:23:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 88A58F80212; Fri, 30 Oct 2020 10:23:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,SPF_HELO_NONE,SPF_PASS,
 USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled version=3.4.0
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com
 [IPv6:2607:f8b0:4864:20::d42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8D3C3F800FF
 for <alsa-devel@alsa-project.org>; Fri, 30 Oct 2020 10:23:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8D3C3F800FF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="UO5IfL8R"
Received: by mail-io1-xd42.google.com with SMTP id q25so6794246ioh.4
 for <alsa-devel@alsa-project.org>; Fri, 30 Oct 2020 02:23:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CBA+zo6LaSoFeL0OA7IbUTdbUJNI/GOykxoTxkhm2nk=;
 b=UO5IfL8R5QFcwjro3zMCatag08rvnj7MG+rIfVf8CZY1PLx4Z0SoVQtu3DvG/0uf2N
 YIRVCW8AOfZZVXKBcMTqoLCPZMQ5Kdr+w2h4Jyf/fzhu6jZud64aAlrfyOQbqcC7FZig
 6RxtRmtJurOtE9CKuMpk1+tU/vGvKGRNHkDxmw8yP7WTwOpd+GVyHY20Brqmw6oBEwuq
 QvZM45AWJDmHUwcapmaYrBa+pQ32oebVFliheC058EYqeCLz6IBmN6i+RIW2LIsORGah
 PPcv4Mf1Xo6nq/dRGbcCEpsqtymMwkMc30l3lLgjDsRtVNql2yXNOini1QEbK9TJHv/h
 xoFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CBA+zo6LaSoFeL0OA7IbUTdbUJNI/GOykxoTxkhm2nk=;
 b=MxyIbEwQBuS8UHAAQn1VWDpw3Cf5oeFWmNp4RXtnGmHJZByHIm/Gr1OUnmIC3GFIQo
 fxuvcjBFfKEnRHgLOjs1LqNp4a+Tm6sohm0s2lp9SBQUxLSyWLSwiIuzQvbbM21Dy37z
 M6jnwgcqLrFYIUjgUxlgD2e1ktR5pFJw+j5AINR46DGmzVRXgj98u9D+/e7R/9sAPVnp
 MfP2B9dZw3mUf7LQ+xRlXRRY53A7GB6/OT2DtWUeLDsnb0JCkUTdA2lJgY9sZ+rCMuS7
 ZSN3tTMFu4aptDR2cmYQqlcwCLOgP6YBaKENUVoFohyN6ad9UkQAaxnHNJ3Yd8kCizcX
 tfWg==
X-Gm-Message-State: AOAM532MGFkWzZRBwYN9zORIqIteY+DTcxblvB1e7+4KaC/AF3Mv1AFh
 PB3wGYgBdV/LASvI4U5dq1PozyY6J3OEQjke79h5CA==
X-Google-Smtp-Source: ABdhPJyH+9c8dw1FcU0h83mbgXToEcZDNuIgSVvIgnpkYquj90LicUxQtsuxCBKhNY9sYkw8F9Rt7qhEa3t2HuwKEyA=
X-Received: by 2002:a6b:c8c1:: with SMTP id y184mr1050821iof.109.1604049801372; 
 Fri, 30 Oct 2020 02:23:21 -0700 (PDT)
MIME-Version: 1.0
References: <20201030075724.1616766-1-ajye_huang@compal.corp-partner.google.com>
 <20201030075724.1616766-3-ajye_huang@compal.corp-partner.google.com>
In-Reply-To: <20201030075724.1616766-3-ajye_huang@compal.corp-partner.google.com>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Fri, 30 Oct 2020 17:23:10 +0800
Message-ID: <CA+Px+wXPRg7aDU5+vr6R_BxuFfhuDeG3iEQeAUKWNtX8YmVC1Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] ASoC: qcom: sc7180: Modify machine driver for 2mic
To: Ajye Huang <ajye.huang@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Cc: Douglas Anderson <dianders@chromium.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, ALSA development <alsa-devel@alsa-project.org>,
 Banajit Goswami <bgoswami@codeaurora.org>,
 Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Patrick Lai <plai@codeaurora.org>,
 Ajye Huang <ajye_huang@compal.corp-partner.google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Mark Brown <broonie@kernel.org>, Rohit kumar <rohitkr@codeaurora.org>,
 Andy Gross <agross@kernel.org>, Tzung-Bi Shih <tzungbi@chromium.org>,
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

On Fri, Oct 30, 2020 at 3:57 PM Ajye Huang <ajye.huang@gmail.com> wrote:
> +static struct gpio_desc *dmic_sel;
> +static int dmic_switch;

If you really need them, you should put them in struct sc7180_snd_data.

> +static int dmic_set(struct snd_kcontrol *kcontrol,
> +                   struct snd_ctl_elem_value *ucontrol)
> +{
> +       if (dmic_sel) {

if (IS_ERR(dmic_sel))
But I think you don't need to check dmic_sel.  Suppose your _probe()
already returned error, the code here shouldn't be called.

> +               dmic_switch = ucontrol->value.integer.value[0];

Looks like it can be a local variable.  You don't need to save dmic_switch.
