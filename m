Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B153538FD66
	for <lists+alsa-devel@lfdr.de>; Tue, 25 May 2021 11:05:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 438791655;
	Tue, 25 May 2021 11:05:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 438791655
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621933555;
	bh=MAL7BoScPAjph4MOBa/TcmLT/0ri13lF3N4H/Il0ZPI=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LPqe/mXpIP0aw9WEG14vBntOHiKqxkFm7eHIFkZ3ROc5OOSySBcwLS2sj3xAX5i/r
	 W81zaBl4ZSBltHwiFOQS7hQIlq4FDFALkKny3E7f0ezADjq8RU/7PHmmzkYBCfaKIR
	 6+3cNTb9FJuh27K3Vtqvj7pbpLro3bN4+V5kE0cc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C5632F8011B;
	Tue, 25 May 2021 11:04:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 578BDF801EB; Tue, 25 May 2021 11:04:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A, RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4DF79F80137
 for <alsa-devel@alsa-project.org>; Tue, 25 May 2021 11:04:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4DF79F80137
IronPort-SDR: sCL1bLjh9O1r4Ah1VzcdiZW9aluRwbL6VMxfozxmnCWOjeBCr+QuDTpk8A/NBwWbpgMbWCzIn0
 OOx+mSKZRI3g==
X-IronPort-AV: E=McAfee;i="6200,9189,9994"; a="202162174"
X-IronPort-AV: E=Sophos;i="5.82,328,1613462400"; d="scan'208";a="202162174"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2021 02:04:18 -0700
IronPort-SDR: 6Gus7v+UdcOr7dTUZiYDiqFUarNSr6OIbbE787/IvfiaXQw65RP2ueYeIbAAebmrGXM4TYf9Qe
 L25m2PtuOFqw==
X-IronPort-AV: E=Sophos;i="5.82,328,1613462400"; d="scan'208";a="476324351"
Received: from pujfalus-mobl.ger.corp.intel.com (HELO [10.252.39.140])
 ([10.252.39.140])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2021 02:04:17 -0700
Subject: Re: [PATCH] ALSA: hda: Add Lenovo ThinkStation P340 to
 power_save_denylist
To: Takashi Iwai <tiwai@suse.de>
References: <20210524152533.7479-1-peter.ujfalusi@linux.intel.com>
 <s5hfsybe0vo.wl-tiwai@suse.de>
 <3e7428d2-2cfd-5835-33ef-72f3a2f43324@linux.intel.com>
 <s5h5yz7dxxj.wl-tiwai@suse.de>
From: "Ujfalusi, Peter" <peter.ujfalusi@linux.intel.com>
Message-ID: <2a2cc0cc-a7b4-9981-b463-06919ced72a8@linux.intel.com>
Date: Tue, 25 May 2021 12:04:14 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <s5h5yz7dxxj.wl-tiwai@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, tiwai@suse.com, kai.vehmanen@linux.intel.com
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



On 5/25/2021 11:23 AM, Takashi Iwai wrote:
>>> Let's check other possibilities
>>> at first, e.g. setting auto_mute_via_amp flag.  This can be achieved
>>> even via hints in an early patching specified via "patch" option of
>>> snd-hda-intel module (see Documentation/sound/hda/notes.rst for some
>>> information).
>>
>> Unfortunately the auto_mute_via_amp has no effect on the pop.
>> line_in_auto_switch and pin_amp_workaround have no effect either.
> 
> How about applying alc_fixup_no_shutup() or alc_fixup_disable_aamix()?

it looks like

SND_PCI_QUIRK(0x17aa, 0x1048, "Lenovo ThinkStation P340",
ALC269_FIXUP_NO_SHUTUP),

in alc269_fixup_tbl[]

alone fixes the pop noise, I'll send a new patch to do this instead.

Thanks,
Péter
