Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 00D7D22C844
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Jul 2020 16:43:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A386B1689;
	Fri, 24 Jul 2020 16:42:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A386B1689
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595601827;
	bh=zxq5ya50Yenu1hFtTFFcwLrG9temY2sEvcVLzp79Q6w=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HpifsoeOr9byJnmasWicCxGdZVchtA3EFX+hyJ3Lxb4K7gEvWNZjt+wtoZfLGegGN
	 O9ckxNHx+MSMbTrynOWmSu+P2pu7xJsDhccRUfHcltKtuTTaTcdhneTCSVISZy8/HH
	 koeP6PgNrAMNdVJlJGG6ul0NQrazXZv4xlC91ZxI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D176BF80150;
	Fri, 24 Jul 2020 16:42:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 547BCF8014C; Fri, 24 Jul 2020 16:42:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,SPF_HELO_NONE,SPF_PASS,
 USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled version=3.4.0
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com
 [IPv6:2607:f8b0:4864:20::d43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3D174F8011F
 for <alsa-devel@alsa-project.org>; Fri, 24 Jul 2020 16:41:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3D174F8011F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="AnKoQ0sD"
Received: by mail-io1-xd43.google.com with SMTP id k23so9971881iom.10
 for <alsa-devel@alsa-project.org>; Fri, 24 Jul 2020 07:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OdGcM/MOvp2upn+g+OVHoMDFxJN5s+fb2Bt1u2fSUkI=;
 b=AnKoQ0sD2UH95E5LEBsMVppF9H9U7IPlUejdwPAg9uMMGYd9gNxgg0lJ4hNb0BV5Ys
 UceKyyDpNNALJDbLnHMuhRY+oMJAbwp1tzsb1CW5jyjhOW92SWYbaosg6dA2n1JAnZnU
 ZtgWzGZHUXSr9FxO7B5TnkHSIywcaMYnpavmIkBXatqi90eSgb9NkV7ScAg5tc7+1/Pk
 Pp+cDcJq1m4EoeI1JQ5OyOYv3LQnCSDNJMemy7FABtyIo/y5JJR1SLj2WkDXAPteWBsy
 3TfUVwRjIaKl9VefG73DkyRpKr3R+0ckcK2F9hxK8XcGWMSocSxqH+pPknVVBpEiBlWj
 +3EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OdGcM/MOvp2upn+g+OVHoMDFxJN5s+fb2Bt1u2fSUkI=;
 b=DpL65nVe0MHXVUi1tRHXb9TYZsIZM6mfELoboeCTyP833W7o0RjmSCscftbFdB8bw1
 4AD9Oxz0Wa9SKptdrQhsjaHdZ74BOLlH1U99oB6Q/xavZVbi9oPWq3NXfqLsAHzAs3er
 /VVThtb/76RNCgP99dEp9H7926GgU5InDP4P5QXyDgA3MGeAWQFiMNTkdYvMrIV2Ng7N
 E+ozJVWCKpt//qN7NPIhk4JzA9ReoR2GeHnysv7LqL95yhwuq1nK0/i8jaKJs0EeFsVt
 SG+3J0gwnXxao0uWLDtLgORv8nhAgM0jIGx9Z5SYLCOeZssXXOSyP82RGyOAQVNSG9hz
 9VWg==
X-Gm-Message-State: AOAM531k9Q9FRtz8MJjU1nRNWl4q7Rh6bWua6T0g3aVSZND/7m7ahipj
 69EHlanYiAiVGdiNcLW9mJvVKizlhO90Nx7cKpYQ6w==
X-Google-Smtp-Source: ABdhPJwfGUyrGelHC3DZLgiaBQXtOJNXUS0j5mfhmtyvaae4iUET52Do4rpivcwsM3+ABof16oAe9xm6imRgYsRttZ0=
X-Received: by 2002:a05:6638:1513:: with SMTP id
 b19mr10813859jat.109.1595601712402; 
 Fri, 24 Jul 2020 07:41:52 -0700 (PDT)
MIME-Version: 1.0
References: <20200724070731.451377-1-tzungbi@google.com>
 <20200724111634.GB5664@sirena.org.uk>
 <CA+Px+wU-R2qOFK8RhLzTXTqDheZhzOyKuiR-1S9qXj02QdruAA@mail.gmail.com>
 <20200724130151.GG5664@sirena.org.uk>
In-Reply-To: <20200724130151.GG5664@sirena.org.uk>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Fri, 24 Jul 2020 22:41:41 +0800
Message-ID: <CA+Px+wVteAt5_QrGmRXcPVHJ5bEtXn9RiXH-bgcRiY_OezFj9w@mail.gmail.com>
Subject: Re: [PATCH] ASoC: dapm: don't call pm_runtime_* on card device
To: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Cc: ALSA development <alsa-devel@alsa-project.org>,
 Liam Girdwood <lgirdwood@gmail.com>
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

On Fri, Jul 24, 2020 at 9:02 PM Mark Brown <broonie@kernel.org> wrote:
> On Fri, Jul 24, 2020 at 08:26:13PM +0800, Tzung-Bi Shih wrote:
> > On Fri, Jul 24, 2020 at 7:16 PM Mark Brown <broonie@kernel.org> wrote:
>
> > > Why is this a good fix, as opposed to only skipping the set_bias_level()
> > > bit?
>
> > Did you mean: skip to call snd_soc_dapm_set_bias_level() in
> > dapm_pre_sequence_async() and dapm_post_sequence_async()?
>
> No, I mean why not just add the missing puts which are currently being
> skipped due to being caught up with the bias level changes.

The challenge I'm facing: (&card->dapm)->bias_level is always
SND_SOC_BIAS_OFF.  Commit 4e872a46823c stops to update it.  It has
nowhere to add the missing puts().

Ideally, if the bias_level goes away SND_SOC_BIAS_OFF in
dapm_pre_sequence_async(), it calls pm_runtime_get().  If the
bias_level goes into SND_SOC_BIAS_OFF in dapm_post_sequence_async(),
it calls pm_runtime_put().

I tried to revert commit 4e872a46823c but it seems to screw the card state up.

Would you have any suggestions?
