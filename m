Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9175C159532
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Feb 2020 17:41:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 36C031693;
	Tue, 11 Feb 2020 17:40:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 36C031693
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581439281;
	bh=KiJY2NS588lr/QHvdkCERT4yPDYP+/TyEwOLzHI5xGQ=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RDa2Ei3weEdioasF03JuhO0NJ8KGzRLw4C/mIQSaXYAUhllf/y5NPv165vSZ8gKiP
	 eS3Qh0GonsRTb65xAUOeaoPpouuCO0Rvy2CSiLZPoTQ7w0dhgMUHTJCUKp68mIcD9l
	 7pc+w1xwQ5hT8qg5Q/yza5gtKuPE2OM00G5LPuWI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 39884F800E7;
	Tue, 11 Feb 2020 17:39:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B5CE0F8013E; Tue, 11 Feb 2020 17:39:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_SOFTFAIL autolearn=disabled version=3.4.0
Received: from conssluserg-06.nifty.com (conssluserg-06.nifty.com
 [210.131.2.91])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 40965F800F0
 for <alsa-devel@alsa-project.org>; Tue, 11 Feb 2020 17:39:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 40965F800F0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nifty.com header.i=@nifty.com
 header.b="Ml5vePao"
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com
 [209.85.222.46]) (authenticated)
 by conssluserg-06.nifty.com with ESMTP id 01BGcrOV010483
 for <alsa-devel@alsa-project.org>; Wed, 12 Feb 2020 01:38:53 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com 01BGcrOV010483
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1581439134;
 bh=Fx7J1tLvigpB2TQEKEHL9mZZJiUbmOHvoP/GiGlFxss=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Ml5vePaorXfWR1IkIk8aVOLkwlszo/+IPtOdpx3YlN/JlOhIDQ1811ZmaQg7TQzKf
 bcDqvAXL4TZhPPQP3QYuoomkHT+lEzdWKy0TWGCJ0+LapfKTzHltrwMTcheEu9mzYu
 SXLbW1/Bfmtc1F6G4cZifJzDpf35danf/c1FpWsQWYcMk6TOtRcAXpV+kFrgItqOz3
 YZUK/KUSpMN7kT6+3AhYk5oHM+exipqr+dgQ/12DV4pkfyT79UCk/jOU4rokh3E/DZ
 FgjL5ZyrIoqWGTRNUbmKU3Fx+yx4yPtBV+1cBl4SxehYVGl2Zr4PDx5okApw3FZt0F
 Kp2SnkqOUuqTQ==
X-Nifty-SrcIP: [209.85.222.46]
Received: by mail-ua1-f46.google.com with SMTP id 59so4166882uap.12
 for <alsa-devel@alsa-project.org>; Tue, 11 Feb 2020 08:38:53 -0800 (PST)
X-Gm-Message-State: APjAAAVmNVhu4rVXN6p5br9VkN8932+zm12RJSdwjLnvHN5wiyjOCQXO
 eTfnQe9ifoV1nRYBCOsUKGGthaTTZ3eXJO7kQKs=
X-Google-Smtp-Source: APXvYqwHm08bawF4IR7j/P5H17OzWDZmArcl2jYMsqSgfZ5kjpP6JGy/GtBXXkiRnojqD0Ml3k0SUtEHhHi7Machn7o=
X-Received: by 2002:ab0:2ea6:: with SMTP id y6mr2151127uay.25.1581439132256;
 Tue, 11 Feb 2020 08:38:52 -0800 (PST)
MIME-Version: 1.0
References: <20200207091351.18133-1-geert@linux-m68k.org>
 <CAK7LNAQGcw1jbb=fWd_CbWv5hQrkqG_QFCw3uY4LXroONGM6BA@mail.gmail.com>
 <20200211161905.GM4543@sirena.org.uk>
In-Reply-To: <20200211161905.GM4543@sirena.org.uk>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 12 Feb 2020 01:38:16 +0900
X-Gmail-Original-Message-ID: <CAK7LNARCr8afvs=h5-ZWVs=Bkk7PSMNvX+M_SeBSF-L99UencA@mail.gmail.com>
Message-ID: <CAK7LNARCr8afvs=h5-ZWVs=Bkk7PSMNvX+M_SeBSF-L99UencA@mail.gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [alsa-devel] [PATCH] [RFC] ASoC: Use imply for
	SND_SOC_ALL_CODECS
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

On Wed, Feb 12, 2020 at 1:19 AM Mark Brown <broonie@kernel.org> wrote:
>
> On Wed, Feb 12, 2020 at 01:09:30AM +0900, Masahiro Yamada wrote:
>
> > Why does SND_SOC_ALL_CODECS exist in the first place?
> > Is this compile-test or run-test?
>
> It's for compile coverage.
>
> > If it is the former, allyesconfig / allmodconfig
> > covers all of them.
>
> No it doesn't.  Those only enable user selectable options, many CODEC
> drivers don't have user selectable options as they are selected by
> machine drivers some of which either have more platform specific
> dependencies that the CODEC drivers or aren't upstream.


Maybe, can you add a prompt which is only displayed
if COMPILE_TEST is enabled?



For example,

config SND_SOC_L3
        tristate "some prompt" if COMPILE_TEST




In normal use-cases, this CONFIG option is hidden
since we expect it to be selected by some machine options.

If COMPILE_TEST is enabled, we can toggle as you like.


If I run
 $ git grep  "if COMPILE_TEST"

I see many usages of this tip.


-- 
Best Regards
Masahiro Yamada
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
