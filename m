Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D8FD713DCF3
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Jan 2020 15:08:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F29DF17CB;
	Thu, 16 Jan 2020 15:07:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F29DF17CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579183690;
	bh=Ky4jQW24KqiZlM5kMse2YizjwYtgIisciEC8lsSv2KI=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Z0kFapC42ld91dNgh7vWKSTVsXDyKh/b53BwfU5wCmV0j99yDe7pde7RJLL7nDJ4g
	 uViFgzSt1jgOHKaHkJ0liVTkHfhaicM2wOY4+/w9ea6wXCDaQPKZeYw9aiVf9NwGsC
	 8kZYKo9anBZrS9fYah5V7LcFXu82Sri3W/5fxVBI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 325CEF8014E;
	Thu, 16 Jan 2020 15:06:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 74509F8016F; Thu, 16 Jan 2020 15:06:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 319D0F800B9
 for <alsa-devel@alsa-project.org>; Thu, 16 Jan 2020 15:06:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 319D0F800B9
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 16 Jan 2020 06:06:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,326,1574150400"; d="scan'208";a="373319919"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by orsmga004.jf.intel.com with ESMTP; 16 Jan 2020 06:06:12 -0800
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	tiwai@suse.de
Date: Thu, 16 Jan 2020 16:06:07 +0200
Message-Id: <20200116140610.7247-1-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.17.1
Cc: cujomalainey@chromium.org, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com, kai.vehmanen@linux.intel.com
Subject: [alsa-devel] [PATCH 0/3] SOF: Fix HDMI probe errors on GLK devices
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
here's a patch series to address an issue that popped up
after SOF changed from hdac-hdmi to snd-hda-codec-hdmi:

"failed to get afg sub nodes on ChromeOS devices"
https://github.com/thesofproject/linux/issues/1642

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
