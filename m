Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BE213E08BE
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Aug 2021 21:27:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7D28E169A;
	Wed,  4 Aug 2021 21:26:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7D28E169A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628105226;
	bh=0b+LxiSwOJL+lbwy+HqvR0PdOsnD82BO0RoWCCPeKqA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cAjesAQHDkuA9mHeRupT1pL21fs4OOAHtsArA30KO8UmyAmaC5fRYexJnD9AvkG91
	 fMnXrFcML155WKCLiBcNT+M1MCvpMs7X/LSgC57q+e/ndin0r3P/iEj823EFhnTgHb
	 /TjToA9/53O83D0HfNC/ZcfEfj/IUUr86l+G6PdU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 598F6F801F7;
	Wed,  4 Aug 2021 21:25:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 56122F802C4; Wed,  4 Aug 2021 21:25:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7D6A0F8010A
 for <alsa-devel@alsa-project.org>; Wed,  4 Aug 2021 21:25:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7D6A0F8010A
X-IronPort-AV: E=McAfee;i="6200,9189,10066"; a="235952804"
X-IronPort-AV: E=Sophos;i="5.84,295,1620716400"; d="scan'208";a="235952804"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2021 12:25:10 -0700
X-IronPort-AV: E=Sophos;i="5.84,295,1620716400"; d="scan'208";a="569142452"
Received: from ccho-mobl.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.209.189.253])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2021 12:25:10 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/3] ASoC: max98090: remove duplicate status reads and useless
 assignmment
Date: Wed,  4 Aug 2021 14:24:54 -0500
Message-Id: <20210804192456.278702-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210804192456.278702-1-pierre-louis.bossart@linux.intel.com>
References: <20210804192456.278702-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
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

The logic for the jack detection has not changed since the first
commit for this driver. Remove a duplicate read and remove useless
assignment

sound/soc/codecs/max98090.c:2170:6: style: Variable 'reg' is
reassigned a value before the old one has been
used. [redundantAssignment]
 reg = snd_soc_component_read(component, M98090_REG_JACK_STATUS);
     ^

sound/soc/codecs/max98090.c:2161:7: note: reg is assigned
  reg = snd_soc_component_read(component, M98090_REG_JACK_STATUS);
      ^

sound/soc/codecs/max98090.c:2170:6: note: reg is overwritten
 reg = snd_soc_component_read(component, M98090_REG_JACK_STATUS);
     ^

sound/soc/codecs/max98090.c:2170:6: style: Variable 'reg' is
reassigned a value before the old one has been
used. [redundantAssignment]
 reg = snd_soc_component_read(component, M98090_REG_JACK_STATUS);
     ^

sound/soc/codecs/max98090.c:2167:7: note: reg is assigned
  reg = snd_soc_component_read(component, M98090_REG_JACK_STATUS);
      ^

sound/soc/codecs/max98090.c:2170:6: note: reg is overwritten
 reg = snd_soc_component_read(component, M98090_REG_JACK_STATUS);
     ^

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/codecs/max98090.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/sound/soc/codecs/max98090.c b/sound/soc/codecs/max98090.c
index bc30a1dc7530..b45ec35cd63c 100644
--- a/sound/soc/codecs/max98090.c
+++ b/sound/soc/codecs/max98090.c
@@ -2158,13 +2158,11 @@ static void max98090_jack_work(struct work_struct *work)
 
 		msleep(50);
 
-		reg = snd_soc_component_read(component, M98090_REG_JACK_STATUS);
+		snd_soc_component_read(component, M98090_REG_JACK_STATUS);
 
 		/* Weak pull up allows only insertion detection */
 		snd_soc_component_update_bits(component, M98090_REG_JACK_DETECT,
 			M98090_JDWK_MASK, M98090_JDWK_MASK);
-	} else {
-		reg = snd_soc_component_read(component, M98090_REG_JACK_STATUS);
 	}
 
 	reg = snd_soc_component_read(component, M98090_REG_JACK_STATUS);
-- 
2.25.1

