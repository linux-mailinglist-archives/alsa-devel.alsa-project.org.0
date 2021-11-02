Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BEEF442E67
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Nov 2021 13:46:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1D40F16DA;
	Tue,  2 Nov 2021 13:46:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1D40F16DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635857212;
	bh=8gkHrYWGHwVLT0Rg+6tUXxcDyfBwshFZBGSt6IqVBn8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fQmMTfli//uQYHwJ9UWaN68APUa5ts42ol7Mp2ZQlPZQVU5tDIqm64kk8R2L9jrAL
	 HDHi6NUQba/7Gh+Ph61pkSqNSIRWWjCfCcCApm1DKlFulS93Kfjn6hNjbJEaNn140I
	 feqph2thsvXbAwxphG0w0bm2Nio+59QDKF7X9bCE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 89D99F8025F;
	Tue,  2 Nov 2021 13:45:34 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4A9BEF8025D; Tue,  2 Nov 2021 13:45:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D1674F80224
 for <alsa-devel@alsa-project.org>; Tue,  2 Nov 2021 13:45:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D1674F80224
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="a5BUgCpS"
Received: by mail-wm1-x331.google.com with SMTP id
 f7-20020a1c1f07000000b0032ee11917ceso2015133wmf.0
 for <alsa-devel@alsa-project.org>; Tue, 02 Nov 2021 05:45:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=ZZkZVqa+3Plnn+r7mlQ/DHzi6CEkEgG/JnTm+RoF3Os=;
 b=a5BUgCpSrtUkDJpbZB1JWGRjd29moku/hgoRNXpgoUydTPcHt/wZ+Mn2D21V4PyZZ9
 Vx8dSEvCioF/cLT6iQgvNOKDrGVK4aGS/oMld+LZZ7+gWvsmWzTKnmhwPf5wKO+GE5s0
 Dl1PgbJsFtIvBSshpJxhmJ39uAK2LAFN+N+KVJIgjucoTmfsOz00WhzY+J9cZoMceF/X
 zkruyXFjaQ8nhIV+zS6svKW6vGw0/RHvrayN7hEZSTJvAofn1mY50hLttZvDBV5xezi8
 gnQJtbXquJcW43+wuhCkoQudE+sJgwjiEISmCRgTmzcMMFTolHy2g4YDijtOwwTN65rA
 zCSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ZZkZVqa+3Plnn+r7mlQ/DHzi6CEkEgG/JnTm+RoF3Os=;
 b=FRiHzNObk3VLAK5X/swGeWUqwC91FD1u12UkNgAemSDQNRV+Wz6bgj8atrm6UAuhBK
 jGMRLdgvnjMVzLdEAIkumaccDr5WKURf/gWUQMUt7K0lyQkkyDN0KQtV9VPe3KkBAeZX
 2MDZq8mKQYs7Xpo912e8TTji1zkP9NQSYdqu87qbiD1cF3JSTmbNeQ57jmq6ZlaFLpUN
 yUDdyOlHZSzsAcaedkKFdphau0GYjbMUahdJWKEpuMBJHL35ot02XZQEZHdfkAE35CSC
 08ldXSOe0KENoLGtLtsviBz0OerJdwWNwYpgCgFBSce63INrd4Da1cE6FNGli/Uwtbb6
 +/BA==
X-Gm-Message-State: AOAM5318TJVHrbx27aLi03+qCsEE8A4Jl3hyUykxMylsUVD+k83abmKE
 HCWhHMeLxzWxeoN0vI40Yg==
X-Google-Smtp-Source: ABdhPJzKEJONKSknqb28hjNBtqlKzn1WjVheQ7JDq8SUVGJAbIFvwd7VSeromLyp3heo9ZB3kOmWqA==
X-Received: by 2002:a7b:c76e:: with SMTP id x14mr6612110wmk.27.1635857115568; 
 Tue, 02 Nov 2021 05:45:15 -0700 (PDT)
Received: from rampage-hp2 ([80.169.207.154])
 by smtp.gmail.com with ESMTPSA id y12sm15437552wrn.73.2021.11.02.05.45.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 05:45:15 -0700 (PDT)
Date: Tue, 2 Nov 2021 12:45:13 +0000
From: Jonathan Clarke <jonathan.a.clarke@gmail.com>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH] Make top/rear speaker, mute and micmute leds work on HP
 x360 14-ea000 laptops that use Realtek 245 codec
Message-ID: <20211102124513.GA1298862@rampage-hp2>
References: <20211029154313.1005394-1-jonathan.a.clarke@gmail.com>
 <s5h35oisug0.wl-tiwai@suse.de>
 <20211101103445.GA1064130@rampage-hp2>
 <s5hzgqnotpu.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <s5hzgqnotpu.wl-tiwai@suse.de>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>
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

On Tue, Nov 02, 2021 at 09:19:25AM +0100, Takashi Iwai wrote:
> Could you try just to flip the bit 0x08?  At LED off state?
> 
> % hda-verb /dev/snd/hwC0D0 0x20 SET_COEF_INDEX 0x0b
> % hda-verb /dev/snd/hwC0D0 0x20 SET_PROC_COEF 0x77f4
> 
> That is, the implementation in alc286_fixup_hp_mute_led_coefbit(),
> which is used by many other HP laptops.

Ah, I see what you mean.  

Yes, you're right, changing from 0x77f4 to 0x77fc makes the mute led light up.
The changes to the other proc_coef bits in my patch are not needed.

I will revise and revert in next few days.  Thanks
