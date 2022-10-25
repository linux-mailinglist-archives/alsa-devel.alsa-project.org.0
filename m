Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DD01560D1D6
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Oct 2022 18:46:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5A7824E0A;
	Tue, 25 Oct 2022 18:46:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5A7824E0A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666716416;
	bh=7GFgHD8VpMSSYSQYldtRzowtwwtMBpNwmVTSdlESscM=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UFuR9oUFTLrWMLlbtDcRDbjFMvFfNDCUm0+TpkfR0o4EjCpFxJgsiaR8sri76VwA+
	 zIlzkblj5vGOLm8fDIf9s08CncuCCN5IGyxgdZQ3yy40/VHm/VTyCa97Z0Qgwu7plO
	 bbna4m2kfbarfRjmTLsNnYgnzA5thKQuCMAkrpGA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BDFB7F80448;
	Tue, 25 Oct 2022 18:46:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D652EF80431; Tue, 25 Oct 2022 18:45:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4EF95F80100
 for <alsa-devel@alsa-project.org>; Tue, 25 Oct 2022 18:45:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4EF95F80100
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="TK36o+EG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666716354; x=1698252354;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=7GFgHD8VpMSSYSQYldtRzowtwwtMBpNwmVTSdlESscM=;
 b=TK36o+EGqlXqUKs0PbLX3gPH/lKhC7zJ6W3pODXDmR2AsGbNg3rXbrub
 QObur4qKOJcyhOqna4xo/yNlqCMLjG0Ey6ZLQpi1bDw0ixmRH9aIlpNbY
 SJsxnQC5EDCGU/MKOa3assTdyxo/ejmBpiUxX4/qwL+/UGGsWz79rXvef
 rGLODlQ1I8gUo7OxtyS0Fm53ftU8gx2iyZxDpB7l2DZwzFpC/YoUiyYfa
 YeSn3q0fjMdqgNjZbfS5Y6/MBA3cR8bTu/Dq32TlMWCrCLUQ+KYQpb04q
 SiqcPurkVmiTjXtscHZqC78Y/4Ovh1Ews6QVy7plNgvHg8/DTnRYk7aP0 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10511"; a="369797260"
X-IronPort-AV: E=Sophos;i="5.95,212,1661842800"; d="scan'208";a="369797260"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2022 09:45:39 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10511"; a="664977540"
X-IronPort-AV: E=Sophos;i="5.95,212,1661842800"; d="scan'208";a="664977540"
Received: from pperezji-mobl.amr.corp.intel.com (HELO [10.212.98.192])
 ([10.212.98.192])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2022 09:45:38 -0700
Message-ID: <0aafc75f-942a-531d-5e78-a8fb211f43bc@linux.intel.com>
Date: Tue, 25 Oct 2022 11:45:37 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.2.2
Subject: Re: [PATCH AUTOSEL 6.0 07/44] ALSA: hda: Fix page fault in
 snd_hda_codec_shutdown()
Content-Language: en-US
To: Greg KH <gregkh@linuxfoundation.org>
References: <20221009234932.1230196-1-sashal@kernel.org>
 <20221009234932.1230196-7-sashal@kernel.org>
 <24d084e1-700d-da77-d93e-2d330aac2f63@linux.intel.com>
 <Y1f3opiid6pvKINq@kroah.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <Y1f3opiid6pvKINq@kroah.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: Sasha Levin <sashal@kernel.org>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, Takashi Iwai <tiwai@suse.de>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, tiwai@suse.com,
 alsa-devel@alsa-project.org, peter.ujfalusi@linux.intel.com,
 mkumard@nvidia.com
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



On 10/25/22 09:50, Greg KH wrote:
> On Tue, Oct 25, 2022 at 09:27:32AM -0500, Pierre-Louis Bossart wrote:
>>
>>
>> On 10/9/22 18:48, Sasha Levin wrote:
>>> From: Cezary Rojewski <cezary.rojewski@intel.com>
>>>
>>> [ Upstream commit f2bd1c5ae2cb0cf9525c9bffc0038c12dd7e1338 ]
>>
>> This commit on linux-stable seems to have broken a number of platforms.
>>
>> 6.0.2 worked fine.
>> 6.0.3 does not
>>
>> reverting this commit solves the problem, see
>> https://github.com/thesofproject/linux/issues/3960 for details.
>>
>> Are we missing a prerequisite patch for this commit?
> 
> Please see https://lore.kernel.org/r/20221024143931.15722-1-tiwai@suse.de
> 
> Does that solve it for you?

Yep, that's the revert I tested.
