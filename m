Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 602FE18AE40
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Mar 2020 09:23:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C6A3F1757;
	Thu, 19 Mar 2020 09:22:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C6A3F1757
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584606207;
	bh=8ZYEKYbMfxGur+jiOc1N6aH8sbXMqkYOugutltJXp4M=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NqolVpo/PC0N/dozy0wXd29zmIFTDrRawvidDP/ZuUMMR0eQ90G4Y9u2YgTb31zMq
	 jKq48fJUJ1iWCZcG0UNkaSEDpgZvTquxxciI+QAWmi6lA9SYh/QE1uVlgLhs32Hygs
	 GtVovL2X9GtY79H83axTfzr1u/+qktUynSORqTuc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BC7E7F80217;
	Thu, 19 Mar 2020 09:21:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 548F9F8022B; Thu, 19 Mar 2020 09:21:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D604FF800C0
 for <alsa-devel@alsa-project.org>; Thu, 19 Mar 2020 09:21:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D604FF800C0
IronPort-SDR: mN4bAbTQjH/k4DCj1aevK34ioFiriKzonI/m+Ldzbk47C10MwvAJMW1NdOzQjaja+mnyF2ZdvG
 WWwA6jAN5Nrw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2020 01:21:31 -0700
IronPort-SDR: XTnp5gdgq6ZRbL/UauO7N+rHXO0A5qT2SdyxPL7t2Nz4qSL7Osq62Ldw8gOw0bKY1GlUbGIaYl
 lPEaOhTDuJNw==
X-IronPort-AV: E=Sophos;i="5.70,570,1574150400"; d="scan'208";a="418263265"
Received: from mgorski-mobl.ger.corp.intel.com (HELO [10.252.45.85])
 ([10.252.45.85])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2020 01:21:29 -0700
Subject: Re: [PATCH] ucm2: hdadsp: add basic ucm config
To: Kai Vehmanen <kai.vehmanen@linux.intel.com>
References: <20200306113031.713-1-mateusz.gorski@linux.intel.com>
 <4e2e3345-81d0-c698-d589-d4db5faff288@perex.cz>
 <8cd9195d-6104-88ed-22ed-c3151334ee76@linux.intel.com>
 <1bd9d86c-e19f-183c-5355-5b7359c6e4c0@perex.cz>
 <7a44ec22-ed38-5ddd-0f04-097b2befd796@linux.intel.com>
 <alpine.DEB.2.21.2003181328110.2957@eliteleevi.tm.intel.com>
From: "Gorski, Mateusz" <mateusz.gorski@linux.intel.com>
Message-ID: <30a2f8b0-1f5d-2fef-8408-26e4016a6b90@linux.intel.com>
Date: Thu, 19 Mar 2020 09:21:27 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2003181328110.2957@eliteleevi.tm.intel.com>
Content-Type: text/plain; charset=iso-8859-15; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: pl
Cc: alsa-devel@alsa-project.org, tiwai@suse.com, cezary.rojewski@intel.com
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


> Hey,
>
> On Tue, 17 Mar 2020, Gorski, Mateusz wrote:
>> Yes, it is a part of Skylake driver, "hdadsp" is the name of sound card
>> created on machine when using HDA generic machine driver. This machine driver
>> is made of 2 .c files:
>>
>>      - skl_hda_dsp_common.c
>>      - skl_hda_dsp_generic.c
> btw, this machine driver is also used by SOF, but name is prefixed:
>
>   - HDA with DSP and SST FW -> "hda-dsp" as the card name
>   - HDA with DSP and SOF FW -> "sof-hda-dsp" as the card name
>
> And of course without DSP we have also:
>   - HDA no DSP	           -> "HDA-Intel" as card name
>
> While we try to share what is possible, the topologies will be different
> for all three, and thus different UCM files are needed.
>
> Br, Kai


UCMs for "sof-hda-dsp" and "HDA-Intel" are already present on the 
alsa-ucm-conf repo, only the "hda-dsp" one is missing right now.
There is also a second e-mail thread with patch adding topology for 
hda-dsp which is compatible with this UCM configuration.

Thanks,
Mateusz

