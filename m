Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E79A74AF66D
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Feb 2022 17:21:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8A1CC18F2;
	Wed,  9 Feb 2022 17:20:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8A1CC18F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644423705;
	bh=nsKVMWfxwfN8ccpXygbn+n5LKV9dHgDtT5ldM3gNEMk=;
	h=Date:From:Subject:To:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cnCJO0F7+v4zCW+bj+06e8cl31/jGMgygvTH5dlzbhlp2cGPHjkG6aJpiXak6bnWt
	 Y++2i/CXiCROQBT11FGDufHE8fWI6nnAoG20IkfXcq8Qwdr3FcLJ/f7XGTZzuafhab
	 bZHkNd3JpzGHBfdbhjBsG2AW7AMYCTD/35yH+g1E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0DBDFF800ED;
	Wed,  9 Feb 2022 17:20:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 66417F8016A; Wed,  9 Feb 2022 17:20:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,PRX_BODY_65,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 73712F800ED
 for <alsa-devel@alsa-project.org>; Wed,  9 Feb 2022 17:20:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 73712F800ED
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="AJpbKcZs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644423635; x=1675959635;
 h=message-id:date:mime-version:from:subject:to:cc:
 references:in-reply-to:content-transfer-encoding;
 bh=nsKVMWfxwfN8ccpXygbn+n5LKV9dHgDtT5ldM3gNEMk=;
 b=AJpbKcZsxduN56Z5cmV/n0hbfNrdb2MINHj+AwZEGNCXMsqR+nYjCdeO
 CX1eeiMHDtEbGyuTK5IQcN1kZSaY2Hqd0pLifcmQn79FVjbwtw9RuzaZ9
 A3SdD47Lefq72mcz8LYKjLlgBGWwD6sR2edDBXGTILYaqu3xaCPlIlEtj
 Ci6DJ8OAvNZuHtrp/yzKjbekt2saR4yCAFFcV1FSfZ/73VSiqKXAnAi8n
 AkwUN3pYNhI+PZk2nFCDsf9JfG2ctxWEm6ihWug5mjQ4I9KYmubTaitTX
 DHRptj5gP8GME4HdJGlAlmpjhYeH3NaNXxjrYzwNaVEbiqtf1WHrDvAqO g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10252"; a="248999420"
X-IronPort-AV: E=Sophos;i="5.88,356,1635231600"; d="scan'208";a="248999420"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2022 08:20:32 -0800
X-IronPort-AV: E=Sophos;i="5.88,356,1635231600"; d="scan'208";a="482379492"
Received: from qiangfan-mobl.amr.corp.intel.com (HELO [10.212.86.102])
 ([10.212.86.102])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2022 08:20:30 -0800
Message-ID: <4d90d851-753e-3e6d-b51a-eefb2159a48c@linux.intel.com>
Date: Wed, 9 Feb 2022 10:08:09 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 3/4] ALSA: hda: Update and expose codec register procedures
To: Cezary Rojewski <cezary.rojewski@intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>
References: <20220207114906.3759800-1-cezary.rojewski@intel.com>
 <20220207114906.3759800-4-cezary.rojewski@intel.com>
 <alpine.DEB.2.22.394.2202081753430.3088432@eliteleevi.tm.intel.com>
 <c144c67d-e6a8-1baa-82e8-37065c053919@intel.com>
 <41671a26-bd27-78ab-3440-eb9cb22c1ad1@linux.intel.com>
 <23f36ba1-277c-6998-f569-2861887720dd@intel.com>
Content-Language: en-US
In-Reply-To: <23f36ba1-277c-6998-f569-2861887720dd@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, upstream@semihalf.com, harshapriya.n@intel.com,
 rad@semihalf.com, tiwai@suse.com, hdegoede@redhat.com, broonie@kernel.org,
 cujomalainey@chromium.org, lma@semihalf.com
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



On 2/9/22 06:05, Cezary Rojewski wrote:
>> FWIW, in our latest SOF work we went back to handling ONE DAI with
>> analog playback and capture and ditched the 'digital playback'. Trying
>> to do more led us to too many issues of 'works on platform A' and 'does
>> not work on platform B', and sometimes with different answers depending
>> on which BIOS version is used.
>>
>> IMHO what's really problematic for HDaudio is the support for amplifiers
>> located behind the HDaudio codec, for which we more often than not are
>> missing the I2C configuration sequences. Suspend-resume is a recurring
>> problem as well.
>>
>> I am not saying no for the sake of saying no, I have just never heard of
>> anyone complain about restrictions on the number of DAIs in the HDaudio
>> world.
> 
> 
> I believe our goals align. Rather than hardcoding Analog/Alt
> Analog/Digital endpoints as it's done currently, when codec most of the
> time do not have them working anyway, rely on behavior found in
> sound/hda and sound/pci/hda. If there are some problems there it's
> win:win for us and legacy driver. Fix one spot, have both drivers happy.

I don't quite see the alignment: the only thing that we've seen work
reliably and that we do need is the analog part, and we want to get rid
of the other paths which we can't test in the first place. I must admit
I don't recall why we bothered to expose those alt analog and digital
paths back in 2018, they have not been used nor tested by anyone.

Now if this patch helped to make sure we do indeed have an analog path,
that'd be fine. That would indeed avoid a hard-coded decision and report
configuration errors.

I just don't see what exposing additional paths brings, they never
worked reliably for us when we tried. IIRC half of our team gets an
error with the Digital playback stream on Up Extreme and the other half
can play just fine - albeit with no connector to actually see what the
output is.

FWIW there are many things made possible by HDaudio, in practice we
often have to limit ourselves to what is known to work and what is
needed by end-products. You could spend all your time chasing
configuration issues, missing NIDS and bad verbs. Been there, done that.
