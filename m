Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8105A142F2A
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Jan 2020 17:04:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2D13C1675;
	Mon, 20 Jan 2020 17:03:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2D13C1675
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579536243;
	bh=l0f5Vvqf5ilNrGawLHOBaJiRNE06fAXYLq5w/8TJM0s=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=mf90btKi641EsKZ5f+lEiVc2RzIi0CmW+x1RtHRlkLWrQBtjq8ezHeRNZqhVlNzBE
	 gYTJZ7tTNOLcsmELoFLhksNpFdzOIUBipyU9ziWpSwny1z/pLHhziTkgBSY1ocCElb
	 KncAfsSkvFD1sE+oaIh/woKojBhOuCxslxBI/3UU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C0C70F8026F;
	Mon, 20 Jan 2020 17:01:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EB200F800C6; Mon, 20 Jan 2020 17:01:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1A2CAF800C6
 for <alsa-devel@alsa-project.org>; Mon, 20 Jan 2020 17:01:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1A2CAF800C6
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 20 Jan 2020 08:01:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,342,1574150400"; d="scan'208";a="258751410"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by fmsmga002.fm.intel.com with ESMTP; 20 Jan 2020 08:01:20 -0800
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com
Date: Mon, 20 Jan 2020 18:01:14 +0200
Message-Id: <20200120160117.29130-1-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.17.1
Cc: tiwai@suse.de, cujomalainey@chromium.org, kai.vehmanen@linux.intel.com
Subject: [alsa-devel] [PATCH v2 0/3] SOF: Fix HDMI probe errors on GLK
	devices
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

Hi Mark and Pierre,
here's a patch series to address an issue that popped up
after SOF changed from hdac-hdmi to snd-hda-codec-hdmi:

"failed to get afg sub nodes on ChromeOS devices"
https://github.com/thesofproject/linux/issues/1642

v2 changes:
 - rebased on top of broonie/for-next
 - added Takashi's reviewed-by to the one HDA patch, agreed
   the series should go via asoc tree

This is fairly hard to hit and only occurs on some devices (most
current reports are Gemini Lake based Chromebooks), but when
it does, it is rather severe as the whole SOF probe fails
because of this, and user is left without sound.

First fix is to optimize out one power down/up cycle from
the probe process. On platforms such as GLK, each time
audio driver does acomp's get_power(), graphics typically
needs to do a modeset due to clocking requirements for the HDA
bus. This can cause display to flash when audio is probed, plus
in the reported cases on GLK, can lead to probe failures.

The above change doesn't cover all reported cases, so additionally
retry logic is added to snd_hda_get_sub_nodes() calls on
Intel platforms. Multiple other approaches were investigated,
but a simple retry -- although less than ideal -- in the end proved to
be most reliable solution. HDA dump on one affected Acer Chromebook
looks like this:

# codec initialization goes as normal with multiple successful cmds
           udevd-9486  [001] ....  3910.087791: hda_send_cmd: [0000:00:0e.0:2] val=0x207f1c00
           udevd-9486  [001] ....  3910.087857: hda_get_response: [0000:00:0e.0:2] val=0x18560010
           udevd-9486  [001] ....  3910.087858: hda_send_cmd: [0000:00:0e.0:2] val=0x207f0700
           udevd-9486  [001] ....  3910.087931: hda_get_response: [0000:00:0e.0:2] val=0x00000000
           udevd-9486  [001] ....  3910.087932: hda_send_cmd: [0000:00:0e.0:2] val=0x20bf8100
           udevd-9486  [001] ....  3910.088040: hda_get_response: [0000:00:0e.0:2] val=0x00000001
           udevd-9486  [001] ....  3910.088044: hda_send_cmd: [0000:00:0e.0:2] val=0x20b78103
# here get params for AC_PAR_NODE_COUNT fails, 0xffffffff is returned
           udevd-9486  [001] ....  3910.088048: hda_send_cmd: [0000:00:0e.0:2] val=0x201f0004
           udevd-9486  [001] ....  3911.090131: hda_get_response: [0000:00:0e.0:2] val=0xffffffff
# retry is successful
           udevd-9486  [001] ....  3911.090152: hda_send_cmd: [0000:00:0e.0:2] val=0x201f0004
           udevd-9486  [001] ....  3911.090288: hda_get_response: [0000:00:0e.0:2] val=0x00020006

Kai Vehmanen (3):
  ASoC: SOF: Intel: refactor i915_get/put functions
  ASoC: SOF: Intel: do not disable i915 power during probe
  ALSA: hda/hdmi - add retry logic to parse_intel_hdmi()

 sound/pci/hda/patch_hdmi.c      |  7 +++++--
 sound/soc/sof/intel/hda-codec.c | 21 ++++++---------------
 sound/soc/sof/intel/hda.c       |  3 ++-
 sound/soc/sof/intel/hda.h       |  7 +++----
 4 files changed, 16 insertions(+), 22 deletions(-)

-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
