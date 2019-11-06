Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 33612F1940
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Nov 2019 15:59:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8AF04169C;
	Wed,  6 Nov 2019 15:59:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8AF04169C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573052397;
	bh=hIZ0Y+77Wbi0TU09xXXjCOxsmi/a34c4I442+mNvgts=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=faJ4QSDT0a3naso3ZB2m1N94Fj/FRzj9UlgUrLEEjMgRiyIpXD8DxNLhCLPxurFxG
	 TO3V3mNe2O37ex/zYGU7DjsskbClqx7upj8S5R4O8RSr4exbU5nuWdxv9ozOssQe1a
	 OT8hkA4uX2Klgc127NMvJG5Loj+bpx83Y7JZ+oBk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E217EF8015B;
	Wed,  6 Nov 2019 15:58:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F3A6FF803D0; Wed,  6 Nov 2019 15:58:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0CD48F8015B
 for <alsa-devel@alsa-project.org>; Wed,  6 Nov 2019 15:58:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0CD48F8015B
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 Nov 2019 06:58:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,275,1569308400"; d="scan'208";a="228000657"
Received: from pdblomfi-mobl.gar.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.254.107.145])
 by FMSMGA003.fm.intel.com with ESMTP; 06 Nov 2019 06:58:04 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Wed,  6 Nov 2019 08:58:01 -0600
Message-Id: <20191106145801.9316-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: tiwai@suse.de, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Subject: [alsa-devel] [PATCH] ASoC: soc-core: fix RIP warning on card removal
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

SOF module load/unload tests show nasty recurring warnings:

WARNING: CPU: 5 PID: 1339 at sound/core/control.c:466
snd_ctl_remove+0xf0/0x100 [snd]
RIP: 0010:snd_ctl_remove+0xf0/0x100 [snd]

This regression was introduced by the removal of the call to
soc_remove_link_components() before soc_card_free() is invoked.

Go back to the initial order but only call
soc_remove_link_components() once.

Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Acked-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Fixes: 5a4c9f054ceea ("ASoC: soc-core: snd_soc_unbind_card() cleanup")
GitHub issue: https://github.com/thesofproject/linux/issues/1424
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/soc-core.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index b07ecfac39d7..1e08fb5da170 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -1951,6 +1951,9 @@ static void soc_cleanup_card_resources(struct snd_soc_card *card)
 {
 	struct snd_soc_dai_link *link, *_link;
 
+	/* This should be called before snd_card_free() */
+	soc_remove_link_components(card);
+
 	/* free the ALSA card at first; this syncs with pending operations */
 	if (card->snd_card) {
 		snd_card_free(card->snd_card);
@@ -1959,7 +1962,6 @@ static void soc_cleanup_card_resources(struct snd_soc_card *card)
 
 	/* remove and free each DAI */
 	soc_remove_link_dais(card);
-	soc_remove_link_components(card);
 
 	for_each_card_links_safe(card, link, _link)
 		snd_soc_remove_dai_link(card, link);
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
