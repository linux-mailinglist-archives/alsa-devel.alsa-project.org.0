Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9766D1E50BF
	for <lists+alsa-devel@lfdr.de>; Wed, 27 May 2020 23:56:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2ADB616BD;
	Wed, 27 May 2020 23:55:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2ADB616BD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1590616577;
	bh=CaMvZyTMEdjJ90+35/IZlx6kPVbif4rLHOQcy0F73c8=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VBmjrRahDe45wmJS4DyXz1tQkcqMVXJf0TbW16DbbY5y3XVa2SrmepiQ7LQ4ZjKJX
	 Qk8BHc1YXxwRnprfkY5xY2D2EEAbJ12KfltWXXBZtZqEz6e4amH66A2PTrDFFM5ztg
	 hhwgCdZlqgAn9jdUEovbeagV3I9L1HJ+gS9eN1ds=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6C400F8016F;
	Wed, 27 May 2020 23:54:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 07B29F8014E; Wed, 27 May 2020 23:54:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BC17CF800CD
 for <alsa-devel@alsa-project.org>; Wed, 27 May 2020 23:54:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BC17CF800CD
IronPort-SDR: Wo1T2EKlNxSYt4df787QnHORDqo8AwNvxYvAG2DDzrEjjJpzkCaI/LQeed7dQS3sI6a8BJgd04
 JUQjc1wMn18Q==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2020 14:54:20 -0700
IronPort-SDR: reMdfE92fWFz7ETpYiHsghYvufmPqi//lrcgAa4ke28Mr1S7+E2fnkPnrUZIRS3o8u2UIERAX0
 WKAA7TDtHQ9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,442,1583222400"; d="scan'208";a="376161389"
Received: from truongmi-mobl1.amr.corp.intel.com (HELO [10.255.229.101])
 ([10.255.229.101])
 by fmsmga001.fm.intel.com with ESMTP; 27 May 2020 14:54:19 -0700
Subject: Re: [PATCH 0/4] Kconfig updates for DMIC and SOF HDMI support
To: Mark Brown <broonie@kernel.org>
References: <20200427165211.23463-1-ranjani.sridharan@linux.intel.com>
 <00d4ea9242cad11b7aab10326b7430f6106d63e3.camel@linux.intel.com>
 <d9931fc5-56a2-5626-5cee-aeadc7cc976a@linux.intel.com>
 <20200527204944.GL5308@sirena.org.uk>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <5bc72558-1a6a-e92b-5390-fee7980f3945@linux.intel.com>
Date: Wed, 27 May 2020 16:54:19 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200527204944.GL5308@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, Arnd Bergmann <arnd@arndb.de>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 kai.vehmanen@linux.intel.com
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



On 5/27/20 3:49 PM, Mark Brown wrote:
> On Wed, May 27, 2020 at 03:17:27PM -0500, Pierre-Louis Bossart wrote:
> 
>> Mark, is there any issue with this patchset? This series posted last month
>> will conflict with Arnd's RT5682 cleanups (just tried, see below). I don't
>> mind re-sending the patches on top of Arnd's, please let us know what's
>> easiest for you. Thanks!
> 
> I don't know what's going on with this patch set is any more, I was
> expecting Ranjani to resend it if things had got lost (like my "no
> pings, please resend" form letter says).

no worries, we will resend after Arnd's fix goes in.
