Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 590A23DEA38
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Aug 2021 12:02:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C7F8416FE;
	Tue,  3 Aug 2021 12:01:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C7F8416FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627984946;
	bh=DfsjgBIn6wVNq03jPO5VNJ8jSmzhpazyns8miIyoz0Q=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=M/EOmlc2RQV5kyj0ARI6PixMQqTg7wwHdBlw0LW6Cw3uwAX/GfotGXtqBAWKT3cLL
	 bmwCczShO0BVlifjTBDgX8qxksCBv7Wk6Qv4IMKo0+Yr1UD3XOTh/rGMhW9KttfEb1
	 Op9KhrthOOZy7NDaFF1C4r+nNuv4vWOO0em/UnQE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4E1DBF8014D;
	Tue,  3 Aug 2021 12:00:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4C6D9F802E8; Tue,  3 Aug 2021 12:00:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5AC72F8014D
 for <alsa-devel@alsa-project.org>; Tue,  3 Aug 2021 12:00:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5AC72F8014D
X-IronPort-AV: E=McAfee;i="6200,9189,10064"; a="210534097"
X-IronPort-AV: E=Sophos;i="5.84,291,1620716400"; d="scan'208";a="210534097"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2021 03:00:49 -0700
X-IronPort-AV: E=Sophos;i="5.84,291,1620716400"; d="scan'208";a="479416899"
Received: from crojewsk-mobl1.ger.corp.intel.com (HELO [10.213.13.248])
 ([10.213.13.248])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2021 03:00:46 -0700
Subject: Re: [PATCH] ASoC: Intel: sof_rt5682: Add max98390 echo reference
 support
To: Mark Hsieh <mark_hsieh@wistron.corp-partner.google.com>,
 alsa-devel@alsa-project.org
References: <20210803092013.10749-1-mark_hsieh@wistron.corp-partner.google.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <c002c16c-dc89-d9ca-dab2-c252c83c5b06@intel.com>
Date: Tue, 3 Aug 2021 12:00:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210803092013.10749-1-mark_hsieh@wistron.corp-partner.google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: lance.hou@intel.com, mark_hsieh@wistron.com, kai.vehmanen@linux.intel.com,
 linux-kernel@vger.kernel.org, yang.jie@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, liam.r.girdwood@linux.intel.com,
 mac.chiang@intel.com, broonie@kernel.org, brent.lu@intel.com,
 bard.liao@intel.com
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

On 2021-08-03 11:20 AM, Mark Hsieh wrote:
> Signed-off-by: Mark Hsieh <mark_hsieh@wistron.corp-partner.google.com>
> ---

Hello,

Any commit message is better than none. Please provide one.

Regards,
Czarek
