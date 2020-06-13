Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 832171F819A
	for <lists+alsa-devel@lfdr.de>; Sat, 13 Jun 2020 09:37:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 016D11675;
	Sat, 13 Jun 2020 09:36:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 016D11675
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592033826;
	bh=33O7KzkSoADVEp8oXUbfKWVcIoZR2h2KU8Yq2te7U8M=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IXTDuuIsuQlHC7jSJryz4NZ+ZluzR8ZiQyHsey+4pnVb6qF4+6CXNOZOhCiKSERSY
	 fmvJcQqKMLWq8pU+JC3JT8yRAtK4T39yUfIxSHpypFInO7BR0SaUpSFvKOSfksrnwX
	 8A6ZR7DIypg/Nv2gPqC7M0EO4rc/lqwtblkz0RD4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 32D83F800C7;
	Sat, 13 Jun 2020 09:35:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D1256F80279; Sat, 13 Jun 2020 09:35:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 260B0F800C7
 for <alsa-devel@alsa-project.org>; Sat, 13 Jun 2020 09:35:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 260B0F800C7
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1592033711652971983-webhooks-bot@alsa-project.org>
References: <1592033711652971983-webhooks-bot@alsa-project.org>
Subject: alsa-gobject: obsolete function with two arguments
Message-Id: <20200613073520.D1256F80279@alsa1.perex.cz>
Date: Sat, 13 Jun 2020 09:35:20 +0200 (CEST)
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

alsa-project/alsa-gobject pull request #35 was opened from takaswie:

According to guideline of GObject Introspection, API with multiple out parameters is not preferrable[1].

This patchset replaces such functions with more suitable ones.

[1] https://gi.readthedocs.io/en/latest/writingbindableapis.html#multiple-out-parameters

Request URL   : https://github.com/alsa-project/alsa-gobject/pull/35
Patch URL     : https://github.com/alsa-project/alsa-gobject/pull/35.patch
Repository URL: https://github.com/alsa-project/alsa-gobject
