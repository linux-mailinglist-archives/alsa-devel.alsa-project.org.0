Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 96DBC671CAD
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Jan 2023 13:53:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 019EC70C1;
	Wed, 18 Jan 2023 13:52:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 019EC70C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674046413;
	bh=ZkmMJQq6Cpp8Io8AFDkZ1+K0Y/ECGd+9ulIh9pW3asI=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=rgYxaYSA5NXDaGKJ/jtd1LMC1QpVNmUIkOOx1mQO19retAv+P94D7Tjy7EcmgIV/N
	 5D0jzimzzWv3/kOhOs6NFGCiEVnmN3TMEEd4jQyJ1Y9HAm2D6t8v81Ng2bDWiK0qzE
	 3GCrZZQIBGOYWzBprLg0QzzSCPbz+dJlhX40wuKw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9A945F80482;
	Wed, 18 Jan 2023 13:52:34 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5EFD4F8024C; Wed, 18 Jan 2023 13:52:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DCC51F8024C
 for <alsa-devel@alsa-project.org>; Wed, 18 Jan 2023 13:52:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DCC51F8024C
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=axis.com header.i=@axis.com header.a=rsa-sha256
 header.s=axis-central1 header.b=UXoYcsPl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis.com; q=dns/txt; s=axis-central1; t=1674046351;
 x=1705582351;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=o0DfuEULqUsAV5hFmVD5dpXwoVgIGc6OdHCzJL9RknI=;
 b=UXoYcsPlEGN2z2AARacNQlXTY6CoZb7nKj9mVD3/UWkHhOnL7v65YUWL
 G9a9fYq05gkz4bLKkQHLYo5whI9ldoP1fUWJE7/ckwsEQDNfy+IDD1pUs
 98a91Fxo23hco7O6zQ9Q0AbB/Tcfa2jVdDe9Q1devN84anugYMxFUI0is
 Ce65GFyaOEB0QCtzFUahaWb4UB5bXpl4eIRiG6KUapBHndHFhoVpdiBtx
 o1R/mh1fCA3/fJTfi1I/kOKorIJISe0oYqaSHDvn5DH1uFQ/IQVr/J3Z7
 hS95HmAQgemW++IeiZa/Wg82p/Eg3dPno704H8HFuxBWZQHojbJ5U54Af A==;
From: Astrid Rost <astrid.rost@axis.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v1 0/4] ASoC: simple-card-utils: jack for aux_devs
Date: Wed, 18 Jan 2023 13:52:22 +0100
Message-ID: <20230118125226.333214-1-astrid.rost@axis.com>
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
device list (aux_devs). A device which has the functions set_jack and
get_jack_supported_type counts as jack device.

Add a devicetree entry, in case not all input types are required.
simple-card,aux-jack-types:
Array of snd_jack_type to create jack-input-event for jack devices in
aux-devs. If the setting is 0, the supported type of the device is used.

Astrid Rost (4):
  [PATCH v1 1/4] ASoC: soc-component: add get_jack_supported_type
  [PATCH v1 2/4] ASoC: simple-card-utils: create jack inputs for aux_devs
  [PATCH v1 3/4] ASoC: ts3a227e: add set_jack and get_jack_supported_type
  [PATCH v1 4/4] ASoC: dt-bindings: simple-card: create jack for aux_devs

 .../bindings/sound/simple-card.yaml           | 35 +++++++++++
 include/sound/simple_card_utils.h             |  3 +
 include/sound/soc-component.h                 |  2 +
 sound/soc/codecs/ts3a227e.c                   | 17 ++++-
 sound/soc/generic/simple-card-utils.c         | 63 +++++++++++++++++++
 sound/soc/generic/simple-card.c               |  4 ++
 sound/soc/soc-component.c                     | 18 ++++++
 7 files changed, 141 insertions(+), 1 deletion(-)

-- 
2.30.2

