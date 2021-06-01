Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A02AB396D3F
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Jun 2021 08:22:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 208821693;
	Tue,  1 Jun 2021 08:21:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 208821693
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622528531;
	bh=VjF5fmPWmJV34AdLHtXksUvrbFB635DQDVeSSdm6xpw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JxijvQl/cG/iyqGbZjAe5yDx6s1CbINvjZ/eAcHf7pvsLeHb3o7mmqi7eBnCZhgVp
	 CsYhv7VxtPi6JzVukLW+/rYWryKpyzEra/M5E7wscB63TTefIU8Iwlta7O2kUw9S1c
	 4lpYBCYYic3NDmcjoSaKBg0s2rM+TlVPvAL8OOEQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F3980F8025B;
	Tue,  1 Jun 2021 08:20:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BE1D4F80254; Tue,  1 Jun 2021 08:20:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled
 version=3.4.0
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com
 [IPv6:2607:f8b0:4864:20::d2a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B90D5F80141
 for <alsa-devel@alsa-project.org>; Tue,  1 Jun 2021 08:20:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B90D5F80141
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="gWoOaav6"
Received: by mail-io1-xd2a.google.com with SMTP id a8so14053453ioa.12
 for <alsa-devel@alsa-project.org>; Mon, 31 May 2021 23:20:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VjF5fmPWmJV34AdLHtXksUvrbFB635DQDVeSSdm6xpw=;
 b=gWoOaav6t1rcuEJBzjAASU8hMh7ElCyKu3WcOsSLEc3Xe7lVLiay+RXoHxsk5buD9D
 CJxpSkbkECsVfZz3xspVANq7Em5/UA/KnkZK2eyepxsTrI9nmXCBsG/Ba+Fld77RFgyI
 KY0MKjd7G9GdbwK/dn3nFtFKUPHaEO3NiNr9KyReDbaYycz5FX3FtxuKgoUxpMWK06E9
 rTUvb+BIfbN2poEUQU5Hr3BWCif1Gt8KkTBkAKd3ONOXRH1BMGIHpg/bytVrYCBUyiG5
 aOj9qMNfW0/l0idxvtkTiQ1kkAythJVkrd//a8aEGOpbEifgVF7PwRE2MoHgJTRjzPKG
 fs8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VjF5fmPWmJV34AdLHtXksUvrbFB635DQDVeSSdm6xpw=;
 b=quxLs/DQMFH68fixE9L79w1U/MvgrIDeLCuh8aPxowWwmyQiinNUHckI2/lFqabmWq
 kSdkB6zHXPbLQz3JD15hFXabHJMOjiqhYjfAQS61MwB8khUn41M8dlUk1HX/IdyryiQs
 DZHH4TvyksvWgjs+NW5i5BU2+R7eaquEDqlScMoXuQM5J3OTd455DlcOHK6w1tkcq6K8
 /4LNXnoYtGcLE4DQFBBUEJmZC4JNDFwOI1ngISwgvN1oX9d09MCNdl57Kq77CWfZUH3d
 rEbq88RNGGNC/DRnQ4muO7fqk5+S6ut01/AWC2l+h2z/o8+pT/uBtSsMZ8wzB7n6+Pcu
 0tiw==
X-Gm-Message-State: AOAM530wuaOqHoLLRPaC7M/XVW2Eo/TTK27nLLInsPssoqrGQk1zqE0L
 c5+qu07zXSlHFRoGN7at5V0p59WSJ6MpaKTEHMOviw==
X-Google-Smtp-Source: ABdhPJwwuuEEw4PW352dxmKdk5M40VGM4ah+oUqxQCijlCOa4x8O+ussAGmRTo654Y1vrVDRwi6DFNUbJ0yZ/HPFQkM=
X-Received: by 2002:a5d:9694:: with SMTP id m20mr15203280ion.185.1622528428085; 
 Mon, 31 May 2021 23:20:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210526154704.114957-1-judyhsiao@chromium.org>
In-Reply-To: <20210526154704.114957-1-judyhsiao@chromium.org>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Tue, 1 Jun 2021 14:20:16 +0800
Message-ID: <CA+Px+wXGjZCOhhAVh9eRw6L-g8g7Qi7Rf_3YHpHSCB2o=XQ+4g@mail.gmail.com>
Subject: Re: [PATCH] ASoC: max98357a: set channels_max to 4
To: Judy Hsiao <judyhsiao@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Cc: Taniya Das <tdas@codeaurora.org>,
 ALSA development <alsa-devel@alsa-project.org>,
 Banajit Goswami <bgoswami@codeaurora.org>, Liam Girdwood <lgirdwood@gmail.com>,
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
 Douglas Anderson <dianders@chromium.org>,
 Jimmy Cheng-Yi Chiang <cychiang@google.com>, Takashi Iwai <tiwai@suse.com>,
 Mark Brown <broonie@kernel.org>
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

On Wed, May 26, 2021 at 11:47 PM Judy Hsiao <judyhsiao@chromium.org> wrote:
> Sets channels_max to 4 to support QUAD channel.

Could you point out probably the up-to-date MAX98357A datasheet for
4-channel support?

On a related note, from the public datasheet I could find[1], "Table
5" only shows 2 channel's configuration.

[1]: https://pdf1.alldatasheet.com/datasheet-pdf/view/623796/MAXIM/MAX98357A.html
