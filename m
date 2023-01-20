Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EECD967526E
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Jan 2023 11:28:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 847B33091;
	Fri, 20 Jan 2023 11:27:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 847B33091
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674210507;
	bh=p4LzubjMQglDcaTXu0qtsi5u0D8PGikogBiUpkcLbQQ=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=ZkDlCEZpB9rIBAYFW/ghcRp60qM/qAXvJF+NInACZKbMAnsqBh8Pa0rWagH7M7B4Y
	 0qg91BZpK3jl+sjl62h3Dt5M6FJHcBEBc0l34H8N4C19Grfu1RL5YspUbSeZl1wqcE
	 SUcZrwJexyYa6/gryfn44Rr1w6HpgXggRHxSSU+8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 41AFDF8055C;
	Fri, 20 Jan 2023 11:26:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E149EF8053C; Fri, 20 Jan 2023 11:26:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5F173F80246
 for <alsa-devel@alsa-project.org>; Fri, 20 Jan 2023 11:26:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5F173F80246
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=axis.com header.i=@axis.com header.a=rsa-sha256
 header.s=axis-central1 header.b=FgJmG2TV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis.com; q=dns/txt; s=axis-central1; t=1674210364;
 x=1705746364;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=RvZNX3FYVF5mNab85ida8KMtTEb9QvKaCGvhzjrKy1Q=;
 b=FgJmG2TVE3nXMzsNpX7xsebUF1SSGut5ChAf9ML82pQzgczKCJFr6MP5
 8TPKjva3pZ5RWESo3enYLHYXKgNeWi/bcA2vAGG/Wsktiawc2FP+VewFq
 p7z4iqdt83nMPzrYQN0LJXz9R0j64AMuHaZ2xhJ9+4sIP7En4yWb3ITMB
 E2MniFq60vVit39aDaVeP/kV1U2nMR+CKcyHBaS+Q30MvZITtRZo4C0Yd
 u6ZPLQ3Ksxfv4687IgivG4FRk+xEgyHoQcdwLpRuET4v2/QcAAeQGFRc+
 runSM/11+61HP9aurxIKoqcBXn5Hv6NG5gRi5RnEJ8iWa/Px17qqcjcvK w==;
From: Astrid Rost <astrid.rost@axis.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v2 0/4] ASoC: simple-card-utils: create jack inputs for
 aux_devs
Date: Fri, 20 Jan 2023 11:25:50 +0100
Message-ID: <20230120102555.1523394-1-astrid.rost@axis.com>
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

Astrid Rost (4):
  [PATCH v2 1/4] ASoC: soc-component: add get_jack_type
  [PATCH v2 2/4] ASoC: simple-card-utils: create jack inputs for aux_devs
  [PATCH v2 3/4] ASoC: ts3a227e: add set_jack and get_jack_type
  [PATCH v2 4/4] ASoC: dt-bindings: ti,ts3a227e.yaml: add jack-type

 .../bindings/sound/ti,ts3a227e.yaml           |  8 +++
 include/sound/simple_card_utils.h             |  3 ++
 include/sound/soc-component.h                 |  2 +
 sound/soc/codecs/ts3a227e.c                   | 29 ++++++++++-
 sound/soc/generic/simple-card-utils.c         | 49 +++++++++++++++++++
 sound/soc/generic/simple-card.c               |  4 ++
 sound/soc/soc-component.c                     | 20 ++++++++
 7 files changed, 114 insertions(+), 1 deletion(-)

-- 
2.30.2

