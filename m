Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AD3EC12EAC0
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Jan 2020 21:02:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 287D516AA;
	Thu,  2 Jan 2020 21:01:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 287D516AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1577995320;
	bh=gX0mcKzz9oxMLwiRMNKYKs5jubhHyaDFbrnlb5d0OM4=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=DpsRPs9zjK7Izj4GqBijFwZg/LNkJfDTKSWnoNyDNlLEN1ZrtPAEJOcCaFNJ4OOCO
	 G+AOIGYUpx2yiexLqXOxG4WrbGI4OtIoJ+kRG5MW2GTQ61ReIjHhtJljTrnU/SFHwX
	 xOb6wxJZLzW7WYizO0evlkn1C+ino6zO2SNY86FQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4C606F8011E;
	Thu,  2 Jan 2020 21:00:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 18ADEF8011E; Thu,  2 Jan 2020 21:00:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AA1EAF8011E
 for <alsa-devel@alsa-project.org>; Thu,  2 Jan 2020 21:00:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AA1EAF8011E
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 02 Jan 2020 12:00:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,388,1571727600"; d="scan'208";a="252353245"
Received: from mjamatan-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.254.98.106])
 by fmsmga002.fm.intel.com with ESMTP; 02 Jan 2020 12:00:05 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Thu,  2 Jan 2020 13:59:50 -0600
Message-Id: <20200102195952.9465-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: tiwai@suse.de, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH 0/2] ASoC: fix warnings in Intel boards and
	topology
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Sparse reports a number of straightforward issues, fix.

I still see a small number of issues but I can't figure out why big-
and little-endian parts were mixed - this looks buggy at best:

sound/soc/soc-ops.c:650:33: warning: invalid assignment: &=
sound/soc/soc-ops.c:650:33: left side has type unsigned short
sound/soc/soc-ops.c:650:33: right side has type restricted __be16
sound/soc/soc-ops.c:654:33: warning: invalid assignment: &=
sound/soc/soc-ops.c:654:33: left side has type unsigned int
sound/soc/soc-ops.c:654:33: right side has type restricted __be32
sound/soc/soc-topology.c:2546:16: warning: restricted __le32 degrades to integer

Pierre-Louis Bossart (2):
  ASoC: Intel: boards: hda_dsp_common: use NULL pointer assignment, not
    0
  ASoC: soc-topology: fix endianness issues

 sound/soc/intel/boards/hda_dsp_common.c |  2 +-
 sound/soc/soc-topology.c                | 42 +++++++++++++------------
 2 files changed, 23 insertions(+), 21 deletions(-)

-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
