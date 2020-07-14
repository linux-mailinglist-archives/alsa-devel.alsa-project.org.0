Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C33921EED5
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jul 2020 13:14:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 22A6B1662;
	Tue, 14 Jul 2020 13:13:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 22A6B1662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594725284;
	bh=SxAryiBg+CXOYq1HUM7bhSs8Vbi+r3BupTNsYd4Ytvg=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YhxYlmJ2YwWacB7Dk7MWZFJliQpDMkeQwq8spdmH5QA60HCoIfioAu7jRCLtilJw0
	 sob10gxmxXgFjykwHH7B7IrSDg9EyT2HyhxMsoOJTGOd+NyBG574vDQvr3v3lXa4Pu
	 oA+pBF4Nq3wIKNbrcjFuDIv34zCaVFSWpisxKWKk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4C377F801EC;
	Tue, 14 Jul 2020 13:13:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 05E85F8019B; Tue, 14 Jul 2020 13:13:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 PRX_BODY_30,SPF_FAIL,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id AF944F80113
 for <alsa-devel@alsa-project.org>; Tue, 14 Jul 2020 13:12:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AF944F80113
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1594725170689719915-webhooks-bot@alsa-project.org>
References: <1594725170689719915-webhooks-bot@alsa-project.org>
Subject: Remove cset value quotation
Message-Id: <20200714111302.05E85F8019B@alsa1.perex.cz>
Date: Tue, 14 Jul 2020 13:13:02 +0200 (CEST)
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

alsa-project/alsa-ucm-conf pull request #40 was opened from libinyang:

This patchset removes the quotation marks of the cset values in the ucm2 config files.
In ucm2 files, the cset values should not use quotation marks. Otherwise, the cset won't work.

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/40
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/40.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
