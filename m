Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 78E5D627C24
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Nov 2022 12:21:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 129011672;
	Mon, 14 Nov 2022 12:20:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 129011672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668424902;
	bh=68PAqBYnUvu/fqZMf88RLtAc+gRZRR54749rdkZ+Zq4=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=t+0BoJXv7uTYT/lXyxlb6thdtUSmTOy4N2MiZZxxuuvyx6U+STC+UnVxNugPqUW88
	 Wh3NHh4DrxWlKlEg/2BFw9k2iDKXtgLxtF2U9Dv2yuyt9iMY2OKe3/GAi5ED0yqFYR
	 n3LRAPegKnYJRiMhPaJFmXA9VuyAjdT8swJEBTds=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 75332F8049E;
	Mon, 14 Nov 2022 12:20:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 268B5F800B6; Mon, 14 Nov 2022 12:20:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_DNSWL_MED,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3458CF800B6
 for <alsa-devel@alsa-project.org>; Mon, 14 Nov 2022 12:20:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3458CF800B6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="jRf93uLr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668424843; x=1699960843;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=68PAqBYnUvu/fqZMf88RLtAc+gRZRR54749rdkZ+Zq4=;
 b=jRf93uLrw2KeHMZQ4c/7ugeuJZJUMMHfIKosnBGdoqADsCALYgCExTkp
 CygZtD4iEZIyOZHyR4mRm5MEk9notcgUyVA9/1Fn8RFx/yWQwPhrd3NQV
 irUz9Rn2MlGQ2CEkBj+N/jVelDLl5Ek/a2ooL4a4/C0MeyxTLRwF37rgx
 Zf9dbLZTpzwLXyuqyO6scuKvczs9IFZg1n7aesZN655xIT8Oqk5VklHW5
 UWSC5gKaQqn/fftaEG0EqjwbFsaxWEtqc2Ft95sHSHdxiz599+rYw2wdX
 HjVRSPpX+AJ8/hFJUO/to38CHgEvMuNc++vkZtX13gv+AuNWpJ4DpA2XL Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10530"; a="313748201"
X-IronPort-AV: E=Sophos;i="5.96,161,1665471600"; d="scan'208";a="313748201"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2022 03:20:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10530"; a="744102987"
X-IronPort-AV: E=Sophos;i="5.96,161,1665471600"; d="scan'208";a="744102987"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga002.fm.intel.com with ESMTP; 14 Nov 2022 03:20:36 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH v2 0/2] ASoC: Intel: avs: DSP recovery and resume fixes
Date: Mon, 14 Nov 2022 12:37:27 +0100
Message-Id: <20221114113729.1022905-1-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 pierre-louis.bossart@linux.intel.com, tiwai@suse.com, hdegoede@redhat.com,
 amadeuszx.slawinski@linux.intel.com
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

Two fixes that are result of the recent discussions [1][2].

First adds missing locking around snd_pcm_stop() while the second fix
sets substream state to DISCONNECTED if any suspend/resume related
operation fails so that userspace has means to be aware that something
went wrong during said operation.

Changes in v2:
- __snd_pcm_set_state() replaced direct assignments of PCM state


[1]: https://lore.kernel.org/alsa-devel/73e6425f-8e51-e26f-ad83-ccc5df517a43@intel.com/
[2]: https://lore.kernel.org/alsa-devel/20221104131244.3920179-1-cezary.rojewski@intel.com/

Cezary Rojewski (2):
  ASoC: Intel: avs: Lock substream before snd_pcm_stop()
  ASoC: Intel: avs: Disconnect substream if suspend or resume fails

 sound/soc/intel/avs/ipc.c |  2 ++
 sound/soc/intel/avs/pcm.c | 10 ++++++++--
 2 files changed, 10 insertions(+), 2 deletions(-)

-- 
2.25.1

