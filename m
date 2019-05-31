Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 856D730DBF
	for <lists+alsa-devel@lfdr.de>; Fri, 31 May 2019 14:04:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2996C85D;
	Fri, 31 May 2019 14:03:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2996C85D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559304245;
	bh=9htYBI/+BbyFKrKwFZIjBdFyafX0FQtt7IOcnILS8sE=;
	h=From:To:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NVqa4iF5Vj8M07EYDXCUO7k7Ljkllb/y5TCbBRE5YW7Qjd+TB4wmT7iZ9kF4Kfh52
	 tKJQdxxVVWO9kDb3JFUqdxS9kbluH5xpJK+2klJmagb//SLcBBvNpSWQCCcLu4RUC+
	 E/aaq1GZA0IoEZnYfrOTdjOiKDRrh2frTvl4C4Bg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B70A8F80C1B;
	Fri, 31 May 2019 14:02:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B5370F8972A; Fri, 31 May 2019 14:02:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 6A530F80C1B
 for <alsa-devel@alsa-project.org>; Fri, 31 May 2019 14:02:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6A530F80C1B
MIME-Version: 1.0
From: GitHub issues - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1559304142272198915-webhooks-bot@alsa-project.org>
References: <1559304142272198915-webhooks-bot@alsa-project.org>
Message-Id: <20190531120224.B5370F8972A@alsa1.perex.cz>
Date: Fri, 31 May 2019 14:02:24 +0200 (CEST)
Subject: [alsa-devel] aplay - pcm_read: Input/output error
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

alsa-project/alsa-lib issue #7 was edited from mrajwa:

Hello,

I came across an issue with custom built aplay (system one works OK on Ubuntu 18.04):

I have fetched both alsa-lib and alsa-utils repositories, built them now try to run:

`path_to_aplay/aplay -C -D hw:0,8 -r 16000 -f S16_LE -c 2 tmp.wav -vvv`

Immediately after the start it prints hw params and the error message saying:

`arecord: pcm_read:2103: read errorL Input/output error`

As I said system aplay works fine. Moreover I compared hw params for both system and this custom built aplay and they are exactly the same!

I also tried to built alsa-utils from debian package here I did:

`apt source alsa-lib && sudo apt build-dep alsa-utils && fakeroot debian/rules clean && fakeroot debian/rules build && fakeroot debian/rules binary`

All finished fine, now I repeated above steps for alsa-utils and here is a problem at `fakeroot debian/rules binary` step. At some point it stops with an error message saying:

`dpkg-shlibdeps: error: no dependency information found for /usr/lib/libasound.co.s2 (used by debian/alsa-utils/usr/bin/alsaucm)`

Does anybody have any idea what is going on here?

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/7
Repository URL: https://github.com/alsa-project/alsa-lib
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
