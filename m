Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E4B1E217353
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jul 2020 18:08:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4BCD584D;
	Tue,  7 Jul 2020 18:07:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4BCD584D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594138110;
	bh=eYEXThQnYpvuQhL+0vZzGcAo+NYHllmkOiKTwlZJASo=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Z3b1Vmv5FjeBu3DxrxTOsR6QYqLheljq86nY6lTmuQYmw6xFkoAVA2f+X5Gf1yZsa
	 U+8OjNnMEblutJtU4HW/2HoKha9+W1Dw/Hh291szrfXAtCqR2wpVPAEg5mV2DwVplr
	 z2ROB4OjQdG/84i4ftipCJ/+1B7KJpJtHXvWjEMI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7DFA9F80257;
	Tue,  7 Jul 2020 18:06:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2B937F80257; Tue,  7 Jul 2020 18:06:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2CF7DF801F9
 for <alsa-devel@alsa-project.org>; Tue,  7 Jul 2020 18:06:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2CF7DF801F9
IronPort-SDR: 6UKa0FTNAc2UP1lf9GWmZlJD4Qv7C2oLaewzzs0hld4FOKpDcw0E/xxFEOcREBeYoa9ROag8xz
 m4tdLnoLKipg==
X-IronPort-AV: E=McAfee;i="6000,8403,9675"; a="149148674"
X-IronPort-AV: E=Sophos;i="5.75,324,1589266800"; d="scan'208";a="149148674"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2020 09:06:34 -0700
IronPort-SDR: Liz4To01xgpaSfDU5y1SXo9AcKVsrE/HRKpRQqCHs2F3yXvMjUSSmq6YAnVNXzryJxIg5JcFoZ
 Ii91nupNwusQ==
X-IronPort-AV: E=Sophos;i="5.75,324,1589266800"; d="scan'208";a="305713017"
Received: from stortizs-mobl1.amr.corp.intel.com (HELO [10.254.109.228])
 ([10.254.109.228])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2020 09:06:31 -0700
Subject: Re: [RFC PATCH 10/23] ALSA: usb/line6: remove 'defined but not used'
 warning
To: Takashi Iwai <tiwai@suse.de>
References: <20200702193604.169059-1-pierre-louis.bossart@linux.intel.com>
 <20200702193604.169059-11-pierre-louis.bossart@linux.intel.com>
 <s5hblkreiy5.wl-tiwai@suse.de>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <8dfae7e1-9106-cd00-3fa2-401e941095e2@linux.intel.com>
Date: Tue, 7 Jul 2020 10:49:52 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <s5hblkreiy5.wl-tiwai@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org
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




>> -static const int SYSEX_DATA_OFS = sizeof(line6_midi_id) + 3;
>> -static const int SYSEX_EXTRA_SIZE = sizeof(line6_midi_id) + 4;
>> +static __maybe_unused const int SYSEX_DATA_OFS = sizeof(line6_midi_id) + 3;
>> +static __maybe_unused const int SYSEX_EXTRA_SIZE = sizeof(line6_midi_id) + 4;
> 
> IMO, this can be clearer to make them define.
> The static const doesn't look like a right usage in such a case in
> anyway...

Right, and the capital letters do hint at a define indeed. Will resend, 
thanks Takashi for the review.
