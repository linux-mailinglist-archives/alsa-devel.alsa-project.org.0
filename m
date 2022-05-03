Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EA50C51906F
	for <lists+alsa-devel@lfdr.de>; Tue,  3 May 2022 23:50:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 721BD1E2;
	Tue,  3 May 2022 23:49:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 721BD1E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651614636;
	bh=HycY1kbuuhogyZJzXUQ62nKz9xD7ITY5l8aBTak4PCA=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YzJKTt+/dD48chsLv2Co3tfTd6bbcvUN6iGCBn4EZ3hLJ+cY8UF8vVjcaNj5B0e5j
	 OT3B2KqwQ7AtAoNrsH0lH1w7VdVDqe9si2bfzbXVd5pZ1nzKe8UpcybuLWynivyB5+
	 YY6sukRSBag4gecZdIDgNyeYd7HfiSXShjD6LK4k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0368EF8025E;
	Tue,  3 May 2022 23:49:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 91527F80236; Tue,  3 May 2022 23:49:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2BAA1F800D2;
 Tue,  3 May 2022 23:49:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2BAA1F800D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="U12k32CO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651614571; x=1683150571;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=HycY1kbuuhogyZJzXUQ62nKz9xD7ITY5l8aBTak4PCA=;
 b=U12k32COv4z9Sgo2PAqqVGE/l8NHlmMdJsmWBSfj8ArGwPfh3JuGI/zG
 lqktFSFj/2hbkIMlVMGfrBNbgWTk+DfUjHEqx9wjLufvTEnf+A3x2G0UR
 FspGBEXkUVEf82ramZarMd+ftQ7vTcQK/A100h3Reu8Ld473/8R0btY5M
 Lpji7DQ8wk6il+etBxrGsfV8yQmuU2Y0ynHJY3bVZkGtVdPnNEH8eX4ZI
 a5ijGbgVYDOLkrI0D9bNLeBa/4izfIJMuYnstJbMa/kYC+L3P7aFT1AkI
 QaiUmsqmRA+ey9l+C3J45c77s+9Tz3n3LTi607cDUoi0V5QA81VlR6G7B A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10336"; a="328138757"
X-IronPort-AV: E=Sophos;i="5.91,196,1647327600"; d="scan'208";a="328138757"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2022 14:49:26 -0700
X-IronPort-AV: E=Sophos;i="5.91,196,1647327600"; d="scan'208";a="599246869"
Received: from karimmdr-mobl.amr.corp.intel.com (HELO [10.251.7.211])
 ([10.251.7.211])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2022 14:49:26 -0700
Message-ID: <cf42d3fc-348d-d11f-8e8c-3946d76df6a8@linux.intel.com>
Date: Tue, 3 May 2022 16:49:25 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Subject: Re: Arch Linux Alsa Driver mic misconfigured 0000:00:1f.3
Content-Language: en-US
To: GitHub issues - opened <github@alsa-project.org>,
 alsa-devel@alsa-project.org
References: <1651609767364916086-webhooks-bot@alsa-project.org>
 <20220503202935.34247F80236@alsa1.perex.cz>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20220503202935.34247F80236@alsa1.perex.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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



On 5/3/22 15:29, GitHub issues - opened wrote:
> alsa-project/alsa-firmware issue #6 was opened from WalterSmuts:
> 
> Hi,
> 
> I have a `Xiaomi Mi Laptop Pro X 15` running arch linux and the `pulseaudio-alsa` package seems to make sound work out of the box. Unfortunately it doesn't configure the mic properly. Attempting on a ubuntu live-usb I found the mic working. I ran the info script for both OS's (see below). My interpretation of the info dumped by the script is that ubuntu loads the `sof-audio-pci` drivers and arch linux seems to load some other intel drivers. Looking through the [arch wiki](https://wiki.archlinux.org/title/Advanced_Linux_Sound_Architecture#ALSA_firmware) I see reference to some newer laptops requiring the sof drivers:
> 
>> [sof-firmware](https://archlinux.org/packages/?name=sof-firmware) and/or [alsa-ucm-conf](https://archlinux.org/packages/?name=alsa-ucm-conf) are required for some newer laptop models (mainly since 2019) because they implement their drivers with firmware provided by the [Sound Open Firmware](https://www.sofproject.org/) project.
> 
> So installing the `sof-firmware` package and restarting the laptop unfortunately still does not fix my issue. Looks to me like the old drivers are still taking preference.
> 
> Can someone guide me in the right direction here?
> 
> * [Working Ubuntu Info](http://alsa-project.org/db/?f=e66f34b60915348fa835bdde9e849119e1031651)
> * [Non-working Arch Info](http://alsa-project.org/db/?f=1a4c03f9abd116c5a0b149e51e436f004fa20228)

try with this option removed: "options snd_hda_intel dmic_detect=0"

It's old stuff that should have been removed by the distro.

also check
https://thesofproject.github.io/latest/getting_started/index.html#debug-audio-issues-on-intel-platforms
