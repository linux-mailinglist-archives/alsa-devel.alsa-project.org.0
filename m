Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D24B476042
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Dec 2021 19:09:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2C3041A6B;
	Wed, 15 Dec 2021 19:08:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2C3041A6B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639591746;
	bh=PfiEhUCIvbYuWf8+a4nP9ckDOMbofqkDlp1eI4obY0I=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Jts8ml7n4oCGaK3baX5o6DC7Farc0PL2M+23VYaO7ta/STrEM1zF9PB5WOFlMNjTV
	 Qfi3LxMRVSh1aopMVcauu/7mfMiK3Idqux5DhBy4BYn2PzkbyM17/kLAeJvWiV0Smq
	 z+uZoq4tXhTYKv6NyMRww8MTJI0k1LNxBYYJUHv0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B649AF8047B;
	Wed, 15 Dec 2021 19:07:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A13D8F80238; Wed, 15 Dec 2021 19:06:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D5BB6F80157
 for <alsa-devel@alsa-project.org>; Wed, 15 Dec 2021 19:06:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D5BB6F80157
X-IronPort-AV: E=McAfee;i="6200,9189,10199"; a="302670988"
X-IronPort-AV: E=Sophos;i="5.88,207,1635231600"; d="scan'208";a="302670988"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2021 10:04:10 -0800
X-IronPort-AV: E=Sophos;i="5.88,207,1635231600"; d="scan'208";a="662015010"
Received: from manamie-mobl.amr.corp.intel.com (HELO
 rsridh2-mobl1.localdomain) ([10.254.37.3])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2021 10:04:10 -0800
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 0/8] Changes to SOF kcontrol data set/get ops
Date: Wed, 15 Dec 2021 10:03:56 -0800
Message-Id: <20211215180404.53254-1-ranjani.sridharan@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
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

This set of patches deals with modifications to the signature of kcontrol
get/set data functions to make them more intuitive. The last patch deals
with initializing the binary control data size after boot up.

Peter Ujfalusi (7):
  ASoC: SOF: ipc: Rename send parameter in
    snd_sof_ipc_set_get_comp_data()
  ASoC: SOF: Drop ipc_cmd parameter for snd_sof_ipc_set_get_comp_data()
  ASoC: SOF: topology: Set control_data->cmd alongside scontrol->cmd
  ASoC: SOF: Drop ctrl_cmd parameter for snd_sof_ipc_set_get_comp_data()
  ASoC: SOF: sof-audio: Drop the `cmd` member from struct
    snd_sof_control
  ASoC: SOF: control: Do not handle control notification with component
    type
  ASoC: SOF: Drop ctrl_type parameter for
    snd_sof_ipc_set_get_comp_data()

Ranjani Sridharan (1):
  ASoC: SOF: topology: read back control data from DSP

 sound/soc/sof/control.c   | 61 +++++++++++----------------------------
 sound/soc/sof/ipc.c       | 49 +++++++++++++++----------------
 sound/soc/sof/sof-audio.c | 33 ++++++++++-----------
 sound/soc/sof/sof-audio.h |  7 +----
 sound/soc/sof/topology.c  | 10 +++----
 5 files changed, 62 insertions(+), 98 deletions(-)

-- 
2.25.1

