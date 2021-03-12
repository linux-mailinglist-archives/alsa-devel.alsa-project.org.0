Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 92165339666
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Mar 2021 19:27:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2FC651787;
	Fri, 12 Mar 2021 19:26:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2FC651787
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615573643;
	bh=KGMHCXcmr+Y5V0bsaEmu39zjy6Y5jfjO14BymakGYfk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=e4Ro0HhKIwAM2rMWLDITd18k5nR6XiHEuhop2EuyPy65BGLsbHHzU2pjxcCbTUKxw
	 P3iiSudfWMZ/mwuCftvyTLwayl6KEgGO7Au6SqXV9IpIeHScEY5mDwufo8i/IBm1I/
	 JuySpaETBa+mjZkSgbEze1h8kf4R8MvUTCixoe1k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3CB04F8032D;
	Fri, 12 Mar 2021 19:23:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8CE74F800BF; Fri, 12 Mar 2021 19:23:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 887EBF8012A
 for <alsa-devel@alsa-project.org>; Fri, 12 Mar 2021 19:23:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 887EBF8012A
IronPort-SDR: gZdsPc9TmqDpxKnA6HBwMJIUtDdXoAoLNb53yWwqrXfYDL3z+lkvqPr1xTl8V3MbZGzzl4n30v
 MPFmWggfiG5Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9921"; a="185515183"
X-IronPort-AV: E=Sophos;i="5.81,244,1610438400"; d="scan'208";a="185515183"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2021 10:23:18 -0800
IronPort-SDR: yJ79O1B36TnWUtl7drVOzZFz+MfVI+WpZ2EYNR0BgAN0Urj+qMm4Z9pvhLNEkyDQFesv+bOZMD
 oOeQPI6aT8bg==
X-IronPort-AV: E=Sophos;i="5.81,244,1610438400"; d="scan'208";a="377791926"
Received: from amiteshs-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.37.30])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2021 10:23:14 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 06/23] ASoC: cx2070x: remove duplicate else branch
Date: Fri, 12 Mar 2021 12:22:29 -0600
Message-Id: <20210312182246.5153-7-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210312182246.5153-1-pierre-louis.bossart@linux.intel.com>
References: <20210312182246.5153-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, tiwai@suse.de,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, broonie@kernel.org
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

sound/soc/codecs/cx2072x.c:1436:10: style:inconclusive: Found
duplicate branches for 'if' and 'else'. [duplicateBranch]
  } else if (type & 0x4) {
         ^
sound/soc/codecs/cx2072x.c:1439:5: note: Found duplicate branches for
'if' and 'else'.
  } else {
    ^
sound/soc/codecs/cx2072x.c:1436:10: note: Found duplicate branches for
'if' and 'else'.
  } else if (type & 0x4) {
         ^

The last two branches do the same thing and can be collapsed together.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/codecs/cx2072x.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/cx2072x.c b/sound/soc/codecs/cx2072x.c
index d2d004654c9b..d924e3528029 100644
--- a/sound/soc/codecs/cx2072x.c
+++ b/sound/soc/codecs/cx2072x.c
@@ -1430,11 +1430,11 @@ static int cx2072x_jack_status_check(void *data)
 			state |= SND_JACK_HEADSET;
 			if (type & 0x2)
 				state |= SND_JACK_BTN_0;
-		} else if (type & 0x4) {
-			/* Nokia headset */
-			state |= SND_JACK_HEADPHONE;
 		} else {
-			/* Headphone */
+			/*
+			 * Nokia headset (type & 0x4) and
+			 * regular Headphone
+			 */
 			state |= SND_JACK_HEADPHONE;
 		}
 	}
-- 
2.25.1

