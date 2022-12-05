Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EC22642616
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Dec 2022 10:49:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 18B701777;
	Mon,  5 Dec 2022 10:48:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 18B701777
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670233785;
	bh=kvYOrdd5lF+DZ/BS+uRWOidprCvZ/dB4nqB00hL4KJ4=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JVyx/a9lU+x1SjX1W1EXLQ0JpiVm4wzE8ghmJp94Z7FQB5I/GhzL4DaNe1as9/rZh
	 1y+QsSUlKuI4p6Fx4MSXAr951+pyfLwni/BpWAAgswN2w2etnfUVVRz0DdiyAeW8MH
	 XLkeXqzJl5dadOnK7sTTr2KFrLtwixfgxBMfIXv8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 958A0F8047C;
	Mon,  5 Dec 2022 10:48:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CDE31F800BD; Mon,  5 Dec 2022 10:48:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, NICE_REPLY_A, RCVD_IN_ZEN_BLOCKED_OPENDNS, SPF_HELO_NONE,
 SPF_NONE, 
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1EE75F800BD
 for <alsa-devel@alsa-project.org>; Mon,  5 Dec 2022 10:48:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1EE75F800BD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="PCPc1Qot"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 185EA60FFA;
 Mon,  5 Dec 2022 09:48:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFFE7C433D6;
 Mon,  5 Dec 2022 09:48:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1670233717;
 bh=kvYOrdd5lF+DZ/BS+uRWOidprCvZ/dB4nqB00hL4KJ4=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=PCPc1QotCIsQ7mbn3+S26fH1+89Akqh8aayAD+VjwbpcjhHNOGS1XyhUi6j+/OeRS
 UNdrkI7iMPYI4hTrWx1GQwflMLBsa3/s2zKYNmMic+cpbaMPM9OfHX2UZwIgW5utcm
 1LdFrq+cNxMCRgtBoiIrlfVo2jOLvSJdI+e6f/nWM5QDuCJuiw9dWhKIJt0Ls2rRuS
 FdnmBfcimHOft1ArsRCB53PHeyNFIgj+K7HxawjS+xZtqZrdWYeGEvJQgRkYOe2vcM
 aI07ih9gwOshh9CXfHv7ZsBnw7pAddfVbuZ6mIKfw2oDo4Nvug8/l3VM9tAUB0fJFo
 uxPuA7BUoGmqA==
Message-ID: <fc82bd33-f71d-a146-82f1-9ff7fa377ce7@kernel.org>
Date: Mon, 5 Dec 2022 10:48:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH] ASoC: soc-compress: Reposition and add pcm_mutex
To: =?UTF-8?B?6rCV7Iug7ZiV?= <s47.kang@samsung.com>,
 kuninori.morimoto.gx@renesas.com, alsa-devel@alsa-project.org,
 tiwai@suse.de, lgirdwood@gmail.com, pierre-louis.bossart@linux.intel.com,
 broonie@kernel.org, cpgs@samsung.com
References: <CGME20221205074650epcas2p2bf7d43767ed34d8f8a9dcfe6e763e4e0@epcas2p2.samsung.com>
 <626742236.41670226602525.JavaMail.epsvc@epcpadp3>
Content-Language: en-US
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <626742236.41670226602525.JavaMail.epsvc@epcpadp3>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

On 05/12/2022 08:46, 강신형 wrote:
> From a385cc2614c17ba3002b263c0ca47dfbf6395c78 Mon Sep 17 00:00:00 2001
> From: "s47.kang" <s47.kang@samsung.com>
> Date: Fri, 2 Dec 2022 15:45:16 +0900
> Subject: [PATCH] ASoC: soc-compress.c: Reposition and add pcm_mutex.

This does not match your subject... and having subject twice is also
confusing. Please fix your mailer.

Additionally, this is like third patch, right? So please mark it as v3
(git format-patch helps in this).

> 
> If panic_on_warn is set and compress stream(DPCM) is started,
> then kernel panic will occurs because card->pcm_mutex isn't held
> appropriately in

So the problem is panic_on_warn or wrong synchronization? It's the
second, so skip unrelated information and instead describe the real
problem, e.g. what exactly lockdep reported.

> soc_compr_set_params_fe, soc_compr_open_fe and soc_compr_free_fe.
> So, I reposition and add pcm_mutex to resolve lockdep error.
> 
> Signed-off-by: Shinhyung Kang <s47.kang@samsung.com>
> ---
>  sound/soc/soc-compress.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)

Best regards,
Krzysztof

