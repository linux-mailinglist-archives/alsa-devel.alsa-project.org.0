Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E088E1666AB
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Feb 2020 19:53:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 880B416ED;
	Thu, 20 Feb 2020 19:53:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 880B416ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582224832;
	bh=NmEOd6JwJ/RKzdPcYqh/WX+b4gyijWKV1qx9a5+C1JQ=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IG6lDjs3rGfVNzR500duteU6+dklWHCGenSZyWY0oOoyfZibv+3qWYq+7Bjxbr/S7
	 QHoSaRPTWFHkGpRfhDSwTjFFWzM20uWG7hMz2wJveVJua5D07TO7e24MmUTTg3lxtF
	 f/3mlDgDYjzYRHJbCCsQ8EXIgAWjWyI2rtZ5QaA4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BC3F9F8014C;
	Thu, 20 Feb 2020 19:52:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A66EFF8014A; Thu, 20 Feb 2020 19:52:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EAB1CF80101
 for <alsa-devel@alsa-project.org>; Thu, 20 Feb 2020 19:52:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EAB1CF80101
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="AXhQLFrn"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01KIq3Th050543;
 Thu, 20 Feb 2020 12:52:03 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1582224723;
 bh=CG0tyGJbtv0I8DXr8bqwQT8uM4lDoibn5681XyzQ1P4=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=AXhQLFrnGcIXakvPGLOqv/zrVizRfWyVaWHSwtTnw1vRRqMHfJj6v0EfAkRdCmcDb
 TDrSXT90v12e/lWcpn5FGC5oWUh9WTsI21mDLoulRs+7xZoo/toBK8+H+kN8E7BDJo
 vrrl3VFgJAEff67Knfr956Kpt8zpOSyWBKB3VuIU=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 01KIq2ij058863
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 20 Feb 2020 12:52:03 -0600
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 20
 Feb 2020 12:52:02 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 20 Feb 2020 12:52:02 -0600
Received: from [128.247.59.107] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01KIq1DS102364;
 Thu, 20 Feb 2020 12:52:01 -0600
Subject: Re: [PATCH] ASoC: tas2562: Add support for digital volume control
To: Mark Brown <broonie@kernel.org>
References: <20200220172721.10547-1-dmurphy@ti.com>
 <20200220184507.GF3926@sirena.org.uk>
From: Dan Murphy <dmurphy@ti.com>
Message-ID: <de0e8a5b-8c2a-ee04-856f-f0d678a3c66b@ti.com>
Date: Thu, 20 Feb 2020 12:46:57 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200220184507.GF3926@sirena.org.uk>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org, tiwai@suse.com,
 lgirdwood@gmail.com
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

On 2/20/20 12:45 PM, Mark Brown wrote:
> On Thu, Feb 20, 2020 at 11:27:21AM -0600, Dan Murphy wrote:
>
>> +	/* Set the Digital volume to -110dB */
>> +	ret = snd_soc_component_write(component, TAS2562_DVC_CFG4, 0x00);
>> +	if (ret)
>> +		return ret;
>> +	ret = snd_soc_component_write(component, TAS2562_DVC_CFG3, 0x00);
>> +	if (ret)
>> +		return ret;
>> +	ret = snd_soc_component_write(component, TAS2562_DVC_CFG2, 0x0d);
>> +	if (ret)
>> +		return ret;
>> +	ret = snd_soc_component_write(component, TAS2562_DVC_CFG1, 0x43);
>> +	if (ret)
>> +		return ret;
> Is there a reason not to use the chip default here?  Otherwise this
> looks good.

Chip default is set to 0dB full blast+ 0x40400000.  This sets the volume 
to -110dB.

I have the values backwards.  CFG4 should b 0x43 and CFG3 should be 0x0d 
and CFG1&2 should be 0.

I will resend v2 with this fixed.

Dan

