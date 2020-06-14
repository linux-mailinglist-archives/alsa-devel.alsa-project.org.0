Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 17E0E1F88DF
	for <lists+alsa-devel@lfdr.de>; Sun, 14 Jun 2020 15:09:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A6BBD1678;
	Sun, 14 Jun 2020 15:08:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A6BBD1678
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592140139;
	bh=o96cAvwTbFB88Jp1+n7izGhWpR0f/I5CAlFXQZvD1nk=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ivQcWzXW9+gviNSy2Z7mndaQpzo2Zkd7jmBa/W46upI81YATy1rSN8CcdBYNu23Uf
	 kxqR9cSj4sqwzx9Y7Ti6mAxAROSJAkyLriETW8ETQzYOWbwgjlOWfSpltIsvjJDn9k
	 F2B34s2vMUy5xESFtksZdqLqUhGMqh8vYuMgSbwE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C8A47F800CD;
	Sun, 14 Jun 2020 15:07:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 24BC5F8022B; Sun, 14 Jun 2020 15:07:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 88923F8011E
 for <alsa-devel@alsa-project.org>; Sun, 14 Jun 2020 15:07:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 88923F8011E
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1592140030389317036-webhooks-bot@alsa-project.org>
References: <1592140030389317036-webhooks-bot@alsa-project.org>
Subject: alsa-gobject: add Python 3 sample scripts
Message-Id: <20200614130717.24BC5F8022B@alsa1.perex.cz>
Date: Sun, 14 Jun 2020 15:07:17 +0200 (CEST)
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

alsa-project/alsa-gobject pull request #37 was opened from takaswie:

PyGObject is a loader for GObject Introspection in Python 3 runtime. This patchset adds Python 3 sample scripts to use ALSACtl, ALSAHwdep, ALSARawmidi, ALSATimer, and ALSASeq loaded by PyGObject.

Request URL   : https://github.com/alsa-project/alsa-gobject/pull/37
Patch URL     : https://github.com/alsa-project/alsa-gobject/pull/37.patch
Repository URL: https://github.com/alsa-project/alsa-gobject
