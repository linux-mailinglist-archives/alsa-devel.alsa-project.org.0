Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F80D2726DA
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Sep 2020 16:22:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 15BA416E1;
	Mon, 21 Sep 2020 16:21:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 15BA416E1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600698131;
	bh=NCuJqjccOST7x22XSPLQq+WkDm6tqWajWqflxaLuxCI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VI756RhTQjyMwPfiG3WKcStaD70Kh6JASF0177vpe+NWO3Iw1VXf3ajyTQioETBm0
	 WY2ClG2GVl5ufsP0bFvk+h/69cyGNHTFYQ86S7gsNazzrOE1YYiIOejrTY6kJSiNP8
	 YXAIBC+uSiNa0YdvFVK+fij0deQwY8e5mUo//8fI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C8C20F802C4;
	Mon, 21 Sep 2020 16:19:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 846C6F8028D; Mon, 21 Sep 2020 16:19:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3B134F80162
 for <alsa-devel@alsa-project.org>; Mon, 21 Sep 2020 16:19:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3B134F80162
IronPort-SDR: gSl7KsCRFfnD7JfQ7pdqVhDw4G2ITdCctCmk/bRcqprfS73KR0mkc5wRJtOhUa9bWZkov6sqIP
 SOFLWQxSFYcg==
X-IronPort-AV: E=McAfee;i="6000,8403,9750"; a="140394081"
X-IronPort-AV: E=Sophos;i="5.77,286,1596524400"; d="scan'208";a="140394081"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2020 07:19:18 -0700
IronPort-SDR: DJCqfmYYISX6/jhbjWXHGnIHgBYPWc2i6u96QSo29b05cm6rg0b4MdfyxX7FvxYMkxIMMRd2CL
 /K0Z9OLAXy9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,286,1596524400"; d="scan'208";a="485495415"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by orsmga005.jf.intel.com with ESMTP; 21 Sep 2020 07:19:17 -0700
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	tiwai@suse.de
Subject: [PATCH 2/4] ALSA: hda - controller is in GPU on the DG1
Date: Mon, 21 Sep 2020 17:17:39 +0300
Message-Id: <20200921141741.2983072-3-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200921141741.2983072-1-kai.vehmanen@linux.intel.com>
References: <20200921141741.2983072-1-kai.vehmanen@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: kai.vehmanen@linux.intel.com
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

Add Intel DG1 to the CONTROLLER_IN_GPU list to ensure audio power is
requested whenever programming the controller.

Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/pci/hda/hda_intel.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
index 904d3af5b99e..61e495187b1a 100644
--- a/sound/pci/hda/hda_intel.c
+++ b/sound/pci/hda/hda_intel.c
@@ -368,7 +368,8 @@ enum {
 #define CONTROLLER_IN_GPU(pci) (((pci)->device == 0x0a0c) || \
 					((pci)->device == 0x0c0c) || \
 					((pci)->device == 0x0d0c) || \
-					((pci)->device == 0x160c))
+					((pci)->device == 0x160c) || \
+					((pci)->device == 0x490d))
 
 #define IS_BXT(pci) ((pci)->vendor == 0x8086 && (pci)->device == 0x5a98)
 
-- 
2.27.0

