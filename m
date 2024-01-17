Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A5478301DC
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Jan 2024 10:05:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D0ECD74C;
	Wed, 17 Jan 2024 10:05:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D0ECD74C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1705482337;
	bh=i17ld0NFQa97QFBuw7o/jqfRb7C6LLoCeBGe1hJFLPM=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=i4C1nfEcly8sWt8h1oRJDLZh6pSdYYiIB9CiZcbKl65FRkYpodA26DuV8rECpxAiJ
	 AZkaS6FyE8Nsv73eQv+3b4viGYomR8rMFs9kytiBOoGZeqfB1YQzXLaN+PzRyf06Yv
	 rrXaGWMC18Vqe8DBFXBHQS+3ZqR7bOB4XNHsgRIk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 58E17F802E8; Wed, 17 Jan 2024 10:05:06 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D6D05F8055C;
	Wed, 17 Jan 2024 10:05:05 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 83CD6F802BE; Wed, 17 Jan 2024 10:03:53 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 6A5DAF800C1
	for <alsa-devel@alsa-project.org>; Wed, 17 Jan 2024 10:03:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6A5DAF800C1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=QrhpPRAY
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 1A6ADB81072;
	Wed, 17 Jan 2024 09:03:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D9E2C433C7;
	Wed, 17 Jan 2024 09:03:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705482224;
	bh=i17ld0NFQa97QFBuw7o/jqfRb7C6LLoCeBGe1hJFLPM=;
	h=From:To:Cc:Subject:Date:From;
	b=QrhpPRAYqKWIICjhvW+fdF36XLDjkM4tFHkyUpHf8lWZXG54jx90HhGsHVzbXbYwF
	 G+LEa/vv4cI9poRBs8Lj4IpZfOSW6etkZA7ZHuqOFY7DOuX7T9OcxiLeEA3v6fC76B
	 JhBsjOCR8ruvuUREs3USjx4j9DqymyXj+QW5iwzQDQ2wI4GLAt9fmzWYGAaMu8zJoq
	 YjQDNL33u2o0usRIxt/T+E31cE0wJkOH8XeHJJH39pXdzlFn44dikF8g5VQRBKjjVB
	 rQg0L2esBMDKlgP6P9Aguzn89nnxHqpwiJJsEHFsE/Z8rRw1yemyil11YmYc1gZPNT
	 6z41o7oyF9N6w==
Received: from johan by xi.lan with local (Exim 4.96.2)
	(envelope-from <johan+linaro@kernel.org>)
	id 1rQ1ps-00086S-2s;
	Wed, 17 Jan 2024 10:03:48 +0100
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
Subject: [PATCH v2 0/3] ASoC: qcom: volume fixes and codec cleanups
Date: Wed, 17 Jan 2024 10:03:28 +0100
Message-ID: <20240117090331.31111-1-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: QE6N472HB7IXZIB4JBGVXW3FK3H5WEWE
X-Message-ID-Hash: QE6N472HB7IXZIB4JBGVXW3FK3H5WEWE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QE6N472HB7IXZIB4JBGVXW3FK3H5WEWE/>
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


Changes in v2
 - keep the volume register write on power-on in lpass-wsa-macro
 - drop the other patches removing volume register writes on DAPM events
 - only drop the constant-zero gain offsets in wcd9335
   

Johan Hovold (3):
  ASoC: qcom: sc8280xp: limit speaker volumes
  ASoC: codecs: lpass-wsa-macro: fix compander volume hack
  ASoC: codecs: wcd9335: drop unused gain hack remnant

 sound/soc/codecs/lpass-wsa-macro.c | 7 -------
 sound/soc/codecs/wcd9335.c         | 4 ----
 sound/soc/qcom/sc8280xp.c          | 8 +++++---
 3 files changed, 5 insertions(+), 14 deletions(-)

-- 
2.41.0

