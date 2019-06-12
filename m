Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DB9B642587
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jun 2019 14:24:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 407AA1750;
	Wed, 12 Jun 2019 14:23:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 407AA1750
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560342242;
	bh=rzE+pZg1bnya9MUIGJFvPK80k9kbrRwAryi8KYBN9YI=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=hU2RpCR/BYi938G4Sw5FL+Qjk5Cd48OimM2PbFXuI7sBwXDZE7kwxIJixKf1bDyjA
	 WlPWOnb+oDBMBK8uOTmK+NcMfdsYttUmPOz92sHjEfkfZ0K9fLBecWl4Yt9jw9Qvxk
	 BOOkxY/qyOqfHxUCISAjmI+/zGmVKGY+2yGZx/Xk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0BAFBF896E3;
	Wed, 12 Jun 2019 14:22:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 12518F896EA; Wed, 12 Jun 2019 14:22:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=PRX_BODY_76,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 626CAF80794
 for <alsa-devel@alsa-project.org>; Wed, 12 Jun 2019 14:22:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 626CAF80794
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 Jun 2019 05:22:08 -0700
X-ExtLoop1: 1
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by fmsmga004.fm.intel.com with ESMTP; 12 Jun 2019 05:22:07 -0700
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Wed, 12 Jun 2019 15:22:55 +0300
Message-Id: <20190612122258.4363-1-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.17.1
Cc: kai.vehmanen@linux.intel.com
Subject: [alsa-devel] [PATCH 0/3] ASoC: SOF: fix suspend ordering with
	runtime idle
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi all,
this series addresses issues with ordering of HDA codec and controller
suspends in the runtime PM flows. The implemented logic for SOF is
similar to what has been used by the Intel AZX HDA driver.

To implement this, first a fix is needed to hdac_hdmic ASoC codec
driver. SOF framework also needs to be extended to allow SOF devices
to implement a runtime_idle callback. Third, concrete implementation
is in a separate patch for APL/CNL Intel hardware, for which strict
ordering of codec-controller power down sequence needs to be
maintained.

As this extends the SOF device interface, Pierre asked me to
send to the list for wider review. This series has been prereviewd
at SOF github as:
https://github.com/thesofproject/linux/pull/1003

Kai Vehmanen (3):
  ASoC: hdac_hdmi: report codec link up/down status to bus
  ASoC: SOF: add runtime idle callback
  ASoC: SOF: Intel: implement runtime idle for CNL/APL

 sound/soc/codecs/hdac_hdmi.c  |  2 ++
 sound/soc/sof/intel/apl.c     |  1 +
 sound/soc/sof/intel/cnl.c     |  1 +
 sound/soc/sof/intel/hda-dsp.c | 13 +++++++++++++
 sound/soc/sof/intel/hda.h     |  1 +
 sound/soc/sof/pm.c            |  8 ++++++++
 sound/soc/sof/sof-acpi-dev.c  |  2 +-
 sound/soc/sof/sof-pci-dev.c   |  2 +-
 sound/soc/sof/sof-priv.h      |  2 ++
 9 files changed, 30 insertions(+), 2 deletions(-)

-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
