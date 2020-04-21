Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A4E291B2468
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Apr 2020 12:53:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 35FF51688;
	Tue, 21 Apr 2020 12:52:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 35FF51688
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587466425;
	bh=sgDNBcNGcNAlkjsq8Mw4uS92izlYmE8cO4Qms654BAM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ld2mnAdH9Nr5Vmawcwre39o3QJDuAvnroRtSVdhvJWF5Yvtb3mlAgOmB3T2Y+d6Ea
	 rH/NPz7nXbiYlkSnTv5ug70mvbadxzFogtpysSL7W2B9ZuN7LlWdCk3JD9R08M3Iik
	 3mqeL0IZD/Qt6y5F5cgANg4kr0dtZEiYW0Zuvdbc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 83443F8012F;
	Tue, 21 Apr 2020 12:52:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8D575F801EC; Tue, 21 Apr 2020 12:51:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-qv1-xf43.google.com (mail-qv1-xf43.google.com
 [IPv6:2607:f8b0:4864:20::f43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 66E32F8012F
 for <alsa-devel@alsa-project.org>; Tue, 21 Apr 2020 12:51:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 66E32F8012F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="OOzRVb4R"
Received: by mail-qv1-xf43.google.com with SMTP id v10so2213560qvr.2
 for <alsa-devel@alsa-project.org>; Tue, 21 Apr 2020 03:51:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ivbFUkwRL9S7N1wT7PKkBXOsZsaEcUNHKgJGMoPGLUE=;
 b=OOzRVb4RfJPdYn4zpXtOEhyi979GugRYT98eayitSgigmRN7GGovTmLYdlPS6gENC7
 eyJC1JWayXcESfs32HRksxLNTDphXS9fVFCMcfvS7Eyj/FDcpBXP+MMNhvt2Z9fbkmt4
 5nW+MavhMgBAqGwwB5gEee5Rep+J1L5gCEmyPW+TwaZneNL4L8fmrF74tNgClC80QnyO
 UylThTlptOWK3nNpMymBJopquDsk1lfiqU1lSyaOWdY0BomJdlfgugcZbcznAACmecku
 rPrFPph1m2QjfJqcuk6gORLIB1dVJJWvVUq28TRJjOVHbO3Pnlf1J1zX12M575sZGbbB
 NtKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ivbFUkwRL9S7N1wT7PKkBXOsZsaEcUNHKgJGMoPGLUE=;
 b=OwJdQLHcvRzJI/8JteNSfq+nLtkWO6fAnc3QiP0LI3lzhZxVGNR0rqk+WBWDC3c0at
 hBet3aL89Ncu1zWTyeJ20FBugHeqGKiCLwuRPAHDFbrPxgjiXI5EjFETyghTvtv5NBLx
 0ylrVbNx2d0jbajHzuonEiMvhpCvOmXk8mmwFXsf/oBFYXqH19GqlzstaKKo/hl2+g++
 9XTLmB04m0pcGg4osEtyvczbckRpFO1fccWgADyvrJcwd2PIgygpcFx9fgE0zNRcXrma
 Op8cThUE+RZbM6qwjOyweZmO8n/167p+STUiUFR1ZjbgdVJECVIAAd8P2M6qfbjAMn3r
 /UQQ==
X-Gm-Message-State: AGi0PubDvkgJKGQ0bFEpZIzbdBi/ErJ0uOOu+YLY7eSC9csoX5+FPK1B
 rp9IiBERxHzq/bFn0N9nakwmQ6bADbr5Ba/PUog=
X-Google-Smtp-Source: APiQypJwJ2uOOAPfmeM5nJfx+WsYkHo/Ya0/fvk6XSZOAthRD5GU8swYyAKAdYf6f9Qx1lIW0rGPP6tS1dPTrjZa4Ek=
X-Received: by 2002:ad4:4e65:: with SMTP id ec5mr10315478qvb.32.1587466310751; 
 Tue, 21 Apr 2020 03:51:50 -0700 (PDT)
MIME-Version: 1.0
References: <1587458483-2166-1-git-send-email-shengjiu.wang@nxp.com>
 <20200421095139.GA4540@sirena.org.uk>
In-Reply-To: <20200421095139.GA4540@sirena.org.uk>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Tue, 21 Apr 2020 18:51:39 +0800
Message-ID: <CAA+D8APjn7FrOvYRiTorfSyswm7G5SMcegnJm9sKB8EQKDMgFg@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsl_esai: Remove expensive print in irq handler
To: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Shengjiu Wang <shengjiu.wang@nxp.com>, Takashi Iwai <tiwai@suse.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Nicolin Chen <nicoleotsuka@gmail.com>, linuxppc-dev@lists.ozlabs.org
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

Hi

On Tue, Apr 21, 2020 at 5:53 PM Mark Brown <broonie@kernel.org> wrote:
>
> On Tue, Apr 21, 2020 at 04:41:23PM +0800, Shengjiu Wang wrote:
> > Use dev_dbg instead of dev_err in irq handler, the dev_err
> > is expensive, we don't need the message to be printed everytime,
> > which is almost a debug option.
>
> >       if (esr & ESAI_ESR_RFF_MASK)
> > -             dev_warn(&pdev->dev, "isr: Receiving overrun\n");
> > +             dev_dbg(&pdev->dev, "isr: Receiving overrun\n");
> >
> >       if (esr & ESAI_ESR_TFE_MASK)
> > -             dev_warn(&pdev->dev, "isr: Transmission underrun\n");
> > +             dev_dbg(&pdev->dev, "isr: Transmission underrun\n");
>
> These are error messages which would suggest a problem that'd lead to
> data corruption, it seems bad not to try to flag that to the user -
> surely we've got bigger problems than performance if this happens?
> Perhaps convert to a ratelimited print if the issue is that when errors
> happen they happen a lot?

Thanks for review, I will rethink about this.

best regards
wang shengjiu
