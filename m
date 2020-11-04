Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 485C52A658B
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Nov 2020 14:51:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D8D2516AC;
	Wed,  4 Nov 2020 14:50:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D8D2516AC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604497902;
	bh=/cgYVVaTTxJRfAt2yt8iKPSaFOtzyF3NHcSjnFztqhQ=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=HOvJlNR/NgCm5KkLKmV6q5DS1NMuSp6dAjhpwjdkzSix6TIffc1yooc20BNI+SBvf
	 6QgEtfrGs/RGPgxRBhOWimIfPGLOfK4SMJfXpecMP6HYSWQ99mu73x3gZkn0BdrIwR
	 fAIopJKIc0SlczOrsnoPzs8j2Iy1qI1j7nPpPv40=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 520B9F80232;
	Wed,  4 Nov 2020 14:50:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 27562F80234; Wed,  4 Nov 2020 14:50:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8D2F4F800EC
 for <alsa-devel@alsa-project.org>; Wed,  4 Nov 2020 14:49:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8D2F4F800EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=axis.com header.i=@axis.com
 header.b="d/zFEZbC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis.com; l=732; q=dns/txt; s=axis-central1;
 t=1604497802; x=1636033802;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=qaXz6kX0xyZtSKh83yKL3bBzyzWq8BU3+VfizXYut2Q=;
 b=d/zFEZbCa/R7ALjmdomgB9kAOgDEkg1456fu51uJLS/8WFQ/9glTWpAm
 8/3hvRJfI+UnCMZjLFBIQqGr5DtcDlVzbHwtSTxkAZKgd3MTn3icBZpDV
 eWwwviejeVxJP6D6ywDg3WdgGQ3ikJ8Q/vKrHxqWfjBSnT5ytlkivQQw+
 QedCQAk8oxPhhHTubQ30wyZbVCwBBksG+aauo/VUfScRnfRt2inXCB4qg
 +XchWT+QiQxaCC5jVqp6E34LOSg4CQXYfSTKSqWdnJ6ECCZdQqaAVxVoY
 tNP96Dv0vwRxE5NJnyafIwOtHUVDv2nQRdexhjxxi5JMrjJweaEKL7iRL g==;
IronPort-SDR: Gr5dCoTZ3kPP/YHnTCk64UEKG6WzjT7dV7QvFCXk6jrDYukI9bkDyYKrzysMIa+h071N6aZUTI
 lDTAYJ6+Pw7t+ebCoQA3zBcp+X7TWpMwkO5mB+NCSs25MR98WBGJUngnOqNpdSCS7VOO7nrNoz
 q38O5p+dNFP5ZzSNKyOfUnBWWrJx0r9JiTd7mLLjUar/lhCQDk+2U/xiTkw4dqqPOAwUyfzNiG
 ZyEntdHDPwaB6i7mdpm3pDhsrRZxiyR63B7VpDpe0P4dum6e0CKWz7jtCbMV42M/a5WRLV0S5o
 +oc=
X-IronPort-AV: E=Sophos;i="5.77,451,1596492000"; d="scan'208";a="14212890"
From: Jonas Holmberg <jonashg@axis.com>
To: <tiwai@suse.de>
Subject: [PATCH] pcm: set the snd_pcm_ioplug_status() tstamp field
Date: Wed, 4 Nov 2020 14:49:56 +0100
Message-ID: <20201104134956.260519-1-jonashg@axis.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Cc: alsa-devel@alsa-project.org
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

Set the status tstamp field so that it can be accessed with
snd_pcm_status_get_htstamp().

Signed-off-by: Jonas Holmberg <jonashg@axis.com>
---
 src/pcm/pcm_ioplug.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/src/pcm/pcm_ioplug.c b/src/pcm/pcm_ioplug.c
index a437ca32..9b1b8ac3 100644
--- a/src/pcm/pcm_ioplug.c
+++ b/src/pcm/pcm_ioplug.c
@@ -115,6 +115,7 @@ static int snd_pcm_ioplug_status(snd_pcm_t *pcm, snd_pcm_status_t * status)
 	snd_pcm_ioplug_hw_ptr_update(pcm);
 	status->state = io->data->state;
 	status->trigger_tstamp = io->trigger_tstamp;
+	gettimestamp(&status->tstamp, pcm->tstamp_type);
 	status->avail = snd_pcm_mmap_avail(pcm);
 	status->avail_max = io->avail_max;
 	return 0;
-- 
2.26.2

