Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 73F3021798F
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jul 2020 22:40:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EFCEE168A;
	Tue,  7 Jul 2020 22:39:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EFCEE168A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594154411;
	bh=v0n5SorUvgc3WMov+zgkFXdNzi7jVbEZ9oWyewGJHsg=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=m3baFL+ePHpWHqL6bokDNrg/5PwST5cqEC77x4qSJnLjTkWk5xQzVlxPodMc84F1x
	 Q5FM7n5c+fx+dX8PnCZNKS7cJT9747n7rwEB6enqZslsgz9rR7kDeXBh06q/BPWR2R
	 wWgOcrz4oaq3DIRawcDetw+oCLieoJMT8N65zJSk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 19645F80264;
	Tue,  7 Jul 2020 22:38:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 13E5EF80274; Tue,  7 Jul 2020 22:38:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BF2E3F800DF
 for <alsa-devel@alsa-project.org>; Tue,  7 Jul 2020 22:38:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BF2E3F800DF
IronPort-SDR: 2+0jmfqvbb9leXkVloWYeyPOyztVuw8dFnQWwAx4kKKcPpaj66Xhqojr3hOiTrlEswz8MRPrWj
 5d1fTWTYWCOg==
X-IronPort-AV: E=McAfee;i="6000,8403,9675"; a="147700564"
X-IronPort-AV: E=Sophos;i="5.75,325,1589266800"; d="scan'208";a="147700564"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2020 13:38:21 -0700
IronPort-SDR: /0rd/GC6OuC8Q1ZtJdcp6Mw5SM+WxxQxDEXi6jlCPSn7kuQdHWI9gL6h1M3gPhsDQWm2fTwu9X
 g42UwvveGNUA==
X-IronPort-AV: E=Sophos;i="5.75,325,1589266800"; d="scan'208";a="483640802"
Received: from colvinch-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.255.229.3])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2020 13:38:20 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 0/5] ASoC: topology: fix error handling flow
Date: Tue,  7 Jul 2020 15:37:44 -0500
Message-Id: <20200707203749.113883-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
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

While experimenting and introducing errors in Baytrail topology files
until I got them right, I encountered multiple kernel oopses and
memory leaks. This is a first batch to harden the code, but we should
probably think of a tool to fuzz the topology...

Pierre-Louis Bossart (5):
  ASoC: topology: fix kernel oops on route addition error
  ASoC: topology: fix tlvs in error handling for widget_dmixer
  ASoC: topology: use break on errors, not continue
  ASoC: topology: factor kfree(se) in error handling
  ASoC: topology: add more logs when topology load fails.

 sound/soc/soc-topology.c | 97 ++++++++++++++++++++++++----------------
 1 file changed, 58 insertions(+), 39 deletions(-)


base-commit: a5911ac5790acaf98c929b826b3f7b4a438f9759
-- 
2.25.1

