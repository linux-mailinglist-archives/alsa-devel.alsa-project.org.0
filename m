Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1478A26A57D
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Sep 2020 14:47:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8527D844;
	Tue, 15 Sep 2020 14:46:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8527D844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600174024;
	bh=OfnmzC0DheBXXPtE8cIXi2pWYzEdYrpbb9yo5UKplHg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dJQgoyvpMrJwXRTUQrFGmr3bjOnaO5AlCkg++C/DgSm1FII5dh/vpT2d4mIy3F9St
	 KL5AH0VE4UUpSPXUObozZvT/Ix8zlCnOqbfKLTkb6cnAb+exSoIf3iWS4fH4iIT8gc
	 r+7GYP9+nikwEBSMIlm9Fmgq0oyEHdxtrx+ZW5K8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 99F0CF80146;
	Tue, 15 Sep 2020 14:45:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 32DF7F80212; Tue, 15 Sep 2020 14:45:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID, DKIM_VALID_AU, HEADER_FROM_DIFFERENT_DOMAINS, SPF_HELO_NONE,
 SPF_PASS, 
 URIBL_BLOCKED,USER_IN_DEF_SPF_WL autolearn=disabled version=3.4.0
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 971ADF800E5
 for <alsa-devel@alsa-project.org>; Tue, 15 Sep 2020 14:45:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 971ADF800E5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="Q1VROlQW"
Received: by mail-wr1-x442.google.com with SMTP id j2so3151857wrx.7
 for <alsa-devel@alsa-project.org>; Tue, 15 Sep 2020 05:45:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=prgbbLEwgblX++DIA6lSNe0xZAiKfHZki6I+StVAnLE=;
 b=Q1VROlQWfmlbZeeOVVji/0iVuQbrzHv3LyXlzJKB/jZyIl7jlwtq83iMQNIuBTtIDU
 mMJrv6XDPjLmOFIIlreqHabqlek6mVxO/yH3LCwl6pXubX3sxPWzQx+BTKkXXjULprxE
 a9hVqPQTocex/KOq6CV5LbnS1W7amLkZEXuFg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=prgbbLEwgblX++DIA6lSNe0xZAiKfHZki6I+StVAnLE=;
 b=ohQCMMLZEZgGa23v8lxOMy4nB657XJTjjHNDRw4hJdSV4FsuFSUbVfFoFsMXlHFrWY
 8p6eDlQVhzmZm+yEjlfCzkAlmrcPz0b100hUM2SuMAQlvWzxsRlrO1c473iYsI5GR58p
 33pnbXEELY41fhxWZoQb/HDtDiwgaBQih4QlV0ep51bT6sJjob3PVSjbc2Qi0qICs1vU
 c5vaoPiWrB/L+B25fQwJgu56SNK+qnPqXKm/HtKk3t1bUFjmeRXF4LAW/zyxKoZ8DDH+
 RqwiVccuBgmtb7tndfG4DwOloIsTTgKOu56eHeytzl/orF/su35Wu5Ogz0NwSNyNsytr
 j4Ew==
X-Gm-Message-State: AOAM5300MXwW8I3fIHLFxSNKWdvx1VOtq1/7TtCOqZ5u7+RC8i3gj9Rp
 pJEJawqWtASUFFbcFKRkYQfhSwF7LEFsbtDM/1ATjQ==
X-Google-Smtp-Source: ABdhPJywvAYnO/cUJA6n7jjsXdnAk2rhTKdrXd0MShhk2rxfYd1+ycLgavEuhL4DeOkvtc7FxftmCne4Gau4Rvcai7s=
X-Received: by 2002:a5d:510d:: with SMTP id s13mr21605335wrt.177.1600173908051; 
 Tue, 15 Sep 2020 05:45:08 -0700 (PDT)
MIME-Version: 1.0
References: <20200914080619.4178587-1-cychiang@chromium.org>
 <20200914080619.4178587-3-cychiang@chromium.org>
 <20200914174812.GA4125843@bogus>
In-Reply-To: <20200914174812.GA4125843@bogus>
From: Cheng-yi Chiang <cychiang@chromium.org>
Date: Tue, 15 Sep 2020 20:44:37 +0800
Message-ID: <CAFv8NwLb4zKqc8BbRq5_B4PnGR+BAMZa2RpB0qjLez921j-diA@mail.gmail.com>
Subject: Re: [PATCH v11 2/3] ASoC: qcom: dt-bindings: Add sc7180 machine
 bindings
To: Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Cc: Taniya Das <tdas@codeaurora.org>,
 "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, Banajit Goswami <bgoswami@codeaurora.org>,
 Heiko Stuebner <heiko@sntech.de>, Liam Girdwood <lgirdwood@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, Rohit kumar <rohitkr@codeaurora.org>,
 Patrick Lai <plai@codeaurora.org>,
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
 Doug Anderson <dianders@chromium.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, Mark Brown <broonie@kernel.org>,
 Srini Kandagatla <srinivas.kandagatla@linaro.org>
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

On Tue, Sep 15, 2020 at 1:48 AM Rob Herring <robh@kernel.org> wrote:
>
> On Mon, 14 Sep 2020 16:06:18 +0800, Cheng-Yi Chiang wrote:
> > Add devicetree bindings documentation file for sc7180 sound card.
> >
> > Signed-off-by: Cheng-Yi Chiang <cychiang@chromium.org>
> > ---
> >  .../bindings/sound/qcom,sc7180.yaml           | 130 ++++++++++++++++++
> >  1 file changed, 130 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/sound/qcom,sc7180.yaml
> >
>
>
> Please add Acked-by/Reviewed-by tags when posting new versions. However,
> there's no need to repost patches *only* to add the tags. The upstream
> maintainer will do that for acks received on the version they apply.
>
> If a tag was not added on purpose, please state why and what changed.
>

Hi Rob,
There was a change between v9 and v10 on compatible string so I did
not add your Reviewed-by.
Now it is "qcom,sc7180-sndcard-rt5682-m98357-1mic" following Stephan's
comment in

https://patchwork.kernel.org/comment/23608881/

to make compatible string more specific to board configuration.
I only add the note to the cover letter. Sorry the cover letter became
too long to follow.
I will add the note in patch mail itself for future changes.
Thanks for taking a look again.
