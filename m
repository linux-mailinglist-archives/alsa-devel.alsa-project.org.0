Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 02B9946B32D
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Dec 2021 07:46:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7E7AB1F94;
	Tue,  7 Dec 2021 07:46:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7E7AB1F94
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638859613;
	bh=aD+sM5Os15jr+2pTKG5kaClaNKKVwQE8Q1QqEkZKWCk=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kskmXQxxUOIi3tzzG6TiRTp9Gw5ZunopJY1WsBkONX2HXt3fg2KJ1C533iBgqjgZa
	 mdedyw5h3+FqpnVJC89KFWkmFdKS0hQEEhxHL01KedDWYzrghxfaLccjbT8bhqkrkH
	 Vy75kCZaOtZb0UVy9DUcUUYhH5cEvkHBF9zRn09A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C976EF8032B;
	Tue,  7 Dec 2021 07:45:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 645C9F8028D; Tue,  7 Dec 2021 07:45:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 84AFDF80103
 for <alsa-devel@alsa-project.org>; Tue,  7 Dec 2021 07:45:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 84AFDF80103
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1638859531323084116-webhooks-bot@alsa-project.org>
References: <1638859531323084116-webhooks-bot@alsa-project.org>
Subject: Add support for some non-alphanumeric variable names in the math expr
 evaluator
Message-Id: <20211207064536.645C9F8028D@alsa1.perex.cz>
Date: Tue,  7 Dec 2021 07:45:36 +0100 (CET)
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

alsa-project/alsa-lib issue #197 was opened from ranj063:

The math expression evaluator expects variable names to only be alpha-numeric. So if I have something like "[$DMIC_CH_COUNT + 2]", I get the error:

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/197
Repository URL: https://github.com/alsa-project/alsa-lib
