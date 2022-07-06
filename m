Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CDBF5685DB
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Jul 2022 12:41:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DFED01658;
	Wed,  6 Jul 2022 12:40:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DFED01658
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657104109;
	bh=nPo3bgKdp4qA3tcZHRG3HyzYBYfsjBbkWOfgxsKl0Y4=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eHax7l3dpygueozQ2V1bx9DwrvHiGwr6qjClQ1YrkkuZG5+GRIHRqGWRtzkelQwAO
	 bTxqzymvXzopdBsV5XA+Rq1luqEN8IIf/iuh40IndjQ9BZ8K52IQY7wd/aIdQKG8Cd
	 7/ZtXKyvd4zqNp1ZNno8ityU0AkwFvffRM8bjIJ8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5A525F8032B;
	Wed,  6 Jul 2022 12:40:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9C288F800C5; Wed,  6 Jul 2022 12:40:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HTML_MESSAGE,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8887BF800C5
 for <alsa-devel@alsa-project.org>; Wed,  6 Jul 2022 12:40:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8887BF800C5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="SFVbLlBy"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2665MFca021442;
 Wed, 6 Jul 2022 05:40:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=content-type :
 message-id : date : mime-version : subject : to : cc : references : from :
 in-reply-to; s=PODMain02222019;
 bh=QbscwrnkYIWubyEamf8qkkPhq/XZSJcwLASMNdqhmLc=;
 b=SFVbLlByoaGCUpkOnL3TmDtJIPd0A4luW34IUt9gXQvS1pwdftGCWcLUsT504Yeoe3jC
 ikmv+OB6AX98Xq2yg2QeJK1Y70Iz096/mng4ckHT5noluVYsy/VcwY0ehZkZ5iApuw74
 8OLTFAq3zp0gMfSX0yjgoathajo++XhulfyjGLUVU52lNv4DZyee4Wfbg3MTkz456dND
 pwH6KSC3xQpP3WFDzyHEiwnc5zzlWZG+8mJDZ7OZOd4d3Y65ZxjWqzlCyst5Qnz1Inl6
 n5Qzw/xaAO/l/MqGWQ6Sk6u5HbGIr1N86ySuvoOwmyla+IoUDlxD/CdG6TWVsNUTFXP+ Lg== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3h4ucmgqxp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 06 Jul 2022 05:40:38 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Wed, 6 Jul
 2022 11:40:36 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.28 via
 Frontend Transport; Wed, 6 Jul 2022 11:40:36 +0100
Received: from [198.90.238.122] (unknown [198.90.238.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 5663A2A9;
 Wed,  6 Jul 2022 10:40:36 +0000 (UTC)
Message-ID: <e4c1eb0c-329a-a8c4-0d72-76475f82c01f@opensource.cirrus.com>
Date: Wed, 6 Jul 2022 11:40:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v8 00/14] ALSA: hda: cirrus: Add initial DSP support and
 firmware loading
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>
References: <20220630002335.366545-1-vitalyr@opensource.cirrus.com>
 <87zghpxcsh.wl-tiwai@suse.de>
From: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
In-Reply-To: <87zghpxcsh.wl-tiwai@suse.de>
X-Proofpoint-GUID: fi-iP5sMn-xFm-JBJaId4Qr6LU9nNj0A
X-Proofpoint-ORIG-GUID: fi-iP5sMn-xFm-JBJaId4Qr6LU9nNj0A
X-Proofpoint-Spam-Reason: safe
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
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

Hi Takashi,

On 04/07/2022 13:50, Takashi Iwai wrote:
> On Thu, 30 Jun 2022 02:23:21 +0200,
> Vitaly Rodionov wrote:
>> The CS35L41 Amplifier contains a DSP, capable of running firmware.
>> The firmware can run algorithms such as Speaker Protection, to ensure
>> that playback at high gains do not harm the speakers.
>> Adding support for CS35L41 firmware into the CS35L41 HDA driver also
>> allows us to support several extra features, such as hiberation
>> and interrupts.
>>
>> The chain adds support in stages:
>> - General fixes to improve generalization and code re-use inside
>>    the CS35L41 HDA driver.
>> - Add support for interrupts into the driver, which is required
>>    for complete support of the firmware.
>> - Refactor ASoC CS35L41 code which deals with firmware to allow
>>    for code re-use inside the CS35L41 HDA driver.
>> - Add support for loading firmware and tuning files from file system,
>>    and creating alsa controls to control it.
>> - Support firmware load paths for different hardware systems.
>> - Support suspend/resume in the driver when using firmware. The firmware
>>    supports hibernation, which allows the CS35L41 to drop into a low
>>    power mode during suspend.
>> - Support the ability to unload firmware, swap and reload the firmware.
>>    This is to allow different firmware to run during calibration.
>>
>> The intended use-case is to load the firmware once on boot, and the driver
>> autmatically tries to load the firmware after it binds to the HDA driver.
>> This behaviour can be switched off using a kconfig, if desired.
>>
>> changes since v7:
>>   - Use private_data rather than private_value to save control info
>>   - Clean up alsa control memory allocation/deallocation
>>   - Remove unnecessary whitespace
>>   - Get subsystem id from codec, rather than saving it separately
>>
>> changes since v6:
>>   - Fix warning by kernel test robot<lkp@intel.com>
>>   
>> changes since v5:
>>   - Fix warning by kernel test robot<lkp@intel.com>
>>   
>> changes since v4:
>> - Fully remove tlv remnants from control add apis
>> - Remove unnecessary debug
>> - Rename variable to be more generic
>> - Remove redundent length check from read/write control apis
>>
>>
>> - Use SNDRV_CTL_ELEM_IFACE_CARD for firmware load controls
>> - Make kcontrol add/remove synchronous
>> - Load firmware asynchronous when loading via control
>> - Used cached controls when reloading firmware; only delete
>> controls when removing the driver itself
>>
>>
>> - Improve kcontrol remove
>> - Fix control write + notify
>> - Cleanup of unnecessary code
>> - Fix race condition when loading firmware before playback
>> - Ensure errors are properly propogated
>> - Fix include for Module parameters
>>
>> Stefan Binding (13):
>>    ALSA: hda: hda_cs_dsp_ctl: Add Library to support CS_DSP ALSA controls
>>    ALSA: hda: hda_cs_dsp_ctl: Add apis to write the controls directly
>>    ALSA: hda: cs35l41: Save codec object inside component struct
>>    ALSA: hda: cs35l41: Save Subsystem ID inside CS35L41 Driver
>>    ALSA: hda: cs35l41: Support reading subsystem id from ACPI
>>    ALSA: hda: cs35l41: Support multiple load paths for firmware
>>    ALSA: hda: cs35l41: Support Speaker ID for laptops
>>    ALSA: hda: cs35l41: Support Hibernation during Suspend
>>    ALSA: hda: cs35l41: Read Speaker Calibration data from UEFI variables
>>    ALSA: hda: hda_cs_dsp_ctl: Add fw id strings
>>    ALSA: hda: cs35l41: Add defaulted values into dsp bypass config
>>      sequence
>>    ALSA: hda: cs35l41: Support Firmware switching and reloading
>>    ALSA: hda: cs35l41: Add module parameter to control firmware load
>>
>> Vitaly Rodionov (1):
>>    ALSA: hda: cs35l41: Add initial DSP support and firmware loading
> Thanks, this version looks better than previous ones, and I'm fine to
> apply as is, to make things going forward.  But this seems requiring
> the prerequisite in ASoC codec side.
>
> Mark, could you send a PR to merge into my tree so that I can apply
> those series?
>
>
> And, one still uncertain thing is about the handling of system
> suspend/resume, especially about the firmware loading work.  e.g. what
> happens if a f/w work is in run and the system goes to suspend at the
> very same time?  Or does the S3/S4 work in general at all?
>
Sorry for the delay, but your comments raised our attention and we 
wanted to run extensive testing again to make sure there is no hidden 
issue. No issues were found during tests. When we start FW download work 
we call "resume", so the resume counter should be incremented and 
suspend will not happen till we finish the download process.

Thanks,

Vitaly


> Takashi
