Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6393F20086F
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Jun 2020 14:12:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 105E1167C;
	Fri, 19 Jun 2020 14:11:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 105E1167C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592568747;
	bh=ls+7CCQbcGCOUgMP2L9gm/LuEVGgO5ZM581TY2fJ0jw=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KM/klCKmwSMnpG9Ww/0DtW7ul2QWErZMCF1bDUzbaVOli5FxQx9r/xnHBbb9dPHmF
	 Tr2CvLrgrQRMtXqrAwKtaM+rgFq1sHNx74Wz5L+bqiUDH8W5XqvEvNUHlIqT1Kur7L
	 5Ko4/IvI+FBiEJ8dKBXH8WYo7p5FqfbHE6RTebEo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3AFAFF80232;
	Fri, 19 Jun 2020 14:10:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BA2D6F80252; Fri, 19 Jun 2020 14:10:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 5D59FF80232
 for <alsa-devel@alsa-project.org>; Fri, 19 Jun 2020 14:10:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5D59FF80232
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1592568640831276894-webhooks-bot@alsa-project.org>
References: <1592568640831276894-webhooks-bot@alsa-project.org>
Subject: alsa-gobject: supplement to use guint8 for the numerical ID of
 client/queue
Message-Id: <20200619121044.BA2D6F80252@alsa1.perex.cz>
Date: Fri, 19 Jun 2020 14:10:44 +0200 (CEST)
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

alsa-project/alsa-gobject pull request #42 was edited from takaswie:

Some APIs are missing in #41. This patchset has supplements for them.

Request URL   : https://github.com/alsa-project/alsa-gobject/pull/42
Patch URL     : https://github.com/alsa-project/alsa-gobject/pull/42.patch
Repository URL: https://github.com/alsa-project/alsa-gobject
