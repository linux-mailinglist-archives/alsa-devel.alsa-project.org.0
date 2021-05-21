Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B20938C25D
	for <lists+alsa-devel@lfdr.de>; Fri, 21 May 2021 10:56:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 024B816A1;
	Fri, 21 May 2021 10:55:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 024B816A1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621587369;
	bh=jkw6wDoc7N6uEyzhMyrLLgRb+cWgmfj9RdACJfzfIuE=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Gn0c4QC50oerIcC1JL+fbIpTCkt1uUK6zQHgYw8VdQamWgszt/xbk7wUjr15DpRnR
	 yLky8y7Cpl4GtKAusSS5IVpYtg7JJHhcoNGZuMMnmLpvNxm756qkAG2MbZ/TEf+cag
	 2AdLelrgzE6MbWstPnkDmLLADGx/Ja9I96jXqx6c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6AB33F80246;
	Fri, 21 May 2021 10:54:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7C254F801DB; Fri, 21 May 2021 10:54:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 14629F80153
 for <alsa-devel@alsa-project.org>; Fri, 21 May 2021 10:54:30 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 285D9A0040;
 Fri, 21 May 2021 10:54:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 285D9A0040
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1621587269; bh=zfQOEPjPu+MFDsM+IqxZDl7MiSDjj91oZwdBebRzDIQ=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=DDPeR/46pKs/zk1DUIE1Zu8prrZuYOrkN89aymRWN08vVY6WDxfIFgvyJhyGb6kc7
 kwSG5J7TKwAV8hr8jnLyqmhMYqTqQT/sRknV2IXmcd1W/1Fh/863M6inLMh0JvtTRe
 SLPBAszbW8C9UPwjsbQhtDvhvlOib1poPJBsiQgY=
Received: from p1gen2.localdomain (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Fri, 21 May 2021 10:54:18 +0200 (CEST)
Subject: Re: [PATCH v2 2/2] ASoC: tegra: Unify ASoC machine drivers
To: Mark Brown <broonie@kernel.org>
References: <20210520175054.28308-1-digetx@gmail.com>
 <20210520175054.28308-3-digetx@gmail.com>
 <8e5d4442-00a4-460b-d37a-8962960dd7ff@perex.cz>
 <20210520190812.GF3962@sirena.org.uk>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <ef59dad1-b06e-1d90-5948-9bb6e79478a2@perex.cz>
Date: Fri, 21 May 2021 10:54:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210520190812.GF3962@sirena.org.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, Svyatoslav Ryhel <clamor95@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>, Ion Agorria <ion@agorria.com>,
 linux-tegra@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>
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

Dne 20. 05. 21 v 21:08 Mark Brown napsal(a):
> On Thu, May 20, 2021 at 09:02:49PM +0200, Jaroslav Kysela wrote:
>> Dne 20. 05. 21 v 19:50 Dmitry Osipenko napsal(a):
>>> Squash all machine drivers into a single-universal one. This reduces
>>> code duplication, eases addition of a new drivers and upgrades older
>>> code to a modern Linux kernel APIs.
> 
>>> +static struct snd_soc_card snd_soc_tegra_wm9712 = {
>>> +	.dai_link = &tegra_wm9712_dai,
>>> +	.num_links = 1,
>>> +	.fully_routed = true,
>>> +};
> 
>> Please, could you also initialize snd_soc_card->components? It may be useful
>> to pass the codec identification to the user space like:
> 
>> .components = "codec:wm9712"
> 
> Hrm, if this is important to userspace shouldn't the core be doing
> something by default given that it already knows all the components
> going into the card?

I don't think that we can pass the complex topology in the simple string (127
chars). For the time, it's better to pass only the vital information which the
user space requires for the fine-grained hw configuration detection and
description.

For the above example, the "codec:" prefix may be replaced by the purpose
string (like "hs:" - headset, "spk:" - speaker) etc. This information is not
available in the ASoC components (purpose / location / exact I/O config etc.).

>> The passed information should be consistent. You may look into the Intel ASoC
>> drivers for the examples (card->components initialization). There are also
>> hints about the number of connected microphones ("cfg-mic:2" - configuration
>> with 2 microphones) or the codec purpose ("hs:rt711" - headset codec is RT711)
>> etc.
> 
> This sort of stuff is more something that the card should layer on top.

It would be nice to have this layer with the topology description, but until
someone designs it, it's much easier to describe the configuration and hints
in the simple string passed to the user space.

Actually, for ACPI/PCI platforms, the information is gathered from the tables
or detected by PCI IDs. For the device tree. It may be worth to allow to pass
this string from the device tree, too. I believe that the DT config author has
enough information to describe the hardware.

						Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
