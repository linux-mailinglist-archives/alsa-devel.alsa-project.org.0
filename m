Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D28C792EA0
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Sep 2023 21:16:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 158F9825;
	Tue,  5 Sep 2023 21:16:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 158F9825
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693941415;
	bh=1KbKUPXG/G2Ebjt5z5wrFNajgBmUipSNJpzYBN+VQds=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qaG3nc55aeOZAt6IfF1IW7DhXtc0xLuUb+uFzXftOMZklDXhSWYCL9yZcrfUrlvnC
	 6CTnNo0MFZRU2g+xh33cOMXp9RX0gIU2kPPPlDIfxJ702TLLyTppUXUL3qwD0WqmNc
	 n25Ui/OL9C4vR1/PICXRpIDcIh6cUL2mWALpBhxk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7C2B1F80549; Tue,  5 Sep 2023 21:16:04 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 33D3EF8047D;
	Tue,  5 Sep 2023 21:16:04 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 26A73F80494; Tue,  5 Sep 2023 21:15:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7EA42F80431
	for <alsa-devel@alsa-project.org>; Tue,  5 Sep 2023 21:15:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7EA42F80431
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=Hml/1wnL
Received: from [192.168.1.90] (unknown [81.18.92.207])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id B246866071F8;
	Tue,  5 Sep 2023 20:15:49 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1693941350;
	bh=1KbKUPXG/G2Ebjt5z5wrFNajgBmUipSNJpzYBN+VQds=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Hml/1wnL4PtSAqvy0A46oLOoGvX9TCHnhQHwJMiP/oshaaCdZNdK2Rm2zqW3UdMM5
	 iD3BP5vJrgNDINETNpXzi0eGD5vJApts3/7J8tJ+El6ZVkt7Zd8MY1w9S4CsIWQ9gn
	 q2V5eCsR9hR+k+cI6tiHJw3ZWW8IdML0ljS+VT2ww3pMJn4oNb73+prSvNEp5vAn8H
	 cwB/f/uw2ZdIz0yedX1RNhdIu5Sjk4v4hTdhNjgu49FiHbCJwE3xTcFeI7OHfT3WHu
	 DstzttEVG3+QLUL0L3VLFgG53joSceQKXEJAomX3g7F2tAKiMZphfZUoMJx1xNpEis
	 8x8/xndNmQ/aw==
Message-ID: <953eb242-4d52-4cdc-8f7d-71af003778c5@collabora.com>
Date: Tue, 5 Sep 2023 22:15:46 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 9/9] ASoC: cs35l41: Use devm_pm_runtime_enable()
Content-Language: en-US
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: James Schulman <james.schulman@cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Stefan Binding <sbinding@opensource.cirrus.com>,
 alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 linux-kernel@vger.kernel.org, kernel@collabora.com
References: <20230902210621.1184693-1-cristian.ciocaltea@collabora.com>
 <20230902210621.1184693-10-cristian.ciocaltea@collabora.com>
 <20230905094535.GK103419@ediswmail.ad.cirrus.com>
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <20230905094535.GK103419@ediswmail.ad.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 746A2J43NCX65L2Q4QYNXY4HORWMIY24
X-Message-ID-Hash: 746A2J43NCX65L2Q4QYNXY4HORWMIY24
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/746A2J43NCX65L2Q4QYNXY4HORWMIY24/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 9/5/23 12:45, Charles Keepax wrote:
> On Sun, Sep 03, 2023 at 12:06:21AM +0300, Cristian Ciocaltea wrote:
>> Simplify runtime PM during probe by converting pm_runtime_enable() to
>> the managed version.
>>
>> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
>> ---
>> @@ -1376,7 +1379,6 @@ void cs35l41_remove(struct cs35l41_private *cs35l41)
>>  	cancel_work_sync(&cs35l41->mdsync_up_work);
>>  
>>  	pm_runtime_get_sync(cs35l41->dev);
>> -	pm_runtime_disable(cs35l41->dev);
>>  
>>  	regmap_write(cs35l41->regmap, CS35L41_IRQ1_MASK1, 0xFFFFFFFF);
>>  	if (cs35l41->hw_cfg.bst_type == CS35L41_SHD_BOOST_PASS ||
> 
> Are we sure this is safe? The remove handler appears to be
> written to disable pm_runtime at the start presumably to stop the
> resume/suspend handler running during the remove callback.
> Whereas after this change the pm_runtime isn't disabled until
> after the remove callback has run. Does this open a window were
> we could get an erroneous pm_runtime suspend after the
> pm_runtime_put_noidle?

I've just made a test adding a 6s sleep before returning from the remove 
handler: 

[14444.894316] cs35l41 spi-VLV1776:00: Runtime resume
[14444.894469] cs35l41 spi-VLV1776:00: sleep 6s before return of cs35l41_remove()
[14448.338994] cs35l41 spi-VLV1776:00: Runtime suspend
[14451.079649] cs35l41 spi-VLV1776:00: return from cs35l41_remove()
[14451.080129] cs35l41 spi-VLV1776:00: Runtime resume
[14451.080165] cs35l41 spi-VLV1776:00: ASoC: Unregistered DAI 'cs35l41-pcm'
[14451.080181] cs35l41 spi-VLV1776:00: Runtime suspend
[14451.813639] acp5x_i2s_playcap acp5x_i2s_playcap.0: ASoC: Unregistered DAI 'acp5x_i2s_playcap.0'

As expected, suspend triggered, but a resume was issued later, before DAI
got unregistered.

I didn't notice any issues while repeating the test several times, hence 
I wonder what would be the reason to prevent getting suspend/resume events 
at this point?

Thanks,
Cristian
