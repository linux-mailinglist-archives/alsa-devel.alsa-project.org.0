Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4525C461BCE
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Nov 2021 17:34:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 70B391AD3;
	Mon, 29 Nov 2021 17:33:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 70B391AD3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638203670;
	bh=klni9QshFvbz4H0AwU3b77R+JTBot5s8fldyEV6uMqA=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pWmtIKi8zbrKjHSXVc6MVtOJmouNf8DUcghgQmz23/F9Ib1+3ixCiUML48BOdL4qo
	 kQsab4OxYPtew6phwSzU2tQiogOwXoeHvtNpy5fvE1JypKI4yjQfbMQWBzeyaUsmjV
	 F7f4z74fVAbzsrEehSKbEbdgz7dB0fECRLbVzPhc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8FDB7F80254;
	Mon, 29 Nov 2021 17:32:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E27E1F80217; Mon, 29 Nov 2021 17:32:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A3508F8020D
 for <alsa-devel@alsa-project.org>; Mon, 29 Nov 2021 17:32:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A3508F8020D
X-IronPort-AV: E=McAfee;i="6200,9189,10183"; a="322241104"
X-IronPort-AV: E=Sophos;i="5.87,273,1631602800"; d="scan'208";a="322241104"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2021 08:32:06 -0800
X-IronPort-AV: E=Sophos;i="5.87,273,1631602800"; d="scan'208";a="676418452"
Received: from ticela-nm-11.amr.corp.intel.com (HELO [10.212.98.225])
 ([10.212.98.225])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2021 08:32:05 -0800
Subject: Re: [PATCH 0/5] ASoC: soc-pcm: tidyup soc_pcm_pointer()'s delay
 update method
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Mark Brown <broonie@kernel.org>
References: <877dd8y26l.wl-kuninori.morimoto.gx@renesas.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <fdb7e017-bc14-b31d-01d0-7f40153e71f9@linux.intel.com>
Date: Mon, 29 Nov 2021 09:43:59 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <877dd8y26l.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jie Yang <yang.jie@linux.intel.com>,
 Linux-ALSA <alsa-devel@alsa-project.org>, Takashi Iwai <tiwai@suse.com>,
 Hans de Goede <hdegoede@redhat.com>, Gu Shengxian <gushengxian@yulong.com>
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


> Current soc_pcm_pointer() is checking runtime->delay,
> but it might be updated silently by component's .point callback.
> It is strange and difficult to find/know the issue.
> 
> This patch adds .delay callback for component, and solve the issue.
> 
> Kuninori Morimoto (5):
>   ASoC: soc-dai: update snd_soc_dai_delay() to snd_soc_pcm_dai_delay()
>   ASoC: soc-component: add snd_soc_pcm_component_delay()
>   ASoC: amd: acp-pcm-dma: add .delay support
>   ASoC: intel: sst-mfld-platform-pcm: add .delay support
>   ASoC: soc-pcm: tidyup soc_pcm_pointer()'s delay update method

For the series:

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
