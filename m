Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BF9A62950A
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Nov 2022 10:58:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 18625169A;
	Tue, 15 Nov 2022 10:58:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 18625169A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668506339;
	bh=lCwmI2hziEzO2zFoLPFI8Pe7KlSgGh8cPGHQSVLnzpE=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pk7Zh20BzHQ1PPJ8p0GBKb9nW91+8y9KXkN7nCy6RdEEJMlokxFsi8ZtiFreOTyUU
	 KVIx6WLYimX+iSbA00fAd7edecjC7vrIdDcPwwjmnXY9eGve+iDbXHdk0O78cg6Nql
	 FbyG7T9EHmTZUZWKu7ceSfBVEmBMnk8Ev7cLd7nQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 97096F8047C;
	Tue, 15 Nov 2022 10:58:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 21517F800AA; Tue, 15 Nov 2022 10:58:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id B303EF800AA
 for <alsa-devel@alsa-project.org>; Tue, 15 Nov 2022 10:58:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B303EF800AA
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1668506281344060898-webhooks-bot@alsa-project.org>
References: <1668506281344060898-webhooks-bot@alsa-project.org>
Subject: aplay: Fix parsing of format with WAV_FMT_EXTENSIBLE header
Message-Id: <20221115095804.21517F800AA@alsa1.perex.cz>
Date: Tue, 15 Nov 2022 10:58:04 +0100 (CET)
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

alsa-project/alsa-utils pull request #178 was opened from amadeuszslawinski-intel:

WAV_FMT_EXTENSIBLE header contains valid bits per sample, which can be different than bits per sample. Make sure it is taken into account when parsing headers and choosing playback format.

Request URL   : https://github.com/alsa-project/alsa-utils/pull/178
Patch URL     : https://github.com/alsa-project/alsa-utils/pull/178.patch
Repository URL: https://github.com/alsa-project/alsa-utils
