Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A378712AD3F
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Dec 2019 16:38:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 36A9216FC;
	Thu, 26 Dec 2019 16:37:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 36A9216FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1577374710;
	bh=pL6C6iqqvtsFb2hVPLF7Iv27Q7XVnLkFrPvJ6ZO6v5Y=;
	h=From:To:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Fdd+tnAoY4ADDP+8Fmti+wEaOEDp7zUDjqPCgIis8My7T1J84+IqCNIEjdNqRF8cc
	 6LZyQIGrSzof6WnZNa7GsJFDeaD95r3ese2sGSOS+nFH89+7XREHDRHqVpIAWp8KJK
	 i/2fF4DXmMIZX3EcIkfq2cbZFSOUnmEY2um8Rs4U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7DD41F80148;
	Thu, 26 Dec 2019 16:36:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DD857F80139; Thu, 26 Dec 2019 16:36:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 3ACA3F800E3
 for <alsa-devel@alsa-project.org>; Thu, 26 Dec 2019 16:36:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3ACA3F800E3
MIME-Version: 1.0
From: GitHub pull_request - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1577374600304128885-webhooks-bot@alsa-project.org>
References: <1577374600304128885-webhooks-bot@alsa-project.org>
Message-Id: <20191226153643.DD857F80139@alsa1.perex.cz>
Date: Thu, 26 Dec 2019 16:36:43 +0100 (CET)
Subject: [alsa-devel] broadwell-rt286: add support for hardware volume,
	conformance fixes
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

alsa-project/alsa-ucm-conf pull request #9 was edited from dpward:

This commit by @perexg fixes a regression on broadwell-rt286 which causes PulseAudio to abort on startup with:

`E: [pulseaudio] channelmap.c: Assertion 'pa_channels_valid(channels)' failed at pulse/channelmap.c:401, function pa_channel_map_init_extend(). Aborting.`

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/9
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/9.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
