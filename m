Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AED96604522
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Oct 2022 14:22:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5A595A3BE;
	Wed, 19 Oct 2022 14:21:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5A595A3BE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666182145;
	bh=QkAScQUhmfE2lJEAOVlS7vMdphofBZHdIvcz0h82Pms=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DNhMTCMF7Yp1YaqzNysAmBsweTToij+nackyLUkqV/E5AlNSfEEsCIsxcvctU2cHe
	 qUyr23T5uyA+JGCPG8948TUfL6//2dt96EjmxOPxweYPuEsmhj+76xb8gShIZQqhPU
	 UVmN1i4EazomRZPfwt83ub2nP7RxrCh44TF5q5lk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E6D65F804E0;
	Wed, 19 Oct 2022 14:21:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 95C41F804E0; Wed, 19 Oct 2022 14:21:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B3D9FF80137
 for <alsa-devel@alsa-project.org>; Wed, 19 Oct 2022 14:21:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B3D9FF80137
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="ejwDZvTb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666182087; x=1697718087;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=QkAScQUhmfE2lJEAOVlS7vMdphofBZHdIvcz0h82Pms=;
 b=ejwDZvTbK4mSJapftEYAa1pTipszhUncl85Jbll8jdcHL+R7wi1RxkEE
 LwvA6XsvW88K1ZatCsl5fyg2dPZOg4V/M3tX7nqStU4kPFS1KbyYuAxfT
 vVb8yBBQe35S7CNgs1l1IxFz48aobvImlVpEdRlFV07UUd6B5P4k3X2d8
 wIyDxBNur7WZTDP2KrYs348oSxZNj1BzMS7j5+930D5g2VB4BpfVVnDIQ
 VndOr2zYauSJWzkvHUU0r1LIhqXApKBb5xss1MemCsON4UfpEs4+/NVTs
 jSUF/dqPJni85lnoiZGkOhT+L7AHlybVBcryVqsETqcJ3GQ7yN5vmBovS Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10504"; a="368445916"
X-IronPort-AV: E=Sophos;i="5.95,196,1661842800"; d="scan'208";a="368445916"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2022 05:21:13 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10504"; a="660324668"
X-IronPort-AV: E=Sophos;i="5.95,196,1661842800"; d="scan'208";a="660324668"
Received: from akirui-mobl.ger.corp.intel.com (HELO [10.252.27.10])
 ([10.252.27.10])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2022 05:21:11 -0700
Message-ID: <b0f5f9b3-1ff0-77d2-9985-681a71128253@linux.intel.com>
Date: Wed, 19 Oct 2022 15:21:35 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.3.3
Subject: Re: [PATCH 12/19] ASoC: SOF: Intel: Set the default firmware library
 path for IPC4
Content-Language: en-US
To: Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>, lgirdwood@gmail.com,
 broonie@kernel.org
References: <20221018120916.19820-1-peter.ujfalusi@linux.intel.com>
 <20221018120916.19820-13-peter.ujfalusi@linux.intel.com>
 <4e501a9d-45bb-0ef0-6900-a61af5d4bae0@linux.intel.com>
 <b9e10ec7-1c4f-a2bf-7471-26b92616ce14@linux.intel.com>
 <06f141c4-cf3b-f227-2f94-625ffcda79f6@intel.com>
 <522cf594-a56a-6649-9bce-b616bf8f47ca@linux.intel.com>
 <28d040a5-52dd-a8ac-2217-7f71cbf8e905@intel.com>
 <52b62b01-420a-75b8-4355-784f5eb7d62b@linux.intel.com>
 <ede9830d-9208-6fd1-cd60-c570cb5dbfff@intel.com>
From: =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <ede9830d-9208-6fd1-cd60-c570cb5dbfff@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: chao.song@intel.com, alsa-devel@alsa-project.org,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com
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



On 19/10/2022 14:58, Cezary Rojewski wrote:
> On 2022-10-19 1:16 PM, Péter Ujfalusi wrote:
>> at the moment:
>> # ls -al /lib/firmware/intel/ | wc -l
>> 108
>>
>> We might have 2 sets of binaries per platform, one using product key,
>> other using community key.
>>
>> If we dump everything in one directory (/lib/firmware/intel/), things
>> will go out of hand pretty easily which can be somehow handled with
>> complex file naming. This is only for the basefw, then we have the
>> libraries (however they are sourced) with again two sets of keys,
>> platforms.
>>
>> Surely it can be done, but historically SOF prefers to use directories
>> instead of pre/mid/post-fixing patterns of file names.
> 
> The concern is understandable. We haven't said that firmware files
> should be put directly under intel/ though.
> 
>> Also note that SOF is looking for a module UUID when trying to load a
>> library we don't track arbitrary file names (see cover letter).
> 
> Neither 'dsp_fw_' nor 'dsp_lib_' prefix is arbitrary.

Sure, but if you add things like platform, key type...

> A library may
> consist of more than one module, each with unique UUID. In general,
> 'library' does not equal 'module'.

See the cover letter.

The SOF implementation is to use the module UUID as a file name when it
comes to libraries. It is not our intention to maintain a UUID to
filename mapping in kernel to looks for a specific module (which might
be part of a bundle-library).

We have clear instructions for external library producers on how to
handle this and so far it holds up in scenarios we can think of.

Surely, this is not the only way to implement it, but this is closer to
the SOF way.

> Now, when speaking of modules,
> firmware-loading procedure that searches for file with certain UUID in
> its name is part of other drivers too and I haven't questioned that -
> it's perfectly fine and we're making use of the method ourselves.

Glad to hear that it is not only me/us to take this path ;)

-- 
Péter
