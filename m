Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9197D1F94FA
	for <lists+alsa-devel@lfdr.de>; Mon, 15 Jun 2020 13:02:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1C0F0166F;
	Mon, 15 Jun 2020 13:01:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1C0F0166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592218922;
	bh=qGRE0Z9IRt1rCv8+WQEaLPsva3a96XgukU67pBYxQ2o=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RagEEMyCtVc+2n0JygFWqoDA8USMoxqzln7Pm0Bpk6ODkLN2K8vIi9ugssW1tQe1q
	 TIyycOy7OR+6AKAyy2UXddcdr51JfmO84//GiZVefI2SAenBus/b3Mpo6LYQ2jZu3W
	 TE7rdgGJ0NnnrK+CZ/jW3BZ6TJeK6nd6xDY7PtFU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4A00BF801D9;
	Mon, 15 Jun 2020 13:00:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7429DF80171; Mon, 15 Jun 2020 13:00:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id B5D0DF8013E
 for <alsa-devel@alsa-project.org>; Mon, 15 Jun 2020 13:00:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B5D0DF8013E
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1592218814897614002-webhooks-bot@alsa-project.org>
References: <1592218814897614002-webhooks-bot@alsa-project.org>
Subject: alsa-gobject: seq/timer: add constructure for status object
Message-Id: <20200615110019.7429DF80171@alsa1.perex.cz>
Date: Mon, 15 Jun 2020 13:00:19 +0200 (CEST)
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

alsa-project/alsa-gobject pull request #39 was opened from takaswie:

In patchset at #38, I forgot to add constructors for issued status object because no function call returns the instance of object. This patchset adds the constructors.

Request URL   : https://github.com/alsa-project/alsa-gobject/pull/39
Patch URL     : https://github.com/alsa-project/alsa-gobject/pull/39.patch
Repository URL: https://github.com/alsa-project/alsa-gobject
