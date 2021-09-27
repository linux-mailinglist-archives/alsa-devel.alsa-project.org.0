Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B29AB419156
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Sep 2021 11:10:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 26FCB165D;
	Mon, 27 Sep 2021 11:10:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 26FCB165D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632733850;
	bh=Yt/lvnbtpxKZSxFy8Ez9wJhmVr8GlhuRbCNhF1pg8rg=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=N1yVIl1OIIWZ8iT1kQ7WxrjW9KxKc2zCnuNtvpn5h4oW2X4ahCcNvuTfStDdWjBT3
	 fHOcT6MgZbg/rwWdKntBXFIrJdeWMvQu8GWiaKgrY9ISsrBFQA+PcH7VCuYK2PJ314
	 I+hWvdD53jh14zsmvketjMOZz7kGLGEAAD0KEK+g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6CE34F8026D;
	Mon, 27 Sep 2021 11:09:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0D774F80227; Mon, 27 Sep 2021 11:09:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5B98BF80161
 for <alsa-devel@alsa-project.org>; Mon, 27 Sep 2021 11:09:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5B98BF80161
X-IronPort-AV: E=McAfee;i="6200,9189,10119"; a="288102269"
X-IronPort-AV: E=Sophos;i="5.85,326,1624345200"; d="scan'208";a="288102269"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2021 02:09:20 -0700
X-IronPort-AV: E=Sophos;i="5.85,326,1624345200"; d="scan'208";a="518490283"
Received: from unknown (HELO [10.251.220.221]) ([10.251.220.221])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2021 02:09:17 -0700
Message-ID: <1ab40375-57fd-a3c6-68d7-9db78a20ed6e@linux.intel.com>
Date: Mon, 27 Sep 2021 12:09:20 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.1
Subject: Re: [PATCH v2 10/12] ASoC: SOF: Intel: hda: make sure DAI widget is
 set up before IPC
Content-Language: en-US
To: Daniel Baluta <daniel.baluta@gmail.com>
References: <20210917143659.401102-1-daniel.baluta@oss.nxp.com>
 <20210917143659.401102-11-daniel.baluta@oss.nxp.com>
 <203bf6cd-6407-f01d-52c3-e399d06cb3f6@linux.intel.com>
 <b90eff84-b56c-7764-a5bb-f1e07db57cc3@linux.intel.com>
 <ab4ea50f-9149-3468-ce2b-7cd421095b40@linux.intel.com>
 <CAEnQRZDmubE9aLG+7YtTeRTB2euqGpRh8FWqtgV5+h3H3M8JGA@mail.gmail.com>
From: =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <CAEnQRZDmubE9aLG+7YtTeRTB2euqGpRh8FWqtgV5+h3H3M8JGA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 Linux-ALSA <alsa-devel@alsa-project.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Daniel Baluta <daniel.baluta@oss.nxp.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Mark Brown <broonie@kernel.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>
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

Hi Daniel,

On 24/09/2021 10:42, Daniel Baluta wrote:
> On Thu, Sep 23, 2021 at 4:04 PM Péter Ujfalusi
> <peter.ujfalusi@linux.intel.com> wrote:
>>
>>
>>
>> On 23/09/2021 15:58, Pierre-Louis Bossart wrote:
>>>
>>>>> +static struct sof_ipc_dai_config *hda_dai_update_config(struct snd_soc_dapm_widget *w,
>>>>> +                                                   int channel)
>>>>>  {
>>>>> +   struct snd_sof_widget *swidget = w->dobj.private;
>>>>>     struct sof_ipc_dai_config *config;
>>>>>     struct snd_sof_dai *sof_dai;
>>>>> -   struct sof_ipc_reply reply;
>>>>> -   int ret = 0;
>>>>>
>>>>> -   list_for_each_entry(sof_dai, &hda_stream->sdev->dai_list, list) {
>>>>> -           if (!sof_dai->cpu_dai_name)
>>>>> -                   continue;
>>>>> +   if (!swidget) {
>>>>> +           dev_err(swidget->scomp->dev, "error: No private data for widget %s\n", w->name);
>>>>
>>>> NULL pointer dereference, just return NULL without the print. The caller
>>>> is printing anyways.
>>>
>>> yes good catch, we need a v3 with the fixes suggested by Peter in
>>> https://github.com/thesofproject/linux/pull/3171/ applied.
>>
>> Only the second patch in the PR is applicable for upstream, but it
>> should be squashed in for v3.
> 
> Thanks Peter, will squash this in and send v3.

As we discussed, I'll send the v3 with the fix.

Thanks for sending the initial versions upstream!

-- 
Péter
