Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F3C82273E38
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Sep 2020 11:11:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D6F8B16C9;
	Tue, 22 Sep 2020 11:10:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D6F8B16C9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600765904;
	bh=U/uFhTkNM3enXmY0iIlL+CKw3ikDwZz+ZoYQRKFNQvc=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=U9gP8z1n59Hy627MRKD8yACw89phVWkyQfhXkSvfqVpbUHGJdaYhUopZLkmRNLu9W
	 EWcfggRwF7t4ypbe+55evpAxG22dS4VlAqTn1CT8TMLcSGadAxHqzqpCD2vFsrbZGN
	 E0ajQrfgiuJP/dh5FZIfdvPURbd1oIxCeovWm9lc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BB27DF80259;
	Tue, 22 Sep 2020 11:09:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6DA66F80259; Tue, 22 Sep 2020 11:09:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 2B972F80232
 for <alsa-devel@alsa-project.org>; Tue, 22 Sep 2020 11:09:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2B972F80232
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1600765753502420902-webhooks-bot@alsa-project.org>
References: <1600765753502420902-webhooks-bot@alsa-project.org>
Subject: Bad vumeter data in aplay/arecord
Message-Id: <20200922090921.6DA66F80259@alsa1.perex.cz>
Date: Tue, 22 Sep 2020 11:09:21 +0200 (CEST)
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

alsa-project/alsa-utils issue #57 was opened from SuitableUsername:

In aplay.c the wrong count is passed to compute_max_peak(). Instead of "r * hwparams.channels" it should be "r * bits_per_frame / 8".

Also, the vumeter should really show an overall peak level percentage because the transitory 1/8 second one has very little value.

Issue URL     : https://github.com/alsa-project/alsa-utils/issues/57
Repository URL: https://github.com/alsa-project/alsa-utils
