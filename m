Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E1D146083AE
	for <lists+alsa-devel@lfdr.de>; Sat, 22 Oct 2022 04:41:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 63FF18E52;
	Sat, 22 Oct 2022 04:41:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 63FF18E52
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666406510;
	bh=F2EHR+886Fkx6oIBJ7t6GLz64cS0vgAI77lAZDY05+M=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vGXRXnci3LGODEJrkmNzXlnkwLNElfW91VkLzY4BjyH4VskoE4Qk0nWkuWlxBehw1
	 RfAXTdls/AqyDDWIajg7IjEyfrNRQggv5smHpHk7D7jGZNsyW3b66dL/T8O4pc4xhk
	 JbRVXvTJKo5g66ofQ/HGa15WvmB68Z/lnIHtch68=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DD89FF802DB;
	Sat, 22 Oct 2022 04:40:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 31EDCF80134; Sat, 22 Oct 2022 04:40:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DATE_IN_PAST_06_12, DKIM_SIGNED,
 DKIM_VALID,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D3157F80134
 for <alsa-devel@alsa-project.org>; Sat, 22 Oct 2022 04:40:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D3157F80134
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="aAZFgMWQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666406452; x=1697942452;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=F2EHR+886Fkx6oIBJ7t6GLz64cS0vgAI77lAZDY05+M=;
 b=aAZFgMWQuCVUWjMow9ZaIglmZVxIraHeb3nU4mEekPQU/BHDY97tmPbO
 2gKAeOZqXZYmloxRo/54jJfW5coWJEG9YSLa7s+iZfjgXhu/Wl7XE0ak0
 CPoCphKchQsHs3qLbzacmeEgecK9rQl9Nwth3L847mvne29097/ctP24W
 UqsxHGyjdfNpVUZSJLSg+OQ5rR16GDZAuDqAtx5s1SxiyDypvEyitUheq
 WMdNNaqemtY4mWuAvix/bV7hYZhPqbCVFvgJoXh6TZkXpp93DZtzXI9he
 +EfOP6/f0jRynxJpaVd5EMzTZlSnCGcwq12eWRUTsDw009aG/wVw7u7kB g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10507"; a="308833528"
X-IronPort-AV: E=Sophos;i="5.95,203,1661842800"; d="scan'208";a="308833528"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2022 19:40:46 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10507"; a="773273980"
X-IronPort-AV: E=Sophos;i="5.95,203,1661842800"; d="scan'208";a="773273980"
Received: from kerendel-mobl1.amr.corp.intel.com (HELO [10.212.96.240])
 ([10.212.96.240])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2022 19:40:45 -0700
Message-ID: <35f55696-c4c5-1f00-dc7e-b5c7dcf0a091@linux.intel.com>
Date: Fri, 21 Oct 2022 12:09:29 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.2.2
Subject: Re: [PATCH v2 1/9] ASoC: qdsp6: audioreach: topology use idr_alloc_u32
Content-Language: en-US
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, broonie@kernel.org
References: <20221021165207.13220-1-srinivas.kandagatla@linaro.org>
 <20221021165207.13220-2-srinivas.kandagatla@linaro.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20221021165207.13220-2-srinivas.kandagatla@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, tiwai@suse.com,
 bgoswami@quicinc.com
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



On 10/21/22 11:51, Srinivas Kandagatla wrote:
> SubGraph and Module Instance ids take 32 bits, so use idr_alloc_u32
> instead of idr_alloc to able to accomdate valid ranges.

typo: accommodate.

Also worth checking https://www.kernel.org/doc/html/latest/core-api/idr.html
"The IDR interface is deprecated; please use the XArray instead."


