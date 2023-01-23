Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BE22677D4F
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Jan 2023 15:00:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7C1323334;
	Mon, 23 Jan 2023 14:59:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7C1323334
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674482426;
	bh=Vj+HPLW2Ygm2hD/Ljb2EDeQPx+Imk0G350r6yRYoGPc=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=HulAjCnFibPhjDLGhBxn1xDz6BEgXozKiZjyHvf5oKXYxSJ3S75C/tKuOIrlWueFf
	 ygUohpyS1NuO/J6W2y8BpmhlHS6ydMqZUKyCW4w7Ib/Kl6C65EpaT9ZyVHO5N5Mow0
	 t1k4E4nLbg0BW89sn0UqVLJSmrmkHfieT+BRBMVU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B3AABF804FD;
	Mon, 23 Jan 2023 14:59:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F355EF804F3; Mon, 23 Jan 2023 14:59:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 97D88F800FB
 for <alsa-devel@alsa-project.org>; Mon, 23 Jan 2023 14:59:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 97D88F800FB
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=axis.com header.i=@axis.com header.a=rsa-sha256
 header.s=axis-central1 header.b=jD1PN3We
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis.com; q=dns/txt; s=axis-central1; t=1674482359;
 x=1706018359;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=i8on6vz/Y8C01TnbzJd94dunJQctpVXOIR3eiTNXE0g=;
 b=jD1PN3WezWPuQE0xpnO8bvOQQG2zIc4BZTQwpTolSdD0gF3OrmlkJbiD
 lPcbh6DqgtOcIRs5SRq6tL0GDf68Ha14nSYX0fETTsZO7HB3QF5Gb6r7v
 pjpxXNoD0YhwjAnBVJFfXC01RokzYYAwUmPBPyafPY0Eu/iLIwmMdKK5X
 paIZUyZqwol5Mt5VswydrQuPKmnRUzbZ/jHMiFgbgJBAujnS8+Q/lxZ9j
 x21l/m19gTHYS/Bm4/3SYQsWuzW8FhgPDXqCGrK3qLppE44dRzVYUokO0
 r/WYzFZ3ucO3GfOFqiqucehak5yK8Fx02Gdu05y5qB+lQJpVafr/S6RcW w==;
From: Astrid Rost <astrid.rost@axis.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v3 0/3] ASoC: simple-card-utils: create jack inputs for
 aux_devs
Date: Mon, 23 Jan 2023 14:59:10 +0100
Message-ID: <20230123135913.2720991-1-astrid.rost@axis.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, kernel@axis.com, linux-kernel@vger.kernel.org,
 Astrid Rost <astrid.rost@axis.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Add a generic way to create jack inputs for auxiliary jack detection
drivers (e.g. via i2c, spi), which are not part of any real codec.
The simple-card can be used as combining card driver to add the jacks,
no new one is required.

Create a jack (for input-events) for jack devices in the auxiliary
device list (aux_devs). A device which returns a valid value on
get_jack_type counts as jack device; set_jack is required
to add the jack to the device.

v1 -> v2: Auxiliary jack drivers return the correct snd_jack_type with
 the function: get_jack_type.
- No devicetree changes in simple-card.
- soc-component: changed name to: get_jack_type.
- simple-jack-utils: updated algorithm to add jack devices.
   A device which returns a valid value on get_jack_type counts as jack
   device
- ts3a227e: added devicetree property jack-type, added NULL check for jack.

v2 -> v3:  ts3a227e: remove devictree property.

Astrid Rost (3):
  [PATCH v3 1/3] ASoC: soc-component: add get_jack_type
  [PATCH v3 2/3] ASoC: simple-card-utils: create jack inputs for aux_devs
  [PATCH v3 3/3] ASoC: ts3a227e: add set_jack and get_jack_type

 include/sound/simple_card_utils.h     |  3 ++
 include/sound/soc-component.h         |  2 ++
 sound/soc/codecs/ts3a227e.c           | 20 ++++++++++-
 sound/soc/generic/simple-card-utils.c | 49 +++++++++++++++++++++++++++
 sound/soc/generic/simple-card.c       |  4 +++
 sound/soc/soc-component.c             | 20 +++++++++++
 6 files changed, 97 insertions(+), 1 deletion(-)

-- 
2.30.2

