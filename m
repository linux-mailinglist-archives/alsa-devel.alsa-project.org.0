Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9204368EEF8
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Feb 2023 13:28:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E4BF1827;
	Wed,  8 Feb 2023 13:27:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E4BF1827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675859284;
	bh=iV+AM+Qjlq6gPk6voNgE7TgfODcmLF9iwWU3tk0to9M=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=BiFK7nPtzOd8ro3QwzzQ7NYKdpzqPAE1tZK1zS2KgfV1TZNhDRjn2atFgzyFpx1f9
	 bR4oIrhP4tnNGH1kTPtvmNsAXu4kgvGOxfVNAzEe+MROUEgQjIEugwki/OqQxM2AcH
	 HobZdTBiRhU8CYYMxS1Ky4xmd3uGmFEkFliaQVDw=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 20469F8012B;
	Wed,  8 Feb 2023 13:27:13 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 75E17F80152; Wed,  8 Feb 2023 13:27:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [46.235.227.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CE1F4F800AA
	for <alsa-devel@alsa-project.org>; Wed,  8 Feb 2023 13:27:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CE1F4F800AA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=bH45ycgg
Received: from [192.168.86.246]
 (cpc87451-finc19-2-0-cust61.4-2.cable.virginm.net [82.11.51.62])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: tanureal)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 4F900660035A;
	Wed,  8 Feb 2023 12:27:04 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1675859224;
	bh=iV+AM+Qjlq6gPk6voNgE7TgfODcmLF9iwWU3tk0to9M=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=bH45ycggeKNoWexvNDCxbui6Q4EaRmM0KdDBmXGYoiSZQjDxRvRSfwlVre6BLSado
	 vGt8IuvLBbd8YVgKQvjv9234pZMvHSlXTUHRKhOvQPybW89bvNzxmWcVfkETYjYBAZ
	 qvTIicaOUB+fTDYfM2lNtegpeQYuNj6MZvlwilHDO87K0TDvgaV+H7T+AEpBpCY3U0
	 unkqctBUAX8HOoon2BU9onW+EhlRSlijM01rMrDAU5ynyuLx9BxwEwKWWRvtdOFK8L
	 kMQW6Dvj3rv+ZWOn6w7lXiGbx8oyS9/22mnBW9ntoa3KREZg5YS3mEDil/8V6H9mbm
	 wmJpzuzFN2QNQ==
Message-ID: <9d3181ff-5c08-697d-43fa-65bdc9544a26@collabora.com>
Date: Wed, 8 Feb 2023 12:27:02 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
From: lucas.tanure@collabora.com
To: Charles Keepax <ckeepax@opensource.cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
 kernel@collabora.com
Subject: Re: [PATCH v2 3/5] ALSA: cs35l41: Add shared boost feature
References: <20230207162526.1024286-1-lucas.tanure@collabora.com>
 <20230207162526.1024286-4-lucas.tanure@collabora.com>
 <20230208100927.GF36097@ediswmail.ad.cirrus.com>
In-Reply-To: <20230208100927.GF36097@ediswmail.ad.cirrus.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Message-ID-Hash: VCOIFM2DV6ORGHMXKD6GAROUR7TFRCDX
X-Message-ID-Hash: VCOIFM2DV6ORGHMXKD6GAROUR7TFRCDX
X-MailFrom: lucas.tanure@collabora.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VCOIFM2DV6ORGHMXKD6GAROUR7TFRCDX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 2/8/23 10:09 AM, Charles Keepax <ckeepax@opensource.cirrus.com> wrote:
> On Tue, Feb 07, 2023 at 04:25:24PM +0000, Lucas Tanure wrote:
> > Shared boost allows two amplifiers to share a single boost
> > circuit by communicating on the MDSYNC bus.
> > The passive amplifier does not control the boost and receives
> > data from the active amplifier.
> >
> > Shared Boost is not supported in HDA Systems.
> > Based on David Rhodes shared boost patches.
> >
> > Signed-off-by: Lucas Tanure <lucas.tanure@collabora.com>
> > ---
> > -int cs35l41_global_enable(struct regmap *regmap, enum cs35l41_boost_type b_type, int enable)
> > +int cs35l41_global_enable(struct regmap *regmap, enum cs35l41_boost_type b_type, int enable,
> > +			  struct completion *pll_lock)
> >   {
> >   	int ret;
> > +	unsigned int gpio1;
> >   
> >   	switch (b_type) {
> > +	case CS35L41_SHD_BOOST_ACTV:
> > +	case CS35L41_SHD_BOOST_PASS:
> > +		regmap_update_bits(regmap, CS35L41_PWR_CTRL3, CS35L41_SYNC_EN_MASK, 0);
> > +
> > +		gpio1 = enable ? CS35L41_GPIO1_MDSYNC : CS35L41_GPIO1_HIZ;
> > +		regmap_update_bits(regmap, CS35L41_GPIO_PAD_CONTROL, CS35L41_GPIO1_CTRL_MASK,
> > +				   gpio1 << CS35L41_GPIO1_CTRL_SHIFT);
> > +
> > +		ret = regmap_update_bits(regmap, CS35L41_PWR_CTRL1, CS35L41_GLOBAL_EN_MASK,
> > +					 enable << CS35L41_GLOBAL_EN_SHIFT);
> > +		usleep_range(3000, 3100);
> > +		if (!enable)
> > +			break;
> > +
> > +		if (!pll_lock)
> > +			return -EINVAL;
> > +
> > +		ret = wait_for_completion_timeout(pll_lock, msecs_to_jiffies(1000));
> > +		if (ret == 0) {
> > +			ret = -ETIMEDOUT;
> > +		} else {
> > +			regmap_update_bits(regmap, CS35L41_PWR_CTRL3, CS35L41_SYNC_EN_MASK, 0);
Its wrong here. Should be enabling it not disable.
I will send v3. 

> > +			regmap_update_bits(regmap, CS35L41_PWR_CTRL1, CS35L41_GLOBAL_EN_MASK,
> > +								 0 << CS35L41_GLOBAL_EN_SHIFT);
> > +			usleep_range(3000, 3100);
> > +			regmap_update_bits(regmap, CS35L41_PWR_CTRL1, CS35L41_GLOBAL_EN_MASK,
> > +								 1 << CS35L41_GLOBAL_EN_SHIFT);
> > +			usleep_range(3000, 3100);
> > +		}
> 
> This approach also makes me nervous, I was somewhat imagining the
> usage of regmap_multi_reg_write for this sequence was because it
> was very important that no other register writes could interleave
> in between these writes. But I don't know, so it could also have
> just been a random design choice. So we probably need David to
> confirm if that was the reason for the original code here.
> 
> Thanks,
> Charles
> 

