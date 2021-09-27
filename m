Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9420F419F99
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Sep 2021 21:55:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1F8B216A4;
	Mon, 27 Sep 2021 21:55:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1F8B216A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632772552;
	bh=f2eIk/XKNkAUcsKAULARwYcninFyYHb7o+Ja79TDf6w=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FTu5ht9yu/ACoO9aUXcD3fIioql4hC98prgA+kwA020QJ5Z1IVoBV1GJktKmozuwf
	 WSf/CwKY7xnv7hEfNU/cHLNFVjEKHF4FicI8PtRN2jnro/0AA8BfghZVTRwqANgtiE
	 wWQL0lppRyZDE2Ok/glNlws+l8vYAP6MZLd36dtQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 42BF6F804FB;
	Mon, 27 Sep 2021 21:53:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6E5DBF804FC; Mon, 27 Sep 2021 21:53:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DATE_IN_PAST_03_06,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5FE49F8026D
 for <alsa-devel@alsa-project.org>; Mon, 27 Sep 2021 21:53:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5FE49F8026D
X-IronPort-AV: E=McAfee;i="6200,9189,10120"; a="211802395"
X-IronPort-AV: E=Sophos;i="5.85,327,1624345200"; d="scan'208";a="211802395"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2021 12:53:02 -0700
X-IronPort-AV: E=Sophos;i="5.85,327,1624345200"; d="scan'208";a="486268040"
Received: from asen4-mobl2.amr.corp.intel.com (HELO [10.212.27.2])
 ([10.212.27.2])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2021 12:53:00 -0700
Subject: Re: [PATCH v8 00/22] ASoC: qcom: Add AudioReach support
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 bjorn.andersson@linaro.org, broonie@kernel.org, robh@kernel.org
References: <20210927135559.738-1-srinivas.kandagatla@linaro.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <603b8650-d6cb-74e0-b6bd-3b650c6bd194@linux.intel.com>
Date: Mon, 27 Sep 2021 11:32:26 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210927135559.738-1-srinivas.kandagatla@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, tiwai@suse.de, plai@codeaurora.org,
 lgirdwood@gmail.com
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




> Srinivas Kandagatla (22):
>   soc: dt-bindings: qcom: apr: convert to yaml
>   soc: dt-bindings: qcom: apr: deprecate qcom,apr-domain property
>   soc: qcom: apr: make code more reuseable
>   soc: dt-bindings: qcom: add gpr bindings
>   soc: qcom: apr: Add GPR support
>   ASoC: dt-bindings: move LPASS dai related bindings out of q6afe
>   ASoC: dt-bindings: move LPASS clocks related bindings out of q6afe
>   ASoC: dt-bindings: rename q6afe.h to q6dsp-lpass-ports.h
>   ASoC: qdsp6: q6afe-dai: move lpass audio ports to common file
>   ASoC: qdsp6: q6afe-clocks: move audio-clocks to common file
>   ASoC: dt-bindings: q6dsp: add q6apm-lpass-dai compatible
>   ASoC: dt-bindings: lpass-clocks: add q6prm clocks compatible
>   ASoC: dt-bindings: add q6apm digital audio stream bindings
>   ASoC: qdsp6: audioreach: add basic pkt alloc support
>   ASoC: qdsp6: audioreach: add q6apm support
>   ASoC: qdsp6: audioreach: add module configuration command helpers
>   ASoC: qdsp6: audioreach: add Kconfig and Makefile
>   ASoC: qdsp6: audioreach: add topology support
>   ASoC: qdsp6: audioreach: add q6apm-dai support
>   ASoC: qdsp6: audioreach: add q6apm lpass dai support
>   ASoC: qdsp6: audioreach: add q6prm support
>   ASoC: qdsp6: audioreach: add support for q6prm-clocks

I added a couple of minor comments, at this point other reviewers should
start looking at this patchset.

For patches 5, 9, 10, 14..22 (everything except dt-bindings which I
didn't even look at):

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>


