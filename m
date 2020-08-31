Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C1248257644
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Aug 2020 11:13:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6DD211851;
	Mon, 31 Aug 2020 11:12:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6DD211851
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598865199;
	bh=ZitGseRUwx+m/0TwTJoxT0MKVD3dFi+PmSbqIJ+2sqs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=piROIuEJuWby8txtKFYQvFewTWMebuB7k59xOcCyk9zWulX72IerV8hQ8lr1vVPJn
	 /lBTW56QveE2PaNPYfqKGvEaSZqMAWz9myHL126P+0WRlH31BMm8rlRP/xdKkpHH0E
	 c463X3W9IMyxoBdrMR7xaedEB5ptnXPztfKGAiMU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 90D12F802F8;
	Mon, 31 Aug 2020 11:08:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B2134F802A1; Mon, 31 Aug 2020 11:08:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_PASS,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DE1FEF802C3
 for <alsa-devel@alsa-project.org>; Mon, 31 Aug 2020 11:08:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DE1FEF802C3
IronPort-SDR: 4W1B6SXc/K2fm7zMdmL9y6g+dw3nwQIMD15kt6BsY09skHIZqlMUjAH/HquWCuUppoAVDyQQV8
 ooKocnXI8wnQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9729"; a="136466771"
X-IronPort-AV: E=Sophos;i="5.76,375,1592895600"; d="scan'208";a="136466771"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2020 02:08:16 -0700
IronPort-SDR: j/l+E8Iw2ir4/VPY/FuIan9r+RL5yBvptoGGLQ/+WqyshCIub/eY+WSnMVIFUgPNAp6+TFkRJ4
 1M8H0/5sFagA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,375,1592895600"; d="scan'208";a="314286909"
Received: from test-hp-compaq-8100-elite-cmt-pc.igk.intel.com ([10.237.149.93])
 by orsmga002.jf.intel.com with ESMTP; 31 Aug 2020 02:08:14 -0700
From: Piotr Maziarz <piotrx.maziarz@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v4 08/10] topology: decode: Print sig_bits field in PCM
 capabilities section
Date: Mon, 31 Aug 2020 11:09:01 +0200
Message-Id: <1598864943-22883-9-git-send-email-piotrx.maziarz@linux.intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1598864943-22883-1-git-send-email-piotrx.maziarz@linux.intel.com>
References: <1598864943-22883-1-git-send-email-piotrx.maziarz@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: pierre-louis.bossart@linux.intel.com, cezary.rojewski@intel.com,
 amadeuszx.slawinski@linux.intel.com, tiwai@suse.com
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

Not printing this field makes data loss while converting from binary
to standard ALSA configuration file.

Signed-off-by: Piotr Maziarz <piotrx.maziarz@linux.intel.com>
Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
Reviewed-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 src/topology/pcm.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/src/topology/pcm.c b/src/topology/pcm.c
index db40114..49c5eab 100644
--- a/src/topology/pcm.c
+++ b/src/topology/pcm.c
@@ -604,6 +604,9 @@ int tplg_save_stream_caps(snd_tplg_t *tplg ATTRIBUTE_UNUSED,
 	if (err >= 0 && sc->buffer_size_max)
 		err = tplg_save_printf(dst, pfx, "\tbuffer_size_max %u\n",
 				       sc->buffer_size_max);
+	if (err >= 0 && sc->sig_bits)
+		err = tplg_save_printf(dst, pfx, "\tsig_bits %u\n",
+				       sc->sig_bits);
 	if (err >= 0)
 		err = tplg_save_printf(dst, pfx, "}\n");
 	return err;
-- 
2.7.4

