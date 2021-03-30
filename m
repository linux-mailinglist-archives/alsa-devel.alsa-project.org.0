Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8860F34EF61
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Mar 2021 19:25:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 249E71675;
	Tue, 30 Mar 2021 19:24:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 249E71675
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617125128;
	bh=vEG71IZo4thI+qUBenkHb6hVj6LBK3N7CJWtjcNTLXs=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZnAZTFC7j7oFeL3GJA1HiiG0fCQSepWPJUeXyB6kOBIz+sBHSb8iEGGiMwvS7/9fW
	 QvyAIJWOFnpZ9+nYxTEyJ3eY/XDIyzZPSBY8P0u5R1lrT8IXPkiL7DZ95Ho77sX6by
	 rnDP4d9ApAoIAuNBxRgnp334C+kioFxUrSxvh3TA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7D6FDF8026B;
	Tue, 30 Mar 2021 19:24:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6D9DFF80240; Tue, 30 Mar 2021 19:23:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2819AF80141
 for <alsa-devel@alsa-project.org>; Tue, 30 Mar 2021 19:23:52 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 0FC40A003F;
 Tue, 30 Mar 2021 19:23:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 0FC40A003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1617125032; bh=rDdyaE1z6iA7X4zB+eVlnCo3h0Hzjbw7JMoAtQL89ic=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=YHH9dM80kxAR9uzkJWukofXotowNW9yqwNRu27IO4k278m48nEX2iXPpWbpq3ibrP
 AvbEI/M6Wdlc5+otL2qvGn8Qfprqkb5brvqrtKV0PN9niUqv208le0Rj0ZYBEyspkV
 oZprZzv5CEOOId8Ejqr1MciA9uDNUnGw4voWKGjg=
Received: from p1gen2.localdomain (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Tue, 30 Mar 2021 19:23:40 +0200 (CEST)
Subject: Re: [PATCH v2 2/3] ASoC: rt715: remove kcontrols which no longer be
 used
To: Mark Brown <broonie@kernel.org>, Jack Yu <jack.yu@realtek.com>
References: <5c314f5512654aca9fff0195f77264de@realtek.com>
 <20210330170915.GH4976@sirena.org.uk>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <cb29ed5c-44b1-c1ce-b704-8b93ac9f7a43@perex.cz>
Date: Tue, 30 Mar 2021 19:23:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210330170915.GH4976@sirena.org.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Oder Chiou <oder_chiou@realtek.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "lars@metafoo.de" <lars@metafoo.de>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 =?UTF-8?B?RGVyZWsgW+aWueW+t+e+qV0=?= <derek.fang@realtek.com>,
 "Flove\(HsinFu\)" <flove@realtek.com>,
 =?UTF-8?B?U2h1bWluZyBb6IyD5pu46YqYXQ==?= <shumingf@realtek.com>,
 "bard.liao@intel.com" <bard.liao@intel.com>,
 "pierre-louis.bossart@intel.com" <pierre-louis.bossart@intel.com>
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

Dne 30. 03. 21 v 19:09 Mark Brown napsal(a):
> On Mon, Mar 29, 2021 at 06:54:00AM +0000, Jack Yu wrote:
>> Using new kcontrols "Capture Switch" and "Capture Volume" instead,
>> remove kcontrols which no longer be used.
> 
> Is this going to disrupt any UCM profiles?

Yes (the rt715 prefix is from the SOF driver):

# RT715 specific volume control settings

BootSequence [
	cset "name='rt715 DMIC3 Boost' 2"
	cset "name='rt715 DMIC4 Boost' 2"
	cset "name='rt715 ADC 24 Mux' 3"
	cset "name='rt715 ADC 25 Mux' 4"
	cset "name='rt715 ADC 27 Capture Switch' 1"
	cset "name='rt715 ADC 07 Capture Switch' 1"
	cset "name='rt715 ADC 07 Capture Volume' 58"
]

I'm actually working on a pure user-space solution to allow remapping at the
control API level. Those universal codecs can be used for multiple stereo
inputs or multiple channel inputs. The codec driver does not know the target
mapping without the additional hints - DMI / machine checks.

				Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
