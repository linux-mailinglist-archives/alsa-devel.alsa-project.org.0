Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 26A242177F5
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jul 2020 21:29:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AFDF816CB;
	Tue,  7 Jul 2020 21:28:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AFDF816CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594150162;
	bh=3Dmo2V5uNXyJmKc6NbpGB1/B/HchRW7Q9e8SPJx+gdU=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fFp4O6MFopIH372JK/tERnAHMTMhs6JXla5qkcIG1AqMu4cwHKlwKj2+qdzCDpra6
	 ijKUmhDYErYaWPaiP8FKvPkd7EFUZH17g8NFe6zcE99YipKJBKifxpskK0SQiogwUO
	 WTT2VOXfceSddj7qOKU0wPbH5x2nCeyZYu/eoXL4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9884BF80264;
	Tue,  7 Jul 2020 21:26:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 24F06F80257; Tue,  7 Jul 2020 21:26:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9AC73F801F9
 for <alsa-devel@alsa-project.org>; Tue,  7 Jul 2020 21:26:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9AC73F801F9
IronPort-SDR: oQjZb8Ti++h9pZZFYnKGgGHR0ajIEGTonlQhMyfWtti7Yvict7qNZuWJqp9m5/eXpsKr/uiADm
 4AOLXE2099XQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9675"; a="146751731"
X-IronPort-AV: E=Sophos;i="5.75,324,1589266800"; d="scan'208";a="146751731"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2020 12:26:47 -0700
IronPort-SDR: 9li1rqbK/QdwedKg4BVTGrrBeOzWqQZc81aCjJ7zwNf7tqs0nv+wlUeHkqg+KbHwLekN8Ao+Zg
 MYQFvRCrCaEQ==
X-IronPort-AV: E=Sophos;i="5.75,324,1589266800"; d="scan'208";a="297493435"
Received: from mrtorger-mobl1.amr.corp.intel.com (HELO [10.254.77.62])
 ([10.254.77.62])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2020 12:26:46 -0700
Subject: Re: [PATCH 06/11] ASoC: q6asm: add support to remove intial and
 trailing silence
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, broonie@kernel.org
References: <20200707163641.17113-1-srinivas.kandagatla@linaro.org>
 <20200707163641.17113-7-srinivas.kandagatla@linaro.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <dd0d970e-109f-9a41-f2b9-a970e4d20caa@linux.intel.com>
Date: Tue, 7 Jul 2020 11:55:04 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200707163641.17113-7-srinivas.kandagatla@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, ckeepax@opensource.cirrus.com,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org, tiwai@suse.com,
 vkoul@kernel.org
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




> +int q6asm_stream_remove_initial_silence(struct audio_client *ac,
> +					uint32_t stream_id,
> +					uint32_t initial_samples)
> +{
> +	return q6asm_stream_remove_silence(ac, stream_id,
> +					   ASM_DATA_CMD_REMOVE_INITIAL_SILENCE,
> +					   initial_samples);
> +}
> +EXPORT_SYMBOL_GPL(q6asm_stream_remove_initial_silence);
> +
> +int q6asm_stream_remove_trailing_silence(struct audio_client *ac, uint32_t stream_id,
> +					 uint32_t trailing_samples)
> +{
> +	return q6asm_stream_remove_silence(ac, stream_id,
> +				   ASM_DATA_CMD_REMOVE_TRAILING_SILENCE,
> +				   trailing_samples);
> +}
> +EXPORT_SYMBOL_GPL(q6asm_stream_remove_trailing_silence);

do you need those wrappers? Might as well call the _remove_silence() 
function with the right parameters, no?
