Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 314C56D4D55
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Apr 2023 18:16:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ABBCA1F9;
	Mon,  3 Apr 2023 18:15:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ABBCA1F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680538577;
	bh=8NBFRJQLVJz4PqNEN+e5OYXGPIPVB9eRUEnEkdRToMs=;
	h=Date:From:To:Subject:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=CYuf82SY3ZJb+ubPAim9xXLLaNgYACiK7adepz5c67GhOVoBmOJbEjfiivqRKhrFb
	 pQ7EYa+PNJ3ELviw3eHZnKGfo8lyXSUlOVirV2riyjuKMxyG2RR7/XEFDegam29dPc
	 6jOWaOi82Yk3lw/3+NFSdjZUhPueeGChtN6nbaeQ=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 27475F80249;
	Mon,  3 Apr 2023 18:15:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 247E7F8024C; Mon,  3 Apr 2023 18:15:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8D6CEF80171
	for <alsa-devel@alsa-project.org>; Mon,  3 Apr 2023 18:15:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8D6CEF80171
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=caiKhton
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680538519; x=1712074519;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=8NBFRJQLVJz4PqNEN+e5OYXGPIPVB9eRUEnEkdRToMs=;
  b=caiKhtonTpLqG6kA2HHFL3Uk8tT3F0A4EXiyZVBlpku6xqGGeGN83Xul
   I0QlDyMQT2+i7EvaybVTJIYfU35NsGPEIpEin2W6d4GGwImjDXsvrAbrs
   +vyJ3cUwvBgQAtjORqn7g1v0kf2GEpiLYkAyzgvBGVraoujXLQi+8wCM9
   q/vwIDGF33RH79WahClqwyk4qXe0lTXhzTgfBtTfY3R89L2kjCL+UyZu1
   GXg83gFCGcF4wzqXgiW9qDuHdlYSL2t1GWnC46VZvdkb3wiwT9gMfnvAB
   Fg7PDh/+WGkMI6NA+6PoRdfCQEXLQJpaw0UrE+SjgP10rijvtVhZDvi1Z
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="428232201"
X-IronPort-AV: E=Sophos;i="5.98,315,1673942400";
   d="scan'208";a="428232201"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2023 09:15:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="755309015"
X-IronPort-AV: E=Sophos;i="5.98,315,1673942400";
   d="scan'208";a="755309015"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2023 09:14:53 -0700
Date: Mon, 3 Apr 2023 19:09:42 +0300 (EEST)
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
X-X-Sender: kvehmane@eliteleevi.tm.intel.com
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH] ALSA: hda/hdmi: Preserve the previous PCM device upon
 re-enablement
In-Reply-To: <87v8ihhr9x.wl-tiwai@suse.de>
Message-ID: 
 <alpine.DEB.2.22.394.2304031737010.3532114@eliteleevi.tm.intel.com>
References: <20230331142217.19791-1-tiwai@suse.de>
 <57ffa8e0-83fa-a982-9f48-abbe5f098732@perex.cz> <87v8ihhr9x.wl-tiwai@suse.de>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7 02160 Espoo
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: C2MLUAWVMEMG7PHVK65FDFQQHBLY4NOF
X-Message-ID-Hash: C2MLUAWVMEMG7PHVK65FDFQQHBLY4NOF
X-MailFrom: kai.vehmanen@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Alsa-devel <alsa-devel@alsa-project.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Wim Taymans <wim.taymans@gmail.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/C2MLUAWVMEMG7PHVK65FDFQQHBLY4NOF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

On Fri, 31 Mar 2023, Takashi Iwai wrote:

> On Fri, 31 Mar 2023 17:18:44 +0200, Jaroslav Kysela wrote:
> That said, the slot preservation becomes effective only when multiple
> devices are connected and they are on/off at the same time.  In such a
> case, the device order may be changed at each screen on/off with the
> current code, while this patch allows keeping the order.  Maybe I
> should emphasize about the multiple devices in the patch description.

... and specifically you need multiple audio enabled displays to have
this problem.

Anyways, even if a bit hacky, I think the patch is ok and helps with the 
user-experience in these cases. And if application correctly checks the 
ELD after each jack connection event, those applicatios will continue to 
work (so this patch does not encourage bad app behaviour).

I think this still leaves (rare but possible) cases that need to be 
handled by application. E.g. if you have multiple (audio enabled) displays 
connected to a DP-MST dock and the monitors get turned on/off at the same 
time, it is possible for them to appear with different DP-MST ids (depends 
on the dock). I.e. the PCM may change. For these cases, the application 
would have to look up the correct display/receiver (the user wants to 
stream to) via ELD, every time there's jack connection event.

Br, Kai
