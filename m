Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 61B8D52F4F4
	for <lists+alsa-devel@lfdr.de>; Fri, 20 May 2022 23:20:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F3D581725;
	Fri, 20 May 2022 23:19:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F3D581725
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653081614;
	bh=YN5SNnQ5Xu00AA94sT5Tk3tM9oNYubjc3Q6iQWMLRMI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uFoMYBeOg7IK+IKlaqINncIT96yi4q/XYCEF8lfkKukAnJZNrWSFcvSNyPrzgdf8W
	 7gH1PjVQ0cDKgYwTOYsU0QPA9UoBzZqEcV7dwLgi4sgqONvzbU1xCtUdInIfWLZ/CR
	 wYWv5xyH01JTTRiTrobBLbbaJkwm7uwwm5qEBUHA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D8761F8051F;
	Fri, 20 May 2022 23:17:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0C38BF80537; Fri, 20 May 2022 23:17:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A2913F80240
 for <alsa-devel@alsa-project.org>; Fri, 20 May 2022 23:17:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A2913F80240
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="jnNUHoh0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1653081460; x=1684617460;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YN5SNnQ5Xu00AA94sT5Tk3tM9oNYubjc3Q6iQWMLRMI=;
 b=jnNUHoh0z8t18dt33wzVbK7DhGAOsOFi4LBmRH3YeaDFt2W9CBJmF0I3
 KB9WBlECD4UhYJ1wHYObG+Fn7plJG/WcVJS+nwv+5JHWQj23yY4gt0Z4Y
 LeXZ0o79/kcKcFj+UfkjHEFbmo2/isiuZB52DhrHsPiynkug19Bd5wX0d
 HT90TebWo5c3J+kwZZQJ8UlUDHdhrMKURCufM8CaYZatlR1E+MfglZhPW
 Vux6wF0qY+QwKvoyNElLZFyBjggS3pqmDQWjAZlg0ovh6+A5z4yAT56Pn
 IXi+zpIVBwU+3YmQ5mdi/zJTaXM6uk3hA3paVRSlNaaCIvxoXxuLqca27 g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10353"; a="270324222"
X-IronPort-AV: E=Sophos;i="5.91,240,1647327600"; d="scan'208";a="270324222"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2022 14:17:32 -0700
X-IronPort-AV: E=Sophos;i="5.91,240,1647327600"; d="scan'208";a="674796011"
Received: from achsu-mobl2.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.212.181.190])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2022 14:17:31 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 02/16] ASoC: cs42l42: remove redundant test
Date: Fri, 20 May 2022 16:17:05 -0500
Message-Id: <20220520211719.607543-3-pierre-louis.bossart@linux.intel.com>
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

cppcheck warning:

sound/soc/codecs/cs42l42.c:1704:28: style: The statement 'if
(cs42l42->plug_state!=CS42L42_TS_TRANS)
cs42l42->plug_state=CS42L42_TS_TRANS' is logically equivalent to
'cs42l42->plug_state=CS42L42_TS_TRANS'. [duplicateConditionalAssign]
   if (cs42l42->plug_state != CS42L42_TS_TRANS)
                           ^
sound/soc/codecs/cs42l42.c:1705:25: note: Assignment
'cs42l42->plug_state=CS42L42_TS_TRANS'
    cs42l42->plug_state = CS42L42_TS_TRANS;
                        ^

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/codecs/cs42l42.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/codecs/cs42l42.c b/sound/soc/codecs/cs42l42.c
index 4fade23887972..6ca74c0d46eaa 100644
--- a/sound/soc/codecs/cs42l42.c
+++ b/sound/soc/codecs/cs42l42.c
@@ -1701,8 +1701,7 @@ static irqreturn_t cs42l42_irq_thread(int irq, void *data)
 			break;
 
 		default:
-			if (cs42l42->plug_state != CS42L42_TS_TRANS)
-				cs42l42->plug_state = CS42L42_TS_TRANS;
+			cs42l42->plug_state = CS42L42_TS_TRANS;
 		}
 	}
 
-- 
2.30.2

