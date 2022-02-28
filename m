Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E6B624C70A7
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Feb 2022 16:32:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7B5B2173F;
	Mon, 28 Feb 2022 16:32:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7B5B2173F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646062376;
	bh=sPecdvZjRUa454XT9Yca6qacXE+Tzv3tUzmvonkxDiA=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=gOdb3JsJ6gSvVlCUiWWRLWXbdoEoQApI1IJ7ocKO+WrScmPolcNi6iZu5k5VnuUDp
	 ZaXjqvslTT0tt2Rzd5imkVJgqNtFXPnuUAsnJUIwMzmd3mQlYNrL7CAtPtgvup+U/W
	 sj7mcNojf0etxysslQZ6WFLrtuoZ0DritizqsDOs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 26FA8F8013C;
	Mon, 28 Feb 2022 16:31:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B69E7F8015B; Mon, 28 Feb 2022 16:31:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EFF17F800F8
 for <alsa-devel@alsa-project.org>; Mon, 28 Feb 2022 16:31:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EFF17F800F8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Jz2c6F0M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646062303; x=1677598303;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=sPecdvZjRUa454XT9Yca6qacXE+Tzv3tUzmvonkxDiA=;
 b=Jz2c6F0MbDIAu/lEZR6c9NeNhLovOm1BGsp02cIjihhKw5QuwFofRD+S
 u21cW4K4+a1EB9A3b7GZFu9aHk0XybObwzzH0zqKQB0LU7oX9Lr1oetiL
 3CI9kJGWfhqhNFHT0pe82HEsLIfVEaT9u33MHbwuh50h/ZogShny7myE0
 pJgFAgNBcvfvwGPuquTt6kB+s2uUPlU+xw3W2rZv4LqHCOVC2zChOxeo1
 RsMIrbnR7+sZx/EoBreiUZ0hSflahvciTIOu9xYZKM4ZAc3QaK35d58OK
 3tJaFqMp79NsPS5IhW9F4cWhGygwa+RSLIQUG1PronYWYpaRrhYGWdbbv A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10271"; a="339342314"
X-IronPort-AV: E=Sophos;i="5.90,142,1643702400"; d="scan'208";a="339342314"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2022 07:31:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,142,1643702400"; d="scan'208";a="629667094"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by FMSMGA003.fm.intel.com with ESMTP; 28 Feb 2022 07:31:31 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 00/17] ASoC: Intel: AVS - Audio DSP for cAVS
Date: Mon, 28 Feb 2022 16:33:26 +0100
Message-Id: <20220228153343.2263412-1-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, rad@semihalf.com,
 upstream@semihalf.com, harshapriya.n@intel.com, tiwai@suse.com,
 pierre-louis.bossart@linux.intel.com, hdegoede@redhat.com, broonie@kernel.org,
 amadeuszx.slawinski@linux.intel.com, cujomalainey@chromium.org,
 lma@semihalf.com
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

Note: this series is dependent upon HDA-series [6] which exposes several
codec-organization functions allowing for reduced code size on
avs-driver side.

Note: this series does not add fully functional driver as its size would
get out of control. Here, focus is put on adding IPC protocol and code
loading code.


Changes v2 -> v1:
Almost all updates here are thanks to feedback from Pierre.

- several comments and few kernel-docs have been added in areas which
  felt more or less unclear
- avs_ipc_wait_busy_completion() now spins up to 'repeats_left' number
  of times before giving up
- 'adsp_ba' field of struct avs_dev has been renamed to 'dsp_ba'
- 'dops' field of struct avs_spec has been renamed to 'dsp_ops'
- IPC abstraction has been simplified: SKL_ADSP_REG_HIP* regs are used
  directly
- fixed allnoconfig with AVS enabled compilation issues
- fixed code loading error paths: previously requested firmware is now
  released before function return to the caller
- code and function arguments tied to D0IX support have been removed
  from this patchset and will be part of followup series adding that
  feature instead
- enriched dev_err() messages in avs_dsp_get_core() and
  avs_dsp_put_core()
- numerous wording fixes used in power/reset/stall DSP operations

Changes RFC v1 [7]: -> v1:
- separated HDA codec-organization patches, path and topology handling,
  PCM and complementary features such as recovery from this series to
  ease the review process
- fixed EXPORT_SYMBOL_GPL for exported members of ASoC framework
- result of stall() is now checked when sending ROM message
- result of snd_hdac_ext_stream_set_spib() is now checked when loading
  basefw
- if basefw is not ready, notification processing is now skipped
- documented several topology parsing helpers


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
[6]: https://lore.kernel.org/alsa-devel/20220207114906.3759800-1-cezary.rojewski@intel.com/T/#t
[7]: https://lore.kernel.org/all/20211208111301.1817725-1-cezary.rojewski@intel.com/


Cezary Rojewski (17):
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
  ASoC: Intel: avs: General code loading flow
  ASoC: Intel: avs: Implement CLDMA transfer
  ASoC: Intel: avs: Code loading over CLDMA
  ASoC: Intel: avs: Code loading over HDA

 include/sound/hdaudio.h         |   2 +
 include/sound/hdaudio_ext.h     |  50 +++
 include/sound/soc-dapm.h        |   1 +
 sound/soc/intel/Kconfig         |  12 +
 sound/soc/intel/Makefile        |   1 +
 sound/soc/intel/avs/Makefile    |   6 +
 sound/soc/intel/avs/avs.h       | 248 +++++++++++
 sound/soc/intel/avs/cldma.c     | 317 ++++++++++++++
 sound/soc/intel/avs/cldma.h     |  29 ++
 sound/soc/intel/avs/core.c      |  62 +++
 sound/soc/intel/avs/dsp.c       | 303 +++++++++++++
 sound/soc/intel/avs/ipc.c       | 393 +++++++++++++++++
 sound/soc/intel/avs/loader.c    | 604 +++++++++++++++++++++++++
 sound/soc/intel/avs/messages.c  | 697 +++++++++++++++++++++++++++++
 sound/soc/intel/avs/messages.h  | 753 ++++++++++++++++++++++++++++++++
 sound/soc/intel/avs/registers.h |  75 ++++
 sound/soc/intel/avs/utils.c     | 301 +++++++++++++
 sound/soc/soc-core.c            |   1 +
 sound/soc/soc-dapm.c            |  15 +
 19 files changed, 3870 insertions(+)
 create mode 100644 sound/soc/intel/avs/Makefile
 create mode 100644 sound/soc/intel/avs/avs.h
 create mode 100644 sound/soc/intel/avs/cldma.c
 create mode 100644 sound/soc/intel/avs/cldma.h
 create mode 100644 sound/soc/intel/avs/core.c
 create mode 100644 sound/soc/intel/avs/dsp.c
 create mode 100644 sound/soc/intel/avs/ipc.c
 create mode 100644 sound/soc/intel/avs/loader.c
 create mode 100644 sound/soc/intel/avs/messages.c
 create mode 100644 sound/soc/intel/avs/messages.h
 create mode 100644 sound/soc/intel/avs/registers.h
 create mode 100644 sound/soc/intel/avs/utils.c

-- 
2.25.1

