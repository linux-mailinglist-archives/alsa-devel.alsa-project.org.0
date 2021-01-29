Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7306D308E3C
	for <lists+alsa-devel@lfdr.de>; Fri, 29 Jan 2021 21:18:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 114221685;
	Fri, 29 Jan 2021 21:17:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 114221685
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611951528;
	bh=MRvLeL7hwqh1FCnFKeNKubpImbPx8nP6UEELc9njYcg=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=L64TiJHUsUQ/8WbArkT5/qauTi7SqDNxY7KLhpmaoPEBn4B+La13ex+zGHd2P/lN3
	 9SCIc1fmbcDjXOvUNcYlyjdq1nlC69AYXJub2X0ovWpa9U8VZxAyc1g4VxxXV8OPoj
	 H4IAyXCUBsgdbzLNuZX9E2GQuZ2q2mQCoTQMd9Mo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 59868F8025F;
	Fri, 29 Jan 2021 21:17:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A14B4F8026B; Fri, 29 Jan 2021 21:17:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 838F1F80218
 for <alsa-devel@alsa-project.org>; Fri, 29 Jan 2021 21:17:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 838F1F80218
IronPort-SDR: ePXKU+ejYSbz3xPYESHFvVFPPyAVBVX9camg7UFbi/I69dlmpXB0JjJ+u/0desf1vzBfd44amo
 iDZSqQeDrMYg==
X-IronPort-AV: E=McAfee;i="6000,8403,9879"; a="177916007"
X-IronPort-AV: E=Sophos;i="5.79,386,1602572400"; d="scan'208";a="177916007"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2021 12:17:04 -0800
IronPort-SDR: HULWv+4oCxXM5ywY8ZWbeu8rPHsujEmyJYRoLepbouLQxVkyWOKhES8vSMDi+et+Mi7Nkrp5uN
 uw1KbC9VffEg==
X-IronPort-AV: E=Sophos;i="5.79,386,1602572400"; d="scan'208";a="431149972"
Received: from kagerrar-mobl.amr.corp.intel.com (HELO [10.212.16.186])
 ([10.212.16.186])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2021 12:17:03 -0800
Subject: Re: [PATCH 1/6] soundwire: qcom: add support to missing transport
 params
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, vkoul@kernel.org
References: <20210129173248.5941-1-srinivas.kandagatla@linaro.org>
 <20210129173248.5941-2-srinivas.kandagatla@linaro.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <29eb1b75-d92f-9641-8181-1fe250b189ec@linux.intel.com>
Date: Fri, 29 Jan 2021 13:20:38 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210129173248.5941-2-srinivas.kandagatla@linaro.org>
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


>   struct qcom_swrm_port_config {
>   	u8 si;
>   	u8 off1;
>   	u8 off2;
>   	u8 bp_mode;
> +	u8 hstart;
> +	u8 hstop;
> +	u8 word_length;
> +	u8 bgp_count;

I couldn't figure out what 'bgp' was and had to search. Not sure how you 
came up with this abbreviation of "qcom,ports-block-group-count". Adding 
a comment wouldn't hurt.

> +	u8 lane_control;

Are you able to use lane_control != 0 ? I thought we were missing stuff 
at the bus.c level?

