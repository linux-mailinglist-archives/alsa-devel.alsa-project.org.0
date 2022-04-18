Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 94C5B504BC6
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Apr 2022 06:51:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1C09216AF;
	Mon, 18 Apr 2022 06:50:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1C09216AF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650257505;
	bh=cfktYVGize/9L8lI+GmjizlWPnVBMy3GzJp3zy7UjQM=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KzBBuVlGVJPotXTWebvRFYXO/VQX/iw7HN98tNI2IiXKcG2eJoOH3PPYDauRpnOzA
	 nRrzok7QSRFLE1q2tFK1lVv1ceIgBlLbXarvpepB1eAJSETUZVTyFwsqnjjSw29o3J
	 tqA8Y0U94j3rNCUf1ZLTas0QsPUgSLX2sP9YN41M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9474CF80121;
	Mon, 18 Apr 2022 06:50:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2DEF4F8014E; Mon, 18 Apr 2022 06:50:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F3176F80121
 for <alsa-devel@alsa-project.org>; Mon, 18 Apr 2022 06:50:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F3176F80121
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="NrvHJhen"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650257439; x=1681793439;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=cfktYVGize/9L8lI+GmjizlWPnVBMy3GzJp3zy7UjQM=;
 b=NrvHJhenC6r3jiVJ0debgq8OAhEwfTQayRENO/0zc1iVTvSJJnVFfnbC
 +IXel1SqhUIECvD6/qn5DXS8HTIcwv3hUduHM7EQlagwNwwhFQBwhqXs6
 NsRIUKaBCJx3zgn4zq7x4Lubexn65MAeppqZ2XtHmPf9rVoZ7bNGEWmwe
 rZGxfHDY30HWw14nInfywYU4knOPeriLgPHqVaEEH/36BstmNcW/Yw4IS
 12oU3i2TjnZ/+2G+sQ1/tbLF0V1eIEofBhOgp1TsPmbq9Rf6F8KVO7wk1
 +YfQGMr5HycsCV6kIvzOS2KbqYyhzHs337WSYqtUzNukA5B7XZc3gLNh2 g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10320"; a="244033116"
X-IronPort-AV: E=Sophos;i="5.90,267,1643702400"; d="scan'208";a="244033116"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2022 21:50:33 -0700
X-IronPort-AV: E=Sophos;i="5.90,267,1643702400"; d="scan'208";a="528727377"
Received: from araviraj-mobl.amr.corp.intel.com (HELO ldmartin-desk2)
 ([10.212.181.3])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2022 21:50:32 -0700
Date: Sun, 17 Apr 2022 21:50:32 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH] ALSA: hda/i915: Fix one too many pci_dev_put()
Message-ID: <20220418045032.74gipx7fo6ajnoib@ldmartin-desk2>
X-Patchwork-Hint: comment
References: <20220416064418.2364582-1-lucas.demarchi@intel.com>
 <alpine.DEB.2.22.394.2204171309420.1532214@eliteleevi.tm.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2204171309420.1532214@eliteleevi.tm.intel.com>
Cc: Takashi Iwai <tiwai@suse.de>, intel-gfx@lists.freedesktop.org,
 alsa-devel@alsa-project.org
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

On Sun, Apr 17, 2022 at 01:13:49PM +0300, Kai Vehmanen wrote:
>Hi,
>
>On Fri, 15 Apr 2022, Lucas De Marchi wrote:
>
>> pci_get_class() will already unref the pci device passed as argument.
>> So if it's unconditionally unref'ed, even if the loop is not stopped,
>
>thanks Lucas. And yes indeed, overlooked that pci_get_class()
>will decrement the from device is specified.
>
>> --- a/sound/hda/hdac_i915.c
>> +++ b/sound/hda/hdac_i915.c
>> @@ -127,11 +127,10 @@ static int i915_gfx_present(struct pci_dev *hdac_pci)
>>  		display_dev = pci_get_class(class, display_dev);
>>
>>  		if (display_dev && display_dev->vendor == PCI_VENDOR_ID_INTEL &&
>> -		    connectivity_check(display_dev, hdac_pci))
>> +		    connectivity_check(display_dev, hdac_pci)) {
>> +			pci_dev_put(display_dev);
>>  			match = true;
>> -
>> -		pci_dev_put(display_dev);
>> -
>> +		}
>
>Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>

I applied this to our topic/core-for-CI branch to unblock CI on
DG2. Ultimately the target for this is the sound tree though.

thanks
Lucas De Marchi


>
>Br, Kai
