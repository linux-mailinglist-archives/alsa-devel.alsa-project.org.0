Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D1305FA032
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Oct 2022 16:28:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B87E12C39;
	Mon, 10 Oct 2022 16:28:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B87E12C39
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1665412130;
	bh=srOZEpKNfBkpV64Mv/cC2+4PpGaURlkJNyh/54BSsZs=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=F0iVnlOEaOwmNLCT/q0wR9O52D7RwroyXESw8v3uFfsXGbFFtPXeMVCG0CjBWFCoM
	 1/kCiMktuAVu+fkRUWlZgfe0EijTfjSXb+SXZiOPeITD11cGkEnu0mkXBjouOiNebt
	 6KuiKkkgyeBijjwBct8M6Ktn3pLGmEKD3U9Y2k3U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 28D30F8032B;
	Mon, 10 Oct 2022 16:27:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 650F3F80256; Mon, 10 Oct 2022 16:27:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 2A6C6F80155
 for <alsa-devel@alsa-project.org>; Mon, 10 Oct 2022 16:27:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2A6C6F80155
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1665412066717397928-webhooks-bot@alsa-project.org>
References: <1665412066717397928-webhooks-bot@alsa-project.org>
Subject: unable to install alsa-utils with newest pulseaudio
Message-Id: <20221010142753.650F3F80256@alsa1.perex.cz>
Date: Mon, 10 Oct 2022 16:27:53 +0200 (CEST)
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

alsa-project/alsa-utils issue #173 was opened from voncloft:

I installed and upgraded pulse audio to version 16.1

I keep receiving the following error when trying to upgrade alsa-utils (the latest version):

`/bin/sh ../libtool  --tag=CC   --mode=link gcc -Wall -g   -D_REENTRANT  -D_GNU_SOURCE -g -O2 -module -avoid-version -export-dynamic -no-undefined -Wl,-z,defs  -o libasound_module_conf_pulse.la -rpath /usr/lib/alsa-lib conf_pulse.lo -lasound   -lpulse -pthread  -lasound
/bin/grep: /usr/lib/pulseaudio/libpulsecommon-13.0.la: No such file or directory
/bin/sed: can't read /usr/lib/pulseaudio/libpulsecommon-13.0.la: No such file or directory
libtool:   error: '/usr/lib/pulseaudio/libpulsecommon-13.0.la' is not a valid libtool archive
make[2]: *** [Makefile:535: libasound_module_conf_pulse.la] Error 1
make[2]: Leaving directory '/sources/alsa-plugins/pulse'
make[1]: *** [Makefile:444: all-recursive] Error 1
make[1]: Leaving directory '/sources/alsa-plugins'
make: *** [Makefile:376: all] Error 2`

What exactly is going on here?

Issue URL     : https://github.com/alsa-project/alsa-utils/issues/173
Repository URL: https://github.com/alsa-project/alsa-utils
