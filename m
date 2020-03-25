Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CF891932F0
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Mar 2020 22:42:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A0177844;
	Wed, 25 Mar 2020 22:41:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A0177844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585172527;
	bh=UqXLWmiBdmvKALSXkSOg4aH+KMNpSWqIBp0rpbVsFgw=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=rECkAaeG9cE8vCMX53mthS0t4964B5gcFnV+qMQEayPwysUrDGwYuFmeqXzIiqlrk
	 ZqMl6ynoceJhgQ1E7DvCGRSvZ1Eq8CDH31VFNqUfcKw/l66qHnhirvvMflM4d+BXQF
	 vP0sjtNVjdJZtt+CSZEKhRS5WCh/IglRiu0vAb3c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4D9CAF8011E;
	Wed, 25 Mar 2020 22:40:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 90284F8028E; Wed, 25 Mar 2020 22:34:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 TIME_LIMIT_EXCEEDED autolearn=unavailable version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C9674F8011E
 for <alsa-devel@alsa-project.org>; Wed, 25 Mar 2020 22:29:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C9674F8011E
IronPort-SDR: Hmu7xkYLJqHuy/XdCw0TH3qIajUpn9CuIWjrEhNQC6AO14HwWdR5tUeFKilbZNg6ePqZmkC/vx
 lerUXAwECQGg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2020 14:29:15 -0700
IronPort-SDR: ihiLkikGCbOfSbCBNNNW9tztEs9XwZeR83vBKt/tectMljWwxUHToaUsZR6rMv9zBlvAu0FRT5
 7upLLSrxzKQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,305,1580803200"; d="scan'208";a="393759849"
Received: from abeljans.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.251.233.195])
 by orsmga004.jf.intel.com with ESMTP; 25 Mar 2020 14:29:14 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 0/2] ASoC: rt1308-sdw: configure amplifier with set_tdm_slot()
Date: Wed, 25 Mar 2020 16:29:03 -0500
Message-Id: <20200325212905.28145-1-pierre-louis.bossart@linux.intel.com>
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

When two (or more) amplifiers are on the same link, the integrator may:
a) assign dedicated slots for each of the amplifiers.
b) provide the same configuration to all amplifiers, and rely on
additional controls/processing in the amplifier to generate different
outputs.

case a) was the initial direction for SoundWire and is required for
amplifiers with limited capabilities, but to deal with orientation or
'posture' changes it's easier to implement case b) when the amplifier
can deal with multiple channels.

This patchset suggest the use of the set_tdm_slot() API to define
which of the channels will be consumed by what amplifiers. This maps
well with SoundWire's 'ChannelEnable' registers. The notion of
slot_width is however irrelevant here and ignored, and SoundWire ports
are typically single direction, so only one of the two masks shall be
used.

Pierre-Louis Bossart (2):
  ASoC: rt1308-sdw: add set_tdm_slot() support
  ASoC: rt1308-sdw: use slot and rx_mask to configure stream

 sound/soc/codecs/rt1308-sdw.c | 38 +++++++++++++++++++++++++++++++----
 sound/soc/codecs/rt1308-sdw.h |  2 ++
 2 files changed, 36 insertions(+), 4 deletions(-)

-- 
2.20.1

