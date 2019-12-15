Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6225F11FBDA
	for <lists+alsa-devel@lfdr.de>; Mon, 16 Dec 2019 00:26:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E62E11660;
	Mon, 16 Dec 2019 00:26:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E62E11660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576452412;
	bh=lqsQovimsu3h8nJBSICoVhtP6c6MQ0ikV8Qxy1Z1zts=;
	h=From:To:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jeZCka+8ecc+cRsdU3JGFjOiwnUk5ppEb9geHhrBribAu0sZW6CpZz9xojyiATX4s
	 RpV97O/l9gmrfzRviXx1RwBY1iiPwVidYkcdkUrhJO/qO+7M3LAhZ8dgo40eZJfl9x
	 qMiNwaSiT6GZg1BUhro3fLEHAnKQi3goqKHKQWts=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1BFCCF80266;
	Mon, 16 Dec 2019 00:24:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B5C14F80264; Mon, 16 Dec 2019 00:24:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 2C4E7F8025F
 for <alsa-devel@alsa-project.org>; Mon, 16 Dec 2019 00:24:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2C4E7F8025F
MIME-Version: 1.0
From: GitHub issues - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1576452277002017021-webhooks-bot@alsa-project.org>
References: <1576452277002017021-webhooks-bot@alsa-project.org>
Message-Id: <20191215232439.B5C14F80264@alsa1.perex.cz>
Date: Mon, 16 Dec 2019 00:24:39 +0100 (CET)
Subject: [alsa-devel] Don't use 16 bit signed integers for sample rate
	conversion.
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

alsa-project/alsa-plugins issue #5 was edited from crocket:

Sample rate conversion should be done with the highest resolution possible.
Maybe, double, unsigned int, or unsigned int64?
Once sample rate conversion is done, using S32_LE is meaningless.

Issue URL     : https://github.com/alsa-project/alsa-plugins/issues/5
Repository URL: https://github.com/alsa-project/alsa-plugins
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
