Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EB43299AC2
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Oct 2020 00:38:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CC4DC16C9;
	Tue, 27 Oct 2020 00:37:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CC4DC16C9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603755493;
	bh=wX6qipN5hVdLE91Uhd6CAeajjSznKARIayFzJi6+S4Q=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YniiNlXEsqv87ZetYlhqU6bEkgvyBSeeKZtzdheWvDskjTVLp0QcWQQr+pJqeBBBk
	 FujOFLh9UQ45iLp0RQdimIoKZoEtAok/zpzoWigrAehngf1o4sJu4WVRVJ04BBkkef
	 Bmf2rMtaMTS7KDAQWD9emimhkdXyYp7W7BSJjFeg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 09DDFF8028B;
	Tue, 27 Oct 2020 00:35:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EA060F801D5; Tue, 27 Oct 2020 00:35:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DATE_IN_PAST_03_06,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 26804F8026D
 for <alsa-devel@alsa-project.org>; Tue, 27 Oct 2020 00:35:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 26804F8026D
IronPort-SDR: 77UvYeuFPn/cQkVg9Y9Pb4Abp0IXvgrjVKBfwo5G/j848zlbdhcTVQE5ICHRh1uHNLx9NT/Ack
 9KsMhP0PqVyQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9786"; a="167220029"
X-IronPort-AV: E=Sophos;i="5.77,421,1596524400"; d="scan'208";a="167220029"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2020 16:35:35 -0700
IronPort-SDR: xhntSIvCFsesKXT9kxPtkP1xvtKAiWcb5uP5guYIIjWIEGv4qc3BQyOhlR9kz0IwuJd4xR3WB9
 SlqebZLZZYqg==
X-IronPort-AV: E=Sophos;i="5.77,421,1596524400"; d="scan'208";a="524475083"
Received: from tanguye1-mobl2.amr.corp.intel.com (HELO [10.209.126.195])
 ([10.209.126.195])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2020 16:35:34 -0700
Subject: Re: [PATCH v1 6/6] ASoC: codecs: lpass-va-macro: add dapm widgets and
 routes
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, broonie@kernel.org
References: <20201026141945.19707-1-srinivas.kandagatla@linaro.org>
 <20201026141945.19707-7-srinivas.kandagatla@linaro.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <55ba8a1a-df67-8451-dedd-49e6c0cf82a6@linux.intel.com>
Date: Mon, 26 Oct 2020 15:01:52 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201026141945.19707-7-srinivas.kandagatla@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 spapothi@codeaurora.org, plai@codeaurora.org, lgirdwood@gmail.com
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


> +static int va_dmic_clk_enable(struct snd_soc_component *component,
> +			      u32 dmic, bool enable)
> +{
> +	struct va_macro *va = snd_soc_component_get_drvdata(component);
> +	u8  dmic_clk_en = 0x01;
> +	u16 dmic_clk_reg = 0;
> +	s32 *dmic_clk_cnt = NULL;
> +	u8 *dmic_clk_div = NULL;
> +	u8 freq_change_mask = 0;

the 4 initializations above are ignored, remove?

