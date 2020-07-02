Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B251212B23
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Jul 2020 19:24:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 64FD516DD;
	Thu,  2 Jul 2020 19:23:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 64FD516DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593710673;
	bh=nbeQa9mCJ07yijbvXCM+wIr6HOa159Z5iS2Lf0CfvBY=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=nRGw0Ie1H+0WUiyy/86Aj/WczvMDgZtvXvp7bobA94vz9f9phu9j8hX8czkK056Ra
	 TYaH+DjOud2YC5grcbWj4sWRuOnyFjNJN7uRXBpxsoX5+W6lcgk/0kzZWwJBFH1aEe
	 JHsN07RMdQ8Kbyf49PG9olkkXhh3IgcuoYMSwkng=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6F75DF8027B;
	Thu,  2 Jul 2020 19:22:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 73786F80252; Thu,  2 Jul 2020 19:22:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EDF9BF800C1
 for <alsa-devel@alsa-project.org>; Thu,  2 Jul 2020 19:22:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EDF9BF800C1
IronPort-SDR: czlR4DGbkUuJ0fXO4AAUBV5jcFKgAFohAwZT7LXo1gCwkqiEYwaBB6LEucL3c8++VpGdGnoilH
 VYdWcIRIDBrw==
X-IronPort-AV: E=McAfee;i="6000,8403,9670"; a="144480285"
X-IronPort-AV: E=Sophos;i="5.75,304,1589266800"; d="scan'208";a="144480285"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2020 10:22:44 -0700
IronPort-SDR: zGf7UCYOgT1PjCmyQopJdaZlHON3M6CwouzjDSO9b21vFTmnhO6Ft7zahUvlul6GgSQTCl0Tfz
 ykWK43FEl1NA==
X-IronPort-AV: E=Sophos;i="5.75,304,1589266800"; d="scan'208";a="356521235"
Received: from nzbastur-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.255.231.182])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2020 10:22:43 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 0/6] ASoC: fsl: fix kernel-doc
Date: Thu,  2 Jul 2020 12:22:21 -0500
Message-Id: <20200702172227.164474-1-pierre-louis.bossart@linux.intel.com>
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

This cleanup patchset is only about kernel-doc, mostly trivial edits
and format correction.

Pierre-Louis Bossart (6):
  ASoC: fsl: fsl_ssi_dbg: remove spurious kernel-doc comment start
  ASoC: fsl: fsl_ssi: fix kernel-doc
  ASoC: fsl: fsl-asoc-card: fix kernel-doc
  ASoC: fsl: fsl_spdif: fix kernel-doc
  ASoC: fsl: fsl_asrc: fix kernel-doc
  ASoC: fsl: fsl_esai: fix kernel-doc

 sound/soc/fsl/fsl-asoc-card.c | 21 +++++------
 sound/soc/fsl/fsl_asrc.c      | 57 +++++++++++++++++++---------
 sound/soc/fsl/fsl_esai.c      | 32 +++++++++-------
 sound/soc/fsl/fsl_spdif.c     |  5 ++-
 sound/soc/fsl/fsl_ssi.c       | 70 ++++++++++++++++++++++-------------
 sound/soc/fsl/fsl_ssi_dbg.c   |  4 +-
 6 files changed, 115 insertions(+), 74 deletions(-)

-- 
2.25.1

