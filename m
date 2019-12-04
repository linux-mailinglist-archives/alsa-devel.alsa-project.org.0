Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E8B171136E3
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Dec 2019 22:07:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 857401671;
	Wed,  4 Dec 2019 22:06:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 857401671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575493626;
	bh=X58DpMGSAEexSsUl9g4jXdUGWqM7cgmjjvHI7IWmh8c=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=E7EutVZkl6iPP1V41poL9c61XF173B/072rynIgUzq2iIlOAC+57XA+7i7/O2hSII
	 rowkvAKcMxd8S8ZmgihbR3R0gGEkZ+XAB6Xu+AxaLLXOtVRkMX92RUev49OBGBVihH
	 TNcBqNpye+gRb/EOwRAI2C9SrRKpRrTExEiCRuDg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9CB5EF80234;
	Wed,  4 Dec 2019 22:05:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 38E01F80214; Wed,  4 Dec 2019 22:05:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3E4CEF800F0
 for <alsa-devel@alsa-project.org>; Wed,  4 Dec 2019 22:05:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3E4CEF800F0
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 04 Dec 2019 13:05:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,278,1571727600"; d="scan'208";a="208958073"
Received: from rgolani-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.251.153.236])
 by fmsmga007.fm.intel.com with ESMTP; 04 Dec 2019 13:05:02 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Wed,  4 Dec 2019 15:04:44 -0600
Message-Id: <20191204210447.11701-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: tiwai@suse.de, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [alsa-devel] [PATCH 0/3] ASoC: SOF: fixes for kernel
	oopses/use-after-free
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

More stability fixes for corner cases.

It wasn't straightforward to add a Fixes tag for the two Intel
patches, it's likely issues that can be applied to 5.3, possibly
earlier. For Dragos' patch Ranjani mentioned this may be due to
da704f26ba376 ('ASoC: soc-core: merge snd_soc_remove_dai_link() and
soc_unbind_dai_link()'), but Morimoto-san may need to confirm.

Dragos Tarcatu (1):
  ASoC: topology: Prevent use-after-free in snd_soc_get_pcm_runtime()

Kai Vehmanen (1):
  ASoC: SOF: fix fault at driver unload after failed probe

Pierre-Louis Bossart (1):
  ASoC: SOF: Intel: hda: hda-dai: fix oops on hda_link .hw_free

 sound/soc/soc-topology.c      |  6 +++---
 sound/soc/sof/intel/hda-dai.c | 11 +++++++++--
 sound/soc/sof/ipc.c           |  3 +++
 3 files changed, 15 insertions(+), 5 deletions(-)

-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
