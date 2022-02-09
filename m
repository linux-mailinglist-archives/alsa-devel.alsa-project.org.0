Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9600D4AEDB2
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Feb 2022 10:10:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3851718A7;
	Wed,  9 Feb 2022 10:09:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3851718A7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644397831;
	bh=dHwQvUAM59+MKDaZm/ESogXM/fXWbb/YZJanSdEmQKw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Vxg2O2UYK3eJHNDQPFaWiVDCF4Tn83XpsiW8UePN2LlUI93LUmlHoUgfou6tf6giT
	 DKcsnzIwxwfSACn2D+WILll2cIYDbMEu8rqGvsL7wWXKo1YQ/oZ6NSUIePpLugo/X1
	 CpBbuFBcHXMPUaz3/RUem5l/m7TxLbPJV3yf3oLw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F3C85F8051C;
	Wed,  9 Feb 2022 10:08:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 00C1DF8016A; Wed,  9 Feb 2022 10:05:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com
 [IPv6:2607:f8b0:4864:20::b2f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BA86DF800ED
 for <alsa-devel@alsa-project.org>; Wed,  9 Feb 2022 10:05:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BA86DF800ED
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="Q7RX2xsV"
Received: by mail-yb1-xb2f.google.com with SMTP id v186so4087756ybg.1
 for <alsa-devel@alsa-project.org>; Wed, 09 Feb 2022 01:05:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IPF0PjuZF19JidGX9B02b4KeSaFHazqRUzXT4U3ZGOo=;
 b=Q7RX2xsVwtzySD8bB3ppxCCCC35bwPle8mNdnUYSw6B7hTXWTmcu+xxx34B095S5GP
 gUZaBRcI22uTSfhknWNHyIpRmF71Szon+ZHRmIhk2qfsCP8r8iE1Ib5AvUXqPb8ANFv9
 6zzOrfnR2w//SA4hnga+TZXQ+k2WqDAYqaTgE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IPF0PjuZF19JidGX9B02b4KeSaFHazqRUzXT4U3ZGOo=;
 b=7/I3juuhKFIQlaUP3CqVkVEXXUjwK8mOpZhntbaKkP8j+i8wPwr0G4V1Ku3+mucpAS
 NwGaCNCw8V46XymwotAeJIOQtuzqfZdl9sKvPOckOkksrUGtDiAD+u+EHOn4msRGygSM
 qVoSypX2eV6Wrjma6rhdXFTfRccg6Z/Uur9fcqqPMs3ChYasoupP03dQ2nPldCgiqJS6
 kTLxjF2rAh20nvCQe8vD7wMWldJXJE5QqH5jOYZm+PU6j5AEYab48sqNr+SrW5Pisclh
 03XH1SEnwG0XlEWLC/39Ni9KP6NgqzZndBV+yPoQ95o1XuG6ymCQEQ0/9EgbxWb3irSR
 A0bA==
X-Gm-Message-State: AOAM532LezF7ae9TZhxmYE0debGnx1Me44bBCWJ4BKWTwtSkEicimojP
 u+1Tz2CRf3E2ecIcimd8SOmrBkmXMlvoUKFuRM6L+w==
X-Google-Smtp-Source: ABdhPJzXzw01hWj9cS/+Efn3FknC2m6fGl1/vOpHEF2QbGtMrXYty9/sHmbp9NaeGCwEPm1kzf5WEwHA60h+EZhGeqQ=
X-Received: by 2002:a81:e245:: with SMTP id z5mr1106749ywl.282.1644397506236; 
 Wed, 09 Feb 2022 01:05:06 -0800 (PST)
MIME-Version: 1.0
References: <20220208031242.227563-1-tzungbi@google.com>
 <YgLC8trl9L30Ofwn@google.com>
In-Reply-To: <YgLC8trl9L30Ofwn@google.com>
From: Cheng-yi Chiang <cychiang@chromium.org>
Date: Wed, 9 Feb 2022 17:04:39 +0800
Message-ID: <CAFv8NwK2Bd-guWPE+Uub1x0zguPHZBxZALDmLiurthq-KJKgPg@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: update cros_ec_codec maintainers
To: Benson Leung <bleung@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Wed, 09 Feb 2022 10:08:04 +0100
Cc: Tzung-Bi Shih <tzungbi@google.com>, alsa-devel@alsa-project.org,
 broonie@kernel.org, bleung@chromium.org, chrome-platform@lists.linux.dev
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

On Wed, Feb 9, 2022 at 3:22 AM Benson Leung <bleung@google.com> wrote:
>
> Hi Tzung-Bi,
>
> On Tue, Feb 08, 2022 at 11:12:42AM +0800, Tzung-Bi Shih wrote:
> > Updates cros_ec_codec maintainers.
> >
> > Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
>
> Acked-By: Benson Leung <bleung@chromium.org>
Acked-By: Cheng-Yi Chiang <cychiang@chromium.org>

Thanks Tzungbi!
>
> > ---
> >  .../devicetree/bindings/sound/google,cros-ec-codec.yaml          | 1 +
> >  MAINTAINERS                                                      | 1 +
> >  2 files changed, 2 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/sound/google,cros-ec-codec.yaml b/Documentation/devicetree/bindings/sound/google,cros-ec-codec.yaml
> > index 77adbebed824..c3e9f3485449 100644
> > --- a/Documentation/devicetree/bindings/sound/google,cros-ec-codec.yaml
> > +++ b/Documentation/devicetree/bindings/sound/google,cros-ec-codec.yaml
> > @@ -8,6 +8,7 @@ title: Audio codec controlled by ChromeOS EC
> >
> >  maintainers:
> >    - Cheng-Yi Chiang <cychiang@chromium.org>
> > +  - Tzung-Bi Shih <tzungbi@google.com>
> >
> >  description: |
> >    Google's ChromeOS EC codec is a digital mic codec provided by the
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 568152aa9973..a1f4fd15e770 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -4573,6 +4573,7 @@ F:      drivers/platform/chrome/
> >
> >  CHROMEOS EC CODEC DRIVER
> >  M:   Cheng-Yi Chiang <cychiang@chromium.org>
> > +M:   Tzung-Bi Shih <tzungbi@google.com>
> >  R:   Guenter Roeck <groeck@chromium.org>
> >  L:   chrome-platform@lists.linux.dev
> >  S:   Maintained
> > --
> > 2.35.0.263.gb82422642f-goog
> >
>
> --
> Benson Leung
> Staff Software Engineer
> Chrome OS Kernel
> Google Inc.
> bleung@google.com
> Chromium OS Project
> bleung@chromium.org
