Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A7ED312C271
	for <lists+alsa-devel@lfdr.de>; Sun, 29 Dec 2019 13:24:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1EDE31747;
	Sun, 29 Dec 2019 13:23:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1EDE31747
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1577622245;
	bh=NFup7TV7R94ft5Nh1DrPABZVo+DjvL7kLesKK+WbSg4=;
	h=From:To:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=i+fLJS4MYXoIJNXY/R2bus9SqdS0UgtjdTCsnO9lY3pXNFKqRtZHwqUfltU99EcPl
	 CjUqbVnxcNNAk1NYPkB7u7P6wNKSH45j3//yvM2LCQLcFIXXVexiW+8RKgNEmFiNUn
	 vcASbKRXgi9TCN8WhcIEEsfTaj/Na6Ry5JtagKHY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7201CF80158;
	Sun, 29 Dec 2019 13:22:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5DF11F8014F; Sun, 29 Dec 2019 13:22:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 797F1F800C0
 for <alsa-devel@alsa-project.org>; Sun, 29 Dec 2019 13:22:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 797F1F800C0
MIME-Version: 1.0
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1577622135498452902-webhooks-bot@alsa-project.org>
References: <1577622135498452902-webhooks-bot@alsa-project.org>
Message-Id: <20191229122219.5DF11F8014F@alsa1.perex.cz>
Date: Sun, 29 Dec 2019 13:22:19 +0100 (CET)
Subject: [alsa-devel] No top-level directory in tarballs
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

alsa-project/alsa-ucm-conf issue #10 was opened from tanuk:

Usually release tarballs have a top-level directory in the format "&lt;packagename>-&lt;version>". At least the 1.2.1.2 release of alsa-ucm-conf didn't have any such directory, which caused some headache for me as a packager. I figured out how to deal with it, so I don't need this issue fixed, but it would probably still be a good idea to add the conventional directory in future releases.

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/10
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
