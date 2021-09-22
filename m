Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D52941479A
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Sep 2021 13:16:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E9BEA15DC;
	Wed, 22 Sep 2021 13:15:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E9BEA15DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632309365;
	bh=I6uamnZeAQ283vbEwxuwCo93UVjqaEP9cbo9tHnpFC0=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YBcORkL5qZPX2y/l71TqPga6ocfqSOXSym/eo5eYjnG6BJV4FZjvGNiMxaAQIgn39
	 bshrzknocb7vYHwAXexHVzbEp3ec8xmqODygaWv15M2YgTa4Nc7uAMuFu7JXO+ndeH
	 UH1hN+nNu9vuj3rw4lyBX3HJ00LA5has/K20tTeY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 69673F80279;
	Wed, 22 Sep 2021 13:14:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A9B86F8025D; Wed, 22 Sep 2021 13:14:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id D73ABF8014E
 for <alsa-devel@alsa-project.org>; Wed, 22 Sep 2021 13:14:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D73ABF8014E
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1632309281569562912-webhooks-bot@alsa-project.org>
References: <1632309281569562912-webhooks-bot@alsa-project.org>
Subject: Redesign the rawmidi midi read with timestamping API
Message-Id: <20210922111446.A9B86F8025D@alsa1.perex.cz>
Date: Wed, 22 Sep 2021 13:14:46 +0200 (CEST)
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

alsa-project/alsa-lib pull request #179 was opened from perexg:

It's follow-up for https://github.com/alsa-project/alsa-lib/pull/173 and https://github.com/alsa-project/alsa-lib/issues/172 . 

I am confident, that the direct framing mechanism for the transfer of the midi stream with the timestamping should be hidden and abstracted in the alsa-lib's API. This version uses a new read function (`snd_rawmidi_tread()`) which decodes and merges the data from the kernel frames. The framing mechanism is very specific to the kernel API and the cost of added data copy is negligible in this case (the kernel code basically does similar thing).

I kept the `snd_rawmidi_read()` functionality to read raw frames), but the structure for the parsing must be defined on it's own. This mechanism is unsupported.

This version seems more abstract and easy to use for apps than the separate decoder function for `snd_rawmidi_read()`.

Request URL   : https://github.com/alsa-project/alsa-lib/pull/179
Patch URL     : https://github.com/alsa-project/alsa-lib/pull/179.patch
Repository URL: https://github.com/alsa-project/alsa-lib
