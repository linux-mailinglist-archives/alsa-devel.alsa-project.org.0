Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CADAB469824
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Dec 2021 15:11:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 73EF42060;
	Mon,  6 Dec 2021 15:10:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 73EF42060
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638799871;
	bh=jsOL0adOggC5BKIQBRhQHRy84+D/RKlsXWtKE8j1KRI=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XpSDvZnhI1hfH7w+TnAr8ZJP0KeUgfmy7eOCRXHh7qKEo+a/AeYmcgRbwJjhJicYR
	 9dlhdra4dg8+DCYahTCwBLfhobL/6yl8KSVA4EHzsjh7dqQ5h7kYwFMI9cDF+1hsDj
	 TqAjQCPhDRA/W+Eu8XRpTcCr60DWm1VXlwkgup60=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C3671F804ED;
	Mon,  6 Dec 2021 15:09:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5AC4FF804EC; Mon,  6 Dec 2021 15:09:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 489C1F804AE
 for <alsa-devel@alsa-project.org>; Mon,  6 Dec 2021 15:09:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 489C1F804AE
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1638799784200225115-webhooks-bot@alsa-project.org>
References: <1638799784200225115-webhooks-bot@alsa-project.org>
Subject: GIT Project URLS
Message-Id: <20211206140952.5AC4FF804EC@alsa1.perex.cz>
Date: Mon,  6 Dec 2021 15:09:52 +0100 (CET)
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

alsa-project/alsa-lib issue #196 was edited from h1z1:

Hi

Not really sure where to report this, are the URLS listed on alsa-project.org accurate?   They include GIT and  HTTP, not HTTPS and are not correct regardless.

ex (from https://alsa-project.org/wiki/GIT_Server)

```
Web interface

          http://git.alsa-project.org/?p=alsa-driver.git
```

Results in what I"m assuming is a 404

```
$ git clone https://git.alsa-project.org/?p=alsa-driver.git alsa-driver.git
Cloning into 'alsa-driver.git'...
fatal: repository 'https://git.alsa-project.org/?p=alsa-driver.git/' not found
```

Worth noting gitweb is reachable.

Should those URLs be accessible via HTTPS?

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/196
Repository URL: https://github.com/alsa-project/alsa-lib
