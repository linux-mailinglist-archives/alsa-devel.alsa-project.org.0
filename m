Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CE10F4E3092
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Mar 2022 20:11:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CDDC3172E;
	Mon, 21 Mar 2022 20:10:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CDDC3172E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647889906;
	bh=Su7mCKLTSHBPJO65EWytogv1A/s1aZ3OKdDBlqK/Z8w=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Dnjy/i/d3trPKfZ2a8LPV+XyjaqNRLkU4cHsI60myEa4s3nGnlrWUXTXfUNxOgmV+
	 zNZeLm4xzBUs6N1jE6nycXxcoI6gYmimhUOF3LKkwXI1v063TmGcgYOSG620zJtqEZ
	 zZLyI5YdcHb7gmiuTj66Ntfk7HySdJDRFk9i7+58=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 39303F80238;
	Mon, 21 Mar 2022 20:10:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 31D2FF80227; Mon, 21 Mar 2022 20:10:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D1B05F80109
 for <alsa-devel@alsa-project.org>; Mon, 21 Mar 2022 20:10:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D1B05F80109
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="MnNW4ItB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647889834; x=1679425834;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Su7mCKLTSHBPJO65EWytogv1A/s1aZ3OKdDBlqK/Z8w=;
 b=MnNW4ItBBFOw3bkXrRxc0LMHj6Qzi3XC5xLxINthBOOYd1MH0jXrAESx
 CAHZHp1Mn7uV4WACbN3XMlrXaIBGkCiK0INHZy/q0g8ySYJPkdm/alBGM
 7NkRPyMfkqsICijBUXTp/SONxPVbo49lSiAglBxKOfno2pA5PggjPUhQd
 jt40OsvRuaieNKqOEzB6mnncYH+3fLjyQx1OZ0bcqp57RG2FyHUguku2I
 JIAcM8mpkIrE6ZojCdI4LU7kKA0ZjURiidPH+/QS2LPvVZqT9Ao50Qg/7
 k8Kt59mklnTECjaja4KFUG22n88P36ViVEX2rXCIUz8G3Idhx0esBP3oi g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10293"; a="257578594"
X-IronPort-AV: E=Sophos;i="5.90,199,1643702400"; d="scan'208";a="257578594"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2022 12:10:24 -0700
X-IronPort-AV: E=Sophos;i="5.90,199,1643702400"; d="scan'208";a="518556364"
Received: from brandony-mobl1.amr.corp.intel.com (HELO [10.209.106.163])
 ([10.209.106.163])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2022 12:10:24 -0700
Message-ID: <3e063161-d37f-4a2c-c545-e3e93afee682@linux.intel.com>
Date: Mon, 21 Mar 2022 13:14:19 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Subject: Re: [RFC 08/13] ASoC: Intel: avs: Declare path and its components
Content-Language: en-US
To: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org
References: <20220207132532.3782412-1-cezary.rojewski@intel.com>
 <20220207132532.3782412-9-cezary.rojewski@intel.com>
 <20d0c619-443f-b714-269a-0a71b5f09cef@linux.intel.com>
 <7d87bda9-75aa-47e1-986e-cd2366a4636e@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <7d87bda9-75aa-47e1-986e-cd2366a4636e@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: upstream@semihalf.com, harshapriya.n@intel.com, rad@semihalf.com,
 tiwai@suse.com, hdegoede@redhat.com, broonie@kernel.org,
 amadeuszx.slawinski@linux.intel.com, cujomalainey@chromium.org,
 lma@semihalf.com
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




>>> +struct avs_path {
>>> +    u32 dma_id;
>>
>> that is very surprising...
>>
>> This would seem to limit the concept of an avs path to a single host DMA
>> channel, which somewhat contradicts that there can be multiple pipelines
>> in the same path, or that a path can contain mixers.
>>
>> And even if this is a single dma, what does this represent? the
>> stream_tag? the BE DMA for SSP/DMIC?
>>
>> Please clarify the concepts first, it's frustrating to discover this at
>> patch 8.
> 
> A single path is tied to either FE or BE. So at most to a single, 
> user-visible endpoint if it's FE. If there are more FEs, then we move to 
> NxFE <-> 1xBE scenario. You can have many pipelines forming the path - 
> most of the pipelines do not contain module connected to any gateway 
> (HDA/SSP/DMIC etc.) anyway.

This should have been explained in the cover letter.

Assuming that there's a single Back-End that can handle all possible 
routing cases is a very narrow interpretation of how DPCM is supposed to 
be used, and it adds quite a few opens on routing changes that can't be 
handled with regular triggers. What happens when not all interfaces are 
handled by the DSP 'gateway' is also interesting.
