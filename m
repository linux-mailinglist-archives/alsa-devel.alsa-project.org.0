Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 51B33836FA8
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jan 2024 19:20:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 79F08826;
	Mon, 22 Jan 2024 19:20:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 79F08826
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1705947623;
	bh=7miscXNSOMprQJwxQIJJr4/Ytf2DqWNxzA6Kigr9MWg=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=HYq2nZpPA2IgDcAtqRWw4rWBquxmnPtH61VvZmSYFjAzr6tJYVlErf6pDXglNhGwK
	 bfQfck/NN8wROr0kVRBPuDdZDjx3eJmplZkTG0CS7gUK6trWX5JWBLyyxAUJqBUBRc
	 bexvks0GzfurOIhW+9nUlyBh+5LJOwwEpGXytv8E=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5D33DF8063D; Mon, 22 Jan 2024 19:18:49 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 527BAF80612;
	Mon, 22 Jan 2024 19:18:49 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0CA87F8022B; Mon, 22 Jan 2024 19:18:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 38829F8028D
	for <alsa-devel@alsa-project.org>; Mon, 22 Jan 2024 19:18:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 38829F8028D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=b+9POOsO
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 9366FCE28C5;
	Mon, 22 Jan 2024 18:18:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1CCDC43390;
	Mon, 22 Jan 2024 18:18:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705947507;
	bh=7miscXNSOMprQJwxQIJJr4/Ytf2DqWNxzA6Kigr9MWg=;
	h=From:To:Cc:Subject:Date:From;
	b=b+9POOsOeQjtUvXuCNigCJf2HSOkXYPLOWg/HE+CRt/c26e2TW5wTHa4FHl3M4tIf
	 e46SSMKSvD4XGNYdTCsa0Qwkoi8jpOAqd+VRud/WfsEGwMS/x3j8+XP/cVVyEVZJ/6
	 GG+ICMsaaw3YL0alwVkUEI8wt/Jt9vOmVZyEoiK3tvE1dZCI4pEFnLWxja/juLRnhS
	 YhZ+IVRQVXhpNt/urMtl5gPV8++M8rx6SBMrsMcWBC7HsVZif7u6Sp7gtCgtDxQPdL
	 z0+yDXOKMbZ6roSrUO6wYmyb421yoIpQataUcPoo1JveBaQ9QFsXVCYAaq5FTthQf/
	 0D33ILfewDsBg==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1rRysa-0000000013R-12Hg;
	Mon, 22 Jan 2024 19:18:40 +0100
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
Subject: [PATCH v5 0/4] ASoC: qcom: volume fixes and codec cleanups
Date: Mon, 22 Jan 2024 19:18:15 +0100
Message-ID: <20240122181819.4038-1-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 3DT3GIEALLFD2ECRYHTKOW7BSM3THMIJ
X-Message-ID-Hash: 3DT3GIEALLFD2ECRYHTKOW7BSM3THMIJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3DT3GIEALLFD2ECRYHTKOW7BSM3THMIJ/>
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
control also works as expected.

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


Changes in v5
 - rebase on v6.8-rc1 

Changes in v4
 - keep the full PA volume control range and only fix the exported dB
   values
 - use a combined -3 dB machine limit as limiting just the PA volume
   confuses PulseAudio
 - drop the PA gain initialisation which is no longer needed

Changes in v3
 - fix the wsa883x PA volume control and update the machine limits
   accordingly

Changes in v2
 - keep the volume register write on power-on in lpass-wsa-macro
 - drop the other patches removing volume register writes on DAPM events
 - only drop the constant-zero gain offsets in wcd9335


Johan Hovold (4):
  ASoC: codecs: wsa883x: fix PA volume control
  ASoC: qcom: sc8280xp: limit speaker volumes
  ASoC: codecs: lpass-wsa-macro: fix compander volume hack
  ASoC: codecs: wcd9335: drop unused gain hack remnant

 sound/soc/codecs/lpass-wsa-macro.c |  7 -------
 sound/soc/codecs/wcd9335.c         |  4 ----
 sound/soc/codecs/wsa883x.c         |  6 +++++-
 sound/soc/qcom/sc8280xp.c          | 12 +++++++-----
 4 files changed, 12 insertions(+), 17 deletions(-)

-- 
2.43.0

