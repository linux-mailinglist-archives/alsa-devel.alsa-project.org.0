Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A44E225350
	for <lists+alsa-devel@lfdr.de>; Sun, 19 Jul 2020 20:11:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D9F3A1614;
	Sun, 19 Jul 2020 20:11:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D9F3A1614
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595182313;
	bh=cZTeVh42HTvFTJ1V8ck6Z80hfY8e3VwHYXm5QSKDf6o=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=lkYO6x7JA5TG61e1BCqZFCM93VxNTIpEK+zJS4CvuTXQ6a6zs7oVR49OeuaqNEkIJ
	 LB0xu7SL+4AgeUIxgFkGRHFyXZjLsDgks9Go1M9G19BaOV2UbrSP/CmHqRM1cV3+U8
	 KQVcTmReZjJoPgQXVNN4Cv79gDZeeGYWAtjPKzXE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 654ADF802BD;
	Sun, 19 Jul 2020 20:09:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A8242F80161; Sun, 19 Jul 2020 20:09:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3341EF80161
 for <alsa-devel@alsa-project.org>; Sun, 19 Jul 2020 20:09:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3341EF80161
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.b="a4lS0k+G"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=G2g4Ceb7iWRskTszXh5u/2+ZaJlCDCsfgNYhSicznHw=; b=a4lS0k+GTcKGcQ0AilLiU1+vgJ
 q8FcMUxsztwUZTY6eoNtCDa18NjmGUf/a4dzysFju4jYG2WcOlyX/qCyRG7yN2mdkLRb7hjh3sWSe
 hHW8fToSdOkM3hq/0eLPc7hzbGC2KTzTFaNcuzqVoq0CH7JkkQ8mxv8Q1WtLH+Qmqfp3ZdOoNLaZ8
 RqGiokGkt8Ct5lhlPKXZIdWcl8oStBvMkb+c975sDsSeDFlJuRCiw2xgEzq9ZdxcVFxKY/wmU3qby
 uR5TRaB9ZOtF5Bpk8GVNy/G3k99yftRmtaLQFwdpQB9ioTe3WOhEJds4hTLOrgsuxC/iaVIFejJyv
 eiPmWF6Q==;
Received: from [2601:1c0:6280:3f0::19c2] (helo=smtpauth.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jxDkS-0006EF-P7; Sun, 19 Jul 2020 18:09:17 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: tegra20_das.h: delete duplicated words
Date: Sun, 19 Jul 2020 11:09:12 -0700
Message-Id: <20200719180912.30770-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Mark Brown <broonie@kernel.org>, Randy Dunlap <rdunlap@infradead.org>,
 Stephen Warren <swarren@nvidia.com>, alsa-devel@alsa-project.org
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

Delete the doubled word "to" in two comments.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Stephen Warren <swarren@nvidia.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org
---
 sound/soc/tegra/tegra20_das.h |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

--- linux-next-20200717.orig/sound/soc/tegra/tegra20_das.h
+++ linux-next-20200717/sound/soc/tegra/tegra20_das.h
@@ -91,14 +91,14 @@ struct tegra20_das {
  */
 
 /*
- * Connect a DAP to to a DAC
+ * Connect a DAP to a DAC
  * dap_id: DAP to connect: TEGRA20_DAS_DAP_ID_*
  * dac_sel: DAC to connect to: TEGRA20_DAS_DAP_SEL_DAC*
  */
 extern int tegra20_das_connect_dap_to_dac(int dap_id, int dac_sel);
 
 /*
- * Connect a DAP to to another DAP
+ * Connect a DAP to another DAP
  * dap_id: DAP to connect: TEGRA20_DAS_DAP_ID_*
  * other_dap_sel: DAP to connect to: TEGRA20_DAS_DAP_SEL_DAP*
  * master: Is this DAP the master (1) or slave (0)
