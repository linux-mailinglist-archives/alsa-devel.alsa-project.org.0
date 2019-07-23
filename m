Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 680B471A96
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Jul 2019 16:39:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CBEBB18B0;
	Tue, 23 Jul 2019 16:38:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CBEBB18B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563892783;
	bh=GCP+/vTFbqFD1Kpa4P5di9plFeRFNJkGDbDAzaTCtRs=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oHmn4I+srLR4EnYDehElOXCDuKzzOVUuhIcH5gGroYh2vYoc8wfUiYtGbyKdzm0Yt
	 rzaUYVpUv8+Z9slsVnRgNxpuNw2xRX5m3tFUKKnmcbsm4bzXHMffLg+j9m1n7TlLsG
	 SA0dHevsxUVPf8kD+P9MjzSTjUNu+sRXhHdCg76M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E0557F8011C;
	Tue, 23 Jul 2019 16:37:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BE680F80447; Tue, 23 Jul 2019 16:37:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 302D7F800E8
 for <alsa-devel@alsa-project.org>; Tue, 23 Jul 2019 16:37:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 302D7F800E8
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 Jul 2019 07:37:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,299,1559545200"; d="scan'208";a="180755382"
Received: from linux.intel.com ([10.54.29.200])
 by orsmga002.jf.intel.com with ESMTP; 23 Jul 2019 07:37:46 -0700
Received: from xiliu-mobl1.amr.corp.intel.com (unknown [10.252.200.163])
 by linux.intel.com (Postfix) with ESMTP id C3F745801AB;
 Tue, 23 Jul 2019 07:37:45 -0700 (PDT)
To: Mark Brown <broonie@kernel.org>
References: <20190722141402.7194-1-pierre-louis.bossart@linux.intel.com>
 <20190722141402.7194-19-pierre-louis.bossart@linux.intel.com>
 <20190723111515.GD5365@sirena.org.uk>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <cabe9c2b-359d-deb6-93ee-e42b1400ea27@linux.intel.com>
Date: Tue, 23 Jul 2019 09:37:47 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190723111515.GD5365@sirena.org.uk>
Content-Language: en-US
Cc: tiwai@suse.de, alsa-devel@alsa-project.org,
 Rander Wang <rander.wang@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH 18/21] ASoC: SOF: Intel: hda: fix link DMA
 config
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

On 7/23/19 6:15 AM, Mark Brown wrote:
> On Mon, Jul 22, 2019 at 09:13:59AM -0500, Pierre-Louis Bossart wrote:
>> From: Rander Wang <rander.wang@linux.intel.com>
>>
>> For this bug, there are two capture pcm streams active, with one
>> stream and its related stream tag released before suspend. Later
>> when system suspend is done, the stream tag for the remaining
> 
> In general fixes should come at the start of a series so that they can
> be applied as such and sent to Linus without getting caught up with
> dependencies on development work.

Yes, but in this case we had two developers that changed the code and I 
couldn't really move code around too much.
You have a good point though, we should ask for the 'fix' subject to be 
used really for true fixes that should have a more direct integration 
path or go to linux-stable.
Thanks for the merges.

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
