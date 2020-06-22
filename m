Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 89C1B2032D8
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jun 2020 11:06:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2927E167D;
	Mon, 22 Jun 2020 11:05:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2927E167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592816800;
	bh=YLkXsTZKKm0cOTPcYXdneVPKEVIQ3XApf21x0dVEkxQ=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Y8OeY8m3o1wNSfaetEdND7q7OZq/uL/Gtrpqjy/tjsv4it0AxQ1XFDR0HnnCLbBZf
	 uIeZofiSY97Sd0G+yW7Y/K7r/sBZGRR78r6uGqtkW/paMXBNUVeGjm93GqN5PzrKtC
	 KKDJtDdfoe+9Uv2mEcmPBqUzpNCJiWjGbBwWRg8M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 49348F80162;
	Mon, 22 Jun 2020 11:04:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DD7A3F8015B; Mon, 22 Jun 2020 11:04:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 777B4F8010E
 for <alsa-devel@alsa-project.org>; Mon, 22 Jun 2020 11:04:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 777B4F8010E
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1592816694661978960-webhooks-bot@alsa-project.org>
References: <1592816694661978960-webhooks-bot@alsa-project.org>
Subject: alsa-gobject: bump version up to 0.1.0 for official release
Message-Id: <20200622090457.DD7A3F8015B@alsa1.perex.cz>
Date: Mon, 22 Jun 2020 11:04:57 +0200 (CEST)
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

alsa-project/alsa-gobject pull request #46 was opened from takaswie:

This patch is a preparation for official v0.1.0 release. After merged, I'm going to push a tag 'v0.1.0' with release note.

Request URL   : https://github.com/alsa-project/alsa-gobject/pull/46
Patch URL     : https://github.com/alsa-project/alsa-gobject/pull/46.patch
Repository URL: https://github.com/alsa-project/alsa-gobject
