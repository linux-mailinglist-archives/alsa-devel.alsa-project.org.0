Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F5722B95B1
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Nov 2020 16:06:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A267516F0;
	Thu, 19 Nov 2020 16:05:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A267516F0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605798369;
	bh=sI88vgo0DPOp7XgE2iSxQpIYQMXpp5pyvceSCSE6gRA=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XUsTyETVC6KanOWp+giqi+aeR8qaP0lQIq/H5YDKqPDDqtppsNZCYj1aOL9soiRBN
	 Czev8M8vIDyKRuLo1m+bzGlKKJci2h4heQX1JtaXozXKmdHtFQzuo4cjbktIc6RkIg
	 OXPXyGlACEvPD7li6oNv+PwB9soaPVaM6b5/1+Qo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 16D4AF801F5;
	Thu, 19 Nov 2020 16:04:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5E58CF801ED; Thu, 19 Nov 2020 16:04:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 368C4F8015A
 for <alsa-devel@alsa-project.org>; Thu, 19 Nov 2020 16:04:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 368C4F8015A
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1605798256206105947-webhooks-bot@alsa-project.org>
References: <1605798256206105947-webhooks-bot@alsa-project.org>
Subject: Better documentation with the examples
Message-Id: <20201119150425.5E58CF801ED@alsa1.perex.cz>
Date: Thu, 19 Nov 2020 16:04:23 +0100 (CET)
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

alsa-project/tinycompress issue #8 was opened from Andres6936:

I have compiled the program and when I run the `cplay` script I get an error:

```shellsession
andres6936@Tierra ~/CLionProjects/tinycompress-master/src/utils $ cplay TestAudio.mp3 
Error: Can't find sync word
```

I have already checked out different mp3 files and I keep getting the same error.
I have also tried different options, but it is always the same error.

Issue URL     : https://github.com/alsa-project/tinycompress/issues/8
Repository URL: https://github.com/alsa-project/tinycompress
