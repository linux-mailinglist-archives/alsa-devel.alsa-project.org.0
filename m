Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 20E665BCB8C
	for <lists+alsa-devel@lfdr.de>; Mon, 19 Sep 2022 14:13:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B533B161E;
	Mon, 19 Sep 2022 14:12:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B533B161E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663589579;
	bh=IIFhJ3xZArPkmVZGicFmIPyhLt07ac4+L9NBOjmIz1M=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=abwQg8Sqlp3yw8+Iuz718W9lIMnNxZjYRPk3I5Bwdn4iOllw3/itsVqmr0tU0O6RO
	 2o1y21oguho/SY1WUwWxL1HoqVD2atlok+VLGVa1FFZ+UawjZkFjhBb8OXkbW0DAW3
	 MS5cUaFtUullXrrG+dwwL/zSdxfBaRPCwF7h0VJQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AB070F8053C;
	Mon, 19 Sep 2022 14:11:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 56E0FF80542; Mon, 19 Sep 2022 14:11:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8BF8CF804AE
 for <alsa-devel@alsa-project.org>; Mon, 19 Sep 2022 14:11:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8BF8CF804AE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="P3QzuPZ9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663589479; x=1695125479;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IIFhJ3xZArPkmVZGicFmIPyhLt07ac4+L9NBOjmIz1M=;
 b=P3QzuPZ9oDKYhONJZAPgpkcs0ogelmqdRretzdeAfz6yAfANNeTv9R3J
 5vec/16+3J1rcI+lQ+SknaNF1J89iySp0F4appIbKVMhA6vbdFmMKko8x
 td/FLXX22FKrbKfzm3vEPbrmDE241Y+ZnAmEqLv4ACpcl4wqUeIICduLr
 Hq/ND88t5rHPdgnlmYhJf1k8nnrLyfxz+hTX2zbytBtnRPwOvql27vMm2
 kiyCR9gJ9GpHduxe9Defze0LIUuPR33OGy85ILIQcEzIyDl3ihuNVmTZa
 ZzHWnvt3CJzkLqW1qIrA8uxYUkRjdwbaAv+CsJnIRezYel1fPEWt93Kmq g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10474"; a="361121095"
X-IronPort-AV: E=Sophos;i="5.93,327,1654585200"; d="scan'208";a="361121095"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2022 05:11:18 -0700
X-IronPort-AV: E=Sophos;i="5.93,327,1654585200"; d="scan'208";a="680826114"
Received: from amagnus-mobl2.ger.corp.intel.com (HELO pbossart-mobl3.home)
 ([10.249.46.168])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2022 05:11:13 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 3/8] ALSA: hda: ext: make snd_hdac_ext_stream_init() static
Date: Mon, 19 Sep 2022 14:10:36 +0200
Message-Id: <20220919121041.43463-4-pierre-louis.bossart@linux.intel.com>
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

There are no external users of this helper, move to static and remove
sympol export. No functionality change.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 include/sound/hdaudio_ext.h     | 3 ---
 sound/hda/ext/hdac_ext_stream.c | 7 +++----
 2 files changed, 3 insertions(+), 7 deletions(-)

diff --git a/include/sound/hdaudio_ext.h b/include/sound/hdaudio_ext.h
index 07231f0b93b50..4a4bd1d88612f 100644
--- a/include/sound/hdaudio_ext.h
+++ b/include/sound/hdaudio_ext.h
@@ -77,9 +77,6 @@ struct hdac_ext_stream {
 #define stream_to_hdac_ext_stream(s) \
 	container_of(s, struct hdac_ext_stream, hstream)
 
-void snd_hdac_ext_stream_init(struct hdac_bus *bus,
-			      struct hdac_ext_stream *hext_stream, int idx,
-			      int direction, int tag);
 int snd_hdac_ext_stream_init_all(struct hdac_bus *bus, int start_idx,
 				 int num_stream, int dir);
 void snd_hdac_stream_free_all(struct hdac_bus *bus);
diff --git a/sound/hda/ext/hdac_ext_stream.c b/sound/hda/ext/hdac_ext_stream.c
index d2b5724b463ff..5c665b26f8533 100644
--- a/sound/hda/ext/hdac_ext_stream.c
+++ b/sound/hda/ext/hdac_ext_stream.c
@@ -26,9 +26,9 @@
  * initialize the stream, if ppcap is enabled then init those and then
  * invoke hdac stream initialization routine
  */
-void snd_hdac_ext_stream_init(struct hdac_bus *bus,
-			      struct hdac_ext_stream *hext_stream,
-			      int idx, int direction, int tag)
+static void snd_hdac_ext_stream_init(struct hdac_bus *bus,
+				     struct hdac_ext_stream *hext_stream,
+				     int idx, int direction, int tag)
 {
 	if (bus->ppcap) {
 		hext_stream->pphc_addr = bus->ppcap + AZX_PPHC_BASE +
@@ -56,7 +56,6 @@ void snd_hdac_ext_stream_init(struct hdac_bus *bus,
 	hext_stream->decoupled = false;
 	snd_hdac_stream_init(bus, &hext_stream->hstream, idx, direction, tag);
 }
-EXPORT_SYMBOL_GPL(snd_hdac_ext_stream_init);
 
 /**
  * snd_hdac_ext_stream_init_all - create and initialize the stream objects
-- 
2.34.1

