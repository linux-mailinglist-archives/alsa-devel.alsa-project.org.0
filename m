Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D6FE652F503
	for <lists+alsa-devel@lfdr.de>; Fri, 20 May 2022 23:23:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 79580172C;
	Fri, 20 May 2022 23:22:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 79580172C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653081800;
	bh=jckmVIiVHj4no1YvqK8AoBjG6gfnTk0wrOWcc8n7rMQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=n8T3XUCPv4v7uTGvOELTKUlN3+2nDRxlPUmNMHS4LgFdCzjH9cQ5BlHQJv3/K2PSm
	 LDE5EWbYSkCzicpNa+5LBZpHWGUu5tw8EydwpZBUtyYW1Mqfob0N6DMFhExJVikKSn
	 fJqktJqh3aPTaNGtptbrw1ajep7kIGgrmMGd1GLI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B8053F805B4;
	Fri, 20 May 2022 23:18:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A5B03F80571; Fri, 20 May 2022 23:18:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 632A5F8052D
 for <alsa-devel@alsa-project.org>; Fri, 20 May 2022 23:17:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 632A5F8052D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="V1LNK5UD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1653081469; x=1684617469;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jckmVIiVHj4no1YvqK8AoBjG6gfnTk0wrOWcc8n7rMQ=;
 b=V1LNK5UDrAS5NXSeyR3iJWvL963gS3ydl+V7fNEqLsxT6B9+j4EV/tm1
 D47r8SqVFXxyev10YNI9UHnLN7lFJBtR1oEfE+vS6We3reWWLeamUNjdr
 KHoJgsBCRh9ijE9p0A5KmSAi0sofIV5dRng4/1CY3sAsVZ9NSkBv5Xz8G
 LLRh0WlNmkXw0Slb0NZbenetV7l4AS0rLPmXYj+Ct5WfAfnhXtzEbs/jN
 I6CmNSnM0AKMju4i1vorRBlc3JbRRBJl3rjDx15BzDqD6MZJYGYKJo+c/
 cx3MdF2NR7Wqg94TLNGKTOgQ+Dl/YkKPx1rrbdwfkHJXSp3MdvKehm1+v g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10353"; a="270324255"
X-IronPort-AV: E=Sophos;i="5.91,240,1647327600"; d="scan'208";a="270324255"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2022 14:17:42 -0700
X-IronPort-AV: E=Sophos;i="5.91,240,1647327600"; d="scan'208";a="674796070"
Received: from achsu-mobl2.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.212.181.190])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2022 14:17:41 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 16/16] ASoC: meson: remove useless initialization
Date: Fri, 20 May 2022 16:17:19 -0500
Message-Id: <20220520211719.607543-17-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220520211719.607543-1-pierre-louis.bossart@linux.intel.com>
References: <20220520211719.607543-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 broonie@kernel.org, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

cppcheck complains about invalid NULL dereferences but there's indeed
no need to initialize a loop variable.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/meson/meson-codec-glue.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/meson/meson-codec-glue.c b/sound/soc/meson/meson-codec-glue.c
index 2870cfad813ac..80c5ed196961d 100644
--- a/sound/soc/meson/meson-codec-glue.c
+++ b/sound/soc/meson/meson-codec-glue.c
@@ -13,7 +13,7 @@
 static struct snd_soc_dapm_widget *
 meson_codec_glue_get_input(struct snd_soc_dapm_widget *w)
 {
-	struct snd_soc_dapm_path *p = NULL;
+	struct snd_soc_dapm_path *p;
 	struct snd_soc_dapm_widget *in;
 
 	snd_soc_dapm_widget_for_each_source_path(w, p) {
-- 
2.30.2

