Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 50D871F6EDD
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Jun 2020 22:38:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B83BB1683;
	Thu, 11 Jun 2020 22:38:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B83BB1683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591907931;
	bh=YVAb8p+ZwpFzxqqGbkxy+d4P2qvycTILgkYIQr7pUgc=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mRDYp3OoP0GZMWcAKmnHUmDrOIOIyzQxL5S+f3F/mFmw9Jnx1bmKaVZQ6O2RCsT4y
	 C6C0SJsMVw8jpTfGcW3o3CGYJPqcIND+EUgYu07qHuFh4RCm/TnhkZWyKbDMml8jog
	 oldccMBoMA6qrek3IPp7u1jVrDZaV6OwfOZlYFrg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C1E9EF800CC;
	Thu, 11 Jun 2020 22:37:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3EE5EF8028C; Thu, 11 Jun 2020 22:37:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=PRX_BODY_30, RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BA97EF800CC
 for <alsa-devel@alsa-project.org>; Thu, 11 Jun 2020 22:37:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BA97EF800CC
IronPort-SDR: v/mc14H2sot7BhRp2L2VMJvsHroUwlXfrTmdzE7gturrfzbyaslw16ZZhYTqIiRP688B7a9Vl9
 b3FibWYdrEiQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2020 13:37:00 -0700
IronPort-SDR: pepvTIbg9SIlqOWtoQ4OtOupzy32cfxyZsYPgMKHnzW0Mdk4DZZjFbx+yJ6d345eaUwBBgSk2T
 cxGwt5K3WxoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,501,1583222400"; d="scan'208";a="260628282"
Received: from mgesquiv-mobl.amr.corp.intel.com (HELO [10.254.106.112])
 ([10.254.106.112])
 by orsmga007.jf.intel.com with ESMTP; 11 Jun 2020 13:36:59 -0700
Subject: Re: [PATCH] ASoC: SOF: Intel: hda: unsolicited RIRB response
To: Takashi Iwai <tiwai@suse.de>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
References: <1591883073-17190-1-git-send-email-brent.lu@intel.com>
 <b7e0b822a9deea506acaa40e0e31cc9f488bb446.camel@linux.intel.com>
 <DM6PR11MB4316108BCF449D52E49C7E4297800@DM6PR11MB4316.namprd11.prod.outlook.com>
 <s5h5zbxeb5t.wl-tiwai@suse.de>
 <ccccab4d074878cd8fc3b3c4313025e54f78b65a.camel@linux.intel.com>
 <s5hzh99cqc0.wl-tiwai@suse.de>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <b7e98ae0-ea42-bced-1c0f-caa73e798908@linux.intel.com>
Date: Thu, 11 Jun 2020 15:36:58 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <s5hzh99cqc0.wl-tiwai@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "commit_signer:6/16=38%, authored:6/16=38%, added_lines:123/248=50%,
 removed_lines:36/84=43%,
 Kai Vehmanen DRIVERS \)" <kai.vehmanen@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, "Rojewski,
 Cezary" <cezary.rojewski@intel.com>, Takashi Iwai <tiwai@suse.com>,
 Keyon Jie <yang.jie@linux.intel.com>, "authored:2/16=12%,
 added_lines:21/248=8%, removed_lines:5/84=6%, \),
 Liam Girdwood DRIVERS \)" <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Zhu Yingjiang <yingjiang.zhu@linux.intel.com>,
 "sound-open-firmware@alsa-project.orgDRIVERS"
 <sound-open-firmware@alsa-project.orgDRIVERS>,
 "Daniel Baluta DRIVERS \)" <daniel.baluta@nxp.com>, "Lu,
 Brent" <brent.lu@intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
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


>>>> I added debug messages to print the RIRBWP register and realize
>>>> that
>>>> response could come between the read of RIRBWP in the
>>>> snd_hdac_bus_update_rirb() function and the interrupt clear in the
>>>> hda_dsp_stream_interrupt() function. The response is not handled
>>>> but
>>>> the interrupt is already cleared. It will cause timeout unless more
>>>> responses coming to RIRB.
>>>
>>> Now I noticed that the legacy driver already addressed it recently
>>> via
>>> commit 6d011d5057ff
>>>      ALSA: hda: Clear RIRB status before reading WP
>>>
>>> We should have checked SOF at the same time, too...
>>
>> Thanks, Takashi. But the legacy driver but doesnt remove the loop. The
>> loop added in the SOF driver was based on the legacy driver and
>> specifically to handle missed stream interrupts. Is there any harm in
>> keeping the loop?
> 
> A loop there might be safer to keep, indeed.  That's basically for a
> difference kind of race, and it can still happen theoretically.
> 
> Though, SOF is with the threaded interrupt, and it's interesting how
> the behavior differs.  I can imagine that, if a thread irq is running
> while a new IRQ is re-triggered, the hard irq handler won't queue it
> again.  But I might be wrong here, need some checks.

IIRC we added this loop before merging all interrupt handling in one 
thread, somehow the MSI mode never worked reliably without this change, 
so maybe we don't need this loop any longer.

I'd really prefer it if we didn't tie the RIRB handing change to this 
loop change, removing the loop should only be done with *a lot of testing*.

