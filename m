Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A50561340E
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Oct 2022 11:55:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 010421EB;
	Mon, 31 Oct 2022 11:54:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 010421EB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667213725;
	bh=vEzBKA/wBgTBAsUjQ5WGqVG5qRt8wyEzZqWREAAsBOQ=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Vb0CYy7KRJ2YF3m2eXQSYuBtwWh3sBJFohie+KTZ4ZYP/akGwbztJg2A40XWNISpv
	 Tbw+T68Lns4aoMY92eHyzujBD4UfEf5w4m1g90dBHg3dQpRe0EtMY7QsVtPpgliuAa
	 fDw1o0RXe0rsFUBmFYuFMYAzC11SuP9RiSWgRHRo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 68725F80256;
	Mon, 31 Oct 2022 11:54:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1F71BF80163; Mon, 31 Oct 2022 11:54:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3C0F7F800CC
 for <alsa-devel@alsa-project.org>; Mon, 31 Oct 2022 11:54:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3C0F7F800CC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="kyq5XQuO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667213667; x=1698749667;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=vEzBKA/wBgTBAsUjQ5WGqVG5qRt8wyEzZqWREAAsBOQ=;
 b=kyq5XQuOlXbUxUUQnXTfIcesNJO0v15d6MVnSS+Ifa/XNJC68AEqvFo+
 PP6VLQH0mjP2Fy7BCsWJD7yaWacw10G2PLE9FTcEgfivOHlAfaxdPtDeP
 n1HGiOeOXTr0afpPaTOFjh8vzSTk1bk1E37Yv1QmgGTmsAxGvPDSExZUU
 +Dd4V3wlYnf0AfueJCl3i7N4sL+Az4mIGOlo9MjLZt6cIoKEg/AhbFwfy
 CzkC6AiinOs9IqN+zA5SD3qDMRyo4rOlL8WiDz+24uCmbLfu1pDhUa3Jy
 y4fcZ0YHwbNeCGofID5Wj6aa3yyotahA2nJDvOCBq7gxF9tT4vAXHko62 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10516"; a="308868358"
X-IronPort-AV: E=Sophos;i="5.95,227,1661842800"; d="scan'208";a="308868358"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2022 03:51:16 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10516"; a="633487909"
X-IronPort-AV: E=Sophos;i="5.95,227,1661842800"; d="scan'208";a="633487909"
Received: from vbhutani-mobl2.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.13.109])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2022 03:51:14 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	jyri.sarha@intel.com
Subject: [PATCH 0/5] ASoC: SOF: client-probes: Add support for IPC4
Date: Mon, 31 Oct 2022 12:51:36 +0200
Message-Id: <20221031105141.19037-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 kai.vehmanen@linux.intel.com, ranjani.sridharan@linux.intel.com
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

The probes (the ability of probing the audio data from firmware processing
points or to receive stream of debug/trace information) is supported by IPC4
as well, but due to the differences between the two IPC version the low level
setup and information we need for probing is different.

This series will extend the existing probes support for IPC3 with IPC4 'backend'

Regards,
Peter
---
Jyri Sarha (5):
  ASoC: SOF: probes: Replace [0] union members with DECLARE_FLEX_ARRAY()
  ASoC: SOF: probes: Separate IPC3 operations to a separate file
  ASoC: SOF: client: Add sof_client_ipc_set_get_data()
  ASoC: SOF: client: Add sof_client_ipc4_find_module() function
  ASoC: SOF: IPC4: probes: Implement IPC4 ops for probes client device

 sound/soc/sof/Makefile                 |   6 +
 sound/soc/sof/ipc.c                    |   8 +
 sound/soc/sof/sof-client-probes-ipc3.c | 236 +++++++++++++++++++++
 sound/soc/sof/sof-client-probes-ipc4.c | 281 +++++++++++++++++++++++++
 sound/soc/sof/sof-client-probes.c      | 268 +++--------------------
 sound/soc/sof/sof-client-probes.h      |  34 +++
 sound/soc/sof/sof-client.c             |  34 +++
 sound/soc/sof/sof-client.h             |   6 +
 sound/soc/sof/sof-priv.h               |   2 +
 9 files changed, 637 insertions(+), 238 deletions(-)
 create mode 100644 sound/soc/sof/sof-client-probes-ipc3.c
 create mode 100644 sound/soc/sof/sof-client-probes-ipc4.c

-- 
2.38.1

