Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EACBC292D3A
	for <lists+alsa-devel@lfdr.de>; Mon, 19 Oct 2020 19:58:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0E37016FB;
	Mon, 19 Oct 2020 19:57:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0E37016FB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603130283;
	bh=j1ijFFa2cvkc779EcoxJzWQ08aRNLYv/RMaQ7BsucCI=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JmU3sVUC01sjC9pXFuW43PuyU0Rgqvc/vPszKO2ozFK2ajRx8+UyF9VDZv5fXtXwA
	 B0sYfHZDz3APKBtlDSleBk/NpOZTy8Jg2LaD4k9VDdQ4HPd3fHEufPQ7McPa4GLEPl
	 29haexFnNJzQTn5fFAKUjjkJFS+6GLKPqfF61zZc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9B0A4F80121;
	Mon, 19 Oct 2020 19:56:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 59DBFF80247; Mon, 19 Oct 2020 19:56:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id E0F95F801A3
 for <alsa-devel@alsa-project.org>; Mon, 19 Oct 2020 19:56:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E0F95F801A3
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1603130174879039049-webhooks-bot@alsa-project.org>
References: <1603130174879039049-webhooks-bot@alsa-project.org>
Subject: No sound after upgrade from 1.2.3 to 1.2.4 (Xiaomi Redmibook 16 II
 Ryzen Edition)
Message-Id: <20201019175620.59DBFF80247@alsa1.perex.cz>
Date: Mon, 19 Oct 2020 19:56:20 +0200 (CEST)
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

alsa-project/alsa-ucm-conf issue #55 was opened from deponian:

Hello.
Yesterday I have upgraded Arch Linux on my laptop with `pacman -Syu` and after reboot I've had no sound from built-in speakers. I had downgraded all upgraded packages and started upgrading one-by-one with reboot after every step. I have found out that upgrading `alsa-ucm-conf` package from `1.2.3-2` to `1.2.4-1` is causing the issue. If I understand correctly my laptop has something called `Family 17h (Models 10h-1fh) HD Audio Controller` which is using for output and `Raven/Raven2/FireFlight/Renoir Audio Processor Stereo` which is using for input. After upgrading to `1.2.4` I had had only broken output, the input (microphone) was working correctly.
I have attached two outputs of `alsa-info.sh` to this message: one before and other one after upgrade.
[alsa-info-1.2.3.txt](https://github.com/alsa-project/alsa-ucm-conf/files/5403794/alsa-info-1.2.3.txt)
[alsa-info-1.2.4.txt](https://github.com/alsa-project/alsa-ucm-conf/files/5403796/alsa-info-1.2.4.txt)
I hope it will help.

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/55
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
