Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FAA318BF7C
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Mar 2020 19:36:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 185C0179A;
	Thu, 19 Mar 2020 19:36:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 185C0179A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584643017;
	bh=Aqd8MiaesBuiYJW3gEo1vGkccf7lWrxqCR5pIeZkil8=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VGRn64kqCw46jMo/eZI2+2MLpd6YUDkNdFBF4AUO8rg4Icm9SJ7AhxApakcqfTD8U
	 2WdEo3irw7Q/2kVExon5svkyjoaKiIdA74K6aJFQ/aRrqIEweYi6LitVuKywjNei/u
	 HdnpArv2NVbOaamxXA528vBusqnI72MMRxHCd7yc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 02DEAF8012F;
	Thu, 19 Mar 2020 19:35:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0AD6FF8022B; Thu, 19 Mar 2020 19:35:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B5C2EF8012F
 for <alsa-devel@alsa-project.org>; Thu, 19 Mar 2020 19:35:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B5C2EF8012F
IronPort-SDR: Eqia3+KgzoXGMvTbxsQsbT2IQvV+6+vgn0qFR0PC0yh8Cd9I7RDo69cxGm0lrkPGMRWeWVE3E1
 BZ5d9btLAVCg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2020 11:35:04 -0700
IronPort-SDR: 8PJ20HU+/1aAUtKkXBhL4ENr19sfOFgV1IzgPk5go10JOk0SJ1/gsJeVsaEb18kxxu80xGUxGu
 /TeOiOTXzOxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,572,1574150400"; d="scan'208";a="356117527"
Received: from crojewsk-mobl1.ger.corp.intel.com (HELO [10.249.128.140])
 ([10.249.128.140])
 by fmsmga001.fm.intel.com with ESMTP; 19 Mar 2020 11:35:02 -0700
Subject: Re: snd_hda_intel/sst-acpi sound breakage on suspend/resume since
 5.6-rc1
To: Dominik Brodowski <linux@dominikbrodowski.net>
References: <e49eec28-2037-f5db-e75b-9eadf6180d81@intel.com>
 <20200318192213.GA2987@light.dominikbrodowski.net>
 <b352a46b-8a66-8235-3622-23e561d3728c@intel.com>
 <20200318215218.GA2439@light.dominikbrodowski.net>
 <e7f4f38d-b53e-8c69-8b23-454718cf92af@intel.com>
 <20200319130049.GA2244@light.dominikbrodowski.net>
 <20200319134139.GB3983@sirena.org.uk>
 <a01359dc-479e-b3e3-37a6-4a9c421d18da@intel.com>
 <20200319165157.GA2254@light.dominikbrodowski.net>
 <a7bf2aee-78e7-f905-bcc3-cd21bf16a976@intel.com>
 <20200319182413.GA3968@light.dominikbrodowski.net>
From: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <750f7841-0b95-9fa8-d858-e0bff4d834d5@intel.com>
Date: Thu, 19 Mar 2020 19:35:00 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200319182413.GA3968@light.dominikbrodowski.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, kuninori.morimoto.gx@renesas.com,
 curtis@malainey.com, tiwai@suse.com, Keyon Jie <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 linux-kernel@vger.kernel.org, liam.r.girdwood@linux.intel.com,
 Mark Brown <broonie@kernel.org>
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

On 2020-03-19 19:24, Dominik Brodowski wrote:
> On Thu, Mar 19, 2020 at 06:33:50PM +0100, Cezary Rojewski wrote:
>>
>> Could you confirm the same happens on your machine when revert of mentioned
>> patch is not applied ("stream is NULL" messages occur)? Issue may be
>> harmless but explained sequence does not look right.
> 
> Indeed, I still see
> 
> haswell-pcm-audio haswell-pcm-audio: warning: stream is NULL, no stream to reset, ignore it.
> haswell-pcm-audio haswell-pcm-audio: warning: stream is NULL, no stream to free, ignore it.
> haswell-pcm-audio haswell-pcm-audio: FW loaded, mailbox readback FW info: type 01, - version: 00.00, build 77, source commit id: 876ac6906f31a43b6772b23c7c983ce9dcb18a19
> haswell-pcm-audio haswell-pcm-audio: warning: stream is NULL, no stream to reset, ignore it.
> haswell-pcm-audio haswell-pcm-audio: warning: stream is NULL, no stream to free, ignore it.
> 
> though sounds continues to work.
> 

Thanks once again for your input and time!

I'll prepare patches for both issues. My guess is haswell-pcm could be 
updated to handle 'platform' component param just fine, but it is 
probably a change of more than few lines. I'd rather revert non-SOF 
broadwell to its previous behavior and start a separate task from there.

Regards,
Czarek
