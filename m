Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B82A3211155
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Jul 2020 18:55:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 504671681;
	Wed,  1 Jul 2020 18:54:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 504671681
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593622502;
	bh=4fO+hShqd6T5hyEouFHwwq7Ff5Ebn1s4TFbe8dQ1G24=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JfDwF7I0oivOpVOBs/hrl6U/50GPRKAKbAsB+Idpmx4AYnfzJFzMWokBERcD0Yqae
	 0tGFk929tT9Q+BwJFnkjrkW0yrulU93GI39ripPPcRIULws4Qmd8t20o1oJR8XJ2hQ
	 T+60EMt0ncSF5W//jaHQxfVRsgztmHkJAun9E48c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 54FCDF8025F;
	Wed,  1 Jul 2020 18:52:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6DF99F80256; Wed,  1 Jul 2020 18:52:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 10F9EF801D8
 for <alsa-devel@alsa-project.org>; Wed,  1 Jul 2020 18:52:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 10F9EF801D8
IronPort-SDR: xBtVxGmJCNcZpbCtS8wJom2XMQ6qkAJ2zMOlVLRfwb9IPrydjVSp6hokb8sDcYwezB+uQkJDNZ
 +qGJKP8JXwwg==
X-IronPort-AV: E=McAfee;i="6000,8403,9669"; a="211695222"
X-IronPort-AV: E=Sophos;i="5.75,301,1589266800"; d="scan'208";a="211695222"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2020 09:52:28 -0700
IronPort-SDR: qnLvnsx2iJjrrhrOL7t6HmOYc7ESPbyuG2xMXcBX4XmJe3r0tK9UCyP7bO5GxtEKT0zGAN9/Xw
 grdrK6OdSf3g==
X-IronPort-AV: E=Sophos;i="5.75,301,1589266800"; d="scan'208";a="455168915"
Received: from dsapozni-mobl1.amr.corp.intel.com (HELO [10.251.16.243])
 ([10.251.16.243])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2020 09:52:27 -0700
Subject: Re: [PATCH v2] ASoC: Intel: bxt-da7219-max98357a: support MAX98390
 speaker amp
To: Brent Lu <brent.lu@intel.com>, alsa-devel@alsa-project.org
References: <1593596211-28344-1-git-send-email-brent.lu@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <75943b1d-4f63-7532-205a-1c0d6379c7d5@linux.intel.com>
Date: Wed, 1 Jul 2020 10:49:22 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <1593596211-28344-1-git-send-email-brent.lu@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Jason Yan <yanaijie@huawei.com>, linux-kernel@vger.kernel.org,
 Jie Yang <yang.jie@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mac Chiang <mac.chiang@intel.com>, Mark Brown <broonie@kernel.org>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Amery Song <chao.song@intel.com>, Naveen Manohar <naveen.m@intel.com>,
 Libin Yang <libin.yang@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>, Yong Zhi <yong.zhi@intel.com>
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



On 7/1/20 4:36 AM, Brent Lu wrote:
> Support MAX98390 speaker amplifier on cometlake platform. Driver now
> detects amplifier type in the probe function and installs corresponding
> controls and DAPM widgets/routes in the late_probe function.
> 
> Signed-off-by: Brent Lu <brent.lu@intel.com>

Looks good to me know, thanks Brent

Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

