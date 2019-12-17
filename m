Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C7E8F123058
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Dec 2019 16:31:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6BCE41660;
	Tue, 17 Dec 2019 16:30:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6BCE41660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576596660;
	bh=HqfaY6e05pbxFXp3zffIUsh1PxGFqumguWFVbQbPVvE=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZBLNNBlMsbr+jjXGdYjPII/oNauqsj+RWV45DbAw5iWago+fAbo4tJy4dztVHbMXL
	 CyP9y8uRvpdnvZvdjheZTOwPa5xwop6CSU5/Uj1SQfv/F0JyhnsdMQg0FRc235pbV9
	 QfPTDRoSE46dKxxn3Ytr437AoeleKyjFgB/3F2DM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 967C5F80256;
	Tue, 17 Dec 2019 16:29:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 83221F80234; Tue, 17 Dec 2019 16:29:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9CC70F8020B
 for <alsa-devel@alsa-project.org>; Tue, 17 Dec 2019 16:29:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9CC70F8020B
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Dec 2019 07:29:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,325,1571727600"; d="scan'208";a="212605786"
Received: from pbossart-mac02.an.intel.com ([10.122.138.72])
 by fmsmga008.fm.intel.com with ESMTP; 17 Dec 2019 07:29:05 -0800
To: Mark Brown <broonie@kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
References: <87woavhhfi.wl-kuninori.morimoto.gx@renesas.com>
 <87o8w7hhds.wl-kuninori.morimoto.gx@renesas.com>
 <01e4157a-d4b7-8bb2-d3bf-957d47e3e5f9@linux.intel.com>
 <87lfrbhajp.wl-kuninori.morimoto.gx@renesas.com>
 <87k16vh8d6.wl-kuninori.morimoto.gx@renesas.com>
 <20191217121308.GC4755@sirena.org.uk>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <124fd50c-db99-7a4a-9e35-ad69b5e16abc@linux.intel.com>
Date: Tue, 17 Dec 2019 07:56:28 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <20191217121308.GC4755@sirena.org.uk>
Content-Language: en-US
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
Subject: Re: [alsa-devel] [PATCH 6/6] ASoC: soc-core: add
 snd_soc_stream_stop()
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 12/17/19 6:13 AM, Mark Brown wrote:
> On Tue, Dec 17, 2019 at 01:41:09PM +0900, Kuninori Morimoto wrote:
> 
>> I noticed that soc_compr_free_fe(), dpcm_fe_dai_shutdown() are directly
>> calling SND_SOC_DAPM_STREAM_STOP without caring pmdown time / delayed work.
>> Can we use snd_soc_dapm_stream_stop() for these, too ?
> 
> That does seem like an oversight...

What would the rationale for deferring a FE shutdown though?

IIRC in the Intel machine drivers we only use .pm_ignore_downtime to 
backends to keep some clocks on, and even that is questionable (the 
clock dependencies should be properly modeled instead of hidden with an 
obscure dailink setting). When I asked why exactly this flag was set in 
most cases the reason why 'because others did so in the past'...


_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
