Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B037822663B
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Jul 2020 18:01:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 427AD83E;
	Mon, 20 Jul 2020 18:01:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 427AD83E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595260911;
	bh=EYfBaIjIOpzZHvvQ+MD4m3uHIzjqs86SG2UGu6VzTaY=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KI55b3ipPyk5ewEVskSLN/kY56UXLEomdUJu8I7HWGyabK0+4r0vN4FJDw0KuzsWl
	 BnqTkGo1aK7KzvSklK5Mqvk3uTsfYpBSAsd+eAmNy7+RlhB1ogVBuLJ7wJ+po/XKRV
	 F9q8GQgoYLUzaVXjnfAKWk5GkqHBTabVvdWlfYvw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E6D50F800CE;
	Mon, 20 Jul 2020 18:00:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3E146F800F5; Mon, 20 Jul 2020 17:59:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 89CCFF800CE
 for <alsa-devel@alsa-project.org>; Mon, 20 Jul 2020 17:59:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 89CCFF800CE
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1595260775861229897-webhooks-bot@alsa-project.org>
References: <1595260775861229897-webhooks-bot@alsa-project.org>
Subject: S/PDIF fix for Asus Xonar SE Output
Message-Id: <20200720155956.3E146F800F5@alsa1.perex.cz>
Date: Mon, 20 Jul 2020 17:59:56 +0200 (CEST)
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

alsa-project/alsa-lib pull request #70 was opened from Odzinic:

The ASUS Xonar SE soundcard (ID 0b05:189d ASUSTek Computer, Inc. Xonar SoundCard) defaults to the first device for S/PDIF when it should actually use the third for its digital output.

This fix was discussed in this AskUbuntu post: https://askubuntu.com/a/1210401/117741.

Signed-off by: Omar Dzinic <odzinic@gmail.com>

Request URL   : https://github.com/alsa-project/alsa-lib/pull/70
Patch URL     : https://github.com/alsa-project/alsa-lib/pull/70.patch
Repository URL: https://github.com/alsa-project/alsa-lib
