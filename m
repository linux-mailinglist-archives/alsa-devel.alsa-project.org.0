Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BFD531742E
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Feb 2021 00:17:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 16A6816E2;
	Thu, 11 Feb 2021 00:16:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 16A6816E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612999028;
	bh=UbjxuJfRDiYNTdFGIN5l2peNocS/0V0oIIQBwNwj3Ng=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oWtXqqFh+dsnOhReSJ3YCw1RLZ+C4fbM8DTLyR88FASe1s2h3sxd8hGS7Qil4LTDH
	 bWpYeQpfJtbSfkBGJAQFhw5RMhTOsGIGLOFJ3aq2gb3UXNPbETD7heedu46pRVNcXs
	 ilKGxZQeONelPkX3CPQb6dPGi7VTxnIemmhhqJDQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A720CF8022D;
	Thu, 11 Feb 2021 00:15:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BB9A7F8022B; Thu, 11 Feb 2021 00:15:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9E00FF800F1
 for <alsa-devel@alsa-project.org>; Thu, 11 Feb 2021 00:15:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9E00FF800F1
IronPort-SDR: 5n6+3/n7r/DLNH0W0BTvprFS15vSNLb2OmflHrlV4B7O26t/FK/m1Bp7nraZE8KVonp/76vERU
 cLHDB7e+iGKA==
X-IronPort-AV: E=McAfee;i="6000,8403,9891"; a="161312766"
X-IronPort-AV: E=Sophos;i="5.81,169,1610438400"; d="scan'208";a="161312766"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2021 15:15:20 -0800
IronPort-SDR: oBi1/dF7FKvJM5Aq1ajJ0CRa0qM0MmgAhgytvZ12WxY86lshpf9xP7EIhMvCh0M9PYzL/J+YCu
 wEqCEUmlYtGg==
X-IronPort-AV: E=Sophos;i="5.81,169,1610438400"; d="scan'208";a="396984385"
Received: from ichakrab-mobl2.amr.corp.intel.com (HELO [10.212.48.39])
 ([10.212.48.39])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2021 15:15:18 -0800
Subject: Re: [PATCH 1/2] soundwire: intel: fix possible crash when no device
 is detected
To: "Rafael J. Wysocki" <rafael@kernel.org>,
 =?UTF-8?Q?Marcin_=c5=9alusarz?= <marcin.slusarz@gmail.com>
References: <a3f01a5d-d7a5-8280-4091-b2486b01a782@linux.intel.com>
 <20210208120104.204761-1-marcin.slusarz@gmail.com>
 <CAJZ5v0gftDzua87J0To87=Huer2q=_z=0Bj2q++OQAYNtPe86w@mail.gmail.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <e6d3f589-fa9b-baee-8dba-6a7c09e50b83@linux.intel.com>
Date: Wed, 10 Feb 2021 17:15:17 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAJZ5v0gftDzua87J0To87=Huer2q=_z=0Bj2q++OQAYNtPe86w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, Takashi Iwai <tiwai@suse.de>,
 ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Mark Brown <broonie@kernel.org>,
 marcin.slusarz@intel.com, Salvatore Bonaccorso <carnil@debian.org>
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



On 2/8/21 6:37 AM, Rafael J. Wysocki wrote:
> On Mon, Feb 8, 2021 at 1:01 PM Marcin Ślusarz <marcin.slusarz@gmail.com> wrote:
>>
>> From: Marcin Ślusarz <marcin.slusarz@intel.com>
>>
>> acpi_walk_namespace can return success without executing our
>> callback which initializes info->handle.
>> If the random value in this structure is a valid address (which
>> is on the stack, so it's quite possible), then nothing bad will
>> happen, because:
>> sdw_intel_scan_controller
>>   -> acpi_bus_get_device
>>   -> acpi_get_device_data
>>   -> acpi_get_data_full
>>   -> acpi_ns_validate_handle
>> will reject this handle.
>>
>> However, if the value from the stack doesn't point to a valid
>> address, we get this:
>>
>> BUG: kernel NULL pointer dereference, address: 0000000000000050
>> PGD 0 P4D 0
>> Oops: 0000 [#1] SMP NOPTI
>> CPU: 6 PID: 472 Comm: systemd-udevd Tainted: G        W         5.10.0-1-amd64 #1 Debian 5.10.4-1
>> Hardware name: HP HP Pavilion Laptop 15-cs3xxx/86E2, BIOS F.05 01/01/2020
>> RIP: 0010:acpi_ns_validate_handle+0x1a/0x23
>> Code: 00 48 83 c4 10 5b 5d 41 5c 41 5d 41 5e 41 5f c3 0f 1f 44 00 00 48 8d 57 ff 48 89 f8 48 83 fa fd 76 08 48 8b 05 0c b8 67 01 c3 <80> 7f 08 0f 74 02 31 c0 c3 0f 1f 44 00 00 48 8b 3d f6 b7 67 01 e8
>> RSP: 0000:ffffc388807c7b20 EFLAGS: 00010213
>> RAX: 0000000000000048 RBX: ffffc388807c7b70 RCX: 0000000000000000
>> RDX: 0000000000000047 RSI: 0000000000000246 RDI: 0000000000000048
>> RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000000
>> R10: ffffffffc0f5f4d1 R11: ffffffff8f0cb268 R12: 0000000000001001
>> R13: ffffffff8e33b160 R14: 0000000000000048 R15: 0000000000000000
>> FS:  00007f24548288c0(0000) GS:ffff9f781fb80000(0000) knlGS:0000000000000000
>> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>> CR2: 0000000000000050 CR3: 0000000106158004 CR4: 0000000000770ee0
>> PKRU: 55555554
>> Call Trace:
>>   acpi_get_data_full+0x4d/0x92
>>   acpi_bus_get_device+0x1f/0x40
>>   sdw_intel_acpi_scan+0x59/0x230 [soundwire_intel]
>>   ? strstr+0x22/0x60
>>   ? dmi_matches+0x76/0xe0
>>   snd_intel_dsp_driver_probe.cold+0xaf/0x163 [snd_intel_dspcfg]
>>   azx_probe+0x7a/0x970 [snd_hda_intel]
>>   local_pci_probe+0x42/0x80
>>   ? _cond_resched+0x16/0x40
>>   pci_device_probe+0xfd/0x1b0
>>   really_probe+0x205/0x460
>>   driver_probe_device+0xe1/0x150
>>   device_driver_attach+0xa1/0xb0
>>   __driver_attach+0x8a/0x150
>>   ? device_driver_attach+0xb0/0xb0
>>   ? device_driver_attach+0xb0/0xb0
>>   bus_for_each_dev+0x78/0xc0
>>   bus_add_driver+0x12b/0x1e0
>>   driver_register+0x8b/0xe0
>>   ? 0xffffffffc0f65000
>>   do_one_initcall+0x44/0x1d0
>>   ? do_init_module+0x23/0x250
>>   ? kmem_cache_alloc_trace+0xf5/0x200
>>   do_init_module+0x5c/0x250
>>   __do_sys_finit_module+0xb1/0x110
>>   do_syscall_64+0x33/0x80
>>   entry_SYSCALL_64_after_hwframe+0x44/0xa9
>>
>> CC: stable@vger.kernel.org
>> Signed-off-by: Marcin Ślusarz <marcin.slusarz@intel.com>
>> Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> 
> Reviewed-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

Adding Vinod, Takashi, Mark and Jaroslav in CC: to make sure this patch 
does not fall between the cracks.

This issue may impact all HDaudio platforms and this patch needs to 
reach Linus' tree and 5.10-stable. Thanks!

> 
>> ---
>>   drivers/soundwire/intel_init.c | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/soundwire/intel_init.c b/drivers/soundwire/intel_init.c
>> index cabdadb09a1b..bc8520eb385e 100644
>> --- a/drivers/soundwire/intel_init.c
>> +++ b/drivers/soundwire/intel_init.c
>> @@ -405,11 +405,12 @@ int sdw_intel_acpi_scan(acpi_handle *parent_handle,
>>   {
>>          acpi_status status;
>>
>> +       info->handle = NULL;
>>          status = acpi_walk_namespace(ACPI_TYPE_DEVICE,
>>                                       parent_handle, 1,
>>                                       sdw_intel_acpi_cb,
>>                                       NULL, info, NULL);
>> -       if (ACPI_FAILURE(status))
>> +       if (ACPI_FAILURE(status) || info->handle == NULL)
>>                  return -ENODEV;
>>
>>          return sdw_intel_scan_controller(info);
>> --
>> 2.25.1
>>
