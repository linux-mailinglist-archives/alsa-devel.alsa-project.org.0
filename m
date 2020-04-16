Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D0D81AB9F8
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Apr 2020 09:30:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DB3891662;
	Thu, 16 Apr 2020 09:29:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DB3891662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587022217;
	bh=IUtumwMOkukF24bZiyyIRmFb7iLPA0Pwt93DPRyxKiw=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bncEoOG2lAy+IreCcfjW3YrE9H9HJ4cZ3SHkZgtMJNdrlFr7a4Ffr1tU/BKdZbzwI
	 KfkiaZNLGngbq+9v1Nnxj4PEkCKIZ5KsO9dXKvOZ8bh+tuVDjAfFYxtqDzeywAPJtC
	 phM/hU51F/oA21XwxkeEO1xSgoEVMUioJMFjkuDc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F1D95F80299;
	Thu, 16 Apr 2020 09:27:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E485BF8028F; Thu, 16 Apr 2020 09:27:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 05132F8028B
 for <alsa-devel@alsa-project.org>; Thu, 16 Apr 2020 09:27:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 05132F8028B
IronPort-SDR: iy+FoeOm5pmDLLhi6VwrS5oLk/TcxaOZpY4ulgPB2jd7LqDx0Eoow6TVmDw19/2BkYCwKoXo9V
 Crsk6OEgjI7Q==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2020 00:27:35 -0700
IronPort-SDR: yPp5K+i57MWmPxB8q+27JQkOxNOFA1BKDkWIVHCPZ6a7nOfEGZuxIbsaTisWlCXhA1XKOgShOZ
 pawJnZ2zKpJA==
X-IronPort-AV: E=Sophos;i="5.72,390,1580803200"; d="scan'208";a="427732197"
Received: from mantonie-mobl.ger.corp.intel.com (HELO [10.249.140.64])
 ([10.249.140.64])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2020 00:27:33 -0700
Subject: Re: [PATCH 1/3] ASoC: codecs: hdac_hdmi: Fix incorrect use of
 list_for_each_entry
To: Mark Brown <broonie@kernel.org>
References: <20200415162849.308-1-amadeuszx.slawinski@linux.intel.com>
 <20200415172513.GI5265@sirena.org.uk>
From: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
Message-ID: <af6087bd-315a-43f7-e283-1b35ec48cdd4@linux.intel.com>
Date: Thu, 16 Apr 2020 09:27:29 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200415172513.GI5265@sirena.org.uk>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 Takashi Iwai <tiwai@suse.com>
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



On 4/15/2020 7:25 PM, Mark Brown wrote:
> On Wed, Apr 15, 2020 at 12:28:49PM -0400, Amadeusz Sławiński wrote:
>> If we don't find any pcm, pcm will point at address at an offset from
>> the the list head and not a meaningful structure. Fix this by returning
>> correct pcm if found and NULL if not. Found with coccinelle.
> 
> I only have patch 1/3 here and no cover letter - what's going on with
> dependencies?
> 

Oops, I'm sorry about this. There is only this patch, do you want me to 
resend?
