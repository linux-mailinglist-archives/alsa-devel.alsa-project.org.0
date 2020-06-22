Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 971E9203B65
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jun 2020 17:47:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3FE2E16F9;
	Mon, 22 Jun 2020 17:46:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3FE2E16F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592840824;
	bh=NuSnIx2LrhOjHgZhoA6vC6555U3QMRK41v6xu1OBKVE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=a9Fx0fXJdcZkHlDDwHTPZcmvkcJNXAStFIVh/ich+6dJoaTCzW7f3hxkRZTuQWzvS
	 Y9f5qV8XKKjxf9nqJuueedxx/9bx3HkKoMJKGx+ikju1TesP7uT1+2dipKM/Nbddpl
	 InzbRNBMhD0BNbhTUDwYKc46A5YGZQ2Spa0ooM+Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C3595F802BD;
	Mon, 22 Jun 2020 17:43:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AC205F801F2; Mon, 22 Jun 2020 17:43:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 790B7F8015B
 for <alsa-devel@alsa-project.org>; Mon, 22 Jun 2020 17:42:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 790B7F8015B
IronPort-SDR: 8ayieD5RPQv4Yg010MrE1ZpFOSk1i8CRzm82SD0Hpjznir/SfYqbnSFNlONgYqIt/PRF0Xt87v
 PaHEOYhYBxmw==
X-IronPort-AV: E=McAfee;i="6000,8403,9659"; a="141300422"
X-IronPort-AV: E=Sophos;i="5.75,267,1589266800"; d="scan'208";a="141300422"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2020 08:42:47 -0700
IronPort-SDR: kQCp+dFkGs/OVWjMQE2dpTAqyhMH2galWBJfelXEu03Adr2odgGBWjomvHizPLcAmbLmaeEUfy
 60av09s6faPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,267,1589266800"; d="scan'208";a="478425139"
Received: from somsubhr-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.254.74.194])
 by fmsmga006.fm.intel.com with ESMTP; 22 Jun 2020 08:42:45 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/5] ASoC: soc-link: introduce exit() callback
Date: Mon, 22 Jun 2020 10:42:37 -0500
Message-Id: <20200622154241.29053-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200622154241.29053-1-pierre-louis.bossart@linux.intel.com>
References: <20200622154241.29053-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, tiwai@suse.de,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Curtis Malainey <curtis@malainey.com>, broonie@kernel.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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

Some machine drivers allocate or request resources with
snd_soc_link_init() phase of the card probe. These resources need to
be properly released when removing a card, and this patch suggests a
dual exit() callback.

The exit() is invoked in soc_remove_pcm_runtime(), which is not
completely symmetric with the init() invoked in soc_init_pcm_runtime().

Alternate solutions were considered, e.g. adding a .remove() callback
for the platform driver, but that's not symmetrical at all and would
be difficult to handle if there are more than one dailink implementing
an .init(). We looked also into using .remove_dai_link() callback, but
that would also be imbalanced.

Note that because of the error handling in snd_soc_bind_card(), which
jumps to probe_end, there is no way to guarantee the exit() is invoked
with resources allocated in the init(). Prior to releasing those
resources, implementations of the exit() callback shall check the
resources are valid.

Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Reviewed-by: Curtis Malainey <curtis@malainey.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 include/sound/soc-link.h | 1 +
 include/sound/soc.h      | 3 +++
 sound/soc/soc-core.c     | 3 +++
 sound/soc/soc-link.c     | 6 ++++++
 4 files changed, 13 insertions(+)

diff --git a/include/sound/soc-link.h b/include/sound/soc-link.h
index 3dd6e33e94ec..337ac5666757 100644
--- a/include/sound/soc-link.h
+++ b/include/sound/soc-link.h
@@ -9,6 +9,7 @@
 #define __SOC_LINK_H
 
 int snd_soc_link_init(struct snd_soc_pcm_runtime *rtd);
+void snd_soc_link_exit(struct snd_soc_pcm_runtime *rtd);
 int snd_soc_link_be_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
 				    struct snd_pcm_hw_params *params);
 
diff --git a/include/sound/soc.h b/include/sound/soc.h
index 2756f9bcac3e..33aceadebd03 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -799,6 +799,9 @@ struct snd_soc_dai_link {
 	/* codec/machine specific init - e.g. add machine controls */
 	int (*init)(struct snd_soc_pcm_runtime *rtd);
 
+	/* codec/machine specific exit - dual of init() */
+	void (*exit)(struct snd_soc_pcm_runtime *rtd);
+
 	/* optional hw_params re-writing for BE and FE sync */
 	int (*be_hw_params_fixup)(struct snd_soc_pcm_runtime *rtd,
 			struct snd_pcm_hw_params *params);
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 62c0c9482018..adedadcb0efb 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -945,6 +945,9 @@ void snd_soc_remove_pcm_runtime(struct snd_soc_card *card,
 {
 	lockdep_assert_held(&client_mutex);
 
+	/* release machine specific resources */
+	snd_soc_link_exit(rtd);
+
 	/*
 	 * Notify the machine driver for extra destruction
 	 */
diff --git a/sound/soc/soc-link.c b/sound/soc/soc-link.c
index f849278beba0..1c3bf2118718 100644
--- a/sound/soc/soc-link.c
+++ b/sound/soc/soc-link.c
@@ -40,6 +40,12 @@ int snd_soc_link_init(struct snd_soc_pcm_runtime *rtd)
 	return soc_link_ret(rtd, ret);
 }
 
+void snd_soc_link_exit(struct snd_soc_pcm_runtime *rtd)
+{
+	if (rtd->dai_link->exit)
+		rtd->dai_link->exit(rtd);
+}
+
 int snd_soc_link_be_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
 				    struct snd_pcm_hw_params *params)
 {
-- 
2.20.1

