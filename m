Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 515DF14AB8A
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Jan 2020 22:22:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CF02683E;
	Mon, 27 Jan 2020 22:22:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CF02683E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580160177;
	bh=U/Qhq3ZT6PqSOdVUuglogA5ur+/jLC0JD8BbL6SgEck=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZMCSC3Gjbo/lZOB2c9f4KjOUQ4egp4TlG1gHJyJUK3n81FjAQCSWD7kuDEf2BXW7e
	 bUlXEOUkLrlr0edIWbvc7iTuJP3ClFZGQ3NUrsKACp6sRfd8nqrThrr//WV4iZ7A/u
	 FyVVM27qmXHoYuV+z2A/UyblTN4LXA83ETor/apI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E5EE5F80254;
	Mon, 27 Jan 2020 22:21:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E0974F800C8; Mon, 27 Jan 2020 22:21:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BF869F800C8
 for <alsa-devel@alsa-project.org>; Mon, 27 Jan 2020 22:21:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BF869F800C8
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Jan 2020 13:21:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,371,1574150400"; d="scan'208";a="231649928"
Received: from ngstahl-mobl1.amr.corp.intel.com (HELO [10.254.190.105])
 ([10.254.190.105])
 by orsmga006.jf.intel.com with ESMTP; 27 Jan 2020 13:21:05 -0800
To: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org
References: <20200127121243.15813-1-cezary.rojewski@intel.com>
 <20200127121243.15813-8-cezary.rojewski@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <3e8dcf78-4413-b752-c574-c5c64f7d0fe8@linux.intel.com>
Date: Mon, 27 Jan 2020 14:57:34 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200127121243.15813-8-cezary.rojewski@intel.com>
Content-Language: en-US
Cc: broonie@kernel.org, tiwai@suse.com, lgirdwood@gmail.com
Subject: Re: [alsa-devel] [PATCH v2 07/11] ASoC: SOF: Implement Probe IPC API
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


> +EXPORT_SYMBOL(sof_ipc_probe_deinit);
> +
> +static int sof_ipc_probe_info(struct snd_sof_dev *sdev, unsigned int cmd,
> +		void **params, size_t *num_params)
> +{
> +	struct sof_ipc_probe_info_params msg = {0};

This generates a sparse warning (make C=2)

sound/soc/sof/probe.c:75:49: warning: missing braces around initializer

Can you please make it go away?
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
