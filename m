Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A6F814CC946
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Mar 2022 23:41:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 34C5A1A75;
	Thu,  3 Mar 2022 23:40:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 34C5A1A75
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646347271;
	bh=jscVy9rEba5OlKp6VDtXrCTGbrrFaorts3aemYo6Sz0=;
	h=Date:Subject:From:To:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ebwYZGtRlSamgjZJB62AesowvmCnJ8+XWJ5cqgJS5spfatPMAF1at7IvbES+htCRz
	 aHKpNaqMv1G+ktGGmFndSdw8spwFEiwXj+oxYAn7nTq2O6H6xPMtZuUF8jQJZxqKLm
	 Szzx1ZqdYYx7YE32JMx69HvOH22g6wmDlwt6Nc/U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A526EF80166;
	Thu,  3 Mar 2022 23:40:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 55C63F80152; Thu,  3 Mar 2022 23:40:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3AE30F800F0
 for <alsa-devel@alsa-project.org>; Thu,  3 Mar 2022 23:39:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3AE30F800F0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.b="Rcw5rZDP"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:References:To:From:Subject:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Cc:Content-ID:Content-Description;
 bh=8xS4vyGXrvaXNSOoyEcAyKtTk6VII0GHY+1sEXjj3ZU=; b=Rcw5rZDPcRxvOBX/MWRLhvjObC
 TRLMEin0NOHkkJylcRVj4A3PpWkMgnYl4tavHCyPUssyKSe2djvNzofUU1gk8S2nz0GAFygh+nuwR
 O31wvhqdWnRLnp+l8t2g4ddXWAIjh/2bJObFM2ICcgRTj/6DflgExi/wpPdSTp57TJ90O9sJjNSzC
 T2WIKZ8VDxldgThha0UkE1k2V0Wcb/z2Bbbdb+GaGL36tnnV4De2KeBKtPDJhwnmFgzGoCaiyApow
 5f/YUwfnY/HqoLJmT4240vVtk4VLwwlqr7vftKdCCg4MMJkBZQbcmB2jdPq6fUQ0v36toepHhAuYN
 YWy4Iy5g==;
Received: from [2601:1c0:6280:3f0::aa0b]
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nPu6m-00C3HB-VQ; Thu, 03 Mar 2022 22:39:41 +0000
Message-ID: <f2b86182-97d1-4341-1b2c-9598a90fdecc@infradead.org>
Date: Thu, 3 Mar 2022 14:39:36 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: mmotm 2022-02-23-21-20 uploaded (Kconfig warning: SND_SOC_WCD938X)
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
To: Andrew Morton <akpm@linux-foundation.org>, broonie@kernel.org,
 mhocko@suse.cz, sfr@canb.auug.org.au, linux-next@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, mm-commits@vger.kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>
References: <20220224052137.BFB10C340E9@smtp.kernel.org>
 <6bd5ec04-dedc-5d1f-23d7-4fd6f4efb95f@infradead.org>
In-Reply-To: <6bd5ec04-dedc-5d1f-23d7-4fd6f4efb95f@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

Still seeing this build (Kconfig) warning in
mmotm of 20220322:

On 2/24/22 09:13, Randy Dunlap wrote:
> 
> 
> On 2/23/22 21:21, Andrew Morton wrote:
>> The mm-of-the-moment snapshot 2022-02-23-21-20 has been uploaded to
>>
>>    https://www.ozlabs.org/~akpm/mmotm/
>>
>> mmotm-readme.txt says
>>
>> README for mm-of-the-moment:
>>
>> https://www.ozlabs.org/~akpm/mmotm/
>>
>> This is a snapshot of my -mm patch queue.  Uploaded at random hopefully
>> more than once a week.
> 
> on x86_64:
> 
> WARNING: unmet direct dependencies detected for SND_SOC_WCD938X
>   Depends on [n]: SOUND [=y] && !UML && SND [=y] && SND_SOC [=m] && SND_SOC_WCD938X_SDW [=n] && (SOUNDWIRE [=n] || !SOUNDWIRE [=n])
>   Selected by [m]:
>   - SND_SOC_SC7280 [=m] && SOUND [=y] && !UML && SND [=y] && SND_SOC [=m] && SND_SOC_QCOM [=m] && (I2C [=y] && SOUNDWIRE [=n] || COMPILE_TEST [=y])
> 
> 
> Full randconfig file is attached.
> 

-- 
~Randy
