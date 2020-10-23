Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ADE5B296CFD
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Oct 2020 12:42:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 49573181D;
	Fri, 23 Oct 2020 12:42:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 49573181D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603449772;
	bh=8+sNEFALbIiMGdPzsu6KzyB9KaYGvEb8eJiXJ9L/JYw=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=i/tyC/hhJiI3/xqLshLII26Hh6j3plmaG3jLWCd0YYg9rzTg0y4lg43RfVHtGS59m
	 1GlvOeBaohLEcLWyg/C0NCP/Z9CjOGCd2mPlz1GS0FHdTAUvCUXOPlpvJ8gWcwjHLb
	 UWC0tjU5QvGgzarE0YndFGGlhUnwYWyrVlpl29zw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E4EE3F80264;
	Fri, 23 Oct 2020 12:41:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 17DF0F8025A; Fri, 23 Oct 2020 12:41:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id B0B9EF80245
 for <alsa-devel@alsa-project.org>; Fri, 23 Oct 2020 12:41:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B0B9EF80245
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1603449674682427883-webhooks-bot@alsa-project.org>
References: <1603449674682427883-webhooks-bot@alsa-project.org>
Subject: PA poll wakeup issue (was: bug in the ALSA driver 'snd_hda_intel')
Message-Id: <20201023104118.17DF0F8025A@alsa1.perex.cz>
Date: Fri, 23 Oct 2020 12:41:18 +0200 (CEST)
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

alsa-project/alsa-lib issue #90 was edited from Mysgym:

Hello,
after spending some time troubleshooting an issue with an audio interface (using snd_hda_intel). I've stumbled upon this message from PulseAudio in the journal :
`Oct 17 18:30:58 LaptopName pulseaudio[1782]: E: [alsa-sink-ALC256 Analog] alsa-sink.c: ALSA woke us up to write new data to the device, but there was actually nothing to write.
Oct 17 18:30:58 LaptopName pulseaudio[1782]: E: [alsa-sink-ALC256 Analog] alsa-sink.c: Most likely this is a bug in the ALSA driver 'snd_hda_intel'. Please report this issue to the ALSA developers.
Oct 17 18:30:58 LaptopName pulseaudio[1782]: E: [alsa-sink-ALC256 Analog] alsa-sink.c: We were woken up with POLLOUT set -- however a subsequent snd_pcm_avail() returned 0 or another value < min_avail.
`
So I filed a bug report

This is Manjaro on Kernel 5.8

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/90
Repository URL: https://github.com/alsa-project/alsa-lib
