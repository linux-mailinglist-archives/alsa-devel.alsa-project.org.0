Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 18489245EF8
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Aug 2020 10:13:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A6AAE1687;
	Mon, 17 Aug 2020 10:12:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A6AAE1687
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597651990;
	bh=Yo1CWloWHthvFyuk3Hg+hCFx7pvkzfD2qDjdRRtj/2Q=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uTAb9zVEyjXYvd8I+keInPo4TNf6hwWTtaPNoubiebd98xK0StzhvhA7Dl7id6Q+9
	 KFJx3UgK19d44ZBFtZ1woT2WvKtnCpGNOd9VEB537aBR8tkrUXVYMhvlo6plZtlhcv
	 qlnJBqu2U/GIQZ8iXNlC8Wyn3CdWZqMdF6mk36Yw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C9BEAF800F0;
	Mon, 17 Aug 2020 10:11:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 49E91F80218; Mon, 17 Aug 2020 10:11:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled
 version=3.4.0
Received: from mail-il1-x144.google.com (mail-il1-x144.google.com
 [IPv6:2607:f8b0:4864:20::144])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 415E0F800F0
 for <alsa-devel@alsa-project.org>; Mon, 17 Aug 2020 10:11:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 415E0F800F0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="rBkaeThX"
Received: by mail-il1-x144.google.com with SMTP id e11so5776637ils.10
 for <alsa-devel@alsa-project.org>; Mon, 17 Aug 2020 01:11:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Lt6hzq5ZQO4HiO3QNUBUTHvgybU3ir4bEXy46hXUV98=;
 b=rBkaeThXVt8B5nb+Cq4kDmKYVxa3SVAFiCNoqheXNihqyvUk+53LxPMfauwnzPS/Na
 VRJpDtqSyoEubgQMwX5GaMPK2SauuRNWBft/Ll8blgxDhTDb280lDQuj3Ua1vXwiKtAL
 5f3iuTgwO8le7b0VoFCIVgWpwHE22MTNbAZbUAF6edvZ7yUV42kD4KbloBmuHLcsa+br
 md9pqQns95LBAeST17auuF2R08fHlmesmmfLAMjB0hmlYLVK0q/BNfJxhRHLzU14ZMIY
 D1l+CW8LUOqZ/eYtjR+lH1FWGMbZ9SkMoSkB800k7o6EHxI711PFk/oynbxsi0OkySqw
 SmZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Lt6hzq5ZQO4HiO3QNUBUTHvgybU3ir4bEXy46hXUV98=;
 b=ntyK5J3KzCT7QHtn85226zLvCoYjizvshthdPPgEqOx6/zDeZQrNKJB9XbHJ2PWh3+
 wo0dbcjHCzJZMB9vaZNsqhVxSj5GA3B05kkziEXdjqjRweNLGBxWsoTzmKljvkqv2d2R
 6JTW9Tdwuxc3QiQ5wOZEGcu8hAmzeuYQRWl3EQFjwS8Vz8kKEAb7Axw4YhJ/rz3+6uh2
 mQVNVTYffPZmx50gyUXr4FH1yLZ61vSjymOPgbwEiS527fhyJgYHl82Z95EZxsqqHnWh
 ZdKXVKWpj2JutR7fu+/8jWFbj4lcjWFjRo8umHgbwZRGMQivqfnfcRxEQA9Le0Yq1RAy
 yPGg==
X-Gm-Message-State: AOAM530P+qjMMrQvviTzGdE1LPBRy4LF2JOebvAlx7k9ICPAH9XvVLRV
 3aHNNdgCORKHvnRIqnXkmMij6WwldKmqJexZT/KnOQ==
X-Google-Smtp-Source: ABdhPJzyL87H7xo+SFVJo6OxddJRwCf8TqTo/jG/8v4crswXEsNPG1scfuanoeHlA4HikpKT8hXnnNsJOLQbgj4Ix9w=
X-Received: by 2002:a92:c904:: with SMTP id t4mr12816222ilp.257.1597651874349; 
 Mon, 17 Aug 2020 01:11:14 -0700 (PDT)
MIME-Version: 1.0
References: <1597644455-8216-1-git-send-email-jiaxin.yu@mediatek.com>
 <1597644455-8216-3-git-send-email-jiaxin.yu@mediatek.com>
 <CA+Px+wXSbGLb+AZnF8ETRycRUVjqk4xacm5DH6MzuMw0vh6Wzg@mail.gmail.com>
In-Reply-To: <CA+Px+wXSbGLb+AZnF8ETRycRUVjqk4xacm5DH6MzuMw0vh6Wzg@mail.gmail.com>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Mon, 17 Aug 2020 16:11:03 +0800
Message-ID: <CA+Px+wUMXoSL6w0wBduE7obJRWgCteeT8=_=U=8LR34JKTTGZA@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] dt-bindings: mediatek: mt6359: add codec document
To: Jiaxin Yu <jiaxin.yu@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Cc: ALSA development <alsa-devel@alsa-project.org>, howie.huang@mediatek.com,
 Takashi Iwai <tiwai@suse.com>, Rob Herring <robh+dt@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 shane.chien@mediatek.com, Mark Brown <broonie@kernel.org>,
 linux-mediatek@lists.infradead.org, eason.yen@mediatek.com,
 Matthias Brugger <matthias.bgg@gmail.com>, bicycle.tsai@mediatek.com,
 linux-arm-kernel@lists.infradead.org
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

On Mon, Aug 17, 2020 at 3:29 PM Tzung-Bi Shih <tzungbi@google.com> wrote:
>
> On Mon, Aug 17, 2020 at 2:08 PM Jiaxin Yu <jiaxin.yu@mediatek.com> wrote:
> > +properties:
> > +  compatible:
> > +    const: mediatek,mt6359-sound
>
> The compatible string has been removed since v3.
>
> > +required:
> > +  - compatible
>
> The same here.
>
> > +examples:
> > +  - |
> > +    mt6359codec: mt6359codec {
> > +      compatible = "mediatek,mt6359-sound";
>
> And the same here.

I misunderstood.  It still needs the compatible string to match the
corresponding driver.
