Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 98F2B31A368
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Feb 2021 18:17:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3756116F6;
	Fri, 12 Feb 2021 18:17:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3756116F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1613150279;
	bh=rguKO6UtNYjjK1ViBl/179wTA3fKM9A40QES1Ugl0kc=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kwAXOUUoknzEyKNzKhCwM4/rv+5wv/prGLz4cVLqDZlMCxEtAcmqxtlvis4bbA8iw
	 2ZdYvuNrCFOVexfUu1bsDh4dqFOPftarrvmqwHFKxbH3tw+L34RHiZ0PCYtnrWiGE6
	 VsiSQam1svIpggOd8UorzbCs9cEx0WT5CcWUcXxc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8EB22F8022D;
	Fri, 12 Feb 2021 18:16:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 79DF3F8022B; Fri, 12 Feb 2021 18:16:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 90049F8014D
 for <alsa-devel@alsa-project.org>; Fri, 12 Feb 2021 18:16:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 90049F8014D
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1613150178323998928-webhooks-bot@alsa-project.org>
References: <1613150178323998928-webhooks-bot@alsa-project.org>
Subject: Bass speaker is off on yoga slim 7i 15 (7-15ITL)
Message-Id: <20210212171625.79DF3F8022B@alsa1.perex.cz>
Date: Fri, 12 Feb 2021 18:16:25 +0100 (CET)
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

alsa-project/alsa-ucm-conf issue #83 was opened from juliusvonkohout:

Alsainfo: http://alsa-project.org/db/?f=673e04313fa931831176ed3f50a9af1c9206395e

I tested with fedora 33, 34 and Ubuntu 21.04. Only the high frequency speakers at the laptop bottom are working, while the speakers above the keyboard are off. Here is a link to the laptop https://www.lenovo.com/de/de/laptops/yoga/yoga-slim-series/Yoga-Slim-7-15IIL05/p/88YGS701403

In Microsoft Windows 10 everything is fine.

In Ubuntu 21.04 i can at least change the bass speaker volume in alsamixer, but it is changing hardware master volume instead of hardware bass speaker volume.

In Feodra 33 and 34 i can not even change the bass speaker volume in alsamixer
![audiobug](https://user-images.githubusercontent.com/45896133/107797084-d3090500-6d5a-11eb-86fb-229800b546b0.png)

You can immiediatly hear, that the bass speaker above the keyboard is off
[audio.zip](https://github.com/alsa-project/alsa-ucm-conf/files/5973232/audio.zip)

There are related bugs for ALC287
The same bug on other yoga laptops https://bugzilla.kernel.org/show_bug.cgi?id=205755
Patches for the issue on other yoga Laptops https://patchwork.kernel.org/project/alsa-devel/patch/20201205051130.8122-1-hui.wang@canonical.com/

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/83
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
