Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A8D97FB65A
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Nov 2023 10:54:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 47749950;
	Tue, 28 Nov 2023 10:53:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 47749950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701165245;
	bh=Ze3suMCTxMx1XPVCl0jboSQdHdduZbjsqMTzoxtQyUc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nc9dTun29leLBBH/Ex9l8THXS/9QKWNq3npbxCiItIGJUVa+rj31SAX5XHfE571Pd
	 QS3w0SSvFwrOJOh3VqINBxHHRZtDn299vF4Tk7mXuAYbXbCpoT59Po8oXImzl9Va/i
	 mMKJWOgo1PhajDNMCNk4xjqwnLGNcZU8V7Xm0pD4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 530C5F8057B; Tue, 28 Nov 2023 10:53:34 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8E416F80578;
	Tue, 28 Nov 2023 10:53:33 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 66648F8016E; Tue, 28 Nov 2023 10:53:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6A723F800F5
	for <alsa-devel@alsa-project.org>; Tue, 28 Nov 2023 10:53:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6A723F800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=MmU2JeLp
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701165207; x=1732701207;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Ze3suMCTxMx1XPVCl0jboSQdHdduZbjsqMTzoxtQyUc=;
  b=MmU2JeLpMO3qF5BZ6llNeRdvmq4Ics3HgcbzPpbTIxPujoR8/5dGS0ye
   l5cuuKD2IXPbxd+cnB9Ie6vozL5cMU8Fwgc/iWoYIEYkwbrb/HwjF2pVy
   iqQDhYPVzqRJCdrdDySiAUi73iEzXMIqTZXjgar2Z+Xj132c/Yqv2skDc
   kVlZlsYk43zl4ERBhzGcGRbaZFqLsnsfVFf6z7obh1LzZ9wSpGcotD5Qk
   RycKEUCN0vccQrfGRNQ0NsRgGrADesAwef6mNMnTD3HL9pkkUHttT0BjA
   Wrmzo7qFR0ta3kQi/9I2Q5dxVzXv52ykaSqOWpBU13459XQESr+uxzcW8
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="424042140"
X-IronPort-AV: E=Sophos;i="6.04,233,1695711600";
   d="scan'208";a="424042140"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2023 01:53:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="744847068"
X-IronPort-AV: E=Sophos;i="6.04,233,1695711600";
   d="scan'208";a="744847068"
Received: from anikafix-mobl.ger.corp.intel.com (HELO [10.251.221.103])
 ([10.251.221.103])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2023 01:53:21 -0800
Message-ID: <e40a3b5d-425e-427c-bec2-6b82d8f5ee94@linux.intel.com>
Date: Tue, 28 Nov 2023 11:53:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] ALSA: hda/hdmi: Add helper function to check if a
 device is HDMI codec
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>
Cc: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 pierre-louis.bossart@linux.intel.com, kai.vehmanen@linux.intel.com,
 ranjani.sridharan@linux.intel.com
References: <20231127130245.24295-1-peter.ujfalusi@linux.intel.com>
 <20231127130245.24295-2-peter.ujfalusi@linux.intel.com>
 <87jzq3pc6r.wl-tiwai@suse.de>
 <d2fff7cd-ea4b-41b9-992b-fab6ba6549ec@linux.intel.com>
 <87cyvvp8t6.wl-tiwai@suse.de>
 <8ede931b-8c9c-4b95-83e5-5f0db9819e8e@linux.intel.com>
 <878r6jp6jd.wl-tiwai@suse.de>
 <b0c4b724-fe34-4e55-81fe-146e1b52839d@linux.intel.com>
 <875y1np5g2.wl-tiwai@suse.de>
 <be4c418d-5147-4d4b-aa9b-a8e6f3c10a30@linux.intel.com>
 <87y1eimd23.wl-tiwai@suse.de>
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <87y1eimd23.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: VCDNJFPTSM3UGARXGERQIM3NFYMRPDHV
X-Message-ID-Hash: VCDNJFPTSM3UGARXGERQIM3NFYMRPDHV
X-MailFrom: peter.ujfalusi@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VCDNJFPTSM3UGARXGERQIM3NFYMRPDHV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 28/11/2023 11:39, Takashi Iwai wrote:
> Hm...  I still find it's a bad move to use an exported symbol from
> another codec driver.

The other option is to check for 0x4 (or address 2), but I'm not sure if
this is Intel only or universally true for HDMI codecs.

> And, I wonder what if you have a system that has only one HDMI codec
> without analog one?  Would it still work with your change? 

Yes, it works with only HDMI codec (for example on SoundWire laptops) or
with UP2 board which only have HDMI audio support by default.

It also works if we disable HDMI and only have analog codec.

-- 
Péter
