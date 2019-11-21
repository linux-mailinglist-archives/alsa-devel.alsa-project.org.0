Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6073F1055EB
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Nov 2019 16:44:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EBD91176F;
	Thu, 21 Nov 2019 16:43:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EBD91176F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574351054;
	bh=+s2iO9e8lvLHT9afpXzoeUJ7L9Zgra2M6AeAS7fCj5Q=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EZZGxuVLXB+efhxQC/3LTIkuI1D7N6/PgzepIahIcSe3+dScJz12uVsP0XkHA89Xd
	 8QUS49duzVldXgbAzBMVIriNIG6RPAabUdCCzReeoVesUtyzLa/nQVUXeQRWGmJoLQ
	 lipriqGMSra1ZYpdi59zZYzD9Sxnq+owcRXxCNR8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B1451F800EF;
	Thu, 21 Nov 2019 16:41:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6669BF80146; Thu, 21 Nov 2019 16:41:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 41F2CF80146
 for <alsa-devel@alsa-project.org>; Thu, 21 Nov 2019 16:41:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 41F2CF80146
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 21 Nov 2019 07:41:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,226,1571727600"; d="scan'208";a="205105013"
Received: from ptan2-mobl1.amr.corp.intel.com (HELO [10.255.231.235])
 ([10.255.231.235])
 by fmsmga008.fm.intel.com with ESMTP; 21 Nov 2019 07:41:33 -0800
To: Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>
References: <20191120174435.30920-1-perex@perex.cz>
 <20191121115124.GA4071@sirena.org.uk>
 <7a527497-6132-c1df-d083-6cd27361eb08@perex.cz>
 <20191121121136.GB4071@sirena.org.uk>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <a08eb3a2-49d4-5637-256f-ac8a1debc305@linux.intel.com>
Date: Thu, 21 Nov 2019 09:14:15 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <20191121121136.GB4071@sirena.org.uk>
Content-Language: en-US
Cc: Takashi Iwai <tiwai@suse.de>,
 ALSA development <alsa-devel@alsa-project.org>
Subject: Re: [alsa-devel] [PATCH v2 1/2] ASoC: improve the DMI long card
 code in asoc-core
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



On 11/21/19 6:11 AM, Mark Brown wrote:
> On Thu, Nov 21, 2019 at 01:02:38PM +0100, Jaroslav Kysela wrote:
>> Dne 21. 11. 19 v 12:51 Mark Brown napsal(a):
>>> On Wed, Nov 20, 2019 at 06:44:34PM +0100, Jaroslav Kysela wrote:
> 
>>>> -	/* make up dmi long name as: vendor.product.version.board */
>>>> +	/* make up dmi long name as: vendor-product-version-board */
> 
>>> I'm worried about this from an ABI point of view with people's UCM
>>> files.  But perhaps I'm worrying about nothing?
> 
>>    this is just the C comment fix. The long name is already in
>> vendor-product-version-board - no dots as delimiters (but does are allowed
>> in the fields like version strings). This code improvement does not change
>> the format of the generated long name string from the DMI information.
> 
> Ah, it looked from my initial scan like it was being changed as a result
> of the factoring out of the append code.

I had the same reaction on v1, it's just cleaning up a bad comment indeed.

This looks good to me, especially the removal of redundant parts, so for 
the patch 1..2

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
