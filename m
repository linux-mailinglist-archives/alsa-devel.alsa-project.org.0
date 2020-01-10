Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D20B136644
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Jan 2020 05:42:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1D15C17A1;
	Fri, 10 Jan 2020 05:41:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1D15C17A1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578631330;
	bh=sLeYd8y5lSEqDbN88tVieHJ4WPuRkdRJMn4PrjntOKk=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OWN330JqpFTwQ0YKjB3xDcfEqy81FCfsItAbvE2QiByyHZPwG4g3Eg7dMIh3nmuw3
	 Ls9AwJPgBv0qSwAZuGhzKBTql8bh7O0t3NDAJ/YJrxJwwa5mkIlhi4ylWoAkFhHd0M
	 D9TDaqVrSDgNGDQkpg6Zthh0ux2FtBdFMIVxovHQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CFC84F80159;
	Fri, 10 Jan 2020 05:40:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2BF5CF8011C; Fri, 10 Jan 2020 05:40:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2FD05F8010B
 for <alsa-devel@alsa-project.org>; Fri, 10 Jan 2020 05:40:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2FD05F8010B
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 Jan 2020 20:40:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,415,1571727600"; d="scan'208";a="224085378"
Received: from cgrageda-mobl.amr.corp.intel.com (HELO [10.254.8.138])
 ([10.254.8.138])
 by orsmga003.jf.intel.com with ESMTP; 09 Jan 2020 20:40:08 -0800
To: shumingf@realtek.com, broonie@kernel.org, lgirdwood@gmail.com
References: <20200110014552.17252-1-shumingf@realtek.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <9401e8a7-dc5d-2beb-1b29-b07061547fac@linux.intel.com>
Date: Thu, 9 Jan 2020 22:40:07 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200110014552.17252-1-shumingf@realtek.com>
Content-Language: en-US
Cc: oder_chiou@realtek.com, jack.yu@realtek.com, alsa-devel@alsa-project.org,
 lars@metafoo.de, derek.fang@realtek.com, flove@realtek.com,
 bard.liao@intel.com, pierre-louis.bossart@intel.com
Subject: Re: [alsa-devel] [PATCH 1/2] ASoC: rt700: add rt700 codec driver
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



On 1/9/20 7:45 PM, shumingf@realtek.com wrote:
> From: Shuming Fan <shumingf@realtek.com>
> 
> This is the initial codec driver for rt700.
> 
> Signed-off-by: Shuming Fan <shumingf@realtek.com>

This driver has been extensively tested by Intel on all CNL/CML/ICL 
reference boards, so:

Tested-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
