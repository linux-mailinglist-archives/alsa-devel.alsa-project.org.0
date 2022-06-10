Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7836F545E0F
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Jun 2022 10:02:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 047191B49;
	Fri, 10 Jun 2022 10:01:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 047191B49
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654848142;
	bh=35FbUiX/RvhJGqP4E4tIk7etTwYaPumYlFUSKr5vsrg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BMKW/nuDDDi5RlrlNTlLEdUPWtTcsG0WtVr8klX+p5GExFnUX7OotZ/9b3uVsmFHN
	 eItNmWlRwzjwoTxQUQ16gftxs8h3v7KPzjdoSKBnfeKcKlFCPc8bPoERmK1cCR9dqH
	 XpZDcRgF87JbB1twBOBecfLixNMa+tHuX9C3c6Qc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5257DF80534;
	Fri, 10 Jun 2022 10:01:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 11D15F80529; Fri, 10 Jun 2022 10:01:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1DE6CF804E7
 for <alsa-devel@alsa-project.org>; Fri, 10 Jun 2022 10:00:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1DE6CF804E7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="a0HG84PP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654848056; x=1686384056;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=35FbUiX/RvhJGqP4E4tIk7etTwYaPumYlFUSKr5vsrg=;
 b=a0HG84PPC9xLk1ul922XM/MdgdFWLDFioPz9XpIFHG4T+5rrKD8wurlH
 U/p4L5bzrCjlx88WrBqeK4gX1Uo9xOZJ0fmywiMhzoclqjMpRuhCCdjsj
 B37dKNzIBgRsNHsQWxiQllJgcgGtLbh2gSxhB2yw2+WPnhOtszaWb2+kt
 BnAh3OMuEyyqrVQLDUavuwNkSVp/LPepGlmPwHgVcTXq0AmycebTG0qK4
 7hXnj5XXk6xHU4kXsKs0i6wZauOeFR1VFae/w/kGwUXpJUdLws11DvtBT
 8OtK9IaXhq6O2KjN+3zZNQyFxjmla+J8kmA3Z5HKjDF/FwaqsbMTdYth/ Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10373"; a="339305582"
X-IronPort-AV: E=Sophos;i="5.91,288,1647327600"; d="scan'208";a="339305582"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2022 01:00:54 -0700
X-IronPort-AV: E=Sophos;i="5.91,288,1647327600"; d="scan'208";a="638007989"
Received: from nuribebu-mobl.amr.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.251.215.108])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2022 01:00:51 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com, daniel.baluta@nxp.com
Subject: [PATCH 3/3] ASoC: SOF: ipc3-dtrace: Return from dtrace_read if there
 is no new data available
Date: Fri, 10 Jun 2022 11:01:19 +0300
Message-Id: <20220610080119.30880-4-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220610080119.30880-1-peter.ujfalusi@linux.intel.com>
References: <20220610080119.30880-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, yung-chuan.liao@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com
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

If no new trace data is available then return immediately, there is no
need to continue with the execution of the trace_read() function.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/sof/ipc3-dtrace.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/soc/sof/ipc3-dtrace.c b/sound/soc/sof/ipc3-dtrace.c
index 1f4d7a98c8fc..f59931d818c1 100644
--- a/sound/soc/sof/ipc3-dtrace.c
+++ b/sound/soc/sof/ipc3-dtrace.c
@@ -353,6 +353,10 @@ static ssize_t dfsentry_dtrace_read(struct file *file, char __user *buffer,
 		return -EIO;
 	}
 
+	/* no new trace data */
+	if (!avail)
+		return 0;
+
 	/* make sure count is <= avail */
 	if (count > avail)
 		count = avail;
-- 
2.36.1

