Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F099D2956CD
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Oct 2020 05:31:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 71E621787;
	Thu, 22 Oct 2020 05:30:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 71E621787
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603337483;
	bh=ByxzbJC3ecSzI7n58bzOgWmhAfXHfIQseky+dfqEaNs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=roniefvJSIvVI+NPH10fn2N5ouaULZWxyaQCjAzkyQbj3ONXvdi+WVB3Exf48FGsN
	 hOHS3Thlil43BoUHc3Tlm31OFyD6D+mm06FBjsrymBnRvTlKp0uYx7LNLpJyxnO7tH
	 GX3UjdcdiUaMkLW7SBxgr+cbBgSpWyVSnv9ajZOo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C970BF804AA;
	Thu, 22 Oct 2020 05:29:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AE261F804A9; Thu, 22 Oct 2020 05:29:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,SPF_HELO_NONE,SPF_PASS,
 USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled version=3.4.0
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com
 [IPv6:2607:f8b0:4864:20::d43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6B0DDF800CE
 for <alsa-devel@alsa-project.org>; Thu, 22 Oct 2020 05:29:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6B0DDF800CE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="QmKzFiaH"
Received: by mail-io1-xd43.google.com with SMTP id y20so75002iod.5
 for <alsa-devel@alsa-project.org>; Wed, 21 Oct 2020 20:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IMFKi57vTn4WORdntFjLONbVhz/S8EeuoMU/ru37Fjk=;
 b=QmKzFiaHxS37kWhYqOevmJSha395OemOg2KLsjigL/6YgPyC0cWSkaDr+ffKa61vPU
 GXX3dfuhinc3Qluqg/LcYmWn/uxtlNOgkwHIV8z5wVdWNaIK/qBYmvkfpKFr6uIPXDuS
 AfhJpRPcSFHBisu+853OTgVeFr30qYIhwo146On5XcIrt6UvkDzAOUc8b9oPP4LHY+aP
 mcF96p2cmiAaoW59NhLHswwH2t/U88kQXPZ09XztB41AQUXax5V0J3N4+8uTmW9J5nLp
 gvtykGqSZeSnzrM85+VdZrTtv1zRS7Q7rVERJrrNJBtv0PRbYLmliKduECch9kebV8vo
 8yGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IMFKi57vTn4WORdntFjLONbVhz/S8EeuoMU/ru37Fjk=;
 b=G/juD0cbx4E16k2RQFOpBINijHCd9FKPkpDb5G/KV96JRJVyjr5EsmSLF6s9SCZgBX
 a/hb/GrHNUsqCZpDi6fM6FHHwK2khZQC66aoeZBagczOOVBkvJbGgBMIxpvVL9Xg0Kpc
 3f1yL6oECl7VN0WbDRDg717k7rJBxq9eoYdOJD4z645zMS46uRhM/07xWYdi4r7EbDGi
 NlIpetgIR9A5K7fGY2EM+uCteZFG+kUO166as/EvB98MxU93JRp4o/wdAxF69E8zgzGw
 /BpNlwawFo1K00GXgAwQrNBhf0PoeHBHoTASqR5ic7vLu4EA5uypozmXhFLBAFc6IzpM
 YUPw==
X-Gm-Message-State: AOAM530ocELkufW380Cb07y5p3kJPOuQu6AM+7UldA1WR33h/hUCvff6
 6mXwzU55zkL7eSHd12wkzrCSmBreXj0WS8jW97tJQQ==
X-Google-Smtp-Source: ABdhPJxMauPqYM6FB9F47HpfghenbvywgGSYzCRS3yrWm7U0RrqNphhFJ8ty4CuavT4aU+0YJFuGRFcGD/Y9+5aVe7A=
X-Received: by 2002:a5d:9f0e:: with SMTP id q14mr438269iot.185.1603337374464; 
 Wed, 21 Oct 2020 20:29:34 -0700 (PDT)
MIME-Version: 1.0
References: <20200914080619.4178587-1-cychiang@chromium.org>
 <20200914080619.4178587-3-cychiang@chromium.org>
 <7bdc0d63-27b1-f99e-c5f8-65f880733d16@linaro.org>
 <CAFv8NwLkvxX2avoLY+4NY5gBv0dQ863hFFiqy7iQOJxH4WenmQ@mail.gmail.com>
 <20201015161251.GF4390@sirena.org.uk>
 <CAFv8NwL1xX=yPGFqQL_mOzAnPTfH0Z0J6ibG1+D32W46Nx0KYQ@mail.gmail.com>
 <20201020143711.GC9448@sirena.org.uk>
 <63f1a29c-0758-97b8-ce80-fe43d91630fa@linaro.org>
 <CAFv8NwJ-+f146Ss9Mk=nEXjm1B--ZwhAgnfx-cTi7DGEKqC1-Q@mail.gmail.com>
 <e876421c-dfeb-e853-1b65-53a786e9bcf9@linaro.org>
 <20201021123913.GD4497@sirena.org.uk>
In-Reply-To: <20201021123913.GD4497@sirena.org.uk>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Thu, 22 Oct 2020 11:29:23 +0800
Message-ID: <CA+Px+wV-uoODRQTZqv7RuyOUoGBoh5GnT2h4iW9mJGRL=UFfgQ@mail.gmail.com>
Subject: Re: [PATCH v11 2/3] ASoC: qcom: dt-bindings: Add sc7180 machine
 bindings
To: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Cc: Taniya Das <tdas@codeaurora.org>,
 "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, Banajit Goswami <bgoswami@codeaurora.org>,
 Heiko Stuebner <heiko@sntech.de>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Takashi Iwai <tiwai@suse.com>, Rohit kumar <rohitkr@codeaurora.org>,
 Ajye Huang <ajye_huang@compal.corp-partner.google.com>,
 Cheng-yi Chiang <cychiang@chromium.org>, Patrick Lai <plai@codeaurora.org>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Andy Gross <agross@kernel.org>, Dylan Reid <dgreid@chromium.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Tzung-Bi Shih <tzungbi@chromium.org>,
 Srinivasa Rao <srivasam@codeaurora.org>, Stephan Gerhold <stephan@gerhold.net>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Doug Anderson <dianders@chromium.org>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
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

Hi, sorry for jumping into your discussion but I am trying to
summarize them to make sure we are on the same page.  Pardon me to
manually copy-and-paste partial sentences to quote.

ACK:
- Don't expose DAI connections in compatible strings.
- Use "model" DT property to make the card more UCM2-friendly.
- Expose new DT properties to distinguish different DMIC models.

NACK:
- All the board variations using exactly the same compatible string.
=> This is less realistic.  Although the CODECS information can be
retrieved from DT, it is inevitable to have some custom code for each
CODEC.

Per Mark's words:
> a different CODEC is something that often justifies a separate compatible
I think we should use different compatible strings for new CODECS
combinations.  And we should try to reuse the machine driver if they
share the most code.  In the worst case, introduce a new machine
driver for the new CODECS combinations.

- Srinivas's suggestion to set driver_name.
e.g. card->driver_name = "SM8250";
=> This sounds like a new DT property should be parsed in
sound/soc/qcom/common.c.  For example: "qcom,family"?  But as we do
less care about UCM2 for now, I would prefer to just leave it as is.


I would expect the following variants in DTS (just for example):

sound {
  compatible = "qcom,sc7180-trogdor";
  model = "sc7180-rt5682-max98357a-1mic";
}

sound {
  compatible = "qcom,sc7180-trogdor";
  model = "sc7180-rt5682-max98357a-2mic";
  dmic-gpio = ...
}

sound {
  compatible = "qcom,sc7180-pompom";
  model = "sc7180-adau7002-max98357a";
}


Please correct me if there is any misunderstanding.
