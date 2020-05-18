Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 000F91D743A
	for <lists+alsa-devel@lfdr.de>; Mon, 18 May 2020 11:41:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 89E5F16CB;
	Mon, 18 May 2020 11:40:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 89E5F16CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589794877;
	bh=3CkG4isjVZAbr5KOOm7UHFCy5maIMe9iqihSuBd6/3U=;
	h=Subject:From:To:References:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DCOzeD/88CXPPa1NhKyJu+Orh1dFOmZ9NHOeFGa6BAgk0G5ckCSHnKLhTBHGROvdT
	 sKxHDzSqEUqcst0yvU818BrHBe/lTie+Y8cZAKrqy3Ug8LhRtNdcZJHs9DuhZ0KqHy
	 CSkBr9Nd9xn2Lci1itXoL1/R+DHC/EZY8YAPaZxw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A906BF8015C;
	Mon, 18 May 2020 11:39:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 94BDDF801DA; Mon, 18 May 2020 11:39:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 18CBFF80086
 for <alsa-devel@alsa-project.org>; Mon, 18 May 2020 11:39:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 18CBFF80086
IronPort-SDR: 3ck/GjnIE+28RtOaLBJ4uJaj5RB5OxV6F15VSk2tKED7HPG2+qqR/aimamuaBRdlV+bNQSoG7I
 ytfDvYd7j3vw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2020 02:39:21 -0700
IronPort-SDR: ecaAiU+TlufokoGoDCKm2KOk9IoSuewertOzEKjx7Zqeezg4WYM0Mr3OdtQHtVvNUCkowPG54Z
 eySDQBaDa6Vg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,406,1583222400"; d="scan'208";a="342741058"
Received: from penghaos-mobl.ccr.corp.intel.com (HELO [10.254.215.93])
 ([10.254.215.93])
 by orsmga001.jf.intel.com with ESMTP; 18 May 2020 02:39:18 -0700
Subject: Re: [PATCH 2/2] ASoC: topology: remove the redundant pass checks
From: Keyon Jie <yang.jie@linux.intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
References: <20200512182319.118995-1-yang.jie@linux.intel.com>
 <20200512182319.118995-2-yang.jie@linux.intel.com>
 <99807efc-000b-d94d-e972-19894d7c028f@linux.intel.com>
 <beb62a8f-6796-c7ff-6361-ea22b29ebd07@linux.intel.com>
Message-ID: <d74321e7-7c2b-2856-db21-03ab5cfa0018@linux.intel.com>
Date: Mon, 18 May 2020 17:40:08 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <beb62a8f-6796-c7ff-6361-ea22b29ebd07@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Cezary Rojewski <cezary.rojewski@intel.com>,
 broonie@kernel.org
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



On 5/13/20 10:36 AM, Keyon Jie wrote:
> 
> 
> On 5/13/20 3:40 AM, Pierre-Louis Bossart wrote:
>>
>>
>> On 5/12/20 1:23 PM, Keyon Jie wrote:
>>> As we have check the 'pass' in the soc_elem_pass_load(), so no need to
>>> check it again in each specific elem_load function, at the same time,
>>> the tplg->pos will be reset to the next header base when the pass is
>>> mismatched, so the increasing of the tplg->pos in these cases made no
>>> sense. Here remove all of them.
>>
>> Sorry Keyon, I am not comfortable with the changes. This started as a 
>> removal of a debug log and we ended-up changing the execution flow in 
>> one of the more complex parts of the ASoC framework.
>> I spent 30mn looking at the code and I don't have a feeling all corner 
>> cases are covered. The bar for core changes is higher, it'd help to 
>> have additional explanations or evidence that your proposal was tested 
>> extensively. You may be right but we should be careful with topology 
>> changes.
> 
> Maybe I should send these 2 patches separately, this 2nd one is actually 
> fix for a long existed issue and it is exposed to me when writing the 
> 1st commit:
> 1. the check of "if (tplg->pass != SOC_TPLG_PASS_xxx" was good and it 
> acted as the correct filter of the pass, but
> 2. the increment "tplg->pos += le32_to_cpu(hdr->size) + 
> le32_to_cpu(hdr->payload_size);" was actually wrong when it the pass is 
> unmatched in #1, it should be "tplg->pos += 
> le32_to_cpu(hdr->payload_size);" as the "hdr->size" was already 
> calculated in the upper layer in soc_tplg_load_header():
> "tplg->pos = tplg->hdr_pos + sizeof(struct snd_soc_tplg_hdr);".
> 3. the exited mistake described in #2 didn't triggered any real problems 
> as the "tplg->pos" will be reset to new value in soc_tplg_load_header() 
> when the next header comes, so increasing the "tplg->pos" here at the 
> end of the current header check actually make no sense, we can just 
> remove them.
> 
> The code changes here might make you nervous but the logic here is not 
> that complicated, if you rule out the issue I mentioned above in #2 and 
> #3, the remained changes here is only removing the checks "if 
> (tplg->pass != SOC_TPLG_PASS_xxx" as they are already covered by the 1st 
> commit.
> 
> I have tested these changes with 3 typical SOF topology files (nocodec, 
> tgl i2s + dsm, hda-generic) and it works all fine there and the correct 
> header information are logged with the changes, agree we should test 
> more extensively and widely, so tests on SST driver are very welcomed.

+ Cezary from the SST driver side.

Hi Cezary, can you help to check this from the SST driver side?

Thanks,
~Keyon

> 
> So in short, I did these changes together since I am already here, but 
> if you and Mark preferred, I can split out the fix for the "tplg->pos" 
> increment and send it ahead.
> 
> Thanks,
> ~Keyon
> 
>>
>>>
>>> Signed-off-by: Keyon Jie <yang.jie@linux.intel.com>
>>> ---
>>>   sound/soc/soc-topology.c | 46 ++--------------------------------------
>>>   1 file changed, 2 insertions(+), 44 deletions(-)
>>>
>>> diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
>>> index b3dae319c108..682ffaa85e9e 100644
>>> --- a/sound/soc/soc-topology.c
>>> +++ b/sound/soc/soc-topology.c
>>> @@ -246,8 +246,8 @@ static inline void soc_control_err(struct 
>>> soc_tplg *tplg,
>>>   }
>>>   /* pass vendor data to component driver for processing */
>>> -static int soc_tplg_vendor_load_(struct soc_tplg *tplg,
>>> -    struct snd_soc_tplg_hdr *hdr)
>>> +static int soc_tplg_vendor_load(struct soc_tplg *tplg,
>>> +                struct snd_soc_tplg_hdr *hdr)
>>>   {
>>>       int ret = 0;
>>> @@ -268,16 +268,6 @@ static int soc_tplg_vendor_load_(struct soc_tplg 
>>> *tplg,
>>>       return ret;
>>>   }
>>> -/* pass vendor data to component driver for processing */
>>> -static int soc_tplg_vendor_load(struct soc_tplg *tplg,
>>> -    struct snd_soc_tplg_hdr *hdr)
>>> -{
>>> -    if (tplg->pass != SOC_TPLG_PASS_VENDOR)
>>> -        return 0;
>>> -
>>> -    return soc_tplg_vendor_load_(tplg, hdr);
>>> -}
>>> -
>>>   /* optionally pass new dynamic widget to component driver. This is 
>>> mainly for
>>>    * external widgets where we can assign private data/ops */
>>>   static int soc_tplg_widget_load(struct soc_tplg *tplg,
>>> @@ -1127,12 +1117,6 @@ static int soc_tplg_kcontrol_elems_load(struct 
>>> soc_tplg *tplg,
>>>       int ret;
>>>       int i;
>>> -    if (tplg->pass != SOC_TPLG_PASS_MIXER) {
>>> -        tplg->pos += le32_to_cpu(hdr->size) +
>>> -            le32_to_cpu(hdr->payload_size);
>>> -        return 0;
>>> -    }
>>> -
>>>       dev_dbg(tplg->dev, "ASoC: adding %d kcontrols at 0x%lx\n", 
>>> hdr->count,
>>>           soc_tplg_get_offset(tplg));
>>> @@ -1204,14 +1188,6 @@ static int 
>>> soc_tplg_dapm_graph_elems_load(struct soc_tplg *tplg,
>>>       count = le32_to_cpu(hdr->count);
>>> -    if (tplg->pass != SOC_TPLG_PASS_GRAPH) {
>>> -        tplg->pos +=
>>> -            le32_to_cpu(hdr->size) +
>>> -            le32_to_cpu(hdr->payload_size);
>>> -
>>> -        return 0;
>>> -    }
>>> -
>>>       if (soc_tplg_check_elem_count(tplg,
>>>           sizeof(struct snd_soc_tplg_dapm_graph_elem),
>>>           count, le32_to_cpu(hdr->payload_size), "graph")) {
>>> @@ -1741,9 +1717,6 @@ static int 
>>> soc_tplg_dapm_widget_elems_load(struct soc_tplg *tplg,
>>>       count = le32_to_cpu(hdr->count);
>>> -    if (tplg->pass != SOC_TPLG_PASS_WIDGET)
>>> -        return 0;
>>> -
>>>       dev_dbg(tplg->dev, "ASoC: adding %d DAPM widgets\n", count);
>>>       for (i = 0; i < count; i++) {
>>> @@ -2101,9 +2074,6 @@ static int soc_tplg_pcm_elems_load(struct 
>>> soc_tplg *tplg,
>>>       count = le32_to_cpu(hdr->count);
>>> -    if (tplg->pass != SOC_TPLG_PASS_PCM_DAI)
>>> -        return 0;
>>> -
>>>       /* check the element size and count */
>>>       pcm = (struct snd_soc_tplg_pcm *)tplg->pos;
>>>       size = le32_to_cpu(pcm->size);
>>> @@ -2386,12 +2356,6 @@ static int soc_tplg_link_elems_load(struct 
>>> soc_tplg *tplg,
>>>       count = le32_to_cpu(hdr->count);
>>> -    if (tplg->pass != SOC_TPLG_PASS_LINK) {
>>> -        tplg->pos += le32_to_cpu(hdr->size) +
>>> -            le32_to_cpu(hdr->payload_size);
>>> -        return 0;
>>> -    }
>>> -
>>>       /* check the element size and count */
>>>       link = (struct snd_soc_tplg_link_config *)tplg->pos;
>>>       size = le32_to_cpu(link->size);
>>> @@ -2528,9 +2492,6 @@ static int soc_tplg_dai_elems_load(struct 
>>> soc_tplg *tplg,
>>>       count = le32_to_cpu(hdr->count);
>>> -    if (tplg->pass != SOC_TPLG_PASS_BE_DAI)
>>> -        return 0;
>>> -
>>>       /* config the existing BE DAIs */
>>>       for (i = 0; i < count; i++) {
>>>           dai = (struct snd_soc_tplg_dai *)tplg->pos;
>>> @@ -2610,9 +2571,6 @@ static int soc_tplg_manifest_load(struct 
>>> soc_tplg *tplg,
>>>       bool abi_match;
>>>       int ret = 0;
>>> -    if (tplg->pass != SOC_TPLG_PASS_MANIFEST)
>>> -        return 0;
>>> -
>>>       manifest = (struct snd_soc_tplg_manifest *)tplg->pos;
>>>       /* check ABI version by size, create a new manifest if abi not 
>>> match */
>>>
