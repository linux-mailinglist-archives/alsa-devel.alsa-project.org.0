Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D218E2A4F01
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Nov 2020 19:37:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6BC07166E;
	Tue,  3 Nov 2020 19:36:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6BC07166E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604428647;
	bh=xxkkYBql8NXIAsJ/D+y03FbN6Gkn/tISq9v9rFSzgOg=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fBlaji6H3xsflVpIVteNiZh/j+1ymeAtg8YvZXHltrw/XyT0AhIGlgQU/gDlZRsDx
	 ufjY+UA/i/36hBj0sNTFZPMMnPne4nLdVLkAIIVBYcHTJm2v9vvHzKhxgqKSXnDAmv
	 3eepR/ecbFHxnuiXHtV/SWkrcYQwnVjxo3RoPBBI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BBD3FF80272;
	Tue,  3 Nov 2020 19:35:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D6593F80171; Tue,  3 Nov 2020 19:35:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 07F1BF80083
 for <alsa-devel@alsa-project.org>; Tue,  3 Nov 2020 19:35:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 07F1BF80083
IronPort-SDR: 8T/HoWqyZ1RniB7HMm9mD++7Nv2awjo9z9rcf3dlsfwa1dB4D9PdPJEjB8NxO8xzd8yE7UXCTj
 R2bM1cBlLPuw==
X-IronPort-AV: E=McAfee;i="6000,8403,9794"; a="230731722"
X-IronPort-AV: E=Sophos;i="5.77,448,1596524400"; d="scan'208";a="230731722"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2020 10:35:44 -0800
IronPort-SDR: bHNj/JoKRstYrDj0mgNWLSQhGnm+ZYTN8dj56MWswfjiAGkIfOhPdwmBvy/IdjjZwZ5fQ+DI4d
 ESd+Xk1fdcWg==
X-IronPort-AV: E=Sophos;i="5.77,448,1596524400"; d="scan'208";a="528591147"
Received: from ctanriov-mobl1.amr.corp.intel.com (HELO [10.212.114.78])
 ([10.212.114.78])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2020 10:35:43 -0800
Subject: Re: [PATCH] ASoC: rt715:add Mic Mute LED control support
To: "Limonciello, Mario" <Mario.Limonciello@dell.com>,
 Mark Brown <broonie@kernel.org>
References: <20201103125859.8759-1-Perry_Yuan@Dell.com>
 <20201103131253.GA5545@sirena.org.uk>
 <5f2c1282-4401-276a-8dad-127fa1f449fd@linux.intel.com>
 <20201103175948.GF5545@sirena.org.uk>
 <DM6PR19MB26368B60076D049F009B75A3FA110@DM6PR19MB2636.namprd19.prod.outlook.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <15ed949b-0313-168c-bfc5-3e71d9548e3f@linux.intel.com>
Date: Tue, 3 Nov 2020 12:35:42 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <DM6PR19MB26368B60076D049F009B75A3FA110@DM6PR19MB2636.namprd19.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: "oder_chiou@realtek.com" <oder_chiou@realtek.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "Yuan,
 Perry" <Perry.Yuan@dell.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "tiwai@suse.com" <tiwai@suse.com>
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


> I don't think it came through in the commit message, but I wanted to mention
> in the system that prompted this software does not control the LED.  The LED
> is actually controlled by hardware, but has circuitry to delay the hardware
> mute until software mute is complete to avoid any "popping noises".
> 
> This patch along with the platform/x86 patch:
> https://patchwork.kernel.org/project/platform-driver-x86/patch/20201103125542.8572-1-Perry_Yuan@Dell.com/
> complete that loop.
> 
> The flow is:
> User presses mute key, dell-wmi receives event, passes to dell-privacy-wmi.
> This emits to userspace as KEY_MICMUTE.  Userspace processes it and via UCM
> switches get toggled.  The codec driver (or subsystem perhaps) will use LED
> trigger to notify to change LED.  This gets picked up by dell-privacy-acpi.
> 
> dell-privacy-acpi doesn't actually change LED, but notifies that SW mute was
> done.
> 
> If none of that flow was used the LED and mute function still work, but there
> might be the popping noise.

Side note that the existing UCM config for RT715 does not do what I 
suggested, it seems we are using an incorrect configuration for 
CaptureSwitch and CaptureVolume:

CaptureSwitch "PGA5.0 5 Master Capture Switch"
	      CaptureVolume "PGA5.0 5 Master Capture Volume"		 
CaptureVolume "PGA5.0 5 Master Capture Volume"

That should be an RT715 control, not an SOF one. This was brought to our 
attention this morning. Probably a copy-paste from the DMIC case, likely 
needs to be changed for both RT715 and RT715-sdca cases.

https://github.com/thesofproject/linux/issues/2544#issuecomment-721231103
