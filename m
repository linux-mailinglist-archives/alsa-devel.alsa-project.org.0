Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F36E0123B4F
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Dec 2019 01:07:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 72CFF1666;
	Wed, 18 Dec 2019 01:06:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 72CFF1666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576627644;
	bh=lUNBHb3dHPfWUto0NRr+WIHBkIq1jQ4CDOm7TcGsS80=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=cpJ2NKE08DTQZ/EN7x1hFFBBiBviOhqHO6hZ25yH2967vVEyCNziVkftyzaWikFar
	 tructUKCxAkXqlAP7URqRjaHTXSwx9Z8Q7JBvqkHPaXXvKQAq4dodgE8oeFMOv39zC
	 v3JcKA2Uz5oB8tdKaKF6A9ZCD3WzqSH6a6k1olEk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 22E4FF80218;
	Wed, 18 Dec 2019 01:05:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5C102F8023F; Wed, 18 Dec 2019 01:05:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 356E7F8020B
 for <alsa-devel@alsa-project.org>; Wed, 18 Dec 2019 01:05:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 356E7F8020B
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Dec 2019 16:05:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,327,1571727600"; d="scan'208";a="266723536"
Received: from dshoemak-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.251.3.243])
 by FMSMGA003.fm.intel.com with ESMTP; 17 Dec 2019 16:05:28 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Tue, 17 Dec 2019 18:05:15 -0600
Message-Id: <20191218000518.5830-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: tiwai@suse.de, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [alsa-devel] [PATCH v2 0/3] More stability fixes for corner cases.
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

It wasn't straightforward to add a Fixes tag for the two Intel
patches, it's likely issues that can be applied to 5.3, possibly
earlier. For Dragos' patch Ranjani mentioned this may be due to
da704f26ba376 ('ASoC: soc-core: merge snd_soc_remove_dai_link() and
soc_unbind_dai_link()'), but Morimoto-san may need to confirm.

Changes since v1:
Fixed conflict in 3rd patch with Morimoto-san changes (rename of
snd_soc_remove_dai_link)

Dragos Tarcatu (1):
  ASoC: topology: Prevent use-after-free in snd_soc_get_pcm_runtime()

Kai Vehmanen (1):
  ASoC: SOF: fix fault at driver unload after failed probe

Pierre-Louis Bossart (1):
  ASoC: SOF: Intel: hda: hda-dai: fix oops on hda_link .hw_free

 sound/soc/soc-topology.c      |  8 ++++----
 sound/soc/sof/intel/hda-dai.c | 11 +++++++++--
 sound/soc/sof/ipc.c           |  3 +++
 3 files changed, 16 insertions(+), 6 deletions(-)

-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
