Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ED79174F0F
	for <lists+alsa-devel@lfdr.de>; Sun,  1 Mar 2020 20:01:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D7CC416B2;
	Sun,  1 Mar 2020 20:00:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D7CC416B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583089293;
	bh=8aU6PMQfmfSBb+4ZuP7k7v6IDtEiDthWj2Ut0d9RXPk=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZK7PHBeCct7OezEY+rGMWTK1udBtY6L1qFQM4lAZQgqMw1CN6Q3Jrse22fMI+tn70
	 DhzB/EeD8AZ5xvm9T/Pd3NPH6i7hAJewKepp/X6Ojm9QNCkgEvWH6XViodGakq6L0V
	 3aJVSEBXaTV6E83n1Qu3Q86JB610lt7s2ZnA8UE4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EF745F800B4;
	Sun,  1 Mar 2020 19:59:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 406F8F8025F; Sun,  1 Mar 2020 19:59:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 50BBDF80131
 for <alsa-devel@alsa-project.org>; Sun,  1 Mar 2020 19:59:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 50BBDF80131
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1583089186608217955-webhooks-bot@alsa-project.org>
References: <1583089186608217955-webhooks-bot@alsa-project.org>
Subject: conf: namehint - add noargs to the hint section
Message-Id: <20200301185950.406F8F8025F@alsa1.perex.cz>
Date: Sun,  1 Mar 2020 19:59:50 +0100 (CET)
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

alsa-project/alsa-lib pull request #31 was opened from perexg:

Do not list simple surround devices in the namehint section by default.

Fixes: https://github.com/alsa-project/alsa-lib/issues/27

Request URL   : https://github.com/alsa-project/alsa-lib/pull/31
Patch URL     : https://github.com/alsa-project/alsa-lib/pull/31.patch
Repository URL: https://github.com/alsa-project/alsa-lib
