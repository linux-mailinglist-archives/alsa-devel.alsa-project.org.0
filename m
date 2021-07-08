Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A8FF13C195C
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Jul 2021 20:45:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1A0D0828;
	Thu,  8 Jul 2021 20:44:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1A0D0828
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1625769945;
	bh=cOqZ8kQnNTFP+1P1zfcZQnujTv/Hyl85WVXwZViU5Wg=;
	h=To:References:From:Subject:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fbZa0DPsVo5dgbPsFDe1ZaVo9G5Jc58XOW6FsXeU0fNndq2dQYbRLuuTqJnKcwP2L
	 Ko2wG0FzTc8yTQ3dft+SjsitsZWpRMIjMfyOYkjM0pAsEm8WxMMo2vy68eaKDFbvuT
	 rps12d+ATueXtkugF415l3yXjJ1Sdd6k9AtA3IDw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8B8F6F8012A;
	Thu,  8 Jul 2021 20:44:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1AFBBF80249; Thu,  8 Jul 2021 20:44:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 88CE9F8012A
 for <alsa-devel@alsa-project.org>; Thu,  8 Jul 2021 20:44:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 88CE9F8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="mLKGojjw"
Received: by mail-lj1-x22b.google.com with SMTP id a18so3977208ljk.6
 for <alsa-devel@alsa-project.org>; Thu, 08 Jul 2021 11:44:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=to:cc:references:from:subject:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=sZLRjLlW9rCFGc6nixJiX9bwDDQ89fssA6LELgHRP2g=;
 b=mLKGojjwcJW00cHWbOZKVBrkyZqyNh1wQPFTL6MM/Su1uR36dEoikv7Y9lXp5N57sV
 BtzrnHNao1VY58bbI9eLab+ZH0qlz7K9wneeqg86rFKDYfe7tcnNuhKNRRz5RNi53ARm
 y+QP9PKArjVsUOSXJKfEhblmmB4yKVIt4qBAzrHnDtNVlIQT2BQlZGzWYXRR0/wwX6eb
 g1iw0rBzbAc8AEVjUQ0SDOoJ6gPCyy7EfOrH3aplLAYu4N5QV0lKLYHBUn8INwbvgpen
 9ylqnOJiUsZzquMebpgyxUfVHDUJjBh1f4I6q8ITNPBa728GtDdsH0gU2RC8Yh8Fda52
 WVwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=sZLRjLlW9rCFGc6nixJiX9bwDDQ89fssA6LELgHRP2g=;
 b=jjypCoBICrYJbhS2ga1unrDnLtyBJisJjRdRdrRF4qKRRarwQO2nJIXbRVj0oNJrzD
 Wp92DFyB03Bp8+PaZXBE1yYqYsxIxzmacT6hksHNOq1uKgbBi/2/M6l+mmjG5B04n7Qw
 jdbdp+Ufp8jpV3T7YYXx/Z2WBm7IIuy+7+oaMQh2Pj3dBz/e4SVD6rwDOrM1BoVMIyAj
 FpKi/L13j9SEb1ZbfslffAwa+LCQfXjf7PDNtGPRGoXVzt6hYawVkDy2gV7BcGWO9vNt
 n5madN92En+oQRhpNYYtq5F63Fzv1niYCE+2yFPDBVNY1dZOwvZGKmtRFuC8Gv65igtb
 FL/Q==
X-Gm-Message-State: AOAM532xgfwec52XNM6IZFfrlYs2u/nLdxlLRzsU3kt1MkuHMERHg680
 b89NADuEeYfYDCHSHeVZDUs=
X-Google-Smtp-Source: ABdhPJwh/wKk+yXECXyGQPEMUA4y3cxiWH/jZJiCDYggPwYFl5eENVN9rV1JXyDvN1rgDMaHmPIbSQ==
X-Received: by 2002:a2e:b80e:: with SMTP id u14mr11857415ljo.204.1625769843319; 
 Thu, 08 Jul 2021 11:44:03 -0700 (PDT)
Received: from [10.0.0.40] (91-155-111-71.elisa-laajakaista.fi.
 [91.155.111.71])
 by smtp.gmail.com with ESMTPSA id e20sm306074ljk.67.2021.07.08.11.44.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Jul 2021 11:44:02 -0700 (PDT)
To: Mark Brown <broonie@kernel.org>
References: <20210705194249.2385-1-peter.ujfalusi@gmail.com>
 <20210707173245.GK4394@sirena.org.uk>
From: =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>
Subject: Re: [PATCH v2 0/5] ASoC: ti: davinci-mcasp: Fix the DIT mode and
 OMAP4 support
Message-ID: <b800e9ff-c8dc-ca09-8b2d-a750f05edb12@gmail.com>
Date: Thu, 8 Jul 2021 21:44:05 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210707173245.GK4394@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: tony@atomide.com, hns@goldelico.com, alsa-devel@alsa-project.org,
 linux-omap@vger.kernel.org, lgirdwood@gmail.com
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

Hi Mark, Tony,

On 07/07/2021 20:32, Mark Brown wrote:
> On Mon, Jul 05, 2021 at 10:42:44PM +0300, Peter Ujfalusi wrote:
> 
>> Mark, Tony:
>> The ASoC and dts patches can go via separate tree I felt that it is better if
>> they are together, at least initially.
> 
> I'm happy to take both through ASoC?  The patches look fine to me.

Tony prefers if I leave the TRM documented (but not working) Smart-idle
mode intact in DT for the McASP and add some quirk via
drivers/bus/ti-sysc.c.
Tony, can you confirm it?

The ASoC patches are not affected by this, it is just that we need to
block SIDLE mode in a different way than how I did it in the last patch.

I'll take a look on how to implement the needed quirk for the McASP
module, then I can send the dts+ti-sysc patch to linux-omap.

-- 
Péter
