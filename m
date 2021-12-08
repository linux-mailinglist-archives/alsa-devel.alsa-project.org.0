Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CBA8946D1BA
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Dec 2021 12:12:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 33B7E21C9;
	Wed,  8 Dec 2021 12:11:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 33B7E21C9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638961936;
	bh=Tl8j4qJfWISN4++YxPq8TpHncXGPjDHXNvjBcL7YX2s=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=M2PKxKHm/okjwvmCA0FmoTAG+/cxQfegubXYFu7RPYL1Z0wSoL6Bh+XkW2RinJOLF
	 CRVWL04Vn952aNjAvq+XOtepdXuFTq7H6pnVTOhmEzbFQ60znP/B8nqUwsqe46mHx2
	 Wxz0zs0J+5qxcTASxZTHxA9FvRAzM4rdCKj50tAY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6765CF804CC;
	Wed,  8 Dec 2021 12:11:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3F9D4F804ED; Wed,  8 Dec 2021 12:11:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=PRX_BODY_30,PRX_BODY_72,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0B63CF800AB
 for <alsa-devel@alsa-project.org>; Wed,  8 Dec 2021 12:10:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0B63CF800AB
X-IronPort-AV: E=McAfee;i="6200,9189,10191"; a="301192791"
X-IronPort-AV: E=Sophos;i="5.87,297,1631602800"; d="scan'208";a="301192791"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2021 03:10:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,297,1631602800"; d="scan'208";a="600600046"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by FMSMGA003.fm.intel.com with ESMTP; 08 Dec 2021 03:10:45 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Subject: [RFC 00/37] ASoC: Intel: AVS - Audio DSP for cAVS
Date: Wed,  8 Dec 2021 12:12:24 +0100
Message-Id: <20211208111301.1817725-1-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, upstream@semihalf.com,
 harshapriya.n@intel.com, yung-chuan.liao@linux.intel.com, rad@semihalf.com,
 pierre-louis.bossart@linux.intel.com, tiwai@suse.com, hdegoede@redhat.com,
 broonie@kernel.org, ranjani.sridharan@linux.intel.com,
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

A continuation of cleanup work of Intel SST solutions found in
sound/soc/intel/. With two major chapters released last year catpt [1]
and removal of haswell solution [2], time has come for Skylake-driver.

Througout 2019, 2020 and 2021 Skylake-driver has had many fixes applied
and even attempts of refactors as seen in fundamental overhaul [3], IPC
flow adjustments [4] and LARGE_CONFIG overhaul [5] series.
Unfortunately, story repeats itself - problems are found within the core
of a driver. Painting it with different colors does not change the fact
that is it still a house of cards. As changes needed to address those
issues would make Skylake solution incompatible with its previous
revisions, a decision has been made to provide a new solution instead.
In time it would deprecate and replace Skylake-driver.

That solution has been called AVS - from AudioDSP architecture name:
Audio-Voice-Speech. It is meant to provide support for the exact same
range of platforms as its predecessor: SKL, KBL, AML and APL.

Several functions found within HDAudio and ASoC framework have been
exported and are re-used later by the avs-driver to prevent code being
duplicated in this solution. All of these act as driver dependencies and
are found at the beginning of the series to make it clear what's needed
for avs-driver to compile.

Note: this series is dependent upon NHLT-series [6] which was recently
merged by Takashi to his for-next branch yet is unavailable on current
broonie/for-next.

Note: this series does not add fully functional driver as its size would
get out of control. Focus is put on adding new code. A
SND_SOC_INTEL_SKYLAKE_FAMILY=n dependency is added so no probing
attempts are performed. Until all patches are merged, Skylake-driver
remains the recommended option. Series which will later follow this one,
focus on filling all the remaining functionality gaps and provide
filesystems support. Also, a range of machine boards will be added to
match range of configurations supported by the avs-driver.
Once avs-driver and its collaterals are merged, skylake-driver
deprecation and removal process begins, along with all other components
that are connected to it e.g.: skylake-driver-only machine boards.

As AudioDSP firmware which avs-driver communicates with supports a wide
range of audio formats, module configurations and multi-pipeline
streams, couple of new concepts are introduce to enable all those
functionalities:

- Path template and path variants
- Runtime path
- Conditional path
- Granular sound cards (as opposed to 'super-cards')

These are later better explained by their respective patches:
'Topology parsing', 'Path management', 'Conditional-path support' and
'Machine board registration'.

A 'path' represents a DSP side of audio stream in runtime - is a logical
container for pipelines which are themselves composed of modules -
processing units. Due to high range of possible audio format
combinations, there can be more variants of given path (and thus, its
pipelines and modules) than total number of pipelines and module
instances which firmware supports concurrently, all the instance IDs are
allocated dynamically with help of IDA interface. 'Path templates' come
from topology file and describe a pattern which is later used to
actually create runtime 'path'.

To support modern audio usecases such as WaveOnVoice and EchoReference,
conditional paths concept came into existence. These work similarly to
standard paths except are a consequence of other paths being created or
deleted, rather then being created when userspace app opens specific FE
for streaming. Their state machine is controlled by source and sink
paths which created them in the first place.

Granular machine boards is a contrast to 'super-card' idea which is
currently widely used throughout Intel ASoC drivers. Major reasons are:
complexity reduction (each board now focuses on a single, concrete
device) and overall reduction of topology file size when entire
configuration is taken into account. This has functional benefits too:
one card failing won't prevent others from probing and being operative.


Changes [internal] RFC v2 -> [public] RFC v1:
- dropped any sysfs related changes from this series, moved to follow up
  one
- dropped entire subscription-mechanism found in ipc.c. Handlers that
  are delegated to service certain firmware notifications are now called
  directly
- fixed kernel doc for snd_soc_dapm_new_dai_widgets() as reported by ikp
- prefixed snd_hda_codec_device_init() as suggested by Amadeo
- improved comments for d0ix transitions for APL-based platforms as
  suggested by Pierre
- a ton of spelling related fixes in most of the commit messages
- fixed remaining warnings pointed by scan-build (variable assigned but
  not used)
- replaced most of 'cAVS X.Y' expression usages with 'platform-based'
  equivalents as suggested by Pierre e.g.: cAVS 1.5 -> SKL-based

Changes [internal] RFC v1 -> [internal] RFC v2:

- fixed memleak caused by lack of kfree(vols) if memory allocation fails
  in avs_peakvol_create() as reported by Curtis
- fixed missing 'i' iterator incrementation in avs_widget_ready()
  causing reference loss as reported by Curtis
- replace hardcode: 0x40 usage with snd_hdac_calc_stream_format as
  suggested by Curtis.
  In consequence, readability for all code loading (CL) procedues has
  increased and such approach auto-documents the CL stream preparation

- updated behavior of all index-fetching functions found in utils.c:
  avs_module_entry_index(), avs_module_id_entry_index() and follow ups:
  avs_get_module_entry(), avs_get_module_id_entry() to better conform to
  linux-kernel standard when no entry is found (return -ENOENT) rather
  than C++ standard (return -1, what in kernel case translated to -EPERM)
  as suggested by Curtis and Peter
- several suggestions have been made regarding spacing, and so far, I've
  agreed and applied with all of them. None proposed seemed out of place
  or redundant

- avs_path_stop() renamed to avs_path_pause() pipeline states are
  represented by RESET/PAUSED/RUNNING. avs_path_reset() and
  avs_path_run() were already there and avs_path_stop() just didn't look
  cohesive
- added missing parsers for num_output_pin and num_input_pin which are
  required for custom modules such as WAVES or DSM
- dropped 'priv_param_length' from custom module descriptor as this
  field is obsolete in firmware

- parse_dictionary() has been split into parse_dictionary_header() and
  parse_dictionary_entries() to drop code duplication present in several
  parsing function which could not re-use entire parse_dictionary()
- added avs_tplg_vendor_array_lookup_next() and
  avs_tplg_vendor_entry_next() to drop code duplicated present in several
  parsing functions. This change greatly impacted readability of all
  parsers
- parsing helpers such avs_tplg_vendor_array_lookup() now return offset
  by updating specified in function argument list u32 *offset variable.
  This is to address problem when u32 offset would be greater than max
  int, which is the return type for these functions
- AVS_DEFINE_PTR_PARSER() macro has been introduced to drop code
  duplication for all ptr-parsing users

- all struct avs_path_module creators have had their declaration
  updated: function argument *owner ceased to exist as it could already
  be accessed by mod->owner

- fixed the order of operation for conditional paths (e.g.: echo
  reference) so these are no longer controlled by "source" path and
  instead are impacted by state changes of source and sink paths both.
  Previously only source path e.g. playback sourcing echo reference
  would trigger RUNNING status for conditional path. Equivalent RUNNING
  on WoV path which is in this case sink path, would not do so, leading
  to order-of-operation problems. Behavior has been changed to: both
  source and sink need to be RUNNING for conditional path to be set to
  RUNNING too. PAUSED for either source or sink will cause PAUSED
  transition for conditional path.
- to achieve the above, path states are now saved in 'state' i.e. new
  u32 field for struct avs_path

- resigned from fw_filename field usage in favour of newly added
  tplg_filename for machine board descriptors as suggested by Pierre
- platform descriptor fields have had their names update better reflect
  their purpose as suggested by Pierre
- fixed comp_list missing locking when manipulated
- all message senders now accept request as pointer as suggeseted by
  Peter
- resigned of AZX_ usage for all ADSP-related registers, leaving them
  only for HOST memory space related operations
- fixed disable path for core DSP operations: power/reset/stall as
  reported by Peter

- safety when locking between received responses (reply vs notification)
  has been lowered as suggested by Pierre. Most usages are not performed
  in IRQ context and none is done in hard-IRQ one
- s/master/main/ plus AVS_MAIN_CORE_MASK has replaced ->master_mask
- several functions have had their logging updated - logs have been
  moved to lower level functions as suggested by Pierre
- hdac_ext_stream usage has been streamlined to estream, hdac_streams
  are represented by hstream instead
- hw_params() are resilient to scenarios when they are called mutliple
  times as reported by Pierre
- avs_dsp_enable() now collapses if any of its steps fails as reported
  by Pierre and Peter
- avs_module_ida_empty() now returns value of type bool as suggested by
  Bard

[1]: https://www.spinics.net/lists/alsa-devel/msg116440.html
[2]: https://www.spinics.net/lists/alsa-devel/msg116901.html
[3]: https://www.spinics.net/lists/alsa-devel/msg94199.html
[4]: https://www.spinics.net/lists/alsa-devel/msg92588.html
[5]: https://lore.kernel.org/all/20190808181549.12521-1-cezary.rojewski@intel.com/
[6]: https://lore.kernel.org/all/YaDq7L1Mu++3UBL7@sirena.org.uk/T/


Cezary Rojewski (37):
  ALSA: hda: Add snd_hdac_ext_bus_link_at() helper
  ALSA: hda: Update and expose snd_hda_codec_device_init()
  ALSA: hda: Update and expose codec register procedures
  ALSA: hda: Expose codec cleanup and power-save functions
  ALSA: hda: Add helper macros for DSP capable devices
  ASoC: Export DAI register and widget ctor and dctor functions
  ASoC: Intel: Introduce AVS driver
  ASoC: Intel: avs: Inter process communication
  ASoC: Intel: avs: Add code loading requests
  ASoC: Intel: avs: Add pipeline management requests
  ASoC: Intel: avs: Add module management requests
  ASoC: Intel: avs: Add power management requests
  ASoC: Intel: avs: Add ROM requests
  ASoC: Intel: avs: Add basefw runtime-parameter requests
  ASoC: Intel: avs: Firmware resources management utilities
  ASoC: Intel: avs: Declare module configuration types
  ASoC: Intel: avs: Dynamic firmware resources management
  ASoC: Intel: avs: Topology parsing
  ASoC: Intel: avs: Path management
  ASoC: Intel: avs: Conditional-path support
  ASoC: Intel: avs: General code loading flow
  ASoC: Intel: avs: Implement CLDMA transfer
  ASoC: Intel: avs: Code loading over CLDMA
  ASoC: Intel: avs: Code loading over HDA
  ASoC: Intel: avs: Generic soc component driver
  ASoC: Intel: avs: Generic PCM FE operations
  ASoC: Intel: avs: non-HDA PCM BE operations
  ASoC: Intel: avs: HDA PCM BE operations
  ASoC: Intel: avs: Coredump and recovery flow
  ASoC: Intel: avs: Prepare for firmware tracing
  ASoC: Intel: avs: D0ix power state support
  ASoC: Intel: avs: Event tracing
  ASoC: Intel: avs: Machine board registration
  ASoC: Intel: avs: PCI driver implementation
  ASoC: Intel: avs: Power management
  ASoC: Intel: avs: SKL-based platforms support
  ASoC: Intel: avs: APL-based platforms support

 .../ABI/testing/sysfs-bus-pci-devices-avs     |   24 +
 include/sound/hda_codec.h                     |   11 +-
 include/sound/hdaudio.h                       |    2 +
 include/sound/hdaudio_ext.h                   |   50 +
 include/sound/soc-acpi.h                      |    2 +
 include/sound/soc-dapm.h                      |    1 +
 include/uapi/sound/intel/avs/tokens.h         |  147 ++
 sound/hda/ext/hdac_ext_controller.c           |   31 +-
 sound/pci/hda/hda_codec.c                     |   93 +-
 sound/pci/hda/hda_local.h                     |    2 -
 sound/soc/codecs/hdac_hda.c                   |    2 +-
 sound/soc/intel/Kconfig                       |   19 +
 sound/soc/intel/Makefile                      |    1 +
 sound/soc/intel/avs/Makefile                  |   12 +
 sound/soc/intel/avs/apl.c                     |  244 +++
 sound/soc/intel/avs/avs.h                     |  331 ++++
 sound/soc/intel/avs/board_selection.c         |  459 +++++
 sound/soc/intel/avs/cldma.c                   |  328 ++++
 sound/soc/intel/avs/cldma.h                   |   29 +
 sound/soc/intel/avs/core.c                    |  737 +++++++
 sound/soc/intel/avs/dsp.c                     |  326 ++++
 sound/soc/intel/avs/ipc.c                     |  612 ++++++
 sound/soc/intel/avs/loader.c                  |  672 +++++++
 sound/soc/intel/avs/messages.c                |  674 +++++++
 sound/soc/intel/avs/messages.h                |  813 ++++++++
 sound/soc/intel/avs/path.c                    | 1287 +++++++++++++
 sound/soc/intel/avs/path.h                    |   85 +
 sound/soc/intel/avs/pcm.c                     | 1240 ++++++++++++
 sound/soc/intel/avs/registers.h               |   83 +
 sound/soc/intel/avs/skl.c                     |  127 ++
 sound/soc/intel/avs/topology.c                | 1700 +++++++++++++++++
 sound/soc/intel/avs/topology.h                |  207 ++
 sound/soc/intel/avs/trace.c                   |   34 +
 sound/soc/intel/avs/trace.h                   |  158 ++
 sound/soc/intel/avs/utils.c                   |  305 +++
 sound/soc/soc-core.c                          |    1 +
 sound/soc/soc-dapm.c                          |   15 +
 37 files changed, 10824 insertions(+), 40 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-pci-devices-avs
 create mode 100644 include/uapi/sound/intel/avs/tokens.h
 create mode 100644 sound/soc/intel/avs/Makefile
 create mode 100644 sound/soc/intel/avs/apl.c
 create mode 100644 sound/soc/intel/avs/avs.h
 create mode 100644 sound/soc/intel/avs/board_selection.c
 create mode 100644 sound/soc/intel/avs/cldma.c
 create mode 100644 sound/soc/intel/avs/cldma.h
 create mode 100644 sound/soc/intel/avs/core.c
 create mode 100644 sound/soc/intel/avs/dsp.c
 create mode 100644 sound/soc/intel/avs/ipc.c
 create mode 100644 sound/soc/intel/avs/loader.c
 create mode 100644 sound/soc/intel/avs/messages.c
 create mode 100644 sound/soc/intel/avs/messages.h
 create mode 100644 sound/soc/intel/avs/path.c
 create mode 100644 sound/soc/intel/avs/path.h
 create mode 100644 sound/soc/intel/avs/pcm.c
 create mode 100644 sound/soc/intel/avs/registers.h
 create mode 100644 sound/soc/intel/avs/skl.c
 create mode 100644 sound/soc/intel/avs/topology.c
 create mode 100644 sound/soc/intel/avs/topology.h
 create mode 100644 sound/soc/intel/avs/trace.c
 create mode 100644 sound/soc/intel/avs/trace.h
 create mode 100644 sound/soc/intel/avs/utils.c

-- 
2.25.1

