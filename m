Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AC5EE35E6FE
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Apr 2021 21:20:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 14A9116B2;
	Tue, 13 Apr 2021 21:19:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 14A9116B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618341638;
	bh=hQM8XXzE1T+nTIYzMuzATZZDK4CJWOZfpcsUaK9hyPY=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=k5CNi5R6WPXjjP9+FPZyiahfopLITXhOjoYMat1qcAun7z8xNCL3WXzLFVRdfXet7
	 3XDlN6XcTcz1y/ioIZs8/DM4w89uG4gwuelAsoqOQMcWREF1SJJ5UjiKQN9mvsK2nD
	 jKYCgrBOq3u2Wh8mK1crHsgbxiQRfR0rJSBtf9Co=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 899F3F8022D;
	Tue, 13 Apr 2021 21:19:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9586CF8022B; Tue, 13 Apr 2021 21:19:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 9A571F80161
 for <alsa-devel@alsa-project.org>; Tue, 13 Apr 2021 21:19:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9A571F80161
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1618341542476771116-webhooks-bot@alsa-project.org>
References: <1618341542476771116-webhooks-bot@alsa-project.org>
Subject: utils/alsa.m4: fix the brackets for real
Message-Id: <20210413191906.9586CF8022B@alsa1.perex.cz>
Date: Tue, 13 Apr 2021 21:19:06 +0200 (CEST)
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

alsa-project/alsa-lib pull request #133 was opened from asavah:

Even after https://github.com/alsa-project/alsa-lib/commit/f9ace404fde9058baf64d77eed98d755a6c11fa4 building alsa-utils from git fails due to broken alsa.m4.

```
autoreconf: running: aclocal -I m4 --force -I m4
/home/asavah/kross/host/bin/m4:/home/asavah/kross/build/asusb450eg/rootfs/usr/share/aclocal/alsa.m4:20: ERROR: end of file in string
autom4te2.71: error: /home/asavah/kross/host/bin/m4 failed with exit status: 1
aclocal: error: /home/asavah/kross/host/bin/autom4te2.71 failed with exit status: 1
autoreconf: error: aclocal failed with exit status: 1
```

This PR should address missing brackets.

Request URL   : https://github.com/alsa-project/alsa-lib/pull/133
Patch URL     : https://github.com/alsa-project/alsa-lib/pull/133.patch
Repository URL: https://github.com/alsa-project/alsa-lib
