Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C38BF82C2
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Nov 2019 23:11:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8EBD51681;
	Mon, 11 Nov 2019 23:10:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8EBD51681
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573510279;
	bh=AG/B462NYOFDVRobN+KHDgAVC+z/aGpP7RJKamvhL+0=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Sako4CD69w3II7ByRZr9bzWhTROdMVgeJBxXpyJ3HVLqek91HKXZshRUjEqva0Cr3
	 DEXgpmbkYfXXXI6j3Fk2vvgAokpAveZQ8KLlBaXjafFh7ILPjKuuydI74Tjwv9iAEZ
	 ztvhH99GXjUzWys82Wnyp/KfObPvEONZIfBHqXq4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 86B39F8053A;
	Mon, 11 Nov 2019 23:09:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8BFBCF80518; Mon, 11 Nov 2019 23:09:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-14.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled
 version=3.4.0
Received: from mail-qv1-xf43.google.com (mail-qv1-xf43.google.com
 [IPv6:2607:f8b0:4864:20::f43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B5C92F80275
 for <alsa-devel@alsa-project.org>; Mon, 11 Nov 2019 23:09:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B5C92F80275
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="owQ/qlXm"
Received: by mail-qv1-xf43.google.com with SMTP id g12so5528332qvy.12
 for <alsa-devel@alsa-project.org>; Mon, 11 Nov 2019 14:09:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+LELEGdD4U9WAWEr1dI90kJm1zda4YVm9N87tjpb2Aw=;
 b=owQ/qlXmJ1VbKaqFOR3MmgT21FUe9W50NHasZa9xiMe21Lh+D2RME+Fs4t3NcLKaRo
 o66Dqm2VuTDv0ho5PIkkyGQZRrgeINdZiq7kiBzVe2wiEFt/8CHRxjVcQ8dUc5+thPDw
 XYzW+fAN1pmx1Aogr3FONxp6DlVD4PSonuiL+fG0mfa9laXDwlvZY36CfzGpBdQ4p4tC
 UTiBPzlNQK7HF32zX+wSnXozUiMI569BjfD8WeLqqBTCuNf6mT7E2/LcxZvJuNfBFX6r
 bgfbrmjOF+kvdTcqACWNLKtbEM9hqUU2iR4cZETtS/yEHTztuWfF7QZJYuugxsNXalqT
 5XnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+LELEGdD4U9WAWEr1dI90kJm1zda4YVm9N87tjpb2Aw=;
 b=FpJmiCF4tJAbZgMZpLSeWA0EqM9Aa8phIhtZ8LS8ZB5EFKQMytuRSQkMZdh1dqj/rQ
 IzUChkwHxQhSjn/XCnSfVQdPupDn4/qFcIE8j7lR96K12UW/UnzYul2J9hbaWSHo7QsI
 c1nxpKLGpaJ1uRA3Dy/fOmyK8n3LoR7lpkoN+WET5KsnGjjAhF1soPFBWNa15Kg5aNbz
 26sAU/Uzdqv8b0Z5LamHTed/c4wU8exSE7JyJPEId869wDvWv0eF7Vg+Jo5M1UI36sgn
 as/0YnvhKg67PD27ywLoEqJpPdG8bAAPvErz7RigdIKgMfi9yDsU4jfs74tP90LRjZHB
 wApA==
X-Gm-Message-State: APjAAAWn231cxRhMDJV6UMR+x5vQ9h1p8lXDZNZzRm9ZY3YB2NGBIdcY
 ZM2ZxgAvcXve8dXBAsFyhKptUgIwco4bcpxjBCtS2Q==
X-Google-Smtp-Source: APXvYqxgBqQclnP94DBB/uZV4/ldVszNiXJ5k8Wg16r+WPr0E0ogVdibjlCtS+y1TdF1qr92MVJ7owGqCMejWyGJ6mU=
X-Received: by 2002:ad4:4b08:: with SMTP id r8mr17258552qvw.75.1573510183299; 
 Mon, 11 Nov 2019 14:09:43 -0800 (PST)
MIME-Version: 1.0
References: <20191107015808.26844-1-cujomalainey@chromium.org>
 <20191107015808.26844-8-cujomalainey@chromium.org>
 <8d37c722-978c-5323-0536-156e513bcc29@perex.cz>
In-Reply-To: <8d37c722-978c-5323-0536-156e513bcc29@perex.cz>
From: Curtis Malainey <cujomalainey@google.com>
Date: Mon, 11 Nov 2019 14:09:32 -0800
Message-ID: <CAOReqxgW1DjkVNaUZzBFQpNymkMrozzH5jt2-o0v2fNju1n_dw@mail.gmail.com>
To: Jaroslav Kysela <perex@perex.cz>
Cc: Curtis Malainey <cujomalainey@chromium.org>,
 Mark Brown <broonie@kernel.org>,
 ALSA development <alsa-devel@alsa-project.org>
Subject: Re: [alsa-devel] [PATCH 08/11] ucm: docs: Add CaptureChannelMap
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

On Mon, Nov 11, 2019 at 7:32 AM Jaroslav Kysela <perex@perex.cz> wrote:
>
> Dne 07. 11. 19 v 2:58 Curtis Malainey napsal(a):
> > Explains to userspace how some channels may need to be rearranged. This
> > is useful for systems that may have DMIC pcms with dead channels that
> > will need remapping.
> >
> > Signed-off-by: Curtis Malainey <cujomalainey@chromium.org>
> > ---
> >   include/use-case.h | 3 +++
> >   1 file changed, 3 insertions(+)
> >
> > diff --git a/include/use-case.h b/include/use-case.h
> > index 31f9e4be..9a10f390 100644
> > --- a/include/use-case.h
> > +++ b/include/use-case.h
> > @@ -305,6 +305,9 @@ int snd_use_case_get_list(snd_use_case_mgr_t *uc_mgr,
> >    *      - Remap channels using ALSA PCM channel mapping API notation
> >    *        E.g. "2 3 0 1 -1 -1 -1 -1 -1 -1 -1" means, FL takes channel 2,
> >    *        FR takes channel 3, RL takes channel 0, RL takes channel 1.
> > + *   - CoupledMixers
> > + *      - Mixer controls that should be changed together.
> > + *        E.g. "Left Master,Right Master".
> >    *   - EDIDFile
> >    *      - Path to EDID file for HDMI devices
> >    *   - JackControl, JackDev, JackHWMute
> >
>
> I do not see which names are referred by this. It's for the snd_ctl interface
> or for the simple mixer ?
>
>                                                 Jaroslav
>
Yes, this would be referring to volume mixers in amixer.
> --
> Jaroslav Kysela <perex@perex.cz>
> Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
