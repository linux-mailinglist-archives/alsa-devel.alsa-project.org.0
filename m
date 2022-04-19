Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 78003506463
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Apr 2022 08:27:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 19ED71622;
	Tue, 19 Apr 2022 08:26:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 19ED71622
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650349640;
	bh=YCE8h16zsqHS4QHQNOGRDdN8mC1Z82LLhq4aJHFfAGo=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=o52m4CdjICLAo0FzylwWK9LMB8GJQWDCh6ib2J5bFfVLZmXV76/ohMOO6Fbs3Sfvg
	 CMfDmefob4AGetHrVa21VWBULxWhutZqXiyo9ZonDNdipJRHVZ+RlRXmdib5WXTT/s
	 wJolHhdgWZWAKvTj46zSGk4sq+4YRhEehSUa8mXQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 758BCF80269;
	Tue, 19 Apr 2022 08:26:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0C1CEF8025D; Tue, 19 Apr 2022 08:26:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9D30FF80116
 for <alsa-devel@alsa-project.org>; Tue, 19 Apr 2022 08:26:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9D30FF80116
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="E9TFAilX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650349573; x=1681885573;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=YCE8h16zsqHS4QHQNOGRDdN8mC1Z82LLhq4aJHFfAGo=;
 b=E9TFAilX1T3yngD1ginHcS4xOfEoAgutkOm4UT/vQnHvXYITZzi6IT5x
 Dv36NUObysjxMPXaUU17ABIVHGCKdZaMfuRhe+7KKTo63aYDFW6P1vc2B
 h6CE5/ch043fcberpPTzQQ5a1sNN67ZW63Iopm5H+Cl3h+A7trBt+upFC
 MFVOOQpmC4xL2iKYN7CvNOkodmhdKmPaOqOKlGWGXtj9hISPSlJwWhV0K
 qcQAIflTOL5pDeC3YP92CNgwh2h29CavHSQllRpTKxfiTHnpTRW7y10zV
 M+tlMXSuIbihV0tRuer5eqNH4UWKz8zCAM71ST+wo6D94z90rYJzc1P06 w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10321"; a="263150590"
X-IronPort-AV: E=Sophos;i="5.90,272,1643702400"; d="scan'208";a="263150590"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2022 23:26:06 -0700
X-IronPort-AV: E=Sophos;i="5.90,272,1643702400"; d="scan'208";a="561601898"
Received: from ahfarrel-mobl1.amr.corp.intel.com (HELO ldmartin-desk2)
 ([10.212.228.159])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2022 23:26:06 -0700
Date: Mon, 18 Apr 2022 23:26:06 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [Intel-gfx] [PATCH] ALSA: hda/i915: Fix one too many pci_dev_put()
Message-ID: <20220419062606.73bsepujqcmlnjl3@ldmartin-desk2>
X-Patchwork-Hint: comment
References: <20220416064418.2364582-1-lucas.demarchi@intel.com>
 <alpine.DEB.2.22.394.2204171309420.1532214@eliteleevi.tm.intel.com>
 <20220418045032.74gipx7fo6ajnoib@ldmartin-desk2>
 <s5hilr539ex.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <s5hilr539ex.wl-tiwai@suse.de>
Cc: intel-gfx@lists.freedesktop.org, alsa-devel@alsa-project.org,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>
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

On Tue, Apr 19, 2022 at 07:54:30AM +0200, Takashi Iwai wrote:
>On Mon, 18 Apr 2022 06:50:32 +0200,
>Lucas De Marchi wrote:
>>
>> On Sun, Apr 17, 2022 at 01:13:49PM +0300, Kai Vehmanen wrote:
>> >Hi,
>> >
>> >On Fri, 15 Apr 2022, Lucas De Marchi wrote:
>> >
>> >> pci_get_class() will already unref the pci device passed as argument.
>> >> So if it's unconditionally unref'ed, even if the loop is not stopped,
>> >
>> >thanks Lucas. And yes indeed, overlooked that pci_get_class()
>> >will decrement the from device is specified.
>> >
>> >> --- a/sound/hda/hdac_i915.c
>> >> +++ b/sound/hda/hdac_i915.c
>> >> @@ -127,11 +127,10 @@ static int i915_gfx_present(struct pci_dev *hdac_pci)
>> >>  		display_dev = pci_get_class(class, display_dev);
>> >>
>> >>  		if (display_dev && display_dev->vendor == PCI_VENDOR_ID_INTEL &&
>> >> -		    connectivity_check(display_dev, hdac_pci))
>> >> +		    connectivity_check(display_dev, hdac_pci)) {
>> >> +			pci_dev_put(display_dev);
>> >>  			match = true;
>> >> -
>> >> -		pci_dev_put(display_dev);
>> >> -
>> >> +		}
>> >
>> >Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
>>
>> I applied this to our topic/core-for-CI branch to unblock CI on
>> DG2. Ultimately the target for this is the sound tree though.
>
>The patch looks good, feel free to submit it.

not sure if I was clear. This patch is already targeting the sound tree:
it should apply cleanly.

topic/core-for-CI in the drm subsystem is a "temporary branch" while we
don't backmerge with the sound changes.

Lucas De Marchi

>
>
>thanks,
>
>Takashi
