Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 204FF1F7E25
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Jun 2020 22:42:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A3496166E;
	Fri, 12 Jun 2020 22:42:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A3496166E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591994576;
	bh=SEOlssAcypcUoTT/zWIlT/yYN2A5Ofj//rjLbdVfvYE=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=HSSmDf9TwlY1QgkagyWuAXE7kJ7ENSVJOkqJ7dfoxQrJD+HCV18oTX52QzEtuxOUG
	 cqn+T1l9f90liLv92oPMMwoaiQfsLhO09LcssVTAQ8o12hpJYdf89gt+t17m6GsdiH
	 t1AZ0c7rZ2YLLKMy9FDJ4RC4E+mETXYihSj7XjyA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ACA61F8024A;
	Fri, 12 Jun 2020 22:41:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 068E0F800C7; Fri, 12 Jun 2020 22:41:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E2954F800C7
 for <alsa-devel@alsa-project.org>; Fri, 12 Jun 2020 22:41:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E2954F800C7
IronPort-SDR: XbED4GgTtpt/m2xFgumdURiWl24Ksyfk2SKDYNic8cG24nkaxYKmyOK87GODNz0+7/tTWTS+vZ
 nDeJra4IcA4A==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2020 13:41:07 -0700
IronPort-SDR: u1yIvM1CD7b3NAP5yfh/aNQsbfQ6Goxs2yu6kG8rhmnW1KjrABTUqvnvToEi0hTtd5md83hYNd
 q9+gAe0awoWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,504,1583222400"; d="scan'208";a="272022963"
Received: from tcampell-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.255.231.137])
 by orsmga003.jf.intel.com with ESMTP; 12 Jun 2020 13:41:06 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 0/3] ASoC: improve core dmesg logs and verbosity
Date: Fri, 12 Jun 2020 15:40:47 -0500
Message-Id: <20200612204050.25901-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
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

Try to both reduce useless verbosity and keep useful error reports.

Pierre-Louis Bossart (3):
  ASoC: soc-core: reduce verbosity of BE override message
  ASoC: soc-pcm: improve error messages in soc_pcm_new()
  ASoC: soc-pcm/compress: reduce verbosity on mapping ok messages

 sound/soc/soc-compress.c |  4 ++--
 sound/soc/soc-core.c     |  4 ++--
 sound/soc/soc-pcm.c      | 13 +++++++------
 3 files changed, 11 insertions(+), 10 deletions(-)

-- 
2.20.1

