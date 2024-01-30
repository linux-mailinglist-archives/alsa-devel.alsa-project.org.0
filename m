Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C9EF584B1BF
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Feb 2024 10:59:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 60A1EB71;
	Tue,  6 Feb 2024 10:59:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 60A1EB71
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707213571;
	bh=7V3O32k5q5iF15oXFkEescXZTWUBuU5h8LLfuVaOQ+M=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=rX66EH411tnEIjGL9YrqX9JAfDoCmn4yAYRjG+xE8juHEUZSR3X3HDjjGET/evo85
	 JUHZbldSEgE8Kfb1ZcbZB68j08qCvc6J7J/eGxrkvBZfCG+iT4R0L9iw7Kb1ciXBt8
	 QwakiK+yZ5VqKSK+F9G8c6nbr46SVKOJFKazxx9A=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 36811F805DF; Tue,  6 Feb 2024 10:58:38 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 52BABF805C8;
	Tue,  6 Feb 2024 10:58:38 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ABA43F80568; Tue, 30 Jan 2024 10:47:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from air.basealt.ru (air.basealt.ru [194.107.17.39])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DD749F8020D
	for <alsa-devel@alsa-project.org>; Tue, 30 Jan 2024 10:47:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DD749F8020D
Received: by air.basealt.ru (Postfix, from userid 490)
	id C47FE2F2024A; Tue, 30 Jan 2024 09:47:16 +0000 (UTC)
Received: from altlinux.malta.altlinux.ru (obninsk.basealt.ru [217.15.195.17])
	by air.basealt.ru (Postfix) with ESMTPSA id 9B5882F20241;
	Tue, 30 Jan 2024 09:47:14 +0000 (UTC)
From: kovalev@altlinux.org
To: stable@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	u.kleine-koenig@pengutronix.de,
	a.firago@yadro.com,
	sashal@kernel.org,
	zhuning0077@gmail.com,
	tiwai@suse.com,
	perex@perex.cz,
	broonie@kernel.org,
	lgirdwood@gmail.com,
	kovalev@altlinux.org
Subject: [PATCH 6.1.y 0/7] ASoC: codecs: es8326: fix support
Date: Tue, 30 Jan 2024 12:47:01 +0300
Message-Id: <20240130094708.290485-1-kovalev@altlinux.org>
X-Mailer: git-send-email 2.33.8
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: kovalev@altlinux.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 5DEFZTB34JHINJY5QEQKFU434V6THPL3
X-Message-ID-Hash: 5DEFZTB34JHINJY5QEQKFU434V6THPL3
X-Mailman-Approved-At: Tue, 06 Feb 2024 09:58:32 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5DEFZTB34JHINJY5QEQKFU434V6THPL3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

These patches were backported from v6.6 upstream and
are intended for 6.1.y stable kernel.

Patches have been successfully tested on the latest 6.1.75 kernel.

[PATCH 6.1.y 1/7] ASoC: codecs: es8326: Convert to i2c's .probe_new()
[PATCH 6.1.y 2/7] ASoC: codecs: ES8326: Add es8326_mute function
[PATCH 6.1.y 3/7] ASoC: codecs: ES8326: Change Hp_detect register names
[PATCH 6.1.y 4/7] ASoC: codecs: ES8326: Change Volatile Reg function
[PATCH 6.1.y 5/7] ASoC: codecs: ES8326: Fix power-up sequence
[PATCH 6.1.y 6/7] ASOC: codecs: ES8326: Add calibration support for
[PATCH 6.1.y 7/7] ASoC: codecs: ES8326: Update jact detection function

