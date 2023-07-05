Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BA40B7486AC
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Jul 2023 16:44:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BFC4E83B;
	Wed,  5 Jul 2023 16:43:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BFC4E83B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688568246;
	bh=MrLDHbklUKpi6qXlkICOurQQLrWotMYZG6zKJgQAjAY=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Ad3W0VSioyIWs5q8qm/J+kmvpTJHU6oHo452y8ZGyLx+gGi9d3PD0CCSxvFJO6N39
	 sZ/TpMKrNeTYYTanf0HV6Qv54HGOqpP5PHtpO12pZAtBHITTYZZzZ8L7inJVcPWvh2
	 6vRWBBRNadA9XdBhdqsUAXDwkbmsw7dMKAS6YX9s=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7C3BDF80589; Wed,  5 Jul 2023 16:41:49 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E297BF80589;
	Wed,  5 Jul 2023 16:41:48 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1743AF80125; Wed,  5 Jul 2023 14:35:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DC10AF80153
	for <alsa-devel@alsa-project.org>; Wed,  5 Jul 2023 14:33:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DC10AF80153
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=m+8kTaSA
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1CA0F61510;
	Wed,  5 Jul 2023 12:33:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F125C433C9;
	Wed,  5 Jul 2023 12:33:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688560389;
	bh=MrLDHbklUKpi6qXlkICOurQQLrWotMYZG6zKJgQAjAY=;
	h=From:To:Cc:Subject:Date:From;
	b=m+8kTaSAKikKHrGf9TO3qYgpRMU149MjjocmjN6KKUPV8qFkr5/0Cv7qcumfx3Zsq
	 fhOoBHzADQCEjcoN7P2rQcBbA2RfYUFchFgYcEDjrQdoGaRpluo0tgpsbNX0EKF4W1
	 oOhpnwmNsskUGHLolkrqjHovCh+WQobWCDMP7CxW0EduDR08SRkKsZ7z8PxIUJqvae
	 ZjG2Q0h9sIY0v1Hdcng2TMzeexs4e2RWKWPgTnPuDa5Ykm1TrzeNIbsJTpe8SJEYur
	 gWdybdcNAKI9ULO9sjYB0fOUHCgtQ2I1UdgzQxf/FBzzvg0x02OSK/w+edNm3HeSZh
	 ahFg3YJg42uKQ==
Received: from johan by xi.lan with local (Exim 4.96)
	(envelope-from <johan+linaro@kernel.org>)
	id 1qH1hK-000846-03;
	Wed, 05 Jul 2023 14:33:30 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Mark Brown <broonie@kernel.org>,
	Vinod Koul <vkoul@kernel.org>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Sanyog Kale <sanyog.r.kale@intel.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH 0/8] ASoC/soundwire/qdsp6/wcd: fix leaks and probe deferral
Date: Wed,  5 Jul 2023 14:30:10 +0200
Message-Id: <20230705123018.30903-1-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.39.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: johan+linaro@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: MP5VFKVK6445GKN33NX6E6YQ7RPKDIL2
X-Message-ID-Hash: MP5VFKVK6445GKN33NX6E6YQ7RPKDIL2
X-Mailman-Approved-At: Wed, 05 Jul 2023 14:41:38 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MP5VFKVK6445GKN33NX6E6YQ7RPKDIL2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

I've been hitting a race during boot which breaks probe of the sound
card on the Lenovo ThinkPad X13s as I've previously reported here:

	https://lore.kernel.org/all/ZIHMMFtuDtvdpFAZ@hovoldconsulting.com/

The immediate issue appeared to be a probe deferral that was turned into
a hard failure, but addressing that in itself only made things worse as
it exposed further bugs.

I was hoping someone more familiar with the code in question would look
into this, but as this affects users of the X13s and breaks audio on my
machine every fifth boot or so, I decided to investigate it myself.

As expected, the Qualcomm codec drivers are broken and specifically leak
resources on component remove, which in turn breaks sound card probe
deferrals.

The source of the deferral itself appears to be legitimate and was
simply due to some audio component not yet having been registered due to
random changes in timing during boot.

These issues can most easily be reproduced by simply blacklisting the
q6apm_dai module and loading it manually after boot.

The sound card probe deferral also exposes a bug in the soundwire
subsystem, which uses completion structures for signalling that a device
has been enumerated on the bus and initialised. The way this is
implemented prevents reprobed codec drivers from learning that the
soundwire devices are still attached, which causes probe to fail.

Included are also two patches that suppresses error messages on
component probe deferral to avoid spamming the logs during boot.

These patches should preferably all go through the ASoC tree even if
merging the soundwire fix separately also works.

Note the ASoC tree already has the following related fixes:

	https://lore.kernel.org/lkml/20230630120318.6571-1-johan+linaro@kernel.org/
	https://lore.kernel.org/lkml/20230630142717.5314-1-johan+linaro@kernel.org/
	https://lore.kernel.org/lkml/20230701094723.29379-1-johan+linaro@kernel.org/
	https://lore.kernel.org/lkml/20230703124701.11734-1-johan+linaro@kernel.org/

Johan


Johan Hovold (8):
  soundwire: fix enumeration completion
  ASoC: qdsp6: audioreach: fix topology probe deferral
  ASoC: codecs: wcd938x: fix missing clsh ctrl error handling
  ASoC: codecs: wcd938x: fix resource leaks on component remove
  ASoC: codecs: wcd934x: fix resource leaks on component remove
  ASoC: codecs: wcd-mbhc-v2: fix resource leaks on component remove
  ASoC: topology: suppress probe deferral errors
  ASoC: core: suppress probe deferral errors

 drivers/soundwire/bus.c         |  8 ++---
 sound/soc/codecs/wcd-mbhc-v2.c  | 57 ++++++++++++++++++++++---------
 sound/soc/codecs/wcd934x.c      | 12 +++++++
 sound/soc/codecs/wcd938x.c      | 59 +++++++++++++++++++++++++++++----
 sound/soc/qcom/qdsp6/topology.c |  4 +--
 sound/soc/soc-core.c            |  6 ++--
 sound/soc/soc-topology.c        | 10 ++++--
 7 files changed, 122 insertions(+), 34 deletions(-)

-- 
2.39.3

