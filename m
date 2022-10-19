Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BD991604D55
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Oct 2022 18:26:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 60812AEAA;
	Wed, 19 Oct 2022 18:25:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 60812AEAA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666196789;
	bh=Gjiglj8DxZLrQjy4SpbF+C8pip1fZlkfEBmPWG19EkI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dJ17I3CNosDmc+7+De8mrL26bQLFrcVkdJyuDQJGiLRZ0Yvq7RUwhFz5aGUcyX8Ji
	 Sw3Ob8QA0Lpl1X39jZ6M1jKcCNjMnnEFcfjpuavi3143VUticrgUz6sA0ZM2c1g5mX
	 Qsof+nwIU7OfeNqXLyfot7UB6q+h5B7hcjySDbwg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6617BF80558;
	Wed, 19 Oct 2022 18:24:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 28CA6F8055A; Wed, 19 Oct 2022 18:23:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EA166F8054A
 for <alsa-devel@alsa-project.org>; Wed, 19 Oct 2022 18:23:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EA166F8054A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="JcjNB8hF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666196634; x=1697732634;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Gjiglj8DxZLrQjy4SpbF+C8pip1fZlkfEBmPWG19EkI=;
 b=JcjNB8hFY29k3wOw9L0wW1/xXaUyC/RSBpYnqKih3+65bJrGJjIx4sve
 +VXTBjo4ziACBnhnOyoKBfBhvjXh8edzhwbyQjyntOFM3PmTZJXkWRj5B
 J3uJAWDNHK4BrGEKaoW2he9/xnjDOEQRCtRQbOQHMQov+B4pO+GZ5OK3D
 Icz8syxPbV37IdFy9Y6glV2D1XFyZnNpjAkOHDVX5ap2FpIaUiwivL+s5
 alw9hRRd+P+a0oa+Noli6H7jRM7pov6s3Mi+6DY+E4rWbXBxhqDip/d2G
 enOZOc1GCUI/4jKu0bZxW1E8C+Eg9qaCs38pvAwKCLt0f0OIVxHdUpR9f w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10505"; a="286856251"
X-IronPort-AV: E=Sophos;i="5.95,196,1661842800"; d="scan'208";a="286856251"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2022 09:21:29 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10505"; a="698153853"
X-IronPort-AV: E=Sophos;i="5.95,196,1661842800"; d="scan'208";a="698153853"
Received: from afsinurr-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.16.185])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2022 09:21:28 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 08/10] ALSA: hda: ext: reduce ambiguity between 'multi-link'
 and 'link' DMA
Date: Wed, 19 Oct 2022 11:21:13 -0500
Message-Id: <20221019162115.185917-9-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221019162115.185917-1-pierre-louis.bossart@linux.intel.com>
References: <20221019162115.185917-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, tiwai@suse.de,
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

My esteemed colleagues keep using the same words for different things.

The multi-link structure needs to be handled whether the DSP is
enabled or not.

The host and link DMAs are only relevant when the DSP is enabled.

Things get convoluted when there's an ambiguity between the LOSIDV
settings in the multi-link register space and the selection of the
stream_tag for the link DMA.

Clarify with a rename that the static functions used are related to
the host and link DMAs only.

No functionality change, pure rename.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/hda/ext/hdac_ext_stream.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/hda/ext/hdac_ext_stream.c b/sound/hda/ext/hdac_ext_stream.c
index da2a9b54a5bea..b36378bf6da6c 100644
--- a/sound/hda/ext/hdac_ext_stream.c
+++ b/sound/hda/ext/hdac_ext_stream.c
@@ -224,8 +224,8 @@ int snd_hdac_ext_stream_setup(struct hdac_ext_stream *hext_stream, int fmt)
 EXPORT_SYMBOL_GPL(snd_hdac_ext_stream_setup);
 
 static struct hdac_ext_stream *
-hdac_ext_link_stream_assign(struct hdac_bus *bus,
-			    struct snd_pcm_substream *substream)
+hdac_ext_link_dma_stream_assign(struct hdac_bus *bus,
+				struct snd_pcm_substream *substream)
 {
 	struct hdac_ext_stream *res = NULL;
 	struct hdac_stream *hstream = NULL;
@@ -260,8 +260,8 @@ hdac_ext_link_stream_assign(struct hdac_bus *bus,
 }
 
 static struct hdac_ext_stream *
-hdac_ext_host_stream_assign(struct hdac_bus *bus,
-			    struct snd_pcm_substream *substream)
+hdac_ext_host_dma_stream_assign(struct hdac_bus *bus,
+				struct snd_pcm_substream *substream)
 {
 	struct hdac_ext_stream *res = NULL;
 	struct hdac_stream *hstream = NULL;
@@ -329,10 +329,10 @@ struct hdac_ext_stream *snd_hdac_ext_stream_assign(struct hdac_bus *bus,
 		return hext_stream;
 
 	case HDAC_EXT_STREAM_TYPE_HOST:
-		return hdac_ext_host_stream_assign(bus, substream);
+		return hdac_ext_host_dma_stream_assign(bus, substream);
 
 	case HDAC_EXT_STREAM_TYPE_LINK:
-		return hdac_ext_link_stream_assign(bus, substream);
+		return hdac_ext_link_dma_stream_assign(bus, substream);
 
 	default:
 		return NULL;
-- 
2.34.1

