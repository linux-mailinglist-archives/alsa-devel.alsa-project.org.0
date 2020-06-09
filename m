Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 21FDF1F4701
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Jun 2020 21:22:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AEE151671;
	Tue,  9 Jun 2020 21:21:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AEE151671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591730554;
	bh=7AyHFdjonTrFn2j/MwHO0y9u2frYNk7ouqrWlBP4c1c=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Zog0/OVWOFBCFG1oT0Yacai6PmFHu93NV5poaFl4+YFh8Kap7cyCbYuE5fmlO2IBN
	 6PcXMZUn3zCGqYoDOWnvRT65SgGQtmVIM9St0ajQ7HJIqlBhpu5x1ZlQEfOFgJGpYw
	 LyM45HEGM5H1AFgMAnta+SOuiL79IM/vsix9bGRo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4037DF80088;
	Tue,  9 Jun 2020 21:20:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D958AF8028C; Tue,  9 Jun 2020 21:20:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODY_76,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 77780F80124
 for <alsa-devel@alsa-project.org>; Tue,  9 Jun 2020 21:20:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 77780F80124
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="f+J4vZsc"
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 059JKX1d088349;
 Tue, 9 Jun 2020 14:20:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1591730433;
 bh=ZPzxZJaQ2aInc4QHSdxUXpf6Q0oMRP3/URsi//CF6L8=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=f+J4vZscyfmvcnEPlE8ig6eRWF1Mcldf0lezx2j9IV/V5OBx3Ljdp9TGELuebGnHz
 dCAWGlw5iYb3/Ra5aHxyNdTzGkvhcgzq0KfB2sPYWD1NCuKxy2wuXY/pNVKQLmF0Rk
 Vz7SQKuam4lgPahMqc0JKaErMDosf5dxuZDlBNgw=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 059JKXDc063661
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 9 Jun 2020 14:20:33 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 9 Jun
 2020 14:20:33 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 9 Jun 2020 14:20:33 -0500
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 059JKU5W083640;
 Tue, 9 Jun 2020 14:20:31 -0500
Subject: Re: [RFC PATCH 1/2] dt-bindings: tas2562: Add firmware support for
 tas2563
To: Mark Brown <broonie@kernel.org>
References: <20200609172841.22541-1-dmurphy@ti.com>
 <20200609172841.22541-2-dmurphy@ti.com> <20200609173143.GN4583@sirena.org.uk>
 <bb7cff87-f814-1b37-c9eb-e68919e3c077@ti.com>
 <20200609175852.GQ4583@sirena.org.uk>
 <414a2d73-6d09-1e76-59c8-4943c0e8f720@ti.com>
 <20200609184734.GS4583@sirena.org.uk>
From: Dan Murphy <dmurphy@ti.com>
Message-ID: <014b85b5-677b-569a-4eb2-74526d3f00bc@ti.com>
Date: Tue, 9 Jun 2020 14:20:29 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200609184734.GS4583@sirena.org.uk>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: robh@kernel.org, alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, tiwai@suse.com, lgirdwood@gmail.com
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

On 6/9/20 1:47 PM, Mark Brown wrote:
> On Tue, Jun 09, 2020 at 01:06:50PM -0500, Dan Murphy wrote:
>
>> I could make a default as you suggested to include i2c address and bus in
>> the name.  But the TAS2563 does not need the firmware to operate and the
>> 2562 does not have a DSP.
> That's fine, the driver can just use the compatible string to check this
> and not offer any of the DSP related stuff (it should do this regardless
> of the method used here).  I'm guessing the regmap configs should also
> be different.

The driver does check the compatible to determine if DSP loading is 
available for the device.

The driver also checks to see if the firmware file is declared in the DT.

So it has to pass 2 checks to even load and parse the firmware to 
present the controls for the programs and configs.


>> What if there was an ALSA control instead that passed in the firmware name
>> from the user space instead of using the DT?
>> Then the control can load and parse the firmware and wait for the user to
>> select the program.
>> This would solve a user from having ot update the DT to use a firmware.
> That's really not very idiomatic for how Linux does stuff and seems to
> pretty much guarantee issues with hotplugging controls and ordering -
> you'd need special userspace to start up even if it was just a really
> simple DSP config doing only speaker correction or something.  I'm not
> sure what the advantage would be - what problem is this solving over
> static names?

IMO having a static name is the problem. It is an inflexible design.  
Besides the firmware-name property seems to be used in other drivers to 
declare firmwares for the boards.

But if no one is complaining or submitting patches within the codecs to 
be more flexible with firmware then I can just hard code the name like 
other drivers do.

Dan

