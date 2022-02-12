Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 93B984B37AD
	for <lists+alsa-devel@lfdr.de>; Sat, 12 Feb 2022 20:43:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0DE3C1703;
	Sat, 12 Feb 2022 20:43:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0DE3C1703
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644695033;
	bh=SDWhEPKdxG3jj5E3ANzpkQEokeEWPlB/oOc1OGZLrQg=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uK5cL0PdVM/UEKXm7haZUBhx8TOF3IfrPrPn1KqqH1Zj6dR5bar6puXOdHYvjZMwX
	 LoTd9dwwfOOuCPUElid9qFc/5wWpg3/HRaYRpMZEJPUsRkIlikXgA+4e5ARTItw9o4
	 Q5NAKhz6ujJcw3CXsixPztZlgd5n/cc08xBlHdCg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4693DF800BF;
	Sat, 12 Feb 2022 20:42:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8323EF8014E; Sat, 12 Feb 2022 20:42:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 14ACEF800B0
 for <alsa-devel@alsa-project.org>; Sat, 12 Feb 2022 20:42:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 14ACEF800B0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="U0eD4Ro3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644694956; x=1676230956;
 h=message-id:date:mime-version:subject:to:references:cc:
 from:in-reply-to:content-transfer-encoding;
 bh=SDWhEPKdxG3jj5E3ANzpkQEokeEWPlB/oOc1OGZLrQg=;
 b=U0eD4Ro3EhHlZccFAygv/Yj4CxL70fK5Ac9SzjdfPWn/2IeqFfWJV/kn
 rEyTT5Quy917bQQTUrnnp5sx4oze03A+Ru7QMGvug3aJ7qMYgvS00myTB
 sTIkuJpLcFHqjixq19sPV7v+ZeokDuXaFm/KWt2f0HnvH3NCcoRNcVFlO
 uGyhA3lnw9CPY+QMl9Y3vZHsVHYn0fAPLK0GAAq4Wrp+1x3LbIvyIAeES
 1tag18m/PugW9ibEn4gwCrNMbJhgMz44ByP+ypFw9DHtvFZgZN3eBWxab
 b7UVYfsRHQaJpEhxM57hx/oGgQ7EMtwDT0wyi1pPRFns7fUe74MWZtiV8 w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10256"; a="336323827"
X-IronPort-AV: E=Sophos;i="5.88,364,1635231600"; d="scan'208";a="336323827"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2022 11:42:29 -0800
X-IronPort-AV: E=Sophos;i="5.88,364,1635231600"; d="scan'208";a="527341522"
Received: from nafrose-mobl.amr.corp.intel.com (HELO [10.209.153.118])
 ([10.209.153.118])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2022 11:42:29 -0800
Message-ID: <2db61794-d772-8df6-a843-fd1512cfaa57@linux.intel.com>
Date: Sat, 12 Feb 2022 13:42:28 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Subject: Re: Cannon Lake PCH cAVS (ALC892) not detected by kernel driver
Content-Language: en-US
To: dmummenschanz@web.de, alsa-devel@alsa-project.org
References: <trinity-f018660b-95c9-442b-a2a8-c92a56eb07ed-1644345967148@3c-app-webde-bap22>
 <209270c3-4a46-d6a1-0f1d-d4400ecc5962@linux.intel.com>
 <trinity-c5ab92fd-fbab-4431-8579-f8576a9ba71e-1644390880605@3c-app-webde-bap12>
 <c71dbf89-80a3-538e-6ebe-e1d1869183e8@linux.intel.com>
 <trinity-dc5c0214-ab7c-48bf-a502-e93062638611-1644425274650@3c-app-webde-bap11>
 <trinity-7e2e8baa-0f43-4b12-902d-a907bd7efb79-1644665613748@3c-app-webde-bs56>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <trinity-7e2e8baa-0f43-4b12-902d-a907bd7efb79-1644665613748@3c-app-webde-bs56>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: Takashi Iwai <tiwai@suse.de>, "Vehmanen, Kai" <kai.vehmanen@intel.com>
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



On 2/12/22 05:33, dmummenschanz@web.de wrote:
>    I did some more digging into the code to find out what goes boink.
>    For comparison I took my wife's desktop wich has a  Cannon Lake chipset
>    as well along with a working a ALC892 AVS device.
> 
>    It seems there is a codec mask issue selected in the chip->bus struct.
>    Inside the function
> 
>    static int azx_probe_continue(struct azx *chip)
> 
>    of hda_intel.c the bus->codec_mask on my wife's pc contains the integer
>    value "5" and both ALC892 and the HDMI is found. On my device it is "4"
>    and only the HDMI is found.
> 
>    /* create codec instances */
>    if (bus->codec_mask) {
>      err = azx_probe_codecs(chip, azx_max_codecs[chip->driver_type]);
>      if (err < 0)
>        goto out_free;
>    }
> 
>    After forcing the falue before probing: "bus->codec_mask = 5;" the
>    ALC892 is finally detected on my system and I have sound! alsa-info
>    below: Please pardon the trash printk's in the log ;-)
> 
>    http://alsa-project.org/db/?f=057aac1a0e9591de3847dca5ebc424dd65c8a221
> 
>    I'll do some more digging into it next week but it would probably
>    save tons of time if someone could point me is the right direction
>    where to look further?

Adding Kai and Takashi, in case they haven't see this codec_mask issue.
I personally don't recall having seen this before.


