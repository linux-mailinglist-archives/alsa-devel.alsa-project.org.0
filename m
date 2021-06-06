Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3911D39D06E
	for <lists+alsa-devel@lfdr.de>; Sun,  6 Jun 2021 20:24:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C20411728;
	Sun,  6 Jun 2021 20:23:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C20411728
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623003875;
	bh=ffusQGk2SzjXErnNSdS1A8gI9cIYvstXsbc/UJAXNGo=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DMFLSrbf6LF3jazv/vh1HZUKPZVqFl3wz1PRs5imoqta7fL8iba3RIBoZAyO4MRgX
	 caq+klWMuLfDqORmuuF6UPf7etuK8j+UAfj9myS0g8gbR52KQt3xpFZrAwCAeUgDCR
	 6E4OPH0fzdRGeaVIQxD9vtHCH1l0olITL4f1D5ZI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4E3BBF8019B;
	Sun,  6 Jun 2021 20:23:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 79230F80218; Sun,  6 Jun 2021 20:23:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id E77E2F800D0
 for <alsa-devel@alsa-project.org>; Sun,  6 Jun 2021 20:23:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E77E2F800D0
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1623003775469352007-webhooks-bot@alsa-project.org>
References: <1623003775469352007-webhooks-bot@alsa-project.org>
Subject: New lavc api
Message-Id: <20210606182305.79230F80218@alsa1.perex.cz>
Date: Sun,  6 Jun 2021 20:23:05 +0200 (CEST)
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

alsa-project/alsa-plugins pull request #23 was opened from jamrial:

This is untested (I don't have access to a system with alsa, but the change was straightforward enough that i could write it).

It is unlikely that it will fix the silence issue described in #22, but it nonetheless is a change required in order to support future versions of ffmpeg.
The silence is, as far as i could tell, related to the fact that starting with ffmpeg 4.4, the ac3_fixed encoder takes S32 planar as input, versus the S16 planar it used to. This plugin should look at the AVCodec sample_fmts[0] value and feed the encoder the appropriate data.

Request URL   : https://github.com/alsa-project/alsa-plugins/pull/23
Patch URL     : https://github.com/alsa-project/alsa-plugins/pull/23.patch
Repository URL: https://github.com/alsa-project/alsa-plugins
