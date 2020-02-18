Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E0A36161EC5
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Feb 2020 02:56:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4DF20166D;
	Tue, 18 Feb 2020 02:56:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4DF20166D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581991014;
	bh=hB3wdFuVKqHMRdH1KXxp9wtC78F8d/4xxp1B9UM5md0=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TVj/kwmdwnDV+JO1domKCuizIguTPYGSy7A63WAZy7T1w/5B/w0C0zU2C2fsxmXtR
	 LQIvgDYj5Hh5DDELQL3qnQd1AWVrp4pEiIsBtHU9V0FhgKDLMkjbSpW6Hf1P7bBq4i
	 Pnb+gF1nyNBW+6MoXsMsPxum9himz6X9Hz3kK36o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 49AF9F801F4;
	Tue, 18 Feb 2020 02:55:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BC9C3F80096; Tue, 18 Feb 2020 02:55:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 85774F80096
 for <alsa-devel@alsa-project.org>; Tue, 18 Feb 2020 02:55:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 85774F80096
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sholland.org header.i=@sholland.org
 header.b="fey7V777"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="2Z0CbNrX"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id C6BE96244;
 Mon, 17 Feb 2020 20:55:05 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Mon, 17 Feb 2020 20:55:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 subject:to:cc:references:from:message-id:date:mime-version
 :in-reply-to:content-type:content-transfer-encoding; s=fm2; bh=e
 YnIVvK0q9JrGCRBjZx29b4zt5fQgH9zuyMH2krGX/Q=; b=fey7V7774/zbe/0yv
 b3XBejwmgGycVWMsDRgzIdvJyKIIot5v/YayVFxJYkAWynzfkZZi7c40XaSHH679
 kEvUyvFr19eynPZ3uqtY/C5F9R1YLjOqSSuSKOuxLcqi3Tlf/ydffffSZPDDTOdJ
 hbQDU+pkgxYGXNPb4M8PGqc13sEKgPyz6hdZfv49e7ZWbiNkDKDqQHd0vQ7F8JVJ
 LLoP2AFIT8uE69d6ozHP7gFbENWz2QM6LVBfWhnlYwPI1boJCNIdz5/HoArm18E0
 aWlAzmLQ/5zjeZMnLx5ly377rusi7rPSQET/6IDgclbcb5CIm1WuBBw29bVLarYr
 6uQIQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=eYnIVvK0q9JrGCRBjZx29b4zt5fQgH9zuyMH2krGX
 /Q=; b=2Z0CbNrXiu1UkDc7K9uMUkCp+5FJWshYrl+YnFiUKBX8LCjzt4JrlkqPV
 U1itbYE8ERgzokozGP4ZXvoJX1QYKHlYLfQtYUMyBgb9Kw2doshmw5mPP9KECg7f
 J9OctR7gPuxWGXEtHMEiE2MDtEaqx0a1h3roC/ZJnqqGMHJv+uZXv3RWBU6XkC0Q
 sA/29i59E0IopUJvuXr/l7nGL4JSn5XxOeN1+9G+deKW+hKcg5RCBecaO/vmMTEB
 2deM4Dh3BN7uUW/yccDWq9wxSGwJSlrSbLPrvwtKUtXiH3JujWd2BEiHXWSRKNM1
 +rBq+KlB1mgHQccXLH8/s+V19aHEw==
X-ME-Sender: <xms:-ENLXp_TURkjTpR1RT4Js6KNp2HxmdctwrZOvbRh59H5JkMNlTgarw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrjeejgdeflecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefuvfhfhffkffgfgggjtgfgsehtjeertddtfeejnecuhfhrohhmpefurghmuhgv
 lhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucfkph
 epjedtrddufeehrddugeekrdduhedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghr
 rghmpehmrghilhhfrhhomhepshgrmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:-ENLXh_qsOVkH-W6KKjsXtdJDWnLWtdjRV58uk-Od9QiX8xVGA4WLg>
 <xmx:-ENLXiB26jZx2AygWC6W1A_zibyhp3hQLRerTwEkV7Uicc3MmsDqTA>
 <xmx:-ENLXhwVdLwMfn9aPDPiaGXaT7cdsrumBN7K00Ou3C36KXtZg8Qkcw>
 <xmx:-UNLXl4A6RAavdbkjdnZFSp2Jwo4x64JEHr3dc0qO6XsEBP8mGyEzw>
Received: from [192.168.50.169]
 (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
 by mail.messagingengine.com (Postfix) with ESMTPA id EBF8B3060C28;
 Mon, 17 Feb 2020 20:55:03 -0500 (EST)
Subject: Re: [RFC PATCH 10/34] ASoC: sun8i-codec: Advertise only
 hardware-supported rates
To: Mark Brown <broonie@kernel.org>
References: <20200217064250.15516-1-samuel@sholland.org>
 <20200217064250.15516-11-samuel@sholland.org>
 <20200217153023.GL9304@sirena.org.uk>
From: Samuel Holland <samuel@sholland.org>
Message-ID: <810f4889-d3ad-3b26-201c-0a237222c06c@sholland.org>
Date: Mon, 17 Feb 2020 19:55:03 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200217153023.GL9304@sirena.org.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, Vasily Khoruzhick <anarsoul@gmail.com>,
 Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org
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

On 2/17/20 9:30 AM, Mark Brown wrote:
> On Mon, Feb 17, 2020 at 12:42:26AM -0600, Samuel Holland wrote:
>> The hardware does not support 64kHz, 88.2kHz, or 176.4kHz sample rates,
>> so the driver should not advertise them. The hardware can handle two
>> additional non-standard sample rates: 12kHz and 24kHz, so declare
>> support for them via SNDRV_PCM_RATE_KNOT.
>>
>> Cc: stable@kernel.org
>> Fixes: 36c684936fae ("ASoC: Add sun8i digital audio codec")
>> Fixes: eda85d1fee05 ("ASoC: sun8i-codec: Add ADC support for a33")
>> Signed-off-by: Samuel Holland <samuel@sholland.org>
> 
> The new sample rates are new functionality, they are definitely not
> stable material.   For the sample rates you are removing do we
> understand why they were added - do they work for people, are they
> perhaps supported for some users and not others for example?

I do not know why they were added, but the sample rates I removed do not work
today, for anyone.

The sample rate must be programmed into the hardware, and the removed sample
rates do not map to one of the possible register values, so
sun8i_codec_get_hw_rate(), and thus hw_params, will return -EINVAL if one of
them is used.
