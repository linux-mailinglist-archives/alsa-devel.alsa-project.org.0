Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 052C61F48EF
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Jun 2020 23:38:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5F42015E5;
	Tue,  9 Jun 2020 23:38:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5F42015E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591738732;
	bh=Vdyi64NjcxOvUMUZcyhed0RvSAnhp4Dq/7FdZ21SXP4=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WOGWxs6one2zEFILmAWM4pyDUw4ElaZAieXkaM5UNP3JHLIByGGxdR40ak51dtG77
	 VvFloKJyldyqMe6ZaWBGGkm95hbKJc8A38T7LuvDdTrLTyx8gc47z0YX4ku2tOPl27
	 DOMVamREkNyLBpRen0arP2AO8Lu2EjzAjIvBV9AY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 753A3F80278;
	Tue,  9 Jun 2020 23:37:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 68678F8028C; Tue,  9 Jun 2020 23:37:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 05990F80088
 for <alsa-devel@alsa-project.org>; Tue,  9 Jun 2020 23:37:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 05990F80088
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1591738616837069035-webhooks-bot@alsa-project.org>
References: <1591738616837069035-webhooks-bot@alsa-project.org>
Subject: We were woken up with POLLOUT set -- however a subsequent
 snd_pcm_avail()
 returned 0 or another value < min_avail. Jun 09 14:31:33 elrond
 pulseaudio[11933]: Most likely this is a bug in the ALSA driver
 'snd_usb_audio'. Please report this issue to the ALSA developers. Jun 09
 14:31:33 elrond pulseaudio[11933]: ALSA woke us up to write new data to the
 device, but there was actually nothing to write.
Message-Id: <20200609213709.68678F8028C@alsa1.perex.cz>
Date: Tue,  9 Jun 2020 23:37:09 +0200 (CEST)
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

alsa-project/alsa-lib issue #57 was opened from danieloppenlander:

I ran across an error in my journalctl on Ubuntu 20.04. It said to report a bug. Here is my alsa-info.sh output: http://alsa-project.org/db/?f=6b505aa5138f2a974037ab5c3a89e1605807df97

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/57
Repository URL: https://github.com/alsa-project/alsa-lib
