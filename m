Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ED6B118A76B
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Mar 2020 22:54:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8EC2C1721;
	Wed, 18 Mar 2020 22:54:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8EC2C1721
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584568495;
	bh=i47tAMZa8+2oWlRgQVgqYGeSJei0gkzyEsYTylwlZvo=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sR8rmjqlJcf5IV422l1JI1Kxeapjvntyf5rOj4mwoiL2Ccq6cHHAXTWCX1TkTzhHX
	 bdc5HS1grh4Q4xUS8JWPgvCL6VkfpR+v0KVT0qGx6jjT9sQbl1NYTvboGgWWMuCZvV
	 dZ4iRRVcXjLzMP0QJ5han4OAvds9pjc93pH6J4Go=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1F2F5F8015B;
	Wed, 18 Mar 2020 22:53:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 787BCF801DB; Wed, 18 Mar 2020 22:53:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.8 required=5.0 tests=MISSING_DATE,MISSING_MID,
 PRX_BODY_64,SPF_FAIL,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id CF6E7F8015B
 for <alsa-devel@alsa-project.org>; Wed, 18 Mar 2020 22:53:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CF6E7F8015B
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1584568385481817961-webhooks-bot@alsa-project.org>
References: <1584568385481817961-webhooks-bot@alsa-project.org>
Subject: Corrections for pcm_a52 to work with pulseaudio
Message-Id: <20200318215311.787BCF801DB@alsa1.perex.cz>
Date: Wed, 18 Mar 2020 22:53:11 +0100 (CET)
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

alsa-project/alsa-plugins pull request #8 was opened from amotzkau:

Hi there,

First this is my first contact with ALSA programming, so please excuse any obvious mistakes.

On my computer Pulseaudio didn't work with the pcm_a52 plugin (Digital Surround 5.1 profile in Pulseaudio), everything was played with 30x speed (approximately). So I looked into the cause of this. Pulseaudio uses the zero-copy mmap interface of ALSA and expects that snd_pcm_mmap_commit() will except all frames that snd_pcm_mmap_begin() allowed to send. If snd_pcm_mmap_commit() accepts less frames or none (-EAGAIN) then Pulseaudio didn't remember that or even saved those frames. They were just discarded.

I thought that it would be a sound contract to guarantee that snd_pcm_mmap_commit() will always take those frames. Therefore I looked into pcm_a52, why it doesn't promise that, and changed the a52_pointer() function to offer such a guarantee.

These are my patches to make it work.

Best regards,
Alex

Request URL   : https://github.com/alsa-project/alsa-plugins/pull/8
Patch URL     : https://github.com/alsa-project/alsa-plugins/pull/8.patch
Repository URL: https://github.com/alsa-project/alsa-plugins
