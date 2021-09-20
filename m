Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E6A234116B7
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Sep 2021 16:19:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6ED6F1696;
	Mon, 20 Sep 2021 16:18:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6ED6F1696
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632147584;
	bh=LWVXEFYIjsZVLfHTxXRFVEs3QtGE4Q3lzBMerqWiWwg=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GAkTVgFdLdHLM1LsgihnplH5V0dSrfdjscvDi1M3fMjTEghTkx3+mCkMO/bknSprx
	 pZALKJ252LJCSG5xkmr9b9PEPZoGgWgyH1yqlgfjMD4MvMZNkKKrL+3fNvJGoCvSkA
	 Y6yKpDtQw6ZmX3TX8eddvmmBt5PHBva/mifT/1V4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E6DA1F80246;
	Mon, 20 Sep 2021 16:18:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C6EE7F8025D; Mon, 20 Sep 2021 16:18:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5CF4CF80152
 for <alsa-devel@alsa-project.org>; Mon, 20 Sep 2021 16:18:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5CF4CF80152
X-IronPort-AV: E=McAfee;i="6200,9189,10113"; a="223187048"
X-IronPort-AV: E=Sophos;i="5.85,308,1624345200"; d="scan'208";a="223187048"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2021 07:18:00 -0700
X-IronPort-AV: E=Sophos;i="5.85,308,1624345200"; d="scan'208";a="548804449"
Received: from vkelly-mobl.amr.corp.intel.com (HELO [10.209.161.210])
 ([10.209.161.210])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2021 07:17:59 -0700
Subject: Re: [PATCH] ASoC: Intel: boards: Update to modern clocking terminology
To: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 liam.r.girdwood@linux.intel.com, broonie@kernel.org,
 cezary.rojewski@intel.com, yang.jie@linux.intel.com
References: <20210920065508.7854-1-peter.ujfalusi@linux.intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <2c3e4064-bda8-bf27-87d7-c298a2c7fcfc@linux.intel.com>
Date: Mon, 20 Sep 2021 09:07:29 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210920065508.7854-1-peter.ujfalusi@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: hdegoede@redhat.com, alsa-devel@alsa-project.org, tiwai@suse.com,
 kai.vehmanen@linux.intel.com, ranjani.sridharan@linux.intel.com
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



On 9/20/21 1:55 AM, Peter Ujfalusi wrote:
> As part of the effort to remove our old APIs based on outdated terminology
> update the Intel board drivers to use modern terminology.
> 
> Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

