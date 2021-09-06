Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AB2804016E4
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Sep 2021 09:18:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 412BF178D;
	Mon,  6 Sep 2021 09:17:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 412BF178D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1630912704;
	bh=Q06ncvJq5bfgG58Wk4h8g0wWqfyLBl+2YLS2W7ulKLI=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uZr2fYz+jsqMrXdbnw10Dg91uOM+pv1bPNdQCPUXZK5LcMGpT5G30IblTalttUYD4
	 QiwOxcdRXbQDvuSBwm3aYz+KMVdONIWsuwNpyP+xKg6p8sqBFyqtx17l/7nL0C83ZX
	 BWjrIzAUGFVH8EdztslmsioZ4VSPd7k3LS6HFsfw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C0892F800B5;
	Mon,  6 Sep 2021 09:17:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3FD92F802E7; Mon,  6 Sep 2021 09:17:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id C31FFF800C7
 for <alsa-devel@alsa-project.org>; Mon,  6 Sep 2021 09:17:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C31FFF800C7
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1630912623498121023-webhooks-bot@alsa-project.org>
References: <1630912623498121023-webhooks-bot@alsa-project.org>
Subject: hdajackretask doesn't check for script's exit code
Message-Id: <20210906071706.3FD92F802E7@alsa1.perex.cz>
Date: Mon,  6 Sep 2021 09:17:06 +0200 (CEST)
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

alsa-project/alsa-tools issue #8 was edited from kroq-gar78:

`hdajackretask` creates a script in `/tmp` before executing it. When `/tmp` is mounted with `noexec`, running that script will fail, but the GUI gives no indication that it failed.

I'm on Ubuntu 18.04.5 with `alsa-tools-gui` package version `1.1.3-1`.

The GUI should check for the exit code of the script, and notify the user appropriately if the script failed to execute.

Also, if this isn't the appropriate place to report a bug, please let me know!

Issue URL     : https://github.com/alsa-project/alsa-tools/issues/8
Repository URL: https://github.com/alsa-project/alsa-tools
