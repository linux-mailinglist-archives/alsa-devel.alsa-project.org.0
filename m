Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A7984B0B8D
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Feb 2022 11:56:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9221517B2;
	Thu, 10 Feb 2022 11:55:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9221517B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644490605;
	bh=uRRbslkySxYHqPWjzBuWVAPZZpAh6rtYQZifothcSNc=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=AFFcAhb1GsIqvTHHTN05udEY26di4Ep9nipNSsUbodKntGE4c3h5ZoIBUgsR8e2J7
	 D81BooAvW11Ynjd0LCQAaP+kmQBwcX0Xe64nqvdm26OOHNJW6wXkOTIK6ILObJIvTA
	 fEzKIYZUhD6NDtFi242hK+obX/AeFTN7CyBd1hmI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B4210F804AC;
	Thu, 10 Feb 2022 11:55:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AAC90F80423; Thu, 10 Feb 2022 11:55:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5B744F800A7
 for <alsa-devel@alsa-project.org>; Thu, 10 Feb 2022 11:55:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5B744F800A7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="RKROqfuC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644490530; x=1676026530;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=uRRbslkySxYHqPWjzBuWVAPZZpAh6rtYQZifothcSNc=;
 b=RKROqfuCUlHAYExo48aLjk3C6jAZkQXr7gxb1SqPxbLAsTlgvLl/lMGf
 TcZSl6ytJoQ4SZMu99Zf28YV/3tD3NcAb/raosQSM+f0LhNK4emdi3CZu
 nVC2f1SMo22ie08ImDlnpWiom347I+N37VstDSs+gryU+p/hvbZCX4KzW
 Wagp+x40DSosfffvqVRk071cHLpDik0qi5Q03/7LOFL30Cky/NDRySp1T
 hGWKtlJ+cA4Z5eoCmGP0uiF8iYDG3qp+AL3ACIH50/b6dPV2LdZVRdgb1
 TPaAwNfnEWGpnvr+Yoxvhab8y7wU/Ar/+FB4cOTWmeX9JUGa7riDrTSpj w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10253"; a="310202818"
X-IronPort-AV: E=Sophos;i="5.88,358,1635231600"; d="scan'208";a="310202818"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2022 02:55:23 -0800
X-IronPort-AV: E=Sophos;i="5.88,358,1635231600"; d="scan'208";a="679106832"
Received: from barabano-mobl.ccr.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.41.18])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2022 02:55:20 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com, ranjani.sridharan@linux.intel.com
Subject: [PATCH 0/9] ASoC: SOF: IPC client infrastructure
Date: Thu, 10 Feb 2022 12:55:10 +0200
Message-Id: <20220210105519.19795-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, kai.vehmanen@linux.intel.com, tiwai@suse.com,
 linux-kernel@vger.kernel.org, fred.oh@linux.intel.com, daniel.baluta@nxp.com
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

Hi,

The Linux SOF implementation is historically monolithic in a sense that all
features accessible in the firmware can be used via the snd_sof_dev struct in
one way or another.

Support for features can not be added or removed runtime and with the current
way of things it is hard if not impossible to implement support for dynamic
feature support when based on the firmware manifest we can easily enable/access
independent modules with the SOF.

In order to be able to support such modularity this series introduces a small
framework within SOF for client support using the Auxiliary bus.

Client drivers can be removed runtime and later re-loaded if needed without
affecting the core's behaviour, but it is the core's and the platform's duty
to create the Auxiliary devices usable in the platform and via the firmware.

There is still a need for SOF manifest update to convey information about
features to really make the full dynamic client device creation.

The series will introduce the core SOF client support and converts the generic
ipc flood test, ipc message injector and the probes (Intel HDA only) to a client
driver.

Regards,
Peter
---
Peter Ujfalusi (8):
  ASoC: SOF: Drop unused DSP power states: D3_HOT and D3_COLD
  ASoC: SOF: Move the definition of enum sof_dsp_power_states to global
    header
  ASoC: SOF: ipc: Read and pass the whole message to handlers for IPC
    events
  ASoC: SOF: Split up utils.c into sof-utils and iomem-utils
  ASoC: SOF: Introduce IPC SOF client support
  ASoC: SOF: sof-client: Add support for clients not managed by pm
    framework
  ASoC: SOF: Convert the generic IPC message injector into SOF client
  ASoC: SOF: Convert the generic probe support to SOF client

Ranjani Sridharan (1):
  ASoC: SOF: Convert the generic IPC flood test into SOF client

 include/sound/sof.h                         |   8 +
 sound/soc/sof/Kconfig                       |  33 +-
 sound/soc/sof/Makefile                      |  15 +-
 sound/soc/sof/core.c                        |  50 +-
 sound/soc/sof/debug.c                       | 565 --------------
 sound/soc/sof/intel/Kconfig                 |  19 +-
 sound/soc/sof/intel/apl.c                   |  13 +-
 sound/soc/sof/intel/cnl.c                   |  13 +-
 sound/soc/sof/intel/hda-dai.c               |  19 -
 sound/soc/sof/intel/hda-dsp.c               |   6 -
 sound/soc/sof/intel/hda-probes.c            |  72 +-
 sound/soc/sof/intel/hda.c                   |  10 +
 sound/soc/sof/intel/hda.h                   |  49 +-
 sound/soc/sof/intel/icl.c                   |  13 +-
 sound/soc/sof/intel/tgl.c                   |  13 +-
 sound/soc/sof/{utils.c => iomem-utils.c}    |  61 +-
 sound/soc/sof/ipc.c                         |  88 ++-
 sound/soc/sof/ops.h                         |  43 -
 sound/soc/sof/pcm.c                         |   7 +-
 sound/soc/sof/pm.c                          |  13 +-
 sound/soc/sof/sof-client-ipc-flood-test.c   | 396 ++++++++++
 sound/soc/sof/sof-client-ipc-msg-injector.c | 192 +++++
 sound/soc/sof/sof-client-probes.c           | 821 ++++++++++++++++++++
 sound/soc/sof/sof-client-probes.h           |  31 +
 sound/soc/sof/sof-client.c                  | 469 +++++++++++
 sound/soc/sof/sof-client.h                  |  67 ++
 sound/soc/sof/sof-priv.h                    | 139 ++--
 sound/soc/sof/sof-probes.c                  | 364 ---------
 sound/soc/sof/sof-probes.h                  |  38 -
 sound/soc/sof/sof-utils.c                   |  77 ++
 sound/soc/sof/sof-utils.h                   |  19 +
 sound/soc/sof/trace.c                       |   1 +
 32 files changed, 2415 insertions(+), 1309 deletions(-)
 rename sound/soc/sof/{utils.c => iomem-utils.c} (59%)
 create mode 100644 sound/soc/sof/sof-client-ipc-flood-test.c
 create mode 100644 sound/soc/sof/sof-client-ipc-msg-injector.c
 create mode 100644 sound/soc/sof/sof-client-probes.c
 create mode 100644 sound/soc/sof/sof-client-probes.h
 create mode 100644 sound/soc/sof/sof-client.c
 create mode 100644 sound/soc/sof/sof-client.h
 delete mode 100644 sound/soc/sof/sof-probes.c
 delete mode 100644 sound/soc/sof/sof-probes.h
 create mode 100644 sound/soc/sof/sof-utils.c
 create mode 100644 sound/soc/sof/sof-utils.h

-- 
2.35.1

