Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FC952CCF3
	for <lists+alsa-devel@lfdr.de>; Tue, 28 May 2019 19:03:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8C93D1757;
	Tue, 28 May 2019 19:02:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8C93D1757
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559063021;
	bh=F3PcZo070Jo3x5ppYIUYh+cl8gbNoMujZPxGZmrlDRc=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sSu50jRzF8voZ4dT4IkFJnGSF1r1NKFz45sM2Poo/bPkDDbH9Jvy2rQ1wVaYSg03I
	 5GZN5JDJXmT65gcxH3BX4Ls//KtiFDHPZuf0MYcrv1q1pIzFDNN/f799OBlo5V4B1c
	 5v+k68vA44/RyyTmvbd6PXePkCIlMFcun/XXm2d4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0C898F896EB;
	Tue, 28 May 2019 19:01:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BD3D9F89706; Tue, 28 May 2019 19:01:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
 [209.85.210.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EF950F8072E
 for <alsa-devel@alsa-project.org>; Tue, 28 May 2019 19:01:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EF950F8072E
Received: by mail-ot1-f68.google.com with SMTP id u11so18443835otq.7
 for <alsa-devel@alsa-project.org>; Tue, 28 May 2019 10:01:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iXaT/662lKTTFQBCDcS2ZEat9fIaR7M4GYugaqB1Wkg=;
 b=IAy0wgQRIqmm53gggmBh+XnCeTe67dqAxqEcbp4irJg2x9mZjlHFXE/FsqbJqELn6w
 r/gtbdkKrsUav8odmikltlBbah3n3bD7V6da9cbnZNLNBbko/t70Jg1T6BZ84ZmM9zAO
 Wx6JDCAKgGWH401v74tkG1DzK25dv7Hkh4JE1zwywOLpDDO37qMliSU8u+JADtOe1ung
 +AY3bzLCodPASNi50CzJmbI/JSPruzxujsEGIz/RMGfACp7ERzm2fDDV1P61xHK8Regi
 Nh6byCQJDpSdMraY8zACqDXrT6gfg6vi68NylBJ5jcgciPKM/FAECvK+ObbEIW/HzxlC
 jVOg==
X-Gm-Message-State: APjAAAVBzSC69FDhMZt/wOD2RINW0MJV5+68Lkwm+G/WiaYRz1MWnLuT
 7bx84+rvPECRZl+LLBw9rt1GooXmMMegzsQ5jn0=
X-Google-Smtp-Source: APXvYqzmGWU8ZNTdJwZ7u85ckVkZqsIKCQQEp9F5em1sf5denOzFAP+GNJ41Bi9X/+eSkm14ZNv7TMXictQhTW/dCBc=
X-Received: by 2002:a9d:7dd5:: with SMTP id k21mr49049157otn.167.1559062909795; 
 Tue, 28 May 2019 10:01:49 -0700 (PDT)
MIME-Version: 1.0
References: <20190528154312.14435-1-ckeepax@opensource.cirrus.com>
In-Reply-To: <20190528154312.14435-1-ckeepax@opensource.cirrus.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Tue, 28 May 2019 19:01:38 +0200
Message-ID: <CAJZ5v0h28OAiT7KP=TLu069hNvYjCLoFndS+zx7_iE+jKfOF2w@mail.gmail.com>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Mark Rutland <mark.rutland@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Mark Brown <broonie@kernel.org>, patches@opensource.cirrus.com,
 Lee Jones <lee.jones@linaro.org>
Subject: Re: [alsa-devel] [PATCH 1/6] device property: Add new array helper
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Tue, May 28, 2019 at 5:43 PM Charles Keepax
<ckeepax@opensource.cirrus.com> wrote:
>
> It is fairly common to want to read an integer array property
> that is composed of an unknown number of fixed size integer
> groups. For example, say each group consists of three values
> which correspond to the settings for one input on the device
> and the driver supports several chips with different numbers
> of inputs.
>
> Add a new helper function to provide this functionality, it
> differs for the existing helpers in that it allows reading a
> smaller number of values than the full array size and checks
> that the number of values read is a multiple of the group size.

As a rule, you need also CC all of the device property framework
changes to linux-acpi@vger.kernel.org, so please resend the series
with that taken into account.

Thanks!
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
