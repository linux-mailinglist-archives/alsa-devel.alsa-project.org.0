Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D0D3F23F5C8
	for <lists+alsa-devel@lfdr.de>; Sat,  8 Aug 2020 03:24:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 71341852;
	Sat,  8 Aug 2020 03:23:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 71341852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596849877;
	bh=xxvdc6rO3vooKvyODp9/qj7Z+AYKAHrJ/MyS8EkF6+I=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=HM7aEUGSY5l3zAjwjyTmJv0ePcFJemwOAlxQ64WLEdFHaGWPQzbn6i6crcsdvvKey
	 /Ek6zYGTUR+8t52+xFwX2+gHENI3D4BTkGcYYm/NAk8ZP/IY1U8XxXdyq64DDOBg3Y
	 VeGFvUb4C7WM+WNWo4yhXFmFsnhta+seBfPo7Y50=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 30531F800AB;
	Sat,  8 Aug 2020 03:22:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 765DDF8020B; Sat,  8 Aug 2020 03:22:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from merlin.infradead.org (merlin.infradead.org
 [IPv6:2001:8b0:10b:1231::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3EDE4F800AB
 for <alsa-devel@alsa-project.org>; Sat,  8 Aug 2020 03:22:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3EDE4F800AB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.b="ujLFssNj"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:MIME-Version:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=BqIe6wVBUZ+EVoJme1CUcrA3q6AE77m2FxI7AFPRogI=; b=ujLFssNjue/D+gp3CS494AV7lo
 IhIj/Eq/H3VQxz9TJzCP9dOy8qZ6LE/ni81MQUKpSl3NWJBud13E/fPLdfFWYXimoF0NJUifaweMW
 PRHBrRcPEl5cXgNo/Q+EkmACP2Gqzce0ukHW0WMGVKgt5tN8SyCgQ7k2zJINodMHI3GllRHjKDa+x
 TuFM3EEcllOHKZYMXp3wvlzd0U9hWKyiPjN+zr+/PsAOxcSbyyVebnKPQETkvD+1vXz1DLnm7pdT+
 lf1+QsjWRdGz56+6Wqz2z8brF4Gqtm8nWtTRdrz0MvECb4u16zwQ0X4gZlyX/ewfzkLvs5P9PVkC9
 Sw5xtOuQ==;
Received: from [2601:1c0:6280:3f0:897c:6038:c71d:ecac]
 (helo=smtpauth.infradead.org)
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k4DYf-0001GM-3m; Sat, 08 Aug 2020 01:22:01 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: SOF: delete repeated words in comments
Date: Fri,  7 Aug 2020 18:21:56 -0700
Message-Id: <20200808012156.10827-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Mark Brown <broonie@kernel.org>, Randy Dunlap <rdunlap@infradead.org>,
 Liam Girdwood <lgirdwood@gmail.com>, alsa-devel@alsa-project.org
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

Drop the repeated words {that, the} in comments.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org
---
 sound/soc/sof/intel/cnl.c |    2 +-
 sound/soc/sof/sof-audio.c |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

--- linux-next-20200807.orig/sound/soc/sof/intel/cnl.c
+++ linux-next-20200807/sound/soc/sof/intel/cnl.c
@@ -202,7 +202,7 @@ static int cnl_ipc_send_msg(struct snd_s
 	 * IPCs are sent at a high-rate. mod_delayed_work()
 	 * modifies the timer if the work is pending.
 	 * Also, a new delayed work should not be queued after the
-	 * the CTX_SAVE IPC, which is sent before the DSP enters D3.
+	 * CTX_SAVE IPC, which is sent before the DSP enters D3.
 	 */
 	if (hdr->cmd != (SOF_IPC_GLB_PM_MSG | SOF_IPC_PM_CTX_SAVE))
 		mod_delayed_work(system_wq, &hdev->d0i3_work,
--- linux-next-20200807.orig/sound/soc/sof/sof-audio.c
+++ linux-next-20200807/sound/soc/sof/sof-audio.c
@@ -29,7 +29,7 @@ bool snd_sof_dsp_only_d0i3_compatible_st
 				continue;
 
 			/*
-			 * substream->runtime being not NULL indicates that
+			 * substream->runtime being not NULL indicates
 			 * that the stream is open. No need to check the
 			 * stream state.
 			 */
