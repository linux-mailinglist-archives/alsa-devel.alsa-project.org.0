Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 81186109041
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Nov 2019 15:42:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F05D7180B;
	Mon, 25 Nov 2019 15:41:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F05D7180B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574692965;
	bh=d2xB9gnF+FHxdX8QWqS9pLXTSq9NJtsAIoIWbyFQUOQ=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=U5uDUxONEAsFQOkdqRXF0+QXIJCQnrvHxg1/iPRf7y86OUAULib7HYOnyKMyvONgk
	 M4e7jnqyPqiuY18b5KY7vI2omqdiDB6eR9JxmQ7t+0EKhCy6cJNOEprhv+Ozj3EVRs
	 YFylabu6lKjG/HHd+TIBxAs6Qcm6CZfNZfN8t9tU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B8171F8016F;
	Mon, 25 Nov 2019 15:41:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 63810F8016F; Mon, 25 Nov 2019 15:40:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_30,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C85E6F800DF
 for <alsa-devel@alsa-project.org>; Mon, 25 Nov 2019 15:40:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C85E6F800DF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="t0FmP3OY"
Received: by mail-wr1-x443.google.com with SMTP id t2so18357748wrr.1
 for <alsa-devel@alsa-project.org>; Mon, 25 Nov 2019 06:40:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fIPk6+sc6+DHaXBogqRqn5lIi0109Uk3TFBxqfJH0iI=;
 b=t0FmP3OY6M1DHFGW40MnDmM/TrjIZKLsGw1mrDirYswh1+pgfH2YTE3mzo6LU2Anu4
 +yiIn8BfH9mwG8MRS9Ddg6S6NMidzYCBqNrQ5pOWpjDM9cVR5GLUqzu9xZP2xthjcTkn
 DZbhKwjuXCz67/XxsGWJz2rZuD/VLOCn2jo30s8ox+riWHPHeuZTnmhU97KeOEM1p3nh
 +OPduMt9ubfVOKt7omXG4BiEFnrmFlnuxKw5P3E6vVn0h9i/NiCZ76gGwHu+NcR2zNkq
 k1XbofAgnUg3YSqhrDNnZQkgqaULc4KuI5pSAmxcG+R2rxhrWbGucsW9xdKYi/NdBGi3
 KEBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fIPk6+sc6+DHaXBogqRqn5lIi0109Uk3TFBxqfJH0iI=;
 b=g7sf7fFCRqvUyFOWmFUCKnpdu9BYfKoK9J1QVOk5xnA3oQ+rwTRgVk43LWJTAMQBz9
 FyfXI0YKikkOfEqAWesBPaHnKRl6raWLkkSdrTQXelxskTvPTG1I2sKxcF2ea4EJxgbB
 IRuAJ3RWsaT2uWpKc3xY6KUujKNuT52xxOS+d1dSx0jIHi42S4NrBVtffy5XuYCsDRG9
 kVEygsSeQVto6ADHXWvYaOlMx5eYFeKi4Ua+Ktl/fiL3AsoKYy267x7EqZjOXLHIcSk+
 3opisoTNGGLAlhJzjZmjQYz/R6hTRUTS8dtAtZNoiwa4Czi6AheNPdRVCxvPYgBXffl8
 zYDA==
X-Gm-Message-State: APjAAAVuNKCJc96bDIdypQ+MMyBr1E2LQ7lQawJ9Vvzxb8lv5Xxe1D/Y
 CSSsA6LWaYtGa9yaQof4oe28kf6TAfH9IoKzqE8=
X-Google-Smtp-Source: APXvYqwGTdPbsGs/MR2bADoZlyf2YajLiSZYf8hUrzJSKcf6PFW24wuihfHf5iLMnIZE+B5CIYtFP7AFviwNI9glG40=
X-Received: by 2002:adf:f010:: with SMTP id j16mr32903334wro.206.1574692855891; 
 Mon, 25 Nov 2019 06:40:55 -0800 (PST)
MIME-Version: 1.0
References: <20191122214353.582899-1-alexander.deucher@amd.com>
 <s5hblt30y3j.wl-tiwai@suse.de>
In-Reply-To: <s5hblt30y3j.wl-tiwai@suse.de>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 25 Nov 2019 09:40:43 -0500
Message-ID: <CADnq5_P7UA62+OfY+5q7re7na2V2Bc9_7XvZ3d5T9ovjMJVuLQ@mail.gmail.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: Alex Deucher <alexander.deucher@amd.com>, alsa-devel@alsa-project.org,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Subject: Re: [alsa-devel] [PATCH 0/4] add runtime pm support for AMD display
	audio
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

On Sat, Nov 23, 2019 at 3:57 AM Takashi Iwai <tiwai@suse.de> wrote:
>
> On Fri, 22 Nov 2019 22:43:49 +0100,
> Alex Deucher wrote:
> >
> > These patches were originally part of a larger set of patches
> > to enabled runtime pm support on the GPU side[1].  However, the
> > patches are useful on their own there are really no dependencies,
> > other than the fact that you need both for runtime pm to kick in
> > on the GPU side.  The GPU side will be landing for 5.6; I'd like
> > to land the audio side as well.
>
> Do you mean that these can go into 5.5-rc1, or they need waiting until
> 5.5-rc1 release?  I guess these won't break things even without the
> runtime PM support in GPU side, as the ELD notification is done via
> audio component, so I'm fine to apply them at any time.

Up to you.  I'm ok to wait for the next merge window if you'd prefer.

Alex

>
>
> thanks,
>
> Takashi
>
>
> >
> > Thanks,
> >
> > Alex
> >
> > [1]: https://patchwork.freedesktop.org/series/67885/
> >
> > Alex Deucher (4):
> >   ALSA: hda/hdmi - fix vgaswitcheroo detection for AMD
> >   ALSA: hda/hdmi - Add new pci ids for AMD GPU display audio
> >   ALSA: hda/hdmi - enable runtime pm for newer AMD display audio
> >   ALSA: hda/hdmi - enable automatic runtime pm for AMD HDMI codecs by
> >     default
> >
> >  sound/pci/hda/hda_intel.c  | 80 +++++++++++++++++++++++++++++++++++---
> >  sound/pci/hda/patch_hdmi.c |  1 +
> >  2 files changed, 76 insertions(+), 5 deletions(-)
> >
> > --
> > 2.23.0
> >
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
