Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 81A8D2ECA52
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Jan 2021 07:08:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1A908828;
	Thu,  7 Jan 2021 07:07:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1A908828
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1609999689;
	bh=9SOkawqXpjfGkLQRcAE0Rd5w+KnnzEsvDygKJGtnHkQ=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XUddzxkBE+NgtXDYy2XZWXDp8mj1rHswKApVAJpw4yHoO7AKF7eAfWTjnSzp0HQRo
	 Ie9Lz33UKgRngtO5+EXQT0OMOw0yZm7CXi3X5SC5kayYvWwhkQR5pJFEIUA7C36NtU
	 sP6+btkNUi/PXJMgRrzlKLg0wvty5Wb5mdqaA45I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B18DCF80258;
	Thu,  7 Jan 2021 07:06:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A64D8F80258; Thu,  7 Jan 2021 07:06:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 4691EF80096
 for <alsa-devel@alsa-project.org>; Thu,  7 Jan 2021 07:06:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4691EF80096
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1609999588092701912-webhooks-bot@alsa-project.org>
References: <1609999588092701912-webhooks-bot@alsa-project.org>
Subject: build fails using -flto=auto
Message-Id: <20210107060633.A64D8F80258@alsa1.perex.cz>
Date: Thu,  7 Jan 2021 07:06:33 +0100 (CET)
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

alsa-project/alsa-lib issue #110 was opened from shoober420:

When compiling alsa-lib with -flto=auto, the build will fail. Here are the logs.

64bit:
[alsa-lib-git-1.2.4-1-x86_64-build.log](https://github.com/alsa-project/alsa-lib/files/5779850/alsa-lib-git-1.2.4-1-x86_64-build.log)

32bit:
[lib32-alsa-lib-minimal-git-1.2.4-1-x86_64-build.log](https://github.com/alsa-project/alsa-lib/files/5779853/lib32-alsa-lib-minimal-git-1.2.4-1-x86_64-build.log)

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/110
Repository URL: https://github.com/alsa-project/alsa-lib
