Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 59F41393108
	for <lists+alsa-devel@lfdr.de>; Thu, 27 May 2021 16:37:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C44111705;
	Thu, 27 May 2021 16:36:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C44111705
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622126266;
	bh=Tm4RjM6mY/1dlclyYkTI4/Il3tmJ2zOr0xjIRpkcs3Q=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mfwUE6LlzgJGGu843hT/ZpxhDG5LPZc2t/qb99AS+Y2M3EYas6vurD8rYZ/3XZR7T
	 qU5JlVv5cSP8Y8UYR0OHbQN3GwFfE/9LtpwXT7XyhYRz9b3XI+e1lwItKgDSuq0jzd
	 CgNbKYSgfUp0vBJEXFS00pQdFw38WZnVF+O8D7gg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 13099F80149;
	Thu, 27 May 2021 16:36:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3347BF80147; Thu, 27 May 2021 16:36:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A, RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4AE38F80116
 for <alsa-devel@alsa-project.org>; Thu, 27 May 2021 16:36:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4AE38F80116
IronPort-SDR: u6Clz5iC7fKk/hFx1Tj3si1g7ZEXKmqEJmAHKxmVVhr7XPLa7B6JqMid7out4yFatIoz4lslLZ
 +rnrRqAUirRg==
X-IronPort-AV: E=McAfee;i="6200,9189,9996"; a="202753543"
X-IronPort-AV: E=Sophos;i="5.82,334,1613462400"; d="scan'208";a="202753543"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2021 07:35:49 -0700
IronPort-SDR: VyXnJFRqh7L5QSXzuSzNhi19QCn45yjheBmm5t3apelB5SWqEjdISqxR//ZszS55BLOPK0M9ju
 2qXCqliKiozg==
X-IronPort-AV: E=Sophos;i="5.82,334,1613462400"; d="scan'208";a="443591955"
Received: from tanjimah-mobl2.amr.corp.intel.com (HELO [10.212.121.28])
 ([10.212.121.28])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2021 07:35:48 -0700
Subject: Re: Internal microphone does not work with 5.12 (Tiger Lake, X1 Nano)
To: Nico Schottelius <nico.schottelius@ungleich.ch>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>
References: <874keoijzh.fsf@ungleich.ch>
 <f2e7c889-cc99-63b3-3bd3-302faf1745fa@perex.cz> <87r1hs31h6.fsf@ungleich.ch>
 <alpine.DEB.2.22.394.2105271343540.3922722@eliteleevi.tm.intel.com>
 <877djk8jw2.fsf@ungleich.ch>
 <alpine.DEB.2.22.394.2105271551100.3922722@eliteleevi.tm.intel.com>
 <87h7io8e97.fsf@ungleich.ch>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <a9f03425-cdd7-1a14-fcbe-abdce5e1a21f@linux.intel.com>
Date: Thu, 27 May 2021 09:35:47 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <87h7io8e97.fsf@ungleich.ch>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org
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




>> arecord -fdat -vv -Dplugw:0,6 -c4 /dev/null
> 
> That does not work:
> 
> [15:55] nb3:~% arecord -fdat -vv -Dplugw:0,6 -c4 /dev/null
> ALSA lib pcm.c:2660:(snd_pcm_open_noupdate) Unknown PCM plugw:0,6
> arecord: main:830: audio open error: No such file or directory

typo: you need to use plughw:0,6 or just hw:0,6

> 
> However, recording with audacity produces to results:
> 
> - no sound recorded by default
> - sound recorded when I plugin an external headset
> 
> And using arecord -fdat -vv -c4 /dev/null (without -Dplugw) I get
> output, but the level is always 00% without the headset, ranges 02 ~ 90%
> with the headset plugged in.
> 
> I was wondering if there's a hardware switch "broken"
> for the detection of the headset and that's why the mic is muted
> internally?

No, the DMIC has nothing to do with the headset, it's an independent 
interface.
