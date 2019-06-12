Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3046D42D92
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jun 2019 19:32:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B492B17E8;
	Wed, 12 Jun 2019 19:31:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B492B17E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560360743;
	bh=3bTSY8NoMCgTtlxx7Mem5DhKMotCjnvhLvSSu+B3G0Q=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VrBdjyIX+D+PBKzxaKNX4SwwHjDtCXsi4PLDbrfnzrTQYrHU7oSa6Y1vq03pv67j2
	 tQcI6DinyILXlNoX0zCZbKAoCQWP/qfihdM5cPTAKkbFVzWBPR5Rdq0wTvb4/N1q41
	 46EX+43q+jT2o3KPL8TuJL0I7EWztyV5WPmQycwA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7E73EF8975E;
	Wed, 12 Jun 2019 19:24:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D6618F8973C; Wed, 12 Jun 2019 19:24:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 913FEF896FA
 for <alsa-devel@alsa-project.org>; Wed, 12 Jun 2019 19:23:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 913FEF896FA
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 Jun 2019 10:23:54 -0700
X-ExtLoop1: 1
Received: from adorrell-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.251.133.122])
 by fmsmga008.fm.intel.com with ESMTP; 12 Jun 2019 10:23:54 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Wed, 12 Jun 2019 12:23:37 -0500
Message-Id: <20190612172347.22338-6-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190612172347.22338-1-pierre-louis.bossart@linux.intel.com>
References: <20190612172347.22338-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de, broonie@kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH 05/15] ASoC: SOF: Intel: hda: reserve host DMA
	channel for hostless streams
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

From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

Due to the HW programming sequence requirement that the host
and link DMA channels need to be coupled/decoupled during pcm
hw_params, the host DMA channel corresponding to the link
DMA channel in use for hostless streams needs to be reserved.
This is achieved by adding a host_reserved flag in the
sof_intel_hda_stream structure which is checked when assigning
a host DMA channel.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/intel/hda-dai.c    | 11 ++++++++++-
 sound/soc/sof/intel/hda-stream.c | 10 +++++++++-
 sound/soc/sof/intel/hda.h        |  1 +
 3 files changed, 20 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/intel/hda-dai.c b/sound/soc/sof/intel/hda-dai.c
index c270fd7a0878..a514f9cf5c9a 100644
--- a/sound/soc/sof/intel/hda-dai.c
+++ b/sound/soc/sof/intel/hda-dai.c
@@ -75,7 +75,7 @@ static struct hdac_ext_stream *
 
 		hda_stream = hstream_to_sof_hda_stream(hstream);
 
-		/* check if available */
+		/* check if link is available */
 		if (!hstream->link_locked) {
 			if (stream->opened) {
 				/*
@@ -89,6 +89,12 @@ static struct hdac_ext_stream *
 				}
 			} else {
 				res = hstream;
+
+				/*
+				 * This must be a hostless stream.
+				 * So reserve the host DMA channel.
+				 */
+				hda_stream->host_reserved = 1;
 				break;
 			}
 		}
@@ -368,6 +374,9 @@ static int hda_link_hw_free(struct snd_pcm_substream *substream,
 	snd_hdac_ext_stream_release(link_dev, HDAC_EXT_STREAM_TYPE_LINK);
 	link_dev->link_prepared = 0;
 
+	/* free the host DMA channel reserved by hostless streams */
+	hda_stream->host_reserved = 0;
+
 	return 0;
 }
 
diff --git a/sound/soc/sof/intel/hda-stream.c b/sound/soc/sof/intel/hda-stream.c
index 1cd94e7631a8..a3f7c91469ec 100644
--- a/sound/soc/sof/intel/hda-stream.c
+++ b/sound/soc/sof/intel/hda-stream.c
@@ -155,6 +155,7 @@ struct hdac_ext_stream *
 hda_dsp_stream_get(struct snd_sof_dev *sdev, int direction)
 {
 	struct hdac_bus *bus = sof_to_bus(sdev);
+	struct sof_intel_hda_stream *hda_stream;
 	struct hdac_ext_stream *stream = NULL;
 	struct hdac_stream *s;
 
@@ -163,8 +164,15 @@ hda_dsp_stream_get(struct snd_sof_dev *sdev, int direction)
 	/* get an unused stream */
 	list_for_each_entry(s, &bus->stream_list, list) {
 		if (s->direction == direction && !s->opened) {
-			s->opened = true;
 			stream = stream_to_hdac_ext_stream(s);
+			hda_stream = container_of(stream,
+						  struct sof_intel_hda_stream,
+						  hda_stream);
+			/* check if the host DMA channel is reserved */
+			if (hda_stream->host_reserved)
+				continue;
+
+			s->opened = true;
 			break;
 		}
 	}
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index 376b1ca51e2b..2862b4b3b07c 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -413,6 +413,7 @@ struct sof_intel_hda_stream {
 	struct hdac_ext_stream hda_stream;
 	struct sof_intel_stream stream;
 	int hw_params_upon_resume; /* set up hw_params upon resume */
+	int host_reserved; /* reserve host DMA channel */
 };
 
 #define hstream_to_sof_hda_stream(hstream) \
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
