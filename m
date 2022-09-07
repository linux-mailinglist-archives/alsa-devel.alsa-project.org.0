Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B60AC5B01CD
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Sep 2022 12:23:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6D85A168A;
	Wed,  7 Sep 2022 12:22:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6D85A168A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662546185;
	bh=5YVUJHA4rU5ChLCahNcZqJ1p4KbE3Z1wB1iLgkW9uAI=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=l5n0XDanc0ajdWYjCCmGhGa6Rotn6pNekjgffPNlLs0hP1RgjExLqyWBqzYVMHlj6
	 BtMdPKg/dhBpr8u+jHl9QR7FuZKV28bp+472E6W1ZsY9VON0TeWTY1Ne1xScx1lXC1
	 /W58VvOke3zi996FVviIdUBKn5/wPwVT+kyKhEwo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 773E7F804CA;
	Wed,  7 Sep 2022 12:22:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 706A1F804CA; Wed,  7 Sep 2022 12:22:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 57F09F80118
 for <alsa-devel@alsa-project.org>; Wed,  7 Sep 2022 12:21:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 57F09F80118
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1662546117857934952-webhooks-bot@alsa-project.org>
References: <1662546117857934952-webhooks-bot@alsa-project.org>
Subject: utils: cplay: Add support for ID3v2 tag skip
Message-Id: <20220907102204.706A1F804CA@alsa1.perex.cz>
Date: Wed,  7 Sep 2022 12:22:04 +0200 (CEST)
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

alsa-project/tinycompress pull request #15 was edited from LaurentiuM1234:

This patch will allow playing MP3 files containing ID3v2 tag at the beginning of the file.

This is done simply by parsing the ID3v2 header, extracting the header size and seeking to that position (+10 bytes from the header size which is not included in the 'header size' field of the ID3v2 header)

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Request URL   : https://github.com/alsa-project/tinycompress/pull/15
Patch URL     : https://github.com/alsa-project/tinycompress/pull/15.patch
Repository URL: https://github.com/alsa-project/tinycompress
