Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 13F7D571ABA
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Jul 2022 15:01:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BCF9016B8;
	Tue, 12 Jul 2022 15:00:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BCF9016B8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657630886;
	bh=JaFVclrcD64NUOa+8XVObRCVQViS+O81pvwAl12wZ04=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=YgA9PM9+3yhgH2AVfM9bt3d/pRPdQVi7sJKa/3Cg5+MZVop6PjGDyxxyjAnDnyg/K
	 N5SoIsj58L+c1iOEJ251CtA1Fwvs6nYa9kCjXPI9Ka64Jadw8gz54U2UlR0a+FuGxP
	 D99oPPw9aBNbzQKwQa8c8PCBivOzN9CjZk0jOYn4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3D0A7F8023B;
	Tue, 12 Jul 2022 15:00:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B6EB0F80246; Tue, 12 Jul 2022 15:00:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 706F1F8012B
 for <alsa-devel@alsa-project.org>; Tue, 12 Jul 2022 15:00:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 706F1F8012B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="ZoF6dOu9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657630822; x=1689166822;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=JaFVclrcD64NUOa+8XVObRCVQViS+O81pvwAl12wZ04=;
 b=ZoF6dOu9NaJpsyEf0w5DMwUrCxRw1ETI78AdiY53XjdYB3i8aR195DIh
 i7GeQ3dv3/lUYbbIJqT/fGZJyh+dqvJPsZybo0QSpn6tPytKlctGW8BuA
 4N+5IhUPsK9QHrWB2xVameRhD3HrOiumNorOKrjQzAxXlP2F5GqMXlTCb
 ZgeGQlpLHrZfzpVtN0ywADRMtOlFYyzo3agymQo2fmWqZvrjiYT7dagrJ
 y/qs7RbYbE5ew8CKtTfqGtY/x2lkm0VcWXJE7fw04BfR5W60SEd4PRYvv
 8UaVvUumwW7VhC33M0umjZ7zYvkFTg8Lv044W+q2XUTR/L0LhiiP3PAVK g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10405"; a="371235312"
X-IronPort-AV: E=Sophos;i="5.92,265,1650956400"; d="scan'208";a="371235312"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2022 06:00:18 -0700
X-IronPort-AV: E=Sophos;i="5.92,265,1650956400"; d="scan'208";a="662943891"
Received: from ahedstro-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.249.254.175])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2022 06:00:16 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com
Subject: [PATCH] ASoC: SOF: ipc3-topology: Prevent double freeing of
 ipc_control_data via load_bytes
Date: Tue, 12 Jul 2022 16:01:03 +0300
Message-Id: <20220712130103.31514-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.37.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, seppo.ingalsuo@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com
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

We have sanity checks for byte controls and if any of the fail the locally
allocated scontrol->ipc_control_data is freed up, but not set to NULL.

On a rollback path of the error the higher level code will also try to free
the scontrol->ipc_control_data which will eventually going to lead to
memory corruption as double freeing memory is not a good thing.

Fixes: b5cee8feb1d4 ("ASoC: SOF: topology: Make control parsing IPC agnostic")
Reported-by: Seppo Ingalsuo <seppo.ingalsuo@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Seppo Ingalsuo <seppo.ingalsuo@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/ipc3-topology.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/sof/ipc3-topology.c b/sound/soc/sof/ipc3-topology.c
index 9448d5338423..b2cc046b9f60 100644
--- a/sound/soc/sof/ipc3-topology.c
+++ b/sound/soc/sof/ipc3-topology.c
@@ -1644,6 +1644,7 @@ static int sof_ipc3_control_load_bytes(struct snd_sof_dev *sdev, struct snd_sof_
 	return 0;
 err:
 	kfree(scontrol->ipc_control_data);
+	scontrol->ipc_control_data = NULL;
 	return ret;
 }
 
-- 
2.37.0

