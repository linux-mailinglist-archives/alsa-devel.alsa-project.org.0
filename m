Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AAE52AA071
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Nov 2020 23:33:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6C58B1687;
	Fri,  6 Nov 2020 23:32:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6C58B1687
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604701993;
	bh=uB/Oj+Oj5km57AYy2yaswjARG7FK+EOWgqEe2cVv4qY=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=e8v4kYC3eDGNcAzj0LrefdSyJzkv7S/RfJq+76L3kknTM+sLQ/V0XIQ9/cxT/Q0Uh
	 JMumTCIMb8Fxjl9qEE6BDxDCknYT2tkkNc0MnIneWmdmFCck0b4EnhJHvaw/xNEkmW
	 IHr3yzk/RURliAMFTqqD6ltnYxJuQLNIhaB7UtPc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3B359F80259;
	Fri,  6 Nov 2020 23:32:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 76ED3F80234; Fri,  6 Nov 2020 23:31:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EE61AF80150;
 Fri,  6 Nov 2020 23:31:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EE61AF80150
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.b="Fn6oKQaK"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=uKFp6ndH5gt97JZMTQlnD2RC9vnO3OIFv4HmGm7a2e4=; b=Fn6oKQaK7vWLVZGa5Y+vMLjcC3
 Xd70zDJFJ1djl7SvZL0cpf9YV4Z3sTJaUBJVnp9MKc3omKtXSOa98pCk1CgKbfE0utgIJXPAXkCxV
 zMU6Ysxye5xQxqZq7w6U4li7hRMgZyThYBrkSVST/mrI0gWGHzEI9eviMrsyzgMaywUbpRosFlXrH
 7lHmfCkjCf5ymOap1etR2B9Htkha0CX+/ABFWji7i4Wrqmy+1qpM+PtluPjE7eOJ4ePvQlA/AuVQR
 VmhaDw1kHAvfFkTcnbDHOsl8VdonN8e88XmWbQiKquXhSHv4bU+U2hmr3KVKNxfBXgsPFxeF86v1v
 FXzVntrA==;
Received: from [2601:1c0:6280:3f0::a1cb]
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kbAGn-0007ZG-BZ; Fri, 06 Nov 2020 22:31:45 +0000
Subject: Re: [Sound-open-firmware] linux-next: Tree for Nov 6
 (sound/soc/sof/sof-pci-dev.o)
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20201106171834.64e4d6d5@canb.auug.org.au>
 <0a66a2b1-85b6-3515-47f4-2e861b991386@infradead.org>
 <7505ed68-f12b-d1d9-12e5-f8ae34a74ebd@linux.intel.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <0e8f0a8b-60c4-d146-90a2-a972d1748a4c@infradead.org>
Date: Fri, 6 Nov 2020 14:31:41 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <7505ed68-f12b-d1d9-12e5-f8ae34a74ebd@linux.intel.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Daniel Baluta <daniel.baluta@nxp.com>, sound-open-firmware@alsa-project.org
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

On 11/6/20 12:53 PM, Pierre-Louis Bossart wrote:
> 
>> on x86_64:
>>
>> ld: sound/soc/sof/sof-pci-dev.o: in function `sof_pci_probe':
>> sof-pci-dev.c:(.text+0x5c): undefined reference to `snd_intel_dsp_driver_probe'
>>
>>
>> Full randconfig file is attached.
> 
> Nice catch, thanks Randy! Looks like we put the select SND_INTEL_DSP_CONFIG in the wrong place, it's not dependent on the HDaudio link being selected. Clearly a bug we've had for a while.
> 
> The diff below makes the error go away but I have to run it past folks who are already enjoying their week-end. Will follow-up next week with a proper fix.

Works for me. You can have an Ack if you use this patch.
Thanks.
Acked-by: Randy Dunlap <rdunlap@infradead.org>

> diff --git a/sound/soc/sof/intel/Kconfig b/sound/soc/sof/intel/Kconfig
> index a066e08860cb..5bfc2f8b13b9 100644
> --- a/sound/soc/sof/intel/Kconfig
> +++ b/sound/soc/sof/intel/Kconfig
> @@ -271,6 +271,7 @@ config SND_SOC_SOF_JASPERLAKE
> 
>  config SND_SOC_SOF_HDA_COMMON
>         tristate
> +       select SND_INTEL_DSP_CONFIG
>         select SND_SOC_SOF_INTEL_COMMON
>         select SND_SOC_SOF_HDA_LINK_BASELINE
>         help
> @@ -330,7 +331,6 @@ config SND_SOC_SOF_HDA
>         tristate
>         select SND_HDA_EXT_CORE if SND_SOC_SOF_HDA_LINK
>         select SND_SOC_HDAC_HDA if SND_SOC_SOF_HDA_AUDIO_CODEC
> -       select SND_INTEL_DSP_CONFIG
>         help
>           This option is not user-selectable but automagically handled by
>           'select' statements at a higher level
> 
> 


-- 
~Randy
