Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C603528EE18
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Oct 2020 10:01:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 51BB3174F;
	Thu, 15 Oct 2020 10:00:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 51BB3174F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602748909;
	bh=Zh0U+PCvvfxnWdbdWqE9lAljPHl9uZGOAF5TBPvnItE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YnaUHBohRenathtclE1X/nR5g9ntHguy7FhHkEmu5HbOBRplona4CEzKOk4Q/vIBa
	 IR0Vcs95GN/Hi5chCvDSMEZ1iYypMxqBXRTOt/LzYSHYvJjEhvUEbwynt3vUBgNh6h
	 /PJZGuqHOm3xLFYYqULlTWPJmXygAWWL9J86Zt9A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 16727F801D9;
	Thu, 15 Oct 2020 10:00:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 10952F801A3; Thu, 15 Oct 2020 10:00:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID, DKIM_VALID_AU, HEADER_FROM_DIFFERENT_DOMAINS, SPF_HELO_NONE,
 SPF_PASS, 
 URIBL_BLOCKED,USER_IN_DEF_SPF_WL autolearn=disabled version=3.4.0
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com
 [IPv6:2607:f8b0:4864:20::d42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7FEBAF800F6
 for <alsa-devel@alsa-project.org>; Thu, 15 Oct 2020 09:59:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7FEBAF800F6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="fZ9DK/wR"
Received: by mail-io1-xd42.google.com with SMTP id y20so3184290iod.5
 for <alsa-devel@alsa-project.org>; Thu, 15 Oct 2020 00:59:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3iwCAX5npGCg/zxSeU8NRUPXRIk3oCwTQT9lW7fSAek=;
 b=fZ9DK/wR5Q8YUrG20w9OUQzsdTlEfyeuToJdEqyFacXEV+lBftlXXjjyjCS6wZQwgc
 /01SjIDNc3HRCZR4tg5qJk4JRwXrj1G9lNss5cENSApQhRF3wC4xi0uYfZf1fudpG1AO
 oPJ1f/J6kf3roUEQk65x9Y1TpOfzGc5A1/1OY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3iwCAX5npGCg/zxSeU8NRUPXRIk3oCwTQT9lW7fSAek=;
 b=Pp88SSCU4fLyGUlQdCOgy4Geipj9+Ns3xqjFHLmJLRl/ZFKXcEHfvlYGJk+MvH5euj
 AQYMis8bn2Z1tAFCZc7zizu96HhVe8D2jPcgz6Ikp5HU/K/oEmjtaNGE2dPxvOSCErHd
 +/uDmHdqoCDtYSGrfV0Rab06gpkziaX2XYmtOLJ38JnxOuDc+VpdwhZAc7+aQkbwB3J/
 MeNo8WAq7EVcTIIYLpKxZaM172h4q2IKqmYC5QQzWstFdqpwS8tIBraIXSIERiuf2qb7
 lktmvyFGpmNfWtxmH+kIPbhcyW9NwH4DGzlc76l3nnuC4GNVlwQysU73Z0x7DJdyAFI0
 UZJw==
X-Gm-Message-State: AOAM532vCOv1K6IJf6qYE8YbDjkRplHFoEUkzixr6PN5xSo5yvOnlgOC
 qcpoLNC/WXP5e3ddlIXoguRMu0heDQNr01UMKPDUDw==
X-Google-Smtp-Source: ABdhPJxlbvqYnJWRiXtnH0q6kkDHMhsE5tUaF2RfBz9uwNRW1GQ7jLgiIgRHtQF+Fj5YaIUFSB0mJZezBcOKtKdorcI=
X-Received: by 2002:a02:b617:: with SMTP id h23mr2508854jam.71.1602748792641; 
 Thu, 15 Oct 2020 00:59:52 -0700 (PDT)
MIME-Version: 1.0
References: <20200914080619.4178587-1-cychiang@chromium.org>
 <20200914080619.4178587-3-cychiang@chromium.org>
 <7bdc0d63-27b1-f99e-c5f8-65f880733d16@linaro.org>
In-Reply-To: <7bdc0d63-27b1-f99e-c5f8-65f880733d16@linaro.org>
From: Cheng-yi Chiang <cychiang@chromium.org>
Date: Thu, 15 Oct 2020 15:59:26 +0800
Message-ID: <CAFv8NwLkvxX2avoLY+4NY5gBv0dQ863hFFiqy7iQOJxH4WenmQ@mail.gmail.com>
Subject: Re: [PATCH v11 2/3] ASoC: qcom: dt-bindings: Add sc7180 machine
 bindings
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Cc: Taniya Das <tdas@codeaurora.org>,
 "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, Banajit Goswami <bgoswami@codeaurora.org>,
 Heiko Stuebner <heiko@sntech.de>, Takashi Iwai <tiwai@suse.com>,
 Rohit kumar <rohitkr@codeaurora.org>, Patrick Lai <plai@codeaurora.org>,
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
 linux-kernel <linux-kernel@vger.kernel.org>, Mark Brown <broonie@kernel.org>
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

On Tue, Oct 13, 2020 at 6:36 PM Srinivas Kandagatla
<srinivas.kandagatla@linaro.org> wrote:
>
> Hi Cheng,
>
> Sorry for such late review w.r.t compatibles,
>
Hi Srini,
Thank you for taking another look!

> On 14/09/2020 09:06, Cheng-Yi Chiang wrote:
> > +---
> > +$id:http://devicetree.org/schemas/sound/qcom,sc7180.yaml#
> > +$schema:http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Qualcomm Technologies Inc. SC7180 ASoC sound card driver
> > +
> > +maintainers:
> > +  - Rohit kumar<rohitkr@codeaurora.org>
> > +  - Cheng-Yi Chiang<cychiang@chromium.org>
> > +
> > +description:
> > +  This binding describes the SC7180 sound card which uses LPASS for audio.
> > +
> > +properties:
> > +  compatible:
> > +    const: qcom,sc7180-sndcard-rt5682-m98357-1mic
>
> This information can come from the dai link description itself, why
> should compatible string have this information?


I think dailink description is not enough to specify everything
machine driver needs to know.
E.g. there is a variation where there are front mic and rear mic. We
need to tell the machine driver about it so
it can create proper widget, route, and controls.
The codec combination also matters. There will be a variation where
rt5682 is replaced with adau7002 for dmic.
Although machine driver can derive some information by looking at dailink,
I think specifying it explicitly in the compatible string is easier to
tell what machine driver should do, e.g.
setting PLL related to rt5682 or not.

>
> Can't we have better compatible string with actual board name or use the
> same compatible name as used by other boards?
>
>
> Can you give us some details on the advantages of doing this way?


Machine driver can easily tell what is expected when it sees the
compatible string (or model property, as you suggested below).
E.g. in 1-mic v.s. 2-mic case, the patch by Ajye Huang:

"[v1,2/2] ASoC: qcom: sc7180: Modify machine driver for 2mic"

You can see widget, route, controls are used according to the configuration.
The alternative approach is to check whether "dmic-gpio" property
exists to decide adding these stuff or not.
But it makes the intent less easier to understand.


>
> Or am I missing something?
>
> AFAIU, you should add proper board name / model name to the compatible
> string rather than describe how its connected. Connection is already
> part of dai link definition.
>
> On the other hand model property can include variant information.
> This can also be used to set card long name which will help in UCM2.
>
>
> The reason I had to bring this up is because the use-space (ucm in this
> case) will not be in a position to differentiate between different board
> variants to select correct mixer controls, so its going to be a pain!


I think your suggestions makes sense since we need to consider UCM.
Having the card with the same name doing different things will be
confusing to user (and to UCM).
I'll follow your suggestion to use the same compatible string, and put
the board variation information in card name using model property.
Thanks a lot for the great help!


>
>
>
> Thanks,
> srini
