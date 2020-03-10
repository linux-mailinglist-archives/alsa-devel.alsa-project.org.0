Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CE4117F3B6
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Mar 2020 10:32:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D8B0E1669;
	Tue, 10 Mar 2020 10:31:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D8B0E1669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583832755;
	bh=sf5liwXwRQfT3pfUrs6nvutm62LgeptI6nscvMKFW68=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dVxOrP0rinFp6teoA8WghyQWRvg0FxPXNVjzXnXym+AYdBXlUx0+dhkXrPoBKXf/7
	 0Dc9Fixi43PXzevFL/MFyEG2L2iI4TX1CmXt4Il3j/+ddKtnf4gNg200vp2c+gj1l9
	 tkjMYrKSfVtqmUXYTAqHCfNLmGg5WLgft7BIZ8BE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EF1D7F8021C;
	Tue, 10 Mar 2020 10:30:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 67B2CF80217; Tue, 10 Mar 2020 10:30:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B581CF80123
 for <alsa-devel@alsa-project.org>; Tue, 10 Mar 2020 10:30:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B581CF80123
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Mar 2020 02:30:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,535,1574150400"; d="scan'208";a="245631495"
Received: from crojewsk-mobl1.ger.corp.intel.com (HELO [10.237.137.172])
 ([10.237.137.172])
 by orsmga006.jf.intel.com with ESMTP; 10 Mar 2020 02:30:39 -0700
Subject: Re: [PATCH 2/7] ASoC: Intel: Skylake: Select hda configuration
 permissively
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
References: <20200305145314.32579-1-cezary.rojewski@intel.com>
 <20200305145314.32579-3-cezary.rojewski@intel.com>
 <ab7ad0e3-bc46-c761-4357-65d8563df5cc@linux.intel.com>
 <7a04e8af-6ee0-394a-6802-c193777ad87c@intel.com>
 <ffe33017-5b2d-0c63-4a15-33df8831f29c@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <2e668752-e020-baf5-bd1b-de41d8eb6d3a@intel.com>
Date: Tue, 10 Mar 2020 10:30:38 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <ffe33017-5b2d-0c63-4a15-33df8831f29c@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: vkoul@kernel.org, broonie@kernel.org, tiwai@suse.com, lgirdwood@gmail.com
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

On 2020-03-09 18:03, Pierre-Louis Bossart wrote:
> On 3/9/20 8:47 AM, Cezary Rojewski wrote:
>> On 2020-03-06 21:57, Pierre-Louis Bossart wrote:
>>> On 3/5/20 8:53 AM, Cezary Rojewski wrote:
>>>> With _reset_link removed from the probe sequence, codec_mask at the 
>>>> time
>>>> skl_find_hda_machine() is invoked will always be 0, so hda machine will
>>>> never be chosen. Rather than reorganizing boot flow, be permissive 
>>>> about
>>>> invalid mask. codec_mask will be set to proper value during 
>>>> probe_work -
>>>> before skl_codec_create() ever gets called.
>>>
>>> humm, what would happen e.g. if you have select the SKL driver but 
>>> there is no ACPI information to select an I2S-based machine driver, 
>>> and HDaudio/iDISP are disabled? You would have no error checks then?
>>>
>>
>> Laptops I've been testing this with have had Realtek + iDisp present 
>> onboard. Now, if you disable Realtek + HDMI/DP modules within legacy 
>> HDaudio Kconfig and HD audio support within Intel Skylake tree then 
>> you end up with no required modules for said configuration at all. 
>> Nothing will happen really: no warnings, no sound card either.
> 
> I meant enable the HDaudio controller but disable HDaudio codecs/HDMI at 
> the BIOS level. In that case the codec_mask will never be set.
> 

Applying diff (better than BIOS options which are not even present on 
some prod machines):

diff --git a/sound/hda/hdac_controller.c b/sound/hda/hdac_controller.c
index 7e7be8e4dcf9..b0e4579f26f6 100644
--- a/sound/hda/hdac_controller.c
+++ b/sound/hda/hdac_controller.c
@@ -421,7 +421,8 @@ int snd_hdac_bus_reset_link(struct hdac_bus *bus, 
bool full_reset)

         /* detect codecs */
         if (!bus->codec_mask) {
-               bus->codec_mask = snd_hdac_chip_readw(bus, STATESTS);
+               //bus->codec_mask = snd_hdac_chip_readw(bus, STATESTS);
+               bus->codec_mask = 0;
                 dev_dbg(bus->dev, "codec_mask = 0x%lx\n", bus->codec_mask);
         }

---

Results:
- skl boots
- no machines present
- drv stays dormant


Dumping boot log below (notice the '[   21.569291] snd_soc_skl 
0000:00:1f.3: codec_mask = 0x0' message):


[   21.462507] snd_soc_core:snd_soc_register_dai: snd-soc-dummy 
snd-soc-dummy: ASoC: dynamically register DAI snd-soc-dummy
[   21.462541] snd_soc_core:snd_soc_register_dai: snd-soc-dummy 
snd-soc-dummy: ASoC: Registered DAI 'snd-soc-dummy-dai'
[   21.536668] snd_soc_skl 0000:00:1f.3: DSP detected with PCI 
class/subclass/prog-if info 0x040380
[   21.542406] snd_hda_core:snd_hdac_bus_parse_capabilities: snd_soc_skl 
0000:00:1f.3: Capability version: 0x0
[   21.542412] snd_hda_core:snd_hdac_bus_parse_capabilities: snd_soc_skl 
0000:00:1f.3: HDA capability ID: 0x2
[   21.542416] snd_hda_core:snd_hdac_bus_parse_capabilities: snd_soc_skl 
0000:00:1f.3: Found ML capability
[   21.542421] snd_hda_core:snd_hdac_bus_parse_capabilities: snd_soc_skl 
0000:00:1f.3: Capability version: 0x0
[   21.542425] snd_hda_core:snd_hdac_bus_parse_capabilities: snd_soc_skl 
0000:00:1f.3: HDA capability ID: 0x3
[   21.542429] snd_hda_core:snd_hdac_bus_parse_capabilities: snd_soc_skl 
0000:00:1f.3: Found PP capability offset=800
[   21.542434] snd_hda_core:snd_hdac_bus_parse_capabilities: snd_soc_skl 
0000:00:1f.3: Capability version: 0x0
[   21.542438] snd_hda_core:snd_hdac_bus_parse_capabilities: snd_soc_skl 
0000:00:1f.3: HDA capability ID: 0x1
[   21.542443] snd_hda_core:snd_hdac_bus_parse_capabilities: snd_soc_skl 
0000:00:1f.3: Found GTS capability offset=500
[   21.542448] snd_hda_core:snd_hdac_bus_parse_capabilities: snd_soc_skl 
0000:00:1f.3: Capability version: 0x0
[   21.542451] snd_hda_core:snd_hdac_bus_parse_capabilities: snd_soc_skl 
0000:00:1f.3: HDA capability ID: 0x5
[   21.542455] snd_hda_core:snd_hdac_bus_parse_capabilities: snd_soc_skl 
0000:00:1f.3: Found DRSM capability
[   21.542460] snd_hda_core:snd_hdac_bus_parse_capabilities: snd_soc_skl 
0000:00:1f.3: Capability version: 0x0
[   21.542465] snd_hda_core:snd_hdac_bus_parse_capabilities: snd_soc_skl 
0000:00:1f.3: HDA capability ID: 0x4
[   21.542468] snd_hda_core:snd_hdac_bus_parse_capabilities: snd_soc_skl 
0000:00:1f.3: Found SPB capability
[   21.542672] snd_soc_skl:skl_first_init: snd_soc_skl 0000:00:1f.3: 
chipset global capabilities = 0x9701
[   21.556416] snd_soc_skl:skl_nhlt_update_topology_bin: snd_soc_skl 
0000:00:1f.3: oem_id LENOVO, oem_table_id TP-N23   oem_revision 4880
[   21.557053] snd_soc_skl:skl_find_machine: snd_soc_skl 0000:00:1f.3: 
No matching I2S machine driver found
[   21.557650] snd_soc_skl:skl_init_dsp: snd_soc_skl 0000:00:1f.3: dsp 
registration status=0
[   21.557658] snd_hda_ext_core:snd_hdac_ext_bus_get_ml_capabilities: 
snd_soc_skl 0000:00:1f.3: In snd_hdac_ext_bus_get_ml_capabilities Link 
count: 2
[   21.558254] snd_soc_skl 0000:00:1f.3: bound 0000:00:02.0 (ops 
i915_audio_component_bind_ops [i915])
[   21.558259] snd_hda_core:snd_hdac_display_power: snd_soc_skl 
0000:00:1f.3: display power enable
[   21.558272] snd_hda_core:snd_hdac_set_codec_wakeup: snd_soc_skl 
0000:00:1f.3: enable codec wakeup
[   21.561088] snd_hda_core:snd_hdac_set_codec_wakeup: snd_soc_skl 
0000:00:1f.3: disable codec wakeup
[   21.562606] snd_soc_skl:skl_init_pci: snd_soc_skl 0000:00:1f.3: 
Clearing TCSEL
[   21.562617] snd_hda_core:snd_hdac_set_codec_wakeup: snd_soc_skl 
0000:00:1f.3: enable codec wakeup
[   21.569291] snd_soc_skl 0000:00:1f.3: codec_mask = 0x0
[   21.569306] snd_hda_core:snd_hdac_set_codec_wakeup: snd_soc_skl 
0000:00:1f.3: disable codec wakeup
[   21.570856] snd_soc_skl 0000:00:1f.3: no hda codecs found!
[   21.570901] snd_soc_core:snd_soc_register_dai: snd_soc_skl 
0000:00:1f.3: ASoC: dynamically register DAI 0000:00:1f.3
[   21.570923] snd_soc_core:snd_soc_register_dai: snd_soc_skl 
0000:00:1f.3: ASoC: Registered DAI 'SSP0 Pin'
[   21.570927] snd_soc_core:snd_soc_register_dai: snd_soc_skl 
0000:00:1f.3: ASoC: dynamically register DAI 0000:00:1f.3
[   21.570947] snd_soc_core:snd_soc_register_dai: snd_soc_skl 
0000:00:1f.3: ASoC: Registered DAI 'SSP1 Pin'
[   21.570951] snd_soc_core:snd_soc_register_dai: snd_soc_skl 
0000:00:1f.3: ASoC: dynamically register DAI 0000:00:1f.3
[   21.570971] snd_soc_core:snd_soc_register_dai: snd_soc_skl 
0000:00:1f.3: ASoC: Registered DAI 'SSP2 Pin'
[   21.570976] snd_soc_core:snd_soc_register_dai: snd_soc_skl 
0000:00:1f.3: ASoC: dynamically register DAI 0000:00:1f.3
[   21.570996] snd_soc_core:snd_soc_register_dai: snd_soc_skl 
0000:00:1f.3: ASoC: Registered DAI 'SSP3 Pin'
[   21.571000] snd_soc_core:snd_soc_register_dai: snd_soc_skl 
0000:00:1f.3: ASoC: dynamically register DAI 0000:00:1f.3
[   21.571020] snd_soc_core:snd_soc_register_dai: snd_soc_skl 
0000:00:1f.3: ASoC: Registered DAI 'SSP4 Pin'
[   21.571024] snd_soc_core:snd_soc_register_dai: snd_soc_skl 
0000:00:1f.3: ASoC: dynamically register DAI 0000:00:1f.3
[   21.571044] snd_soc_core:snd_soc_register_dai: snd_soc_skl 
0000:00:1f.3: ASoC: Registered DAI 'SSP5 Pin'
[   21.571048] snd_soc_core:snd_soc_register_dai: snd_soc_skl 
0000:00:1f.3: ASoC: dynamically register DAI 0000:00:1f.3
[   21.571067] snd_soc_core:snd_soc_register_dai: snd_soc_skl 
0000:00:1f.3: ASoC: Registered DAI 'iDisp1 Pin'
[   21.571077] snd_soc_core:snd_soc_register_dai: snd_soc_skl 
0000:00:1f.3: ASoC: dynamically register DAI 0000:00:1f.3
[   21.571099] snd_soc_core:snd_soc_register_dai: snd_soc_skl 
0000:00:1f.3: ASoC: Registered DAI 'iDisp2 Pin'
[   21.571103] snd_soc_core:snd_soc_register_dai: snd_soc_skl 
0000:00:1f.3: ASoC: dynamically register DAI 0000:00:1f.3
[   21.571125] snd_soc_core:snd_soc_register_dai: snd_soc_skl 
0000:00:1f.3: ASoC: Registered DAI 'iDisp3 Pin'
[   21.571129] snd_soc_core:snd_soc_register_dai: snd_soc_skl 
0000:00:1f.3: ASoC: dynamically register DAI 0000:00:1f.3
[   21.571148] snd_soc_core:snd_soc_register_dai: snd_soc_skl 
0000:00:1f.3: ASoC: Registered DAI 'DMIC01 Pin'
[   21.571153] snd_soc_core:snd_soc_register_dai: snd_soc_skl 
0000:00:1f.3: ASoC: dynamically register DAI 0000:00:1f.3
[   21.571172] snd_soc_core:snd_soc_register_dai: snd_soc_skl 
0000:00:1f.3: ASoC: Registered DAI 'DMIC16k Pin'
[   21.571176] snd_soc_core:snd_soc_register_dai: snd_soc_skl 
0000:00:1f.3: ASoC: dynamically register DAI 0000:00:1f.3
[   21.571209] snd_soc_core:snd_soc_register_dai: snd_soc_skl 
0000:00:1f.3: ASoC: Registered DAI 'Analog CPU DAI'
[   21.571213] snd_soc_core:snd_soc_register_dai: snd_soc_skl 
0000:00:1f.3: ASoC: dynamically register DAI 0000:00:1f.3
[   21.571230] snd_soc_core:snd_soc_register_dai: snd_soc_skl 
0000:00:1f.3: ASoC: Registered DAI 'Alt Analog CPU DAI'
[   21.571233] snd_soc_core:snd_soc_register_dai: snd_soc_skl 
0000:00:1f.3: ASoC: dynamically register DAI 0000:00:1f.3
[   21.571250] snd_soc_core:snd_soc_register_dai: snd_soc_skl 
0000:00:1f.3: ASoC: Registered DAI 'Digital CPU DAI'
[   21.571566] snd_hda_core:snd_hdac_display_power: snd_soc_skl 
0000:00:1f.3: display power disable
[   21.571585] snd_soc_skl:skl_runtime_suspend: snd_soc_skl 
0000:00:1f.3: in skl_runtime_suspend

