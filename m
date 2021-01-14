Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 87E6D2F5E4F
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Jan 2021 11:08:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E47761685;
	Thu, 14 Jan 2021 11:07:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E47761685
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610618880;
	bh=7ELYL/8ZIGEaPvyB+pcwLBk1zS5s5r5ym06Zt95uytc=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QGX19kyFNIhxal0duCDXKmVxioPMrCPQCvcgKmgATH7C0W1lbvJYHpbsOWX55+zZX
	 Yz5ThEBl+4ZMe2hDgrcGXOfJJupArMEABA/mgyxJhNwPiAcec6mXPBzLujLDzRraUZ
	 i9bty9op6TgnSxkSnFDke0ggVW8Hm3x1+ong0p1o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 565E5F8026F;
	Thu, 14 Jan 2021 11:06:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 02FE6F8025E; Thu, 14 Jan 2021 11:06:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id B571BF80113
 for <alsa-devel@alsa-project.org>; Thu, 14 Jan 2021 11:06:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B571BF80113
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1610618778942914963-webhooks-bot@alsa-project.org>
References: <1610618778942914963-webhooks-bot@alsa-project.org>
Subject: ucm2: add initial configuration for TRX40 Gigabyte Aorus Master Audio
Message-Id: <20210114100625.02FE6F8025E@alsa1.perex.cz>
Date: Thu, 14 Jan 2021 11:06:24 +0100 (CET)
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

alsa-project/alsa-ucm-conf pull request #72 was opened from perexg:

BugLink: https://github.com/alsa-project/alsa-ucm-conf/pull/25

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/72
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/72.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
