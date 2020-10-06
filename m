Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 31C28284AFD
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Oct 2020 13:34:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5C8851761;
	Tue,  6 Oct 2020 13:33:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5C8851761
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601984069;
	bh=XPuc/AIgg96jrOkKmvl5WGcAujtELi/1aPW6xMIX+Yw=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=WTw4pQ5w/pF6LcULkCD+flGim36Rkks2NYAaP/YidYrZOtRyUrmlu+6UOWGiOoZXs
	 1bJT8X2RJiDSnXXBZr4QwMsE+TseBieM0PVSO40FDU1b0V5S9BRzEu8sLnNBKrYQWA
	 NwzXwlocbfYCTtGVzQ1TCSwfyZ/o76X2hf3NQj+g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D83E2F80053;
	Tue,  6 Oct 2020 13:32:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 76AD7F8012B; Tue,  6 Oct 2020 13:32:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E2F32F80128
 for <alsa-devel@alsa-project.org>; Tue,  6 Oct 2020 13:32:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E2F32F80128
IronPort-SDR: xNUI6gu2PsCGMpWW/s//v0d3cXhI7SfHwfhDKJxeGixjbe9DAwLk4CH7l6nce9FoTx84YzojTy
 /6LVx/ySsSYA==
X-IronPort-AV: E=McAfee;i="6000,8403,9765"; a="163682588"
X-IronPort-AV: E=Sophos;i="5.77,343,1596524400"; d="scan'208";a="163682588"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2020 04:32:27 -0700
IronPort-SDR: 3Nq+Mo8qCdVf/2xOsD2VA65aWLQ+JYflP02M6SFynIG2ithD5MLW0Cq6VypNG29PWGIbLEKCk4
 Pjhc4vbAAhzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,343,1596524400"; d="scan'208";a="460759602"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by orsmga004.jf.intel.com with ESMTP; 06 Oct 2020 04:32:25 -0700
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	tiwai@suse.de
Subject: [RFC PATCH 0/2] ALSA: hda - acomp probe fix for i915
Date: Tue,  6 Oct 2020 14:30:40 +0300
Message-Id: <20201006113042.471718-1-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>
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

Hi,

this simple bugfix started to feel a bit like getting stuck in quicksand,
so I'm looking for some early input via this RFC series.

Basicly hdac_i915.c should not use global state to track communication
with i915 driver. But how to get handle of "hdac_bus*? I considered
a few options:

  1) add hdac_bus as a member of drm_audio_component.h
	-> seems wrong as this is really an audio side implementation)

  2) embed copy of drm_audio_component to 'struct hdac_bus', so
     I could use container_of() on the device handle to get
     to the bus 
	-> wasted space to keep a copy at hdac_bus level
	   (note: snd-hda-codec-hdmi do this by embedding a copy
	    of ops to "struct hdmi_spec")

  3) add another devres entry to store the hdac_bus directly
     in acomp_init and a new helper function to query it

I now implemented option 3 in this RFC series as it seemed cleanest
and most local to hdac_component.c, where the problem stems from. It's still
somewhat messy, and I'm wondering if I'm overlooking some obvious alternative.
We could dig this deeper into i915 specific code, but OTOH, hdac_bus is
an argument snd_hdac_acomp_init(), so it's common for all.

Kai Vehmanen (2):
  ALSA: hda - keep track of HDA core bus instance in acomp
  ALSA: hda/i915 - fix list corruption with concurrent probes

 include/sound/hda_component.h |  5 +++++
 include/sound/hdaudio.h       |  2 ++
 sound/hda/hdac_component.c    | 34 ++++++++++++++++++++++++++++++++++
 sound/hda/hdac_i915.c         | 16 +++++++++-------
 4 files changed, 50 insertions(+), 7 deletions(-)

-- 
2.28.0
