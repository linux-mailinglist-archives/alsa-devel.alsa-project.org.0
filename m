Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BE8B6268BCE
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Sep 2020 15:09:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 417821689;
	Mon, 14 Sep 2020 15:08:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 417821689
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600088974;
	bh=BXjIXDuFQLvZxpCFB12Iz8nmJCSNYDjOtVlNkrDQ+DM=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iZR8qPy5aB2SpPedfjJSUqxa7GKlq5ca4zWPkPBq6zmFXbpcLesYUKURLG4aIWM/y
	 6gbQiC8/v/kh0DXR/pVjscrxulGLAF2YRKTpnG38rEd9ld7KVT+iOSNeNuTWOvUgE1
	 io/qz09jeHR6l3K9coYYnLZClp6HtJ9wq+yKIA0I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 56326F80150;
	Mon, 14 Sep 2020 15:07:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3AEA8F80105; Mon, 14 Sep 2020 15:07:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 573DBF80105
 for <alsa-devel@alsa-project.org>; Mon, 14 Sep 2020 15:07:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 573DBF80105
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1600088863114602089-webhooks-bot@alsa-project.org>
References: <1600088863114602089-webhooks-bot@alsa-project.org>
Subject: ucm2: USB-Audio: Add CaptureMixerElem for Lenovo ThinkStation P620
Message-Id: <20200914130751.3AEA8F80105@alsa1.perex.cz>
Date: Mon, 14 Sep 2020 15:07:51 +0200 (CEST)
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

alsa-project/alsa-ucm-conf pull request #51 was opened from khfeng:

The Switch and Volume mixer start to work after device firmware update.
Add MixerElem to support them.

Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/51
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/51.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
