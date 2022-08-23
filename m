Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 47BE159DADC
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Aug 2022 13:13:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6913BE12;
	Tue, 23 Aug 2022 13:13:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6913BE12
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661253231;
	bh=a4d8B82JLunYyTM+Db6X0TtQuZRb3SFevlEPIQtgNvo=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lfWSofLEUjjqXq0+APZGHzCA8u6yjUjmmPUI1IjgiDl4W5YFbWA0rGKgVVfMbBFz0
	 UT3hO/AAPLBqyfrVqb7yKKg9YNky+82UJMNlAsL9xAXx5SKeSYl37EWQbuLRVL2N18
	 i5aOxlW3V0Q4AgYX/rwM3t8Jq4D4kDsWcM3US7jQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D8A87F8027B;
	Tue, 23 Aug 2022 13:12:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D75AEF800A7; Tue, 23 Aug 2022 13:12:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 2A41EF800A7
 for <alsa-devel@alsa-project.org>; Tue, 23 Aug 2022 13:12:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2A41EF800A7
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1661253162607038021-webhooks-bot@alsa-project.org>
References: <1661253162607038021-webhooks-bot@alsa-project.org>
Subject: DSD hardware quirks and usb vendor id hardcoding
Message-Id: <20220823111250.D75AEF800A7@alsa1.perex.cz>
Date: Tue, 23 Aug 2022 13:12:50 +0200 (CEST)
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

alsa-project/alsa-lib issue #266 was opened from soholt:

I am using tinyusb for UAC2 audio class and line 492 https://github.com/hathach/tinyusb/blob/master/src/class/audio/audio.h
allows: "AUDIO_DATA_FORMAT_TYPE_I_RAW_DATA = 0x80000000"
cat /proc/asound/ reports it as "Format: SPECIAL", but I wanted to be "SPECIAL DSD_U32_xx", so for fun I tried:
0x80000001 which reported as = S32_LE SPECIAL,
0x80000002 = U8 SPECIAL,
0x80000003 = U8 S32_LE SPECIAL
0x800000ff = U8 S32_LE FLOAT_LE MU_LAW A_LAW SPECIAL - seem to recursively add more

Then I found quirks line 1582 https://github.com/torvalds/linux/blob/master/sound/usb/quirks.c
"The UAC standards don't have a designated bit field to denote DSD-capable interfaces, hence all hardware that is known to support this format has to be listed here."

So if I change my usb vendor id to XMOS 0x20b1, only then "Format: SPECIAL" becomes "Format: SPECIAL DSD_U32_BE"

I have no idea if range 0x80000001++ is used for anything or if it could be used for DSD formats like:

0x80000001 = SPECIAL DSD_U8
0x80000002 = SPECIAL DSD_U16_LE
0x80000003 = SPECIAL DSD_U16_BE
0x80000004 = SPECIAL DSD_U32_LE
0x80000005 = SPECIAL DSD_U32_BE

so no future hardcoding is required.

Thanks,
Gin

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/266
Repository URL: https://github.com/alsa-project/alsa-lib
