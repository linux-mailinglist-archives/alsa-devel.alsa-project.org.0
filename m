Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 211F3474803
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Dec 2021 17:28:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8C2B51AD8;
	Tue, 14 Dec 2021 17:27:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8C2B51AD8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639499306;
	bh=FA0NBErc0wZ9CdWVD3Rss2ULWn2FyxtBfB4pN+r6CJ4=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cbw7Eyz1psMIwR5N1omcGnqzcgXC4Lh7YrpV6Zw4VV4Wami1lMpDe5sVVe1hExZTS
	 l9HDfSfQUnxoDxSeHc2otIex7bMDyA02R4BkJpQ4cVJ6aN++iDZOrJ6Wulnucq4V6l
	 dD7JRGHpRi/zsQuOKRbo0LNtQE3Y/rXRyfRVo8Rw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ED291F80249;
	Tue, 14 Dec 2021 17:27:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 35ED5F80246; Tue, 14 Dec 2021 17:27:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F36E9F8016A
 for <alsa-devel@alsa-project.org>; Tue, 14 Dec 2021 17:27:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F36E9F8016A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.b="NA69IeRg"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=uslCgpNux7UCWvRrQn0jiboSZeFlAwPdMrox4AtO3lY=; b=NA69IeRgKaAKGVIPZOXkudrLma
 LB4GLgor00uc8BI0/pGiViJ9hCO5G31dOaMt9n5+tGiVIKu1TJRf8W16fGRo5ZYEFdlQHSCN0htZn
 jsOofBk7FUY03UCo4Z6WxML0kucfTzx6UlJagPU+Z+piEnDtGHmRfqbXubz66BSn8RtyW8mPNHii9
 gX7ZEdDulliKRtIaGHZP31xYwF2pmYZY6B+TPPwejwrKVCdmCleglG35v8t7k+BuYa3CkmUQ62Dfb
 sw9nIv4AV2FGjfRkkp1e6k+UzTcFUfkG7tsgM6jvLT4RwVrQ14YvcK012oih2gbxIm+2q7eW/Waox
 vFUvJ+NQ==;
Received: from [2601:1c0:6280:3f0::aa0b]
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxAdj-00DsaK-Fr; Tue, 14 Dec 2021 16:26:56 +0000
Message-ID: <8ab0ed95-ce79-cd61-0440-20e0242b8930@infradead.org>
Date: Tue, 14 Dec 2021 08:26:52 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: linux-next: Tree for Dec 13 (SND_AMD_ACP_CONFIG)
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org, Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20211214030215.3181149-1-broonie@kernel.org>
 <8ff9d4b2-1905-2efa-cb86-e8f6cef06ef2@infradead.org>
 <15c3b6fe-b159-6cee-be67-11f2f2dd0d04@linux.intel.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <15c3b6fe-b159-6cee-be67-11f2f2dd0d04@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
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

Hi--

On 12/14/21 05:51, Pierre-Louis Bossart wrote:
> 
> 
>> on i386 or x86_64:
>>
>> when # CONFIG_ACPI is not set,
>> so SND_SOC_ACPI is not set:
>>
>> WARNING: unmet direct dependencies detected for SND_AMD_ACP_CONFIG
>>   Depends on [n]: SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && SND_SOC_ACPI [=n]
>>   Selected by [y]:
>>   - SND_SOC_AMD_ACP_COMMON [=y] && SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && X86 [=y] && PCI [=y]
>>
>>
>> Full randconfig file is attached
> 
> It's probably triggered by my recent change to fix another problem.
> 
> d9b994cd7641 ASoC: AMD: acp-config: fix missing dependency on SND_SOC_ACPI
> 
> I didn't realize SND_AMD_ACP_CONFIG was selected by other configs.
> Moving to a select seems to fix the issue reported by Randy, not sure if
> it's the right thing to do though.
> 

That works. You can add my Ack if you want to push this patch.
Thanks.

Acked-by: Randy Dunlap <rdunlap@infradead.org> # build-tested

> 
> diff --git a/sound/soc/amd/Kconfig b/sound/soc/amd/Kconfig
> index bcfeb3fc2592..7a9e45094f37 100644
> --- a/sound/soc/amd/Kconfig
> +++ b/sound/soc/amd/Kconfig
> @@ -98,7 +98,7 @@ config SND_SOC_AMD_YC_MACH
> 
>  config SND_AMD_ACP_CONFIG
>         tristate "AMD ACP configuration selection"
> -       depends on SND_SOC_ACPI
> +       select SND_SOC_ACPI if ACPI
>         help
>          This option adds an auto detection to determine which ACP
>          driver modules to use
> 
> 

-- 
~Randy
