Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D0DF426DF6A
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Sep 2020 17:17:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7336116AA;
	Thu, 17 Sep 2020 17:16:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7336116AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600355847;
	bh=bPYFxc2nUhlnEcR1Xw96u98jDeriVIG6jPqaEebTnYE=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UZRpFiwAEmq81u4EXhtjsXLXnHhXiFvuowK8230DnQDMW0lVYv4E6IfO88doBAlmg
	 mK9+mndXOPuS7Rkgcfk1xHQBFKrlzAEJg6YVBNmo7g/ZQSeMA+xonTeM+WVss1Mixn
	 34nrn8gVD7erEe0xobbC5wyZXY74ZoTcrKWfZ5gc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 46310F80276;
	Thu, 17 Sep 2020 17:15:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 30DBFF80134; Thu, 17 Sep 2020 17:15:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 57431F800E8
 for <alsa-devel@alsa-project.org>; Thu, 17 Sep 2020 17:15:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 57431F800E8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="BeCOCdSy"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 08HFFXRu101141;
 Thu, 17 Sep 2020 10:15:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1600355733;
 bh=zJUvUPlDG3fjTS6W6hFpNIPLT9BdATy27+PbP+vGrPs=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=BeCOCdSyBx881M4VX9eLbF/b3wotePX5ouLGLCmPnRF1IEbV4bxpZrJdGfR/FHZ7V
 wjyNgtTgNVK1fFFL2wjQSVXP87c0bIbKLNy5ogG3Gl7zGB+bUH4vonwcM91+kWfH2M
 y8V/6HIYDzMWzK74m9gaHS5hE9C9Rh+7WETtmg50=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 08HFFXSS120076;
 Thu, 17 Sep 2020 10:15:33 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 17
 Sep 2020 10:15:33 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 17 Sep 2020 10:15:33 -0500
Received: from [10.250.32.129] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 08HFFWuJ008246;
 Thu, 17 Sep 2020 10:15:32 -0500
Subject: Re: [PATCH 5/6] dt-bindings: tlv320adcx140: Add slot programming
 property
To: Mark Brown <broonie@kernel.org>
References: <20200915190606.1744-1-dmurphy@ti.com>
 <20200915190606.1744-5-dmurphy@ti.com> <20200917130236.GA2954@sirena.org.uk>
From: Dan Murphy <dmurphy@ti.com>
Message-ID: <f4a83c01-58e2-1b7a-677e-44d5bde7b175@ti.com>
Date: Thu, 17 Sep 2020 10:15:27 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200917130236.GA2954@sirena.org.uk>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, tiwai@suse.com,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 camel.guo@axis.com
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

Mark

On 9/17/20 8:02 AM, Mark Brown wrote:
> On Tue, Sep 15, 2020 at 02:06:05PM -0500, Dan Murphy wrote:
>
>> +  ti,slot-mapping:
>> +    type: boolean
>> +    description: |
>> +      Each channel can be assigned a specific TDM slot for either a left or
>> +      right channel. The left channel values are from 0-31d and the right
>> +      channel values are from 32-63d. If the right channel value is 32 then the
>> +      right channel slot will be slot 31.
>> +      The array index is sequential audio channel to be set.
>> +      [ch1, ch2, ch3, ch4, ch5, ch6, ch7, ch8]
>> +      If the channel is not to be used then the channel should be set to it's
>> +      default value.
> This is something I'd expect to be done by the machine driver rather
> than in the CODEC specific DT bindings, and apart from anything else
> everything involved in the DAI will need to agree on the mapping so this
> doesn't look like something that should be done in a device specific
> binding.

Here is the use case from our customers

Customers need the ability to not transmit on a TDM slot, since another 
device could be using the slot.
For example, the customer has an amp and dig microphone sharing one TDM 
bus. The amp uses slot 0 while dig microphone use slots 1-3.
In another example, customers use 2 dig microphones. One device 
transmits on slots 0-3, the second device transmits on slots 4-7.
In a third example, customers use 4 dig microphones. Device 1 uses Slots 
0-3, Device 2 uses Slots 4-7, Device 3 uses Slots 8-11, and Device 4 
uses Slots 12-15.

The dai-tdm-slot-num would be a good candidate to add to the sound card 
to define the slot number but it's definition is "Number of slots in 
use." So it is not really setting the needed slot.
I am not finding any good way to assign specific slots to specific channels.

I can add DAI slot numbering parameter for specific codecs.

Dan
