Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 292733B524E
	for <lists+alsa-devel@lfdr.de>; Sun, 27 Jun 2021 08:23:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9F3F2169A;
	Sun, 27 Jun 2021 08:22:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9F3F2169A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624774983;
	bh=vc4kgri94w3BZIDA4ubG0byylC66en7GXMIH7mbS0EA=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LFR43q+HbmFJv5hghMp6rvAjW54tZaPe6Yq6eSaw9/IeCwtw12mqSfouzfSf9CmYV
	 UBmPPgpyvvVxqoLVn+DcBvLn5mk2tRCl1d3yB5sF8La7QG1kQ1jvKermJQ+zBQO+1S
	 rUiXhlYMo5RiPrDcG2dw836V8jci6X63KWUrbGL0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EBC2AF800BE;
	Sun, 27 Jun 2021 08:21:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 821D4F80259; Sun, 27 Jun 2021 08:21:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id B802AF80137
 for <alsa-devel@alsa-project.org>; Sun, 27 Jun 2021 08:21:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B802AF80137
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1624774876088783026-webhooks-bot@alsa-project.org>
References: <1624774876088783026-webhooks-bot@alsa-project.org>
Subject: doc: new a52 input formats, global config
Message-Id: <20210627062124.821D4F80259@alsa1.perex.cz>
Date: Sun, 27 Jun 2021 08:21:24 +0200 (CEST)
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

alsa-project/alsa-plugins pull request #30 was opened from quequotion:

Document the new preconfiguration and libavcodec version-dependent input formats, fixes #29.

Note: I haven't documented specifically which version of libavcodec determines which input format.

I got pretty confused trying to pin the commits that switched from linear to planar, and 16bit to 32bit to specific versions of libavcodec.

If we need that documented, I need some help with that.

Let me know if I got anything wrong!

Request URL   : https://github.com/alsa-project/alsa-plugins/pull/30
Patch URL     : https://github.com/alsa-project/alsa-plugins/pull/30.patch
Repository URL: https://github.com/alsa-project/alsa-plugins
