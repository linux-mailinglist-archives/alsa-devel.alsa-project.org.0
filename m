Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 853B9550975
	for <lists+alsa-devel@lfdr.de>; Sun, 19 Jun 2022 11:12:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CF37D1EF6;
	Sun, 19 Jun 2022 11:11:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CF37D1EF6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655629931;
	bh=FQsgfIjuKEcetV99ANoRil9FsjvrjOOtFSxiKL7rFFY=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nXmin15+jTRoIdP8BSTLO0IysO8Y+d8J/3EtLkgiSx2K4rk6WgL5ZzmxIHLJp8sLa
	 eFtCF18NYwvg4UoQyX4OuAUPebqP0VYdFkcS2uZ7M7lSgSY/OquzgQAL4aTJvpV8gw
	 epkxgWGTPQsLs54OIIYuBAezK5/BGoZ3cJKYKZQs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 98EE4F80245;
	Sun, 19 Jun 2022 11:11:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 755BAF8020D; Sun, 19 Jun 2022 11:11:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 55891F800E4
 for <alsa-devel@alsa-project.org>; Sun, 19 Jun 2022 11:11:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 55891F800E4
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1655629862636706114-webhooks-bot@alsa-project.org>
References: <1655629862636706114-webhooks-bot@alsa-project.org>
Subject: Alsa-to-Jack bridge broken in alsa* 1.2.7.x
Message-Id: <20220619091109.755BAF8020D@alsa1.perex.cz>
Date: Sun, 19 Jun 2022 11:11:09 +0200 (CEST)
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

alsa-project/alsa-lib issue #243 was opened from hlekin:

I am using a setup according to https://alsa.opensrc.org/Jack_and_Loopback_device_as_Alsa-to-Jack_bridge

Since the upgrade of alsa-lib, alsa-ucm-conf, and alsa-utils to version 1.2.7, my alsa-to-jack-bridge setup is broken:
$ jack_connect system:capture_1 ploop:playback_1
ERROR ploop:playback_1 not a valid port
A downgrade to versions 1.2.6 resolves the issue. Versions 1.2.7.1 result in the same error.

The relevant output of qjackctl 0.9.7-2 > Messages is:
Cannot write socket fd = 25 err = Broken pipe
CheckRes error
Could not write notification
ClientNotify fails name = cloop notification = 0 val1 = 0 val2 = 0
NotifyAddClient old_client fails name = ploop
Cannot write socket fd = 28 err = Broken pipe
CheckRes error
Could not write notification
ClientNotify fails name = ploop notification = 1 val1 = 0 val2 = 0
ERROR ploop:playback_1 not a valid port
ERROR ploop:playback_2 not a valid port
ERROR cloop:capture_1 not a valid port
ERROR cloop:capture_2 not a valid port

Please find attached alsa-info.sh output for alsa-versions 1.2.7.1 and 1.2.6
[alsa-info.sh-output-220619.zip](https://github.com/alsa-project/alsa-lib/files/8935020/alsa-info.sh-output-220619.zip)
.
I am aware, that this is a very poor bug report. Please ask for any information you need!

By the way, many thanks for all your programs and the effort you put in to them.

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/243
Repository URL: https://github.com/alsa-project/alsa-lib
