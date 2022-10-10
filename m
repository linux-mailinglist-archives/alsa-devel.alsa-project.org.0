Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BEE15FAC18
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Oct 2022 08:05:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AE38A3688;
	Tue, 11 Oct 2022 08:04:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AE38A3688
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1665468299;
	bh=2Wy1lNZl5CVliIER5Lc4QQY7lJEOR+7bCFx7xTWPFS4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OZF+CID/gCjITgOXCHTHAYsch3YNK8JGFLD8kSyk9shEn0ezEPvxFAJWCp5ddCEZQ
	 RqdupNGtETp1k9w0F5+eLeHMzXX78AJVcejD7HrnQuzRWllKh3TomKULqbP9M0zvZZ
	 b1vRM5JjTJ5KUXin/px//J0UqeqIb9zuNff9Wmig=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CDE00F80563;
	Tue, 11 Oct 2022 08:02:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AC462F8032B; Mon, 10 Oct 2022 17:20:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
 RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com
 [IPv6:2607:f8b0:4864:20::d34])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5EE9FF80107
 for <alsa-devel@alsa-project.org>; Mon, 10 Oct 2022 17:20:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5EE9FF80107
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="TBb+j24T"
Received: by mail-io1-xd34.google.com with SMTP id p186so8681535iof.5
 for <alsa-devel@alsa-project.org>; Mon, 10 Oct 2022 08:20:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AcKHzg1i2Me8EqhKFtNfioe60y1iB3hPVRhH6rIJCT4=;
 b=TBb+j24Tql7lMGBRzux71qaHiImguWET6ioHZwhlZ4PdQUXhkEUgc9YOW2brTKqdnU
 8zTdhhtE7FUBVfXd1p7V5o1v4uCOYImJzPziLfaBNtDjB6Lrev5IY7SQNgg3pn5bQSMo
 wLW9nC2azr6mXZPGtkuHgN7gGw8TMPg79Qe0VkSK8fjyc7/4zb1PCeDnQBZmDTzglw8j
 /X5XK38i7eIYFwkLSxF6OUHXkgi42yJ8QQcXEtPTdKVOm+4NKMB8BmKaGRvvfzn+j3Hz
 zSDOr32ibJj4YfXyruWXwLovx8aJxum1btItTe2ySVpLb3/D8dHAF3u1P9O+GaFv+WqJ
 Feuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AcKHzg1i2Me8EqhKFtNfioe60y1iB3hPVRhH6rIJCT4=;
 b=UftGfEWQrTsteEQUbEeV8JCF9obt+7nABFu4DLde5mUi29BZBj/xs7I0ILr6KXxCy3
 5X13yQEGzW6kP8b37oQ4Ul/L+kWhLvFRei1IUMPizVEnJrnD8yRBqvobhZ9SnKru2ifF
 eM9zcXi7CZDDAkLYSfpvdRPShYj2zi2W2ARLVDKDCbebVBCMkPmgHzpzP4mJPjO2wZPa
 ICzNo6O7HW5aEuCMGji125UQKfZ384e3uMnbckUi4wZt4vJq9+6PbqzYwU2aTBvcRe1o
 z78zY8mTRZx5m/ZFW1uul/0APrkjaQBOandcV4xPe7dc8Pgp1QanKXc7b37dcHjmxO7i
 y5iQ==
X-Gm-Message-State: ACrzQf1ID7/Bf0MC2FAktE1bgGWBEm1ObwkrKdsOPQQEiqEB8h+GeZJH
 CWe5Vh/D87XeeM1PixqzcCUQrYf3lBb6JlsJflo=
X-Google-Smtp-Source: AMsMyM7BgrMi5isfnHCX6JolmakAtvlRr3ULiJstScINCNYrgAduBakCoqPks5lDMlMfN79tBnKa/M8p1ql8Zm59T9A=
X-Received: by 2002:a6b:6f02:0:b0:6bc:15d8:3446 with SMTP id
 k2-20020a6b6f02000000b006bc15d83446mr3512864ioc.108.1665415235626; Mon, 10
 Oct 2022 08:20:35 -0700 (PDT)
MIME-Version: 1.0
References: <20221008181655.2747857-1-lis8215@gmail.com>
 <Y0P/u4pJT8rup8Za@sirena.org.uk>
In-Reply-To: <Y0P/u4pJT8rup8Za@sirena.org.uk>
From: Siarhei Volkau <lis8215@gmail.com>
Date: Mon, 10 Oct 2022 18:20:24 +0300
Message-ID: <CAKNVLfZhH3s=jBWAoSppXSotY9giRRJbub9MqxCtjdZKh4fprg@mail.gmail.com>
Subject: Re: [PATCH] ASoC: codecs: jz4725b: Various improvements and fixes
To: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Tue, 11 Oct 2022 08:02:21 +0200
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Paul Cercueil <paul@crapouillou.net>
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

=D0=BF=D0=BD, 10 =D0=BE=D0=BA=D1=82. 2022 =D0=B3. =D0=B2 14:19, Mark Brown =
<broonie@kernel.org>:
> As covered in submitting-patches.rst this should really be split up into
> multiple patches, with one change per patch.  This is especially the
> case here since you have a mix of fixes and new features which should be
> applied differently.

Got it, will rework.

> > -     SOC_DOUBLE_R_TLV("Master Capture Volume",
> > +     SOC_DOUBLE_TLV("Master Capture Volume",
> > +                    JZ4725B_CODEC_REG_CGR10,
> > +                    REG_CGR10_GIL_OFFSET,
> > +                    REG_CGR10_GIR_OFFSET,
> > +                    0xf, 0, jz4725b_adc_tlv),
> > +     SOC_DOUBLE_R_TLV("Mixer Line In Bypass Playback Volume",
> >                        JZ4725B_CODEC_REG_CGR3,
>
> This doesn't appear to correspond to what your patch description said

I forgot to mention that in the description, thanks.

> and will presumably cause problems for any existing configurations...

I'm curious why this didn't cause problems earlier, as the wrong
control was used
for the Master Capture Volume.
