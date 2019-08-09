Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F0628726B
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Aug 2019 08:51:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E3D0A15F2;
	Fri,  9 Aug 2019 08:50:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E3D0A15F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565333501;
	bh=88p/O/IkzGJ0cxLDkj3d/NgtXFRnnIYXcjq44hsTJu8=;
	h=From:To:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UAHcC6zO3CXhb5kn+epKkOsrWN4o1lCKV5UXRWalN+po9C+11C9TR4LXmC4ClYNYf
	 ve9Swxj0+Sj7wbOfn+JXC32f1EMar/6U0godtADKhz3q9EMdkeYyrNsJvUgnvyCK9l
	 Z6hAGIXp/T4KE1QPSr9DmGj+lmFjea62xIygLKu0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D97C7F804AB;
	Fri,  9 Aug 2019 08:49:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 14C8DF803F3; Fri,  9 Aug 2019 08:49:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 RCVD_IN_DNSWL_BLOCKED, SPF_FAIL, SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id CCCF9F800E4
 for <alsa-devel@alsa-project.org>; Fri,  9 Aug 2019 08:49:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CCCF9F800E4
MIME-Version: 1.0
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1565333391944293976-webhooks-bot@alsa-project.org>
References: <1565333391944293976-webhooks-bot@alsa-project.org>
Message-Id: <20190809064955.14C8DF803F3@alsa1.perex.cz>
Date: Fri,  9 Aug 2019 08:49:55 +0200 (CEST)
Subject: [alsa-devel] jack plugin freezes mpv.
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

alsa-project/alsa-plugins issue #1 was opened from crocket:

I'm using alsa-plugin-1.1.8

`mpv --audio-device=alsa/plug:rawjack /path/to/musicfile` freezes mpv.
mpv doesn't freeze only when it plays a wav file.
I have to press Ctrl+C twice to kill mpv.

Issue URL     : https://github.com/alsa-project/alsa-plugins/issues/1
Repository URL: https://github.com/alsa-project/alsa-plugins
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
