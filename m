Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A59758A9F3D
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Apr 2024 17:56:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1792D2367;
	Thu, 18 Apr 2024 17:56:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1792D2367
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713455807;
	bh=nmLAaYhyBUsFaBrhRWWZAQOdq6RHarRIgwAD5BZLtvY=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=freIkv/jVUElzuxqeAscnk1dApGTm3RowNYdI70jPtzXMvY2F/UCXAntdPEXQrGZ0
	 BD7ALZB2a+lnIiLtfyD/O65cZ888EYs9QTBYHE2qVKa6lZB2HjS0vjZ7xfFYFnef/C
	 8PvP5z7zrY7/dP0l1xRK/k9qUDztxdD3ONPp+Zd8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5B90AF8062D; Thu, 18 Apr 2024 17:52:36 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 53566F80622;
	Thu, 18 Apr 2024 17:52:36 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C2694F80570; Wed, 17 Apr 2024 10:31:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=unavailable
	autolearn_force=no version=3.4.6
Received: from air.basealt.ru (air.basealt.ru [194.107.17.39])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 20899F80124
	for <alsa-devel@alsa-project.org>; Wed, 17 Apr 2024 10:31:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 20899F80124
Received: by air.basealt.ru (Postfix, from userid 490)
	id EA3282F2024D; Wed, 17 Apr 2024 08:31:26 +0000 (UTC)
Received: from altlinux.malta.altlinux.ru (obninsk.basealt.ru [217.15.195.17])
	by air.basealt.ru (Postfix) with ESMTPSA id 2F67A2F20242;
	Wed, 17 Apr 2024 08:31:18 +0000 (UTC)
From: kovalev@altlinux.org
To: stable@vger.kernel.org
Cc: broonie@kernel.org,
	lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	zhuning0077@gmail.com,
	u.kleine-koenig@pengutronix.de,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: [PATCH ver.2 6.1.y 0/6] ASoC: codecs: es8326: fix support (backport
 from v6.6)
Date: Wed, 17 Apr 2024 11:31:10 +0300
Message-Id: <20240417083116.608610-1-kovalev@altlinux.org>
X-Mailer: git-send-email 2.33.8
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: kovalev@altlinux.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: AYUJUOIZYM4G22SVWTYQWORGWTGGOCKO
X-Message-ID-Hash: AYUJUOIZYM4G22SVWTYQWORGWTGGOCKO
X-Mailman-Approved-At: Thu, 18 Apr 2024 15:52:29 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AYUJUOIZYM4G22SVWTYQWORGWTGGOCKO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Without these patches, all tested laptop models using the es8326 audio codec
have no sound from the speakers and headphones, and the headset microphone
does not work. Although the initialization of the sound card is successful.

--
ver.2:
drop a commit that does not affect the fix of functionality;
added an explanation that does not work on the current version of the kernel
without patches.
--

Patches have been successfully tested on the latest 6.1.86 kernel.

[PATCH 6.1.y 1/6] ASoC: codecs: ES8326: Add es8326_mute function
[PATCH 6.1.y 2/6] ASoC: codecs: ES8326: Change Hp_detect register names
[PATCH 6.1.y 3/6] ASoC: codecs: ES8326: Change Volatile Reg function
[PATCH 6.1.y 4/6] ASoC: codecs: ES8326: Fix power-up sequence
[PATCH 6.1.y 5/6] ASOC: codecs: ES8326: Add calibration support for
[PATCH 6.1.y 6/6] ASoC: codecs: ES8326: Update jact detection function

