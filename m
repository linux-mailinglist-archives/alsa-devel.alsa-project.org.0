Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 92A0C478055
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Dec 2021 00:13:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1F43F1F76;
	Fri, 17 Dec 2021 00:12:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1F43F1F76
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639696380;
	bh=y7oQs4SeEdjYcnmISQnQCpDaKzD+WPuz+9UDYKRRscs=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=p8+7XKoTFwiLefNZYqJCYSt6gBPCni0HuP6kdhuo4AaRCQ9u+RIDHNaiYQ47HB0cE
	 LMDE9vcPwyoG1M5jzflUAsJFUxcVbooWdMsYx4pQfG0RMqoBYXEAktc7h+V5bJ740L
	 m+syGM95/vxvsT3EGX0L67mbdbIHDKNCvnS0dr4A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 91B76F8014C;
	Fri, 17 Dec 2021 00:11:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E8F91F800B0; Fri, 17 Dec 2021 00:11:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D2D67F800B0
 for <alsa-devel@alsa-project.org>; Fri, 17 Dec 2021 00:11:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D2D67F800B0
X-IronPort-AV: E=McAfee;i="6200,9189,10200"; a="303002697"
X-IronPort-AV: E=Sophos;i="5.88,212,1635231600"; d="scan'208";a="303002697"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2021 15:11:41 -0800
X-IronPort-AV: E=Sophos;i="5.88,212,1635231600"; d="scan'208";a="756278646"
Received: from priyosmi-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.100.174])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2021 15:11:40 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 0/2] ALSA/ASoC: hdac_ext cleanups
Date: Thu, 16 Dec 2021 17:11:26 -0600
Message-Id: <20211216231128.344321-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Cezary Rojewski <cezary.rojewski@intel.com>,
 broonie@kernel.org,
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

One function moved since it doesn't use the hdac_ext parts, and
renaming of variables to identify when hdac_stream and
hdac_ext_streams are used.

No functionality change.

Pierre-Louis Bossart (2):
  ALSA/ASoC: hda: move/rename snd_hdac_ext_stop_streams to hdac_stream.c
  ALSA: HDA: hdac_ext_stream: use consistent prefixes for variables

 include/sound/hdaudio.h         |   1 +
 include/sound/hdaudio_ext.h     |  27 ++--
 sound/hda/ext/hdac_ext_stream.c | 216 +++++++++++++++-----------------
 sound/hda/hdac_stream.c         |  16 +++
 sound/soc/intel/skylake/skl.c   |   4 +-
 5 files changed, 132 insertions(+), 132 deletions(-)

-- 
2.25.1

