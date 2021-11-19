Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 41A60458999
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Nov 2021 08:05:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BBF4A16CD;
	Mon, 22 Nov 2021 08:04:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BBF4A16CD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637564748;
	bh=KRie04s5kHf19yS+kh/bsZc59yI/hQ4YIijc+rdNLEg=;
	h=Date:To:References:From:Subject:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KP8ufATuVUF+SUMnr8gRzRThWwa1qWmil5glMmYLjwdRuVjxXA6NjtccMUHV2CM7Y
	 y/fZeAExSDghxTfh4hkBLbNFyQ2T0AavS/VgfqL7kO4W2Ri7t84QsBUZKBfRm5ItRM
	 mKiwibDqcvkz40gelZnw4icI4Qf9ArfQXrpbYb/c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4DC0FF8051B;
	Mon, 22 Nov 2021 08:02:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DA0A4F80217; Fri, 19 Nov 2021 21:57:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,NICE_REPLY_A,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C8A9CF8010B
 for <alsa-devel@alsa-project.org>; Fri, 19 Nov 2021 21:57:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C8A9CF8010B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="L0WK59nF"
Received: by mail-wr1-x433.google.com with SMTP id u1so20172053wru.13
 for <alsa-devel@alsa-project.org>; Fri, 19 Nov 2021 12:57:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:content-language:to:cc
 :references:from:subject:in-reply-to:content-transfer-encoding;
 bh=I4B5HFmy96F+nwrWPqo3yCY/gtnU/WqzBwP+duwHSo8=;
 b=L0WK59nFYAx5D1sVOWtIE+pfcFj77YnZRRca6xSi6oRHtVLRet9kQTIE8d3Vz1MBkS
 fVk+fBalwe4exDT+tgq4O10P9pO4O0NvTWIilEkcQruFmsOBmFgqGpXwHjaM2IwF9X/H
 UBxhFDfu/FJnYvWtuUh0IZmvZq0lI0sin83XCFfm9uY96DAXgmx470ktEey5o07BkRsV
 vwJRQzunIgehdNa+5fkMLujEBgqElBRnBMOaFrOEHi6BSdALFlHu7rXKTJubc4eyPhSP
 I6ErWfPES5Z4jmDaRKhTwS2CYLBDJHyBWxOHEt2NT3iNlQwPVnzGQ/aaKbtVz2xHyoBV
 wizA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:subject:in-reply-to
 :content-transfer-encoding;
 bh=I4B5HFmy96F+nwrWPqo3yCY/gtnU/WqzBwP+duwHSo8=;
 b=PbMdCdxX/U6Ibj2yQLMOxfLoZ8apAtIhSbTAqErUXMVM+gTxtRZV3vfalCEyMuvJJR
 ZHWRDMfTPaS5kcrpPlZfQYwJiJkUCohpXC7SBeH/+fSn27v0kFmAFHAnafl3GUsJOWrg
 i003NrSBMrvKWNWILNsOTwL2rG1D9PRqAbfbxUkGQgiFV+pwkYIWqAXQkzqxe4jb9DvA
 6+LhZEa/SsJdnn+Ud4edrInNPvYQberm6dCZUjSiTM13jKBtcjyZ3+MA1RZQeIs1IB7q
 jy+7oLJzymaxlxD/PshRFZC9RDgIUnoMv01iIDFW+nsqoVP34w2FvyEO/v1VhjfvRgKb
 XW0Q==
X-Gm-Message-State: AOAM530omzCQ4qxBJLSYKMShtQTvV8m0Puo4mhPnTaY6oz2/e/Hskro7
 woHgonSYUAeCtinCbpph4F4=
X-Google-Smtp-Source: ABdhPJxThqyWTf0egpTyNTCp6Gr7jhSgpzMj1B/CMXcoDPlLYGFSCSstGGEn/cT9MiTXSGpY9jdDTw==
X-Received: by 2002:a5d:64c3:: with SMTP id f3mr10883281wri.321.1637355462123; 
 Fri, 19 Nov 2021 12:57:42 -0800 (PST)
Received: from ?IPV6:2003:ea:8f1a:f00:e956:6e6f:f307:5861?
 (p200300ea8f1a0f00e9566e6ff3075861.dip0.t-ipconnect.de.
 [2003:ea:8f1a:f00:e956:6e6f:f307:5861])
 by smtp.googlemail.com with ESMTPSA id n15sm14768925wmq.38.2021.11.19.12.57.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Nov 2021 12:57:41 -0800 (PST)
Message-ID: <cf153c5c-e2f0-8d40-cdab-b893e63d2e9c@gmail.com>
Date: Fri, 19 Nov 2021 21:57:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>
References: <d9d76980-966a-e031-70d1-3254ba5be5eb@gmail.com>
 <s5hczmxgnm2.wl-tiwai@suse.de>
 <bc281416-e28d-4c18-2475-add92d38a554@gmail.com>
 <s5hczmwfe3x.wl-tiwai@suse.de>
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: Warning due to "ALSA: hda: intel: More comprehensive PM runtime
 setup for controller driver"
In-Reply-To: <s5hczmwfe3x.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Mon, 22 Nov 2021 08:01:48 +0100
Cc: alsa-devel@alsa-project.org, Linux PM <linux-pm@vger.kernel.org>
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

On 19.11.2021 14:51, Takashi Iwai wrote:
> On Thu, 18 Nov 2021 23:13:50 +0100,
> Heiner Kallweit wrote:
>>
>> On 18.11.2021 22:28, Takashi Iwai wrote:
>>> On Thu, 18 Nov 2021 21:33:34 +0100,
>>> Heiner Kallweit wrote:
>>>>
>>>> I get the following warning caused by 4f66a9ef37d3 ("ALSA: hda: intel: More
>>>> comprehensive PM runtime setup for controller driver"):
>>>>
>>>> snd_hda_intel 0000:00:1f.3: Unbalanced pm_runtime_enable!
>>>>
>>>> Not sure how this patch was tested because the warning is obvious.
>>>> The patch doesn't consider what the PCI sub-system does with regard to
>>>> RPM. Have a look at pci_pm_init().
>>>>
>>>> I'd understand to add the call to pm_runtime_dont_use_autosuspend(),
>>>> but for all other added calls I see no justification.
>>>>
>>>> If being unsure about when to use which RPM call best involve
>>>> linux-pm@vger.kernel.org.
>>>
>>> Thanks for the notice.  It's been through Intel CI and tests on a few
>>> local machines, maybe we haven't checked carefully those errors but
>>> only concentrated on the other issues, as it seems.
>>>
>>> There were two problems: one was the runtime PM being kicked off even
>>> during the PCI driver remove call, and another was the proper runtime
>>> PM setup after re-binding.
>>>
>>
>> Having a look at the commit message of "ALSA: hda: fix general protection
>> fault in azx_runtime_idle" the following sounds weird:
>>
>>   - pci-driver.c:pm_runtime_put_sync() leads to a call
>>     to rpm_idle() which again calls azx_runtime_idle()
>>
>> rpm_idle() is only called if usage_count is 1 when entering
>> pm_runtime_put_sync. And this should not be the case.
>> pm_runtime_get_sync() increments the usage counter before remove()
>> is called, and remove() should also increment the usage counter.
>> This doesn't seem to happen. Maybe for whatever reason 
>> pm_runtime_get_noresume() isn't called in azx_free(), or azx_free()
>> isn't called from remove().
>> I think you should trace the call chain from the PCI core calling
>> remove() to pm_runtime_get_noresume() getting called or not.
> 
> Neither of them, supposedly.  Now I took a deeper look at the code
> around it and dug into the git log, and found that the likely problem
> was the recent PCI core code refactoring (removal of pci->driver, etc)
> that have been already reverted; that was why linux-next-20211109 was
> broken and linux-next-20211110 worked.  With the leftover pci->driver,
> the stale runtime PM callback was called at the pm_runtime_put_sync()
> call in pci_device_remove().
> 
I also noticed that partially I was on the wrong path.

> In anyway, I'll drop the invalid calls of pm_runtime_enable() /
> disable() & co.  Maybe keeping pm_runtime_forbid() and
> pm_runtime_dont_use_autosuspend() at remove still makes some sense as
> a counter-part for the probe calls, though.
> 
The call to pm_runtime_forbid() in pci_pm_init() is a heritage from
early ACPI times when broken ACPI implementations had problems with RPM.
There's a discussion (w/o result yet) to enable RPM per default for
newer ACPI versions.

Calling pm_runtime_forbid() in the driver removal path isn't strictly
needed but it doesn't hurt.

> 
> thanks,
> 
> Takashi
> 

