Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B16B1B610B
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Apr 2020 18:34:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1D2041694;
	Thu, 23 Apr 2020 18:33:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1D2041694
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587659679;
	bh=LRmSBqlVzKuUDLo0t5mUMVrENaKCqbfRKHe1PTXyH5E=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=F1wZDbM0KOGG1cLHmHFmMkuZ6JddVtiVMTP+qsTXvUSd5lfC2NIUlLHx6nGAILmE7
	 9Bdb0HCcnJf8GTbYYom6v9E2CY3cCGIwHgUay9SOBXgu3FgVxyL5V6bjDK1UGBpO7v
	 hbUQJJl0eS90PfVbXW7PvSNhFNo+Bw/owFBjJOdY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6A767F802A7;
	Thu, 23 Apr 2020 18:30:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 25543F8029B; Thu, 23 Apr 2020 18:30:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B3E3BF801F5
 for <alsa-devel@alsa-project.org>; Thu, 23 Apr 2020 18:30:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B3E3BF801F5
IronPort-SDR: 5kLzuEtYwMXdFS6uKVya+lCJIUc+qaykYiG/87ii+bx/+/DKk6tdEanHlBlYfYrd5/gv15O9DS
 6Lrn2ywGuhbQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2020 09:30:05 -0700
IronPort-SDR: P/IKBvGBN0OJfX9s5EqCED5xZwrjOal4Cx6iNZR2ygrPQKtxjkizPuWSjWrv5oDbJQCuSKtS5U
 5NTQeuvktT9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,307,1583222400"; d="scan'208";a="256040271"
Received: from lsatpatx-mobl.gar.corp.intel.com (HELO [10.251.150.156])
 ([10.251.150.156])
 by orsmga003.jf.intel.com with ESMTP; 23 Apr 2020 09:30:05 -0700
Subject: Re: [PATCH v3 2/3] ASoC: Intel: Multiple I/O PCM format support for
 pipe
To: Mateusz Gorski <mateusz.gorski@linux.intel.com>,
 alsa-devel@alsa-project.org
References: <20200423111148.6977-1-mateusz.gorski@linux.intel.com>
 <20200423111148.6977-3-mateusz.gorski@linux.intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <e13f51b7-da52-ad7a-d000-1c0099cbf21d@linux.intel.com>
Date: Thu, 23 Apr 2020 10:49:54 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200423111148.6977-3-mateusz.gorski@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: cezary.rojewski@intel.com, broonie@kernel.org, tiwai@suse.com,
 Pavan K <pavan.k.s@intel.com>
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



> +static int skl_tplg_multi_config_get(struct snd_kcontrol *kcontrol,
> +			struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_soc_component *component =
> +		snd_soc_kcontrol_component(kcontrol);
> +	struct hdac_bus *bus = snd_soc_component_get_drvdata(component);
> +	struct skl_dev *skl = bus_to_skl(bus);
> +	struct skl_pipeline *ppl;
> +	struct skl_pipe *pipe = NULL;
> +	u32 *pipe_id;
> +	struct soc_enum *ec = (struct soc_enum *)kcontrol->private_value;
> +
> +	if (!ec)
> +		return -EINVAL;
> +
> +	pipe_id = ec->dobj.private;
> +
> +	list_for_each_entry(ppl, &skl->ppl_list, node) {
> +		if (ppl->pipe->ppl_id == *pipe_id) {
> +			pipe = ppl->pipe;
> +			break;
> +		}
> +	}
> +	if (!pipe)
> +		return -EIO;
> +
> +	ucontrol->value.enumerated.item[0]  =  pipe->pipe_config_idx;

maybe one nit-pick is that there is a one-line difference between the 
_set and _get functions, and it might be simpler to use a common helper 
with a boolean flag used at the end to do this:

 > +	ucontrol->value.enumerated.item[0]  =  pipe->pipe_config_idx;

or that:

 > +	pipe->pipe_config_idx = ucontrol->value.enumerated.item[0];
