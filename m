Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 77629193267
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Mar 2020 22:14:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 122941685;
	Wed, 25 Mar 2020 22:13:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 122941685
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585170877;
	bh=QfMIs2xyJY1TXlRXT3cPoGcwL9OFoLU7afbTqdHI4TU=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ikkthwTzEIWpkWvS36JxV4MD8uyLtAjARyT+vGuFYRie0YHTO1eJgcqqLLGvjLF/I
	 2aKp5p+K/aGe3TucvJWE4PACptFPGSgh4MrxnhVHWzqVfuf02tk4SWFBkilIw1DLIw
	 fBxS1IiZjwavQrC1zMYaLgiXrTyJS+0bBOcpyhAQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0298FF80218;
	Wed, 25 Mar 2020 22:12:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4F115F8011E; Wed, 25 Mar 2020 22:12:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D9BF2F8011E
 for <alsa-devel@alsa-project.org>; Wed, 25 Mar 2020 22:12:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D9BF2F8011E
IronPort-SDR: jeb6knWvOUWayjwOcGieP33nriCLbJMQz3LU0QZLIAxwFyEQP0c44kn9swcDsAimhc061TXo2T
 waa/hygjONIA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2020 14:12:44 -0700
IronPort-SDR: rYYAX+N6jlMCr9bJjPO91OEDV4lmvVYBFhDE52BSK1dB33UnmVgh931zagitm5Z3dV6keESlVX
 OH8z6vLZDAzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,305,1580803200"; d="scan'208";a="357935802"
Received: from abeljans.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.251.233.195])
 by fmsmga001.fm.intel.com with ESMTP; 25 Mar 2020 14:12:43 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 0/5] ASoC: SOF: cleanups and improvements
Date: Wed, 25 Mar 2020 16:12:28 -0500
Message-Id: <20200325211233.27394-1-pierre-louis.bossart@linux.intel.com>
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

Couple of small patches to improve error handling, inits, logs.

Hope we can have this for 5.7?

Guennadi Liakhovetski (2):
  ASoC: SOF: (cosmetic) use for_each_pcm_streams() in sof_dai_load()
  ASoC: SOF: fix uninitialised "work" with VirtIO

Kai Vehmanen (2):
  ASoC: SOF: Intel: hda: do not leave clock gating off upon error
  ASoC: SOF: Intel: hda: call codec wake at chip init

Ranjani Sridharan (1):
  ASoC: SOF: Intel: hda: Improve DSP state logging

 sound/soc/sof/intel/hda-ctrl.c | 15 +++++++++---
 sound/soc/sof/intel/hda-dsp.c  | 43 ++++++++++++++++++++++++++++++++--
 sound/soc/sof/pcm.c            |  4 +---
 sound/soc/sof/sof-audio.h      |  3 +++
 sound/soc/sof/topology.c       | 17 ++++++++++----
 5 files changed, 69 insertions(+), 13 deletions(-)

-- 
2.20.1

