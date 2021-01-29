Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C5BE1308E3E
	for <lists+alsa-devel@lfdr.de>; Fri, 29 Jan 2021 21:19:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9ABA516A5;
	Fri, 29 Jan 2021 21:18:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9ABA516A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611951539;
	bh=hqYiiihv/m3uB3I8isIp7FdXXqFnWtBi1qzO5ZuOAJE=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YYAzLxtoilNxdSgUKp0EIQrFGaf3lXt3uyfBmNzdXFnLBeeEPXj90H6+mAOfW+GbQ
	 CHeMcYiJ2JOpg4qz43kamvrXq1mHF+AjQUb8XPCZhVOZCswASKPbdG1yYlqNBp2PMe
	 nUHg+InPMP1UMwlOBb+9k9mlRHKcCOL0NGHgI5bQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 00E48F8026B;
	Fri, 29 Jan 2021 21:17:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AE4D0F800EB; Fri, 29 Jan 2021 21:17:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 806CAF800EB
 for <alsa-devel@alsa-project.org>; Fri, 29 Jan 2021 21:17:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 806CAF800EB
IronPort-SDR: 8RfP8VkHEPJpSFuUrAHX+kgVnm24QSnzNjPKdAgyHu07asapKrwRqP9Rn2+Lptw5CoToMoUfon
 TSPusrvWJU+g==
X-IronPort-AV: E=McAfee;i="6000,8403,9879"; a="177916014"
X-IronPort-AV: E=Sophos;i="5.79,386,1602572400"; d="scan'208";a="177916014"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2021 12:17:06 -0800
IronPort-SDR: bX7zwAyHAz1U/uXbMTOCh7Oznrc8J8hBPGDCjl3a5vNQiXilCQuGyUVE9xVxKAZUhbq52PWJq0
 2lETdK5o7PSg==
X-IronPort-AV: E=Sophos;i="5.79,386,1602572400"; d="scan'208";a="431149988"
Received: from kagerrar-mobl.amr.corp.intel.com (HELO [10.212.16.186])
 ([10.212.16.186])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2021 12:17:05 -0800
Subject: Re: [PATCH 3/6] soundwire: qcom: set continue execution flag for
 ignored commands
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, vkoul@kernel.org
References: <20210129173248.5941-1-srinivas.kandagatla@linaro.org>
 <20210129173248.5941-4-srinivas.kandagatla@linaro.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <f475b33b-94e3-bcd9-51a9-ecf786baa15a@linux.intel.com>
Date: Fri, 29 Jan 2021 13:21:19 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210129173248.5941-4-srinivas.kandagatla@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: sanyog.r.kale@intel.com, yung-chuan.liao@linux.intel.com,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
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
> version 1.5.1 and higher IPs of this controller required to set
> continue execution on ingored command flag. This patch sets this flag.

typo: ignored.
