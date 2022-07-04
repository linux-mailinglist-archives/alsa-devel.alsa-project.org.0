Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 77F975651BB
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Jul 2022 12:09:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A577416F0;
	Mon,  4 Jul 2022 12:08:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A577416F0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656929344;
	bh=3nqcADvzo+MUZV06PAsABnDtetuu4hS1AP3pMIPMILc=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eS529QT/v4Be4OuDe2yj0C8mP6fFYtHGY4aNk7JZuu9GIPn32XuemXFmaQNrDFytm
	 uFyuZnh41Tbv/kDcmndkI/TU3jLCZLoz62dLKvmDAsBd0t5Tz2RxTyO3tJ1YHGhNpP
	 3ykpul7XHxd6XJUHiRr7MoPrWKneU5t+MDX1KumE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 258CCF8012A;
	Mon,  4 Jul 2022 12:08:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D7C91F8012A; Mon,  4 Jul 2022 12:08:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 7020FF8012A
 for <alsa-devel@alsa-project.org>; Mon,  4 Jul 2022 12:08:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7020FF8012A
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1656929279956115007-webhooks-bot@alsa-project.org>
References: <1656929279956115007-webhooks-bot@alsa-project.org>
Subject: failed to import acp5x use case configuration -2
Message-Id: <20220704100802.D7C91F8012A@alsa1.perex.cz>
Date: Mon,  4 Jul 2022 12:08:02 +0200 (CEST)
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

alsa-project/alsa-ucm-conf issue #184 was opened from DocMAX:

docmax@steamdeck: ~ $ ALSA_CONFIG_UCM=/usr/share/alsa/ucm2/ alsaucm -c acp5x set _verb HiFi
ALSA lib main.c:1541:(snd_use_case_mgr_open) error: failed to import acp5x use case configuration -2
alsaucm: error failed to open sound card acp5x: No such file or directory

Why does it fail? I have the following directory set up:

/usr/share/alsa/ucm2/conf.d/acp5x/HiFi.conf
/usr/share/alsa/ucm2/conf.d/acp5x/acp5x.conf

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/184
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
