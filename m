Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5871F1E9AA3
	for <lists+alsa-devel@lfdr.de>; Sun, 31 May 2020 23:59:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D39C21697;
	Sun, 31 May 2020 23:59:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D39C21697
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1590962398;
	bh=xj/NZ+Yx/wSajVEL00WvE5+sw3hm5sBWNTQv4NM4NOU=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=THy7v8kpy4B0avF/auZDqETVXzpclphDtPDbQMFlvVSGlEGktelzr9BoQ4YkOqdes
	 Fi6XBROyEsND7/OOEURS8q2+kipcHuBGC5hEs1kKFfQw65wLRRWlLQbmKhyK0iAwD3
	 cuDm/pxzQ1r/i3eF43yLuxK/8yf1WW2vfkCqBat4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EF3DFF80260;
	Sun, 31 May 2020 23:58:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 39F94F8023F; Sun, 31 May 2020 23:58:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id DD527F8013D
 for <alsa-devel@alsa-project.org>; Sun, 31 May 2020 23:58:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DD527F8013D
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1590962284985236883-webhooks-bot@alsa-project.org>
References: <1590962284985236883-webhooks-bot@alsa-project.org>
Subject: Missing hotplug support
Message-Id: <20200531215811.39F94F8023F@alsa1.perex.cz>
Date: Sun, 31 May 2020 23:58:11 +0200 (CEST)
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

alsa-project/alsa-lib issue #55 was opened from wm4:

Hotplug support is mandatory in any modern system. But in ALSA there is no way to be notified by audio device changes.

I'm aware that as a hack, one could listen to udev notifications. But this is not appropriate, because:
- udev is a different API, which makes this is inelegant and messy
- it requires a dependency on udev, which may not be a workable solution even if the host OS is Linux
- there may be devices that do not have anything to do with udev (for example network audio interfaces implemented in userspace)
- changes in udev may not be reflected in ALSA at the same time (creating the need to avoid race conditions with timeouts or whatever)
- it's ALSA's responsibility to provide this; I don't know any OS where you have to go to a completely different API for this

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/55
Repository URL: https://github.com/alsa-project/alsa-lib
