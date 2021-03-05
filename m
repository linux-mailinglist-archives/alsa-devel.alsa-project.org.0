Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8838D32F480
	for <lists+alsa-devel@lfdr.de>; Fri,  5 Mar 2021 21:12:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1C3531AD9;
	Fri,  5 Mar 2021 21:11:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1C3531AD9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614975144;
	bh=Q+pt6B8cE/cIztsnMTXf3uFl+4t/2f8WyV2UTpeJxgA=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rvVcqnSwXFkqDiX3ok8Y8w4Iz3fyEJgN3uQbOsc59zGFM5Pt5+yQp0r4+rTUFYeuF
	 X3WTJL9HeTxWgnebhYyItIPTDTcw3M82cXU6tEd8g4ZiH1yBSu+IPR1q9ABR9yxhqk
	 YVDvxhwFNZ6ZD9C7fj/yGQd5G0+ekoLEAWlefIkc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7F129F80257;
	Fri,  5 Mar 2021 21:10:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E5E68F8025E; Fri,  5 Mar 2021 21:10:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 8BCA2F80121
 for <alsa-devel@alsa-project.org>; Fri,  5 Mar 2021 21:10:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8BCA2F80121
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1614975040106086969-webhooks-bot@alsa-project.org>
References: <1614975040106086969-webhooks-bot@alsa-project.org>
Subject: Use HTTPS instead of HTTP
Message-Id: <20210305201048.E5E68F8025E@alsa1.perex.cz>
Date: Fri,  5 Mar 2021 21:10:48 +0100 (CET)
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

alsa-project/alsa-utils pull request #79 was opened from BrunoVernay:



Request URL   : https://github.com/alsa-project/alsa-utils/pull/79
Patch URL     : https://github.com/alsa-project/alsa-utils/pull/79.patch
Repository URL: https://github.com/alsa-project/alsa-utils
