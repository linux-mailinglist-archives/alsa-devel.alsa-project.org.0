Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 22A9979C99
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Jul 2019 01:04:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 835451801;
	Tue, 30 Jul 2019 01:03:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 835451801
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564441483;
	bh=E1WYAxHG/pB9PXvvYrWzVleuWIR4uWtgXAkh1En/Uxg=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jkhWHqZKmD0d4GHN9XZl4IpQDMcaVwHBD4jc2e6EeuW72SJt6tfBbMZhWF9rVAoQO
	 X7gdpjP1HLRnBXQuZ1+W+ZBbWFn9zV+15flnHKtOI0aAAdpDu5+4DH8BCgHWHH4cRW
	 PlI5brVIeNJKFd3hbqQzf0JVJ9MIBCwMSojFz9Ig=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C4418F80483;
	Tue, 30 Jul 2019 01:02:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 14B6FF8048D; Tue, 30 Jul 2019 01:02:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DDBB4F803D5
 for <alsa-devel@alsa-project.org>; Tue, 30 Jul 2019 01:02:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DDBB4F803D5
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 29 Jul 2019 16:02:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,324,1559545200"; d="scan'208";a="165643171"
Received: from ahanamuk-mobl.amr.corp.intel.com (HELO [10.251.134.69])
 ([10.251.134.69])
 by orsmga008.jf.intel.com with ESMTP; 29 Jul 2019 16:02:45 -0700
To: Jon Flatley <jflat@chromium.org>, alsa-devel@alsa-project.org
References: <CACJJ=pxPm7dRUE534hDWy2tN3dGYDyrgU8JKqett=wOQx+nWCQ@mail.gmail.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <39533fe5-c060-7a07-c910-74b83eee53c4@linux.intel.com>
Date: Mon, 29 Jul 2019 18:02:45 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CACJJ=pxPm7dRUE534hDWy2tN3dGYDyrgU8JKqett=wOQx+nWCQ@mail.gmail.com>
Content-Language: en-US
Cc: benzh@chromium.org
Subject: Re: [alsa-devel] [BUG] bdw-rt5650 DSP boot timeout
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



On 7/29/19 4:53 PM, Jon Flatley wrote:
> I've been working on upstreaming the bdw-rt5650 machine driver for the
> Acer Chromebase 24 (buddy). There seems to be an issue when first
> setting the hardware controls that appears to be crashing the DSP:
> 
> [   51.424554] haswell-pcm-audio haswell-pcm-audio: FW loaded, mailbox
> readback FW info: type 01, - version: 00.00, build 77, source commit
> id: 876ac6906f31a43b6772b23c7c983ce9dcb18a19
> ...
> [   84.924666] haswell-pcm-audio haswell-pcm-audio: error: audio DSP
> boot timeout IPCD 0x0 IPCX 0x0
> [   85.260655] haswell-pcm-audio haswell-pcm-audio: ipc: --message
> timeout-- ipcx 0x83000000 isr 0x00000000 ipcd 0x00000000 imrx
> 0x7fff0000
> [   85.273609] haswell-pcm-audio haswell-pcm-audio: error: stream commit failed
> [   85.279746]  System PCM: error: failed to commit stream -110
> [   85.285388] haswell-pcm-audio haswell-pcm-audio: ASoC:
> haswell-pcm-audio hw params failed: -110
> [   85.293963]  System PCM: ASoC: hw_params FE failed -110
> 
> This happens roughly 50% of the time when first setting hardware
> controls after a reboot. The other 50% of the time the DSP comes up
> just fine and audio works fine thereafter. Adding "#define DEBUG 1" to
> sound/soc/intel/haswell/sst-haswell-ipc.c makes the issue occur much
> less frequently in my testing. Seems like a subtle timing issue.
> 
> There were timing issues encountered during the bringup of the 2015
> chromebook pixel (samus) which uses the bdw-rt5677 machine driver.
> Those were slightly different, and manifested during repeated
> arecords. Both devices use the same revision of the sst2 firmware.
> 
> Any ideas for how to debug this?

this could be trying to send an IPC while you are already waiting for 
one to complete. we've seen this before with SOF, if the IPCs are not 
strictly serialized then things go in the weeds and timeout.

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
