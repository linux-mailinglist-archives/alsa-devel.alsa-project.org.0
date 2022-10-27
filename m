Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B382660F2C1
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Oct 2022 10:43:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4A0AE324C;
	Thu, 27 Oct 2022 10:42:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4A0AE324C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666860215;
	bh=CQw/1XgA6G4VkvWR6lQp1wcqpNwHVYgmKcAXoblQn0s=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=PhDbf+RLlWAph/NgvMZcVhD24QJxGxHiKhwV7dZYe5xDi5iR6pAo+VXZOPA3E/T6K
	 r6cjT4F3Kla64zPuimDPZeXWTtCahNdWNuuNpjznmOo6gCFpYVnrx3aK+uj+nl+f8L
	 DfyP7ABqZUODY2Kq1R20CSI1g9xbDZKsyd+BkIyg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BBF98F80496;
	Thu, 27 Oct 2022 10:42:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D98F1F8025E; Thu, 27 Oct 2022 10:42:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E7FFAF80100
 for <alsa-devel@alsa-project.org>; Thu, 27 Oct 2022 10:42:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E7FFAF80100
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="J4bu8zXF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666860155; x=1698396155;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=CQw/1XgA6G4VkvWR6lQp1wcqpNwHVYgmKcAXoblQn0s=;
 b=J4bu8zXF+6tozGZYyer1JMphuD4XpVgl9uU1RPMVynefEqSTwZ62nE4S
 TBtQuKE8Biq6MToPs0lzePo7TmxkMyAwi+0yPM1kWqXoyrrQesV5NcqsW
 JNtmyyLFBfeyvcIs9t5GeZpUOAWP16j49/3MscZaRMy0LmzBXclLCcLdz
 mS8G1fgQdl8yKTIr97vwD+rdRRL/J2OUpP7rhzPEyL13rUFwCiYa+K9gH
 V7b7mJ+GkjXiMKEKcxH6sKCt2jkOKPqIYcE/DOMKNWZxBDobP9VaJ/jC4
 /z1lHPXMLm6+cn6wTUFthYvBCBed+ICgVdyyrjIASu8ULeMiphCHbaDRg g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10512"; a="334795898"
X-IronPort-AV: E=Sophos;i="5.95,217,1661842800"; d="scan'208";a="334795898"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2022 01:42:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10512"; a="632328094"
X-IronPort-AV: E=Sophos;i="5.95,217,1661842800"; d="scan'208";a="632328094"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by orsmga002.jf.intel.com with ESMTP; 27 Oct 2022 01:41:59 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [RESEND PATCH] ASoC: core: Exit all links before removing their
 components
Date: Thu, 27 Oct 2022 10:58:40 +0200
Message-Id: <20221027085840.1562698-1-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 pierre-louis.bossart@linux.intel.com, tiwai@suse.com, hdegoede@redhat.com,
 amadeuszx.slawinski@linux.intel.com
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

Flows leading to link->init() and link->exit() are not symmetric.
Currently the relevant part of card probe sequence goes as:

	for_each_card_rtds(card, rtd)
		for_each_rtd_components(rtd, i, component)
			component->probe()
	for_each_card_rtds(card, rtd)
		for_each_rtd_dais(rtd, i, dai)
			dai->probe()
	for_each_card_rtds(card, rtd)
		rtd->init()

On the other side, equivalent remove sequence goes as:

	for_each_card_rtds(card, rtd)
		for_each_rtd_dais(rtd, i, dai)
			dai->remove()
	for_each_card_rtds(card, rtd)
		for_each_rtd_components(rtd, i, component)
			component->remove()
	for_each_card_rtds(card, rtd)
		rtd->exit()

what can lead to errors as link->exit() may still operate on resources
owned by its components despite the probability of them being freed
during the component->remove().

This change modifies the remove sequence to:

	for_each_card_rtds(card, rtd)
		rtd->exit()
	for_each_card_rtds(card, rtd)
		for_each_rtd_dais(rtd, i, dai)
			dai->remove()
	for_each_card_rtds(card, rtd)
		for_each_rtd_components(rtd, i, component)
			component->remove()

so code found in link->exit() is safe to touch any component stuff as
component->remove() has not been called yet.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
Reviewed-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---

Original review for v1:
https://lore.kernel.org/alsa-devel/20220621115758.3154933-1-cezary.rojewski@intel.com/

 sound/soc/soc-core.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 4a3fca50a536..638e781df3b0 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -935,9 +935,6 @@ void snd_soc_remove_pcm_runtime(struct snd_soc_card *card,
 {
 	lockdep_assert_held(&client_mutex);
 
-	/* release machine specific resources */
-	snd_soc_link_exit(rtd);
-
 	/*
 	 * Notify the machine driver for extra destruction
 	 */
@@ -1888,6 +1885,9 @@ static void soc_cleanup_card_resources(struct snd_soc_card *card)
 
 	snd_soc_dapm_shutdown(card);
 
+	/* release machine specific resources */
+	for_each_card_rtds(card, rtd)
+		snd_soc_link_exit(rtd);
 	/* remove and free each DAI */
 	soc_remove_link_dais(card);
 	soc_remove_link_components(card);
-- 
2.25.1

