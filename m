Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F3326D5ED0
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Apr 2023 13:17:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7B6A91E4;
	Tue,  4 Apr 2023 13:16:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7B6A91E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680607028;
	bh=NWUlWcjMfRIFF58Am5Gy31a3XFZnMiFsLT+jmXw6CuM=;
	h=Date:From:To:Subject:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=gK2HYKVbnuh6ypuoSueIkfKbNE9uJYzOKB4C1taDAaw94OAfsVJhTOFORCh7tuohz
	 7PUFVLx9RK7s6WTmul+vyFcZyZUQOb1bh1ldOAuvijKvOWH6PtjXBqDkYnCy4bpx2Q
	 ezg9Ft7REqpkMplhPqw/5nsUGJ86oVLZ1+0YazGw=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0A061F801C0;
	Tue,  4 Apr 2023 13:16:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9C5E0F8024C; Tue,  4 Apr 2023 13:16:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4D4AAF80171
	for <alsa-devel@alsa-project.org>; Tue,  4 Apr 2023 13:16:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4D4AAF80171
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=ZkxWat6u
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680606970; x=1712142970;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=NWUlWcjMfRIFF58Am5Gy31a3XFZnMiFsLT+jmXw6CuM=;
  b=ZkxWat6u7pr/FTjbIgsbsv1DhvoE/7GCRHmxsEJDL5ZT2ecjDiifKzyE
   0+6TFJhjDENqPb3Htp2LbhVTAf8PpqCgbmbiw6BXZhfIOWe98I8VS1aPP
   9P8SeNZV1VziynTq5btveKYCsF1hb89LffNF90MwLob2CaWsb6TD4hB9w
   ZOrkInh0WX/yZ/Irm7AchAdnvQIPGPcbOHWKex9o1/4LUS/vF456GcYEb
   dK47bDZHLgfrCwQodF8dA9zsaV0XwGEC61AcDB7LBc8M0B+RdnuV7hDUW
   3ZqpKHWMOYHAA3q42y1OZD+aA8nNvGBFAsLMdOaL4HdBvyRn+apCCyt1U
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="321809496"
X-IronPort-AV: E=Sophos;i="5.98,317,1673942400";
   d="scan'208";a="321809496"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2023 04:16:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="860555840"
X-IronPort-AV: E=Sophos;i="5.98,317,1673942400";
   d="scan'208";a="860555840"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2023 04:16:03 -0700
Date: Tue, 4 Apr 2023 14:14:06 +0300 (EEST)
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
X-X-Sender: kvehmane@eliteleevi.tm.intel.com
To: Jaroslav Kysela <perex@perex.cz>
Subject: Re: [PATCH] ALSA: hda/hdmi: Preserve the previous PCM device upon
 re-enablement
In-Reply-To: <7919429d-655f-9202-a5ba-69b48b102bc2@perex.cz>
Message-ID: 
 <alpine.DEB.2.22.394.2304041258370.3532114@eliteleevi.tm.intel.com>
References: <20230331142217.19791-1-tiwai@suse.de>
 <57ffa8e0-83fa-a982-9f48-abbe5f098732@perex.cz> <87v8ihhr9x.wl-tiwai@suse.de>
 <alpine.DEB.2.22.394.2304031737010.3532114@eliteleevi.tm.intel.com>
 <7919429d-655f-9202-a5ba-69b48b102bc2@perex.cz>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7 02160 Espoo
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: 4RBRINHNP22X42VOXVOAYQG4UYSA5JET
X-Message-ID-Hash: 4RBRINHNP22X42VOXVOAYQG4UYSA5JET
X-MailFrom: kai.vehmanen@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Takashi Iwai <tiwai@suse.de>, Alsa-devel <alsa-devel@alsa-project.org>,
 Wim Taymans <wim.taymans@gmail.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4RBRINHNP22X42VOXVOAYQG4UYSA5JET/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

On Mon, 3 Apr 2023, Jaroslav Kysela wrote:

> The question is, if ELD contains a serial number of the monitor. If there is
> no unique identification for similar monitors (one model), then we have no way
> to identify the audio devices properly.
[...]
> If I look to drm_edid_to_eld() function in drivers/gpu/drm/drm_edid.c I don't
> see any unique information to be copied for the identical monitors.

right, if you have two identical monitors, and to make things worse, you 
connect them via a DP-MST hub, we have a problem.

ELD certainly does not have the serial info. It does have a PortID
field, but that is an implementation specific field (in the HDA spec)
and at least based on quick check, seem to be zero filled on most systems.
Plus, existing apps (e.g. both Pulseaudio and Pipewire) only consider
Monitor_Name_String in ELD.

EDID does have fields for serial number and date of mfg. Not sure how 
widely implemented the serial number is, but I can see at least 
org.gnome.Mutter.DisplayConfig ([1] as used by e.g. GNOME Display Settings 
panel) do expose it and use it to identify displays (and e.g. remember the 
display layout).

In practise, Takashi's patch will probably cover a large amount of cases.
If you don't have a hub in between, the pin NID will be stable. If you 
have identical monitors, you might have to guess the right monitor on the 
first time, but subsequently the pin NID reuse will pick the same PCM for 
same monitor. With a hub in between, we are at mercy of how the DP-MST
device ids are allocated (if you have monitors of same type).

So indeed next step would be to expose the EDID serial number, and
make that available via ALSA so that apps could link a PCM to a monitor 
name plus serial number. As this is not part of ELD, this is somewhat
larger task (need to extend drm_audio_component.h to pass this info,
need to extend the ALSA user-space interface and get updates to clients).

[1] 
https://gitlab.gnome.org/GNOME/mutter/-/blob/main/data/dbus-interfaces/org.gnome.Mutter.DisplayConfig.xml  
,
https://wiki.gnome.org/Initiatives/Wayland/Gaps/DisplayConfig

Br, Kai
