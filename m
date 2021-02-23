Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DF98322A56
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Feb 2021 13:14:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0884F1662;
	Tue, 23 Feb 2021 13:13:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0884F1662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614082479;
	bh=MCqmZmZJjzQwGvNdqDY5nwS21lvBHw9zCpil7o5v9C8=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pgDfuGihlWOoel3x5cIEZjXQphhyhUT7qH1p0+2NwQbz6+zNiIMXyJphZBBBOoftP
	 3/fxZ4O9wRNGQ+nSTNvN44/kGXks7HB1oW2i4/FxVstPDKCqaQpybiXivcsgyDFxql
	 JwuF213Xv6bfOBMWRXRKCU7j3Exvr0WwveXkaY/4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5812CF80129;
	Tue, 23 Feb 2021 13:13:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B2044F80167; Tue, 23 Feb 2021 13:13:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 2A49FF80167
 for <alsa-devel@alsa-project.org>; Tue, 23 Feb 2021 13:13:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2A49FF80167
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1614082376871057034-webhooks-bot@alsa-project.org>
References: <1614082376871057034-webhooks-bot@alsa-project.org>
Subject: Add audio LED support - control API and PCM softvol plugin
Message-Id: <20210223121306.B2044F80167@alsa1.perex.cz>
Date: Tue, 23 Feb 2021 13:13:06 +0100 (CET)
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

alsa-project/alsa-lib pull request #121 was opened from perexg:

As proposed for the driver, this set of patches can resolve the LED handling issue for the hardware without mixer switches or volume controls (like AMD ACP bridge).

Request URL   : https://github.com/alsa-project/alsa-lib/pull/121
Patch URL     : https://github.com/alsa-project/alsa-lib/pull/121.patch
Repository URL: https://github.com/alsa-project/alsa-lib
