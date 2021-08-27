Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FBB63F9BB9
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Aug 2021 17:30:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D10751711;
	Fri, 27 Aug 2021 17:29:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D10751711
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1630078237;
	bh=Z9YCxM19NTbHNIIyx/VhdPDuBCm5n/qvojvZGsNabQs=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lwTUTSPw9rZFYGVnmPKcoIofQfaeI/GxemfE3brKybixxmNkDEFv6sSoF7tfllccr
	 yFbGdFgrlNtm6lo4KGAC6STLcI8ohyaTE3ZqDix5J4D0MU6To+n0SCwjshcfYpfRYk
	 buhZyAzO+SpzwRGgGm25bhuz05oDCArry/F0BSyM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C2C6CF801D5;
	Fri, 27 Aug 2021 17:29:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 47CCAF80129; Fri, 27 Aug 2021 17:28:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 74096F80054
 for <alsa-devel@alsa-project.org>; Fri, 27 Aug 2021 17:28:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 74096F80054
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com
 header.b="yxixc4aH"
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.0.43) with SMTP id 17RAUIpe002666;
 Fri, 27 Aug 2021 17:28:36 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=LQt026cMUPGEhdGgKRHOAiE5md4Umql7XViI6VQ6s/U=;
 b=yxixc4aHPR4KoPUgPgfq8E6GkwcF32s8WK12A/Wt6wqr+9JjnKBftH/ukdFYEYmHyWWX
 hNUXNa8wbKgmKYVhNQKRGLNGFBb6WyAkpiNjqbKQzaGzCu6F8sVQsAf+PbkXQ1xhiYjc
 nPV3dG39tcLIaJPxMDVB2fiPo0SgYfmYQM3fp78gGuxhJe5aoboq/Rgot0ijMkA7dVFZ
 rUvgmY3BgQ21/4luLthdZkV1i1ai9kQnBUodZENHM2j8fhapHvmBcI7PKUYoj89tD5sj
 38LLhPDObUIH5NWi2jNYO+yK/K+EY76+XplSLiv25fe0VYmXK/MTU50V8XFfefOSpToC BA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3apqmkv1nw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 27 Aug 2021 17:28:36 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id AB17110002A;
 Fri, 27 Aug 2021 17:28:35 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 818CC239D64;
 Fri, 27 Aug 2021 17:28:35 +0200 (CEST)
Received: from lmecxl0577.lme.st.com (10.75.127.49) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 27 Aug
 2021 17:28:35 +0200
Subject: Re: [PATCH 6/6] ASoC: audio-graph: remove Platform support
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
References: <871rb758x7.wl-kuninori.morimoto.gx@renesas.com>
 <87sg3n3ubg.wl-kuninori.morimoto.gx@renesas.com>
 <bc95a045-b370-8d7f-1167-34bd68e39165@foss.st.com>
 <87k0k916pj.wl-kuninori.morimoto.gx@renesas.com>
From: Olivier MOYSAN <olivier.moysan@foss.st.com>
Message-ID: <e6987f60-5d1c-7e53-bd39-600e2e16aa15@foss.st.com>
Date: Fri, 27 Aug 2021 17:28:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <87k0k916pj.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-08-27_04,2021-08-26_02,2020-04-07_01
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
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

Hi Kuninori,

Thanks for your feedback

On 8/26/21 12:48 AM, Kuninori Morimoto wrote:
> 
> Hi Olivier
> 
> Thank you for conntacting me
> 
>> I have seen that the STM32MP15 audio sound card is no more functional
>> with recent kernels (5.13 or 5.14)
>> The sound card is registered, but the all devices are issuing an error
>> at runtime. These devices are using stm32_sai.c or stm32_i2s.c
>> drivers.
>>
>> I found that the regression is linked to the commit
>> 63f2f9cceb09f8e5f668e36c1cf764eea468ebed "ASoC: audio-graph: remove
>> Platform support", as reverting this commit fixes the issue.
>>
>> When the platform component is missing the pcm_construct ops in the
>> pcm dmaengine, is never called, resulting in an incomplete
>> initialization of the sound card.
>> I can't figure out what is the right way to handle this change, however.
>> Do I need to update the CPU drivers to work without a platform component
>> or does the audio-graph card has to be changed in some way ?
> 
> Ahh, OK, I see.
> Indeed the dev which is used for CPU is used at soc-generic-dmaengine as Platform,
> without indicating it at DT (= simple-card has "plat" support for platform at DT,
> but audio-graph doesn't ).
> 

Yes, it seems that there is no way to force CPU to be used as platform 
with audio-graph. so, asoc_simple_canonicalize_platform() is necessary 
to do the job in this case.

> I think key funciton is asoc_simple_canonicalize_platform().
> 
>> What do you mean "We can respawn it when we need it", in the commit
>> message ?
> 
> This means we can revert this patch if needed, and yes it is needed :)
> Could you please respawn the feature ? or I can do it if you want.
> 

I feel more confortable if you revert the commit, as you are the author 
of the patch.
Thanks.

BRs
Olivier

> Thank you for your help !!
> 
> Best regards
> ---
> Kuninori Morimoto
> 
