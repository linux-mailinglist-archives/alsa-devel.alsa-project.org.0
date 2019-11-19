Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 61D19102274
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Nov 2019 11:59:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D9DAC1697;
	Tue, 19 Nov 2019 11:58:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D9DAC1697
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574161178;
	bh=J4nrlZG4aU+d3nJ4dhmsqBT63iyU9+s4Qin1khVZDzA=;
	h=From:To:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=l/wRre1tp9hRagE8sltrSATa6W0kXmZ/w8i2goBVJHeClpkrgiU/l+d2WQ/2jKsAZ
	 EKWrvQp9lGOqc80Yz9GNODibyvRJYM/KecqmCf4JV4nwKqIC0pYH5pQzyMlfO5TYL1
	 C92sgk1XWv7/XertJZIaShqfWxAmv3Haz8AGws94=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BBC50F80138;
	Tue, 19 Nov 2019 11:58:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0BCB5F80119; Tue, 19 Nov 2019 11:58:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id C8B53F80119
 for <alsa-devel@alsa-project.org>; Tue, 19 Nov 2019 11:58:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C8B53F80119
MIME-Version: 1.0
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1574161093148889065-webhooks-bot@alsa-project.org>
References: <1574161093148889065-webhooks-bot@alsa-project.org>
Message-Id: <20191119105816.0BCB5F80119@alsa1.perex.cz>
Date: Tue, 19 Nov 2019 11:58:16 +0100 (CET)
Subject: [alsa-devel] Flac
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

alsa-project/tinycompress pull request #2 was opened from vinodkoul:

This adds the header file for FLAC and also adds the .pc file for the library so that users can discover details about the library

Request URL   : https://github.com/alsa-project/tinycompress/pull/2
Patch URL     : https://github.com/alsa-project/tinycompress/pull/2.patch
Repository URL: https://github.com/alsa-project/tinycompress
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
