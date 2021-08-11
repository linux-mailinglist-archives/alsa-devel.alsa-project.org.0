Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 374BF3E9062
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Aug 2021 14:20:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C8D2E1741;
	Wed, 11 Aug 2021 14:19:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C8D2E1741
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628684403;
	bh=adM6uy6hm9WkSpJ1scTOFY3dE4w1MbgbvXPw4LeHQXc=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LhPGehsOtoRFdNGctJoIRADUzN4XKcynnfaswonp4/+ypm7Dkby7OdsFJ8gVkmRKn
	 WWnQt5t12xoDWaM0Uqs5OzcJQHUCmHV/Fkj6lDW/lecR3jx27/ZZ9XhvPViwKzm3CF
	 sKW+O+kH1HWqBcLkIxVpPJsiC0vRLtfutqgXUo2Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 35AAEF8032D;
	Wed, 11 Aug 2021 14:18:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 75B93F802D2; Wed, 11 Aug 2021 14:18:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id E79AFF80148
 for <alsa-devel@alsa-project.org>; Wed, 11 Aug 2021 14:18:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E79AFF80148
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1628684304109122992-webhooks-bot@alsa-project.org>
References: <1628684304109122992-webhooks-bot@alsa-project.org>
Subject: Unable to clone repo from windows or yocto
Message-Id: <20210811121834.75B93F802D2@alsa1.perex.cz>
Date: Wed, 11 Aug 2021 14:18:34 +0200 (CEST)
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

alsa-project/tinycompress issue #11 was opened from boppana113:

Attempted to clone the github repo using the following command: 

- git clone git://git.alsa-project.org/tinycompress.git

I got the following error: 
```
$ git clone git://git.alsa-project.org/tinycompress.git
Cloning into 'tinycompress'...
fatal: unable to connect to git.alsa-project.org:
git.alsa-project.org[0: 207.180.221.201]: errno=Unknown error
```

Issue URL     : https://github.com/alsa-project/tinycompress/issues/11
Repository URL: https://github.com/alsa-project/tinycompress
