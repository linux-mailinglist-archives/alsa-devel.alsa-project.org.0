Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DA2D3551FD9
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Jun 2022 17:09:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4958D18A2;
	Mon, 20 Jun 2022 17:08:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4958D18A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655737774;
	bh=H0ulQrMBtA6pu622Zq7Ff/HeEgzOhbo0ZUSX4iWBZhA=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BtbOrNNTwAqzsoR54fYE6Mc+950ucY51MXa8oDCFWfDu2SSZkfb7AcIlfJvKRUASA
	 GRgXbRI3GGbB6juF3wIHtA6FYn3RZGXkPrHZ0FFs0h9GEyBGdkAAmt6kcaTfcBLUXt
	 PS2zgCRTTe952ygi1k3GFFbWzZ/+yz/Lvd9KkoJM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 30806F80549;
	Mon, 20 Jun 2022 17:06:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 721BDF800E4; Mon, 20 Jun 2022 02:25:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CEB42F800E4
 for <alsa-devel@alsa-project.org>; Mon, 20 Jun 2022 02:25:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CEB42F800E4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=wdc.com header.i=@wdc.com
 header.b="reHSoUdi"; 
 dkim=pass (2048-bit key) header.d=opensource.wdc.com
 header.i=@opensource.wdc.com header.b="C4jTh3Cd"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1655684753; x=1687220753;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=H0ulQrMBtA6pu622Zq7Ff/HeEgzOhbo0ZUSX4iWBZhA=;
 b=reHSoUdiwW0I2KT8kfsGB6p6Qhc0OkRtXh2QOd/lR7WWvOpD11xPqTtx
 BWb42U3/SSWw5wQmkLrOl/UHY/WqnP7g2vQ575Z+iTBt73JsA7Aq8wRWY
 tPbqG9xRFKvHoi/Z1t01mDEmoYLbfqKxjNkFtGqpDrawbnwgU0SqGA+/j
 m8iTCAtbQkmNRlsudiV+viaZfqIejRpat9lIrxxbpdiey/Z3/ZPWjkeKT
 kA0v5J70LcExKYaGEFY4Y2LBcvmPLb7QXlvNB5JDNLMPmqD5TdJ7DuDIr
 6O4hMUuq3UQh2bALU5F7ar2x42FvgcNaOMM432PnheldJa4LuNSFxA560 w==;
X-IronPort-AV: E=Sophos;i="5.92,306,1650902400"; d="scan'208";a="203577225"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 20 Jun 2022 08:25:46 +0800
IronPort-SDR: 932NAlgvMAQGw6sl5mDtFyXUVVbEJ7l9HT2KCIKlo/0DaZpO1KZ6XeHSPC/XbQY6ptN7q7RbbS
 kvShfi2Yz8IizLa/qiPZodcnJdjdeHJsx3ox51d9jpnBFV7kirod1LnoBoPj9s0+fdC8NOvBSj
 GawGPLdlMGD6jbxPpYbUXqy0EU0F/kQSDPnRgCRI1NIMet6TJA9CfGPLS8oKeFXHuDQ2cBWTtn
 Bz/F0uzhbfev6ikJimBuJ2lynou6r9PiyPj+OsaKS458bNfcMJDPx9Tf1O3hz0ml8meFNa4sMw
 g1JimRkPYwavFnyAShphXdkE
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Jun 2022 16:48:19 -0700
IronPort-SDR: K0Qh69wniC4yf20UT3La5zzLFQMPlKnAJ4eRFglT7MK7cXQtxSiquFIEAo6RGXGvyj5svr5hEm
 VM1G894xqOCQ/UBVzV++vTQSoGZbtCOMROGpCKMw3zaOxo9MyZpwYQdYcyQKYratoMKXd/rnUx
 S9h/LaK8iYLPbI/+/3IxdIncUVxZ4ZZAixkHF1el2hDUaYqE6U2wXsCqBdyCyUP7jrdSDdFhWu
 Fi0RFrlZzIeSqFcmj69zLH80O6uIPAwwGmk41m0FO/d9EerHiq/JxcH3lZkbim+F0pRRrH6Nt+
 c0Y=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Jun 2022 17:25:47 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4LR9RG2H3Dz1SVp2
 for <alsa-devel@alsa-project.org>; Sun, 19 Jun 2022 17:25:46 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :in-reply-to:organization:from:references:to:content-language
 :subject:user-agent:mime-version:date:message-id; s=dkim; t=
 1655684744; x=1658276745; bh=H0ulQrMBtA6pu622Zq7Ff/HeEgzOhbo0ZUS
 X4iWBZhA=; b=C4jTh3Cduu7dnWqkzvP9u4tEJAeikZRq/wWmWNKkwFtT8M4pM77
 3hndmJwZOZr3hCWku8+IuTH1ZnvcAIMua0Zw2k7F3+6euIqXkh5UFAbAANNHLqXU
 cxnLLcwkEtmk/xheSzmNHSiFDRiH3OwgiUC5d4BmDn0CS11dBqu4JpLHc/VbXFmr
 cE49A+9RgLD5zqbN6CO9a9Hwi11IjyTNgdsI7qunXIj89zs3C2goG1ATpKObywEM
 cw+htJod9TACf+L53t0cPM+3RbyaAToItQ1NDKQUEWoXwffXp6ihfDogop4ylbzA
 5uHeE7r2BlfB77ZWvTPUP73mxqPCIunnq3w==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026)
 with ESMTP id mEB39yD56-Ob for <alsa-devel@alsa-project.org>;
 Sun, 19 Jun 2022 17:25:44 -0700 (PDT)
Received: from [10.225.163.87] (unknown [10.225.163.87])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4LR9R75cZsz1Rvlc;
 Sun, 19 Jun 2022 17:25:39 -0700 (PDT)
Message-ID: <891cf74c-ac0a-b380-1d5f-dd7ce5aeda9d@opensource.wdc.com>
Date: Mon, 20 Jun 2022 09:25:38 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 07/14] riscv: dts: canaan: fix the k210's memory node
Content-Language: en-US
To: Conor.Dooley@microchip.com, mail@conchuod.ie, airlied@linux.ie,
 daniel@ffwll.ch, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 thierry.reding@gmail.com, sam@ravnborg.org, Eugeniy.Paltsev@synopsys.com,
 vkoul@kernel.org, lgirdwood@gmail.com, broonie@kernel.org,
 fancer.lancer@gmail.com, daniel.lezcano@linaro.org, palmer@dabbelt.com,
 palmer@rivosinc.com
References: <20220618123035.563070-1-mail@conchuod.ie>
 <20220618123035.563070-8-mail@conchuod.ie>
 <9cd60b3b-44fe-62ac-9874-80ae2223d078@opensource.wdc.com>
 <e1fbf363-d057-1000-a846-3df524801f15@microchip.com>
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <e1fbf363-d057-1000-a846-3df524801f15@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Mon, 20 Jun 2022 17:06:44 +0200
Cc: niklas.cassel@wdc.com, alsa-devel@alsa-project.org, aou@eecs.berkeley.edu,
 devicetree@vger.kernel.org, masahiroy@kernel.org, linux-kernel@vger.kernel.org,
 jee.heng.sia@intel.com, linux-spi@vger.kernel.org, joabreu@synopsys.com,
 geert@linux-m68k.org, dri-devel@lists.freedesktop.org,
 paul.walmsley@sifive.com, dmaengine@vger.kernel.org, tglx@linutronix.de,
 dillon.minfei@gmail.com, linux-riscv@lists.infradead.org
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

On 6/20/22 08:54, Conor.Dooley@microchip.com wrote:
> On 20/06/2022 00:38, Damien Le Moal wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>
>> On 6/18/22 21:30, Conor Dooley wrote:
>>> From: Conor Dooley <conor.dooley@microchip.com>
>>>
>>> The k210 memory node has a compatible string that does not match with
>>> any driver or dt-binding & has several non standard properties.
>>> Replace the reg names with a comment and delete the rest.
>>>
>>> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>>> ---
>>> ---
>>>  arch/riscv/boot/dts/canaan/k210.dtsi | 6 ------
>>>  1 file changed, 6 deletions(-)
>>>
>>> diff --git a/arch/riscv/boot/dts/canaan/k210.dtsi b/arch/riscv/boot/dts/canaan/k210.dtsi
>>> index 44d338514761..287ea6eebe47 100644
>>> --- a/arch/riscv/boot/dts/canaan/k210.dtsi
>>> +++ b/arch/riscv/boot/dts/canaan/k210.dtsi
>>> @@ -69,15 +69,9 @@ cpu1_intc: interrupt-controller {
>>>
>>>       sram: memory@80000000 {
>>>               device_type = "memory";
>>> -             compatible = "canaan,k210-sram";
>>>               reg = <0x80000000 0x400000>,
>>>                     <0x80400000 0x200000>,
>>>                     <0x80600000 0x200000>;
>>> -             reg-names = "sram0", "sram1", "aisram";
>>> -             clocks = <&sysclk K210_CLK_SRAM0>,
>>> -                      <&sysclk K210_CLK_SRAM1>,
>>> -                      <&sysclk K210_CLK_AI>;
>>> -             clock-names = "sram0", "sram1", "aisram";
>>>       };
>>
>> These are used by u-boot to setup the memory clocks and initialize the
>> aisram. Sure the kernel actually does not use this, but to be in sync with
>> u-boot DT, I would prefer keeping this as is. Right now, u-boot *and* the
>> kernel work fine with both u-boot internal DT and the kernel DT.
> 
> Right, but unfortunately that desire alone doesn't do anything about
> the dtbs_check complaints.
> 
> I guess the alternative approach of actually documenting the compatible
> would be more palatable?

Yes, I think so. That would allow keeping the fields without the DTB build
warnings.

> 
> Thanks,
> Conor.
> 
> 
> 


-- 
Damien Le Moal
Western Digital Research
