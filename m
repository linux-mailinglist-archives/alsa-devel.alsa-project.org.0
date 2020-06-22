Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AC2720389D
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jun 2020 16:01:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EE36216E6;
	Mon, 22 Jun 2020 16:01:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EE36216E6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592834515;
	bh=/p9XDazsxcfXxow+1pP8SgHmOL3tjC3no57s+tfH03Y=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vk3gMGLx7EdxKJGMWRhouXhxZsg3l7U7M7ikG/ncOi3ZZneXWGqJrGPlnJn4Y4n0z
	 KXj0B587NL+3tdOiSLWxh6AQUu/X+p64O74WYgSTtYY0c+oX4F5Kl08WSvkfO2YOc+
	 gGQNjkXZqKin7vNJRky3p++C/3/on0VioIFG9vqQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 262FFF80162;
	Mon, 22 Jun 2020 16:00:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D4FE5F8015B; Mon, 22 Jun 2020 15:59:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id CF910F8010E
 for <alsa-devel@alsa-project.org>; Mon, 22 Jun 2020 15:58:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CF910F8010E
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1592834338814048052-webhooks-bot@alsa-project.org>
References: <1592834338814048052-webhooks-bot@alsa-project.org>
Subject: GQuark is not exported.
Message-Id: <20200622135912.D4FE5F8015B@alsa1.perex.cz>
Date: Mon, 22 Jun 2020 15:59:12 +0200 (CEST)
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

alsa-project/alsa-gobject issue #47 was opened from takaswie:

Although each library in alsa-gobject uses GQuark to propagate error information, the symbol of GQuark is not exported yet by symbol mapping file of each library:

 * src/ctl/alsactl.map
 * src/timer/alsatimer.map
 * src/seq/alsaseq.map
 * src/hwdep/alsahwdep.map
 * src/rawmidi/alsarawmidi.map

This issue brings inconvenience for [Rust bindings](https://github.com/alsa-project/alsa-gobject-rs) to implement [glib::error::ErrorDomain](https://gtk-rs.org/docs/glib/error/trait.ErrorDomain.html) for each GQuark.

Issue URL     : https://github.com/alsa-project/alsa-gobject/issues/47
Repository URL: https://github.com/alsa-project/alsa-gobject
