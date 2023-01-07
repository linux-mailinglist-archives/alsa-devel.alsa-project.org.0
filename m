Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 11E1F660B58
	for <lists+alsa-devel@lfdr.de>; Sat,  7 Jan 2023 02:16:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2521114DE1;
	Sat,  7 Jan 2023 02:15:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2521114DE1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673054176;
	bh=A1l9nLxqa/QgP6et14ncprz/Qiq1w5jVWtdRAUx+0/E=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=ajSHHBrLjQqpuonmELB/5JqWhcCuDq6lvw2bVvO0iXIM7vcmsQGEEJLW3IVoxw6/x
	 8TgxH1ikrIOAW08MLdFSzSnOX6kni+3ynoaNnJNWKOCQk3YT6WyMURjKrL4y+6VgWW
	 glaOhzF32v3E9tN1GybVSl1XTOSr4RtYpJqzZHsU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F3F13F8024E;
	Sat,  7 Jan 2023 02:15:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BE61FF8024E; Sat,  7 Jan 2023 02:15:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7FB22F80217
 for <alsa-devel@alsa-project.org>; Sat,  7 Jan 2023 02:15:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7FB22F80217
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=M7TwVeeE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673054114; x=1704590114;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=A1l9nLxqa/QgP6et14ncprz/Qiq1w5jVWtdRAUx+0/E=;
 b=M7TwVeeEZEXNGGl17ZQTDqkazpmfCoCrmL62oQXtK/AgwPxoag+QC9BV
 QZgHvrni1QP0l+gnYeKaEzH3+WbR/SjTJ4m6PDqb81EshQmGTHnTwFd/2
 ZS1umg/jDjwhfD76L4YFZeE2WZ2tCD/zn9O74PEJMx0x3MWShFKHPnEuN
 aGKTG+Xtkfjp6XaSfkZesGF9XfGX5uSwY81EXNJlYb7UVESEFzpnu7bXl
 /oE4UONaWryF1DEIaD/SJVHD82sH6ceFGnmwyFFGU732p6cGW5XmFzL52
 PwTcJzzMAtAo9lzdLbpRN14r8lnH20+JKp9BX73S/pXjl/lZgB3rfFihE A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10582"; a="322671668"
X-IronPort-AV: E=Sophos;i="5.96,307,1665471600"; d="scan'208";a="322671668"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2023 17:15:09 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10582"; a="649474201"
X-IronPort-AV: E=Sophos;i="5.96,307,1665471600"; d="scan'208";a="649474201"
Received: from apbaezbo-mobl2.amr.corp.intel.com (HELO [10.212.60.153])
 ([10.212.60.153])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2023 17:15:07 -0800
Message-ID: <fe30d88f-fe03-f77b-7f34-2b8a063214b9@linux.intel.com>
Date: Fri, 6 Jan 2023 19:15:07 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.4.2
Subject: Re: [RFC] Sound support for Huawei line of AMD laptops using ACP and
 ES8336 codec
Content-Language: en-US
To: Marian Postevca <posteuca@mutex.one>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
References: <871qo7fqjp.fsf@mutex.one>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <871qo7fqjp.fsf@mutex.one>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, "Chehab, Mauro" <mauro.chehab@intel.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
 V sujith kumar Reddy <Vsujithkumar.Reddy@amd.com>,
 David Yang <yangxiaohua@everest-semi.com>,
 syed sabakareem <Syed.SabaKareem@amd.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



> I have a Huawei Matebook 14 AMD 2021 laptop for which the sound isn't
> supported on Linux. On further investigation in Windows and ACPI tables
> I could determine that this particular SKU has an ES8336 codec connected
> to the CPU ACP module.
> The CPU of my laptop is an AMD Ryzen 5 5500U which seems to be codenamed
> Lucienne and is a derivation of the Renoir family.
> Acording to lspci the ACP is revision 1:
> 
> 03:00.5 Multimedia controller [0480]: Advanced Micro Devices, Inc. [AMD] Raven/Raven2/FireFlight/Renoir Audio Processor [1022:15e2] (rev 01)
> 	Subsystem: Device [1e83:3e4d]
> 	Kernel driver in use: snd_rn_pci_acp3x
> 	Kernel modules: snd_pci_acp3x, snd_rn_pci_acp3x, snd_pci_acp5x,
> 	snd_pci_acp6x, snd_acp_pci, snd_rpl_pci_acp6x,
> 	snd_sof_amd_renoir
> 
> I have written a machine driver for this platform and managed to make
> the sound and internal microphone work. I am looking to integrate this
> support but there are some issues with the current implementation of ACP
> support.
> 
> As far as I can tell there are 4 directions I could take to add support:
> 
> 1. A standalone machine driver in sound/soc/amd that uses the platform
>   drivers from sound/soc/amd/raven/
> 
> 2. An embedded driver in sound/soc/amd/acp/acp-legacy-mach.c
> 
> 3. A standalone machine driver in sound/soc/amd that uses the platform
>   drivers from sound/soc/amd/renoir
> 
> 4. Use the SOF infrastructure

The main issue with this codec is the mind-blowing proliferation of
configurations and quirks.
I can't comment on AMD-specific stuff, but would recommend you take a
look at the GitHub PR we've been reviewing to extract as much
information as possible from ACPI _DSM tables (as done by the Windows
driver). see https://github.com/thesofproject/linux/pull/4112 (credits
to Mauro Chehab for fixing and testing on real hardware and David Yang
for providing the DSM information and comments).
