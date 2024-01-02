Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E37BF822246
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Jan 2024 20:50:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6D191E80;
	Tue,  2 Jan 2024 20:50:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6D191E80
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1704225031;
	bh=pv0siwkhM5WJdMGPEhHf+oy6L8ddnKkuRveKNn3okG4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=GWOpFqJExVGEVupmzFi89gqeQ5ZBCzuuFYn6krDAhjbEudBDqYt5QCJp+n/XSSQ1F
	 bTF6o1kuz4Nd0ntbZbavnxlouFLn2rZz8e12o1DZPS+XjICWcxxjI8ETVx0uDA2RTV
	 0HG/v36kr/sgn335FoTFQHYIRBEkA4U4CWs1WtWU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 14679F8057A; Tue,  2 Jan 2024 20:49:59 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AA514F8057A;
	Tue,  2 Jan 2024 20:49:58 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4C294F80051; Tue,  2 Jan 2024 20:49:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1B60CF80086
	for <alsa-devel@alsa-project.org>; Tue,  2 Jan 2024 20:49:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1B60CF80086
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Sw1ZwClF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704224992; x=1735760992;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=pv0siwkhM5WJdMGPEhHf+oy6L8ddnKkuRveKNn3okG4=;
  b=Sw1ZwClFsxHK66Ier0BaEEW4ViPIBZs3b/FTOS2Gmv3r8j6L5YnOwyca
   Mv5eKYbbD1nsw24UhTnZVgwSxgAqBFl3K4rzNG8RpuAi4chQZKHOl5sWX
   MfUtJAnNKO9Wfd+uj9WO+JHsSsoHXiH3X8zrqJbOxrowfTl1aF9hqKepd
   CsRue81TUgI+f7l3B/gh2MgFFPDajoBqlNBm883A5lditad8Y7OWwFQdz
   MxlFCZSxn6BDsTaM2rVPcU/DuhQgK4NWoeJ3d7yvedZ+8orgFPeHUR2pE
   swB0tQ2BwBuMA/DhYKDJUrfnkg7ha4I8MxyeKqlYjkYUVoVBSxb+eneOO
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10940"; a="376351537"
X-IronPort-AV: E=Sophos;i="6.04,324,1695711600";
   d="scan'208";a="376351537"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jan 2024 01:26:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10940"; a="1026727348"
X-IronPort-AV: E=Sophos;i="6.04,324,1695711600";
   d="scan'208";a="1026727348"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jan 2024 01:26:28 -0800
Date: Tue, 2 Jan 2024 11:26:18 +0200 (EET)
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
X-X-Sender: kvehmane@eliteleevi.tm.intel.com
To: Marc MERLIN <marc@merlins.org>
cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
    Rander Wang <rander.wang@intel.com>,
    Bard Liao <yung-chuan.liao@linux.intel.com>, alsa-devel@alsa-project.org,
    linux-kernel@vger.kernel.org
Subject: Re: sof-audio-pci-intel-tgl/soundwire 6.6.8 kernel outputs no sound
 on speakers but works on headphones
In-Reply-To: <20231223234430.GA11359@merlins.org>
Message-ID: <alpine.DEB.2.22.394.2401021117370.14041@eliteleevi.tm.intel.com>
References: <20231223234430.GA11359@merlins.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7 02160 Espoo
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: I764TN7XN2UJ2AFOQ5WBQTFBU3WCKVZP
X-Message-ID-Hash: I764TN7XN2UJ2AFOQ5WBQTFBU3WCKVZP
X-MailFrom: kai.vehmanen@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/I764TN7XN2UJ2AFOQ5WBQTFBU3WCKVZP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

On Sat, 23 Dec 2023, Marc MERLIN wrote:

> Howdy,
> 
> First, apologies if I'm not sending this to the right place, I could not
> find an approrpriate soundwire/sof mailing list, please redirect me as
> needed (I had to find an old soundwire message for reference)
> 
> laptop; Dell XPS 17 9730
> 
> merlin:~# lspci | grep -i audio
> 0000:00:1f.3 Multimedia audio controller: Intel Corporation Device 51ca (rev 01)
> 
> stock mainline 6.6.8 shows the device, but no sound comes out, as if it
> were muted, but I do not see anyting muted in alsamixer. If I plug in

we'd need a bit more info, especially alsa-info output, to figure out 
whether this is an issue with the mixer settings and/or the drivers. 
Instructions how to get alsa-info output availbale at 
https://thesofproject.github.io/latest/getting_started/intel_debug/suggestions.html

Please file a bug at 
https://github.com/thesofproject/linux/issues

There was one bug affecting 9730 variants, but I don't think your case
is the the same:
https://github.com/thesofproject/linux/issues/4380

Br, Kai
