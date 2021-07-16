Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E63433CB8BC
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Jul 2021 16:33:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6CD8C1685;
	Fri, 16 Jul 2021 16:32:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6CD8C1685
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626445990;
	bh=R5AQBWx/Ms0FBXvBEf0QIKwmOAc4CJi1LPhEZzjFSlQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pxo2tGv+5f0ARgUgH0DICJGOH5hZLFF9Lh9n3+9igLBbtg9Pc/do3pncV/AqYvR8S
	 iSE6c18EF9XG0XR8ZGU/yQhmMJ1KIAj00bOZxHLGz9a09vguz6TctBoHzZ6711xpyh
	 zVNQaqKU2pGyZCFoK6PHJsvKL0nKBPMy+QWJDBqY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D5E83F80253;
	Fri, 16 Jul 2021 16:31:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 64B8CF80254; Fri, 16 Jul 2021 16:31:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7996FF800FE
 for <alsa-devel@alsa-project.org>; Fri, 16 Jul 2021 16:31:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7996FF800FE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="BiNw4S/n"
Received: by mail-wr1-x433.google.com with SMTP id t5so12314079wrw.12
 for <alsa-devel@alsa-project.org>; Fri, 16 Jul 2021 07:31:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HfyxvApAZ/QZvHM+p5Z7vY05jWEPB2D5W608SFXmszc=;
 b=BiNw4S/nNGbPkUa1crFEo2Y0/F8w8G9auWNhNskkQ7COnYo5wnECAN/07YJpoA15yp
 y1j9atMh+9ZcfZvkqJHZZOVVfWp3KAck8GXvy2t4Cg8JgCV1qh9XHgPSMAAce6YDMMex
 zdX5hA4MXqMe2/4AATppa3CQUBcLOfDByMDaXEOxz3LVoQ7oodrpxekThqZg1gfGXnVT
 MwlYcN5MFT1Wix931dlrsHnYz1bSjLs5wnni+fYiOoBnStHh5zm16QQZqBeizLfQq9xh
 BDPNNDT4b7isNLQ4nHiFOVmdSb3o6bE4XTxgspU+fsXx4J2tKfYpVM0NgMhxfU7avYK9
 vsDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HfyxvApAZ/QZvHM+p5Z7vY05jWEPB2D5W608SFXmszc=;
 b=gsMi28cWhCTEPLbulfpF/TCTRcKxZvjd68yQzlaW+UWrswvhktH593uxBZr249DRDI
 YugbEVcATeEa2yMqPTXL8zTnsJTOYTuFyFpmprx6v+j5x3sXd/8jOLcMwSAGPntAlp/D
 RikqjBcV0lJqdClPsgV13iv6w09F7/QH+71637jlfufJjdf17Ivz8Rovo3Z5aiBnPb0T
 7GtAcZByp/RXUKWSAs36ow6o4iBHr6OloH1VWY7+jqCCf6iIAVOAk24WcdlK1DHw3kW7
 k6XBl3mDb7IveOtOGBU4hnjmHFGdxYbaEnzpdUiOW4z7X8JrK4vYElFJ77Gh2YnMsW3X
 snJQ==
X-Gm-Message-State: AOAM533GbIYtTxZiZDaa7C70E4qVVacC5q92OQiTG1FWrDHTTWh3u2pW
 R8LbMsAjEOOiDwMlgttWIGrnyItVXoGJ69ZQ3k8=
X-Google-Smtp-Source: ABdhPJzNsznePTaYmquFe11N5cDdMdqdLLKPdxNodbRML7ppVKehpfYQUESzJxYsB3WikgGIRh1AkH3Y73mC/3yvNEY=
X-Received: by 2002:a5d:6481:: with SMTP id o1mr13127552wri.164.1626445897440; 
 Fri, 16 Jul 2021 07:31:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210715141802.880911-1-daniel.baluta@oss.nxp.com>
 <20210715141802.880911-2-daniel.baluta@oss.nxp.com>
 <20210715143906.GD4590@sirena.org.uk>
In-Reply-To: <20210715143906.GD4590@sirena.org.uk>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Fri, 16 Jul 2021 17:31:25 +0300
Message-ID: <CAEnQRZCdSLoaLVZ7-jtufgZCG6QshMwdfyJy_4oE6cXRbA5H8A@mail.gmail.com>
Subject: Re: [PATCH 1/3] ASoC: SOF: Parse fw/tplg filename from DT
To: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Cc: Devicetree List <devicetree@vger.kernel.org>,
 Linux-ALSA <alsa-devel@alsa-project.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Daniel Baluta <daniel.baluta@oss.nxp.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>, Daniel Baluta <daniel.baluta@nxp.com>
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

On Thu, Jul 15, 2021 at 5:39 PM Mark Brown <broonie@kernel.org> wrote:
>
> On Thu, Jul 15, 2021 at 05:18:00PM +0300, Daniel Baluta wrote:
>
> > Introduce two DT properties in dsp node:
> >       * fw-filename, optional property giving the firmware filename
> >       (if this is missing fw filename is read from board description)
> >       * tplg-filename, mandatory giving the topology filename.
>
> These sound entirely like operating system configuration which I'd
> expect to be inferred from the machine identification.  What happens if
> a system has multiple options for firmware files, or if the OS ships the
> topology and firmware bundled up in a single image to avoid them getting
> out of sync?  What's the benefit of putting them in the DT?

We thought that if a system has multiple options for firmware files
we could use different Device Tree files. But indeed this doesn't scale.

It would be awkward to create a new dts just to change the firmware name.

Similarly for topology files. We might have:

- different audio scenarios (e.g different audio pipeline with
different components, e.g Post Processing Components, etc)
- different hardware attached to a board (e.g i.MX8 can have a
baseboard attached which brings in more codecs).

I think the best way to specify the audio firmware is via the board
description structure which is already
used to provide a default value for firmware file name.

Then for the topology used we could make that as a module parameter.

For us it is important to be able to use different topologies without
recompiling the kernel. So, far we just
used a simbolic link to the default topology file and change the
symbolic link to the desired topology and then reboot.
