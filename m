Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0029F2038B3
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jun 2020 16:03:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9C31A16E8;
	Mon, 22 Jun 2020 16:03:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9C31A16E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592834631;
	bh=QVYOE05UI3ROUXQ4x2sQS2Vnr8OCpENCT86X+aPhDYI=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eCiuUTOUfjq2/7oRcfUt/1jyTyKrSf6uMKlsrGtMlGMCuNW9N3/dN5cRgbRhKsQeu
	 Q91SXLfTSBoLmMcfncORiocWna3DGQjhmmD8LbsJb52Gr/X78EZ//kYWPR7ocLq15q
	 dkbUOGpG7n7iQf+r4ajLGyfRfj1Ix584l2lHsvB0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E18B2F8010E;
	Mon, 22 Jun 2020 16:02:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 809E2F801DB; Mon, 22 Jun 2020 16:01:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 6F101F80157
 for <alsa-devel@alsa-project.org>; Mon, 22 Jun 2020 16:01:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6F101F80157
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1592834499550574064-webhooks-bot@alsa-project.org>
References: <1592834499550574064-webhooks-bot@alsa-project.org>
Subject: GQuark is not exported.
Message-Id: <20200622140146.809E2F801DB@alsa1.perex.cz>
Date: Mon, 22 Jun 2020 16:01:46 +0200 (CEST)
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

alsa-project/alsa-gobject issue #47 was edited from takaswie:

Although each library in alsa-gobject uses GQuark to propagate error information, the symbol of GQuark is not exported yet by symbol mapping file of each library:

 * src/ctl/alsactl.map
 * src/timer/alsatimer.map
 * src/seq/alsaseq.map
 * src/hwdep/alsahwdep.map
 * src/rawmidi/alsarawmidi.map

This issue brings inconvenience for [Rust bindings](https://github.com/alsa-project/alsa-gobject-rs) to implement [glib::error::ErrorDomain](https://gtk-rs.org/docs/glib/error/trait.ErrorDomain.html) for each GQuark. The glib::error::ErrorDomain trait requires domain function implementation to return GQuark itself, however it's not exported and unable to access.

Issue URL     : https://github.com/alsa-project/alsa-gobject/issues/47
Repository URL: https://github.com/alsa-project/alsa-gobject
