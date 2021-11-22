Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 42302459361
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Nov 2021 17:47:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B972686F;
	Mon, 22 Nov 2021 17:47:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B972686F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637599677;
	bh=kKbpABY+ZiSiuXJW6mov6x4ND/LtYy7eYfAc5H5PR10=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=W0QWazuGL5JocWzQH3Xl3yeCOc7fberXBPkcgmO1aWfi5vJosgdZGp4DABgJUkQvt
	 EGU1MkJgpcGuArm459t4WsSPu9MJlud/pmhmHfMhqUoZiWG/TCRUUExIlk6GcsBauO
	 TFXE2Mk1JyphEeBg+L1llqrk3B2Tw81Yp/VvCTGM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 17961F800E7;
	Mon, 22 Nov 2021 17:46:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9E99CF80212; Mon, 22 Nov 2021 17:46:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 67691F80154
 for <alsa-devel@alsa-project.org>; Mon, 22 Nov 2021 17:46:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 67691F80154
X-IronPort-AV: E=McAfee;i="6200,9189,10176"; a="222044365"
X-IronPort-AV: E=Sophos;i="5.87,255,1631602800"; d="scan'208";a="222044365"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2021 08:45:39 -0800
X-IronPort-AV: E=Sophos;i="5.87,255,1631602800"; d="scan'208";a="474404906"
Received: from gavasque-mobl.amr.corp.intel.com (HELO [10.212.2.29])
 ([10.212.2.29])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2021 08:45:38 -0800
Subject: Re: [PATCH 3/5] ASoC: Intel: add machine driver for SOF+ES8336
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
References: <20211004213512.220836-1-pierre-louis.bossart@linux.intel.com>
 <20211004213512.220836-4-pierre-louis.bossart@linux.intel.com>
 <20211121190035.2a5e3ad7@sal.lan>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <137f321b-0be3-eeb2-b6f3-a88d687f7848@linux.intel.com>
Date: Mon, 22 Nov 2021 10:45:35 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211121190035.2a5e3ad7@sal.lan>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, broonie@kernel.org,
 Huajun Li <huajun.li@intel.com>, Kai Vehmanen <kai.vehmanen@linux.intel.com>
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


Hi Mauro,

>> Add machine driver to support APL/GLK/TGL platforms.
>> The TGL platform supports DMIC, APL and GLK do not.
> 
> I just bought a Comet Lake notebook with ES8336, but I'm having a hard
> time to make audio work on it.

Yes, we're aware of this design and we've tried to help. There's a
series of devices based on this I2C/I2S device, which is the exception
to the rule that all Windows-based designs are based on HDaudio or
SoundWire. Intel wasn't informed of this device so we we've added quirks
device after device, as bug reports came in.

The CometLake enablement is tracked at
https://github.com/thesofproject/linux/issues/3248

I will upstream the two quirks for CometLake later today.

The latest hacky recipe to get the driver to probe is at
https://github.com/thesofproject/linux/pull/3107

There is still work to do for the 'topology' part. The comment
https://github.com/thesofproject/linux/issues/3248#issuecomment-959573378 has
a tar file with 3 possible options for the I2S/SSP connection.

The remaining part will be the codec driver, which is problematic for
now, we're still waiting for updates from the vendor and it's unclear
if/when they will be submitted.

Hope this helps
-Pierre

