Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A0B0725432C
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Aug 2020 12:08:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2DED416D9;
	Thu, 27 Aug 2020 12:08:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2DED416D9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598522933;
	bh=cijoRAOL04+FZY3/XDKUmKtO5V/Tz566Epf7vDuVZNw=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=e6pwLIqVCp2e+3UOhrDfEaBDW4fAsA+d6b92VCFz9sx2TIecsqctbExUzMpgL6hpj
	 yf4SPar4kC4J/1uAvltJNnEIQNpO3rToBUXD9kjeL9P6KFqB1Qv3BefFtMZ5n+Rsgn
	 RJQZjEzRC+1KpPgK8sShH2/fq0PcXInORlhvmGGE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4A6D1F80105;
	Thu, 27 Aug 2020 12:07:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A31DAF800EB; Thu, 27 Aug 2020 12:07:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=NICE_REPLY_A,PRX_BODY_29,
 PRX_BODY_30,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4DE86F800EB
 for <alsa-devel@alsa-project.org>; Thu, 27 Aug 2020 12:07:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4DE86F800EB
IronPort-SDR: Ty3BOInvHxrrntqW9mmQxCMLb55MBiG4Hlsuggi7QocgFRLV++qIKybI/yspYlJe0cmAIi70F8
 TQ9/Btj355fQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9725"; a="155711934"
X-IronPort-AV: E=Sophos;i="5.76,359,1592895600"; d="scan'208";a="155711934"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2020 03:07:00 -0700
IronPort-SDR: VAuOXdoV93bqrHjPfQJbx5IWDDjy+eAPmPQGUY47XBPndeGw+Ny4aZ8QJGVEHRbnfBJkPGP/h1
 uT87xuF2quzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,359,1592895600"; d="scan'208";a="295675714"
Received: from crojewsk-mobl1.ger.corp.intel.com (HELO [10.213.22.177])
 ([10.213.22.177])
 by orsmga003.jf.intel.com with ESMTP; 27 Aug 2020 03:06:56 -0700
Subject: Re: [PATCH v4 02/13] ASoC: Intel: catpt: Define DSP operations
To: Andy Shevchenko <andriy.shevchenko@intel.com>
References: <20200812205753.29115-1-cezary.rojewski@intel.com>
 <20200812205753.29115-3-cezary.rojewski@intel.com>
 <20200813185129.GB1891694@smile.fi.intel.com>
 <946fdd80-c89d-ee1b-6eef-e752318b55a6@intel.com>
 <237f2343-fd57-8ebf-b8f2-8c2cf5c3c745@intel.com>
 <20200820090055.GT1891694@smile.fi.intel.com>
 <dec6d548-8376-683f-7d07-44f1cfbbf375@intel.com>
 <20200825131615.GG1891694@smile.fi.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <e5745369-732a-d70c-20be-2d8c3665e472@intel.com>
Date: Thu, 27 Aug 2020 12:06:55 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200825131615.GG1891694@smile.fi.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 filip.kaczmarski@intel.com, harshapriya.n@intel.com, marcin.barlik@intel.com,
 zwisler@google.com, lgirdwood@gmail.com, tiwai@suse.com,
 filip.proborszcz@intel.com, broonie@kernel.org,
 amadeuszx.slawinski@linux.intel.com, michal.wasko@intel.com,
 cujomalainey@chromium.org, krzysztof.hejmowski@intel.com,
 ppapierkowski@habana.ai, vamshi.krishna.gopal@intel.com
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

On 2020-08-25 3:16 PM, Andy Shevchenko wrote:
> On Mon, Aug 24, 2020 at 06:33:17PM +0200, Cezary Rojewski wrote:
>> On 2020-08-20 11:00 AM, Andy Shevchenko wrote:

...

>> Another question though: PCI_PM_CTRL. In order for me to make use of this,
>> "pm_cap" member would have to be declared for my device. As this is no
>> struct pci_dev, catpt has currently no separate member for that purpose. I
>> don't believe you want me to add that field into struct's declaration.
>> Second option is to define constant for pm_cap offset aka 0x80 within
>> registers.h and then do the operations as follows:
>> 	catpt_updatel_pci(cdev, CATPT_PM_CAP + PCI_PM_CTRL, ...)
> 
>> However, in such case I won't be able to make use of current version of
>> _updatel_pci() as definition of that macro allows me to skip prefix and type
>> implicitly - PMCS (the rest is appended automatically).
>> Maybe let's leave it within registers.h altogether so I can actually keep
>> using said macro?
> 
> Basically what you do with accessing PCI configuration space via these methods
> (catpt_update_pci(), etc) is something repetitive / similar to what xHCI DbC
> support code does. I recommend to spend some time to look for similarities here
> (catpt) and there (PCI core, xHCI DbC, etc) and, if we were lucky, derive
> common helpers for traverse the capability list in more generalized way.
> 

I wouldn't call direct-access a repetitive procedure, i.e. had procedure 
for enumerating PCI capabilities list been implemented individually by 
every PCI device type, then one can describe that as repetitiveness. 
Here, we are dealing with no procedure at all, just a writel & readl.

About xHCI, I believe you meant: xhci_find_next_ext_cap()
	https://elixir.bootlin.com/linux/latest/source/drivers/usb/host/xhci-ext-caps.h#L97

in case of PCI that's: pci_find_next_capability(), __pci_find_next_cap() 
and friends. pci_find_next_capability() is pci_dev dependent while most 
of the rest pci_bus instead. We fail both dependencies in catpt case.

xhci_find_next_ext_cap search method seems xHCI-specific, notice the 
0x10 offset for HCCPARAMS1 and then the left-shift-by-2. PCI doesn't do 
that when enumerating capabilities, instead it checks Capabilities 
List-bit within Status reg and then begins iterating given the start pos 
- Capability Pointer, usually 0x34. Abstracting these (if even possible) 
would end up with 80% code gluing two different worlds with 20% left 
doing the actual job. Fact that those two are separated increases code 
readability.

While catpt is of platform_device type located on acpi bus, beneath 
there's a (incomplete?) description of PCI device.

PCI config
catpt_acpi_probe00000000: 9cb68086 00100006 04010003 00000000
catpt_acpi_probe00000010: fe000000 fe100000 00000000 00000000
catpt_acpi_probe00000020: 00000000 00000000 00000000 00000000
catpt_acpi_probe00000030: 00000000 00000080 00000000 00000100

PCI base + 0x80
catpt_acpi_probe00000000: 40030001 0000000b 00000000 00000000
catpt_acpi_probe00000010: 00000000 00000000 00000000 00000000
catpt_acpi_probe00000020: fffffffd 00000000 80000fff 00000000
catpt_acpi_probe00000030: 00000000 00000000 00000000 00000000

Capabilities List-bit is set, start pos from Capabilitiy Pointer equals 
0x80. What we have here is singular list of capabilities - PM as the 
only element. Following is the important DWORD (_PM_CTRL) - 0xb tells us 
that device is currently in D3hot. For LPT/WPT ADSP basically all other 
PM bits are hardwired to 0 or not supported.

So, quite frankly, had the BIOS offered correct ADSP device description, 
we wouldn't be dealing with ACPI device/ACPI bus at all. This has been 
corrected from SKL+ ADSP onward. To answer the immediate question: no, 
device of id 0x9cb6 won't be present within /sys/bus/pci/devices/ (cat 
'./device' for id for every entry). Even converted catpt driver from 
acpi to pci just to make sure.

I don't mind adding new constant within register.h for transparency:
	#define CATPT_PCI_PMCAPID 0x80
	#define CATPT_PCI_PMCS (CATPT_PCI_PMCAPID + PCI_PM_CTRL)

Current status for PM catpt_updatel_pci:
	catpt_updatel_pci(cdev, PMCS, PCI_PM_CTRL_STATE_MASK, PCI_D3hot)
	catpt_updatel_pci(cdev, PMCS, PCI_PM_CTRL_STATE_MASK, PCI_D0)
which looks very good to me.
