Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 110B71D5B4E
	for <lists+alsa-devel@lfdr.de>; Fri, 15 May 2020 23:17:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 905DB166A;
	Fri, 15 May 2020 23:16:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 905DB166A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589577455;
	bh=2yacj7lXigeQfd0d8EIUwA773RhwNUC5ae04EGbR79s=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Xs9TVbPdQOyzKSOpKJl2qVCrzlnIEKD4YrJAX+cvai+8KoL1rD5S9V1LXE3BfdvTq
	 w+yNadrD29GoxSlEn+b3d3z9KgrTQ6+5hK1B0GX6x8ylkYl6dyLWG3e2ANNiKG9bbj
	 cQkG8PkqolFAwj9Q1XHhxgS/LToxSEQbnHakgN1k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A8558F80253;
	Fri, 15 May 2020 23:15:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C20E6F800B8; Fri, 15 May 2020 23:15:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9BA1DF800B8
 for <alsa-devel@alsa-project.org>; Fri, 15 May 2020 23:15:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9BA1DF800B8
IronPort-SDR: tC4y/y0nte+6fYLHG32XwgIHca2D/GQFYO4WKTey4vsJPC5B1pqTa7IaQG1fQ9783lbmcQWA2J
 t/RPT3UBuoNA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2020 14:15:46 -0700
IronPort-SDR: Ok7XX4KIah8nE6TOF2o5QuSP45BhWbADsaNNIF1ItyHXQIeXu8a/CZHjFbapGXRgROQPLtw9wz
 CTFhsuxll0wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,396,1583222400"; d="scan'208";a="438454469"
Received: from btchambe-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.254.66.225])
 by orsmga005.jf.intel.com with ESMTP; 15 May 2020 14:15:46 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 0/3] ASoC: codecs: rt*-sdw: memory leaks and simplifications
Date: Fri, 15 May 2020 16:15:28 -0500
Message-Id: <20200515211531.11416-1-pierre-louis.bossart@linux.intel.com>
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

While debugging unrelated memory corruption errors, I detected issues
related to the interaction with the SoundWire and ASoC cores, here are
3 small patches to fix all this.

Pierre-Louis Bossart (3):
  ASoC: codecs: rt*-sdw: don't assign slave_ops
  ASoC: codecs: rt*-sdw: fix memory leak in set_sdw_stream()
  ASoC: codecs: rt1308-sdw: remove duplicate allocation

 sound/soc/codecs/rt1308-sdw.c | 11 +++--------
 sound/soc/codecs/rt5682-sdw.c |  3 ---
 sound/soc/codecs/rt5682.c     |  3 +++
 sound/soc/codecs/rt700-sdw.c  |  3 ---
 sound/soc/codecs/rt700.c      |  3 +++
 sound/soc/codecs/rt711-sdw.c  |  3 ---
 sound/soc/codecs/rt711.c      |  3 +++
 sound/soc/codecs/rt715-sdw.c  |  3 ---
 sound/soc/codecs/rt715.c      |  3 +++
 9 files changed, 15 insertions(+), 20 deletions(-)


base-commit: d731c1a0f935dbebf4a851e072f8c7309eb2b8c5
-- 
2.20.1

