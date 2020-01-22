Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 57854145B96
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Jan 2020 19:29:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 00DE316A0;
	Wed, 22 Jan 2020 19:28:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 00DE316A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579717786;
	bh=tm1FMQqrN4mUzYwf53Y+aXKvOEa52Oivd/J4yG+rqSE=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=txPxafKu/SieEL4ejnqR78Xw0g+/E0YJCysgXWce3aRR8nFG52O0k5WN7QxWwrkl7
	 IYoJKSB5qx+9+uZA6izHXh14ti8xnpZxJg9FHsSMLRn3Pun3YKfDdqXJxQLc4+u+7L
	 YgkJQ/saT8p1uAjvHBl7tl8vQuaekAqvNq6FHnbY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9570CF800BA;
	Wed, 22 Jan 2020 19:28:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8DF12F8020C; Wed, 22 Jan 2020 19:27:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 70DB8F8007E
 for <alsa-devel@alsa-project.org>; Wed, 22 Jan 2020 19:27:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 70DB8F8007E
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Jan 2020 10:27:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,350,1574150400"; d="scan'208";a="227757922"
Received: from crojewsk-mobl1.ger.corp.intel.com (HELO [10.252.20.249])
 ([10.252.20.249])
 by orsmga003.jf.intel.com with ESMTP; 22 Jan 2020 10:27:50 -0800
To: broonie@kernel.org, tiwai@suse.com, pierre-louis.bossart@linux.intel.com
References: <20200122181254.22801-1-cezary.rojewski@intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <9246ee43-ffec-2b28-3a56-211f08797342@intel.com>
Date: Wed, 22 Jan 2020 19:27:48 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20200122181254.22801-1-cezary.rojewski@intel.com>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com
Subject: Re: [alsa-devel] [PATCH] ASoC: Intel: skl_hda_dsp_common: Fix
 global-out-of-bounds bug
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

For the last few days we have been playing with "vanilla" 5.5 kernel - 
one without ton of /skylake patches - to find out how could hda-dsp be 
enabled on skl/ kbl+ with the least amount of changes pulled from our 
branch possible.

Turned out the addition of this single patch AND topology binary update 
got the job done.

Now, how can we proceed with such solution. Can share the topology 
binary/ .conf if needed, so anyone interested can check it out.

Regards,
Czarek
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
