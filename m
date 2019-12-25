Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 11D7512AAC2
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Dec 2019 08:13:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 94A9C16DD;
	Thu, 26 Dec 2019 08:12:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 94A9C16DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1577344422;
	bh=7X/bKTuh6WiRlnTHgVcVUO2SnWdrNhyVMvBtpQyMmZ8=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=vq1AvmQcXzeSZo0DzTeSnVwNiFX4WKDUJEqKJyebIc8gq91sLJj/gwdOqlyirWuZX
	 7TFCya+ibpfLRM0o1iUN+pfd18F9tZ629OCpVMsNa82SifgN2wy2P/B40B6JMNVAbe
	 FYzjMRxME7q+8ZvAulmSCnsZRedP91XGvi/w/ECE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 91E73F8019B;
	Thu, 26 Dec 2019 08:12:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 286B3F8012E; Thu, 26 Dec 2019 08:11:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DATE_IN_PAST_06_12,
 SPF_HELO_NONE,SPF_NONE,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C6174F8012E
 for <alsa-devel@alsa-project.org>; Thu, 26 Dec 2019 08:11:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C6174F8012E
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 25 Dec 2019 23:11:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,358,1571727600"; d="scan'208";a="300327213"
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by orsmga001.jf.intel.com with ESMTP; 25 Dec 2019 23:11:48 -0800
From: Bard liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org
Date: Thu, 26 Dec 2019 03:14:58 +0800
Message-Id: <20191225191501.23848-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
Cc: alsa-devel@alsa-project.org, kuninori.morimoto.gx@renesas.com,
 tiwai@suse.de, pierre-louis.bossart@linux.intel.com,
 liam.r.girdwood@linux.intel.com, bard.liao@intel.com
Subject: [alsa-devel] [PATCH RFC 0/3] ASoC: Add Multi CPU DAI support
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Bard Liao <yung-chuan.liao@linux.intel.com>

As discussed in [1], ASoC core supports multi codec DAIs
on a DAI link. However it does not do so for CPU DAIs.

So, add support for multi CPU DAIs on a DAI Link by adding
multi CPU DAI in Card instantiation, suspend and resume
functions, PCM ops, stream handling functions and DAPM.

[1]: https://www.spinics.net/lists/alsa-devel/msg71369.html


Shreyas NC (3):
  ASoC: Add initial support for multiple CPU DAIs
  ASoC: Add multiple CPU DAI support for PCM ops
  ASoC: Add multiple CPU DAI support in DAPM

 include/sound/soc.h  |  15 ++
 sound/soc/soc-core.c | 183 ++++++++++--------
 sound/soc/soc-dapm.c | 131 +++++++------
 sound/soc/soc-pcm.c  | 432 ++++++++++++++++++++++++++++---------------
 4 files changed, 483 insertions(+), 278 deletions(-)

-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
