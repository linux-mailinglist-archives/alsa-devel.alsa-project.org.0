Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E089679EAF
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Jan 2023 17:33:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 85F73E79;
	Tue, 24 Jan 2023 17:32:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 85F73E79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674577994;
	bh=bbQ68vp4p70cezHKpSPtAyagsGbylpmeadaY4+e+QHY=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=k+fyTwf2px5hjv25GoVfmfYzl5BpDEIr3mcf0jgn9/lzJNq9G5dHrHjvSgDyaR1p6
	 2ATzGU4ym3nBKbgLWE6Yk6a4AfJezZHnh9QTFNNYXG77ySWjoRgIA0qpte8jIE0LYx
	 Gj1/z/1qfm4KMQQi5AhiN4c5zD1pjdofLj4Rigrk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7BB84F800FB;
	Tue, 24 Jan 2023 17:32:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8D5D1F8027D; Tue, 24 Jan 2023 17:32:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0D8BDF801D5
 for <alsa-devel@alsa-project.org>; Tue, 24 Jan 2023 17:32:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0D8BDF801D5
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=SxFTFaP3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674577929; x=1706113929;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=bbQ68vp4p70cezHKpSPtAyagsGbylpmeadaY4+e+QHY=;
 b=SxFTFaP3whGEWq7FMQv4JULsf9AunWkA8GIQYn89jmaIicuYK4RTicIb
 l8KRTtfJl2jk/akyqI+GOZlAj++BiQdtH1wxEVnFd6qeQhgRop972cGVP
 ePdDIwhwPz+ADKlKR+j9yMK7OE47AraaZbbiz089dDRu2+F+8iy9EKXSt
 NETROk4OC/GJk6QX0bD9CIGbxC67Wn1Fm2LhjsAxFB0nJgsuW/szamifG
 zCYOGLKzbVg4cmz0y+1kmFZ7RVkO2DohrXzfE7cASm8wGuzZ7SGW+WN0c
 Cq9cA8jBf3KtW4yGGopMBSk8OBwxZP6G1ju1CNPfq8EkQZlDXwty7ufT6 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="309907101"
X-IronPort-AV: E=Sophos;i="5.97,242,1669104000"; d="scan'208";a="309907101"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2023 08:32:04 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="907560803"
X-IronPort-AV: E=Sophos;i="5.97,242,1669104000"; d="scan'208";a="907560803"
Received: from spark7-mobl112.amr.corp.intel.com (HELO [10.212.105.13])
 ([10.212.105.13])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2023 08:32:03 -0800
Message-ID: <47d687e3-50e4-967e-3c4a-846cfa4e3755@linux.intel.com>
Date: Tue, 24 Jan 2023 10:32:03 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.4.2
Subject: Re: Intel sof-hda-dsp breaks suspend after using Pro Audio UCM
Content-Language: en-US
To: Jesse Hathaway <jesse@mbuki-mvuki.org>, alsa-devel@alsa-project.org
References: <CANSNSoUqROMDVAVb9ZFQbxRdBEAg7k86YHcyihp6hjoEokti6Q@mail.gmail.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <CANSNSoUqROMDVAVb9ZFQbxRdBEAg7k86YHcyihp6hjoEokti6Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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



On 1/24/23 10:22, Jesse Hathaway wrote:
> PipeWire added the Pro Audio profile for UCM devices[^1]. After that
> patch was included with PipeWire 0.3.64, my laptop was no longer able to
> suspend after the profile was loaded. The problem appears to be on the
> kernel side. A bug was opened on PipeWire[^2] as well as the kernel's
> bugzilla[^3]. Here is the relevant output from dmesg:

can you please file an issue here:
https://github.com/thesofproject/linux/issues

Thanks!
