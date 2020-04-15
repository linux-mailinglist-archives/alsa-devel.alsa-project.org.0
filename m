Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AA8021AAC2E
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Apr 2020 17:45:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2FE3C165D;
	Wed, 15 Apr 2020 17:44:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2FE3C165D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586965531;
	bh=ctNFtJ8Robsgvx5Vxm7+CwPXQBCI+bsI2uShmDI2ErQ=;
	h=Subject:To:References:From:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RfSdwQwPvApnHgAtlDzYpGhjr8FIlEdWkQus5wJv76H0+dLelnPqmc44BdVbOq8bM
	 IMMddbypPhvyXdr5V3HCCOGoOPhA7qQDWNAfNcE3XwR+x6PN43PprBt0lNqI92crQJ
	 0fzrtaws+wnkZA92zme/kIeSy7f0+x/oY5Z+QlJQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 50C91F8025F;
	Wed, 15 Apr 2020 17:43:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 48117F80245; Wed, 15 Apr 2020 17:43:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5D7E8F80124
 for <alsa-devel@alsa-project.org>; Wed, 15 Apr 2020 17:43:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5D7E8F80124
IronPort-SDR: 6Fe6+iVRrYSRmRwwFXfT/gc0z9+O1f2hTGmqBBH2FZsyDNbj1OH8YxkChMi9Hjon5mQXG2IGe/
 w0hkO7S+OitA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2020 08:43:39 -0700
IronPort-SDR: +FiXEmL9Tt/0kH1pJvxNZQzDJdqz3vJV+Z/KWxF4nBU0tBnvtvGlUGIpPKV+KY72+hgOnYyRxc
 T6j7fL9laM2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,387,1580803200"; d="scan'208";a="400349715"
Received: from ccarey-mobl.amr.corp.intel.com (HELO [10.209.36.121])
 ([10.209.36.121])
 by orsmga004.jf.intel.com with ESMTP; 15 Apr 2020 08:43:39 -0700
Subject: Re: Baytrail audio not working on next branch
To: Jaime Perez <19.jaime.91@gmail.com>, alsa-devel@alsa-project.org
References: <CAM2dokvhFWfXev+JMfKnCxCPdLrFgG7xqf=8Dt5N92BPqOGKcA@mail.gmail.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <efc2d79c-7d08-2d7c-9e4d-18f93b1ca302@linux.intel.com>
Date: Wed, 15 Apr 2020 10:43:38 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CAM2dokvhFWfXev+JMfKnCxCPdLrFgG7xqf=8Dt5N92BPqOGKcA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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



On 4/15/20 5:10 AM, Jaime Perez wrote:
> tested 20200409 20200413 20200414 tags
> 
> maybe related issue
>   https://bugzilla.kernel.org/show_bug.cgi?id=201787

yes, please try the patch shared yesterday on alsa-devel, thanks!

[RFC TEST] ASoC: soc-dai: revert all changes to DAI startup/shutdown 
sequence


