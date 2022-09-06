Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D5105ADEDA
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Sep 2022 07:20:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A211A846;
	Tue,  6 Sep 2022 07:19:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A211A846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662441616;
	bh=M09TfGNNEa5iS+s1vnB0gzRFrXBrIejr8e0yTVnqaUo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=itfzs4v47XaQAFzSdBxcTXPNimWMYiqV5qDvFlj4+i5u1JVitajJYT6PxoWUTsjCZ
	 +j6gK+MNno3T65m4cwLDPacnOyCWBc6FbcbdVINuRMtIg91okHrTslRXgcy15h4X3k
	 55Yj9/B7sqhuhRlZ7gPozfdNKzRBiLHMz3Cj2Sys=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0CD71F8024C;
	Tue,  6 Sep 2022 07:19:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 15C52F80249; Tue,  6 Sep 2022 07:19:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com
 [IPv6:2607:f8b0:4864:20::130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 55C9AF800E9
 for <alsa-devel@alsa-project.org>; Tue,  6 Sep 2022 07:19:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 55C9AF800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="jTLIue7t"
Received: by mail-il1-x130.google.com with SMTP id v15so5450822iln.6
 for <alsa-devel@alsa-project.org>; Mon, 05 Sep 2022 22:19:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=ely/aEFxFzOsBw72pTQ4C/orrI0uHapotCxDtVzcVYQ=;
 b=jTLIue7tHKiJEkIXE4UvdD0oiM5JDsR6TuVAzKn9K426IYhT2US3RYz/q78X3ZWD6c
 sAhbuxwdk9LtcvA6YbW7AXb+ovyOI68IvMeN5JEeACghUSA+NVCNiHOmQwZsazSFfgGM
 Q0IBWq4vNb7kU3n+Ovg2Oe0zLk54+WFQenC2ZV539EAqJOeDvkp1OkUUm2bRcYL3dHrZ
 jj8zRznnkmaPSvd1/Q//+Smnbl6/cJt0xQsAZ1iwZgZxklQLVEmy8aV6tagiaQShm0R2
 j6wcsFrzK2bm69SBEi5tH2EiZ3vm9MPLIKjLpwB3c/4Tafwc3x7R4pVkBLPMiC81hb4m
 R0Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=ely/aEFxFzOsBw72pTQ4C/orrI0uHapotCxDtVzcVYQ=;
 b=ljI9ajAqxG+ZhhH/2yFEc96jqOWT+iOhG7Lem++tOJ1OUXG0X0+zKi9WbNKsYary7Q
 6eu/cANMTX9PgLB6S2s20b/t30l07ehjp3UYBJwRXRCkdaGa0cU3WBXf4IahUM8dWII+
 n2359ml7GdMePvWvUf05Hd6kKJ6FwaNrIUvlJNszq0MiwIKoUBAJ8ZcU7rmy7qAljQ5h
 /XbIAqOlOtMHyFupf5tvM3DauFggeeWFZ42yFmm/TXYgJ+guLwdcbeNSPve/U6ONrAzZ
 mOKqkh3BgHf/MjUFBiVtd2C2KxaSMtb3sumBSN69ZEl7FmZRTVchpaLp7DM1/VOXGUvW
 KdKw==
X-Gm-Message-State: ACgBeo1BCPCrMQ1O8/zwgh+iF3ldVxTTJNC1g3GyW0CIbGh0aFMu5lSu
 WkZl5xzTEbN5WLI31778tEI9D2JnH8mTj7jLDH0=
X-Google-Smtp-Source: AA6agR5rwgsCL4VMr/DQKH9Y82uS44Oz0RSu8ipUCP41EntnG4CbXRh6pftkDnSorGe7i+G64IFBFZbpeWy6KlRZCzg=
X-Received: by 2002:a05:6e02:1ca9:b0:2e5:fa2a:6345 with SMTP id
 x9-20020a056e021ca900b002e5fa2a6345mr26370929ill.5.1662441550668; Mon, 05 Sep
 2022 22:19:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220826023504.6183-1-steve.lee.analog@gmail.com>
 <Yw+OCnOgYUOWdIEx@sirena.org.uk>
 <CA+Fz0PZStYOZhNpRQCCVKxaDmPPq_PwvWrxfWbq=sBNKrZzzNg@mail.gmail.com>
 <YxCPYbPsEyZmuHOI@sirena.org.uk>
In-Reply-To: <YxCPYbPsEyZmuHOI@sirena.org.uk>
From: Lee Steve <steve.lee.analog@gmail.com>
Date: Tue, 6 Sep 2022 14:17:53 +0900
Message-ID: <CA+Fz0PZv-sxLiXFgFQ4STN+ghg0-eQqW-jXh8X1hzD0ykTn8tQ@mail.gmail.com>
Subject: Re: [PATCH] ASoC: max98390: Remove unnecessary amp on/off conrtol
To: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, krzk@kernel.org, tiwai@suse.com,
 ryans.lee@analog.com
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

On Thu, Sep 1, 2022 at 7:54 PM Mark Brown <broonie@kernel.org> wrote:
>
> On Thu, Sep 01, 2022 at 02:57:19PM +0900, Lee Steve wrote:
> > On Thu, Sep 1, 2022 at 1:36 AM Mark Brown <broonie@kernel.org> wrote:
>
> > > I can't see anything which ensures that this is the case?  Should there
> > > be a check which returns an error if the output is not enabled, or
> > > should the function check the current state and preserve it at the end?
> > > I can see that this would fix problems with it being disabled when
> > > callibrating.
>
> >  As your comment, this can fix amp being disabled when calibrating.
> > And this also fix the case that music play right after calibration.
> > Actually, calibration process should start mute playback before
> > trigger this function.
> > AMP disable/enable control in calibration function can break sync with
> > userspace enable/disable control.
>
> Right, so that sounds like there should be something which checks the
> current state and doesn't start callibration unless the device is in a
> sensible state.

 I will send v2 patch adding check before start calibration.
Thanks.
