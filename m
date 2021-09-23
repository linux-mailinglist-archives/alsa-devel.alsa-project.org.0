Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D718F415F14
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Sep 2021 15:00:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5A05315F2;
	Thu, 23 Sep 2021 14:59:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5A05315F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632402010;
	bh=kNss1sGn/Cg4j27KfyPFj48927IjxE3yUIdZFP/iATY=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JXHWEPJY9pe6Q1lP5p1U72ci2tnhkQwqtC6I95ig96ObHpDX3gqEt++8A/ZZ583Ps
	 wVaXWekJ6jadLxQzZJfW2FICrYu7fBwORCk7bNj88/0FpROZHfY4Sh22n8xb94KWZX
	 aMTITGz4lynUZkXwRdBreaBAHb9QBJg5BG41JgBE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A04CCF8026A;
	Thu, 23 Sep 2021 14:58:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F024CF80268; Thu, 23 Sep 2021 14:58:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6F339F8013F
 for <alsa-devel@alsa-project.org>; Thu, 23 Sep 2021 14:58:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6F339F8013F
X-IronPort-AV: E=McAfee;i="6200,9189,10115"; a="284845395"
X-IronPort-AV: E=Sophos;i="5.85,316,1624345200"; d="scan'208";a="284845395"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2021 05:58:40 -0700
X-IronPort-AV: E=Sophos;i="5.85,316,1624345200"; d="scan'208";a="558348226"
Received: from upatel2-mobl.amr.corp.intel.com (HELO [10.251.134.231])
 ([10.251.134.231])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2021 05:58:39 -0700
Subject: Re: [PATCH v2 10/12] ASoC: SOF: Intel: hda: make sure DAI widget is
 set up before IPC
To: =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 Daniel Baluta <daniel.baluta@oss.nxp.com>, broonie@kernel.org
References: <20210917143659.401102-1-daniel.baluta@oss.nxp.com>
 <20210917143659.401102-11-daniel.baluta@oss.nxp.com>
 <203bf6cd-6407-f01d-52c3-e399d06cb3f6@linux.intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <b90eff84-b56c-7764-a5bb-f1e07db57cc3@linux.intel.com>
Date: Thu, 23 Sep 2021 07:58:36 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <203bf6cd-6407-f01d-52c3-e399d06cb3f6@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 alsa-devel@alsa-project.org, kai.vehmanen@linux.intel.com,
 linux-kernel@vger.kernel.org, ranjani.sridharan@linux.intel.com,
 lgirdwood@gmail.com, daniel.baluta@nxp.com
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


>> +static struct sof_ipc_dai_config *hda_dai_update_config(struct snd_soc_dapm_widget *w,
>> +							int channel)
>>  {
>> +	struct snd_sof_widget *swidget = w->dobj.private;
>>  	struct sof_ipc_dai_config *config;
>>  	struct snd_sof_dai *sof_dai;
>> -	struct sof_ipc_reply reply;
>> -	int ret = 0;
>>  
>> -	list_for_each_entry(sof_dai, &hda_stream->sdev->dai_list, list) {
>> -		if (!sof_dai->cpu_dai_name)
>> -			continue;
>> +	if (!swidget) {
>> +		dev_err(swidget->scomp->dev, "error: No private data for widget %s\n", w->name);
> 
> NULL pointer dereference, just return NULL without the print. The caller
> is printing anyways.

yes good catch, we need a v3 with the fixes suggested by Peter in
https://github.com/thesofproject/linux/pull/3171/ applied.
