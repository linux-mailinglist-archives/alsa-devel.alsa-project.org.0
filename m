Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9868A5FDD25
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Oct 2022 17:28:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 32E9C3260;
	Thu, 13 Oct 2022 17:27:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 32E9C3260
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1665674886;
	bh=92dfefEBZ055w01xQDRXSd+reVgliNEt1bYbYeL/zl8=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BEydufdTszPO27GfuhDYSNEoI6ZjKtquTrIV5Q2LMgImy8OAAWyz7UPJMgONKduCh
	 kTcXrTUUZO8Igd/h0qscdOVHP50wFQz49Kvh2LcJ6z12yu+fv0j8zfpXkK3ItXVaRe
	 OLwcj0qpREQKpcwyWQu2IHJdAeNe77fu9/CbZBsA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AA79DF80431;
	Thu, 13 Oct 2022 17:27:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C83E2F80269; Thu, 13 Oct 2022 17:27:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id BA3E2F800C0
 for <alsa-devel@alsa-project.org>; Thu, 13 Oct 2022 17:27:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BA3E2F800C0
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1665674822166090012-webhooks-bot@alsa-project.org>
References: <1665674822166090012-webhooks-bot@alsa-project.org>
Subject: Software volume control has very little effect on Behringer UMC204HD
Message-Id: <20221013152708.C83E2F80269@alsa1.perex.cz>
Date: Thu, 13 Oct 2022 17:27:08 +0200 (CEST)
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

alsa-project/alsa-ucm-conf issue #230 was edited from Spanfile:

I'm using a Behringer UMC204HD with Pipewire and its UCM profile. The profile works fine that it properly splits the interface's four output channels into two stereo line outputs, and Pipewire is properly using them. There aren't any issues with audio crackling, latency or the sort, but the software volume control is affecting the actual volume output very little. Only the first few "notches" from 0 to 10 change the volume noticeably, however the lowest volume it allows is still somewhat loud. From there on the rest of the range doesn't change the volume much at all.

Using the Direct UCM profile lets the software volume control have much better range, but I need the Line A/B split in my setup so that profile is not an option. I haven't tried disabling UCM and configuring pro audio in Pipewire directly, but that doesn't sound like a proper fix.

It may be intentional, however? [There has been a similar issue reported to Pipewire](https://gitlab.freedesktop.org/pipewire/pipewire/-/issues/2643), but it's not exactly what I'm experiencing. [I've reported this issue to them as well.](https://gitlab.freedesktop.org/pipewire/pipewire/-/issues/2765)

Of course I could set the software volume to something static and control it from the interface, but the interface is physically out of reach from my hands and the software volume is easily controlled from my keyboard ;)

Kernel: 6.0.1.arch1-1
Pipewire: 0.3.59
alsa-ucm-conf: 1.2.7.2
Desktop environment: GNOME (w/ GDM)

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/230
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
