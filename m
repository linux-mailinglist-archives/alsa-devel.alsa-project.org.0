Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D24317D0F7
	for <lists+alsa-devel@lfdr.de>; Sun,  8 Mar 2020 04:16:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 35C841668;
	Sun,  8 Mar 2020 04:15:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 35C841668
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583637372;
	bh=/lA45t3HMSrezZJ68hsPlWZYm7O9KJxLKmrYY5YaTF8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=WHvFmIaQujzM3ceT1V5nJIuYx7B2P9cZ72eU9RtxONgg2ZO4er6XBlrsqmj3FnjB/
	 dsMh2EzSQAYjW/tENO6/MXFRyeGihoW8l/lctwlwJj58vWlFO8V1CWB5jnTvSMbgDH
	 X8UJZoMIIJo9jezoAcantRH2CEdZaIQ84baZizXU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4A388F800B5;
	Sun,  8 Mar 2020 04:14:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C6D9DF8020C; Sun,  8 Mar 2020 04:14:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail.manjaro.org (mail.manjaro.org [176.9.38.148])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 821A6F800B5
 for <alsa-devel@alsa-project.org>; Sun,  8 Mar 2020 04:14:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 821A6F800B5
Received: from localhost (localhost [127.0.0.1])
 by mail.manjaro.org (Postfix) with ESMTP id 8509C3960EFB;
 Sun,  8 Mar 2020 04:14:20 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at manjaro.org
Received: from mail.manjaro.org ([127.0.0.1])
 by localhost (manjaro.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D4ahqBaiLqYL; Sun,  8 Mar 2020 04:14:18 +0100 (CET)
From: Tobias Schramm <t.schramm@manjaro.org>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [RFC PATCH 0/1] Use native gpiolib inversion for jack gpios
Date: Sun,  8 Mar 2020 04:13:54 +0100
Message-Id: <20200308031355.1149173-1-t.schramm@manjaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 Tobias Schramm <t.schramm@manjaro.org>, linux-kernel@vger.kernel.org
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

This patch changes the logic used for jack gpio state inversion to
utilize gpiolib inversion.

Previously the gpio active state would not correspond to the plugged-in
state of the jack. Since the active state of a gpio is usually defined by
its purpose in a specific application I'd expect the active state to
represent the jacks plug status.

However, judging by the users [1], [2] of snd_soc_jack_add_gpiods the
ACPI tables of some devices seem to indicate the "wrong" polarity for
their jack detect gpios.
I'm not entirely sure how to deal with those devices. At the moment I'd
vote for inverting the gpio active level again
(via gpiod_toggle_active_low) inside snd_soc_jack_add_gpios if
gpio->gpiod_dev != NULL and gpio->invert is set.

I'm not entirely sure about [3] either. In my opinion removing invert = 1
from ams_delta_hook_switch_gpios and adding GPIO_ACTIVE_LOW to the flags
of hook_switch in [4] would be the right move here.

What are your thoughts on this?


Best regards,

Tobias

[1] /sound/soc/intel/boards/byt-max98090.c
[2] /sound/soc/intel/boards/cht_bsw_max98090_ti.c
[3] /sound/soc/ti/ams-delta.c
[4] /arch/arm/mach-omap1/board-ams-delta.c

Tobias Schramm (1):
  ASoC: jack: use gpiolib inversion flag for inverted gpios

 sound/soc/soc-jack.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

-- 
2.24.1

