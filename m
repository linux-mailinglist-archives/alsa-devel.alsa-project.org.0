Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D28BB63D9E6
	for <lists+alsa-devel@lfdr.de>; Wed, 30 Nov 2022 16:50:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6530616F4;
	Wed, 30 Nov 2022 16:49:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6530616F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669823445;
	bh=TLhDwCYHauzbEk81/8qacu+Jf+6XR6zvd8lM/a1CvHM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iL6vMwToTsN0NTQBS17KHxdyq3s/ecjifkvgs3buwmrmN0Pfm+LGJ8KHv31r+aRP2
	 BC7a2C5jMtY7QkDFHwBBbCJtwaZ53rDsQ2as7+Bbc/mIv0o50Fh6IDOt+ezCsHoPBq
	 ryqwOi6b00zaC31IPoDM0NRQNIBBUfM67zr5q0gI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 10EE5F804FF;
	Wed, 30 Nov 2022 16:49:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C7543F803DD; Wed, 30 Nov 2022 16:49:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com
 [IPv6:2607:f8b0:4864:20::132])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4651FF80118
 for <alsa-devel@alsa-project.org>; Wed, 30 Nov 2022 16:49:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4651FF80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="Uy+DDhU4"
Received: by mail-il1-x132.google.com with SMTP id s16so5610231iln.4
 for <alsa-devel@alsa-project.org>; Wed, 30 Nov 2022 07:49:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=cITkc4ydx3t5/WaE8B5C64mzt1Dr4iTKfrMxsULtWPc=;
 b=Uy+DDhU4KWNCz4MeUi8ThR7KIclQ1LieLw0rWkPEBf4NX8Ph3SIGeBRdZGkwVg5BsC
 dfxDBeN3+ZPXROGSwwCjAOZVCHechH+KMEJcMGuBIsNdgi1fazzNt9MCXQpXaHrhEYqJ
 Bcq1QY0JVJr737F9dJ0qI9L6814xZjqjUJSNc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cITkc4ydx3t5/WaE8B5C64mzt1Dr4iTKfrMxsULtWPc=;
 b=AnfoaW7DZy5DNHKtnF0FxJpjkG9/BuvCx6PIlzerNiAlY4F83yQi/ULZfPEBxHW8OX
 8KHq5c4dv6nU2owE4jWyIN9XhPj4m9DPMisUnqJQo7yA/pm5FI3IFnAGhE+b4C/JETUf
 KpryHWye3NqtIuw33X2v5sBMUAF+B3FEh59zW3Mfaz10O8NKhHRLG4zLjedLuzV9t35j
 eTMG3EyIw9sq8ltmu9ikHQxfhWuMkwFNAVulhfMPQvB5ZoQ01l8Pw8GQsNAgMkpaFjzx
 r2afaFbAKeRHsHru9pH01FpvXf6a7fWHxYRfNgVndMmv86gmUofcS4C8LdIOq6jb/bUW
 O2Lw==
X-Gm-Message-State: ANoB5plRt7fhfVnHt0NYitH1ZXN6lStNz0JAc4+sbOLzxKmiZfYqltRE
 28IQ3aUcvap8ilLFgeNuUgAIP0BdIxKZydnT
X-Google-Smtp-Source: AA0mqf7r4X7MIt4LGk3j4/xSXTHlHnSy+xVdd59D0RgZXjcdnMBR70bqwRD6HRPtHtI+jkK0KZT+lA==
X-Received: by 2002:a92:6a11:0:b0:300:ece2:e3b8 with SMTP id
 f17-20020a926a11000000b00300ece2e3b8mr20104590ilc.255.1669823378626; 
 Wed, 30 Nov 2022 07:49:38 -0800 (PST)
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com.
 [209.85.166.172]) by smtp.gmail.com with ESMTPSA id
 g13-20020a05663810ed00b0036c8a246f54sm687891jae.142.2022.11.30.07.49.37
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Nov 2022 07:49:37 -0800 (PST)
Received: by mail-il1-f172.google.com with SMTP id x12so5354189ilg.1
 for <alsa-devel@alsa-project.org>; Wed, 30 Nov 2022 07:49:37 -0800 (PST)
X-Received: by 2002:a92:ca8b:0:b0:303:19d2:9def with SMTP id
 t11-20020a92ca8b000000b0030319d29defmr6089993ilo.21.1669823377096; Wed, 30
 Nov 2022 07:49:37 -0800 (PST)
MIME-Version: 1.0
References: <20221127-snd-freeze-v4-0-51ca64b7f2ab@chromium.org>
 <5171929e-b750-d2f1-fec9-b34d76c18dcb@linux.intel.com>
 <87mt8bqaca.wl-tiwai@suse.de>
 <16ddcbb9-8afa-ff18-05f9-2e9e01baf3ea@linux.intel.com>
 <87edtmqjtd.wl-tiwai@suse.de>
 <alpine.DEB.2.22.394.2211291355350.3532114@eliteleevi.tm.intel.com>
In-Reply-To: <alpine.DEB.2.22.394.2211291355350.3532114@eliteleevi.tm.intel.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 30 Nov 2022 16:49:26 +0100
X-Gmail-Original-Message-ID: <CANiDSCsGZBo=C+Bep8TQp15mA+-4ZRCPwSJzyndFuwokt7Byyw@mail.gmail.com>
Message-ID: <CANiDSCsGZBo=C+Bep8TQp15mA+-4ZRCPwSJzyndFuwokt7Byyw@mail.gmail.com>
Subject: Re: [PATCH v4] ALSA: core: Fix deadlock when shutdown a frozen
 userspace
To: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Cc: Daniel Baluta <daniel.baluta@nxp.com>, alsa-devel@alsa-project.org,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.de>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 stable@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Mark Brown <broonie@kernel.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, linux-kernel@vger.kernel.org,
 sound-open-firmware@alsa-project.org
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

I just sent a v6 that only avoids unregistering the clients during
kexec... let me know if that works for you

Thanks!

On Tue, 29 Nov 2022 at 13:12, Kai Vehmanen <kai.vehmanen@linux.intel.com> wrote:
>
> Hi
>
> On Tue, 29 Nov 2022, Takashi Iwai wrote:
>
> > On Mon, 28 Nov 2022 18:26:03 +0100, Pierre-Louis Bossart wrote:
> > > As Kai mentioned it, this step helped with a S5 issue earlier in 2022.
> > > Removing this will mechanically bring the issue back and break other
> > > Chromebooks.
> >
> > Yeah I don't mean that this fix is right, either.  But the earlier fix
> > has apparently a problem and needs another fix.
> >
> > Though, it's not clear why the full unregister of clients is needed at
> > the first place; judging only from the patch description of commit
> > 83bfc7e793b5, what we want is only to shut up the further user space
> > action?  If so, just call snd_card_disconnect() would suffice?
>
> I think the snd_card_disconnect() is what we are looking after here, but
> it's just easiest to do via unregister in SOF as that will trigger will
> look up the platform device, unregister it, and it eventually the driver
> owning the card will do the disconnect. Possibility for sure to do a more
> direct implementation and not run the full unregister.
>
> On the other end of the solution spectrum, we had this alternative to let
> user-space stay connected and just have the DSP implementations handle
> any pending work in their respective shutdown handlers. I.e. we had
> "ASoC: SOF: Intel: pci-tgl: unblock S5 entry if DMA stop has failed"
> https://github.com/thesofproject/linux/pull/3388
>
> This was eventually dropped (and never sent upstream) as 83bfc7e793b5 got
> the same result, and covered all SOF platforms with a single code path.
> Bringing this back is of course one option, but then this might suprise
> other platforms (which might have got used to user-space getting
> disconnected at shutdown via 83bfc7e793b5).
>
> Br, Kai



-- 
Ricardo Ribalda
