Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D78D44F3CCB
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Apr 2022 19:28:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6546717C6;
	Tue,  5 Apr 2022 19:27:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6546717C6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649179714;
	bh=1UhyqNO88jPPpqXtp10KtT8B0Vd+ICgwOPDo1qlq7Ok=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=uddP0AfroROL6MsajjH6deNJEmSiJ2t3H4SUr/VQCmV+Wv+sxnjOCeR5HD2DByj6/
	 sD7TRIgdRZDpguoS2/rcVAf3z3Ate5QQp7MeAf9S9sTrY4xFLkzHIg5rV1E62Nmn0c
	 DaQh6YDXbX3ML9BOx+vDZCo7VvbEriB83Grin9VM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D8DCCF8016B;
	Tue,  5 Apr 2022 19:27:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6E475F8014B; Tue,  5 Apr 2022 19:27:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E400EF8014B
 for <alsa-devel@alsa-project.org>; Tue,  5 Apr 2022 19:27:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E400EF8014B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="D0IZqG3/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649179651; x=1680715651;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1UhyqNO88jPPpqXtp10KtT8B0Vd+ICgwOPDo1qlq7Ok=;
 b=D0IZqG3/HMvH4cMlB0g3C/1aLx6j8ToDUA7JVcZWNf7Jf18to9UrJrUm
 B30T69NAW/dVAGJU+HoIseQEhw+pfi1kNnaV8CLM2Fv+CIA842StEpyQs
 F2CozRjLKPnDUPM7B2ufTF02ncJVBpPifqXg6xoA5Iw1f86ew+Ej9wxoE
 udAEWY9ah9l9vfQyvlWlXcRG4MEhkFF2PQ4GXl+0mRzNvdOs5XMOs3mgy
 /h0dkwo8+rgif4nDBeQZXmvH17PuaqnVFaEXxa+2cZG1gjtfr7rlimbNp
 B33M/SCs/7q59dqgFSPrW7btxo/S3UZlN2vPuKEwBWX1IubAooFxS5y0v w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10308"; a="323986715"
X-IronPort-AV: E=Sophos;i="5.90,236,1643702400"; d="scan'208";a="323986715"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2022 10:27:21 -0700
X-IronPort-AV: E=Sophos;i="5.90,236,1643702400"; d="scan'208";a="722140945"
Received: from reginari-mobl7.amr.corp.intel.com (HELO
 rsridh2-mobl1.localdomain) ([10.254.28.131])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2022 10:27:21 -0700
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 00/15] ASoC: SOF: Abstractions for top-level IPC ops
Date: Tue,  5 Apr 2022 10:26:53 -0700
Message-Id: <20220405172708.122168-1-ranjani.sridharan@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
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

This series is continuation of the IPC abstraction in the SOF driver in
preparation for supporting the new IPC supported by the SOF firmware.
It introduces abstraction for top-level IPC ops for sending/receiving
regular and large IPC's.

Peter Ujfalusi (15):
  ASoC: SOF: Add helper function to prepare and send an IPC message
  ASoC: SOF: Add high level IPC IO callback definitions to ipc_ops
  ASoC: SOF: ipc3: Implement the tx_msg IPC ops
  ASoC: SOF: ipc3: Use sof_ipc3_tx_msg() internally for message sending
  ASoC: SOF: ipc3: Implement the set_get_data IPC ops
  ASoC: SOF: ipc3: Implement the get_reply IPC ops
  ASoC: SOF: ipc3: Implement rx_msg IPC ops
  ASoC: SOF: ipc: Separate the ops checks by functions/topics
  ASoC: SOF: ipc: Add check for mandatory IPC message handling ops
  ASoC: SOF: ipc: Use the get_reply ops in snd_sof_ipc_get_reply()
  ASoC: SOF: ipc: Switch over to use the tx_msg and set_get_data ops
  ASoC: SOF: ipc: Switch over to use the rx_msg ops
  ASoC: SOF: Add widget_kcontrol_setup control ops for IPC3
  ASoC: SOF: sof-audio: Use the widget_kcontrol_setup ops for kcontrol
    set up
  ASoC: SOF: ipc: Move the ipc_set_get_comp_data() local to ipc3-control

 sound/soc/sof/ipc.c          | 858 ++---------------------------------
 sound/soc/sof/ipc3-control.c | 131 +++++-
 sound/soc/sof/ipc3.c         | 682 +++++++++++++++++++++++++++-
 sound/soc/sof/sof-audio.c    |  54 +--
 sound/soc/sof/sof-audio.h    |   7 +-
 sound/soc/sof/sof-priv.h     |  28 +-
 6 files changed, 880 insertions(+), 880 deletions(-)

-- 
2.25.1

