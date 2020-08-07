Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C2EE23EC41
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Aug 2020 13:17:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A5CCA1662;
	Fri,  7 Aug 2020 13:16:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A5CCA1662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596799044;
	bh=bwoXK2WEDYhaXhN49x0Dqwcooxrqq29DZmq+HthJCAw=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tXYozRH56LY+pcGuJL/1oJhHKRIpsbsSUXXY5Enft1zDV+mrcGO2Rv3lzZjIk2dYd
	 zVR/UD4X18o0Ryq0lq6/BHcE44kshJ65DNJbqKP0xc4vXlPgNTZsx3hgtE9XSqBPN2
	 0TLpxWx+Mw5Ksb+lmoW+vL18j2K4VNLkvAA1GUIY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 32B56F80290;
	Fri,  7 Aug 2020 13:09:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DCB97F80290; Fri,  7 Aug 2020 13:09:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=NICE_REPLY_A,PRX_BODY_135,
 PRX_BODY_30,PRX_BODY_65,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6F1CDF800AB
 for <alsa-devel@alsa-project.org>; Fri,  7 Aug 2020 13:09:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6F1CDF800AB
IronPort-SDR: 72Fqhdr4PJGgqL9IcSvEx7+BpAN2g97YTIW/nJA4jt9fgw0INIBqQnfTLxYP5Xqil3ZeH8ZHAq
 6CwOuCwBzTRw==
X-IronPort-AV: E=McAfee;i="6000,8403,9705"; a="140645835"
X-IronPort-AV: E=Sophos;i="5.75,445,1589266800"; d="scan'208";a="140645835"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2020 04:09:16 -0700
IronPort-SDR: WFJqwZjVT+A2hY0JudYohbsQJIoE/I4jzOEVZy3Jdh0kKHbwP4cS7cNodIaboQRt60kT1inJZ9
 Vyp8Ev2bzoVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,445,1589266800"; d="scan'208";a="494008533"
Received: from crojewsk-mobl1.ger.corp.intel.com (HELO [10.213.30.154])
 ([10.213.30.154])
 by fmsmga005.fm.intel.com with ESMTP; 07 Aug 2020 04:09:11 -0700
Subject: Re: [PATCH 00/13] ASoC: Intel: Catpt - Lynx and Wildcat point
To: alsa-devel@alsa-project.org
References: <20200807110649.17114-1-cezary.rojewski@intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <07ecec99-643a-19b0-3b1c-8e10a85888f2@intel.com>
Date: Fri, 7 Aug 2020 13:09:11 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200807110649.17114-1-cezary.rojewski@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: pierre-louis.bossart@linux.intel.com, andriy.shevchenko@intel.com,
 filip.kaczmarski@intel.com, harshapriya.n@intel.com, marcin.barlik@intel.com,
 zwisler@google.com, lgirdwood@gmail.com, tiwai@suse.com,
 filip.proborszcz@intel.com, broonie@kernel.org, michal.wasko@intel.com,
 cujomalainey@chromium.org, ppapierkowski@habana.ai,
 vamshi.krishna.gopal@intel.com
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

On 2020-08-07 1:06 PM, Cezary Rojewski wrote:
> Implement support for Lynxpoint and Wildcat Point AudioDSP. Catpt
> solution deprecates existing sound/soc/intel/haswell which is removed in
> the following series. This cover-letter is followed by 'Developer's deep
> dive' message schedding light on catpt's key concepts and areas
> addressed.

Developer's deep dive
=====================

Purpose of this message is explanation of Catpt's key concepts, problems 
addressed when compared to /soc/intel/haswell/ (which from now on will 
be addressed to as /haswell/) as well as answeing major why(s) 
surrounding the subject. Message does not explain every detail of every 
process as it's length is already high without doing so.
In case of any question and areas which have not beed mentioned here, 
please don't hesitate to send an email.


Following removal of /haswell/ and moving forward
-------------------------------------------------

Catpt is a direct replacement for existing /haswell/ solution. Because 
of userspace API being inherited as well as FW binary re-used, /haswell/ 
is going to be removed entirely in the follow-up series. In consequence 
of that action, majority of processing code found in /soc/intel/common 
becomes redundant. /common/ was supposed to host code common to Intel 
AudioDSP architectures. Unfortunately, it never lived up to the 
expecations. Most of code found there is LPT/WPT specific with some 
/soc/intel/baytail/ deviates while /soc/intel/skylake/ moved most of 
it's stuff away from /common/ - even DSP initialization.

To my knowledge, no device makes use of legacy /baytail/ solution any 
longer with all the products enlisting either /soc/intel/atom/ or 
/soc/sof/intel/. Following the sanitization of /common/ folder, the 
logical next step is removal of /baytrail/.


LPT and catpt
-------------

I'm not aware of any released Haswell-based product with AudioDSP 
capability, despite these being planned for some Ultrabooks initially. 
Broadwell ADSP on the other hand, was released and is present on the marked.

Decision not to cut LPT's ACPI ID off from /catpt/device.c is 
maintainance based. While a piece of most of the models found on the 
market is in IGK or Bangalore validation teams hands, the quantity is 
very limited (~1 per model). On top of that, production stuff is poor 
ContinuousIntegration medium. Our CI, once attached to the platform, 
takes basically entire control over it, in exchange allowing to perform 
test cycles in rapid fashion. Tests areas include but are not limited to 
D3/D0, S3, S4, S5, G3 (power off), individual streaming, concurrent 
streaming, cpu overload (so on and so forth..). That comes in cost of 
preparation - GPIOs and other pins need to be exposed and available
for our CI and external hw: power switches, hydras for dynamic external 
codec connections and disconnections and more. Production stuff, for 
obvious reasons does not expose such capabilities. This is different on 
RVPs which are made for that very purpose and are very CI-friendly. 
There are more of them available too.

Age of the LPT/WPT architecture has its toll, though. Not many working 
RVP exemplars are available and even less CPUs - yes, you need a special 
one to match the RVP, production CPU won't cut it. TLDR: there are not 
enough working WPT RVPs when combined with pre-release CPUs to mark 
catpt CI healthy for long-term validation (2-3 years+). To compensate, 
holes have been filled with LPT equivalents.

Considering DSP hw capabilities are basically identical between LPT and 
WPT with FW code being shared for both of them (one branch) this allows 
for high test coverage of DSP functionality regardless of PCH present. 
Codecs support is shared too - /soc/intel/boards/haswell.c aka 
hsw-rt5640.c and /soc/intel/boards/broadwell.c aka bdw-rt286.c are PCH 
agnostic.
Kernel code differences are minimal between the two and will probably be 
reduced even more in the future. Given the reasons presented
above, I believe gains from healthy CI and test coverage heavily 
outweight the maintainance cost of few lines of code appending LPT 
device support.


Device and its components
-------------------------

Device probing has been redesigned to accommodate for:
	single platform_device solution
	coupling dw_dma dev with actual ADSP device

Starting point was two platform_devices as in 
/soc/intel/common/sst-acpi.c. First gets created when specific acpi_id 
is found within DSDT ACPI table and then callback is performed on 
successful firmware file request which creates yet another device: this 
time for PCM operations - haswell-pcm-audio. Having in mind Greg KH's 
idea of reduction of number of platform_devices in Linux environment, 
decision was made to cut the later off.

This raised a dependency issue as DW DMA Controller - one of LPT/WPT 
AudioDsp device components - requires the device to be up and running 
before being probed. Moreover, because of said controller making use of 
pm_runtime during release, it is paramount pm_runtime is disabled before 
invoking it. To address this, catpt's .probe() calls _dsp_power_up() - 
which takes device out of D3 and allows for I/O access before proceeding 
with DW DMA controller. .remove() starts with pm_runtime_disable()
so postmortem suspend and resumes are prevented.

DMAC plays a ADSP personal memcopier role, there are two engines 
available 8 channels each. It's neither entirely owned by HOST nor DSP: 
ownership is instead shared. As per spec, to prevent de-synchronization, 
the following protocol is obeyed: HOST owns DW DMA controller as long as 
FW isn't alive - that is, FW_READY notification has not been received. 
Once DSP is unstalled and firmware boots, it is expected that HOST stops 
all DMA operations and entire ownership of all 16 channels is taken by 
FW. This effectively limits HOST's DMA usage to FW booting procedure.

Device begins its life in D3 state (11b for PCI PMCS::PS register), and 
needs to be taken out of it via _dsp_power_up(). That has to be done 
before FW image loading. Since LPT/WPT ADSP has no IMR - memory region 
for storing firmware image - capability, context is lost on each D0 
exit. In consequence image has to be reloaded on each resume. Here, 
additional optimization has been added to prevent redundant image 
flashing from occurring when module is about to be unloaded: 
module_is_live check.

DMAC is not the only component tied to catpt. After allocating all the 
necessary resources, probing DMAC and flashing FW, ASoC platform 
component and card need to be created. The latter is triggered by 
creation of child platform_device - as is the case for all 
snd_soc_card(s). As a child device owned by catpt, it's catpt's 
responsibility to remove it before solution gets unloaded. This is done 
by the devm_add_action hook provided with platform_device_unregister 
function.

Compared to /haswell/, catpt allows for core device probing regardless 
of snd_soc_acpi_mach being present or not. This is similar to 
codec-driver behaviour which probe right after matching device id on I2S 
bus and is more logical than complete abort when no machines are present.
Allows for core device debug or tests (e.g. power sequences) in the 
codec-less environment.


Resource management
-------------------

In contrast to its younger brothers and sisters from cAVS architecture 
(SKL+), it's HOST's responsibility to manage SRAM - memory allocation
and power gating. SRAM is split into two banks: Data SRAM and 
Instruction SRAM, subsequently divided into several EBBs with 32kBs 
each. IRAM is targeted for fixed (static) data while DRAM holds both, 
static and dynamic information.

Both, FW_BASE module and feature modules require persistent memory 
allocated to them as well as some temporary one. The temporary block is 
called scratch and is shared by all modules and thus only one gets 
allocated compared to persistent ones which are module's individual 
area. As FW context is lost on each D0 exit, to speed-up the boot 
process HOST is expected to store dynamic information regions from DRAM. 
Those regions contain module and stream states which subsequently allow 
for bringing base FW as well as streams right back to where they were 
before leaving D0.

Model seen in /soc/intel/common/sst-firmware.c has been redesigned. Two 
simple structs have been enlisted:
	catpt_mbank
	catpt_mregion

to provide resource-like memory management. 'struct resource' serves 
different purpose and its layout does not fit all needs of catpt and 
that's why new types have been provided instead. catpt_mbank represents 
SRAM bank of one type: IRAM -or- DRAM. It's made of _one_ or more 
catpt_regions, never less.

catpt core device requests memory region for either fixed or dynamic 
allocation by calling catpt_mbank_request_region or 
catpt_mbank_reserve_region. Once allocated, catpt_mregion::busy field 
gets flagged to ensure said region is no longer available until freed by 
catpt_mbank_release_region.
In the very beginning each mbank is made of singular list of regions - 
one element spanning entire SRAM with ::busy=0. On each allocation this 
situation changes and more and more blocks are being extracted from the 
free space. Banks maintain actual list of regions and perform a 'join' 
procedure when a region gets yielded back to pool of free regions. Said 
procedure attempts to join adjacent regions as long as they too are 
::busy=0.

Presented mechanism allows for keeping lowest possible amount of EBBs 
alive while power gating rest of them, saving maximum amount of power. 
There are few exceptions, meaning regions which must always be power 
un-gated. That goes for 0x200 (FW dump) at the front of DRAM and 
everything past the highest module offset - that always goes for 
FW_BASE. Everything else is available for dynamic allocation and should 
be power gated when possible.

Last but not least is the LPCS - low power clock selection. While clock 
selection is granular as per hw spec (6+ configurations), catpt deals 
with it in binary fashion only. Clock is either set to low-power when 
DSP is idle or high-power when streaming is done. This limitation is 
inherited from equivalent Windows solution and in order to eliminate it, 
much more testing has be to done. For now catpt sticks to what's stable. 
Clock selection itself is guarded by in-progress register and may not be 
performed until it's cleared. On top of that, as long as FW is alive, 
HOST should await WAITI state before attempting any selection. This is 
to ensure work on DSP side is not disrupted by unexpected clock change. 
While in D3, HOST bypasses that rule and is free to select clock forcibly.


IPC protocol
------------

Catpt features simple, synchronized '1 message out - 1message in' FW 
communication. This deviates from /soc/intel/common/sst-ipc.c as there 
are no lists involved and there is no sst_plat_ipc_ops::reply_msg_match. 
Vast majority of IPCs are one-shots meaning they flag DSP with busy 
status and until response is received, no further messaging is allowed.

There is only one communication channel for request-response called 
'downlink' with secondary channel called 'uplink' available for FW alone 
to sent notifications to HOST. While most IPCs are one-shots, FW may 
choose to delay the response. In such cases status PENDING is returned 
back and HOST is expected to await actual replay coming from the 
notification channel. Catpt verifies status of incoming response and 
yields on success or failure but re-awaits the completion on said 
PENDING status to ensure synchronization remains intact. Example of such 
delayed reply is RESET_STREAM for low power offload pipe. Until response 
is received, stream cannot progress in state machine, through operation 
PAUSE and ultimately, RESUME.

Steps have been taken to reduce kmallocs/ kzallocs in IPC messages. This 
is done by removal of temporary buffers in requests (/catpt/messages.c) 
and instead working with provided ret-pointers directly - that is, only 
when reply with SUCCESS status is returned back. Otherwise ret-pointer 
is untouched. Moreover, tx buffer has been removed 
(/catpt/ipc.c::catpt_ipc_arm) as once request is copied to hardware 
registers, it is no longer of use for IPC framework. Said framework 
gates the communication - field 'catpt_ipc::ready'. Once FW_READY 
notification is received, mailbox is initialized and further messaging 
is allowed. On critical failures: COREDUMP notification -or- IPC timeout 
ready status is revoked. Things stay that way until DSP is recovered 
from failure.


ASoC Platform component
-----------------------

Solution maintains backwards compatibility with previous one, /haswell/. 
Kcontrols which were available there - master playback, capture and 2x 
offload volumes - make they return in catpt. Differences:
	new kcontrol 'Loopback Mute' has been added
	volume controls now support quad rather than just stereo

The former is self-explanatory and has been missing in /haswell/. 
Targets Loopback stream only. The later is an adjustment to align with 
requirements and FW spec. Years ago, during LPT/WPT development change 
request has been filed to increase the number of supported channels. 
Looks like that information didn't get back to Linux, but in catpt this 
has been addressed. As already noted, WAVES and module support in 
general, is scheduled for later release.

Both volume and mute controls are stored within kcontrols::private_value 
and are applied during pcm prepare() operation. As soc_mixer_control is 
featured in every iteration of helpful macros present in 
/include/sound/soc.h - which is stereo-configuration biased - decision 
has been made to relocate control creation to component's .probe().

In regard to PCM operations alone, some invisible to userspace stuff has 
been re-used from /haswell/ e.g.: volume_map and page_table arranging. 
As internal FW pipes are governed with state machine, changes have been 
made to ensure following in obeyed:
	ALLOC -> RESET -> PAUSE -> RESUME
	FREE  <- RESET <- PAUSE <- RESUME

On existing solution, RESET could have been bypassed and stream moved to 
PAUSE directly. In catpt, .trigger() and .prepare() functions do the 
majority of stream's preparation and state changing ensuring these are 
changed properly.

Another area of interest is substream's private data handling. This has 
been modified from static block: struct hsw_priv_data::pcm and struct 
hsw_priv_data::dmab to dynamic - on .startup() _dma_data is allocated 
and assigned to given DAI. In catpt, said private data is the chest of 
solution's PCM: struct catpt_stream_runtime. It stores current state, 
template used and memory allocated. As LPT/WPT DSP does not offer 
flexible topology, static one is applied. This is manifested via 
catpt_topology global which describes the shape of every stream. There 
are seven of them, 2 Bluetooth streams for SSP1 and 5 (system playback & 
capture, two offloads and loopback) for SSP0.

This data is essential during stream allocation in .hw_params().
On D0 exit SSP device configuration is lost, just like other FW context. 
SSP device formats are expected to be resent once FW resumes operations. 
Catpt removes the need for /soc/intel/boards to play with IPCs 
(sst_hsw_device_set_config) and assigns formats automatically on .pcm_new().

Heavy lifting has also been done for stream-position-update handled by 
catpt_stream_update_position and POSITION_CHANGED notification. This 
time, payload dumped by the later is always accounted for instead of 
being ignored and combined with SET_WRITE_POS ipc, allows for stream 
progression for OFFLOAD pins. On Dell XPS 13, all exposed DAIs apart 
from the system one were not working correctly. For offload, HOST owns 
write-pointer and is expected to send SET_WRITE_POS IPC periodically - 
that can be done twice prior to stream's start aka RESUME and from 
there, once on every POSITION_CHANGE notification. For loopback stream, 
DAPM routes were missing what too has been addressed to ensure stream is
functional.


Thanks for bearing with me. In case of any questions, send me an email.

Kind Regards,
Czarek
