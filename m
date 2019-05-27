Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 556502B14B
	for <lists+alsa-devel@lfdr.de>; Mon, 27 May 2019 11:29:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A4B4A16BB;
	Mon, 27 May 2019 11:28:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A4B4A16BB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558949366;
	bh=ypkn7Z5JKcP9Hzga604TaFzSsKF/+MqRMZ/jdHybE3g=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Kqz1sDuCJMNo0yBmDT5BrvrlhhCq6bNiB5ej6FlFuMikt3DOWvETmEgeBWwkvlFOe
	 NdecsMFDonF6B/GD3EzLj++k2NPUGdJ8JH4Su6jSB0WH0FjI4IqLNvPr0wWhGjyDQs
	 PZPbFto0X7rx2P+TJNPc30gMERVmS20wayMw1IOk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C260AF896F8;
	Mon, 27 May 2019 11:27:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 23C60F8065A; Mon, 27 May 2019 11:27:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 09DEDF8065A
 for <alsa-devel@alsa-project.org>; Mon, 27 May 2019 11:27:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 09DEDF8065A
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 May 2019 02:27:31 -0700
X-ExtLoop1: 1
Received: from younglee-svr.sh.intel.com ([10.239.159.31])
 by fmsmga004.fm.intel.com with ESMTP; 27 May 2019 02:27:30 -0700
From: libin.yang@intel.com
To: alsa-devel@alsa-project.org
Date: Mon, 27 May 2019 17:07:23 +0800
Message-Id: <1558948047-18930-1-git-send-email-libin.yang@intel.com>
X-Mailer: git-send-email 2.7.4
Cc: tiwai@suse.de, libin.yang@intel.com, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com
Subject: [alsa-devel] [RFC PATCH 0/4] ASoC: hdac_hdmi: refine the hdac_hdmi
	jacks
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

From: Libin Yang <libin.yang@intel.com>

This patchset refines the hdac_hdmi jacks:
1. kctl setting should not impact on hdmi jack status
2. bind jack to pin-port instead of pcm
3. move creating jack into hdac_hdmi from machine drivers

Libin Yang (4):
  ASoC: hdac_hdmi: amixer kctl setting should not impact on jack status
  ASoC: hdac_hdmi: jack_event represents the status
  ASoC: hdac_hdmi: refine hdmi jacks
  ASoC: hdac_hdmi: fix some coding style issue

 sound/soc/codecs/hdac_hdmi.c                       | 176 +++++++++++----------
 sound/soc/intel/boards/bxt_da7219_max98357a.c      |  10 --
 sound/soc/intel/boards/bxt_rt298.c                 |  10 --
 sound/soc/intel/boards/glk_rt5682_max98357a.c      |  10 --
 sound/soc/intel/boards/kbl_da7219_max98357a.c      |  10 --
 sound/soc/intel/boards/kbl_da7219_max98927.c       |  10 --
 sound/soc/intel/boards/kbl_rt5660.c                |  10 --
 sound/soc/intel/boards/kbl_rt5663_max98927.c       |  10 --
 .../soc/intel/boards/kbl_rt5663_rt5514_max98927.c  |   9 --
 sound/soc/intel/boards/skl_hda_dsp_common.c        |   9 --
 sound/soc/intel/boards/skl_nau88l25_max98357a.c    |  11 --
 sound/soc/intel/boards/skl_nau88l25_ssm4567.c      |  11 --
 sound/soc/intel/boards/skl_rt286.c                 |  10 --
 sound/soc/intel/boards/sof_rt5682.c                |  11 --
 14 files changed, 92 insertions(+), 215 deletions(-)

-- 
2.7.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
