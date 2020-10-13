Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 89C7D28C7AB
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Oct 2020 05:49:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 07A97168E;
	Tue, 13 Oct 2020 05:48:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 07A97168E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602560944;
	bh=Iu62huxfOkqYv77Lj15cCGQvSqT8WrxnRlFBUb+7XHs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZWrPcV/VN1NE6LAaI5N+8To7Z+nRCJq+eadDTWHW7K4gLf4koj2rxkmaGXOlmgdHD
	 jxumYYriMijp1qywUGPGMaecaxYOXv9pxw1NoZa/mJFV5KaWstLHkPBGsGITnv1ity
	 PbX9WQfTv76puTnNOEAIDg+Qgo33wWk8HIBd6xL4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 935C0F801D9;
	Tue, 13 Oct 2020 05:47:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 287A6F801A3; Tue, 13 Oct 2020 05:47:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID, DKIM_VALID_AU, HEADER_FROM_DIFFERENT_DOMAINS, SPF_HELO_NONE,
 SPF_PASS, 
 URIBL_BLOCKED,USER_IN_DEF_SPF_WL autolearn=disabled version=3.4.0
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 602FCF8012C
 for <alsa-devel@alsa-project.org>; Tue, 13 Oct 2020 05:47:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 602FCF8012C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="TUy1/e/8"
Received: by mail-wr1-x441.google.com with SMTP id i1so16049157wro.1
 for <alsa-devel@alsa-project.org>; Mon, 12 Oct 2020 20:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ndqNqzRXOPPB0ogWDEyLlyUsAwARJUaefBSahD5nDa4=;
 b=TUy1/e/8zdrtz/TDD9ZlkK4/DfeGPgRUa3QeDaYfeh4G1LHFulpMmCsbTwbGSEyBQK
 lAu8jh7FoG6cHbwFJSQeIx9iXkCE/ueGwcI2MrlJUnM/ojvgJ0zqYcQCHh3lZGIzQahy
 ZyzDEyzFbz4onJYf00FLDHv5UWWR6DCw8+OeA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ndqNqzRXOPPB0ogWDEyLlyUsAwARJUaefBSahD5nDa4=;
 b=Sink9rUAYXW9zyC2sPh2vFgQX4w+1PRpM22mi0RBnFYgX3KZy/9jZOhG+S4D8WVwLJ
 OI/GqyWmSYZLxuZP90TDaxaxMe0pUpDhtiXBXLwdMiBI6pLrf/pO9dF9njX0kVybyqKR
 xBH3chl8UdRYt0tfINIYEGYNElk8cArSZ0Lncom3zJmk1DNpUATxLtoobmDiePQ5ybIh
 FG6P6JknqnFvo+yQsqzNZA3XBLLcrOiXAaHczNcLFnYfA5u7js+PinRRGk7fD+RRNwx2
 CHuFic/cAfdfUnLj8z/PBcvAdY6bhV1nHPqJzcjOHqJkBLo6EH8voHW73rvTxHst7OiZ
 wdrQ==
X-Gm-Message-State: AOAM531KLAd0ZUoLTY+Okug1ZAYMO491+R3x200REwEsDikXLHuh+lFW
 eSHpzs4TQJJK210Vr0KAgPmI3uzS2TyqJbKJnfXByA==
X-Google-Smtp-Source: ABdhPJxLXiwL7qf220DKfHJQfoYxQlufVps95HZ1MB4kZujN6DOUdk3utBGFAuRuLvV4U9gUnbWpUWxLmoiRUK7RRoY=
X-Received: by 2002:a5d:6a43:: with SMTP id t3mr34196747wrw.426.1602560826699; 
 Mon, 12 Oct 2020 20:47:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200914080619.4178587-1-cychiang@chromium.org>
 <20200914080619.4178587-3-cychiang@chromium.org>
 <20200914174812.GA4125843@bogus>
 <CAFv8NwLb4zKqc8BbRq5_B4PnGR+BAMZa2RpB0qjLez921j-diA@mail.gmail.com>
In-Reply-To: <CAFv8NwLb4zKqc8BbRq5_B4PnGR+BAMZa2RpB0qjLez921j-diA@mail.gmail.com>
From: Cheng-yi Chiang <cychiang@chromium.org>
Date: Tue, 13 Oct 2020 11:46:40 +0800
Message-ID: <CAFv8Nw+6YQnbQGYHRYua9pH-bdb2jSOXiTpf9Wi9jKjgcEwuoA@mail.gmail.com>
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

On Tue, Sep 15, 2020 at 8:44 PM Cheng-yi Chiang <cychiang@chromium.org> wrote:
>
> On Tue, Sep 15, 2020 at 1:48 AM Rob Herring <robh@kernel.org> wrote:
> >
> > On Mon, 14 Sep 2020 16:06:18 +0800, Cheng-Yi Chiang wrote:
> > > Add devicetree bindings documentation file for sc7180 sound card.
> > >
> > > Signed-off-by: Cheng-Yi Chiang <cychiang@chromium.org>
> > > ---
> > >  .../bindings/sound/qcom,sc7180.yaml           | 130 ++++++++++++++++++
> > >  1 file changed, 130 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/sound/qcom,sc7180.yaml
> > >
> >
> >
> > Please add Acked-by/Reviewed-by tags when posting new versions. However,
> > there's no need to repost patches *only* to add the tags. The upstream
> > maintainer will do that for acks received on the version they apply.
> >
> > If a tag was not added on purpose, please state why and what changed.
> >
>
> Hi Rob,
> There was a change between v9 and v10 on compatible string so I did
> not add your Reviewed-by.
> Now it is "qcom,sc7180-sndcard-rt5682-m98357-1mic" following Stephan's
> comment in
>
> https://patchwork.kernel.org/comment/23608881/
>
> to make compatible string more specific to board configuration.
> I only add the note to the cover letter. Sorry the cover letter became
> too long to follow.
> I will add the note in patch mail itself for future changes.
> Thanks for taking a look again.


Hi Rob,
Could you please kindly review this patch ?

v11 contains the compatible string  "qcom,sc7180-sndcard-rt5682-m98357-1mic"
following Stephan's suggestion in

"[v9,3/3] ASoC: qcom: sc7180: Add machine driver for sound card registration"
( https://patchwork.kernel.org/patch/11770201/#23608881 )

to specify the combination of components.

Please let me know if this looks good to you.
Thanks!
