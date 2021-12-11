Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F659471735
	for <lists+alsa-devel@lfdr.de>; Sat, 11 Dec 2021 23:45:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A66731ACB;
	Sat, 11 Dec 2021 23:44:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A66731ACB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639262714;
	bh=HpxnDgtYyQBL06BiGzCjM/z8Ga5z6+rswdvFzor8Vco=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ASjxLoEhc8c2/qG2LF9otNCngGB0akdb961lXK13JUKUUaR0vDqAhWgbaaWL9rMwV
	 zEj13gHv3Ht9wGsBoZV/EEA0Uroac7/w747D3ZGjQAy6L5ECOS9JTbnckjyftw9lBx
	 XRyVbxIG9BSg4hcXAORwnuUexfz3XE2M7uxqRVdw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DC1FEF804CF;
	Sat, 11 Dec 2021 23:44:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C09DBF804CC; Sat, 11 Dec 2021 23:44:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 2D506F804AE
 for <alsa-devel@alsa-project.org>; Sat, 11 Dec 2021 23:44:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2D506F804AE
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1639262637229935884-webhooks-bot@alsa-project.org>
References: <1639262637229935884-webhooks-bot@alsa-project.org>
Subject: Move the call to expand variables and expressions
Message-Id: <20211211224405.C09DBF804CC@alsa1.perex.cz>
Date: Sat, 11 Dec 2021 23:44:05 +0100 (CET)
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

alsa-project/alsa-utils pull request #127 was opened from ranj063:

With the addition of the math expression evaluator in alsa-lib, we can use it to evaluate simple math expresionns for objects attribute values based on other attributes.

For example to calculate the size attribute in buffer objects: 
size	"$[$[$[$periods * $sample_size] * $channels] * $[$[$rate * $period]]] / 1000000"

The size attribute value will be computed from the values for the periods, sample_size, channels, rate and period attribute values set in the buffer object.

Request URL   : https://github.com/alsa-project/alsa-utils/pull/127
Patch URL     : https://github.com/alsa-project/alsa-utils/pull/127.patch
Repository URL: https://github.com/alsa-project/alsa-utils
