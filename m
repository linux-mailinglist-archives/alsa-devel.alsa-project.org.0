Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 71259BDCBC
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Sep 2019 13:09:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EBEF516DF;
	Wed, 25 Sep 2019 13:08:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EBEF516DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1569409762;
	bh=apYmAo2eu4kT0K9w1sdHqRYIpDte0j0MlOSmACddW6k=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nAMkmscn1sercPAsK+eIcD0n6dhO3TdZE8gdhzHyM3LLyRM+wRhz0rtcVi2gfayzg
	 2J+JxmKq2FK2Ggc8FE6oO+unyOwmxY+lhEJSF1FXG66XbcCryzrSho+QyhFVOjt5iQ
	 +LmnE7TVV1qjGj6ZyvXIthIljU5SkpMAJElaHqPY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 52E49F805DF;
	Wed, 25 Sep 2019 13:06:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 91F1AF8059F; Wed, 25 Sep 2019 13:06:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODY_76,PRX_BODY_78,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 45FD5F804CA
 for <alsa-devel@alsa-project.org>; Wed, 25 Sep 2019 13:06:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 45FD5F804CA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="ToKx1qCA"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8PB6iTa070297;
 Wed, 25 Sep 2019 06:06:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1569409604;
 bh=/wto6EFcvpzLaNNgVf9WMQqIlPB6MJ6rHmtHTzBh65A=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=ToKx1qCAQyU26ZjTZ9naRI+FBC2FuhRF5LGT9m4sJhyY/dFPkvmmAS6QMlRPWlx55
 6JBEnRoOiOIXU6+6FoIqfIEA+8jtazN+lI1CFW34/O7jrsqrtc5ab+1/5T7+4UcMJ0
 W2sqpEdqOPaaXPuArf12V7ZL8XgFA9UGDRuKevsk=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8PB6iKY046709;
 Wed, 25 Sep 2019 06:06:44 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 25
 Sep 2019 06:06:37 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 25 Sep 2019 06:06:37 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8PB6fiY056655;
 Wed, 25 Sep 2019 06:06:42 -0500
To: Mark Brown <broonie@kernel.org>
References: <20190924114146.8116-1-peter.ujfalusi@ti.com>
 <20190924194012.GE2036@sirena.org.uk>
From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Message-ID: <ae65b340-6949-0535-1053-a0f1f953c877@ti.com>
Date: Wed, 25 Sep 2019 14:07:23 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190924194012.GE2036@sirena.org.uk>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 kuninori.morimoto.gx@renesas.com
Subject: Re: [alsa-devel] [RFC] ASoC: soc-pcm: Use different sequence for
 start/stop trigger
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



On 24/09/2019 22.40, Mark Brown wrote:
> On Tue, Sep 24, 2019 at 02:41:46PM +0300, Peter Ujfalusi wrote:
> =

>> It can only fixed by using different sequence within trigger for 'stop' =
and
>> 'start':
>> case SNDRV_PCM_TRIGGER_START:
>> case SNDRV_PCM_TRIGGER_RESUME:
>> case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
>> 	Start DMA first followed by CPU DAI (currently used sequence)
>>
>> case SNDRV_PCM_TRIGGER_STOP:
>> case SNDRV_PCM_TRIGGER_SUSPEND:
>> case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
>> 	Stop CPU DAI first followed by DMA
> =

> Yeah, this makes sense I think.
> =

>> If I think about the issue, I'm not sure why it was not noticed before a=
s the
>> behavior makes sense:
>> we stop the DMA first then we stop the CPU DAI. If between the DMA stop =
and DAI
>> stop we would need a sample in the DAI (which is still running) then for=
 sure we
>> will underrun in the HW (or overrun in case of capture).
> =

> There are a bunch of systems where the trigger only actually does
> anything with one or the other of the IPs and the startup for the
> other is handled by a hardware signal so the ordering doesn't
> really matter for them.

If they use generic dmaengine pcm then their DMA is going to be
stopped/paused in trigger. Not sure how they can handle in DAI when the
DMA is stopped.

>> Not sure if anyone else have seen such underrun/overrun when stopping a =
stream,
>> but the fact that I have seen it with both UDMA+PDMA and EDMA on differe=
nt
>> platforms makes me wonder if the issue can be seen on other platforms as=
 well.
> =

> I'd guess so, especially with smaller buffers.

I have sent the non RFC patch with fix to the not initialized ret and
updated commit message to document the trigger sequences for start and
stop type of events.


- P=E9ter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
