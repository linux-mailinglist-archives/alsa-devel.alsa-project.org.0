Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D23D525C880
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Sep 2020 20:11:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4E989192F;
	Thu,  3 Sep 2020 20:10:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4E989192F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599156662;
	bh=nPiDyoWWJzvm42z4eUx7TC5eLYWJUkO9RtvWj3RGC4o=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AZq8Sm0Hppe/wwULzZipcXFoutYD/qXpZz9DU/o9lD1/DmKyNkEAf+R6S+M3AVfTs
	 HulE50w9maHvrJN2HDOMPVrrIv7ogefbZbfTF5+nCZ6xzZlFWjSKUamKHh2acU8IhL
	 Hu+y+mzs/sAwuhJS8l23gBTB4ApYozWLY7iYgz6M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 76773F8021D;
	Thu,  3 Sep 2020 20:09:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 893F7F80217; Thu,  3 Sep 2020 20:09:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 193E6F801DA
 for <alsa-devel@alsa-project.org>; Thu,  3 Sep 2020 20:09:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 193E6F801DA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="LFz7ff7j"
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CCD1020716
 for <alsa-devel@alsa-project.org>; Thu,  3 Sep 2020 18:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599156544;
 bh=nPiDyoWWJzvm42z4eUx7TC5eLYWJUkO9RtvWj3RGC4o=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=LFz7ff7jI2wl8OKdb3dNWcGVE0rVk3n6ETlCP3GG74voSOa6MneV8+myrf0nV/Zef
 0JehuZ/+B0CpcMryGcvXEvezk5TOPTZBUJ8RTTPjyF4Qng70D2tVA2i5ZWGTowb/E4
 /337Yq/B4PC/K4TPEzuivLLOqhK6VHTaZj/wmpVM=
Received: by mail-ej1-f47.google.com with SMTP id lo4so5124410ejb.8
 for <alsa-devel@alsa-project.org>; Thu, 03 Sep 2020 11:09:03 -0700 (PDT)
X-Gm-Message-State: AOAM530Swh/ypK68s027z4bNGQSpvTMhyAe/tyfE5YDuxdLeWrKO/qZP
 RqPYGU/DATEj95ZEyR4NV1VZApfKaiQwCklWrwk=
X-Google-Smtp-Source: ABdhPJzc1QCdeTf82nUVf10J2Sk2Ur7ILSjfNO9a+DoLfgN1J37o5UYUSobBWE4r8Ye675Mp9s0eKdYwWTi5/JRf1sI=
X-Received: by 2002:a17:906:af53:: with SMTP id
 ly19mr3296148ejb.503.1599156542378; 
 Thu, 03 Sep 2020 11:09:02 -0700 (PDT)
MIME-Version: 1.0
References: <20200830112633.6732-1-krzk@kernel.org>
 <159897179515.47719.6003518135515395142.b4-ty@kernel.org>
 <20200903164738.GA2929052@bogus> <20200903172645.GC4771@sirena.org.uk>
 <CAL_JsqL+_5Lc5vwtqnCZd6Tz9eB1m_oy2r3gtv0cbwBwKTU=dw@mail.gmail.com>
In-Reply-To: <CAL_JsqL+_5Lc5vwtqnCZd6Tz9eB1m_oy2r3gtv0cbwBwKTU=dw@mail.gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Thu, 3 Sep 2020 20:08:51 +0200
X-Gmail-Original-Message-ID: <CAJKOXPe2XpciJtGAFq8c7E=7wrrzK0XUrquDCaNQK+u-2yLByQ@mail.gmail.com>
Message-ID: <CAJKOXPe2XpciJtGAFq8c7E=7wrrzK0XUrquDCaNQK+u-2yLByQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: sound: midas-audio: Correct parsing
 sound-dai phandles
To: Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Cc: devicetree@vger.kernel.org, Linux-ALSA <alsa-devel@alsa-project.org>,
 Sangbeom Kim <sbkim73@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
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

On Thu, 3 Sep 2020 at 19:49, Rob Herring <robh@kernel.org> wrote:
>
> On Thu, Sep 3, 2020 at 11:27 AM Mark Brown <broonie@kernel.org> wrote:
> >
> > On Thu, Sep 03, 2020 at 10:47:38AM -0600, Rob Herring wrote:
> >
> > > > [2/2] ASoC: odroid: Use unevaluatedProperties
> > > >       commit: a57307ca6b661e16f9435a25f376ac277c3de697
> >
> > > This one should be reverted/dropped too. Patch 1 is fine.
> >
> > There are others?  What's the issue with them?  It'd be easiest if you
> > could send patches doing whatever reverts you're looking for.
>
> Just 1 other you picked up. See "ASoC: samsung-i2s: Use
> unevaluatedProperties". Patches adding the missing properties (and
> restoring 'additionalProperties' on these 2 if not reverted) is the
> correct change.
>
> I've gone thru and NAKed all of the others so more don't get picked up.

Ah, my bad... Mark, I can send a follow up which restores the
additionalProperties (so kind of revert of the second patch) and fixes
the warning. Other way is that you just drop it and I will send a
correct fix later.

Sorry for the mess.

Best regards,
Krzysztpf
