Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 19E6B712C3D
	for <lists+alsa-devel@lfdr.de>; Fri, 26 May 2023 20:13:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BB113200;
	Fri, 26 May 2023 20:12:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BB113200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685124781;
	bh=5Vp0v9CQLgFPufyyf5L+TVgF51WKnOgrP8cqPyMHWyw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=uo1yjrJDz+tTUa4PqbO03NNCeOcQ8WSnplqPbqPVX/6ppVag+0m9gS7s2DysNdNLg
	 YCwPU0OzFeOzfWBmVHk5BWJV5Z8GYAEBAmi1fVW6P8MXVvCtaAWO0bFCOvZo/GKKLN
	 qvNRsweLg0xAMDDR0GBtcI0IqHU+Hf3iYVi8loCU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 248D5F8026A; Fri, 26 May 2023 20:12:10 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7514FF8016A;
	Fri, 26 May 2023 20:12:10 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 48EE2F80249; Fri, 26 May 2023 20:12:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [46.235.227.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E87E7F8001F
	for <alsa-devel@alsa-project.org>; Fri, 26 May 2023 20:11:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E87E7F8001F
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=PNXyJBIa
Received: from [192.168.1.90] (unknown [188.27.34.213])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id D2CE16602338;
	Fri, 26 May 2023 19:11:52 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1685124713;
	bh=5Vp0v9CQLgFPufyyf5L+TVgF51WKnOgrP8cqPyMHWyw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=PNXyJBIaI3wNOlNxvKig3Nns9gBXhDCdLGhkEmjiFdPPoMO4CmGS3ZXP6elNmMnSM
	 FBmzApVAKsvs1x8/kOWvEXfa5KNUYMmPh/PufmYGe+VGUA9yxNsQtPsV5kC4euP6vL
	 JMMSZa5ZaG2pye7g1wfIkffFAc4gvY/ts10Zso449C/OgpFh4TZHtQdXCQL31GIcsN
	 50CnWrHV2YdS7H5H6fYSRLTBjQGpJkgnc0h+iXMQS7RXZEcgLq7R5OXFWL1S2Bcbu2
	 0GTxa09nFJwItjotmi3xjGeDYkA6ckvWew7739V2zIcjbj+PM5EeW7wvKzNXVnbPKp
	 bqB/KdMupOOuQ==
Message-ID: <3c6b67a4-4892-0057-3dfc-65ed6c7ebc37@collabora.com>
Date: Fri, 26 May 2023 21:11:49 +0300
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
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <01fd1a9f-56c7-4864-bb2b-8b004284c8cc@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: MUKIXP5XLBADE4S4G4PJNQDXIAPZWQDR
X-Message-ID-Hash: MUKIXP5XLBADE4S4G4PJNQDXIAPZWQDR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MUKIXP5XLBADE4S4G4PJNQDXIAPZWQDR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 5/24/23 16:59, Mark Brown wrote:
> On Wed, May 24, 2023 at 04:49:37PM +0300, Cristian Ciocaltea wrote:
>> On 5/24/23 13:30, Mark Brown wrote:
> 
>>> Presumably you can check the effects of changing the value?  It seems
>>> plausible that what's written in the code might be accurate and the
>>> higher values might actually change the gain but it'd be better to
>>> check.
> 
>> I haven't noticed a (measurable) change in gain when switching between
>> 10 and 11, but my testing equipment is also not that great. Will try to
>> improve the tests accuracy.
> 
> I'd expect it should be really obvious with a scope if you've got one?
> Testing with something consistent like a sine wave (eg, from
> speaker-test) should also make a 1.5dB difference noticable enough to
> check if there's at least a volume change by ear even if you can't
> specifically quantify it.

Luckily arecord & aplay provide VU meter support (via -V,
--vumeter=TYPE'), so I could easily verify this without using any
additional tools:

 Volume  |  VU meter
---------+----------
-6.0 dB  |  30-31 %
-4.5 dB  |  35-36 %
-3.0 dB  |  42-43 %
-1.5 dB  |  50-51 %
-0.0 dB  |  50-51 %

So it seems the specs are correct, and the problem is the hardware default.

Is there a better approach to handle this than extending the volume range?

Regards,
Cristian
