Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 261706BF6C
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Jul 2019 18:04:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BA9E01694;
	Wed, 17 Jul 2019 18:03:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BA9E01694
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563379440;
	bh=7qXa80qNBOVz6irfwb2+AFREKFj1CgT4qqkKFSoGqDg=;
	h=To:References:From:Date:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=f9jtNnN/028Dt1TFYsUXcn48lBhpMNqyiSWNQ8GnEpBK6TChu/oM0TfuaeK7r+7Hy
	 QjdiX1IB3n7rijlVUck9Bt/VQEf/n7YB6W+BbK5Zjv3oDIy2aY802nA7r4cs83oBFW
	 tr/V1/fBV9MuhndLOfLe5XwXELF40ZYWlFHqI1pI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0C552F80363;
	Wed, 17 Jul 2019 18:02:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 34B30F80363; Wed, 17 Jul 2019 18:02:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5F7F6F800C2
 for <alsa-devel@alsa-project.org>; Wed, 17 Jul 2019 18:02:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5F7F6F800C2
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Jul 2019 09:02:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,274,1559545200"; d="scan'208";a="172908197"
Received: from szrederp-mobl.amr.corp.intel.com (HELO [10.252.199.30])
 ([10.252.199.30])
 by orsmga006.jf.intel.com with ESMTP; 17 Jul 2019 09:02:06 -0700
To: "S.j. Wang" <shengjiu.wang@nxp.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Mark Brown <broonie@kernel.org>
References: <VE1PR04MB6479C4D2CD4B9D486209102FE3CE0@VE1PR04MB6479.eurprd04.prod.outlook.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <548bda36-b81f-1811-7969-e80e698ecfa3@linux.intel.com>
Date: Wed, 17 Jul 2019 11:02:05 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <VE1PR04MB6479C4D2CD4B9D486209102FE3CE0@VE1PR04MB6479.eurprd04.prod.outlook.com>
Content-Language: en-US
Subject: Re: [alsa-devel] Is there a way to support TX master mode and RX
 slave mode?
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



On 7/16/19 3:35 AM, S.j. Wang wrote:
> Hi  Experts
> 
> Is there a way to support TX master mode but RX slave mode?  It seems current .set_fmt only set same mode for TX and RX.

good question if you are thinking of supporting the 6-pin versions of 
I2S interfaces with independent bit clock and frame sync on RX and TX
Looking at the topology definition it could be that this mode needs to 
be handled with separate dailinks. Adding Mark in case he didn't see 
this question.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
