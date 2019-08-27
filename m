Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BB1239E248
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Aug 2019 10:22:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 231611666;
	Tue, 27 Aug 2019 10:21:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 231611666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566894151;
	bh=EbRFmGHcOF0dsNSrNOJh0d498uW5D4l/XggPe1Fz3y0=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SlOX5jEf1ilYAV9fAObD1viQhbiHH6WEU5DZpSMLuNBmWlQ4s90X6F7zC/4fzVMLh
	 8KlptZg67SLNDrGpzHaLgu/hEqftWlGSAdUqL3aJWXp1NX4bXr8JmNnGqJ7VZ1jwBS
	 0Jho9w5QD+EzKcyj5E8boK93PCTDtQua2gfdW4UE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B213DF802A1;
	Tue, 27 Aug 2019 10:20:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5D767F80274; Tue, 27 Aug 2019 10:20:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
 [209.85.208.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4076BF801ED
 for <alsa-devel@alsa-project.org>; Tue, 27 Aug 2019 10:20:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4076BF801ED
Received: by mail-ed1-f65.google.com with SMTP id a21so30215287edt.11
 for <alsa-devel@alsa-project.org>; Tue, 27 Aug 2019 01:20:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qY2Ghx+cvhqn0reVmcdYz/Ra4oEaXlOnSP3k2TEC06I=;
 b=bShdXGq8prv4Cx4HaLzZTTRzfMSmj4QD3wfS1N85JRpqTMgEHZvY26+keKhg6Je4k+
 R5ELghzEwN8VrtvpCJatM7SGnLuQ/u7XUosLpWSskWngnUAzy+mDo5KARH1RawYdAPEa
 t8gY0LurJsiymz0IU7LYMvwFf8UGZkwWrjvk9sPsRyDhKgmpvzCWbMcircVxoLhiVQnj
 lOs/y79vqZSE+b3xdAYnqbNFUD1q2f4r7ulIRbIgLdCUOSHn1J5LBd2cudiQYSLbq5t6
 Ocl+UkJszt9cqbSmAfifTG1Jdi8xD/StYgNnOQllsaqTVFeBQD+jk0L4KLo6uzqLyw4I
 ZckA==
X-Gm-Message-State: APjAAAU5KCb3aIkeQEyozMs00kwZiVuR6HkExzLtoCIUwcV9qi6gvN2w
 ZW7pGtrg7znO6OQr7H/r3DfAF/SuT1E=
X-Google-Smtp-Source: APXvYqwc96xLore/mpu0t9GmOwbwTNog6bPkKuQ2JB8+ixb8UzrQGRpt4YTETUGMF5kyxyLWnfrQHA==
X-Received: by 2002:a17:906:30d8:: with SMTP id
 b24mr19407029ejb.33.1566894036417; 
 Tue, 27 Aug 2019 01:20:36 -0700 (PDT)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com.
 [209.85.128.47])
 by smtp.gmail.com with ESMTPSA id z9sm1827431edd.18.2019.08.27.01.20.35
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Aug 2019 01:20:36 -0700 (PDT)
Received: by mail-wm1-f47.google.com with SMTP id o4so2086428wmh.2
 for <alsa-devel@alsa-project.org>; Tue, 27 Aug 2019 01:20:35 -0700 (PDT)
X-Received: by 2002:a1c:4c06:: with SMTP id z6mr26175657wmf.47.1566894035615; 
 Tue, 27 Aug 2019 01:20:35 -0700 (PDT)
MIME-Version: 1.0
References: <cover.e08aa7e33afe117e1fa8f017119d465d47c98016.1566242458.git-series.maxime.ripard@bootlin.com>
In-Reply-To: <cover.e08aa7e33afe117e1fa8f017119d465d47c98016.1566242458.git-series.maxime.ripard@bootlin.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Tue, 27 Aug 2019 16:20:24 +0800
X-Gmail-Original-Message-ID: <CAGb2v64xOcs3Vi5k3yUwMiUrzZMuJ5vZ3kxp9w1=CQDrkn3cgA@mail.gmail.com>
Message-ID: <CAGb2v64xOcs3Vi5k3yUwMiUrzZMuJ5vZ3kxp9w1=CQDrkn3cgA@mail.gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Mark Brown <broonie@kernel.org>
Cc: Code Kipper <codekipper@gmail.com>,
 Linux-ALSA <alsa-devel@alsa-project.org>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [alsa-devel] [PATCH 00/21] ASoC: sun4i-i2s: Number of fixes and
	TDM Support
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

Hi everyone,

On Tue, Aug 20, 2019 at 3:25 AM Maxime Ripard <mripard@kernel.org> wrote:
>
> From: Maxime Ripard <maxime.ripard@bootlin.com>
>
> Hi,
>
> This series aims at fixing a number of issues in the current i2s driver,
> mostly related to the i2s master support and the A83t support. It also uses
> that occasion to cleanup a few things and simplify the driver. Finally, it
> builds on those fixes and cleanups to introduce TDM and DSP formats support.
>
> Let me know what you think,
> Maxime
>
> Marcus Cooper (1):
>   ASoC: sun4i-i2s: Fix the MCLK and BCLK dividers on newer SoCs
>
> Maxime Ripard (20):
>   ASoC: sun4i-i2s: Register regmap and PCM before our component
>   ASoC: sun4i-i2s: Switch to devm for PCM register
>   ASoC: sun4i-i2s: Replace call to params_channels by local variable
>   ASoC: sun4i-i2s: Move the channel configuration to a callback
>   ASoC: sun4i-i2s: Move the format configuration to a callback
>   ASoC: sun4i-i2s: Rework MCLK divider calculation
>   ASoC: sun4i-i2s: Don't use the oversample to calculate BCLK
>   ASoC: sun4i-i2s: Use module clock as BCLK parent on newer SoCs
>   ASoC: sun4i-i2s: RX and TX counter registers are swapped
>   ASoC: sun4i-i2s: Use the actual format width instead of an hardcoded one
>   ASoC: sun4i-i2s: Fix LRCK and BCLK polarity offsets on newer SoCs
>   ASoC: sun4i-i2s: Fix the LRCK polarity
>   ASoC: sun4i-i2s: Fix WSS and SR fields for the A83t
>   ASoC: sun4i-i2s: Fix MCLK Enable bit offset on A83t
>   ASoC: sun4i-i2s: Fix the LRCK period on A83t
>   ASoC: sun4i-i2s: Remove duplicated quirks structure

Unfortunately the patches that "fix" support on the A83T actually break it.
The confusion stems from the user manual not actually documenting the I2S
controller. Instead it documents the TDM controller, which is very similar
or the same as the I2S controller in the H3. The I2S controller that we
actually support in this driver is not the TDM controller, but three other
I2S controllers that are only mentioned in the memory map. Support for this
was done by referencing the BSP kernel, which has separate driver instances
for each controller instance, both I2S and TDM.

Now to remedy this I could send reverts for all the "A83t" patches, and
fixes for all the others that affect the A83t quirks. However the fixes
tags existing in the tree would be wrong and confusing. That might be a
pain for the stable kernel maintainers.

Any suggestions on how to proceed?

Regards
ChenYu

>   ASoC: sun4i-i2s: Pass the channels number as an argument
>   ASoC: sun4i-i2s: Support more channels
>   ASoC: sun4i-i2s: Add support for TDM slots
>   ASoC: sun4i-i2s: Add support for DSP formats
>
>  sound/soc/sunxi/sun4i-i2s.c | 660 ++++++++++++++++++++-----------------
>  1 file changed, 372 insertions(+), 288 deletions(-)
>
> base-commit: d45331b00ddb179e291766617259261c112db872
> --
> git-series 0.9.1
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
