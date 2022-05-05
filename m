Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 43EAB51C374
	for <lists+alsa-devel@lfdr.de>; Thu,  5 May 2022 17:08:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C408117DD;
	Thu,  5 May 2022 17:07:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C408117DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651763318;
	bh=ofOX12TGojhwMN/6KVsscVM33pqSCNg+r9yu6HGPdus=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pgwrRQdRLU/Hzl96kth1omYWMgKBHqUEcn5k5cYtfZyxseqYyihQ7PDRN4Nr66NSI
	 nm0FszYr5sNN+/FuIDZTardoaTu5YjXfYYLjf695f+au3KGuF1Cie8sbpM3nEa8pwm
	 gDXY38GzOdbxvWx7jKbD6dC9u/KPAZA55HIz7Zaw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 40C5AF8049C;
	Thu,  5 May 2022 17:07:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 33392F8016B; Thu,  5 May 2022 17:07:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 88FE1F800D3
 for <alsa-devel@alsa-project.org>; Thu,  5 May 2022 17:07:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 88FE1F800D3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com
 header.b="E6n5+P2T"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1651763253; x=1683299253;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=ofOX12TGojhwMN/6KVsscVM33pqSCNg+r9yu6HGPdus=;
 b=E6n5+P2TYgD/FlPpm8pXqrSCt1S2DeaoFwJRZjEislZdMMYcjVM6kfQO
 E1fFsPgMb6RDYU7K/S3fLF8Su4rvUWmMjUccbss9u+Ii/2BsxZdtIFYFW
 TSgPSX5PqDLgFI7OwW/oLWYnCZAu7cbczHbsrXjty60PLmUe4vTYXNqlJ
 J0Ho36SAPK/fMd+d69dxzqBvyYNonskEy8w4j/sXU3/CHYjZIKxhuQZ+h
 x7207+tWeLZ1hpHnMNd2oiDKRwDyvuKPFNoU6D+LFxPpPgnBP5ULp9x3O
 1oLWnfKqckjmbQz3loa9x5zVGHr9G5PSH+4OgJTFnxKnveQHQDvnc+BI+ g==;
X-IronPort-AV: E=Sophos;i="5.91,201,1647327600"; d="scan'208";a="157932577"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 05 May 2022 08:07:28 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Thu, 5 May 2022 08:07:27 -0700
Received: from [10.159.245.112] (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2375.17 via Frontend
 Transport; Thu, 5 May 2022 08:07:25 -0700
Message-ID: <ce1eeb0f-7211-f865-39d8-c0cc758de947@microchip.com>
Date: Thu, 5 May 2022 17:07:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v3 6/6] ARM: configs: at91: sama7_defconfig: add MCHP PDMC
 and DMIC drivers
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>, <Codrin.Ciubotariu@microchip.com>
References: <20220307122202.2251639-1-codrin.ciubotariu@microchip.com>
 <20220307122202.2251639-7-codrin.ciubotariu@microchip.com>
 <d84e0e48-cf35-ae1a-e384-067d361457ba@microchip.com>
 <77c2b348-b7a6-458d-21b6-68c54efc317f@microchip.com>
 <YnPmyEujwByeFDdp@sirena.org.uk>
From: Nicolas Ferre <nicolas.ferre@microchip.com>
Organization: microchip
In-Reply-To: <YnPmyEujwByeFDdp@sirena.org.uk>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, lars@metafoo.de,
 tiwai@suse.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org
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

On 05/05/2022 at 17:01, Mark Brown wrote:
> On Thu, May 05, 2022 at 02:47:04PM +0000,Codrin.Ciubotariu@microchip.com  wrote:
>> On 05.05.2022 16:58, Nicolas Ferre wrote:
>>> I'm fine with that, but I see that some Kconfig entries "select" this
>>> SND_SOC_DMIC directly (amd, intel, mediatek, stm).
>>> If it's absolutely needed for PDMC to work, what about doing the same as
>>> it would prevent some broken configurations?
>> The only way it makes sense to me to have this driver selected somewhere
>> is in a sound card driver, used for a specific board, which we know it
>> has PDM microphones. Since, for now, we use the simple sound card for
>> our audio interfaces, we have no place to add this select.
>> The reason I do not like to add this select under the controller driver,
>> as some of the vendors did, is because, in the future, we might have
>> different PDM microphones that might not work with SND_SOC_DMIC and
>> might need a different driver.
>> I don't have a strong opinion on this. If you think I am overthinking,
>> please let me know and I will change this.
> It's unlikely but possible that there could be some other device
> connected (eg, you could have a DSP or something that generates PDM
> output).  If the driver doesn't directly instantiate the DMIC itself
> then it's probably reasonable for it to be user controllable if the DMIC
> driver is there.

Fair enough, It makes perfect sense to me as it is then.
Thanks for the feedback!

Best regards,
   Nicolas

-- 
Nicolas Ferre
