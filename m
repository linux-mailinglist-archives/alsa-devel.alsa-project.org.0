Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 62097157E0B
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Feb 2020 16:01:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B88881676;
	Mon, 10 Feb 2020 16:00:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B88881676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581346888;
	bh=I6796rBByKIDCiB4vWuhXwRrmcgY4n6H+sH1tSne2a8=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fCMt3aB3atAFzFCy5zjsZXVrx5umEMl1hSXacKHID89OdZVD2VmAYjJtJyaUGrRkj
	 aDZ8T4xA+NOT9dceTLzocnzujXotCLquejDajwSJo0naPIUsICA2ZhLPEIH3gJ23Ba
	 SWgiQCswpjesqR1eKMZDr93ir3kOx1xu45SXn27o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D1079F800E7;
	Mon, 10 Feb 2020 15:59:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 440DFF80157; Mon, 10 Feb 2020 15:59:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
 PRX_BODY_78,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9A435F800FD
 for <alsa-devel@alsa-project.org>; Mon, 10 Feb 2020 15:59:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9A435F800FD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="ZSIBgd93"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01AExScZ022002;
 Mon, 10 Feb 2020 08:59:28 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1581346768;
 bh=937sYJ9HmKfZfaKbpgbA3zfFxgMIg4xMgNvoLDr0WkI=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=ZSIBgd936helc2ZRY/aUvTZnhjE5FMx4I/zLDg+8j9shHxAKwS90N6JVLJvsvpMCR
 MdQ7FjW6dn7+cre6bnB6dDApMJza1ghNZTmAKRiMI3tPveSEFILYcAVvepb/SPDt4Z
 KFZ/n33TjyOSdjocsoSO7DyTslbUFajAfgnBy84k=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 01AExSYP042330
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 10 Feb 2020 08:59:28 -0600
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 10
 Feb 2020 08:59:28 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 10 Feb 2020 08:59:28 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01AExPP7003090;
 Mon, 10 Feb 2020 08:59:26 -0600
To: Mark Brown <broonie@kernel.org>
References: <20200210140423.10232-1-peter.ujfalusi@ti.com>
 <s5hmu9qfrq7.wl-tiwai@suse.de> <15c7df10-cf9f-109c-3cbf-e73af7f4f66a@ti.com>
 <20200210143717.GO7685@sirena.org.uk>
From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Message-ID: <8b48b17d-3751-c027-7b66-fbea3b5a412f@ti.com>
Date: Mon, 10 Feb 2020 16:59:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200210143717.GO7685@sirena.org.uk>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: alsa-devel@alsa-project.org, lars@metafoo.de, Takashi Iwai <tiwai@suse.de>,
 linux-kernel@vger.kernel.org, tiwai@suse.com, lgirdwood@gmail.com,
 vkoul@kernel.org
Subject: Re: [alsa-devel] [PATCH] ASoC: dmaengine_pcm: Consider DMA cache
 caused delay in pointer callback
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



On 10/02/2020 16.37, Mark Brown wrote:
> On Mon, Feb 10, 2020 at 04:28:44PM +0200, Peter Ujfalusi wrote:
>> On 10/02/2020 16.21, Takashi Iwai wrote:
> =

>>>>  	delay +=3D codec_delay;
>>>>  =

>>>> -	runtime->delay =3D delay;
>>>> +	runtime->delay +=3D delay;
> =

>>> Is it correct?
>>> delay already takes runtime->delay as its basis, so it'll result in a
>>> double.
> =

>> The delay here is coming from the DAI and the codec.
>> The runtime->delay hold the PCM (DMA) caused delay.
> =

> I think Takashi's point here (and a query I have) is that we end up with
> =

> 	delay =3D runtime->delay;
> 	delay +=3D stuff;
> 	runtime->delay +=3D delay;
> =

> which is equivalent to
> =

> 	runtime->delay =3D (runtime->delay * 2) + stuff;
> =

> and that's a bit surprising.

I see, I have missed what
9fb4c2bf130b ASoC: soc-pcm: Use delay set in component pointer function

did.
the soc-pcm part of the patch can be dropped then.

- P=E9ter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
