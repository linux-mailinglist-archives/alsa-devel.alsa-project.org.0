Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C3D8852DC05
	for <lists+alsa-devel@lfdr.de>; Thu, 19 May 2022 19:54:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5D1571831;
	Thu, 19 May 2022 19:53:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5D1571831
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652982856;
	bh=B2kzj5sN8O2TnTpQLQG4+I3RUEEMnuN8jnc0ayhrlRk=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FTP5OPQnOPidjjvlCrxmtr4m8lXzhXTDZDcmFTnkkY43m6WE3G5HfF9962VzF6ji1
	 gtllqG8up7dtS1tL0Nexg5RRQtqqSAlShutYfpOlbhhguRYaqtvn3GN34ZS4N4tf8I
	 G22ZqN9+i30eiuM9BOQlk7L/sTMXmPum6O5K+z2Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1FBD9F804A9;
	Thu, 19 May 2022 19:50:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A9458F80526; Thu, 19 May 2022 19:49:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F1401F80237
 for <alsa-devel@alsa-project.org>; Thu, 19 May 2022 19:49:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F1401F80237
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="XXVcf3U7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652982594; x=1684518594;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=B2kzj5sN8O2TnTpQLQG4+I3RUEEMnuN8jnc0ayhrlRk=;
 b=XXVcf3U7hSVJpMMDKxVJar9GAhA10v51pOqjV84Qgvx7UdKzid9r75AT
 yyR55cEGTzIZ0QKOq44eZItHcQ/94iP/2xkuFefD0F/3DBJ67jENwBILc
 ReGfdJXCQNPHVAjYb3+znwjmneyZFIwAGHT9roc57Iw2T7Nq5ihDB5ld9
 0K+tDjhoyZ36sxjJUedExZFqqTtPajRFbW/vM2BxnvA67SRBCoOjBUMjg
 4Q/Ra3tPRXtYoE1YkDiobFuqWtO5/+lvL7wrtzTl2grO8H/gQyh7m3Gjy
 5+08vgik1lk7H4i8XOWvcV9bOBSFER7GKrgy9KSN/FfYWRCob2TtR4HZY g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10352"; a="252815148"
X-IronPort-AV: E=Sophos;i="5.91,237,1647327600"; d="scan'208";a="252815148"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2022 10:49:47 -0700
X-IronPort-AV: E=Sophos;i="5.91,237,1647327600"; d="scan'208";a="639912650"
Received: from vrgokulr-mobl1.amr.corp.intel.com (HELO [10.251.4.170])
 ([10.251.4.170])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2022 10:49:46 -0700
Message-ID: <d14fddd9-20f9-fe7e-6c12-b5a57c6855da@linux.intel.com>
Date: Thu, 19 May 2022 12:49:45 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Subject: Re: [PATCH] ASoC: max98090: Remove unneeded check in
 max98090_put_enab_tlv()
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>, Alexey Khoroshilov <khoroshilov@ispras.ru>
References: <1652980212-21473-1-git-send-email-khoroshilov@ispras.ru>
 <YoZ+dmprwb5Ohto3@sirena.org.uk>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <YoZ+dmprwb5Ohto3@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: ldv-project@linuxtesting.org, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org
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



On 5/19/22 12:29, Mark Brown wrote:
> On Thu, May 19, 2022 at 08:10:12PM +0300, Alexey Khoroshilov wrote:
>> Variable sel is of unsigned int type, so sel < 0 is not required.
>>
>> Found by Linux Verification Center (linuxtesting.org) with SVACE.
> 
>>  	val = (val >> mc->shift) & mask;
>>  
>> -	if (sel < 0 || sel > mc->max)
>> +	if (sel > mc->max)
> 
> The check needs to be moved, not removed.  The userspace ABI allows
> passing in of negative values.

I was about to send the same cleanup, cppcheck reports the same issue
with a useless test.

The problem is that the values coming from userspace are cast to unsigned...
