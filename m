Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CDFB94D0BDB
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Mar 2022 00:15:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 539781728;
	Tue,  8 Mar 2022 00:14:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 539781728
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646694948;
	bh=g+/4EEm5vckt73UbeiMu/wj0gPRST7Yt4oNCh2xPfEI=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=D0PofKfPTGrsmd/t25uMcNgVNUarsdvgZmXMqcxBJ4yUePeJ9g4M/MH8alVX/1cCP
	 hDaI/5lh/lDgCPWU07wTRnLLNgZsseL9EmIRGC9WiW8KkUtMEMBqBKzGCVvbkh67pV
	 gnAfkgd++Uwmg0GS/IA/9c2KxBvn+gXAmXfsOpM0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B0AD9F80159;
	Tue,  8 Mar 2022 00:14:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5B7C8F8013F; Tue,  8 Mar 2022 00:14:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 619F0F80124
 for <alsa-devel@alsa-project.org>; Tue,  8 Mar 2022 00:14:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 619F0F80124
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.b="VGTbphPW"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=1RJl9gPUoZ5r0tpE3KAj5UTUngTysCjGJETPpOzuLSc=; b=VGTbphPW+44xgsldnOtrZRksPu
 5zkcPB10d7stBVRUgLup1/+ZOqiUvtIR0i/gWWUtg27mYsPGBVQO/v8api9RAOMYi9/6JrrH1hHAF
 DMWqQrlOEJawA4SrKudJDam5qVxWoj3rc4BA1ynbsUY11vUBk5iN3VMwKlxSPpUUoYxG/s706r5pO
 GH5gsdudLQ8vOWfKGmnHrIu1e7g7nMu3DVDkrbqa1TpyJsRpiKj+D4hTOmVa00peZ5KqgBG9ZAFo8
 TRSprjiHqeLkkD8RN18BUr+CfDxfs9t4a4uKRuy61DQfLrVZKYPbF9CrENHACF8akyc3Q7QrHL3aa
 /KeJgFLw==;
Received: from [2601:1c0:6280:3f0::aa0b]
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRMYM-00FdR5-9S; Mon, 07 Mar 2022 23:14:10 +0000
Message-ID: <9d85050f-33c5-0cd0-3278-ca62f4ca098e@infradead.org>
Date: Mon, 7 Mar 2022 15:14:03 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: mmotm 2022-03-06-20-33 uploaded (sound/soc/intel/boards/)
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Andrew Morton <akpm@linux-foundation.org>, broonie@kernel.org,
 mhocko@suse.cz, sfr@canb.auug.org.au, linux-next@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, mm-commits@vger.kernel.org
References: <20220307043435.251DBC340E9@smtp.kernel.org>
 <39c76613-3fb4-651b-1838-f460c4f76a17@infradead.org>
 <178c7536-7b54-5f73-b759-745db4fae2bc@linux.intel.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <178c7536-7b54-5f73-b759-745db4fae2bc@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Keyon Jie <yang.jie@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>
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



On 3/7/22 13:54, Pierre-Louis Bossart wrote:
> 
> 
> On 3/7/22 15:12, Randy Dunlap wrote:
>>
>>
>> On 3/6/22 20:34, Andrew Morton wrote:
>>> The mm-of-the-moment snapshot 2022-03-06-20-33 has been uploaded to
>>>
>>>     https://www.ozlabs.org/~akpm/mmotm/
>>>
>>> mmotm-readme.txt says
>>>
>>> README for mm-of-the-moment:
>>>
>>> https://www.ozlabs.org/~akpm/mmotm/
>>>
>>> This is a snapshot of my -mm patch queue.  Uploaded at random hopefully
>>> more than once a week.
>>>
>>> You will need quilt to apply these patches to the latest Linus release (5.x
>>> or 5.x-rcY).  The series file is in broken-out.tar.gz and is duplicated in
>>> https://ozlabs.org/~akpm/mmotm/series
>>
>> on x86_64:
>>
>> ERROR: modpost: "sof_dai_get_bclk" [sound/soc/intel/boards/snd-soc-intel-sof-cirrus-common.ko] undefined!
>> ERROR: modpost: "sof_dai_get_mclk" [sound/soc/intel/boards/snd-soc-intel-sof-realtek-common.ko] undefined!
>>
>>
>> Full randconfig file is attached.
> 
> Thanks Randy for the report. Indeed there's a problem with the SND_SOC_INTEL_SOF_SSP_AMP_MACH option. It should be conditional on at least one Intel/SOF platform being selected, as all the other platforms are already.
> 
> The following diff makes the problem go away:

Ack. Works for me. (after ignoring the double-spaced lines :)

Thanks.

> 
> diff --git a/sound/soc/intel/boards/Kconfig b/sound/soc/intel/boards/Kconfig
> 
> index 6884ddf9edad..81e012c164b0 100644
> 
> --- a/sound/soc/intel/boards/Kconfig
> 
> +++ b/sound/soc/intel/boards/Kconfig
> 
> @@ -615,6 +615,8 @@ config SND_SOC_INTEL_SOF_DA7219_MAX98373_MACH
> 
> 
> 
>  endif ## SND_SOC_SOF_JASPERLAKE
> 
> 
> 
> +if SND_SOC_SOF_HDA_LINK
> 
> +
> 
>  config SND_SOC_INTEL_SOF_SSP_AMP_MACH
> 
>         tristate "SOF with amplifiers in I2S Mode"
> 
>         depends on I2C && ACPI
> 
> @@ -631,6 +633,7 @@ config SND_SOC_INTEL_SOF_SSP_AMP_MACH
> 
>            with RT1308/CS35L41 I2S audio codec.
> 
>            Say Y if you have such a device.
> 
>            If unsure select "N".
> 
> +endif ## SND_SOC_SOF_HDA_LINK
> 
> 
> 
>  if SND_SOC_SOF_ELKHARTLAKE
> 
> 
> 

-- 
~Randy
