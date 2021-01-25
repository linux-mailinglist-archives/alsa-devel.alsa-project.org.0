Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BEAF4302B92
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Jan 2021 20:28:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F371A17EC;
	Mon, 25 Jan 2021 20:27:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F371A17EC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611602890;
	bh=11wajtFFlIxC9CDfgraWrDNSmofSS1ERxOFhyaeKSzM=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OtKuru58v7weHBi7UbCXCZkvoiAD0CEU2bb/63pz1u91jdW+ZKusBZEg+6ztdg3rh
	 +N32eErlYCGflodZb38L8GwzUKn41dlNljXQN4V9xQOROM49CCO9on9YM3NUOFXDmx
	 qDt/WSGjN7wHZKmsP9h9kjyRJgZonjlAjW1QXDf0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 62882F8025F;
	Mon, 25 Jan 2021 20:26:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B7B28F80259; Mon, 25 Jan 2021 20:26:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E8AA5F8014D
 for <alsa-devel@alsa-project.org>; Mon, 25 Jan 2021 20:26:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E8AA5F8014D
IronPort-SDR: HnIDiPXEAUu5hj29/H8c6wsPxuA7viwQcwKbvg9ryWpV5HHKiJyzu4QBxwrBenB83jitL1WePf
 Lb1Tm9QCgy4w==
X-IronPort-AV: E=McAfee;i="6000,8403,9875"; a="176275779"
X-IronPort-AV: E=Sophos;i="5.79,374,1602572400"; d="scan'208";a="176275779"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2021 11:26:26 -0800
IronPort-SDR: i0giKRscpjDIzWE8QSyp/tHZLHCQLXmt1z//xPjprBTAb7DxkFQCIoJxRjQ2jQ1LCJG8MhYsRx
 Kh6JLFqH0r9A==
X-IronPort-AV: E=Sophos;i="5.79,374,1602572400"; d="scan'208";a="572656872"
Received: from rrusnak-mobl2.amr.corp.intel.com (HELO [10.212.246.231])
 ([10.212.246.231])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2021 11:26:25 -0800
Subject: Re: Crash in acpi_ns_validate_handle triggered by soundwire on Linux
 5.10
To: Salvatore Bonaccorso <carnil@debian.org>
References: <CA+GA0_sPC3rp5K4qwZm-u+W1C=+2Y2p-dbF4DMdHkKaTpeKKkg@mail.gmail.com>
 <CAJZ5v0iapmc8ywuySwexwTagKr89Hj7TPXkAvd_HXMhdLoyyQQ@mail.gmail.com>
 <1f0f7273-597e-cdf0-87d1-908e56c13133@linux.intel.com>
 <YA8QM98xrHyefa7g@eldamar.lan>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <fb2808ba-d5e5-8d8f-1ba2-c7a94be805e8@linux.intel.com>
Date: Mon, 25 Jan 2021 13:26:23 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <YA8QM98xrHyefa7g@eldamar.lan>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
 Vinod Koul <vkoul@kernel.org>,
 =?UTF-8?Q?Marcin_=c5=9alusarz?= <marcin.slusarz@gmail.com>,
 Kubo Hiroshi <hkubo@jiubao.jp>, Bard Liao <yung-chuan.liao@linux.intel.com>,
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


>>>> Linux 5.10 fails to boot on my IceLake laptop, where 5.9 worked fine.
>>>> I'm not sure whether it's a bug in ACPI or Soundwire subsystem, so I'm
>>>> sending this to both
>>>> lists. The W taint flag is because of an unrelated nouveau failure (It
>>>> was busted on 5.9, and is
>>>> still on 5.10). Full kernel log down below.
>>>> It's from a distro kernel, but I can build my own kernel with patches if needed.
>>>
>>> Please try to add a check for handle against NULL to
>>> snd_intel_dsp_check_soundwire() after
>>>
>>> handle = ACPI_HANDLE(&pci->dev);
>>>
>>> and see if this makes any difference.
>>>
>>> This should check handle against NULL anyway, even if it didn't crash later on.
>>
>> Is there a way you can share the DSDT?
>>
>> The only thing we do in that sdw_intel_acpi_scan() function is check for an
>> _ADR and read two _DSD properties. I think it's been 2 years since we wrote
>> it and never had an issue, never say never I guess...
>>
>> If you want to bypass this problem for the time being, you can add a kernel
>> option in /etc/modprobe.d/alsa-base.conf
>>
>> options snd-intel-dspcfg dsp_driver=1
>>
>> that will force the use of the HDaudio legacy driver and bypass the driver
>> autodetection.
> 
> A user in Debian,  Kubo Hiroshi reported what seems to be the same
> issue in https://bugs.debian.org/981003 .

Thanks for connecting the dots.

I can only suggest the following patch, similar to what Rafael suggested 
but this time done inside of the sdw_intel_acpi_scan() function which 
has multiple users.

I still don't see what happens though, the code in drivers/acpi seems to 
already check for bad pointers?


diff --git a/drivers/soundwire/intel_init.c b/drivers/soundwire/intel_init.c
index cabdadb09a1b..91f57f75a9e2 100644
--- a/drivers/soundwire/intel_init.c
+++ b/drivers/soundwire/intel_init.c
@@ -405,6 +405,9 @@ int sdw_intel_acpi_scan(acpi_handle *parent_handle,
  {
         acpi_status status;

+       if (!parent_handle)
+               return -ENODEV;
+
         status = acpi_walk_namespace(ACPI_TYPE_DEVICE,
                                      parent_handle, 1,
                                      sdw_intel_acpi_cb,
