Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C0077648B7C
	for <lists+alsa-devel@lfdr.de>; Sat, 10 Dec 2022 00:51:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 237D8198D;
	Sat, 10 Dec 2022 00:51:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 237D8198D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670629912;
	bh=6ADqzSk5+6eO2WYnoBg2WWluUV1JBAFlhL7jg4fVFXE=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Fbkl+JDy+ftPFsPBwehF1tESQudWqE7GOovHayMd3J6BZZkVAXZhROMy4iIA2xWIv
	 eAWtvIkHiqgFPxacOQ6DA9ktroQkt5N4Cnl1QNDMhdIP1V+0oeYY8dZ9adJeBQcA9t
	 4zESfoNwcQEiam+nUFl5Rp+ZWmXhH1CIfExNugCs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E5B6CF8016E;
	Sat, 10 Dec 2022 00:50:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 13E84F8024D; Sat, 10 Dec 2022 00:50:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 RCVD_IN_DNSWL_HI,SPF_FAIL,SPF_HELO_NONE,URIBL_BLOCKED shortcircuit=no
 autolearn=ham autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 91604F8016E
 for <alsa-devel@alsa-project.org>; Sat, 10 Dec 2022 00:50:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 91604F8016E
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1670629851068506956-webhooks-bot@alsa-project.org>
References: <1670629851068506956-webhooks-bot@alsa-project.org>
Subject: Sound is pitched and slowed down when going through the sound card of
 a mixer controller
Message-Id: <20221209235053.13E84F8024D@alsa1.perex.cz>
Date: Sat, 10 Dec 2022 00:50:53 +0100 (CET)
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

alsa-project/alsa-firmware issue #7 was opened from mYnDstrEAm:

First of all I'm not sure if that's a bug in ALSA and if so if this is the right repo to file it.

When I connect my mixer to my Debian11/KDE machine the sound is slowed and pitched down. Sometimes it takes days or weeks until this effect occurs, most of the time everything works well and I don't know what causes this to occur.

**See https://unix.stackexchange.com/questions/572895/linux-sound-is-pitched-and-slowed-down-when-going-through-the-sound-card-of-a-mi (and comments below)**

`aplay -l` says the driver is module-alsa-card.c. The track is still pitched down when played with `aplay`.

I'm not sure if the sound really is slowed down or if it was changed in a slightly different way in the past (had this bug for years now), but right now when I use my mixer rather than internal audio, the sound is lower in pitch. Let me know if there's something I could check like something in some logs.

Issue URL     : https://github.com/alsa-project/alsa-firmware/issues/7
Repository URL: https://github.com/alsa-project/alsa-firmware
