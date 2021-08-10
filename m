Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 80D213E864D
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Aug 2021 01:05:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E7BB71720;
	Wed, 11 Aug 2021 01:04:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E7BB71720
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628636725;
	bh=ZYpfP6g0E3UGrDQx1Lc1eEAxXfjhzSWphpxMpQpRnso=;
	h=Subject:To:References:From:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hiJz9nEgwgGn/5f6m2SurkzpeqTiae16lzfeSFgaCNwYd+np7saHVeL/I11SiNDrD
	 OYx2qFSMKcGpkqDlS3c2yZcIXUsNnG4gCqXAyot/2LVft+C7duM9k//0mHIlVhBv4U
	 b3wEr3WIviGm2aE8VXznIBWaEvgneNoJX1DdlTg8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 504BCF80279;
	Wed, 11 Aug 2021 01:03:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 454A8F8025D; Wed, 11 Aug 2021 01:03:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DCEBCF800C8
 for <alsa-devel@alsa-project.org>; Wed, 11 Aug 2021 01:03:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DCEBCF800C8
X-IronPort-AV: E=McAfee;i="6200,9189,10072"; a="215000115"
X-IronPort-AV: E=Sophos;i="5.84,310,1620716400"; d="scan'208";a="215000115"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2021 16:03:41 -0700
X-IronPort-AV: E=Sophos;i="5.84,310,1620716400"; d="scan'208";a="672147289"
Received: from jechung-mobl.amr.corp.intel.com (HELO [10.213.163.236])
 ([10.213.163.236])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2021 16:03:41 -0700
Subject: Re: CORB reset timeout, Intel 3400 onboard chip
To: tom <tom@offbeat.tech>, alsa-devel@alsa-project.org
References: <20210810223536.u2y2cggfgrdqyhby@offbeat.tech>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <c2883e45-5822-c154-9057-14a2b0f05938@linux.intel.com>
Date: Tue, 10 Aug 2021 18:03:38 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210810223536.u2y2cggfgrdqyhby@offbeat.tech>
Content-Type: text/plain; charset=utf-8
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



On 8/10/21 5:35 PM, tom wrote:
> Hello all,
> I am experiencing an issue with my onboard sound card, where I have no sound
> output. Please see a copy of my alsa-info.sh for my current 
> /etc/modprobe.d/*.conf config, located here:
> 
> http://ix.io/3vAV
> 
> I attempted troubleshooting using some config options that I saw listed in 
> HDAudio.txt. Specifically, I tried model options for "generic". I also tried a 
> few options for probe_mask, including "1" and "0x100".
> 
> 
> It seems that no matter which options I put in, I always get a
> CORB timeout from desg:
> 
> [    4.052955] snd_hda_intel 0000:00:1b.0: CORB reset timeout#1, CORBRP = 0
> [    4.053038] snd_hda_intel 0000:00:1b.0: no codecs initialized
> 
> When I remove my probe_mask options, it first switches to polling mode, then
> single_cmd mode, and finally fails to initialize any codecs. I looked at the
> hda_intel.c file and saw a section for my onboard sound card (ref line 2515):
> 
> 00:1b.0 Audio device: Intel Corporation 5 Series/3400 Series Chipset High 
> Definition Audio (rev 05)

In the alsa-info.sh log, I can see this
[    3.950319] snd_hda_intel 0000:00:1b.0: codec_mask forced to 0x0

I am not sure how this might happen, this looks like a bad configuration
to me?

	/* check forced option */
	if (chip->codec_probe_mask != -1 &&
	    (chip->codec_probe_mask & AZX_FORCE_CODEC_MASK)) {
		azx_bus(chip)->codec_mask = chip->codec_probe_mask & 0xff;
		dev_info(chip->card->dev, "codec_mask forced to 0x%x\n",
			 (int)azx_bus(chip)->codec_mask);
	}
