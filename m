Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D7D30200418
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Jun 2020 10:36:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DBF101680;
	Fri, 19 Jun 2020 10:35:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DBF101680
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592555769;
	bh=TcyfnhQnoyH+E0PhL9YlOQeEnES3z7aR3TVf3eeruKc=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fMwYi2cedssV/LQRd7UlpUZemfRiR5WzE91sBJXflHzR5jzv2aifATEjakSsjRk6D
	 ckvkCp43NrLY8p4nan3MWo170nbNlwQ9bt96gmz3/HQxLHVirHOtG4ouRNCsES4IGh
	 tRur1AJ/5axw2ZITGix0iNYD9mxD6B7BD16vPy6c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F1338F80255;
	Fri, 19 Jun 2020 10:34:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6608FF80252; Fri, 19 Jun 2020 10:34:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 16FE6F80232
 for <alsa-devel@alsa-project.org>; Fri, 19 Jun 2020 10:34:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 16FE6F80232
IronPort-SDR: xS05vnTt401y483ORoGXdNLEoGwOPiDkWQhf0/SsRp3Y4NyzTIVaS3TwiuI96Tci4St0Cc0xLD
 s6VmeqHNuuvA==
X-IronPort-AV: E=McAfee;i="6000,8403,9656"; a="204378398"
X-IronPort-AV: E=Sophos;i="5.75,254,1589266800"; d="scan'208";a="204378398"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2020 01:34:06 -0700
IronPort-SDR: pqdkReBxGk7QRPSDtCM3X29Dd/JTiTlZCHZfoJVN5+FgTVl5dLOCwYL/W7HGlPHiIYfpfMDGbY
 vYoqLdlNNaVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,254,1589266800"; d="scan'208";a="277935582"
Received: from crojewsk-mobl1.ger.corp.intel.com (HELO [10.213.24.47])
 ([10.213.24.47])
 by orsmga006.jf.intel.com with ESMTP; 19 Jun 2020 01:34:03 -0700
Subject: Re: [PATCH] ASoC: Intel: haswell: Power transition refactor
To: Curtis Malainey <cujomalainey@google.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
References: <20200330194520.13253-1-cezary.rojewski@intel.com>
 <293372ae-5270-a1d4-2577-04991c08e33f@intel.com>
 <ee6c0545-a325-8df4-9c26-d823582735af@linux.intel.com>
 <49a16c64-5951-f327-c12a-d3264353b74b@intel.com>
 <685b8be3-4ff8-5012-c900-8521c2772121@linux.intel.com>
 <CAOReqxiTDafvSiUQFZuqhp1DYT_buaCp5oq01QDSgRm-YK57ng@mail.gmail.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <91f8b0d8-6015-6090-40cf-0647eaa73686@intel.com>
Date: Fri, 19 Jun 2020 10:34:02 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <CAOReqxiTDafvSiUQFZuqhp1DYT_buaCp5oq01QDSgRm-YK57ng@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: ALSA development <alsa-devel@alsa-project.org>,
 Ross Zwisler <zwisler@google.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Dominik Brodowski <linux@dominikbrodowski.net>, Takashi Iwai <tiwai@suse.com>,
 vkoul@kernel.org, Mark Brown <broonie@kernel.org>
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

On 2020-06-19 3:21 AM, Curtis Malainey wrote:
> On Thu, Jun 18, 2020 at 6:19 PM Pierre-Louis Bossart
> <pierre-louis.bossart@linux.intel.com> wrote:

>>
> We reverted this patch locally due to regressions and raised the issue
> with Cezary on Github, we got no response.
> 
> Curtis
>> 8ec7d6043263ecf250b9b7c0dd8ade899487538a is the first bad commit
>> commit 8ec7d6043263ecf250b9b7c0dd8ade899487538a
>> Author: Cezary Rojewski <cezary.rojewski@intel.com>
>> Date:   Mon Mar 30 21:45:20 2020 +0200
>>
>>       ASoC: Intel: haswell: Power transition refactor
>>

Hello,

This is the very first time I see hear about the issue. You raised no 
issue Curtis, instead, you did write a comment mentioning me in Closed 
thread thesofproject/linux which isn't even the driver issue relates to.

If you scroll up a bit, in the very same thread there is a message 
notifying about official path for such issues. Said message was ack'ed 
by management before posting and that's why it's split from technical 
explanation.

We've received no response from Harsha and Cedrik about the issue being 
risen. Official HSD-ticket is left unchanged since my feedback from 3rd 
April.

Help me help you - don't wait until problem escalates. Adhere to 
official protocols, notify early and stay in contact. Last time when 
your 'SOF github-IntelSST BDW' ticket finally did arrive at my desk, I 
drove back to campus, borrowed the only SAMUS we have and by the end of 
the week, the problem was fixed. Monday Mar30 you had the official 
response and patches applied.

I've forwarded your issue to required entities within Intel so issue is 
tracked appropriately.

Regards,
Czarek
