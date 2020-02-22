Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D0F51168E23
	for <lists+alsa-devel@lfdr.de>; Sat, 22 Feb 2020 11:13:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3FAB016B5;
	Sat, 22 Feb 2020 11:13:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3FAB016B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582366438;
	bh=puwqONFtzD+u7eeHzERmuXwkxEunR5bkA2TrCQ4JZ60=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=deOq98LmBeixici9cjTdaLqSs0mpNEcPc2ziA6EgYvLtliuZO0EP95fVHW51GFR5J
	 Go+4yzu90wTtarJ/sRCPke8vjRXAYuKhvYFxwhRDmPdVHkLJ8FajLSqE3If8v4dQXY
	 utodJvxM1n5xQ4x+PMpobC3N7D5k7TjLUXnpXDsA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0C464F800F3;
	Sat, 22 Feb 2020 11:12:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1AA56F80148; Sat, 22 Feb 2020 11:12:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 5FC29F8011D
 for <alsa-devel@alsa-project.org>; Sat, 22 Feb 2020 11:12:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5FC29F8011D
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1582366330622344017-webhooks-bot@alsa-project.org>
References: <1582366330622344017-webhooks-bot@alsa-project.org>
Subject: amixer not setting Master volume at a given percentage value (check
 with 85% to 90%)
Message-Id: <20200222101214.1AA56F80148@alsa1.perex.cz>
Date: Sat, 22 Feb 2020 11:12:14 +0100 (CET)
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

alsa-project/alsa-utils issue #35 was opened from immortalaxay:

I am using Ubuntu 18.04 (alsa-utils/amixer version 1.1.3) and trying to set volume using amixer command but amixer not setting Master volume at the given percentage value.



$ amixer -M -c PCH sset Master **85**%
Simple mixer control 'Master',0
  Capabilities: pvolume pvolume-joined pswitch pswitch-joined
  Playback channels: Mono
  Limits: Playback 0 - 87
  Mono: Playback 81 [**83**%] [-4.50dB] [on]

$ amixer -M -c PCH sset Master **86**%
Simple mixer control 'Master',0
  Capabilities: pvolume pvolume-joined pswitch pswitch-joined
  Playback channels: Mono
  Limits: Playback 0 - 87
  Mono: Playback 82 [**85**%] [-3.75dB] [on]

$ amixer -M -c PCH sset Master **87**%
Simple mixer control 'Master',0
  Capabilities: pvolume pvolume-joined pswitch pswitch-joined
  Playback channels: Mono
  Limits: Playback 0 - 87
  Mono: Playback 82 [**85**%] [-3.75dB] [on]

$ amixer -M -c PCH sset Master **88**%
Simple mixer control 'Master',0
  Capabilities: pvolume pvolume-joined pswitch pswitch-joined
  Playback channels: Mono
  Limits: Playback 0 - 87
  Mono: Playback 82 [**85**%] [-3.75dB] [on]

$ amixer -M -c PCH sset Master **89**%
Simple mixer control 'Master',0
  Capabilities: pvolume pvolume-joined pswitch pswitch-joined
  Playback channels: Mono
  Limits: Playback 0 - 87
  Mono: Playback 83 [**88**%] [-3.00dB] [on]

$ amixer -M -c PCH sset Master **90**%
Simple mixer control 'Master',0
  Capabilities: pvolume pvolume-joined pswitch pswitch-joined
  Playback channels: Mono
  Limits: Playback 0 - 87
  Mono: Playback 83 [**88**%] [-3.00dB] [on]

Issue URL     : https://github.com/alsa-project/alsa-utils/issues/35
Repository URL: https://github.com/alsa-project/alsa-utils
