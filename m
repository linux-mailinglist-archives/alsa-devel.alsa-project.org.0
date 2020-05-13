Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 222B81D0525
	for <lists+alsa-devel@lfdr.de>; Wed, 13 May 2020 04:46:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CF5FA1612;
	Wed, 13 May 2020 04:45:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CF5FA1612
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589337966;
	bh=v0kEQhLdT7FVnFxjgKOmMGfDWAHbax/YJldtStEgrWk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vXsEWD8zM/fQrjFRUekXdfG3iUWCMD+2VM+ZnwKMo3fW08RQBInBZcjudpMPHftjL
	 ZOvQm3MXpQPxpPYAnf46ZM+CNwLepX7sWMV+kJ0NnlKeVAnQuwFvBIDn78PNvvnFxO
	 1G4TZZ0kfmE8yWTgYJIjN/9kkTpT1tgJlr5oiErM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F2E94F800E3;
	Wed, 13 May 2020 04:44:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EBA04F80253; Wed, 13 May 2020 04:44:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 72166F800E3
 for <alsa-devel@alsa-project.org>; Wed, 13 May 2020 04:44:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 72166F800E3
IronPort-SDR: 9DInigo6NiH5Fsfx5MMZAU8gH3wrLx+M+gj85kNdtRe5gJ6s+4eKvLPwZrqRsoGQe6vzpSYru2
 bTe1wcVYeIKQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2020 19:44:12 -0700
IronPort-SDR: VgJhAFyk7jqkq1LTmDAaCIDTeLhFZxo3J1WfoET14CTdjADkiRKEIkly0Zx0svTZoPttO+vOLc
 vZkc+4Ct8J0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,385,1583222400"; d="scan'208";a="251100839"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
 by orsmga007.jf.intel.com with ESMTP; 12 May 2020 19:44:11 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
 (envelope-from <lkp@intel.com>)
 id 1jYhNS-0003Tr-Bx; Wed, 13 May 2020 10:44:10 +0800
Date: Wed, 13 May 2020 10:43:23 +0800
From: kbuild test robot <lkp@intel.com>
To: Keyon Jie <yang.jie@linux.intel.com>, alsa-devel@alsa-project.org
Subject: [RFC PATCH] ASoC: topology: elem_load[] can be static
Message-ID: <20200513024323.GA30719@f5a3dcfd553e>
References: <20200512182319.118995-1-yang.jie@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200512182319.118995-1-yang.jie@linux.intel.com>
X-Patchwork-Hint: ignore
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: tiwai@suse.de, Keyon Jie <yang.jie@linux.intel.com>, broonie@kernel.org,
 kbuild-all@lists.01.org, pierre-louis.bossart@linux.intel.com
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


Signed-off-by: kbuild test robot <lkp@intel.com>
---
 soc-topology.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
index b3dae319c1086..70c0ff7ce13ff 100644
--- a/sound/soc/soc-topology.c
+++ b/sound/soc/soc-topology.c
@@ -2636,7 +2636,7 @@ static int soc_tplg_manifest_load(struct soc_tplg *tplg,
 	return ret;
 }
 
-int (*elem_load[])(struct soc_tplg *, struct snd_soc_tplg_hdr *) = {
+static int (*elem_load[])(struct soc_tplg *, struct snd_soc_tplg_hdr *) = {
 	[SOC_TPLG_PASS_MANIFEST]	= soc_tplg_manifest_load,
 	[SOC_TPLG_PASS_VENDOR]		= soc_tplg_vendor_load,
 	[SOC_TPLG_PASS_MIXER]		= soc_tplg_kcontrol_elems_load,
