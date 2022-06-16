Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FE9D54ED22
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Jun 2022 00:09:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9A37C1B39;
	Fri, 17 Jun 2022 00:08:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9A37C1B39
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655417371;
	bh=a5jLZnY4nHcErneajFpVdEumnFCzCKxB1nAit4Gzv28=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=GxQ03PIfAZYBb/S+0lFij5Wn/BeSePXmrc6jXdSEuBgOM7+KtqzKMuTWgo6GJgnM+
	 pFyBLQDfeYtj0XqITcz7+E/J94mXfGHTW8keM3E12UoWaJuOcb1bnRyjT2gC+0fyq3
	 fb2161qZZV0O9txDPgWLbHMkNB1r8eHIXmhFUyzQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 34A68F8051F;
	Fri, 17 Jun 2022 00:08:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 69E32F80310; Fri, 17 Jun 2022 00:08:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3DDC0F80310
 for <alsa-devel@alsa-project.org>; Fri, 17 Jun 2022 00:08:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3DDC0F80310
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="N+JcwMyy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655417290; x=1686953290;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=a5jLZnY4nHcErneajFpVdEumnFCzCKxB1nAit4Gzv28=;
 b=N+JcwMyyVXYuLtsjox/HmSNY0kDPll7Vy15qS3xcOIMISKq+Qk1OftfB
 JMADGDIDYEympDPCxYugUIGQ0wu6c22q55DMlkzGchAKKRpKbtV3yJ1QB
 +nbiBCN8X4ZpadLYsMfxp+RfCc3HloyiYLl49oGZrq0fll70HGKNlxgJU
 gDNbEJGsJ7kvWINU7uviQk36PLQJj7Xti3qC9/wZmi0Z+vkPSjmjnGUms
 YXWlr31kxlpkG047whTkKOkl20WOLUyqaRcb/QePtFP+t4CjgzahSP8L5
 wSvWCjHo2JrWAXuJAt+pOlBEyU3yGnJgjueQ9noPV7/KFw2hDCoiCOilS w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10380"; a="259214921"
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="259214921"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2022 15:08:08 -0700
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="583803282"
Received: from buckkenx-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.52.70])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2022 15:08:08 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 0/2] ASoC: minor kernel-doc corrections
Date: Thu, 16 Jun 2022 17:08:00 -0500
Message-Id: <20220616220802.136282-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
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

Remove warnings with make W=1

Pierre-Louis Bossart (2):
  ASoC: cs4270: update kernel-doc
  ASoC: sunxi: sun4i-i2s: update kernel-doc

 sound/soc/codecs/cs4270.c   | 1 -
 sound/soc/sunxi/sun4i-i2s.c | 2 ++
 2 files changed, 2 insertions(+), 1 deletion(-)

-- 
2.34.1

