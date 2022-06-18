Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A402B550757
	for <lists+alsa-devel@lfdr.de>; Sun, 19 Jun 2022 00:26:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 094891AFF;
	Sun, 19 Jun 2022 00:25:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 094891AFF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655591170;
	bh=duEytnRDRr/F+upD2sEIvvnx3VSXNWzJtsjrWWtkY/w=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HmuGpkqU8yC0cLHuMgTzca2+QxnSV5XldaKwEHeQ907pa22PKCgxvBoFBZYMS+e7r
	 PpqXleS6JvkQ9gIsBpOsj67tbHkBoQdr9l2OS1LhIUP8niV7Y5CaaTwu4MPs0sd57u
	 4lZ30HRHfGqXmgC6IU2cgSu3UKCWxZjlVTpqN1Rs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 74DAEF804A9;
	Sun, 19 Jun 2022 00:25:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6B55DF8026D; Sun, 19 Jun 2022 00:25:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 2E34DF80245
 for <alsa-devel@alsa-project.org>; Sun, 19 Jun 2022 00:25:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2E34DF80245
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1655591105809834957-webhooks-bot@alsa-project.org>
References: <1655591105809834957-webhooks-bot@alsa-project.org>
Subject: pcm: Return unsigned int if error occurs by `read` or `write` system
 call
Message-Id: <20220618222509.6B55DF8026D@alsa1.perex.cz>
Date: Sun, 19 Jun 2022 00:25:09 +0200 (CEST)
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

alsa-project/alsa-lib pull request #242 was opened from Korilakkuma:

`read` or `write` system call returns `-1` if error occurs.

Request URL   : https://github.com/alsa-project/alsa-lib/pull/242
Patch URL     : https://github.com/alsa-project/alsa-lib/pull/242.patch
Repository URL: https://github.com/alsa-project/alsa-lib
