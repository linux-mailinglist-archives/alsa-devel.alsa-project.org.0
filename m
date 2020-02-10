Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EDCB15745A
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Feb 2020 13:16:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 156DB1673;
	Mon, 10 Feb 2020 13:15:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 156DB1673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581337006;
	bh=bmUtalHdbMORRRfzoItuv3fPdfuJjLUxTeLBYzcVMAg=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IoBfwrIGZagVuQqKZH+0Kt563gBnzNqHv0iuIAu25rJCD53G9D/oFCAoNOf2JOM0d
	 ic2eaO/bZBxsibcSnHrCdMd7OKCVZJ6R/kHZn2QdTawzwHO7SE2stqG2iK5Nbk2A9U
	 /pgeOvF+zzujG71PjIRdAjxKVqWleq5qGEVYUFO4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EE6EAF8014F;
	Mon, 10 Feb 2020 13:15:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EA721F80157; Mon, 10 Feb 2020 13:15:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E3EB8F800E7
 for <alsa-devel@alsa-project.org>; Mon, 10 Feb 2020 13:14:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E3EB8F800E7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="kHjsxGmx"
Received: by mail-pj1-x1042.google.com with SMTP id n96so4151737pjc.3
 for <alsa-devel@alsa-project.org>; Mon, 10 Feb 2020 04:14:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Xmxa5ULoDkhm6/PszGYbWRr1jpl9Jl2EY8c4j/zWe+o=;
 b=kHjsxGmx12UbVnyNVhboTmW3+0sXASqEpwheusUmBd7lKRD9sojM5c3V/eT1Mjrs/F
 KEqoOI7+gg0VKw0RjjY1G5Ry9CXp23Pjm2jRWcDa7dyXN9gDMFeTRYA9sXWdLWSmPnth
 EhN6oOT186ELVhHapeyWZf3kWgYxy3sM8x+W4kr7w8yc9O8MfkhUCmqRochYNfEhky4p
 mIfzwhfY+LYtmm3OEfoy2SgU9DBK+APNaJHdeM5KpcMYjTWJV1FrlfEY9zRdAEZ/olLK
 e+oN/wAFwdmEhpCpHP9CD2y2AcLSeCZvxDCdP7hynoc+b/xUPWOO/c8+n/77fJzloR1t
 t6Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Xmxa5ULoDkhm6/PszGYbWRr1jpl9Jl2EY8c4j/zWe+o=;
 b=HlYL0FDQturbI/Og1U0Vq0Xt236Oisa3oZ8RCI67C2IyYXfyicbFpq4ErtWKZJ0YxF
 hSW+phPPYdWWtE+xI4eFz1/0ADoEt1FxD/kKu76fg+qNKPvtG3OAGAixSQQflizFZqhT
 0bTwKtKYdfHw4iHKYEvyyXi4StuTvMn5aad0GtEynhJQrEPMDPbCVcL6iv+D+iTzvxdR
 D2Rhyyk/HamCZW9Kynkn6YItKVh/cIjmuCtljwK6LJ3Oj0Ymf7WBvArbbrvHcwTHzGf/
 R/Dm+AnaegLcWlDV6DfqbznMC8V9RHCpcGuMTTbC1VcNSEP9H2MuQ/4mRMy57eu+r61I
 74UQ==
X-Gm-Message-State: APjAAAUx/OP/iYpawru4q8L7fc00qp8Md7APQvCTImX4Z1eHPnJ82IVe
 IUXI7lx5RSuf7O47zac7xhwKMOfiDhc=
X-Google-Smtp-Source: APXvYqxXaG+lEwKmfYSTfcYxCud2FFN/r1afSGbB+/dnnrpc1K6Zhv2bhwplLyC8/0DLeuyuqyfh/w==
X-Received: by 2002:a17:90a:fe8:: with SMTP id 95mr1455367pjz.98.1581336896394; 
 Mon, 10 Feb 2020 04:14:56 -0800 (PST)
Received: from f3 (ag119225.dynamic.ppp.asahi-net.or.jp. [157.107.119.225])
 by smtp.gmail.com with ESMTPSA id s18sm12764878pgn.34.2020.02.10.04.14.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Feb 2020 04:14:55 -0800 (PST)
Date: Mon, 10 Feb 2020 21:14:50 +0900
From: Benjamin Poirier <benjamin.poirier@gmail.com>
To: Kailang <kailang@realtek.com>
Message-ID: <20200210121450.GA3072@f3>
References: <20191129144027.14765-1-perex@perex.cz> <20200210025249.GA2700@f3>
 <20200210030416.GA3302@f3>
 <b31f7280948d4cff91ab5dfcd1e14024@realtek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b31f7280948d4cff91ab5dfcd1e14024@realtek.com>
Cc: Takashi Iwai <tiwai@suse.de>,
 ALSA development <alsa-devel@alsa-project.org>
Subject: Re: [alsa-devel] [PATCH] ALSA: hda - fixup for the bass speaker on
 Lenovo Carbon X1 7th gen
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

On 2020/02/10 09:11 +0000, Kailang wrote:
> Hi,
> 
> This platform speaker 2 bind DAC 0x2 was default.

No, 0x6 was the default. commits d2cd795c4ece & 54a6a7dc107d changed it
to 0x2 which reduced the max volume.

> Use ALC295_FIXUP_DISABLE_DAC3 model will place to DAC 0x3.
> DAC 0x3 was use as Headphone.

No, none of these quirks have an effect on the headphones.


Do you have a ThinkPad X1 Carbon 7th gen to actually test this code?

If you do, in the output of dmidecode, under "System Information",
what's the "Product Name" and "Version"? And what's the pci sub device
id for the audio device? The behavior you're describing doesn't match
the behavior of the laptop I have here sitting in front of me.

Anyways, I've just tested the headphone port on my machine with the
change I posted earlier and it still works as expected - when I plug in
headphones, sound comes out through the headphones, when I unplug the
headphones, sound comes out through the four speakers loud and clear.

Here's the relevant part of Node 0x17 from /proc/asound/card0/codec#0
with different quirks applied and the level of sound output through the
speakers:

no quirk
  Connection: 3
     0x02 0x03 0x06*
  -> loud volume
ALC285_FIXUP_SPEAKER2_TO_DAC1
  Connection: 3
     0x02* 0x03 0x06
  In-driver Connection: 1
     0x02
  -> weak volume
ALC295_FIXUP_DISABLE_DAC3
  Connection: 3
     0x02 0x03* 0x06
  In-driver Connection: 2
     0x02 0x03
  -> loud volume
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
