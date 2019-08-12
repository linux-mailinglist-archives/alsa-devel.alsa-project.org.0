Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8271789D4A
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Aug 2019 13:48:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 07ECA1665;
	Mon, 12 Aug 2019 13:47:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 07ECA1665
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565610495;
	bh=z8t0KxNEXT4T4K1d+LI74fV8CcZzmoetYjk5MIgwayk=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VEM9aObfJZ2x88i6xAEB5XueJlee/y7FlyxeMfI6wilZtUyt6EmMOpEiTAeP/WGvX
	 LLqQPODGIDScvVM9cm4ZDicidUTAlrSBhAhA/9BW9ETaJIHOcUfSiFNjUMOfPrGRVw
	 YWO55q6RbEzqUuw0Tl9NRqj27+AlChleJjlpy0w8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 442CFF80214;
	Mon, 12 Aug 2019 13:46:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D99CFF80213; Mon, 12 Aug 2019 13:46:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODY_78,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 98C3AF8015B
 for <alsa-devel@alsa-project.org>; Mon, 12 Aug 2019 13:46:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 98C3AF8015B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="KyynVd06"
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7CBkNhi047914;
 Mon, 12 Aug 2019 06:46:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1565610383;
 bh=h/d/WWC7YKBeIMcCeXTTk1RmiVUY7HJvgB/uwOaBLME=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=KyynVd06A7QUbnLgxOBnNAdR8eCNdijc507SKSowXCNwjOYy+nb9AP7tEw0N2R27T
 LnOD0Gnbjcx7QgWAL+JcuT1KSTC0ckLCCKG4Lov7BHP3hzl3uXhRR3tbTT7qMOMCx5
 CWNb1Z96kYtpUKaD0/I6cK+upWH3fUrpSNJJwtOA=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7CBkN2S103752
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 12 Aug 2019 06:46:23 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 12
 Aug 2019 06:46:22 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 12 Aug 2019 06:46:22 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7CBkLxl097633;
 Mon, 12 Aug 2019 06:46:21 -0500
To: Mark Brown <broonie@kernel.org>
References: <20190812095304.19030-1-peter.ujfalusi@ti.com>
 <20190812111332.GH4592@sirena.co.uk>
From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Message-ID: <20154773-1cf8-4e2e-a248-f3dfb29a5024@ti.com>
Date: Mon, 12 Aug 2019 14:46:33 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190812111332.GH4592@sirena.co.uk>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com, jsarha@ti.com,
 misael.lopez@ti.com
Subject: Re: [alsa-devel] [PATCH] ASoC: ti: davinci-mcasp: Protect hw_params
 callback against race
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
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



On 12/08/2019 14.13, Mark Brown wrote:
> On Mon, Aug 12, 2019 at 12:53:04PM +0300, Peter Ujfalusi wrote:
>> If the playback and capture of the same McASP is connected to different
>> dai link (non duplex PCM links, like with pcm3168a codec) then there is
>> a high probability of race between the two direction leaving McASP in a
>> confused state.
>>
>> Protect the hw_params() with a mutex to make sure that this is not
>> happening.
> =

> This feels like something we might want to consider moving up to the
> core, though not every device is going to need it I guess it should be
> safe to do there.

soc_pcm_hw_params() is already protected by
mutex_lock_nested(&rtd->pcm_mutex, rtd->pcm_subclass);

which (I think) gives protection for dai_links when they support both
playback and capture.

I faced with the concurrency when interfacing with pcm3168a codec, which
require two dai_links. One for playback and one for capture so they
don't share the same snd_soc_pcm_runtime.

I believe moving the
mutex_lock_nested(&rtd->pcm_mutex, rtd->pcm_subclass);

to card level could substitute (new mutex on the card for pcm operations
probably) the need to handle this in drivers.

We would need to change soc-core/pcm/compress for this.

- P=E9ter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
