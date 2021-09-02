Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9581E3FEFCC
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Sep 2021 17:03:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2EC3317B6;
	Thu,  2 Sep 2021 17:02:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2EC3317B6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1630595021;
	bh=gQ+REeVxv2P4WGTW1hKrX3qAwfCYIvLE9ukD+WNiWow=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CwWkggaTren0vLBIzulBY/LKcUhEvvn5LTNjzWRyROwmnxTf0YhgDRE/r6s0HNzS0
	 W7Crf9jKPj6QrsJLXGClqep9vb0Oz28Yse3s7fwmS74DfAqHylU6xN9kjfmHPcLZdH
	 494HEuay41hX056etUVwmhYWZzjmZtpGSQJrQdHU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9DC04F800AF;
	Thu,  2 Sep 2021 17:02:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 45FC9F800AF; Thu,  2 Sep 2021 17:02:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 252FEF8020D
 for <alsa-devel@alsa-project.org>; Thu,  2 Sep 2021 17:02:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 252FEF8020D
X-IronPort-AV: E=McAfee;i="6200,9189,10094"; a="216004067"
X-IronPort-AV: E=Sophos;i="5.85,262,1624345200"; d="scan'208";a="216004067"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2021 08:02:11 -0700
X-IronPort-AV: E=Sophos;i="5.85,262,1624345200"; d="scan'208";a="689143989"
Received: from elee5-mobl.amr.corp.intel.com (HELO [10.212.50.6])
 ([10.212.50.6])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2021 08:02:10 -0700
Subject: Re: config issue with SoundWire mockup device support
To: Fabio Aiuto <fabioaiuto83@gmail.com>
References: <20210902143632.GA1422@agape.jhs>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <10bb39d4-2560-4ceb-bf20-fe5a124142cb@linux.intel.com>
Date: Thu, 2 Sep 2021 10:02:05 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210902143632.GA1422@agape.jhs>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, gregkh@linuxfoundation.org,
 linux-staging@lists.linux.dev, lgirdwood@gmail.com, tiwai@suse.com,
 Nathan Chancellor <nathan@kernel.org>, Hans de Goede <hdegoede@redhat.com>,
 broonie@kernel.org, linux-kernel@vger.kernel.org
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



On 9/2/21 9:36 AM, Fabio Aiuto wrote:
> Dear Pierre and all sound developers,
> 
> I work for some tests on a Lenovo ideapad Miix 300-10IBY,
> with fedora 34 workstation intalled on.
> After having pulled the last changes from staging tree I get
> the following issue by typing:
> 
> $ make olddefconfig
> 
> WARNING: unmet direct dependencies detected for SND_SOC_SDW_MOCKUP
>   Depends on [n]: SOUND [=m] && !UML && SND [=m] && SND_SOC [=m]
> 	&& EXPERT [=n] && SOUNDWIRE [=y]
>   Selected by [m]:
>   - SND_SOC_INTEL_SOUNDWIRE_SOF_MACH [=m] && SOUND [=m] && !UML
> 	&& SND [=m] && SND_SOC [=m] && SND_SOC_INTEL_MACH [=y]
> 	&& SND_SOC_SOF_INTEL_SOUNDWIRE [=m] && I2C [=y] && ACPI [=y]
> 	&& GPIOLIB [=y] && (MFD_INTEL_LPSS [=y] || COMPILE_TEST [=n])
> 	&& (SND_SOC_INTEL_USER_FRIENDLY_LONG_NAMES [=y] || COMPILE_TEST [=n])
> 	&& SOUNDWIRE [=y] && SND_HDA_CODEC_HDMI [=m] && SND_SOC_SOF_HDA_AUDIO_CODEC [=y]

It's a known issue that was reported and fixed by Nathan Chancellor:

[PATCH v2] ASoC: Intel: boards: Fix CONFIG_SND_SOC_SDW_MOCKUP select

https://lore.kernel.org/alsa-devel/20210802212409.3207648-1-nathan@kernel.org/

I'll ack the missing patch, thanks for reporting this.
