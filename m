Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2350B53B284
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Jun 2022 06:19:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8AF45174D;
	Thu,  2 Jun 2022 06:18:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8AF45174D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654143572;
	bh=2Y88TlhYoUmd/tEFxkesjWPQAFBBNewdOO6wXq0IDVQ=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Xs3fff31gMo+7JVR52BLfhJsn0tYiJLox6fzF6+xGax/GiZtyxAkw6HxGyI6pAdpU
	 mmLpnnQDLV/ebeUZX+6lGq73YtDEKS7+w7ud7Nn/5L8CfaVt0MBdjvUAJ2mtoxPh/h
	 EafIwofo2CiGvdst1MwstAtRAgBI2DDAsdPHhIvg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 214A0F80149;
	Thu,  2 Jun 2022 06:18:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CB52FF80236; Thu,  2 Jun 2022 06:18:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 11A9AF80124
 for <alsa-devel@alsa-project.org>; Thu,  2 Jun 2022 06:18:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 11A9AF80124
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1654143508536557913-webhooks-bot@alsa-project.org>
References: <1654143508536557913-webhooks-bot@alsa-project.org>
Subject: "topology: nhlt plugin: second attempt to fix the .so linking" cause
 build static library failed
Message-Id: <20220602041832.CB52FF80236@alsa1.perex.cz>
Date: Thu,  2 Jun 2022 06:18:32 +0200 (CEST)
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

alsa-project/alsa-utils issue #152 was opened from youling257:

./configure --prefix=/system/usr --with-alsa-inc-prefix=/system/usr/include --with-alsa-prefix=/system/usr/lib --enable-static=yes --enable-shared=no
make LDFLAGS="--static" -j8

Revert "topology: nhlt plugin: second attempt to fix the .so linking" can build static library.

Issue URL     : https://github.com/alsa-project/alsa-utils/issues/152
Repository URL: https://github.com/alsa-project/alsa-utils
