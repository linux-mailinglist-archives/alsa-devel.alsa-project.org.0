Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 827805B1DB4
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Sep 2022 14:54:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B1C00169C;
	Thu,  8 Sep 2022 14:53:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B1C00169C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662641683;
	bh=Gu46DazuNBUooqldl5TxfjOsuqUUsrIpoiwcpkso85I=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CEIcgbnJKIE/zaP6wTKDHrKGwVzOzp7rmVHmNEjVYSpdTXO6/lG7zzq1NvCkoFj2n
	 xpGOekWl6r5NiBPDhcpN9BTnM6izfQ5TR4/wdEJE3Iu0ycpgir3tWiYTrEXYn/eOxY
	 USJ4hhJeiF4EJ2IoZmauxxqYwmsyCpqR2JCbDNNE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 04F8CF8023B;
	Thu,  8 Sep 2022 14:53:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B8AF4F80217; Thu,  8 Sep 2022 14:53:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODYSUB_19,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8AF47F800CB
 for <alsa-devel@alsa-project.org>; Thu,  8 Sep 2022 14:53:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8AF47F800CB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="CG8I5pf1"
Received: by mail-pg1-x52b.google.com with SMTP id s206so16668736pgs.3
 for <alsa-devel@alsa-project.org>; Thu, 08 Sep 2022 05:53:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=UZ9peP4x10da9WU+5kZQ3we5/coNwWfoUbIvllgH1xI=;
 b=CG8I5pf1gu6Fdq+/gn/t5FQ++4yo9HgZUsjBv84K4CgINOpbcPpMbyrlBZWzFi5x67
 MlM1OsPmVMcdgw7/0kX5c3qNJGjziFWsaBaR5+KUslSdfyaZD7dnwS2K8k/rXlMpERtM
 Jrd9m8vhGgNSiHBbjvelDWneVTlb162SkkZ1s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=UZ9peP4x10da9WU+5kZQ3we5/coNwWfoUbIvllgH1xI=;
 b=1F3qyoEuDzJg62BbtOfJXH3tArJHqO8uzobUS7r0NabMBubskHhPhfyxV2QOuPAmch
 h9KIlFdLk5OiOYM6wE1qIKNhMt4EgE6h45nglB9iqi/VgYkQS32ulD6tYVpvCQdUs3PH
 SAsp77XgCvrf49FJiSB80jchndPxBnF2A946zvI7jccQDkx9KJPNpIxVq4Vc03irjrUR
 DxVKVpe5Zja/GeKPnEUbGJdEDI6oXb0lL8sq8VOSPEQ2uKaP+ciVFn4SLvV6XBNk9+EZ
 4m6zpH2Yd69MhrzB0mvzioxPke42vJwBo6kURmo+XiCSlA7efBOn3VKSeoyZTZI5k6Ek
 NFLg==
X-Gm-Message-State: ACgBeo33Ry8D+vHw8C0cKvFfCWorEcbby4v2I1HZ97E2xpLQMg6HB0k6
 TimuHli4wrZAbjwP2bI4H7uVFTFCMHSPSkTpi8zyJg==
X-Google-Smtp-Source: AA6agR7dCr8B4wzx92CEAYx/xvFahkIN09Kn/V3ZV7Dp4tuZvBq/a2ogN24WGDh0eoVdR2jiUFZ2HaX5gv5MbJ3IiuA=
X-Received: by 2002:a63:4a47:0:b0:42b:e4a4:3aec with SMTP id
 j7-20020a634a47000000b0042be4a43aecmr7887785pgl.512.1662641612722; Thu, 08
 Sep 2022 05:53:32 -0700 (PDT)
MIME-Version: 1.0
References: <CAPm_npY3SkumWgy8EN65no2iQFj2KWG6pysUchEKHBBPZ9AHsA@mail.gmail.com>
 <87r10mcmd9.wl-tiwai@suse.de>
 <CAPm_npaJdGfDBvTuL3nvbyT8Rfx3kC8Gy5dS5PPe78Vu7C2xAg@mail.gmail.com>
 <871qsmca8n.wl-tiwai@suse.de>
In-Reply-To: <871qsmca8n.wl-tiwai@suse.de>
From: YJ Lee <yunjunlee@chromium.org>
Date: Thu, 8 Sep 2022 20:53:22 +0800
Message-ID: <CAPm_npbE+Mi_raC-37SuR0Sc_oed1d1agAdShfCjCZ-egVVo4Q@mail.gmail.com>
Subject: Re: About ALSA dummy module: support customized mixer volume leveling
To: Takashi Iwai <tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
Cc: alsa-devel@alsa-project.org, Ching Yun Chang <whalechang@google.com>,
 tiwai@suse.com, Yu-Hsuan Hsu <yuhsuan@chromium.org>
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

On Thu, Sep 8, 2022 at 8:38 PM Takashi Iwai <tiwai@suse.de> wrote:
>
> On Thu, 08 Sep 2022 12:32:14 +0200,
> YJ Lee wrote:
> >
> > On Thu, Sep 8, 2022 at 4:16 PM Takashi Iwai <tiwai@suse.de> wrote:
> > >
> > > On Thu, 08 Sep 2022 07:26:02 +0200,
> > > YJ Lee wrote:
> > > >
> > > > Hello Takashi (and the alsa community),
> > > >
> > > > This is YJ Lee from chromium.org.
> > > >
> > > > I'm thinking about extending the ALSA dummy module to support
> > > > customized volume leveling. It will be very useful to test devices
> > > > with different volume granularity. Currently this module is using
> > > > hard-coded mixer volume leveling, from min=-50 to max=100.
> > > >
> > > > See L716: https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git/tree/sound/drivers/dummy.c?h=queue/5.19#n716
> > > >
> > > > My plan (A) is to expose 2 more additional module parameters and
> > > > replace a few occurrences, from L742-750.
> > > >
> > > > Another plan (B) is to leverage the current existing module
> > > > parameter:model, and make the dummy-module to be able to accept models
> > > > with customized volume leveling. New dummy models can be provided as
> > > > configuration files, and be used in the same way as how currently
> > > > existing dummy models (L146-213) are used. However, it's a bit
> > > > over-engineering from the original purpose.
> > > >
> > > > What do you think about these plans? Any insight you (and the alsa
> > > > community) can provide will be greatly appreciated.
> > >
> > > Only for volume min/max, module options may be an easier way, IMO.
> > >
> > > OTOH, if we want to adjust more stuff, another possibility is to
> > > extend the proc file.  It currently supports the dynamic changes of
> > > PCM parameters, but we can extend it or add a new proc file for
> > > adjusting other stuff, too.  So the question is what else we want to
> > > allow changing.
> > >
> > >
> > > thanks,
> > >
> > > Takashi
> >
> > Hi Takashi,
> >
> > Thanks for your quick reply! I can't express my gratitude enough. Will
> > stick with plan (A).
> >
> > Additionally, I'll take some time to read it and learn how to use the
> > proc file. Compared with snd-dummy, I've plugged in a physical USB
> > headset and saw some read-only files (usb*) under /proc/asound/cardX.
> > By extending the proc file, are you suggesting we can change those
> > into writable so ALSA will understand and make corresponding changes,
> > (e.g. 'change' the dummy card into a USB sound card)? Can you tell me
> > more about how to extend or add a new proc file (as a separate topic)?
>
> Some proc files allow writing, and the dummy driver's own proc file is
> such one (enabled only when CONFIG_SND_DEBUG=y, though).  The proc
> file is created with snd_card_rw_proc_new() and the passed write
> callback is dummy_proc_write() in this case.  It parses each text line
> and overrides the existing struct field accordingly.
>
>
> HTH,
>
> Takashi

Hi Takashi,

This greatly helps! Thanks so much for your kind explanation : )

Best,
YJ
