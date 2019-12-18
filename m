Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F036A124D42
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Dec 2019 17:25:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 549A8839;
	Wed, 18 Dec 2019 17:24:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 549A8839
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576686336;
	bh=e6itXtng54Ies72qp8nFxSkr7SrXqtC36m56CFWgU/M=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uCFkyXdN+olKBd1ecXlguJdhJHmlDnfRJ6rApLYSaV4hbDKwGuVNnmp3uqztVF3Yp
	 Z0q9KyDAdO9QBFAKEk206zNuGbDFo9kOig/1OAOHBCwxUVxNODeA9xYZrKNGzogNcv
	 c19P7cJPxCZY6Lw64wkyG65wbGEJ1W1ro+hTgRhI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 58D98F80255;
	Wed, 18 Dec 2019 17:23:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7F7F9F80059; Wed, 18 Dec 2019 17:23:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 37BC5F80059
 for <alsa-devel@alsa-project.org>; Wed, 18 Dec 2019 17:23:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 37BC5F80059
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Dec 2019 08:23:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,330,1571727600"; d="scan'208";a="415881642"
Received: from dshoemak-mobl.amr.corp.intel.com (HELO [10.251.3.243])
 ([10.251.3.243])
 by fmsmga005.fm.intel.com with ESMTP; 18 Dec 2019 08:23:43 -0800
To: Mohan Prasath Ramamoorthy <mohan.prasath@vvdntech.in>
References: <CAMM7-fe=NAH_tEFsE+RV-eA1KLkhaim_3w4YK3wjqDYea_2TtA@mail.gmail.com>
 <d4f21304-d5b0-5acd-2595-4cb7aa684da3@linux.intel.com>
 <CAMM7-ff0m=VZ-neyjt-7xFUmgD-36rULHbLpuf4=L57-HvRo3Q@mail.gmail.com>
 <CAMM7-ffqjDqeXpyTWkfmyc5m0pPLsdT0hBAqYNjO_x5cPMhycA@mail.gmail.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <631af91b-4a35-6edc-b1af-6ca69d38a6fa@linux.intel.com>
Date: Wed, 18 Dec 2019 08:45:10 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <CAMM7-ffqjDqeXpyTWkfmyc5m0pPLsdT0hBAqYNjO_x5cPMhycA@mail.gmail.com>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org
Subject: Re: [alsa-devel] Playback issue while recording simultaneously
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



On 12/17/19 10:36 PM, Mohan Prasath Ramamoorthy wrote:
> Hi Pierre-Louis,
> 
> Shall we get an update on this issue?

I was trying to be nice but emails with no details, no logs, no 
information on kernel sequences are generally ignored by developers... 
And unless you can show your issue happens on a recent kernel it's going 
to be difficult to comment on code that's no longer supported by the 
community.

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
