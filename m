Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E41451C25F0
	for <lists+alsa-devel@lfdr.de>; Sat,  2 May 2020 15:48:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 18AD216AD;
	Sat,  2 May 2020 15:47:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 18AD216AD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588427328;
	bh=73TIjw9O6dK2fAlfdODYkB/VFm8uvKuFeW5svJp5uFA=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CyIsjhyN9BP6Oj1TJhCPKWnZWig/ne/Hno4fAYQj+fr+ckJB0FMONXUmXzYjMa02P
	 NYtANAFuf2eD7a0Ef8Ir+HAzQePTQGGyyXgAj23OI99aE7oLIzCAteLwZ5Dd0ck+EO
	 iGeh4CJm7naN/nDtKSZN/a60E8TXChNQH7qyqEiE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F3ECCF80252;
	Sat,  2 May 2020 15:47:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 18D39F8024A; Sat,  2 May 2020 15:47:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6DCE3F80087
 for <alsa-devel@alsa-project.org>; Sat,  2 May 2020 15:47:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6DCE3F80087
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="MC4T9yrN"
Received: from localhost (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A95112071E;
 Sat,  2 May 2020 13:47:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588427242;
 bh=73TIjw9O6dK2fAlfdODYkB/VFm8uvKuFeW5svJp5uFA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MC4T9yrNMAJ94kM2+SXcWdp6i2eKFYOzXDawiBEHaYHb2biJ9zHC2GbFujl40NAYf
 5pVS6ClrEJRxbfN+WfsKaVEAKrj99uQ/bXcD/zBYaQ+LgxWhVQXqpH/5w2f9MxyKOB
 EhdNt8MV9yshaw+3oRvYnAyj42Wi+lS4OFNVH0EU=
Date: Sat, 2 May 2020 09:47:21 -0400
From: Sasha Levin <sashal@kernel.org>
To: Mark Brown <broonie@kernel.org>
Subject: Re: stable-rc/linux-5.4.y bisection: baseline.dmesg.alert on
 meson-g12a-x96-max
Message-ID: <20200502134721.GH13035@sasha-vm>
References: <5eabecbf.1c69fb81.2c617.628f@mx.google.com>
 <cc10812b-19bd-6bd1-75da-32082241640a@collabora.com>
 <20200501122536.GA38314@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20200501122536.GA38314@sirena.org.uk>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Guillaume Tucker <guillaume.tucker@collabora.com>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 stable@vger.kernel.org, kernelci@groups.io,
 Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
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

On Fri, May 01, 2020 at 01:25:36PM +0100, Mark Brown wrote:
>On Fri, May 01, 2020 at 12:57:27PM +0100, Guillaume Tucker wrote:
>
>> The call stack is not the same as in the commit message found by
>> the bisection, so maybe it only fixed part of the problem:
>
>No, it is a backport which was fixing an issue that wasn't present in
>v5.4.
>
>> >   Result:     09f4294793bd3 ASoC: meson: axg-card: fix codec-to-codec link setup
>
>As I said in reply to the AUTOSEL mail:
>
>| > Since the addition of commit 9b5db059366a ("ASoC: soc-pcm: dpcm: Only allow
>| > playback/capture if supported"), meson-axg cards which have codec-to-codec
>| > links fail to init and Oops:
>
>| This clearly describes the issue as only being present after the above
>| commit which is not in v5.6.
>
>Probably best that this not be backported.

Hrm... But I never queued that commit... I wonder what's up.

-- 
Thanks,
Sasha
