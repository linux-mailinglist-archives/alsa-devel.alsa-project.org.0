Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BFE538B6AC
	for <lists+alsa-devel@lfdr.de>; Thu, 20 May 2021 21:04:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D5BD716A4;
	Thu, 20 May 2021 21:03:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D5BD716A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621537485;
	bh=IRgzKsFs36CjPlF5SOaXK9Fd9qKA+C+zxYZjB76xC6o=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Z9aSm8l7cKZNU2OF9Yl7cyOSu/qIhJXuWyTK0rlUaxcU8Qclx7eqIAEJ1YZQJozZf
	 WNAgIAocpDFlffbjkLPI9usSlrEJ8ppXeC3hcCmICPrhikdSq3+e+CZxBq3JeMJKau
	 ax5ZnKpjmW6Fxl5rX30jP1xo4ceLoacjganPYYg0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 29556F80229;
	Thu, 20 May 2021 21:03:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7BE2DF80217; Thu, 20 May 2021 21:03:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 46CC7F800C1
 for <alsa-devel@alsa-project.org>; Thu, 20 May 2021 21:03:06 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id C48FCA0040;
 Thu, 20 May 2021 21:03:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz C48FCA0040
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1621537380; bh=y+8k9wqsJtPgUJsqRvi4ZT1JcJem6VoeiPwXOKz49+8=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=gEuQOqvhKarNj1FC6LYFw4mBdEcl0qARfAhMs0XQlRPvCew6fRX+0iqvmEF32BU75
 LBn4Ysbu9AF4xWVunARQO7ESvwqP0JF/eetbI1lUY2s3Hzn0OKd/qoS9eEs3HeaOns
 EaxecFzu3DutMFCPBkeCUd+09MSjewOnwnI9Al34=
Received: from p1gen2.localdomain (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Thu, 20 May 2021 21:02:49 +0200 (CEST)
Subject: Re: [PATCH v2 2/2] ASoC: tegra: Unify ASoC machine drivers
To: Dmitry Osipenko <digetx@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Ion Agorria <ion@agorria.com>,
 Svyatoslav Ryhel <clamor95@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>
References: <20210520175054.28308-1-digetx@gmail.com>
 <20210520175054.28308-3-digetx@gmail.com>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <8e5d4442-00a4-460b-d37a-8962960dd7ff@perex.cz>
Date: Thu, 20 May 2021 21:02:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210520175054.28308-3-digetx@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: linux-tegra@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
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

Dne 20. 05. 21 v 19:50 Dmitry Osipenko napsal(a):
> Squash all machine drivers into a single-universal one. This reduces
> code duplication, eases addition of a new drivers and upgrades older
> code to a modern Linux kernel APIs.
> 


> +static struct snd_soc_card snd_soc_tegra_wm9712 = {
> +	.dai_link = &tegra_wm9712_dai,
> +	.num_links = 1,
> +	.fully_routed = true,
> +};
Please, could you also initialize snd_soc_card->components? It may be useful
to pass the codec identification to the user space like:

.components = "codec:wm9712"

The passed information should be consistent. You may look into the Intel ASoC
drivers for the examples (card->components initialization). There are also
hints about the number of connected microphones ("cfg-mic:2" - configuration
with 2 microphones) or the codec purpose ("hs:rt711" - headset codec is RT711)
etc.

					Jaroslav


Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
