Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EDBE67E2DB
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Jan 2023 12:14:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2B2A2868;
	Fri, 27 Jan 2023 12:13:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2B2A2868
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674818042;
	bh=BM+4344hA//hm+S8NKm14kMPGZIP0OpVEzCnk4QHcPw=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=GuKQ6XgIZEBUBapE/+ykT84/+Wky5uo7YdA4pvSeF2Wjr0UyzLEJkoBu4aWweXMMz
	 Z5OGRoPMgxJkOg9g/iH0nybPspzBT/7TIdX2F2Z65R5vU9tkUeOBQr1xuBLQtbNlFH
	 GhLJAEliE4hopHdo9UqlVlIU2EiuaSAXo6CmfR3w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4EB58F80224;
	Fri, 27 Jan 2023 12:13:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6C8C4F80424; Fri, 27 Jan 2023 12:12:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 21FF5F80224
 for <alsa-devel@alsa-project.org>; Fri, 27 Jan 2023 12:12:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 21FF5F80224
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=VNP0E+L2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674817969; x=1706353969;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=BM+4344hA//hm+S8NKm14kMPGZIP0OpVEzCnk4QHcPw=;
 b=VNP0E+L2KbS3o8rv4i64usZgRDhqEG26+2NwmQgLjUkEejXqjo90MyTS
 cyCp0d7PbO9eAtZMNv68u8C/MMoSHbaoMfoGXLoJvx56xJsppx2AXXACs
 wNwMEmwREkb3VxVmmOFmjI4J31YSQhuOCn9brEOEt/k7dol9TkNYkWOXY
 rnAgZ36+qrwtev1XwbcJqHMM/IzmDSdyNSBmWW2814X3ep0zuJBH74juQ
 iMt4vPhqMO6W9Hsl33Y84StqJMdPiKuDLheWriT+mDURF9lPh8kowVQo4
 edTIj1w5M6e7L4levZ4EQQ3EiIaSpfzpdgSjQyPHRDyRIhP5/RvaW1bur A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10602"; a="329192630"
X-IronPort-AV: E=Sophos;i="5.97,250,1669104000"; d="scan'208";a="329192630"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2023 03:12:43 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10602"; a="787186784"
X-IronPort-AV: E=Sophos;i="5.97,250,1669104000"; d="scan'208";a="787186784"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.99.16.144])
 ([10.99.16.144])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2023 03:12:42 -0800
Message-ID: <5f7e9b31-ad1f-0948-5673-0732d73a185e@linux.intel.com>
Date: Fri, 27 Jan 2023 12:12:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 11/11] ASoC: topology: Unify kcontrol removal code
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Mark Brown <broonie@kernel.org>
References: <20230125194649.3485731-1-amadeuszx.slawinski@linux.intel.com>
 <20230125194649.3485731-12-amadeuszx.slawinski@linux.intel.com>
 <40207a2a-3f2a-bbef-74f6-9e85ced3150a@linux.intel.com>
From: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <40207a2a-3f2a-bbef-74f6-9e85ced3150a@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 1/25/2023 4:15 PM, Pierre-Louis Bossart wrote:
> 
> 
> On 1/25/23 13:46, Amadeusz Sławiński wrote:
>> Functions removing bytes, enum and mixer kcontrols are identical. Unify
> 
> they are identical because of the change in patch10.
> 
> Please clarify that this is not a cleanup removing duplicated code
> that's been there forever, it's become useless as a result of the
> previous patch.
> 

There is no dependency on previous patch - it is just order I've send 
them in - those functions have same implementation in current code.
