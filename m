Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E5CD1308E42
	for <lists+alsa-devel@lfdr.de>; Fri, 29 Jan 2021 21:19:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2EAB316B4;
	Fri, 29 Jan 2021 21:18:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2EAB316B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611951589;
	bh=umBlcfJaBqGCq8S2ESGQl60p0x7bnma6bKwK180tImI=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RDHgzSU6WDJx6rmfvaMDH2fzTXZpB+v53k3MuMyid6kKvhM4LWOZAt+r3v5zFtZ9Y
	 D5uWSq32kjWya/L7jg1uKVjvJmgIZDKCbb+Bp/Xa/Y7z57v1iq7UDwibEEMRm7aEKM
	 cOupZnvV1iXkaVsq6hdpYozEwIbWoeArm34/KJOE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 590D5F804CC;
	Fri, 29 Jan 2021 21:17:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8C051F800EB; Fri, 29 Jan 2021 21:17:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 643ACF8025F
 for <alsa-devel@alsa-project.org>; Fri, 29 Jan 2021 21:17:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 643ACF8025F
IronPort-SDR: Ms1Q7IsYNQNQQyHVq2X7A/ufLZ8eR4HIKgDx0uUlmDAptd1eM00LlMGEdl8ZaLClbSe9yxD2rl
 +/qNDJwXKo7w==
X-IronPort-AV: E=McAfee;i="6000,8403,9879"; a="177916022"
X-IronPort-AV: E=Sophos;i="5.79,386,1602572400"; d="scan'208";a="177916022"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2021 12:17:10 -0800
IronPort-SDR: 4iUoTLsK6X6g3lCJu8TKhFGnkmMJ+ssQqrjiJ2apzIBjEOVNvNLlzfm/RfwI8AJ6DkiWcFMtIA
 rR9Z1034pxSw==
X-IronPort-AV: E=Sophos;i="5.79,386,1602572400"; d="scan'208";a="431150014"
Received: from kagerrar-mobl.amr.corp.intel.com (HELO [10.212.16.186])
 ([10.212.16.186])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2021 12:17:09 -0800
Subject: Re: [PATCH 6/6] soundwire: qcom: add support to new interrupts
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, vkoul@kernel.org
References: <20210129173248.5941-1-srinivas.kandagatla@linaro.org>
 <20210129173248.5941-7-srinivas.kandagatla@linaro.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <95d3b143-6ba7-e6eb-4f44-9a8bb05b7fb7@linux.intel.com>
Date: Fri, 29 Jan 2021 13:38:48 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210129173248.5941-7-srinivas.kandagatla@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: sanyog.r.kale@intel.com, alsa-devel@alsa-project.org,
 yung-chuan.liao@linux.intel.com, linux-kernel@vger.kernel.org
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



On 1/29/21 11:32 AM, Srinivas Kandagatla wrote:
> Add support to new interrupts and update irq routine in a way
> to deal with multiple pending interrupts with in a single interrupt!

I can't parse the wording after 'update irq routine'.


> +	swrm->reg_write(swrm, SWRM_INTERRUPT_CLEAR, intr_sts);
> +	swrm->reg_write(swrm, SWRM_INTERRUPT_CLEAR, 0x0);

what does this second write 0x0 do? Usually interrupts are W1C, and you 
didn't have this before.

