Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C3F572570DC
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Aug 2020 00:29:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3D551183E;
	Mon, 31 Aug 2020 00:28:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3D551183E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598826563;
	bh=i2qhYu+H+xIy5AbyQYaa/AFgHs9hQMYQdAMIw1vQolE=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RuUvXp9oKBjNu+WhR0YwA56niToytvaCRrgDwA5bz+Z3Qcv99hPJmdRkvYoC5bQWL
	 hZsFS3OyhmAi7uCtTAXYfPO3s1H0osnTnCGRztsBXTa1e5FgnU5VQYCdXNEWcNm7o6
	 QvaAlAL1T4uy1W03wnxGfrtw9ENT+W4OTaavKmoQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6A650F8012E;
	Mon, 31 Aug 2020 00:27:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C7030F8020D; Mon, 31 Aug 2020 00:27:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id DA3CEF8012E
 for <alsa-devel@alsa-project.org>; Mon, 31 Aug 2020 00:27:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DA3CEF8012E
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1598826454145714045-webhooks-bot@alsa-project.org>
References: <1598826454145714045-webhooks-bot@alsa-project.org>
Subject: Crash when trying to capture vdownmix
Message-Id: <20200830222737.C7030F8020D@alsa1.perex.cz>
Date: Mon, 31 Aug 2020 00:27:37 +0200 (CEST)
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

alsa-project/alsa-plugins issue #13 was opened from s09bQ5:

Our game captures audio from microphones and tests the available devices on startup. For some reason PortAudio tells us that vdownmix is a 6 channel capture device. When the game tries to test that device, the plugin crashes inside vdownmix_transfer because the src_areas array contained only two valid pointers while mix->channels is  6. I assume the plugin is not prepared to handle the swapped roles of input and output during capture.

A simple way to cause the crash is to execute `arecord -D vdownmix -f dat -c 6`.

The expected behavior is that the plugin either enforces 2 channel capture with a 4/5/6 channel slave pcm or completely rejects capture. In any case, it should not crash with a SIGSEGV.

Issue URL     : https://github.com/alsa-project/alsa-plugins/issues/13
Repository URL: https://github.com/alsa-project/alsa-plugins
