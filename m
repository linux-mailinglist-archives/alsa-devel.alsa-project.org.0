Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9547D3E9065
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Aug 2021 14:21:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 389111744;
	Wed, 11 Aug 2021 14:20:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 389111744
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628684506;
	bh=3lfbYNjDh9zkIXnDYLgDcA3kCThC7Zi2jRHuRTVOdFI=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pmHQvXWCMUFk856rWFbuZu85a8HZXXqZMfXEU9w45OO/Si8UZolf8WiVJxyVCMSUl
	 dw7ntHvWlNAB5DXRrJaVhvBADTrx0G//4JX5Zrv9r1ruXO5Dhg3Eyt20TFxiYxqNty
	 Rw0h7toZABN/eDG45yyJQbfj4iIkNEKROVB36Zlw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D59D1F80148;
	Wed, 11 Aug 2021 14:20:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 119B4F802D2; Wed, 11 Aug 2021 14:20:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id A2ED6F800F4
 for <alsa-devel@alsa-project.org>; Wed, 11 Aug 2021 14:20:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A2ED6F800F4
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1628684407614279985-webhooks-bot@alsa-project.org>
References: <1628684407614279985-webhooks-bot@alsa-project.org>
Subject: Unable to clone repo from windows or yocto
Message-Id: <20210811122016.119B4F802D2@alsa1.perex.cz>
Date: Wed, 11 Aug 2021 14:20:16 +0200 (CEST)
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

alsa-project/tinycompress issue #11 was edited from boppana113:

Attempted to clone the github repo using the following command: 

- git clone git://git.alsa-project.org/tinycompress.git

I got the following error: 
```
$ git clone git://git.alsa-project.org/tinycompress.git
Cloning into 'tinycompress'...
fatal: unable to connect to git.alsa-project.org:
git.alsa-project.org[0: 207.180.221.201]: errno=Unknown error
```
The git clone command appears to timeout

Issue URL     : https://github.com/alsa-project/tinycompress/issues/11
Repository URL: https://github.com/alsa-project/tinycompress
