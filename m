Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FBFE35A8A5
	for <lists+alsa-devel@lfdr.de>; Sat, 10 Apr 2021 00:14:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B32DD1691;
	Sat, 10 Apr 2021 00:14:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B32DD1691
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618006493;
	bh=aRDsZUylmtXViXiAkdF5bGS5c0n/29kO1KhfUtVNThY=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=F8nwTpR2dbrt0mLjjI7GffzWkInN+oEkQeG1UzKQ/gd+Qd6lJr92nAbh6mU57v5o6
	 eqt3e6lW7OAvPwqetnbfau9pjHOL99X+IAostZwZRCUIixeKR2QEwYgn+36Yqke4Wh
	 vJKqv5p7J4VJSh8sWNfWxS+5RoY6xB4x7sEuTETI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7478BF800EE;
	Sat, 10 Apr 2021 00:13:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CA21FF8016A; Sat, 10 Apr 2021 00:13:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3C2DAF800EE
 for <alsa-devel@alsa-project.org>; Sat, 10 Apr 2021 00:13:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3C2DAF800EE
IronPort-SDR: 9YS5t+tJ5OSCCnAgrY5MckT5mU3zQicGRCidz2p5EUbiZyMRkj+tZ40A8quoknMk64Ai8AG/OA
 WIMSu3OEwwwA==
X-IronPort-AV: E=McAfee;i="6000,8403,9949"; a="173932922"
X-IronPort-AV: E=Sophos;i="5.82,210,1613462400"; d="scan'208";a="173932922"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2021 15:13:13 -0700
IronPort-SDR: GUxam000rX4VdGEJtV/oBIypmQGpCZzBhTJuvSlgRaej0MhL1Dqbn0aYQRfZ8qj5dhh0OMhRed
 krdY9p5Vyzdg==
X-IronPort-AV: E=Sophos;i="5.82,210,1613462400"; d="scan'208";a="599293407"
Received: from ukorat-mobl2.amr.corp.intel.com (HELO rsridh-mobl1.localdomain)
 ([10.212.104.152])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2021 15:13:12 -0700
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: SOF: Kconfig: fix typo of SND_SOC_SOF_PCI
Date: Fri,  9 Apr 2021 15:13:08 -0700
Message-Id: <20210409221308.1544000-1-ranjani.sridharan@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Libin Yang <libin.yang@intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, tiwai@suse.de,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, broonie@kernel.org
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

From: Libin Yang <libin.yang@intel.com>

It should be 'endif ## SND_SOC_SOF_PCI' instead of
'endif ## SND_SOC_SOF_INTEL_PCI'

Signed-off-by: Libin Yang <libin.yang@intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/intel/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sof/intel/Kconfig b/sound/soc/sof/intel/Kconfig
index da1c396f529d..4bce89b5ea40 100644
--- a/sound/soc/sof/intel/Kconfig
+++ b/sound/soc/sof/intel/Kconfig
@@ -293,6 +293,6 @@ config SND_SOC_SOF_INTEL_SOUNDWIRE
 	  Say Y if you want to enable SoundWire links with SOF.
 	  If unsure select "N".
 
-endif ## SND_SOC_SOF_INTEL_PCI
+endif ## SND_SOC_SOF_PCI
 
 endif ## SND_SOC_SOF_INTEL_TOPLEVEL
-- 
2.25.1

