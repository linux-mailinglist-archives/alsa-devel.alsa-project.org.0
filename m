Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 53EAC602BE3
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Oct 2022 14:40:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 17E69988D;
	Tue, 18 Oct 2022 14:39:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 17E69988D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666096845;
	bh=Qt/z6hQB/VCau/WGAO3J0/uHlB/5UrNPTfVsqfD/+es=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=jH6cX8Ue9/gr7OrPPt03Z+hST8cQNb21bhxZSjW+WemGgaj8GpOrcFsr5TlIZpncT
	 g/VnfC1qWrpjPbXKkMivo7UydcPuodBHIs10LRxMdYLC2cPc3egY6dNBo9KqkPst0M
	 XqwjKbxksE5+41F0x3KO/jqDBqwi9ZT2HOKQeVfU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 821C2F8053C;
	Tue, 18 Oct 2022 14:39:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BF3F4F8024C; Tue, 18 Oct 2022 14:39:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CA4D5F8024C
 for <alsa-devel@alsa-project.org>; Tue, 18 Oct 2022 14:39:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CA4D5F8024C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="k7kScZvv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666096791; x=1697632791;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Qt/z6hQB/VCau/WGAO3J0/uHlB/5UrNPTfVsqfD/+es=;
 b=k7kScZvv/mFQsTYl3Y6pwbhJxcYyA5N4uEkxMRyIxtXfRGF8cNOGO7mP
 ohvdu09xhoNVOwLcV3c8Kb6edx4TWG25pxHdzbp6AsFTgmeXaZXH/38oj
 JLmOXYYw8Zn9hIORg/l5sMeVJ9WFOv83StH+4yQI4P3vbzCXG9v36d670
 n/IpHeBIqge3gbyc7PVatvFpd4Ok1+ydbh7B/AEr6a4LlstwzzVhbi8si
 gpPoBBTKwPRlyeLRIGQqU0m8A02uScE3/YckIYJ6uwB98iq22e66j+CbY
 MG+0iKlmhKGUabJzkg/YvN9XQ7D8Dak/lF/APiqYbJc980mG89BUrVTlO g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10503"; a="304828548"
X-IronPort-AV: E=Sophos;i="5.95,193,1661842800"; d="scan'208";a="304828548"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2022 05:39:47 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10503"; a="717912752"
X-IronPort-AV: E=Sophos;i="5.95,193,1661842800"; d="scan'208";a="717912752"
Received: from mariaca1-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.27.127])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2022 05:39:45 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 0/4] ASoC: SOF: Intel: Harden the IPC4 low level sequencing
Date: Tue, 18 Oct 2022 15:40:04 +0300
Message-Id: <20221018124008.6846-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.38.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, rander.wang@intel.com,
 pierre-louis.bossart@linux.intel.com, kai.vehmanen@linux.intel.com,
 ranjani.sridharan@linux.intel.com
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

The IPC4 use of doorbell registers leaves some corner cases not well defined
and the 'correct sequences' are subjective in a sense.
The DSP doorbell registers are used as separate and independent channels and
the sequences for host -> DSP -> host (reply) can be racy.

For example:
The ACKing of a received message can happen before the firmware sends the reply
or it can as well happen after the reply has been sent and received by the host.
Both can be considered 'correct sequences' but they need different handling.

This series will allow the kernel to service any interpretation of the
sequencing on the firmware side.

Regards,
Peter
---
Peter Ujfalusi (4):
  ASoC: SOF: ipc4: Log the tx message before sending it
  ASoC: SOF: Intel: ipc4: Read the interrupt reason registers at the
    same time
  ASoC: SOF: Intel: ipc4: Wait for channel to be free before sending a
    message
  ASoC: SOF: Intel: ipc4: Ack a received reply or notification
    separately

 sound/soc/sof/intel/cnl.c     | 26 ++++++++++++++++++++++----
 sound/soc/sof/intel/hda-ipc.c | 27 +++++++++++++++++++++++----
 sound/soc/sof/intel/hda.c     | 11 +++++++++++
 sound/soc/sof/intel/hda.h     |  9 +++++++++
 sound/soc/sof/intel/mtl.c     | 24 +++++++++++++++++++++---
 sound/soc/sof/ipc4.c          |  4 ++--
 6 files changed, 88 insertions(+), 13 deletions(-)

-- 
2.38.0

