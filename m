Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D5432D738D
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Dec 2020 11:12:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 545CE1738;
	Fri, 11 Dec 2020 11:11:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 545CE1738
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607681537;
	bh=rstGelckiBA+mWW6H5627BkygkOL8ozsmVr2tHVFsBc=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=VdoOatBTiDh3J7AcACAVj+UggppaUvD6u232p1VJYmrcvHhkRK+C/CydJQcnos3Hd
	 JIKwljucSpt6iKKsTZVur5DE3lPJkRlFdy8SNF3StYtEhi3VGUCfnZY+BgiYneDptN
	 ZTHXbDKRWnIBwe/ZnMfNBbK/2i+h6+CDu1tHfUd4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 31412F804B0;
	Fri, 11 Dec 2020 11:10:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E1F0DF802BE; Fri, 11 Dec 2020 11:10:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4D920F80217
 for <alsa-devel@alsa-project.org>; Fri, 11 Dec 2020 11:10:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4D920F80217
IronPort-SDR: MzzsuYIOuVSIhu5jZ5yPuzXKJmJhMIqwAk/QSFiiM9FH/zh2rqgX9arUC9Vn9ZzZjZ1k5TPOTp
 0ikEwZaKL1gQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9831"; a="174554239"
X-IronPort-AV: E=Sophos;i="5.78,411,1599548400"; d="scan'208";a="174554239"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2020 02:10:24 -0800
IronPort-SDR: 7syldEva8VzKuOtrIMNYMiKi7Ij+8rFWfnz9Uh8iPxVfBl71VdlFB/dIHtuFc/s682dmdWBtWv
 OEWy6BWHRiPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,411,1599548400"; d="scan'208";a="376450936"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by orsmga007.jf.intel.com with ESMTP; 11 Dec 2020 02:10:22 -0800
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 0/3] ASoC: SOF: Intel: fix to dsp state dump trace levels
Date: Fri, 11 Dec 2020 12:07:40 +0200
Message-Id: <20201211100743.3188821-1-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: lgirdwood@gmail.com, daniel.baluta@nxp.com,
 pierre-louis.bossart@linux.intel.com, kai.vehmanen@linux.intel.com,
 ranjani.sridharan@linux.intel.com
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

Small series that addresses a problem where DSP status dump
for a failure case, ends up being printed as as debug print. This
is important information for any bug report. While at it, the series
contains a few cleanups to related code.

Ranjani Sridharan (3):
  ASoC: SOF: Intel: hda: remove duplicated status dump
  ASoC: SOF: modify the SOF_DBG flags
  ASoC: SOF: Intel: hda: fix the condition passed to sof_dev_dbg_or_err

 sound/soc/sof/debug.c            |  2 +-
 sound/soc/sof/intel/byt.c        |  2 +-
 sound/soc/sof/intel/hda-loader.c | 19 +++++++++++++------
 sound/soc/sof/intel/hda.c        | 10 ++++------
 sound/soc/sof/loader.c           |  4 ++--
 sound/soc/sof/ops.c              |  2 +-
 sound/soc/sof/sof-priv.h         | 13 ++++++++-----
 7 files changed, 30 insertions(+), 22 deletions(-)

-- 
2.29.2

