Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AC44836252C
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Apr 2021 18:08:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3427016C8;
	Fri, 16 Apr 2021 18:07:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3427016C8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618589305;
	bh=7A74cTZdZAVgnxs5pu+uMSliznPVvJ9YpjHI6IT4YvI=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jp6RKKZED49Hcm1a6xUy2w08NSQ/QuZfEhy48gQzyYfvK/9mGDaBSE6uZTs4uDNFk
	 8Rd6zwkLU5rm2F6lxVn/mhNV8LHeanl9+k1lBwKOGq1GKuj9SiTKT0dq0dNVLleAWX
	 1m3oK2kXaniVX5V1sTQv2MaV1fpzJREHzg28Gmrg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ED79BF80277;
	Fri, 16 Apr 2021 18:07:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D0D6FF80273; Fri, 16 Apr 2021 18:07:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1318AF80269
 for <alsa-devel@alsa-project.org>; Fri, 16 Apr 2021 18:07:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1318AF80269
IronPort-SDR: vcVZuC5b2UwWAv6/Vki8MhO5dw2qwBsjkY7VPUAb6ZLegeCJSrjmu4/408O79pGTrdsABAwnUI
 5C5FbAmtF+Jw==
X-IronPort-AV: E=McAfee;i="6200,9189,9956"; a="280379376"
X-IronPort-AV: E=Sophos;i="5.82,226,1613462400"; d="scan'208";a="280379376"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2021 09:06:02 -0700
IronPort-SDR: 6GtPivPQnFbNzuw33E38dhZAHiEJBJjC6VJoHI9uFNZHs3fWpHdG9/j7xP6M0Yv1JEmRc+MtZB
 JueIKLhPm1uA==
X-IronPort-AV: E=Sophos;i="5.82,226,1613462400"; d="scan'208";a="615993218"
Received: from jaolanlo-mobl.amr.corp.intel.com (HELO [10.212.2.231])
 ([10.212.2.231])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2021 09:06:01 -0700
Subject: Re: [PATCH] ALSA: hda/realtek: Add quirk for Lenovo Ideapad S740
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.de>,
 alsa-devel@alsa-project.org, Kailang Yang <kailang@realtek.com>
References: <20210416081211.20059-1-tiwai@suse.de>
 <be178038-8e42-34db-3804-f27240b2d488@perex.cz>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <a5fee517-c12e-1cb0-755f-453d6bb47795@linux.intel.com>
Date: Fri, 16 Apr 2021 11:05:17 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <be178038-8e42-34db-3804-f27240b2d488@perex.cz>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Ryan Prescott <ryan@cousinscomputers.net>
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



On 4/16/21 3:47 AM, Jaroslav Kysela wrote:
> Dne 16. 04. 21 v 10:12 Takashi Iwai napsal(a):
>> Lenovo Ideapad S740 requires quite a few COEF setups to make its
>> speakers working.  The verb table was provided from Ryan Prescott as
>> the result of investigation via qemu:
>>    https://github.com/ryanprescott/realtek-verb-tools/wiki/How-to-sniff-verbs-from-a-Windows-sound-driver
> 
> [Cc: to Kailang / Realtek]
> 
> I believe that this sequence contains I2C writes to amplifier chips. It would
> be really helpful, if Realtek can provide more information for the I2C master
> interface for their codecs (describe basic I2C I/O).

The biggest problem is to figure what address/value pairs to write with 
I2C into the amplifiers, and here the catch is that those I2C/I2S 
amplifiers may or may not be sourced from Realtek, and it'd be difficult 
for Realtek to provide documentation on their competition, wouldn't it?
