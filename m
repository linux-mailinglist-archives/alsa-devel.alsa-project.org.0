Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 66B2133C252
	for <lists+alsa-devel@lfdr.de>; Mon, 15 Mar 2021 17:41:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BCAD5179E;
	Mon, 15 Mar 2021 17:40:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BCAD5179E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615826488;
	bh=T4Dt0gxW69j097md6JRA5uqjqk4klYkyikww2kR1wVA=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=HwdjpSEASpD+NEn/Asgi1evxulZ+eafPP1tRXUc2ikUVq8lq9ZLNAhOeok55HGPTS
	 8EREs+l9kOM8nP2ofbIbW5hjPQiwZFfWUDsyZ7rEOUYwvMVf8gaUoSr2mK6BaZvSrP
	 fDR4FkW/0x0hGbnhwKVwwEvATvq2c9ilpF4WUvvM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 51AFEF8023E;
	Mon, 15 Mar 2021 17:39:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 73174F8013F; Mon, 15 Mar 2021 17:39:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 47EB4F8013F
 for <alsa-devel@alsa-project.org>; Mon, 15 Mar 2021 17:39:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 47EB4F8013F
IronPort-SDR: Q8d2NexSxZl3mUhCqswq621d4hf6tw4KtoLaWVNKLJS/4OmAC+AoBd7wHMHr+btiLIw5eL7hTt
 IT9PZWFYGHTQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9924"; a="274160566"
X-IronPort-AV: E=Sophos;i="5.81,251,1610438400"; d="scan'208";a="274160566"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2021 09:39:45 -0700
IronPort-SDR: PfLVeZFp363jGW+ZgfawYU2Cve1tvcI3IorBk1dhst8HBrlN+lF2y8jWj2HKKtwhNZP234ignY
 6EH8J+U9AN/A==
X-IronPort-AV: E=Sophos;i="5.81,251,1610438400"; d="scan'208";a="604912870"
Received: from pwells-mobl2.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.212.5.38])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2021 09:39:41 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 0/3] ASoC: SOF: debug: cleanups
Date: Mon, 15 Mar 2021 11:39:29 -0500
Message-Id: <20210315163932.18663-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

cleanups of allocation and error handling

Guennadi Liakhovetski (3):
  ASoC: SOF: fix debugfs initialisation error handling
  ASoC: SOF: only allocate debugfs cache buffers for IPC flood entries
  ASoC: SOF: remove superfluous NULL check in debugfs read

 sound/soc/sof/core.c  |  5 +++--
 sound/soc/sof/debug.c | 21 +++++++++++----------
 2 files changed, 14 insertions(+), 12 deletions(-)

-- 
2.25.1

