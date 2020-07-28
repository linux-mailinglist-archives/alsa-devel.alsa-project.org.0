Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 687CE230A21
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Jul 2020 14:32:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E3F9816A4;
	Tue, 28 Jul 2020 14:31:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E3F9816A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595939532;
	bh=sbbc/hKuQ8NgVNQRnfHUw2edG3AuHy7YZ2y30h7GIXk=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tYVU4UyKHUNBISV79//KjcKOGhza6RyNIpYRbIVwQ0VCq0MnTq2drj6SzHtPUU+Nk
	 S3QvTooGmY/Z0j9JxmQZClqXpbseUT5ERxj/UfTfwxrTHsJk/ODxhpQCDwtiBZjV/5
	 G5+EM4R/OSh43r3JMX3icd0kIzN0tK9tfoM4wwrs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F2631F80227;
	Tue, 28 Jul 2020 14:30:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 25FF6F8021E; Tue, 28 Jul 2020 14:30:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 2C07BF800AD
 for <alsa-devel@alsa-project.org>; Tue, 28 Jul 2020 14:30:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2C07BF800AD
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1595939418857846022-webhooks-bot@alsa-project.org>
References: <1595939418857846022-webhooks-bot@alsa-project.org>
Subject: arecord command stop when output file set /dev/null
Message-Id: <20200728123028.25FF6F8021E@alsa1.perex.cz>
Date: Tue, 28 Jul 2020 14:30:28 +0200 (CEST)
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

alsa-project/alsa-utils issue #48 was opened from garyfcg:

How to reproduce it?
1. Input the below command, then record go on 
arecord -r 96000 -c 4 -f S32_LE  1> /dev/null 

2. Wait for some minutes, it depended on system memory size.
For example,system memory had 2G, 
(2*1024*1024*1024)/(96k*4*32/8)=1400s

The results:
1. this command quit auto.

Expect:
1. This command should not be interrupted.

Issue URL     : https://github.com/alsa-project/alsa-utils/issues/48
Repository URL: https://github.com/alsa-project/alsa-utils
