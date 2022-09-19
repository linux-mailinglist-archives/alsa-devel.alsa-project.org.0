Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F6B95BCB91
	for <lists+alsa-devel@lfdr.de>; Mon, 19 Sep 2022 14:13:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 44318163A;
	Mon, 19 Sep 2022 14:13:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 44318163A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663589630;
	bh=+2G88AzKUq2qnc82Q4jrxpEAyDB68Ueqa2VR0Kumd0k=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ToJk9sspdw+wBoVlkw2tIoTuoSYdIrZfrPNWL8F+oJqSVa7C6oJ/NcUYYkcnIrqxS
	 i4JegaLzb+2MPdIAVeVP6iCa38KI3+hI6ikBFUQ4MfTN1LeTQdKP7X57TxMkeCNlFm
	 s3V7wuq4JG/E67uTQ7LQPLWuaxSFEvdQ+Xb82B3g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 95328F80568;
	Mon, 19 Sep 2022 14:11:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 23A35F8055A; Mon, 19 Sep 2022 14:11:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C7AFCF8055A
 for <alsa-devel@alsa-project.org>; Mon, 19 Sep 2022 14:11:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C7AFCF8055A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="HWpN+KjJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663589492; x=1695125492;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+2G88AzKUq2qnc82Q4jrxpEAyDB68Ueqa2VR0Kumd0k=;
 b=HWpN+KjJgz5hNrkGnkDjQ0vH13vrw7/ynr7PVOYocHiAdAIudN5qLC8f
 yOyPc9ABH2pCy/j0mYZYVMo45lAps5te+95tTkx6rnoeK6TvdPjRjOK7q
 HFro1piLBAbR70kEI6XNxUBu79uzZRbGIszBzFihbk7OxJKnTewYmQ3vx
 d81y4ZZzp672LvtxgdJTk43MkDHg9RXSVKgNbqVtmvvtnYKfucoZgzsNa
 Rqeag5G5SycEJR4t83WM8m3kKt+5gowTtoNupNdpCV8G2ElqIza9+STiW
 /pI0J/qsrvztUiaCehqdCk1pwDDW/VnUuAhZEJ3aykPAcch06pyswmj2o g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10474"; a="361121118"
X-IronPort-AV: E=Sophos;i="5.93,327,1654585200"; d="scan'208";a="361121118"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2022 05:11:30 -0700
X-IronPort-AV: E=Sophos;i="5.93,327,1654585200"; d="scan'208";a="680826159"
Received: from amagnus-mobl2.ger.corp.intel.com (HELO pbossart-mobl3.home)
 ([10.249.46.168])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2022 05:11:26 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 6/8] ALSA: hda: ext: simplify logic for stream assignment
Date: Mon, 19 Sep 2022 14:10:39 +0200
Message-Id: <20220919121041.43463-7-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220919121041.43463-1-pierre-louis.bossart@linux.intel.com>
References: <20220919121041.43463-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, tiwai@suse.de,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>
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

The logic is needlessly complicated, the basic rule is:

The host streams can be found by checking the 'opened' boolean.
The link streams can be found by checking the 'link_locked' boolean.

Once a stream is found, it can be unconditionally decoupled. The
snd_hdac_ext_stream_decouple_locked() routine will make sure the
register status is modified as needed and the 'decoupled' boolean set.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/hda/ext/hdac_ext_stream.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/sound/hda/ext/hdac_ext_stream.c b/sound/hda/ext/hdac_ext_stream.c
index 9419abd7fc036..254df9a67bd2b 100644
--- a/sound/hda/ext/hdac_ext_stream.c
+++ b/sound/hda/ext/hdac_ext_stream.c
@@ -267,19 +267,15 @@ hdac_ext_link_stream_assign(struct hdac_bus *bus,
 		if (hstream->direction != substream->stream)
 			continue;
 
-		/* check if decoupled stream and not in use is available */
-		if (hext_stream->decoupled && !hext_stream->link_locked) {
-			res = hext_stream;
-			break;
-		}
-
+		/* check if link stream is available */
 		if (!hext_stream->link_locked) {
-			snd_hdac_ext_stream_decouple_locked(bus, hext_stream, true);
 			res = hext_stream;
 			break;
 		}
+
 	}
 	if (res) {
+		snd_hdac_ext_stream_decouple_locked(bus, res, true);
 		res->link_locked = 1;
 		res->link_substream = substream;
 	}
@@ -308,13 +304,12 @@ hdac_ext_host_stream_assign(struct hdac_bus *bus,
 			continue;
 
 		if (!hstream->opened) {
-			if (!hext_stream->decoupled)
-				snd_hdac_ext_stream_decouple_locked(bus, hext_stream, true);
 			res = hext_stream;
 			break;
 		}
 	}
 	if (res) {
+		snd_hdac_ext_stream_decouple_locked(bus, res, true);
 		res->hstream.opened = 1;
 		res->hstream.running = 0;
 		res->hstream.substream = substream;
-- 
2.34.1

