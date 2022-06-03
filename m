Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A55853C7FA
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Jun 2022 11:56:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 07E041832;
	Fri,  3 Jun 2022 11:55:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 07E041832
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654250191;
	bh=UwskO372PFTyrrmPHCk7777HvXb95NVFBdbAG6eNmhA=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=E0ZE/IQVz79ldtRb5X31gHbN7mq66xm+PxkHK2/Wst1teolN3PhHqGzB/wsYPgcu+
	 rGFMugVVhkuL5nUKGGZ323pJ15Ptqb9UaVC/ioNAdqYzqkFR0CK6CYxgqZfZLwrHjb
	 N5EtDYsYRTxskBghOB0stcDwNYwh/ALDQ1omAPSE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4798CF804D1;
	Fri,  3 Jun 2022 11:55:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EFFE4F804CC; Fri,  3 Jun 2022 11:55:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from smtp-relay-canonical-1.canonical.com
 (smtp-relay-canonical-1.canonical.com [185.125.188.121])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8DE5AF80124
 for <alsa-devel@alsa-project.org>; Fri,  3 Jun 2022 11:55:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8DE5AF80124
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com
 header.b="ceU8wkiw"
Received: from [10.101.195.16] (unknown [10.101.195.16])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id 1CD063FBEE; 
 Fri,  3 Jun 2022 09:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1654250126;
 bh=aYp7zmDeXZt/G1J2K5+EDJYyHuo3Iy8yi4SK4o9fkC8=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=ceU8wkiwwNHWGAqfG9Y5X8+F1o5prLbN1acovjioyW9+FnhOV/W47NP9DkZWRf7D0
 /HOVAoNyjg4HKlWkugV49eYlYHIVe+7Ig8rWY0Hmf8z4KjqjSMzuAufBlCUoLbKbPD
 3MviCRUI4I2VXYuFKAa86o5Mv5Sr5MAn4Sa+BwE6CTWwXvuctLuE+dgsdSKl+SBjAy
 /JnLoAl4+SIlXfeJuu1x5OlPK75isCuK6j6oPzNnSy1f76KFCGI9GhCwkVsqTbEkkI
 SsUatBQo6VH3UboVsGF2EEBm2+Nft3BhmNnhiTIsiZYb7w/X36IejJNAFmnPL7JZs+
 NPPoJxaWZYzkw==
Message-ID: <cd69d7e3-6a54-7438-b126-5962a8951ca3@canonical.com>
Date: Fri, 3 Jun 2022 17:55:18 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 1/2] ASoC: nau8822: Add operation for internal PLL off and
 on
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
References: <20220530040151.95221-1-hui.wang@canonical.com>
 <20220530040151.95221-2-hui.wang@canonical.com>
 <c492a0f0-779b-6438-6245-3d6f159b48ef@gmail.com>
 <817ab950-db61-9d48-f51f-41009c8bd23d@canonical.com>
 <YpiR5ov8X/5yQACT@sirena.org.uk>
From: Hui Wang <hui.wang@canonical.com>
In-Reply-To: <YpiR5ov8X/5yQACT@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: wtli@nuvoton.com, ctlin0@nuvoton.com, alsa-devel@alsa-project.org,
 kchsu0@nuvoton.com, David Lin <ctlin0.linux@gmail.com>
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


On 6/2/22 18:33, Mark Brown wrote:
> On Thu, Jun 02, 2022 at 05:57:43PM +0800, Hui Wang wrote:
>> On 6/2/22 17:24, David Lin wrote:
>>> On 2022/5/30 下午 12:01, Hui Wang wrote:
>>> So when the playback/recording starts, the PLL parameters from Reg
>>> 0x25~0x27 will be always set before Reg 0x1[5] power enable bit(PLLEN).
>>> When the playback/recording stops, the PLLEN will be disabled.
>> Thanks for your comment. But it is weird, it doesn't work like you said,
>> probably need specific route setting in the machine driver level?
> Is this triggering due to reprogramming the PLL for one direction
> while the other is already active (eg, starting a capture during
> a playba

Yes, it is. With the current machine driver of fsl-asoc-card.c, if 
starting a capture during a playback or starting a playback during a 
capture, the codec driver will reprogram PLL parameters while PLL is on.

And in another case, if the  snd_soc_dai_set_pll() is called in the 
card->set_bias_level() instead of card_hw_params(), the PLL will keep 
being off since check_mclk_select_pll() always returns false.

Thanks.




