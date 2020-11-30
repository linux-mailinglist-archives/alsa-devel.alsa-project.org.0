Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B9C2E2C8924
	for <lists+alsa-devel@lfdr.de>; Mon, 30 Nov 2020 17:16:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5E2A316D6;
	Mon, 30 Nov 2020 17:16:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5E2A316D6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606753015;
	bh=rnB8mvMztFG+015RPqBITIzCODfz1USCOndy2Z8WxLY=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=I3Jp5wDMCu/QXLsu0xz2zaxWlESiqV7MNvumLuHlCvivsIKA9kTkT9T2W3J7qJyGg
	 niegHBk1BR2sIY/lesRbxVMcg/V15upVdsHmnc5e6jsLyaCl1G98hhORx9iKOMI+lr
	 zrFesUxeOpMLUhzZndPfUKl3320C/4m3TbifZUIs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B0B15F8049C;
	Mon, 30 Nov 2020 17:15:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F349BF8025F; Mon, 30 Nov 2020 17:15:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=NICE_REPLY_A,PRX_BODY_135,
 RCVD_IN_MSPIKE_H3, RCVD_IN_MSPIKE_WL, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5C6E1F800D0
 for <alsa-devel@alsa-project.org>; Mon, 30 Nov 2020 17:15:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5C6E1F800D0
IronPort-SDR: dVPCJIX5eTY2sUZuiECWh0SfkxiB8Y/lXnFQXvKAcnfxHU6QEEkgXNaGyTg8r5yVaa79Mx9ANP
 I4znAMSYNw1w==
X-IronPort-AV: E=McAfee;i="6000,8403,9821"; a="172820239"
X-IronPort-AV: E=Sophos;i="5.78,382,1599548400"; d="scan'208";a="172820239"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2020 08:15:10 -0800
IronPort-SDR: sInAxxH6rimgVCR2CCkEILmwleUxQVHbPcM7G2WoKaqmLJUMDWx42ot9NehCRH8/OkjhJJu/iC
 c1GhlTl4Q8eQ==
X-IronPort-AV: E=Sophos;i="5.78,382,1599548400"; d="scan'208";a="364302443"
Received: from clord1-mobl1.amr.corp.intel.com (HELO [10.209.130.46])
 ([10.209.130.46])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2020 08:15:09 -0800
Subject: Re: Asoc: Intel: SST (CHT) regression in asoc/for-5.11
To: Hans de Goede <hdegoede@redhat.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Jie Yang <yang.jie@linux.intel.com>, Mark Brown <broonie@kernel.org>
References: <93cc93a1-82bd-f5a3-4e19-4cfc65c868e7@redhat.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <2d9d0d43-8239-01e2-3787-98dfd305e369@linux.intel.com>
Date: Mon, 30 Nov 2020 10:15:08 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <93cc93a1-82bd-f5a3-4e19-4cfc65c868e7@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
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



On 11/29/20 6:24 AM, Hans de Goede wrote:
> Hi All,
> 
> To test the code to dynamically switch between SST/SOF support on BYT/CHT
> from the kernel commandline I merged:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git/log/?h=for-5.11
> 
> Into my personal tree (mostly Linus' master + some pending patches from
> myself).
> 
> After this I was getting the following errors in dmesg when using sound on
> a Medion E2228T laptop with a CHT SoC + NAU8824 codec:
> 
> [   53.805205] intel_sst_acpi 808622A8:00: Wait timed-out condition:0x0, msg_id:0x1 fw_state 0
> [   53.805479] intel_sst_acpi 808622A8:00: fw returned err -16
> [   53.806281] sst-mfld-platform sst-mfld-platform: ASoC: PRE_PMD: pcm0_in event failed: -16
> [   54.829548] intel_sst_acpi 808622A8:00: Wait timed-out condition:0x0, msg_id:0x1 fw_state 0
> [   54.829596] intel_sst_acpi 808622A8:00: fw returned err -16
> [   54.829668] sst-mfld-platform sst-mfld-platform: ASoC: POST_PMD: media0_out event failed: -
> [   55.853230] intel_sst_acpi 808622A8:00: Wait timed-out condition:0x0, msg_id:0x1 fw_state 0
> [   55.853244] intel_sst_acpi 808622A8:00: fw returned err -16
> [   55.853269] sst-mfld-platform sst-mfld-platform: ASoC: POST_PMD: codec_out0 mix 0 event fai
> [   56.876435] intel_sst_acpi 808622A8:00: Wait timed-out condition:0x0, msg_id:0x1 fw_state 0
> [   56.876481] intel_sst_acpi 808622A8:00: fw returned err -16
> [   56.876563] sst-mfld-platform sst-mfld-platform: ASoC: POST_PMD: media0_out mix 0 event fai
> [   61.847455] intel_sst_acpi 808622A8:00: FW sent error response 0x40015
> [   61.847564] intel_sst_acpi 808622A8:00: fw returned err -1
> [   61.847659] sst-mfld-platform sst-mfld-platform: ASoC: error at snd_soc_dai_startup on ssp2
> [   61.847722]  SSP2-Codec: ASoC: BE open failed -1
> [   61.847754]  Audio Port: ASoC: failed to start some BEs -1
> [   61.847786] intel_sst_acpi 808622A8:00: FW sent error response 0x40006
> [   64.301284] intel_sst_acpi 808622A8:00: FW sent error response 0x90001
> [   64.301545] intel_sst_acpi 808622A8:00: not suspending FW!!, Err: -2
> 
> Dropping the asoc/for-5.11 merge and just cherry-picking Pierre-Louis' changes
> for the dynamic switching makes these go away. So this seems to be caused by
> other changes in asoc/for-5.11.
> 
> So any clues where to start looking for this, or should I just bisect this?

Thanks for reporting this Hans.

The only thing that comes to my mind is Morimoto-san's series which 
modified snd_soc_dai_startup, but that was back in September and should 
be in 5.10-rcX

Will give it a try on my side as well.

