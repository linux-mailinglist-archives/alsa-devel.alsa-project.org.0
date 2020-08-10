Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E407824022D
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Aug 2020 09:05:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 85AF41661;
	Mon, 10 Aug 2020 09:05:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 85AF41661
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597043150;
	bh=Mirimd+tvIUVMZpawvb5b2SzyzL84zTWV8E8ljRi0oQ=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TB98o8FuUohhks+5j896FrKper6+F3OpGooGIkS0Pda8DqkX5tfMgTR8u2mn/0AHs
	 z+8KoswZZ1kc2KBlY4QQn/viFOLlW7dccJQrz6j1DQF9wqpEyK7jJExFa0ZLBR+Om+
	 ircetbsDDQ006x0Q2eToQp1fQRx2LyernPK/+yfc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B8DD5F800BC;
	Mon, 10 Aug 2020 09:04:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0062BF8022B; Mon, 10 Aug 2020 09:04:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 77564F800BC
 for <alsa-devel@alsa-project.org>; Mon, 10 Aug 2020 09:04:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 77564F800BC
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1597043044215922117-webhooks-bot@alsa-project.org>
References: <1597043044215922117-webhooks-bot@alsa-project.org>
Subject: Accidently deleted alsa folder
Message-Id: <20200810070408.0062BF8022B@alsa1.perex.cz>
Date: Mon, 10 Aug 2020 09:04:07 +0200 (CEST)
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

alsa-project/alsa-lib issue #77 was opened from themagicalmammal:

I deleted alsa folder accidently and not mic doesnt work.
Even after using alsa command.
I searched and tried to apply many stack-overflow solutions but nothing helped when I try to use mic on pycharm it doesnt work it yields this error

```
ALSA lib conf.c:3916:(snd_config_update_r) Cannot access file /usr/share/alsa/alsa.conf
ALSA lib control.c:1373:(snd_ctl_open_noupdate) Invalid CTL hw:0
python3.6: src/hostapi/alsa/pa_linux_alsa.c:1454: BuildDeviceList: Assertion `devIdx < numDeviceNames' failed.
```

While External recorder works

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/77
Repository URL: https://github.com/alsa-project/alsa-lib
