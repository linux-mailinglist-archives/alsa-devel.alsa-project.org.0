Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EC06F46A1F4
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Dec 2021 18:03:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3514D20E2;
	Mon,  6 Dec 2021 18:02:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3514D20E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638810227;
	bh=CruF0XwkjUihaS83rBxrZFreo0S5fgSA6XpLfr2goEI=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ObeWuwafQbGJEKiJw41QBWDMcaipTiZvw4hVB/Fq0OEeSrdRgPcZUMJ2vVGsKhwV1
	 J1IKDCSGmZ92PQup2+zSvkQeFAhUJrlOw6sx0T0ZswgCseaUqxKLCbPXWuaq7IlROH
	 UniF7mrBsrmS+aTky0pZsem8XJJDK5Gdh5eTlvrM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 93D5AF80118;
	Mon,  6 Dec 2021 18:02:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 50B1FF804EC; Mon,  6 Dec 2021 18:02:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1B7F2F80118
 for <alsa-devel@alsa-project.org>; Mon,  6 Dec 2021 18:02:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1B7F2F80118
X-IronPort-AV: E=McAfee;i="6200,9189,10190"; a="323612239"
X-IronPort-AV: E=Sophos;i="5.87,292,1631602800"; d="scan'208";a="323612239"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2021 09:01:29 -0800
X-IronPort-AV: E=Sophos;i="5.87,292,1631602800"; d="scan'208";a="460898846"
Received: from jcsee-mobl2.ccr.corp.intel.com (HELO [10.209.128.127])
 ([10.209.128.127])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2021 09:01:28 -0800
Subject: Re: [PATCH v2] kselftest: alsa: Add simplistic test for ALSA mixer
 controls kselftest
To: Mark Brown <broonie@kernel.org>
References: <20211206160305.194011-1-broonie@kernel.org>
 <33692870-fccc-6d63-2c95-056a21fff791@linux.intel.com>
 <Ya48u+Wx+ZZyfYIO@sirena.org.uk>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <b2972e61-e6c2-9f60-6242-3762c88efe0a@linux.intel.com>
Date: Mon, 6 Dec 2021 11:01:25 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <Ya48u+Wx+ZZyfYIO@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org,
 Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org
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


>>> +// This test will iterate over all cards detected in the system, exercising
> 
>> would it make sense to test only specific cards? People doing automated
>> tests might have a USB device for capture of analog loopbacks, or
>> injection of specific streams for capture, and usually care about
>> testing such devices - which do need manual setups and wiring btw.
> 
> It's not really idiomatic for kselftest to require any per system
> configuration by default - half the thing is that you can just run it
> and it should do as much as it can sensibly on the system.  You could
> definitely add some command line options for development or manual usage
> though.

I was thinking of adding this test to our CI, it's a bit orthogonal to
self-tests indeed. IIRC we check that we can modify all the PGA settings
for volume control but this test is a lot more generic.
