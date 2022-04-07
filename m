Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DAA74F8FEB
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Apr 2022 09:53:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9020E1921;
	Fri,  8 Apr 2022 09:52:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9020E1921
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649404408;
	bh=OHSVQBrreW6amcpevdinJdUeaKgFWncbPZyGDMcXgAY=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uZOnZEGp+jkLTQ2ZuPKzBTaTuPYy+pR05vM1u/K4/DzUFpJJY85eEw+NmUhkDs91Q
	 ycqj+n/IE/waQhqkHLnwYK47TfFtrRAYjdhar42GKjQGwn2+WwcHVnra9xuEEnByDW
	 Xwm+DJRGSpNn8EJ84L/EVs7T3bhvI0YO/QYHEDYQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 70D34F80571;
	Fri,  8 Apr 2022 09:48:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4565EF8024C; Thu,  7 Apr 2022 19:16:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9A2C2F80054
 for <alsa-devel@alsa-project.org>; Thu,  7 Apr 2022 19:16:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9A2C2F80054
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="FJ1qN4a5"
Received: by mail-pl1-x62d.google.com with SMTP id d15so5560124pll.10
 for <alsa-devel@alsa-project.org>; Thu, 07 Apr 2022 10:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=CzjnguXiadlz7eUY9Kx6829Is7Jt6JaiEaPs+5sqqTA=;
 b=FJ1qN4a5bVhIVqPz+llJc+3m0NxSx14176vB3YwGMMqbFFd7DF300IuvPiiFbY3DYI
 jlfeGcnzmuptkWrsHOCwZAcOAFceTx3nM3m7kJDHX4w3s1kdb3hn4NBYZfJPiPwV8fVv
 fLHh0HqH3V31MlMTLoxyGq1UUGxwhgaOsQkKaNLUOucnXuRK1xX36Ryy5fIjdInxDw6+
 r57NNFPjU0p00GyZxiIJndYJfs4csq6zOhkkpYRHWkxKQpxJZw7Q6/R2+N0D+EfQhwYF
 cULrVncucRpwZTcwYOJOwPcjqlAUmUV+TIW9dfl2teEOwLl2nIAQpm6mb3DcvOt/WuaW
 uLcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=CzjnguXiadlz7eUY9Kx6829Is7Jt6JaiEaPs+5sqqTA=;
 b=gnTO1aBEhdWZHyKmClXhlQQcj1KSHvt/lUpd04VUvJLIi33UVbhiVK+ZQYeKniRGuI
 pqIvQaIeS8OFcHhHFZ2pNs9aR4jqpP2flFa0MddqdZCSuvTuxyXR1Rf7GSSCzkt+CVVJ
 cjYn/jb1M898lgk6IH2uKgYGiGgKJiVrvFyYFcQPbLx6E/oFtrJ6HytuZLq4CV1OAZ6X
 9w8HG/h3ZgUHaExhM95I3XIlJHeM/yzwqSsL7+vfGd5802nbAY8Tdy++eKuKG3QaDzRf
 iORWO1mIFNs2BNP1Nf4+/4bNU2+Hs1oUWPV6NaNV+D7IGHGaKybs2VuWyJsuqHhag3oH
 eLdQ==
X-Gm-Message-State: AOAM531pEAP+ei04LjZC8uJxPY3+Fqcp+DRptGL/mwUBYLgWo2matvoJ
 Quy2mSXkRwQU3FmyvcRo5Uw=
X-Google-Smtp-Source: ABdhPJwP7cEeCx5ye1HcJ+QRcDwu2/wTSd5heTYmutBYTgXHY7Lzwr/v9H4cd8Np28CzJsv60CRj4A==
X-Received: by 2002:a17:903:205:b0:157:c51:12cd with SMTP id
 r5-20020a170903020500b001570c5112cdmr3342521plh.94.1649351806027; 
 Thu, 07 Apr 2022 10:16:46 -0700 (PDT)
Received: from [192.168.66.3] (p912131-ipoe.ipoe.ocn.ne.jp. [153.243.13.130])
 by smtp.gmail.com with ESMTPSA id
 il3-20020a17090b164300b001c6d5ed3cacsm10209485pjb.1.2022.04.07.10.16.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Apr 2022 10:16:45 -0700 (PDT)
Message-ID: <57747e9a-10e0-e4f6-0644-5225396802f9@gmail.com>
Date: Fri, 8 Apr 2022 02:16:41 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] ASoC: rt5682: Add jack kcontrol
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
References: <20220407141316.5099-1-akihiko.odaki@gmail.com>
 <Yk7+jbQ0KBM0zVh9@sirena.org.uk>
 <96dae189-c0ff-4054-3d00-41c3b44c2cd6@gmail.com>
 <Yk8Ktyyt0veW4g+j@sirena.org.uk>
 <f86a10e1-b5a7-5c59-8e53-cec65d97234b@gmail.com>
 <Yk8TLUnEHRKstyxq@sirena.org.uk>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
In-Reply-To: <Yk8TLUnEHRKstyxq@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Fri, 08 Apr 2022 09:48:11 +0200
Cc: Oder Chiou <oder_chiou@realtek.com>, Liam Girdwood <lgirdwood@gmail.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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

On 2022/04/08 1:37, Mark Brown wrote:
> j
> On Fri, Apr 08, 2022 at 01:11:22AM +0900, Akihiko Odaki wrote:
>> On 2022/04/08 1:00, Mark Brown wrote:
> 
>>> That bit is very common but there's still machine specific aspects - is
>>> the required hardware wired up, if it is wired up how exactly are things
>>> wired (separate microphone jack, headset jack, one of many jacks?).  A
>>> lot of the machine driver part of things is about labeling things so
>>> that it can be displayed in a way that's easy to connect to the physical
>>> system.  Generally the machine driver would define a jack and then
>>> connect the CODEC to it.
> 
>> Whether the required hardware wired is told from the user of the codec via
>> jack's type specified with snd_soc_card_jack_new(). The other details live
>> in the codec.
> 
> So I'm confused about what problem this patch is intended to fix.  It
> really sounds like there's some issue with the driver not using standard
> interfaces that you're trying to work around but the changelog is not at
> all clear.  The "doesn't use DAPM" bit is a bit of a warning sign, it
> sounds like the audio signals to and from the CODEC aren't being
> connected to the jack properly.
> 
> Look at how other devices with jack detection hardware handle this and
> follow a similar pattern.

The situation actually seems quite a mess. You can find many drivers not 
using DAPM pins by searching for snd_soc_card_jack_new() calls with 
num_pins argument is 0. ams-delta-audio is exceptional as it adds DAPM 
pins later with snd_soc_jack_add_pins().

They do not have kcontrols for the jacks. The only exception is 
skl_hda_dsp_generic which calls snd_jack_add_new_kctl() as my patch 
does. Looking at other devices is probably not helpful to find an 
alternative in this case.

Regards,
Akihiko Odaki
