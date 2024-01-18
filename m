Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F8D0831E08
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Jan 2024 17:59:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7235DB70;
	Thu, 18 Jan 2024 17:59:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7235DB70
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1705597166;
	bh=pMxi0aeP/TUeEOvaFIlff/maw++Dj2oPNVtTO/j244Y=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=EuvEuXSgGJrErMQ1XKnpZxiRoCvMZY3HnhptyI6THrod1ya6U2/QLlDxRTcs/72cL
	 rdQKfziDI8jLJ8/LJOyqi7gaf3E9Yj+ZYpkCnVZFQr0MiBQijgcWQqoZw4kYYMtCBZ
	 Cv+NeDsXTvIuewmEb3yK7uYZhEMHQUBOp8fpjAzo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 73E2CF805E4; Thu, 18 Jan 2024 17:58:41 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9F23FF801F5;
	Thu, 18 Jan 2024 17:58:40 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D9AEDF8059F; Thu, 18 Jan 2024 17:58:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 21121F805A0
	for <alsa-devel@alsa-project.org>; Thu, 18 Jan 2024 17:58:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 21121F805A0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=vPgJBKI0
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 401AEB818AE;
	Thu, 18 Jan 2024 16:58:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0278C43394;
	Thu, 18 Jan 2024 16:58:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705597105;
	bh=pMxi0aeP/TUeEOvaFIlff/maw++Dj2oPNVtTO/j244Y=;
	h=From:To:Cc:Subject:Date:From;
	b=vPgJBKI0B1DZ+4T4gk8K+UprLod1TfKqRIQahsZL6hQAN3q7qOdUeD/4nvXroDbYI
	 foqlTL6LGtQ6zIFmkpO8To+1pGZX5kRE5pa7Z56mVicVSTdz8tBztqSff4P10cWoo1
	 zk2y9qIoqbsuMioby2HmqKkcbULewuj+gcHWz+sz7IWunZiHqeY02KZtKw7NYG1sF2
	 5g/QM02Q3hVWssiEs8Kpk9s2cWEYCLtE2N0tJb7Uo3LuGKChXSTu/28HeNzOvJXFHS
	 6AVUl27x6gbXfURGorrG+cc4LZNBmweWq5IeD6vXDTakDm7bPwK9mpgam0jZsEEIbg
	 MnJmi4gp3hAUA==
Received: from johan by xi.lan with local (Exim 4.96.2)
	(envelope-from <johan+linaro@kernel.org>)
	id 1rQViq-0003Yw-2Q;
	Thu, 18 Jan 2024 17:58:33 +0100
From: Johan Hovold <johan+linaro@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH v3 0/5] ASoC: qcom: volume fixes and codec cleanups
Date: Thu, 18 Jan 2024 17:58:06 +0100
Message-ID: <20240118165811.13672-1-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: CIBP7L73MFSVW3M62DFHN2YCPMUXJBIH
X-Message-ID-Hash: CIBP7L73MFSVW3M62DFHN2YCPMUXJBIH
X-MailFrom: johan+linaro@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CIBP7L73MFSVW3M62DFHN2YCPMUXJBIH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

To reduce the risk of speaker damage the PA gain needs to be limited on
machines like the Lenovo Thinkpad X13s until we have active speaker
protection in place.

Limit the gain to the current default setting provided by the UCM
configuration which most user have so far been using (due to a bug in
the configuration files which prevented hardware volume control [1]).

The wsa883x PA volume control also turned out to be broken, which meant
that the default setting used by UCM configuration is actually the
lowest level (-3 dB). With the codec driver fixed, hardware volume
control also works as expected once we lift the PA volume limit.

Note that the new wsa884x driver most likely suffers from a similar bug,
I'll send a fix for that once I've got that confirmed.

Included is also a related fix for the LPASS WSA macro driver, which
was changing the digital gain setting behind the back of user space and
which can result in excessive (or too low) digital gain.

There are further Qualcomm codec drivers that similarly appear to
manipulate various gain settings, but on closer inspection it turns out
that they only write back the current settings. Tests reveal that these
writes are indeed needed for any prior updates to take effect (at least
for the WSA and RX macros).

Johan

[1] https://github.com/alsa-project/alsa-ucm-conf/pull/382


Changes in v3
 - fix the wsa883x PA volume control and update the machine limits
   accordingly

Changes in v2
 - keep the volume register write on power-on in lpass-wsa-macro
 - drop the other patches removing volume register writes on DAPM events
 - only drop the constant-zero gain offsets in wcd9335


Johan Hovold (5):
  ASoC: codecs: wsa883x: fix PA volume control
  ASoC: codecs: wsa883x: lower default PA gain
  ASoC: qcom: sc8280xp: limit speaker volumes
  ASoC: codecs: lpass-wsa-macro: fix compander volume hack
  ASoC: codecs: wcd9335: drop unused gain hack remnant

 sound/soc/codecs/lpass-wsa-macro.c | 7 -------
 sound/soc/codecs/wcd9335.c         | 4 ----
 sound/soc/codecs/wsa883x.c         | 6 +++---
 sound/soc/qcom/sc8280xp.c          | 8 +++++---
 4 files changed, 8 insertions(+), 17 deletions(-)

-- 
2.41.0

