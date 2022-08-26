Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A36A5A2668
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Aug 2022 13:02:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2F4FD167C;
	Fri, 26 Aug 2022 13:01:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2F4FD167C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661511728;
	bh=ScNgRkqaqiySV6ql2rZX5JWArncW9RyXVy/hfm1V5Os=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XA+tWSbP9EClr8OIbIXIRKsXVu5xM+v+oHmlREdFMEAVK0T3EfTdEJckXM1Zg4ppV
	 Cgs4J1DQy4tsuTwEkxW+phqLaj9/gNF3+8DyKfCc6qEAx/G2NqdR/jz19gYhIOWlgw
	 gyVIDo+gYa1aY3mtrvHfQ/CC8aoD6fvY7RWlTiB0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A9ABBF8032D;
	Fri, 26 Aug 2022 13:01:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D4954F80238; Fri, 26 Aug 2022 13:01:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 5A1BAF80134
 for <alsa-devel@alsa-project.org>; Fri, 26 Aug 2022 13:01:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5A1BAF80134
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1661511664872678995-webhooks-bot@alsa-project.org>
References: <1661511664872678995-webhooks-bot@alsa-project.org>
Subject: Add interactive pause/resume functionality
Message-Id: <20220826110107.D4954F80238@alsa1.perex.cz>
Date: Fri, 26 Aug 2022 13:01:07 +0200 (CEST)
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

alsa-project/tinycompress pull request #14 was edited from LaurentiuM1234:

We want to be able to interactively pause and resume the stream.

Initially, when trying to play an MP3 song, cplay would hang during the polling on compress_write. The cause for this was probably the fact that, after calling `get_codec_mp3`, the file pointer would point to the first MP3 data, leaving out the first MP3 header. I'm assuming that this would cause the codec to hang since it wouldn't be able to find the first MP3 header.

In order to be able to use the pause/resume functionality on MP3 streams, this problem had to be addressed before adding the actual functionality.

Request URL   : https://github.com/alsa-project/tinycompress/pull/14
Patch URL     : https://github.com/alsa-project/tinycompress/pull/14.patch
Repository URL: https://github.com/alsa-project/tinycompress
