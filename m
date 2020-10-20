Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 61D78294295
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Oct 2020 20:57:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ACFBA1732;
	Tue, 20 Oct 2020 20:56:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ACFBA1732
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603220227;
	bh=0eduY0cqaWJ0sv3eMfB4fCNcAnTRn0bOLBt59kSe+0I=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Canrt86b0kt73XM77t2SyG/Fg8lsWfxnORo5nnTJREH+SQjAAIxjt/WqE5Oj3B6kG
	 UlbMXwQRP4M4Q6fviyBSGJEikwLcYGWklINizPGovoQu+xKO9tZLTkwN2eaDMK0VMJ
	 RATxXjsS9aLYMx90/HX8nAsvudd37U59s9OJzKis=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 166A7F80475;
	Tue, 20 Oct 2020 20:55:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 67341F804AC; Tue, 20 Oct 2020 20:55:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID, DKIM_VALID_AU, HEADER_FROM_DIFFERENT_DOMAINS, SPF_HELO_NONE,
 SPF_PASS, 
 URIBL_BLOCKED,USER_IN_DEF_SPF_WL autolearn=disabled version=3.4.0
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8B78FF80475
 for <alsa-devel@alsa-project.org>; Tue, 20 Oct 2020 20:55:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8B78FF80475
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="kC1bm7nz"
Received: by mail-wr1-x443.google.com with SMTP id s9so3514955wro.8
 for <alsa-devel@alsa-project.org>; Tue, 20 Oct 2020 11:55:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mScZ8ah2UgtXD/hHaoKN6/WZjy3yp0sHiaOHV6wLFW8=;
 b=kC1bm7nzh6+1h/Q0nN45KdnVbW/OI5uUooOLQ2Vs/LpFzRvJnYRUV+JwP0kcW7T4QR
 41jNfWJ2Z9lO48O89PVVflQTzDH60CTncg14/nyfU9FIEeibQS8Vrf68eqVidtcHz3vp
 3lByNPbOMsEb9+VEVy4e6EqFieABTbe7vnr3g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mScZ8ah2UgtXD/hHaoKN6/WZjy3yp0sHiaOHV6wLFW8=;
 b=M10sGvwzBYeBV0KqglqwSpfYJ4OI+SVr2jElle5Uc0Nt0c1h3Kp+JmlRv0iczGlSZ1
 rzMR841FqQ057s0uAye+FGatihR7omI/6jKzSTBrkexLsnPLRYmno1bNKwQMiNqSrV/g
 OO54ACuEL8ueM4CY5NgK0Q0YKYdP6fScoXw+RFuo4NPxjIcX16rL+ZZBk4e3NCXb8Qd9
 zhZzG1gpehlCjjABR+LS2To05zV9WlqFnj48zFd00veNMpkuzYxe+r7vCRkjnrW/DPSe
 z0QpC7CrREu3fzR6/cM5RSKOjHKGKDUvMrivWecERyEFyFz+jFDK1EUlyeQVbXP/yiWy
 CTrg==
X-Gm-Message-State: AOAM532B4M411IyVyz9kCPjZRyGm47IXctTE8a0NembiEwGRA87qdEnz
 Y5uu43DjuGJC17s6kD5dKhrcFXE4qVKjzKPzs0pEZA==
X-Google-Smtp-Source: ABdhPJxsMtKaYZKishW1LFkqqTjFYaAFJFl/nN/EX/ADY7U9joK0FSO7QV5LU0tzsLkN7u78bKqbrTQK/Z5k/u4nUP8=
X-Received: by 2002:a5d:49ca:: with SMTP id t10mr5023373wrs.404.1603220112425; 
 Tue, 20 Oct 2020 11:55:12 -0700 (PDT)
MIME-Version: 1.0
References: <20200914080619.4178587-1-cychiang@chromium.org>
 <20200914080619.4178587-3-cychiang@chromium.org>
 <7bdc0d63-27b1-f99e-c5f8-65f880733d16@linaro.org>
 <CAFv8NwLkvxX2avoLY+4NY5gBv0dQ863hFFiqy7iQOJxH4WenmQ@mail.gmail.com>
 <20201015161251.GF4390@sirena.org.uk>
 <CAFv8NwL1xX=yPGFqQL_mOzAnPTfH0Z0J6ibG1+D32W46Nx0KYQ@mail.gmail.com>
 <20201020143711.GC9448@sirena.org.uk>
 <63f1a29c-0758-97b8-ce80-fe43d91630fa@linaro.org>
In-Reply-To: <63f1a29c-0758-97b8-ce80-fe43d91630fa@linaro.org>
From: Cheng-yi Chiang <cychiang@chromium.org>
Date: Wed, 21 Oct 2020 02:54:43 +0800
Message-ID: <CAFv8NwJ-+f146Ss9Mk=nEXjm1B--ZwhAgnfx-cTi7DGEKqC1-Q@mail.gmail.com>
Subject: Re: [PATCH v11 2/3] ASoC: qcom: dt-bindings: Add sc7180 machine
 bindings
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Cc: Taniya Das <tdas@codeaurora.org>,
 "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, Banajit Goswami <bgoswami@codeaurora.org>,
 Heiko Stuebner <heiko@sntech.de>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Takashi Iwai <tiwai@suse.com>, Rohit kumar <rohitkr@codeaurora.org>,
 Ajye Huang <ajye_huang@compal.corp-partner.google.com>,
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

On Tue, Oct 20, 2020 at 10:55 PM Srinivas Kandagatla
<srinivas.kandagatla@linaro.org> wrote:
>
>
>
> On 20/10/2020 15:37, Mark Brown wrote:
> > I don't understand what "logic scattered in various dtsi files" means,
> > sorry.
> >
> >> Yes, that should work to describe the dailink we are using.
> >> But a more tricky issue is how to do calls like setting PLL in dai startup ops.
> > ...
> >
> >> I think that asking a generic machine driver to do configuration like
> >> this with only a limited interface of device property
> >> might be too much of an ask for the machine driver.
> > Richard was looking at some basic configuration for PLLs.
> >
> >> Would you mind if I simplify the compatible string like Srinivas
> >> suggested, and send a v12?
> >> As for other two kinds of variations that I am aware of:
> >> 1. front mic / rear mic
> >> 2. replace alc5682 with adau7002
> > The CODEC change is going to be described in the DT no matter what -
> > you'll have a reference to the CODEC node but it may make sense if
> > there's enough custom code around it.  For front vs rear mic the
> > simplest thing would just be to not mention which if this is a hardware
> > fixed thing, otherwise a control.
> >
> >> We can set different board names and different compatible strings to
> >> achieve such variation.
> >> So that it would make sense to describe configuration in compatible
> >> strings like you suggested, and also provides UCM a way to distinguish
> >> different boards.
> > I don't recall having suggested distinguishing these things with a
> > compatible string, especially not the microphones.  UCM can already use
> > the display names for the boards to distinguish things.
>
>
> Not with the compatible string!
>
> Currently card name, and long name are exactly same in all Qualcomm
> soundcards, which makes it very difficult to identify how those boards
> re wired up at UCM2 level. So the plan is to properly populate card long
> name with "model" property which can include details on how things are
> wiredup on that board.
>
> --srini

Hi Srini,
Thanks for taking a look.
Let me try to clarify your comments in case there is any misunderstanding.

I understand your request on having different board variations using
different sound card names through model property, and I totally agree
with that.
As for compatible strings, do you insist on having all the board
variations using exactly the same compatible string ?

Thanks!
