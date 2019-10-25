Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 362A6E5699
	for <lists+alsa-devel@lfdr.de>; Sat, 26 Oct 2019 00:48:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CA69A1859;
	Sat, 26 Oct 2019 00:47:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CA69A1859
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572043681;
	bh=7STeBZ9cg8m5WIpgAUnA30PPJUvTNP1RLh40bi+FcOo=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=C7f4lXSpp/RFyWwH5Ekk86jwM9/WzI1evs1KtqT4Qd2TN1DerdCrPobWuXkxy/bRq
	 Be4+pN5D0zp857WiFLfNl1fIYzVKncPxI37FdpnRvuICqRP+whDX6pczL0jj9yu4lp
	 A88gTGBkEchy9TwgBbWdMHZB4BUDqv0U5jmVjLYE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EBB29F80672;
	Sat, 26 Oct 2019 00:42:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B2926F80611; Sat, 26 Oct 2019 00:41:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9CDA7F803A6
 for <alsa-devel@alsa-project.org>; Sat, 26 Oct 2019 00:41:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9CDA7F803A6
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 25 Oct 2019 15:41:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,230,1569308400"; d="scan'208";a="210458194"
Received: from archagam-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.252.139.180])
 by fmsmga001.fm.intel.com with ESMTP; 25 Oct 2019 15:41:39 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Fri, 25 Oct 2019 17:41:03 -0500
Message-Id: <20191025224122.7718-8-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191025224122.7718-1-pierre-louis.bossart@linux.intel.com>
References: <20191025224122.7718-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de, broonie@kernel.org, Keyon Jie <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH 07/26] ASoC: SOF: add flag to
	snd_sof_pcm_stream for D0i3 compatible stream
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

From: Keyon Jie <yang.jie@linux.intel.com>

Add flag d0i3_compatible to struct snd_sof_pcm_stream to denote if the
stream can tolerate a transition to the D0i3 substate while opened (thus
seen as 'active' by pm_runtime).

Signed-off-by: Keyon Jie <yang.jie@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/sof-priv.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index e9902e4e8e55..7a21a45d3635 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -310,6 +310,7 @@ struct snd_sof_pcm_stream {
 	struct sof_ipc_stream_posn posn;
 	struct snd_pcm_substream *substream;
 	struct work_struct period_elapsed_work;
+	bool d0i3_compatible; /* DSP can be in D0I3 when this pcm is opened */
 };
 
 /* ALSA SOF PCM device */
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
