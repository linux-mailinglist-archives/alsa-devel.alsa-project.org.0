Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A89A34B1C9
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Mar 2021 23:04:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1A989167B;
	Fri, 26 Mar 2021 23:04:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1A989167B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616796293;
	bh=f9qmsNUc0jj83jPt03XRRrAKuS+hKxvppDPmVhyl8sM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=f+N8+lyOuaGcXvWRDerEdUe3jm1Lw8z+f51mLmkH6+37IapbqjYV1gnpiWdI3xaYz
	 DoSfN3uRkm6kz8EGqNrXjUKTj1jbJBuCwlQ03mMIS7yHEXx5aZkaq/fXmkkINfq+uo
	 6Wq+qUZsbWyYFuJ2v7M7WvpKWVw9VuzA0i/gSCwk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2A189F804E0;
	Fri, 26 Mar 2021 23:00:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 50725F80156; Fri, 26 Mar 2021 23:00:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1364BF8032C
 for <alsa-devel@alsa-project.org>; Fri, 26 Mar 2021 23:00:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1364BF8032C
IronPort-SDR: 4xL/P/XbPeYvUQLzLuSSHW4s0uQl0rXBrTMPakovk0kIUKq1RkekrQRgIoYN7PRYgLc1aDTw/a
 2sB+efStrVcw==
X-IronPort-AV: E=McAfee;i="6000,8403,9935"; a="211396722"
X-IronPort-AV: E=Sophos;i="5.81,281,1610438400"; d="scan'208";a="211396722"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2021 15:00:07 -0700
IronPort-SDR: pN/1xZugGRK4FmXCaX5DbIjro6qYN2CO3AN2B868fvbV9d9cuop8ag3Jy2dcFwhpH6hDq9Qnzv
 Ftj5AihvMCDQ==
X-IronPort-AV: E=Sophos;i="5.81,281,1610438400"; d="scan'208";a="416706816"
Received: from zcmahone-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.255.231.203])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2021 15:00:06 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 09/17] ASoC: sti: uniperif: align function prototypes
Date: Fri, 26 Mar 2021 16:59:19 -0500
Message-Id: <20210326215927.936377-10-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210326215927.936377-1-pierre-louis.bossart@linux.intel.com>
References: <20210326215927.936377-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, tiwai@suse.de,
 Takashi Iwai <tiwai@suse.com>, Arnaud Pouliquen <arnaud.pouliquen@st.com>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 broonie@kernel.org
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

cppcheck warning:

sound/soc/sti/uniperif_player.c:1049:24: style:inconclusive: Function
'uni_player_init' argument 2 names different: declaration 'uni_player'
definition 'player'. [funcArgNamesDifferent]
      struct uniperif *player)
                       ^
sound/soc/sti/uniperif.h:1375:24: note: Function 'uni_player_init'
argument 2 names different: declaration 'uni_player' definition
'player'.
      struct uniperif *uni_player);
                       ^
sound/soc/sti/uniperif_player.c:1049:24: note: Function
'uni_player_init' argument 2 names different: declaration 'uni_player'
definition 'player'.
      struct uniperif *player)
                       ^
sound/soc/sti/uniperif_reader.c:411:24: style:inconclusive: Function
'uni_reader_init' argument 2 names different: declaration 'uni_reader'
definition 'reader'. [funcArgNamesDifferent]
      struct uniperif *reader)
                       ^
sound/soc/sti/uniperif.h:1380:24: note: Function 'uni_reader_init'
argument 2 names different: declaration 'uni_reader' definition
'reader'.
      struct uniperif *uni_reader);
                       ^
sound/soc/sti/uniperif_reader.c:411:24: note: Function
'uni_reader_init' argument 2 names different: declaration 'uni_reader'
definition 'reader'.
      struct uniperif *reader)
                       ^

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sti/uniperif.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sti/uniperif.h b/sound/soc/sti/uniperif.h
index a16adeb7c1e9..2a5de328501c 100644
--- a/sound/soc/sti/uniperif.h
+++ b/sound/soc/sti/uniperif.h
@@ -1372,12 +1372,12 @@ static __maybe_unused const struct snd_pcm_hardware uni_tdm_hw = {
 
 /* uniperiph player*/
 int uni_player_init(struct platform_device *pdev,
-		    struct uniperif *uni_player);
+		    struct uniperif *player);
 int uni_player_resume(struct uniperif *player);
 
 /* uniperiph reader */
 int uni_reader_init(struct platform_device *pdev,
-		    struct uniperif *uni_reader);
+		    struct uniperif *reader);
 
 /* common */
 int sti_uniperiph_dai_set_fmt(struct snd_soc_dai *dai,
-- 
2.25.1

