Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A9C31F6694
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Jun 2020 13:26:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 083BF1687;
	Thu, 11 Jun 2020 13:25:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 083BF1687
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591874772;
	bh=+9M69bNXuUJz3cRzKazZy0fEvV/AcejM8SZ/Xxzz5MY=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MwrivVteLPWW4PYu9bKAi1jVy1OfbYz53vgc/Uk7lE51TbHkcWNcK9eY2qPDWYaak
	 V/c1xYGpHEvNyT/ncL/0DxLQMT90yZ11r4VwTyEaviGotUdQXUVpoh02M/spshFdcd
	 0Mn70CpLI2igLxE7QnMb3uM39YtTiq5yo7KN4X0o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 311CEF8028D;
	Thu, 11 Jun 2020 13:24:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DCA19F8028C; Thu, 11 Jun 2020 13:24:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 5AD2CF800CC
 for <alsa-devel@alsa-project.org>; Thu, 11 Jun 2020 13:24:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5AD2CF800CC
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1591874664591289043-webhooks-bot@alsa-project.org>
References: <1591874664591289043-webhooks-bot@alsa-project.org>
Subject: alsa-gobject: obsolete abstract class for `snd_timer_read` and
 `snd_timer_tread` structure
Message-Id: <20200611112428.DCA19F8028C@alsa1.perex.cz>
Date: Thu, 11 Jun 2020 13:24:28 +0200 (CEST)
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

alsa-project/alsa-gobject pull request #31 was opened from takaswie:

In UAPI of Linux sound subsystem, two types of event is read from ALSA Timer character device; snd_timer_read and snd_timer_tread. Before attached to any timer device, an user instance can select which type of event is expected.

ALSATimer.UserInstance uses one GObject signal to handle these events. These events are defined as derived object from abstract class, ALSATimer.EventData. However, the design pattern is not convenient for some language bindings.

For example, in Rust language, class-based inheritance is not supported. Gtk-rs project produces mechanism to upcast/downcast between super/sub classes and handles GObject class system. In my opinion, the code to upcast/downcast is a bit complicated to handle derivatives.

This patchset obsoletes usage of abstract class for ALSATimer.EventData. Instead, ALSATimer.Event is defined as concrete class and the instance of class is passed to the GObject signal. Applications use APIs to pick up expected type of data from the instance.

Request URL   : https://github.com/alsa-project/alsa-gobject/pull/31
Patch URL     : https://github.com/alsa-project/alsa-gobject/pull/31.patch
Repository URL: https://github.com/alsa-project/alsa-gobject
