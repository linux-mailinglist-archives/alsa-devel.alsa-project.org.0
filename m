Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 20C556EAA97
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Apr 2023 14:42:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1FF7583E;
	Fri, 21 Apr 2023 14:41:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1FF7583E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1682080957;
	bh=T48OdAPf56bo29S432nUzHvZLkZz6KOiib+/h/VCnLI=;
	h=To:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From:Reply-To:Cc:From;
	b=WfDyID39atn6nIFa5s3Nu1nG3GNu16L5QnF4QGzw355V58ug4kCpVenSw1ebHlhqM
	 sMHe6cv8ke7GfJisvLDnS2pIcXBiaRI0e3xw0KjpAJ/ddSDdmpw+5g83Uca2tppwwG
	 zoznZv0p1l5HpzZrgZBa9QIghuAKedr/a4dBESk0=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5C2F8F80149;
	Fri, 21 Apr 2023 14:41:46 +0200 (CEST)
To: Herve Codina <herve.codina@bootlin.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 0/4] Add support for IIO devices in ASoC
Date: Fri, 21 Apr 2023 14:41:18 +0200
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7P3RRBCLMO4PM6VPDY2H22JM2ASUPV56/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: 
 <168208090558.26.16504565105038262963@mailman-core.alsa-project.org>
From: Herve Codina via Alsa-devel <alsa-devel@alsa-project.org>
Reply-To: Herve Codina <herve.codina@bootlin.com>
Cc: alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: message/rfc822
Content-Disposition: inline

Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 77D2AF80155; Fri, 21 Apr 2023 14:41:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9601FF800D0
	for <alsa-devel@alsa-project.org>; Fri, 21 Apr 2023 14:41:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9601FF800D0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ZY1kyb2J
Received: (Authenticated sender: herve.codina@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPA id 9F26140006;
	Fri, 21 Apr 2023 12:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1682080894;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=wPUr6k3hoHACmnMjvKMllT2pYnYBLSNWQbpWAPrti6c=;
	b=ZY1kyb2J62UJI4c0SfVLqsVPO1m7nV0B93j0DP4ZGCaAOzE1CbG/rfJQcX37ZRFoVehfhh
	upR/4/e72nslwE2fTICG1qEMN8ng6UgnW/um2dvgBFTXvUlNqWoB3igr2a4t1uuY/7Lkro
	Q/JhPYuDi5GxZpU0fQy2OP38mAcOcXNchUoMIQqo7M40VyXV+qkS7V+ez7cPrUcQq/dwQJ
	7RiV6UZ0It/tQHwGbleMlub0joaN3sIPkqhES+YpLHAMaqCugaNyCLSPE7nBv6bFDncT8L
	wVATcJ86n+Yo+oKKILY2rhK1ZNkc/tVbJZfasc01RiuXZTPB9ryuz3nqDHFcZQ==
From: Herve Codina <herve.codina@bootlin.com>
To: Herve Codina <herve.codina@bootlin.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 0/4] Add support for IIO devices in ASoC
Date: Fri, 21 Apr 2023 14:41:18 +0200
Message-Id: <20230421124122.324820-1-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 7P3RRBCLMO4PM6VPDY2H22JM2ASUPV56
X-Message-ID-Hash: 7P3RRBCLMO4PM6VPDY2H22JM2ASUPV56
X-MailFrom: herve.codina@bootlin.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7P3RRBCLMO4PM6VPDY2H22JM2ASUPV56/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Several weeks ago, I sent a series [1] for adding a potentiometer as an
auxiliary device in ASoC. The feedback was that the potentiometer should
be directly handled in IIO (as other potentiometers) and something more
generic should be present in ASoC in order to have a binding to import
some IIO devices into sound cards.

The series related to the IIO potentiometer device is already under
review [2].

This series introduces simple-iio-aux. Its goal is to offer the binding
between IIO and ASoC.
It exposes attached IIO devices as ASoC auxiliary devices and allows to
control them through mixer controls.

On my system, the IIO device is a potentiometer and it is present in an
amplifier design present in the audio path.

Best regards,
Hervé

[1] https://lore.kernel.org/linux-kernel/20230203111422.142479-1-herve.codina@bootlin.com/
[2] https://lore.kernel.org/linux-kernel/20230421085245.302169-1-herve.codina@bootlin.com/

Herve Codina (4):
  dt-bindings: sound: Add simple-iio-aux
  iio: inkern: Add a helper to query an available minimum raw value
  ASoC: soc-dapm.h: Add a helper to build a DAPM widget dynamically
  ASoC: codecs: Add support for the generic IIO auxiliary devices

 .../bindings/sound/simple-iio-aux.yaml        |  65 ++++
 drivers/iio/inkern.c                          |  67 ++++
 include/linux/iio/consumer.h                  |  11 +
 include/sound/soc-dapm.h                      |  12 +-
 sound/soc/codecs/Kconfig                      |  12 +
 sound/soc/codecs/Makefile                     |   2 +
 sound/soc/codecs/simple-iio-aux.c             | 307 ++++++++++++++++++
 7 files changed, 475 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/sound/simple-iio-aux.yaml
 create mode 100644 sound/soc/codecs/simple-iio-aux.c

-- 
2.39.2

