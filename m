Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EE1302A15FE
	for <lists+alsa-devel@lfdr.de>; Sat, 31 Oct 2020 12:40:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 67AB01671;
	Sat, 31 Oct 2020 12:39:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 67AB01671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604144449;
	bh=lwI65AlzGazZwxvIjte3MfnV/3o7x26JrigynfqZ8Ao=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bnkQ2uzptIqddH1CxEF/Na17Tjc2wMY3gDhIp4RCi44Hx6nFL2QW7293/G3V4UXzw
	 0uh7byG482W1oBfIuMjhxtLxGRNKyvm2BGrwihAlD1xaHdurgOvYVJVeTltUmwbuyC
	 JttQULpzV1JUoQsrv4iFZP/mEQJbPDQn8QAkBwJs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6BD98F80217;
	Sat, 31 Oct 2020 12:39:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2703FF8020D; Sat, 31 Oct 2020 12:39:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-14.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,PRX_BODY_30,SPF_HELO_NONE,
 SPF_PASS,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled
 version=3.4.0
Received: from mail-il1-x141.google.com (mail-il1-x141.google.com
 [IPv6:2607:f8b0:4864:20::141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B7F4EF800FF
 for <alsa-devel@alsa-project.org>; Sat, 31 Oct 2020 12:39:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B7F4EF800FF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="MzPO9MZk"
Received: by mail-il1-x141.google.com with SMTP id v18so8837550ilg.1
 for <alsa-devel@alsa-project.org>; Sat, 31 Oct 2020 04:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iWr+b4d6vRwF0t5pomRiiNEuuSgjMZV6gdO6R0PGLGI=;
 b=MzPO9MZkXm8AlGd0bbcmenmj7NNR02MYFGX58iMzgPYBVdibEAsD6rhrnBbLTiSN2e
 QJ2+W9cgZrEAyuJKQuK8CSpJMY29IJKDaQEnU8V6duBohUzStWQhsAsy6k2z+6hSU12u
 ASW0Uzerm/BtVE/Ah1sBFrIxjkP3lrHBg9XwGiCigGkMGA3+4mY06kR6JZwSsXnonGrn
 eQwZ2wbLdZQokDrDN8o+VLv9+LBf6tOHq1JqxalVnAd1sENv2Pbv0tDw4quoHb2w6lY2
 rRQpLQ2F6ppixFa5jX8QaNEAX9JhEfoqJmr1Ocgvpg+tgLg4XYSYqPpx94/Mqhv9JKmC
 FDKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iWr+b4d6vRwF0t5pomRiiNEuuSgjMZV6gdO6R0PGLGI=;
 b=P8K1/QyE3sCmXEC9nz1WTO+Ieorfo2RYBJw/KuuLm8Pn6gbZ+u5XoCVTmUIKgvqY+0
 5wWTRt/ZfQGzLZ3jTbgefpiaEfkbSOB+5GYwcfL4a/2z9n0mJxJyabmRpJVRIizP3//Z
 JFK95g/D5yuQTaRlIw0jS2qiswYY/mWnHGDZHBT207Kssn5IF9aLXM6bk71nupQ+EPPC
 3w9TzKpBYqQB/EG8WaYd5/uJumMEQJxKY1m/rMzaebLUi7FfuwOAcAc+8ZpAERoZfHoC
 yWh5pXZADHQYG1g1r9+yRalAN61FUBpCn35aYQtUT2dFI7A9VOczG+crFhEYjg3LUwsN
 Vl+A==
X-Gm-Message-State: AOAM533fR9441kXd0K88vCEhFsGyz68yUcqEyhFGEccF8+u49bSOc77L
 +oDW8w67I9/X8b/YRGzQkEiHjRyAE/ZWXQVbsz12YQ==
X-Google-Smtp-Source: ABdhPJxbtHT4iEyYwAkR4uBqXRY1zR99kXZQu5XEK1tkG0oSS3Wtm3zR0200hnrm2sMfkJJaP+DMIB2xXM3V68/vRfQ=
X-Received: by 2002:a92:480e:: with SMTP id v14mr4468180ila.218.1604144338898; 
 Sat, 31 Oct 2020 04:38:58 -0700 (PDT)
MIME-Version: 1.0
References: <1603521686-13036-1-git-send-email-jiaxin.yu@mediatek.com>
 <1603521686-13036-3-git-send-email-jiaxin.yu@mediatek.com>
 <20201030182339.GA4069524@bogus>
In-Reply-To: <20201030182339.GA4069524@bogus>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Sat, 31 Oct 2020 19:38:48 +0800
Message-ID: <CA+Px+wV5v2NK5hQ7sqHHFXVE34iLmi8+7caHZpD5Y=SX5x57ag@mail.gmail.com>
Subject: Re: [PATCH 2/2] dt-bindings: mediatek: mt8192: add ul-delay-ms
 property
To: Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, ALSA development <alsa-devel@alsa-project.org>,
 Takashi Iwai <tiwai@suse.com>, Jiaxin Yu <jiaxin.yu@mediatek.com>,
 shane.chien@mediatek.com, Mark Brown <broonie@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>
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

On Sat, Oct 31, 2020 at 2:23 AM Rob Herring <robh@kernel.org> wrote:
> On Sat, Oct 24, 2020 at 02:41:26PM +0800, Jiaxin Yu wrote:
> > +  mediatek,ul-delay-ms:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description: |
> > +      Skip first time data at the beginning of DMIC recording
>
> What does 'ul' mean? Nothing tells me this is DMIC related in the name
> and 'ul' is not used anywhere in the description.

UL stands for Up-Link.

Please ignore the patch series.  We won't implement the delay in
mt6359.c.  Instead, we'll leverage generic dmic.c.  See
https://patchwork.kernel.org/project/alsa-devel/patch/1603521686-13036-2-git-send-email-jiaxin.yu@mediatek.com/#23716495
for previous discussion.
