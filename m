Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 316512FDC94
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Jan 2021 23:30:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CBE2B1807;
	Wed, 20 Jan 2021 23:29:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CBE2B1807
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611181820;
	bh=YehWsBvz02Ie/mkFcxkwZtY6qgTTaA6FZKfzUfFSejU=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=agC3GsEXPpQlqnTyBMKgc0adDIs3Sc+3ncCM+eK1njUbkDe4KXJRke2W4Zi/QDVp2
	 0FDghDPEcDv+6Cshqi1xOSyzKjk809wQIefk1OCLXvMQD/1R+nv47W2gexHOAzWVLu
	 s4z8as4FNDnINUAebWVW75vVuH9Ys+yzW02DNOqg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 26C3DF8019B;
	Wed, 20 Jan 2021 23:28:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6E9EFF8016E; Wed, 20 Jan 2021 23:28:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A0CE5F8012C
 for <alsa-devel@alsa-project.org>; Wed, 20 Jan 2021 23:28:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A0CE5F8012C
IronPort-SDR: n4H1gvzgntXb2jrkmQs45OWNe9hYzah/svesFwRghHlgVdAvDSgXGUX0NIO1kLnPKUWOHxV+op
 0moEdHQ3rweA==
X-IronPort-AV: E=McAfee;i="6000,8403,9870"; a="263999021"
X-IronPort-AV: E=Sophos;i="5.79,362,1602572400"; d="scan'208";a="263999021"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2021 14:28:26 -0800
IronPort-SDR: A3l+tWrwWD2lDdIHZ9JWJZ3mi0uI5w+xME/wG0yHTwQSnfHvUyJXlZ1Iok3hN6IWeVOo8LrCfu
 aLZ3Uc8uqs2g==
X-IronPort-AV: E=Sophos;i="5.79,362,1602572400"; d="scan'208";a="356220083"
Received: from bmetsx-mobl1.amr.corp.intel.com (HELO [10.209.108.15])
 ([10.209.108.15])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2021 14:28:25 -0800
Subject: Re: Crash in acpi_ns_validate_handle triggered by soundwire on Linux
 5.10
To: "Rafael J. Wysocki" <rafael@kernel.org>,
 =?UTF-8?Q?Marcin_=c5=9alusarz?= <marcin.slusarz@gmail.com>
References: <CA+GA0_sPC3rp5K4qwZm-u+W1C=+2Y2p-dbF4DMdHkKaTpeKKkg@mail.gmail.com>
 <CAJZ5v0iapmc8ywuySwexwTagKr89Hj7TPXkAvd_HXMhdLoyyQQ@mail.gmail.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <1f0f7273-597e-cdf0-87d1-908e56c13133@linux.intel.com>
Date: Wed, 20 Jan 2021 16:28:23 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAJZ5v0iapmc8ywuySwexwTagKr89Hj7TPXkAvd_HXMhdLoyyQQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Len Brown <lenb@kernel.org>
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




>> Linux 5.10 fails to boot on my IceLake laptop, where 5.9 worked fine.
>> I'm not sure whether it's a bug in ACPI or Soundwire subsystem, so I'm
>> sending this to both
>> lists. The W taint flag is because of an unrelated nouveau failure (It
>> was busted on 5.9, and is
>> still on 5.10). Full kernel log down below.
>> It's from a distro kernel, but I can build my own kernel with patches if needed.
> 
> Please try to add a check for handle against NULL to
> snd_intel_dsp_check_soundwire() after
> 
> handle = ACPI_HANDLE(&pci->dev);
> 
> and see if this makes any difference.
> 
> This should check handle against NULL anyway, even if it didn't crash later on.

Is there a way you can share the DSDT?

The only thing we do in that sdw_intel_acpi_scan() function is check for 
an _ADR and read two _DSD properties. I think it's been 2 years since we 
wrote it and never had an issue, never say never I guess...

If you want to bypass this problem for the time being, you can add a 
kernel option in /etc/modprobe.d/alsa-base.conf

options snd-intel-dspcfg dsp_driver=1

that will force the use of the HDaudio legacy driver and bypass the 
driver autodetection.
