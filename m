Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D69FD52F4C7
	for <lists+alsa-devel@lfdr.de>; Fri, 20 May 2022 23:07:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 54D4D16CA;
	Fri, 20 May 2022 23:06:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 54D4D16CA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653080857;
	bh=yYjAnH1dp0HZCKfEVdlZoxqq4j9Tl0It3Iy0wsyknRw=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=OPLxAdk2KZEo7j18QWCepeuiTTI/bIO41oXYSg3k+Ji0J64nV7CyzImG/cvapzheI
	 bDHEhzH66AIbzkYiMZdXvqi4zol1BY5Fc4DeCdsCKyNiIXGQSaSjgQRyXo0SI5nOi5
	 vo0SUp+EuW6r6tiYdwJabjh71KPMR6QKSanOVRDA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B7DBEF800F0;
	Fri, 20 May 2022 23:06:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C5670F8019D; Fri, 20 May 2022 23:06:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DB086F800D2
 for <alsa-devel@alsa-project.org>; Fri, 20 May 2022 23:06:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DB086F800D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="U8G0xeBJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1653080791; x=1684616791;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=yYjAnH1dp0HZCKfEVdlZoxqq4j9Tl0It3Iy0wsyknRw=;
 b=U8G0xeBJbWQj19SdD3alQAckxIDKDxifd7EfCljSqUKVCJBoXa+HxTdc
 axgKYo2ffREfwcxo4pd0M01kFhA6dqd1A/Y8sZZX0241sFUAoNA5ssQKg
 VmNVvbDEkmYXY/oDmdcCvQpk5Is28Swpi0eKJWprrQDnomR6v5y+HLx38
 Ko4a27+9gORScJSxs3h9YJkYCX2UvUOhMZdvipaXNqolDHNBbnxR35Pwt
 F/tToEWGUO22h2pl67DSOUeAsUX6YPlzCk+YLs6KEr6fvmQT1lmDgFHwv
 xsReyBaQGeid3fvpOy5YPaGoqPBP3mBkCAuiWIczReWSE3JS4hRIzvVAk w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10353"; a="298051280"
X-IronPort-AV: E=Sophos;i="5.91,240,1647327600"; d="scan'208";a="298051280"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2022 14:06:25 -0700
X-IronPort-AV: E=Sophos;i="5.91,240,1647327600"; d="scan'208";a="628354397"
Received: from achsu-mobl2.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.212.181.190])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2022 14:06:25 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: soc-pcm: fix BE transition for TRIGGER_START
Date: Fri, 20 May 2022 16:06:15 -0500
Message-Id: <20220520210615.607229-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.30.2
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

A obvious editing mistake caught with a cppcheck warning

sound/soc/soc-pcm.c:2132:8: style: Variable 'ret' is reassigned a
value before the old one has been used. [redundantAssignment]
   ret = soc_pcm_trigger(be_substream, cmd);
       ^
sound/soc/soc-pcm.c:2126:9: note: ret is assigned
    ret = soc_pcm_trigger(be_substream,
        ^
sound/soc/soc-pcm.c:2129:9: note: ret is assigned
    ret = soc_pcm_trigger(be_substream,
        ^

Fixes: 374b50e234a3e ('ASoC: soc-pcm: improve BE transition for TRIGGER_START')
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/soc-pcm.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 6f43db35a5c84..a827cc3c158ae 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -2128,8 +2128,6 @@ int dpcm_be_dai_trigger(struct snd_soc_pcm_runtime *fe, int stream,
 			else
 				ret = soc_pcm_trigger(be_substream,
 						      SNDRV_PCM_TRIGGER_START);
-
-			ret = soc_pcm_trigger(be_substream, cmd);
 			if (ret) {
 				be->dpcm[stream].be_start--;
 				goto next;
-- 
2.30.2

