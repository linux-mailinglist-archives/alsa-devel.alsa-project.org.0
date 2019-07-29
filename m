Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E3FCB79CA3
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Jul 2019 01:12:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 69E9517CB;
	Tue, 30 Jul 2019 01:11:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 69E9517CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564441966;
	bh=ujagfc7oYlT84VFaEsfOg9eWz7yenpbCu0t8MWr0vTI=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CdP8GasrdXt+Moayvm1usJo5iO7WHLdeIoQ8P+FZdeHyfhvOBHtMeu8QSETjIwW+j
	 YCTgyw528oNxBikqIozt8l5T1qv1wAIE20IeMTLxt21+fl8GGbnKt6bS4yM73fRhyB
	 EmbjBks53y44GfgwyVPyAUHzL/xIggvJKy3tce70=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B6496F803D5;
	Tue, 30 Jul 2019 01:11:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2D44DF8048D; Tue, 30 Jul 2019 01:11:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8FF5BF803D5
 for <alsa-devel@alsa-project.org>; Tue, 30 Jul 2019 01:10:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8FF5BF803D5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="Om4fvY1C"
Received: by mail-lf1-x144.google.com with SMTP id h28so43207380lfj.5
 for <alsa-devel@alsa-project.org>; Mon, 29 Jul 2019 16:10:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CQ7+4CVGTbsNOJSLG8pKEWjiro6FJ3zHxLZkIlQb9Ps=;
 b=Om4fvY1CIIs8DebSu2m8xVzC3EpDr6hieGZbKWkIJttaZxmBBi6wRYt6/uhNealnBa
 Pm5qgWLGVpnrp9rk4LG4Q/vx+J0UJ4JgiQwVzQnltqMEMEaAErCVnSTVqpWqu85xenYC
 82C6b/+mrFEB7j8yfi/XBDCbTmMKDQth9uzNY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CQ7+4CVGTbsNOJSLG8pKEWjiro6FJ3zHxLZkIlQb9Ps=;
 b=qna1fFCwD1tvub+VgjBYPkKMKiq5sW2EbHxReRDKcC0qaAa9csd5Fzy7CmNBLcIh5l
 hPP93l5bisyzGyfg3mVdS5gZ0WMWC7Ej+TAIgJK2G2j6Q5sujmUBRnu8z4hZQj0OOhvR
 XmeZfLZz2sGUnmaoyu/Wnt3izv8U5E3XnrTg+HMf0vjmyNxGOst31UDF/EjmBATQtLXA
 f7WKdAK8C2rV/amkTjVVIGt0tA0QvfxywiBMNeoD7i1hXJTYWzuyshIFv4SjZh5krl+n
 amQcmOpLn7jTrdZRLnnM0Wchmj8H2O7So5tUpyB8DrdNGAmTRQmJ1+IKCm35tmmAtooL
 ARHQ==
X-Gm-Message-State: APjAAAXUGLvlrAYZPcCUD6zFxuEDQcQZUQ3aUXVXLzyqyspqCQDL6/oA
 tujH0v3uwWUHd36fx++WtTRDnJXHclM=
X-Google-Smtp-Source: APXvYqzj72Xhh3vqfvFZ7/2n3RnaBbJ0cRvkE6bOfN/4Rqee54kiH/hdyJomEN6gGuI0rhEpcsBZvw==
X-Received: by 2002:ac2:51a3:: with SMTP id f3mr8577306lfk.94.1564441856232;
 Mon, 29 Jul 2019 16:10:56 -0700 (PDT)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com.
 [209.85.208.174])
 by smtp.gmail.com with ESMTPSA id s26sm13120324ljs.77.2019.07.29.16.10.55
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Mon, 29 Jul 2019 16:10:55 -0700 (PDT)
Received: by mail-lj1-f174.google.com with SMTP id z28so5955135ljn.4
 for <alsa-devel@alsa-project.org>; Mon, 29 Jul 2019 16:10:55 -0700 (PDT)
X-Received: by 2002:a2e:9950:: with SMTP id r16mr42273668ljj.173.1564441855030; 
 Mon, 29 Jul 2019 16:10:55 -0700 (PDT)
MIME-Version: 1.0
References: <CACJJ=pxPm7dRUE534hDWy2tN3dGYDyrgU8JKqett=wOQx+nWCQ@mail.gmail.com>
 <39533fe5-c060-7a07-c910-74b83eee53c4@linux.intel.com>
In-Reply-To: <39533fe5-c060-7a07-c910-74b83eee53c4@linux.intel.com>
From: Jon Flatley <jflat@chromium.org>
Date: Mon, 29 Jul 2019 16:10:43 -0700
X-Gmail-Original-Message-ID: <CACJJ=pyXBRwcfWbOEgtyjW4yUdxZpWhKm_z0==tQ7KDUGYRF=A@mail.gmail.com>
Message-ID: <CACJJ=pyXBRwcfWbOEgtyjW4yUdxZpWhKm_z0==tQ7KDUGYRF=A@mail.gmail.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: benzh@chromium.org, alsa-devel@alsa-project.org,
 Jon Flatley <jflat@chromium.org>
Subject: Re: [alsa-devel] [BUG] bdw-rt5650 DSP boot timeout
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

This is roughly what I was thinking. Is there a good way to monitor
the timing on the IPCs in cases like this shy of probing the hardware?

On Mon, Jul 29, 2019 at 4:02 PM Pierre-Louis Bossart
<pierre-louis.bossart@linux.intel.com> wrote:
>
>
>
> On 7/29/19 4:53 PM, Jon Flatley wrote:
> > I've been working on upstreaming the bdw-rt5650 machine driver for the
> > Acer Chromebase 24 (buddy). There seems to be an issue when first
> > setting the hardware controls that appears to be crashing the DSP:
> >
> > [   51.424554] haswell-pcm-audio haswell-pcm-audio: FW loaded, mailbox
> > readback FW info: type 01, - version: 00.00, build 77, source commit
> > id: 876ac6906f31a43b6772b23c7c983ce9dcb18a19
> > ...
> > [   84.924666] haswell-pcm-audio haswell-pcm-audio: error: audio DSP
> > boot timeout IPCD 0x0 IPCX 0x0
> > [   85.260655] haswell-pcm-audio haswell-pcm-audio: ipc: --message
> > timeout-- ipcx 0x83000000 isr 0x00000000 ipcd 0x00000000 imrx
> > 0x7fff0000
> > [   85.273609] haswell-pcm-audio haswell-pcm-audio: error: stream commit failed
> > [   85.279746]  System PCM: error: failed to commit stream -110
> > [   85.285388] haswell-pcm-audio haswell-pcm-audio: ASoC:
> > haswell-pcm-audio hw params failed: -110
> > [   85.293963]  System PCM: ASoC: hw_params FE failed -110
> >
> > This happens roughly 50% of the time when first setting hardware
> > controls after a reboot. The other 50% of the time the DSP comes up
> > just fine and audio works fine thereafter. Adding "#define DEBUG 1" to
> > sound/soc/intel/haswell/sst-haswell-ipc.c makes the issue occur much
> > less frequently in my testing. Seems like a subtle timing issue.
> >
> > There were timing issues encountered during the bringup of the 2015
> > chromebook pixel (samus) which uses the bdw-rt5677 machine driver.
> > Those were slightly different, and manifested during repeated
> > arecords. Both devices use the same revision of the sst2 firmware.
> >
> > Any ideas for how to debug this?
>
> this could be trying to send an IPC while you are already waiting for
> one to complete. we've seen this before with SOF, if the IPCs are not
> strictly serialized then things go in the weeds and timeout.
>
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
