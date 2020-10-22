Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C9561296351
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Oct 2020 19:05:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 645C717F3;
	Thu, 22 Oct 2020 19:04:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 645C717F3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603386347;
	bh=aNGQXRwVQLf6ZSMHW5sMo+LzGxwp04HuMDk39AbkHT4=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=D1l5KFtqp1aIZdi8Is1bxDaab11gGcSicbOi6usF4+EbCCfEL/SdpLgPmbTbduUUr
	 BlbJnKxMWON2M3MDaTKR35ju5HJzy5RPJpO9D15X54UOc/0xPMaHhFjWvDTNVc0bKA
	 yMmQ+BCaFt5bHUwLB7imsG3+IrkAVoyZGAlqsbY0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C5D9BF8049C;
	Thu, 22 Oct 2020 19:04:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D5853F804A9; Thu, 22 Oct 2020 19:04:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 6C78CF8025A
 for <alsa-devel@alsa-project.org>; Thu, 22 Oct 2020 19:04:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6C78CF8025A
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1603386243967147112-webhooks-bot@alsa-project.org>
References: <1603386243967147112-webhooks-bot@alsa-project.org>
Subject: src/dlmisc.c:snd_dlpath_unlock() doesn't build if DL_ORIGIN_AVAILABLE
 is not defined
Message-Id: <20201022170410.D5853F804A9@alsa1.perex.cz>
Date: Thu, 22 Oct 2020 19:04:10 +0200 (CEST)
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

alsa-project/alsa-lib issue #91 was opened from ollieparanoid:

Hey all, thanks for maintaining alsa.

In musl libc based Alpine Linux, the build of v1.2.4 fails with:
```
dlmisc.c:95:7: error: 'snd_plugin_dir_set' undeclared (first use in this function)
   95 |  if (!snd_plugin_dir_set) {
      |       ^~~~~~~~~~~~~~~~~~
dlmisc.c:95:7: note: each undeclared identifier is reported only once for each function it appears in
dlmisc.c:98:4: error: 'snd_plugin_dir' undeclared (first use in this function)
   98 |    snd_plugin_dir = strdup(env);
      |
```

This is a regression from https://github.com/alsa-project/alsa-lib/commit/8580c081c25678d11278efcb61bd15cf44d0a225, where the #ifdef...#else...#endif was removed.

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/91
Repository URL: https://github.com/alsa-project/alsa-lib
