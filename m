Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9508065C76C
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Jan 2023 20:25:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0DBAA614D;
	Tue,  3 Jan 2023 20:25:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0DBAA614D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672773958;
	bh=8w38A456EJ8/JXZjMxFiqjPCYGJQzYB1kqHOPdTgpUE=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=V8SJcN0WvLtyS2s98QS2asslGLiPA/TZ5YFIj7KAEakdRKPXq9Aa72SrDnzlimljT
	 uRgG6KxIH6tMwxyL4GD4QIYqduB7usRebncShNRnERHHNoltIR9AobnszPWZuGuo9T
	 YEC0k1rLkjECLLTNiOGbzkVty/N4+wlAJlajRs10=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7EAC6F800C0;
	Tue,  3 Jan 2023 20:24:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 03368F804AA; Tue,  3 Jan 2023 20:24:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 10D82F800C0
 for <alsa-devel@alsa-project.org>; Tue,  3 Jan 2023 20:24:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 10D82F800C0
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=ralston.id.au header.i=@ralston.id.au
 header.a=rsa-sha256 header.s=google header.b=A3iZHMq1
Received: by mail-oi1-x22a.google.com with SMTP id h185so5377071oif.5
 for <alsa-devel@alsa-project.org>; Tue, 03 Jan 2023 11:24:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ralston.id.au; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=a1Pvovz6KD/rGdi5Cr+RhhTptgsnk7UiVcQNAM8+eBU=;
 b=A3iZHMq1qX7BLuv8LOjD2/WgSAjRCflHSb5ljgUjZXfI8UO7kxCSKjMML05dAGROBq
 Brk9fkjqudbKAi0IhPSRvRw8xF/XcmKn2bWbYCmQCa+KKDylcfx7e0By5aHaOZYzMbB/
 Q3T4Oeed30ocfaOtl6ejPaxlyYYpEkjoNQ5Hk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=a1Pvovz6KD/rGdi5Cr+RhhTptgsnk7UiVcQNAM8+eBU=;
 b=PyOYdb50D5XKz+Wngzc5fAKrsrF4k1k9KpYaDrXwjHvCFlR9nzaH85cgoIX4jyi9g/
 fK1KT7RIn5cNTyqHKkt7/Zf+cfZN+rbyndlWMQPXTYmAwTDwSk4dWgQjySjhWisLFt3P
 40KnTQw5qdLbOH7c/VrBJRFYzCCVkpzW3LfqKEdPEkDWadrVAP40tEE6XSX3aZNYOIr7
 n1NaC9bw7SkPS6nUp/tJyCndDPITleE5DIC/kWBTSzf3AExk/h+MPjaYiH1oBRSY94vW
 FdcTLmwJhvGsp//WxRTlzj70XXJXI6zMcUMGGFGPuLjmd/P2n/Hhir6GNZWQxasaRSs1
 Yyzg==
X-Gm-Message-State: AFqh2kqni7SPIafvoYHsVjMojt/LXM/Rqv3esJOHbmufPQTfkhXesUT8
 ORu0juaFDPK4DtXbYDdIUu/qEYkg4LhQ0DyIUFsigA==
X-Google-Smtp-Source: AMrXdXsSrUBgeuZr11V5MVDq1ahDjM3YnzlwexugjDHVzjW3s/niOCBfKCmmzgVetZXBqZkQUi4GfRfYldJc0F2Ls1w=
X-Received: by 2002:a05:6808:48d:b0:35c:3327:ecf0 with SMTP id
 z13-20020a056808048d00b0035c3327ecf0mr2314709oid.220.1672773892807; Tue, 03
 Jan 2023 11:24:52 -0800 (PST)
MIME-Version: 1.0
References: <CAC2975JXkS1A5Tj9b02G_sy25ZWN-ys+tc9wmkoS=qPgKCogSg@mail.gmail.com>
 <bf646395-1231-92f6-7c5a-5b7765596358@leemhuis.info>
 <87zgb0q7x4.wl-tiwai@suse.de>
 <CAC2975K24Gt3rGieAToHjb7FEHv84aqiRSQx7EOuR2Q7KByUXw@mail.gmail.com>
 <87sfgrrb5f.wl-tiwai@suse.de>
 <CAC2975+cUqiFC0LO-D-fi0swH+x=_FMuG+==mhg6HH4pc_YDRA@mail.gmail.com>
 <87bknfr6rd.wl-tiwai@suse.de>
 <CAC2975+CP0WKmXouX_8TffT1+VpU3EuOzyGHMv+VsAOBjCyhnA@mail.gmail.com>
 <878rijr6dz.wl-tiwai@suse.de>
 <CAC2975+Ybz2-jyJAwAUEu5S1XKfp0B-p4s-gAsMPfZdD61uNfQ@mail.gmail.com>
 <87zgazppuc.wl-tiwai@suse.de>
 <CAC2975+476CHDL3YM=uExHu96UB2rodAng9PVYHX+vGnSCppGA@mail.gmail.com>
In-Reply-To: <CAC2975+476CHDL3YM=uExHu96UB2rodAng9PVYHX+vGnSCppGA@mail.gmail.com>
From: Michael Ralston <michael@ralston.id.au>
Date: Wed, 4 Jan 2023 06:24:16 +1100
Message-ID: <CAC2975Ja-o6-qCWv2bUkt3ps7BcKvb96rao_De4SGVW1v8uE=A@mail.gmail.com>
Subject: Re: USB-Audio regression on behringer UMC404HD
To: Takashi Iwai <tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, regressions@lists.linux.dev,
 Takashi Iwai <tiwai@suse.com>, stable@vger.kernel.org,
 Thorsten Leemhuis <regressions@leemhuis.info>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Wed, 4 Jan 2023 at 06:09, Michael Ralston <michael@ralston.id.au> wrote:
>
> On Wed, 4 Jan 2023 at 03:03, Takashi Iwai <tiwai@suse.de> wrote:
> >
> > OK, thanks.  Then it's not about the USB interface reset.
> > It must be subtle and nasty difference.
> >
> > Could you apply the change below on the top?
> > It essentially reverts the hw_params/prepare split again.
> >
>
> Very sorry to say this still hasn't fixed the problem :(
>

I did a diff between the sound/usb directory for 6.0.16 and 6.1.2 and
reverted that entire directory.

It is working with that change, so there must be something else.

Michael
