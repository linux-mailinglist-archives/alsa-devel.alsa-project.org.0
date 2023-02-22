Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 35E9069F047
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Feb 2023 09:34:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 115C0E86;
	Wed, 22 Feb 2023 09:33:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 115C0E86
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677054854;
	bh=Z8vT9Z859MudchPDSSGWPXXT15s/yfR9Q3bT0zWmWXs=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=GNrdioWex6+Io9BwHFszpGivtCiUAMCh21goscsfQ0tAU4YluYw9l8hFrwYNjltfS
	 Kn3pFD7/UzC1Ph1qf5dLWejB7aUo3k4k8rVHWmoqUxA8yL/0bnn08D3Lh/IX0BkY02
	 YURAF8hzeJ3qcuRbwodQPL7ZjIlo93N892m2ROhA=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1B612F8025A;
	Wed, 22 Feb 2023 09:33:18 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 339DDF8047C; Wed, 22 Feb 2023 09:33:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::231])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 35B6AF8025A
	for <alsa-devel@alsa-project.org>; Wed, 22 Feb 2023 09:33:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 35B6AF8025A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Ffw3tTvu
Received: (Authenticated sender: kamel.bouhara@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 69849100003;
	Wed, 22 Feb 2023 08:33:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1677054785;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=MF6u4u7TyQxUtEY9u6Z4hqRexx2GVbwM5SSm0K6MZHk=;
	b=Ffw3tTvuxpya3uZtylJgoFJqWB9PgMfxIWSJdY8XvqSjFPxN0mchPvxK0bV7T3reBJAVTW
	EQL5C4kKWLz0kgPGwDf3I2YuO5WdK9vZBl9whqd2GBdDg+teJLp01bq4WoQyujNp+HvD+V
	9kdfre4inEcOKZ7cCSUwj++MeuUj2qZhT4xna8+sQy392E3zaLNvaH1sloNmIjVsVVJxqP
	tRXORlAeMS4WEIzU6OSQtuFb237XkTEiwH9ES00wzqIHuPerztoYSBL7RlMFsDQJKIC3U9
	K082kQrK5DnV1p/rAeRDmenfrFsyvldCIEB3SHJaPfy9m2NXmauxcHGjKFJvXA==
From: Kamel Bouhara <kamel.bouhara@bootlin.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Kevin Cernekee <cernekee@chromium.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Crt Mori <cmo@melexis.com>,
	alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] Add support for the TAS5733
Date: Wed, 22 Feb 2023 09:32:58 +0100
Message-Id: <20230222083300.218523-1-kamel.bouhara@bootlin.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: ZV6HDYWHJPGZUFR7XFIXKRBC4NKT77G7
X-Message-ID-Hash: ZV6HDYWHJPGZUFR7XFIXKRBC4NKT77G7
X-MailFrom: kamel.bouhara@bootlin.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Kamel Bouhara <kamel.bouhara@bootlin.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZV6HDYWHJPGZUFR7XFIXKRBC4NKT77G7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hello,

This small series extends the tas571x driver to support the TAS5733
audio power amplifier.

Kamel Bouhara (2):
  ASoC: tas571x: add tas5733 compatible
  ASoC: tas571x: add support for TAS5733

 .../devicetree/bindings/sound/tas571x.txt     |  1 +
 sound/soc/codecs/tas571x.c                    | 59 +++++++++++++++++++
 2 files changed, 60 insertions(+)

-- 
2.35.1

