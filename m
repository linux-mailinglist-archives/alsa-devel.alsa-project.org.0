Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C4DE229D2C
	for <lists+alsa-devel@lfdr.de>; Fri, 24 May 2019 19:36:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2A7501714;
	Fri, 24 May 2019 19:35:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2A7501714
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558719402;
	bh=iQ/PGNAJS6ilYuNxoHE9ZpDrEC7cSMJ7O8AkpFgqSjk=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LWHwHbjQdYUDPO74K+SGeJwCE/WTibGB8m6ISLtVan4/lVQ0ZbvRGLLDL9NpMOLi6
	 B7a3y+ZrQHBTvcuFJiwhVHZF2PovxECFu1uaCodvI8a5u+1Tg7me7m5YjoOOLNCgkP
	 DYBC6XWpYKgE0Tatlz3K2CK+blMcNbduRjn7Azrs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 89FD4F89625;
	Fri, 24 May 2019 19:34:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7BF2BF89630; Fri, 24 May 2019 19:34:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 74426F89625
 for <alsa-devel@alsa-project.org>; Fri, 24 May 2019 19:34:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 74426F89625
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=endlessm-com.20150623.gappssmtp.com
 header.i=@endlessm-com.20150623.gappssmtp.com header.b="waUDITdu"
Received: by mail-qk1-x741.google.com with SMTP id p26so6136902qkj.5
 for <alsa-devel@alsa-project.org>; Fri, 24 May 2019 10:34:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=endlessm-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qOGEAAXNSozQk/qK8GG2MyJGdV5yY0NEFYCUV3pXxPU=;
 b=waUDITduYhU0ae2z6LKuiXJSDMzNmMW4ycMaLhP6EwyhJKN/pAypabg0Dg+KPL9JEI
 GQUc8EkiI5d5f917HQwYHOQKYChVKX47Pn7CpWASztB45FxT5PB/8ngYfv3jQ19ClYbp
 Tzpi1qdosAyTTFCWPe43kCHlQqB0eAfsropwgth3OrEMGxv2ZJX3J4aei4U/+Nvc3o7e
 6zPxD/jl61ptZEvRHU+akJeNQcCpqmHiYoUDyBeWan3tFzWLjCutfCddttufgTMM1meu
 c41t+FhCn6phiyVIoT5seqUdNJ7EkhUNO2PRzmhXymEqyeC9WgRLPk7T6mhoSgkmSlgo
 2iFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qOGEAAXNSozQk/qK8GG2MyJGdV5yY0NEFYCUV3pXxPU=;
 b=BO5ijZFhHNHam4yEgKqMFGV2X+3FpLFQuT5RdReGZRb2nBH0p/dnSHwAU3e5cRzVFe
 QL7Pn4Dza1VZMrFcSSXzdSps+ByNJlmJ6aoqPKVgjFjX706MewupebHk3f+pLbkmTI3g
 MAugYWYNfZadGinhRQiTQKu6WX7UFrQ5+3viIU8XC87TeYWlOK3lI20cyGNMZJFzwMyK
 IntVVqx3KfNdXtetc8ZwxAb/C96KRhreubJWqjiTLoluch/1Gvf9m7VQm9sqxu9myV0/
 k2NNBrxv9Mic0Er/DsTmrphJ6ZWARU1myaCyK5TXqOURkD1O4QFgAs2v34+JAGJ4MWGg
 T5xQ==
X-Gm-Message-State: APjAAAWxHdBXNA/Yy278NVDgmgPBdWbMC+YGaZwFvQrGGfTpKD7Qgyta
 sBnD3SZgkCai3KKcW85yVw2EnAXt6GTeLtKrsiv+pA==
X-Google-Smtp-Source: APXvYqw7pXtA9w/ttHdnUsbVZKWiKJIXH/Cuzqhg0V8hXCaH+4MFAR6sE4dq3lMI/F1LYx5zHKatHSbLB5qnaU+kvG4=
X-Received: by 2002:a0c:b032:: with SMTP id k47mr79099835qvc.86.1558719289665; 
 Fri, 24 May 2019 10:34:49 -0700 (PDT)
MIME-Version: 1.0
References: <20190523233951.31122-1-pierre-louis.bossart@linux.intel.com>
 <s5hk1ege12p.wl-tiwai@suse.de>
 <284f78d4-ec5a-0ff1-2b67-2977b3634692@linux.intel.com>
 <CAD8Lp47qCbPh+aZjr0pjzZAcBXqRbMU+5Y_HPy7jrJhUgsD3Tg@mail.gmail.com>
 <72729168-214a-264d-c704-f718d7cfde4b@linux.intel.com>
In-Reply-To: <72729168-214a-264d-c704-f718d7cfde4b@linux.intel.com>
From: Daniel Drake <drake@endlessm.com>
Date: Fri, 24 May 2019 11:34:38 -0600
Message-ID: <CAD8Lp47Yc5CwkM-y=eqXdPDZ7+1=qa6m1sCELhBsidsYYSzfQQ@mail.gmail.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: Takashi Iwai <tiwai@suse.de>, Hui Wang <hui.wang@canonical.com>,
 alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Curtis Malainey <cujomalainey@google.com>
Subject: Re: [alsa-devel] [RFC PATCH 0/6] ALSA/HDA: abort probe when DMICs
	are detected
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

Still not quite clear about the default behaviour here.

On Fri, May 24, 2019 at 10:12 AM Pierre-Louis Bossart
<pierre-louis.bossart@linux.intel.com> wrote:
> b) the decision to abort the HDaudio legacy driver probe should not be
> the default, since it depends on BIOS information that may be wrong and
> on which I have *zero* control.
> [...]
> 1. DMICs attached to PCH and BIOS/NHLT reports DMICS -> abort HDaudio
> legacy probe

In the case of DMICs attached to PCH and BIOS/NHLT reports DMIC, is
the HDaudio legacy probe aborted by default or not?

Thanks
Daniel
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
