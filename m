Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 28F2071609F
	for <lists+alsa-devel@lfdr.de>; Tue, 30 May 2023 14:53:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 67C1720C;
	Tue, 30 May 2023 14:53:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 67C1720C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685451235;
	bh=YtD3nSjY4iTnCSBgu8N7wfNObpaGkqwVKKaA+WzbZOI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Ftj8vTOWTkdPgk0lUq3IZuC0FZs1Z+U3UErJY6H0o5X8Wv+1dcmqHzdNIPAYNWwJL
	 /guXh8kGwH/Ycn0yaNWEXXPHogwAwtrxMu/yS+Xjn8lKcoN2/5GU2ciPi9XRqOgz3W
	 kl/uDmOJUm1EweJoyeCtee0LKArlG8+QZpPzEpWU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 17F68F80544; Tue, 30 May 2023 14:53:05 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BF630F8026A;
	Tue, 30 May 2023 14:53:04 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 09FCFF8042F; Tue, 30 May 2023 14:53:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B54E6F80149
	for <alsa-devel@alsa-project.org>; Tue, 30 May 2023 14:52:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B54E6F80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=fNBVPndH
Received: from [192.168.1.90] (unknown [188.27.34.213])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 7CAEB6606E99;
	Tue, 30 May 2023 13:52:55 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1685451176;
	bh=YtD3nSjY4iTnCSBgu8N7wfNObpaGkqwVKKaA+WzbZOI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=fNBVPndH+6jIxa4ONTK3bRFZC0x+eSJl6YGMX6RRmhrjBLxmkSvP0Rki6hN2YpyTM
	 o/SHDuRMA/+Znnj++LYdUOBwqdI4KWacsrkxaWaNGJ1pDToSU1I7uWOJtpWZtALg8l
	 StoIKZjSWgHr7aN4orkwe1vHVk3uJScz31uMXPoCR//vBN873VniUvnx4KXLRUVRpO
	 pqLO5E0NbZymwcmNVTPx1XJbgi0oPM/QdqIfBFYj1ZGzLrw8j83ezlj6IvK96LH6Tz
	 00O1ewEJfbINAuQgFE0YmFqmGFuLnoENxarkFCbZdw7mkYIOivtGIUKRVma/txelgX
	 csPWSid6A0Whw==
Message-ID: <8247660d-4b95-0ed7-9444-b23da23560ac@collabora.com>
Date: Tue, 30 May 2023 15:52:52 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 1/3] ASoC: es8316: Increment max value for ALC Capture
 Target Volume control
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Zhu Ning <zhuning0077@gmail.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 David Yang <yangxiaohua@everest-semi.com>, Daniel Drake
 <drake@endlessm.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 kernel@collabora.com
References: <20230524074156.147387-1-cristian.ciocaltea@collabora.com>
 <20230524074156.147387-2-cristian.ciocaltea@collabora.com>
 <5dbcbf84-602a-44de-ad99-268d4d5b4b2f@sirena.org.uk>
 <cfa23203-1626-440b-ec27-efe56cb297d2@collabora.com>
 <01fd1a9f-56c7-4864-bb2b-8b004284c8cc@sirena.org.uk>
 <3c6b67a4-4892-0057-3dfc-65ed6c7ebc37@collabora.com>
 <4a3f54a3-2cbd-4a22-9742-9ba60e78643b@sirena.org.uk>
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <4a3f54a3-2cbd-4a22-9742-9ba60e78643b@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 4UEAOZCW4YRUIKC6IJ4AXD62IPTYXDJS
X-Message-ID-Hash: 4UEAOZCW4YRUIKC6IJ4AXD62IPTYXDJS
X-MailFrom: cristian.ciocaltea@collabora.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4UEAOZCW4YRUIKC6IJ4AXD62IPTYXDJS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 5/30/23 14:36, Mark Brown wrote:
> On Fri, May 26, 2023 at 09:11:49PM +0300, Cristian Ciocaltea wrote:
> 
>> -1.5 dB  |  50-51 %
>> -0.0 dB  |  50-51 %
> 
>> So it seems the specs are correct, and the problem is the hardware default.
> 
>> Is there a better approach to handle this than extending the volume range?
> 
> The other option would be to change the value in the register during
> probe to one that's in range, that wouldn't stop any existing saved
> settings from generating errors but would mean there wouldn't be any new
> ones.  Either approach is probably fine.

Thanks, I will prepare v2 and keep the current approach.
