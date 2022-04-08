Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CB2524F99F7
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Apr 2022 17:55:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6D48518B0;
	Fri,  8 Apr 2022 17:55:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6D48518B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649433357;
	bh=JY50eyb1Mb6nbxJQWNuqndnSyQ6MSEzy96ioPbMf2ao=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Zk+j6wRnOSnRN/I92fc8dQ+ich0R+fC+yZ7Yd5vP7xfhy6sE/uz3QtD7NF36JM3qU
	 QnzDwvg4cFF2zwzU3kL0hiQrwYSOXvpSt9Q7eL3HOFNhrvExwpJALA7maHpi2j2cWA
	 StI11QCYRrMzhu/xRT9O+dKzr92Ft+bJE2TRcQ7Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CE744F80116;
	Fri,  8 Apr 2022 17:54:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8738EF8014E; Fri,  8 Apr 2022 17:54:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.4 required=5.0 tests=MISSING_DATE,MISSING_MID,
 PRX_BODYSUB_18,PRX_BODY_14,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 1F67DF80128
 for <alsa-devel@alsa-project.org>; Fri,  8 Apr 2022 17:54:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1F67DF80128
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1649433289681226015-webhooks-bot@alsa-project.org>
References: <1649433289681226015-webhooks-bot@alsa-project.org>
Subject: Gigabyte Z590 Aorus Pro AX - No sound S/PDIF or front ports
Message-Id: <20220408155456.8738EF8014E@alsa1.perex.cz>
Date: Fri,  8 Apr 2022 17:54:56 +0200 (CEST)
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

alsa-project/alsa-ucm-conf issue #147 was opened from quantumsized:

ID 0414:a00e Giga-Byte Technology Co., Ltd USB Audio
I do hope I can resolve this issue of no output from S/PDIF and also front audio jacks not working.
System is Debian 11 Latest Stable & rear analog audio output seems to be working fine.
I can get audio over HDMI too just fine.
I have been following this thread in my spare time: https://gitlab.freedesktop.org/pulseaudio/pulseaudio/-/issues/1337
Admittedly I am a bit lost at moments with the discussion but I'm not new to Linux or even BSD.
Kernel: 5.10.0-13-amd64
All things are standard system-wide as I've not gone outside the mainstream doing any core customization.
I understand at present that the issue stems from UCM ? Anyway, I would love to have my whole system working and am not quite sure what I missed in the threads I've been reading over.
Current UCM version: alsa-ucm-conf (1.2.4-2)
Thanks

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/147
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
