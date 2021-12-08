Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ABCCE46D825
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Dec 2021 17:29:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 356CD17C6;
	Wed,  8 Dec 2021 17:28:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 356CD17C6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638980968;
	bh=rmHkHiEApfku1k5XtMvHNCxEk9El+CTqolEUVvSQJ1E=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eAxvoFcDxFdeBFzhVWKl8m/GmR+jlB3X26GrWLRLE+X0stXSjuCE8mGKKx8rVUgzm
	 pcbOkne7auXh7yGDprDZ//HfIpFKgVVAkcvnUiRIiQ1LHZ97ueyDzE+lAj1Rxwj6H9
	 37oHO8USh+lnWHtmRTap++o4X+UfVnp+z9ZdrPPo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8731FF804EC;
	Wed,  8 Dec 2021 17:28:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9FB3AF804E5; Wed,  8 Dec 2021 17:28:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.6 required=5.0 tests=NICE_REPLY_A,PRX_BODY_14,
 PRX_BODY_30,PRX_BODY_72,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C84FEF80217
 for <alsa-devel@alsa-project.org>; Wed,  8 Dec 2021 17:27:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C84FEF80217
X-IronPort-AV: E=McAfee;i="6200,9189,10192"; a="261949134"
X-IronPort-AV: E=Sophos;i="5.88,190,1635231600"; d="scan'208";a="261949134"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2021 08:27:49 -0800
X-IronPort-AV: E=Sophos;i="5.88,190,1635231600"; d="scan'208";a="564147792"
Received: from ssubbar1-mobl.amr.corp.intel.com (HELO [10.212.114.30])
 ([10.212.114.30])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2021 08:27:46 -0800
Subject: Re: [RFC 00/37] ASoC: Intel: AVS - Audio DSP for cAVS
To: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org
References: <20211208111301.1817725-1-cezary.rojewski@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <59681534-aeee-003b-0fea-af17503bb813@linux.intel.com>
Date: Wed, 8 Dec 2021 10:27:43 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211208111301.1817725-1-cezary.rojewski@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: upstream@semihalf.com, harshapriya.n@intel.com,
 yung-chuan.liao@linux.intel.com, rad@semihalf.com, tiwai@suse.com,
 hdegoede@redhat.com, broonie@kernel.org, ranjani.sridharan@linux.intel.com,
 amadeuszx.slawinski@linux.intel.com, cujomalainey@chromium.org,
 peter.ujfalusi@linux.intel.com, lma@semihalf.com
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


> As AudioDSP firmware which avs-driver communicates with supports a wide
> range of audio formats, module configurations and multi-pipeline
> streams, couple of new concepts are introduce to enable all those
> functionalities:
> 
> - Path template and path variants
> - Runtime path
> - Conditional path
> - Granular sound cards (as opposed to 'super-cards')
> 
> These are later better explained by their respective patches:
> 'Topology parsing', 'Path management', 'Conditional-path support' and
> 'Machine board registration'.
> 
> A 'path' represents a DSP side of audio stream in runtime - is a logical
> container for pipelines which are themselves composed of modules -
> processing units. Due to high range of possible audio format
> combinations, there can be more variants of given path (and thus, its
> pipelines and modules) than total number of pipelines and module
> instances which firmware supports concurrently, all the instance IDs are
> allocated dynamically with help of IDA interface. 'Path templates' come
> from topology file and describe a pattern which is later used to
> actually create runtime 'path'.
> 
> To support modern audio usecases such as WaveOnVoice and EchoReference,
> conditional paths concept came into existence. These work similarly to
> standard paths except are a consequence of other paths being created or
> deleted, rather then being created when userspace app opens specific FE
> for streaming. Their state machine is controlled by source and sink
> paths which created them in the first place.
> 
> Granular machine boards is a contrast to 'super-card' idea which is
> currently widely used throughout Intel ASoC drivers. Major reasons are:
> complexity reduction (each board now focuses on a single, concrete
> device) and overall reduction of topology file size when entire
> configuration is taken into account. This has functional benefits too:
> one card failing won't prevent others from probing and being operative.

Just to be clear, my name being listed in the Intel internal reviewers
shall not be construed as an endorsement of this patch set. Parts of my
feedback was taken into account, but I still have quite a bit of
heartburn with 4 high-level design topics:

a) The change list mentions sysfs being dropped, Patch 19/37 says otherwise.

+++ b/Documentation/ABI/testing/sysfs-bus-pci-devices-avs
@@ -0,0 +1,24 @@
+What:	
/sys/devices/pci0000:00/<dev>/<tplg_name>/<path_template>:<path>/<pipeline>/state
+Date:		December 2021
+Contact:	Cezary Rojewski <cezary.rojewski@intel.com>
+Description:
+		File is only present when specific pipeline is instantiated in
+		driver. It is used to check or change pipeline state. Possible
+		read values: invalid, uninitialized, reset, paused, running,
+		eos, error_stop, saved, restored.
+		Allows only to set state to: reset, paused, running.

That was my biggest worry in internal reviews, I do not see any
rationale for exposing an interface to userspace to modify pipeline
states. I believe the intent is to have a follow-up series on this
topic, but it's not clear what problem this is trying to solve. There's
a fundamental disconnect here as to why the kernel driver could not
control states on its own, and it begs the question if the 37 patches
actually work without this odd userspace interface.

b) the concept of 'path' is totally specific to this driver and will not
be used by any other Intel solution. The notion of having more
flexibility in dynamic reconfiguration of a pipeline, e.g. to avoid
instantiating an unnecessary sample-rate conversion, is on paper a good
one and is used in Windows solutions, but in practice all the existing
end-to-end integrations in Linux/Chrome do require fairly static
configurations with fixed sample rates. In other words, it's debatable
whether any end-user will see any benefits in terms of
experience/power/performance, and the added complexity is handled with a
custom solution instead of improvements to DAPM/DPCM - which as we found
out does need significant love to support multiple streams being
mixed/demuxed. At the ALSA/ASoC level, I believe we have more important
priorities such as the notion of 'DAPM domain', constraint propagation
and hardening for complex use-cases, and improvements to the pipeline
handling shall be done at the framework level, not the platform-specific
driver level.

c) I do not get how interfaces can be split to define different cards,
specifically in use cases where different types of interfaces are used
concurrently - think echo cancellation with the reference coming from a
I2S link and microphone data from a PDM link. This would result in
independent cards being joined at the hip, with no ability to propagate
DAPM events. Cezary assures me this was tested but I still don't get how
this might work. For the SOF work, we did plan to spin-off HDMI to a
different card with the 'SOF client', but stopped short of an
interface-based split.

c1) I don't really buy the notion of trying to keep going if one card
fails to probe. "Fail big and fail early" is much easier to support, and
in the case of interactions between interfaces you do need all cards to
be functional anyways.

c2) What this split also requires is the addition of ~13 odd new machine
drivers, along with new topologies and new UCM files. This seems like a
bridge too far to me, I don't see how end-users might transition to this
new driver before the end of the support period where the community
typically takes over legacy devices. In the mean time, the Skylake
driver support will be required (5.15 is broken btw).

d) Ranjani, Peter, Bard, Rander and I are progressing to provide support
for the 'cAVS' IPC, aka IPC v4 in the SOF driver, with a repartitioning
to support multiple IPCs, and already have working prototypes with basic
functionality from Skylake, KabyLake, ApolloLake to newer platforms. The
patches will be submitted for the next kernel cycle after the Winter
break, and clearly with this patchset there is no plan for any reuse.

I've personally spent two weeks of my life reviewing this code, shared
internally only on October 28, and trying to align. Obviously I wasn't
successful and probably wasted my time...

I completely disagree with Cezary and his management's decision to float
37 patches upstream as RFC, with more coming. This goes against
everything we've tried to do in the last 3 years to improve Intel's
standing. I don't think it's right to ask for feedback from the
maintainers and community when internally we were unable to make
progress. What can I say other than 'this is really sad'.

The work in the SOF driver will continue regardless of what happens with
this patchset, which I am not going to comment further on.

Cezary, I tried to help, didn't work, you're on your own now.

Best of luck.

> Changes [internal] RFC v2 -> [public] RFC v1:
> - dropped any sysfs related changes from this series, moved to follow up
>   one
> - dropped entire subscription-mechanism found in ipc.c. Handlers that
>   are delegated to service certain firmware notifications are now called
>   directly
> - fixed kernel doc for snd_soc_dapm_new_dai_widgets() as reported by ikp
> - prefixed snd_hda_codec_device_init() as suggested by Amadeo
> - improved comments for d0ix transitions for APL-based platforms as
>   suggested by Pierre
> - a ton of spelling related fixes in most of the commit messages
> - fixed remaining warnings pointed by scan-build (variable assigned but
>   not used)
> - replaced most of 'cAVS X.Y' expression usages with 'platform-based'
>   equivalents as suggested by Pierre e.g.: cAVS 1.5 -> SKL-based
> 
> Changes [internal] RFC v1 -> [internal] RFC v2:
> 
> - fixed memleak caused by lack of kfree(vols) if memory allocation fails
>   in avs_peakvol_create() as reported by Curtis
> - fixed missing 'i' iterator incrementation in avs_widget_ready()
>   causing reference loss as reported by Curtis
> - replace hardcode: 0x40 usage with snd_hdac_calc_stream_format as
>   suggested by Curtis.
>   In consequence, readability for all code loading (CL) procedues has
>   increased and such approach auto-documents the CL stream preparation
> 
> - updated behavior of all index-fetching functions found in utils.c:
>   avs_module_entry_index(), avs_module_id_entry_index() and follow ups:
>   avs_get_module_entry(), avs_get_module_id_entry() to better conform to
>   linux-kernel standard when no entry is found (return -ENOENT) rather
>   than C++ standard (return -1, what in kernel case translated to -EPERM)
>   as suggested by Curtis and Peter
> - several suggestions have been made regarding spacing, and so far, I've
>   agreed and applied with all of them. None proposed seemed out of place
>   or redundant
> 
> - avs_path_stop() renamed to avs_path_pause() pipeline states are
>   represented by RESET/PAUSED/RUNNING. avs_path_reset() and
>   avs_path_run() were already there and avs_path_stop() just didn't look
>   cohesive
> - added missing parsers for num_output_pin and num_input_pin which are
>   required for custom modules such as WAVES or DSM
> - dropped 'priv_param_length' from custom module descriptor as this
>   field is obsolete in firmware
> 
> - parse_dictionary() has been split into parse_dictionary_header() and
>   parse_dictionary_entries() to drop code duplication present in several
>   parsing function which could not re-use entire parse_dictionary()
> - added avs_tplg_vendor_array_lookup_next() and
>   avs_tplg_vendor_entry_next() to drop code duplicated present in several
>   parsing functions. This change greatly impacted readability of all
>   parsers
> - parsing helpers such avs_tplg_vendor_array_lookup() now return offset
>   by updating specified in function argument list u32 *offset variable.
>   This is to address problem when u32 offset would be greater than max
>   int, which is the return type for these functions
> - AVS_DEFINE_PTR_PARSER() macro has been introduced to drop code
>   duplication for all ptr-parsing users
> 
> - all struct avs_path_module creators have had their declaration
>   updated: function argument *owner ceased to exist as it could already
>   be accessed by mod->owner
> 
> - fixed the order of operation for conditional paths (e.g.: echo
>   reference) so these are no longer controlled by "source" path and
>   instead are impacted by state changes of source and sink paths both.
>   Previously only source path e.g. playback sourcing echo reference
>   would trigger RUNNING status for conditional path. Equivalent RUNNING
>   on WoV path which is in this case sink path, would not do so, leading
>   to order-of-operation problems. Behavior has been changed to: both
>   source and sink need to be RUNNING for conditional path to be set to
>   RUNNING too. PAUSED for either source or sink will cause PAUSED
>   transition for conditional path.
> - to achieve the above, path states are now saved in 'state' i.e. new
>   u32 field for struct avs_path
> 
> - resigned from fw_filename field usage in favour of newly added
>   tplg_filename for machine board descriptors as suggested by Pierre
> - platform descriptor fields have had their names update better reflect
>   their purpose as suggested by Pierre
> - fixed comp_list missing locking when manipulated
> - all message senders now accept request as pointer as suggeseted by
>   Peter
> - resigned of AZX_ usage for all ADSP-related registers, leaving them
>   only for HOST memory space related operations
> - fixed disable path for core DSP operations: power/reset/stall as
>   reported by Peter
> 
> - safety when locking between received responses (reply vs notification)
>   has been lowered as suggested by Pierre. Most usages are not performed
>   in IRQ context and none is done in hard-IRQ one
> - s/master/main/ plus AVS_MAIN_CORE_MASK has replaced ->master_mask
> - several functions have had their logging updated - logs have been
>   moved to lower level functions as suggested by Pierre
> - hdac_ext_stream usage has been streamlined to estream, hdac_streams
>   are represented by hstream instead
> - hw_params() are resilient to scenarios when they are called mutliple
>   times as reported by Pierre
> - avs_dsp_enable() now collapses if any of its steps fails as reported
>   by Pierre and Peter
> - avs_module_ida_empty() now returns value of type bool as suggested by
>   Bard
> 
> [1]: https://www.spinics.net/lists/alsa-devel/msg116440.html
> [2]: https://www.spinics.net/lists/alsa-devel/msg116901.html
> [3]: https://www.spinics.net/lists/alsa-devel/msg94199.html
> [4]: https://www.spinics.net/lists/alsa-devel/msg92588.html
> [5]: https://lore.kernel.org/all/20190808181549.12521-1-cezary.rojewski@intel.com/
> [6]: https://lore.kernel.org/all/YaDq7L1Mu++3UBL7@sirena.org.uk/T/
> 
> 
> Cezary Rojewski (37):
>   ALSA: hda: Add snd_hdac_ext_bus_link_at() helper
>   ALSA: hda: Update and expose snd_hda_codec_device_init()
>   ALSA: hda: Update and expose codec register procedures
>   ALSA: hda: Expose codec cleanup and power-save functions
>   ALSA: hda: Add helper macros for DSP capable devices
>   ASoC: Export DAI register and widget ctor and dctor functions
>   ASoC: Intel: Introduce AVS driver
>   ASoC: Intel: avs: Inter process communication
>   ASoC: Intel: avs: Add code loading requests
>   ASoC: Intel: avs: Add pipeline management requests
>   ASoC: Intel: avs: Add module management requests
>   ASoC: Intel: avs: Add power management requests
>   ASoC: Intel: avs: Add ROM requests
>   ASoC: Intel: avs: Add basefw runtime-parameter requests
>   ASoC: Intel: avs: Firmware resources management utilities
>   ASoC: Intel: avs: Declare module configuration types
>   ASoC: Intel: avs: Dynamic firmware resources management
>   ASoC: Intel: avs: Topology parsing
>   ASoC: Intel: avs: Path management
>   ASoC: Intel: avs: Conditional-path support
>   ASoC: Intel: avs: General code loading flow
>   ASoC: Intel: avs: Implement CLDMA transfer
>   ASoC: Intel: avs: Code loading over CLDMA
>   ASoC: Intel: avs: Code loading over HDA
>   ASoC: Intel: avs: Generic soc component driver
>   ASoC: Intel: avs: Generic PCM FE operations
>   ASoC: Intel: avs: non-HDA PCM BE operations
>   ASoC: Intel: avs: HDA PCM BE operations
>   ASoC: Intel: avs: Coredump and recovery flow
>   ASoC: Intel: avs: Prepare for firmware tracing
>   ASoC: Intel: avs: D0ix power state support
>   ASoC: Intel: avs: Event tracing
>   ASoC: Intel: avs: Machine board registration
>   ASoC: Intel: avs: PCI driver implementation
>   ASoC: Intel: avs: Power management
>   ASoC: Intel: avs: SKL-based platforms support
>   ASoC: Intel: avs: APL-based platforms support
> 
>  .../ABI/testing/sysfs-bus-pci-devices-avs     |   24 +
>  include/sound/hda_codec.h                     |   11 +-
>  include/sound/hdaudio.h                       |    2 +
>  include/sound/hdaudio_ext.h                   |   50 +
>  include/sound/soc-acpi.h                      |    2 +
>  include/sound/soc-dapm.h                      |    1 +
>  include/uapi/sound/intel/avs/tokens.h         |  147 ++
>  sound/hda/ext/hdac_ext_controller.c           |   31 +-
>  sound/pci/hda/hda_codec.c                     |   93 +-
>  sound/pci/hda/hda_local.h                     |    2 -
>  sound/soc/codecs/hdac_hda.c                   |    2 +-
>  sound/soc/intel/Kconfig                       |   19 +
>  sound/soc/intel/Makefile                      |    1 +
>  sound/soc/intel/avs/Makefile                  |   12 +
>  sound/soc/intel/avs/apl.c                     |  244 +++
>  sound/soc/intel/avs/avs.h                     |  331 ++++
>  sound/soc/intel/avs/board_selection.c         |  459 +++++
>  sound/soc/intel/avs/cldma.c                   |  328 ++++
>  sound/soc/intel/avs/cldma.h                   |   29 +
>  sound/soc/intel/avs/core.c                    |  737 +++++++
>  sound/soc/intel/avs/dsp.c                     |  326 ++++
>  sound/soc/intel/avs/ipc.c                     |  612 ++++++
>  sound/soc/intel/avs/loader.c                  |  672 +++++++
>  sound/soc/intel/avs/messages.c                |  674 +++++++
>  sound/soc/intel/avs/messages.h                |  813 ++++++++
>  sound/soc/intel/avs/path.c                    | 1287 +++++++++++++
>  sound/soc/intel/avs/path.h                    |   85 +
>  sound/soc/intel/avs/pcm.c                     | 1240 ++++++++++++
>  sound/soc/intel/avs/registers.h               |   83 +
>  sound/soc/intel/avs/skl.c                     |  127 ++
>  sound/soc/intel/avs/topology.c                | 1700 +++++++++++++++++
>  sound/soc/intel/avs/topology.h                |  207 ++
>  sound/soc/intel/avs/trace.c                   |   34 +
>  sound/soc/intel/avs/trace.h                   |  158 ++
>  sound/soc/intel/avs/utils.c                   |  305 +++
>  sound/soc/soc-core.c                          |    1 +
>  sound/soc/soc-dapm.c                          |   15 +
>  37 files changed, 10824 insertions(+), 40 deletions(-)
>  create mode 100644 Documentation/ABI/testing/sysfs-bus-pci-devices-avs
>  create mode 100644 include/uapi/sound/intel/avs/tokens.h
>  create mode 100644 sound/soc/intel/avs/Makefile
>  create mode 100644 sound/soc/intel/avs/apl.c
>  create mode 100644 sound/soc/intel/avs/avs.h
>  create mode 100644 sound/soc/intel/avs/board_selection.c
>  create mode 100644 sound/soc/intel/avs/cldma.c
>  create mode 100644 sound/soc/intel/avs/cldma.h
>  create mode 100644 sound/soc/intel/avs/core.c
>  create mode 100644 sound/soc/intel/avs/dsp.c
>  create mode 100644 sound/soc/intel/avs/ipc.c
>  create mode 100644 sound/soc/intel/avs/loader.c
>  create mode 100644 sound/soc/intel/avs/messages.c
>  create mode 100644 sound/soc/intel/avs/messages.h
>  create mode 100644 sound/soc/intel/avs/path.c
>  create mode 100644 sound/soc/intel/avs/path.h
>  create mode 100644 sound/soc/intel/avs/pcm.c
>  create mode 100644 sound/soc/intel/avs/registers.h
>  create mode 100644 sound/soc/intel/avs/skl.c
>  create mode 100644 sound/soc/intel/avs/topology.c
>  create mode 100644 sound/soc/intel/avs/topology.h
>  create mode 100644 sound/soc/intel/avs/trace.c
>  create mode 100644 sound/soc/intel/avs/trace.h
>  create mode 100644 sound/soc/intel/avs/utils.c
> 
