Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B9E243A8488
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Jun 2021 17:49:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 404B11689;
	Tue, 15 Jun 2021 17:48:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 404B11689
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623772174;
	bh=GBinx4Fgo45gvNb6Q+VwiPy/5uxor4+wH/XjaU7vEwU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rNAWISngRm/wU9eT/BssU1wIOMyCPgXQyg1khW8xyAEjldfXDZV8pNrDjCUrzboCJ
	 nGrb6TiOO6sJvqAwooT83qIJsNqu5dpUa9k/HklKY1YWRkr2zto8ilaSQNzp29R5Z4
	 seF9CFtcmGOx9udPCrCPhaobPOXrMERCUt/X1aX8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B9C64F80113;
	Tue, 15 Jun 2021 17:48:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DC0A4F80113; Tue, 15 Jun 2021 17:48:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 911E4F80113
 for <alsa-devel@alsa-project.org>; Tue, 15 Jun 2021 17:47:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 911E4F80113
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="fKBLKEpG"
Received: by mail-wm1-x32b.google.com with SMTP id l9so14424801wms.1
 for <alsa-devel@alsa-project.org>; Tue, 15 Jun 2021 08:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GBinx4Fgo45gvNb6Q+VwiPy/5uxor4+wH/XjaU7vEwU=;
 b=fKBLKEpGGji1pJ8Chsxfvqljab6qo00YqyYLcs9KAIRVzcPyZyRS/9kYae9BQhnPkS
 ZnpNaP5a2XEdbNdJeZViHbkyiIYIIILUexJwCWeSWF8fDuQSgpoe7MuUHFy0z4UazS32
 sDdFgLVdGm9mG/b/9FD+ArxbRhqK74pHM2kr8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GBinx4Fgo45gvNb6Q+VwiPy/5uxor4+wH/XjaU7vEwU=;
 b=dP8JDwVAruf8XU0G+o3lxno6VhnaShPxrwXJkg75K5IzMhEuQqtCd9zPe1LqTALi2N
 Bq1TD6SCJbWWmkpV3z9L4xAk0AACcHg1Utas70p1m1OhsjsSDQ+PALEWCFE5Dj3aVLo0
 Zrxnbkn6qClEhsagi/hJ0ETR0KVjDsjGL2mFPxMxEBu19c0z4lNbjpn7a4deLepKZQWY
 bqSBjp6N5Y0C8ZbPTPsCwwYLLTye/TngaXTVGAXkvKeFzh+lOPnkyBfLWjzwUL01egK/
 piHvU4AWtsuok2hjGSi8FuSdQeRIBKb1DRvQBxTVVErnB3AWmicPsxXHCjyIkldLd8pb
 mL9w==
X-Gm-Message-State: AOAM530wpIoYkg8Ha4OAAm7f+3YWXLKdnlv2cZyVRtx1zRpUiuTCrDOl
 R/EMPqrO9NB546TsOBVrpWUQiRjVAhvCweTz5Btisw==
X-Google-Smtp-Source: ABdhPJwUoEVW6kMYZC606PnYCEczrljMALiN96zNLd0kS0EL2UX5TDso3su7xUx2lhZdDpzedPnxBwH3c8Nmho87MO0=
X-Received: by 2002:a7b:c5d2:: with SMTP id n18mr6083880wmk.97.1623772078396; 
 Tue, 15 Jun 2021 08:47:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210526154704.114957-1-judyhsiao@chromium.org>
 <CA+Px+wXGjZCOhhAVh9eRw6L-g8g7Qi7Rf_3YHpHSCB2o=XQ+4g@mail.gmail.com>
In-Reply-To: <CA+Px+wXGjZCOhhAVh9eRw6L-g8g7Qi7Rf_3YHpHSCB2o=XQ+4g@mail.gmail.com>
From: Cheng-yi Chiang <cychiang@chromium.org>
Date: Tue, 15 Jun 2021 23:47:30 +0800
Message-ID: <CAFv8NwKkfGnpw_5PBwJSjVXsuw3L8=1RyEJ4PWdRX5-J75bk6A@mail.gmail.com>
Subject: Re: [PATCH] ASoC: max98357a: set channels_max to 4
To: Tzung-Bi Shih <tzungbi@google.com>
Content-Type: text/plain; charset="UTF-8"
Cc: Taniya Das <tdas@codeaurora.org>,
 ALSA development <alsa-devel@alsa-project.org>,
 Banajit Goswami <bgoswami@codeaurora.org>, Takashi Iwai <tiwai@suse.com>,
 Rohit kumar <rohitkr@codeaurora.org>, Patrick Lai <plai@codeaurora.org>,
 Andy Gross <agross@kernel.org>, Dylan Reid <dgreid@chromium.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Tzung-Bi Shih <tzungbi@chromium.org>,
 Stephan Gerhold <stephan@gerhold.net>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Stephen Boyd <swboyd@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>,
 Douglas Anderson <dianders@chromium.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Judy Hsiao <judyhsiao@chromium.org>
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

Hi Tzung-Bi,

On a platform, the four max98357a amps will be controlled by only one
codec device, as GPIO for SD_MODE is shared by all amps and is the
only thing to be controlled.
In this sense, I think we can treat max98357a DAI as if it supports
four channels.
I understand that this solution is not scalable, because one can
control as many amps as they want.
Theoretically, the number of supported channels by this codec device
is unlimited.
I found that rt1015.c has similar usage.
Do you have a better suggestion to support this kind of use case ?
Thanks!




On Tue, Jun 1, 2021 at 2:20 PM Tzung-Bi Shih <tzungbi@google.com> wrote:
>
> On Wed, May 26, 2021 at 11:47 PM Judy Hsiao <judyhsiao@chromium.org> wrote:
> > Sets channels_max to 4 to support QUAD channel.
>
> Could you point out probably the up-to-date MAX98357A datasheet for
> 4-channel support?
>
> On a related note, from the public datasheet I could find[1], "Table
> 5" only shows 2 channel's configuration.
>
> [1]: https://pdf1.alldatasheet.com/datasheet-pdf/view/623796/MAXIM/MAX98357A.html
