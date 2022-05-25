Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 97F32533BDD
	for <lists+alsa-devel@lfdr.de>; Wed, 25 May 2022 13:39:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 460A61669;
	Wed, 25 May 2022 13:38:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 460A61669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653478746;
	bh=ov7y1AURDo0pd07TuhwtZz/FgfdPqZPzQmh2KSkf6d4=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TWpfTJ0FlGNwXv3Hw7HXkeunuB2fMpk7Bzzf/SIo7xRRBn5APveWYB2Wez8sQjp3O
	 9QMiAfSxM1DKlk9G6WZnwoq9iqWBZzzic1bcSDy54wgnskhsTfW5v6HWoXgeez32rG
	 7KQqy3bYCK9j2OzLk7KYIP+x23wmKVcLSq7Q3MtQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B51DAF800D0;
	Wed, 25 May 2022 13:38:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E7E63F8016D; Wed, 25 May 2022 13:38:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 0FA1FF80100
 for <alsa-devel@alsa-project.org>; Wed, 25 May 2022 13:38:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0FA1FF80100
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1653478682439568996-webhooks-bot@alsa-project.org>
References: <1653478682439568996-webhooks-bot@alsa-project.org>
Subject: conf: Use ino64_t to save and compare inode numbers
Message-Id: <20220525113805.E7E63F8016D@alsa1.perex.cz>
Date: Wed, 25 May 2022 13:38:05 +0200 (CEST)
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

alsa-project/alsa-lib pull request #231 was opened from smcv:

On 32-bit platforms when not using the large-file-support ABI,
struct stat64 contains ino64_t which is 64-bit, while ino_t is only
32-bit.

snd_config_update_r() checks whether a file has been replaced by saving
the ino member of a struct stat64 and comparing it with a previously-saved
inode number. On 32-bit platforms, assigning the 64-bit member of struct
stat64 to a 32-bit member of struct finfo will truncate it modulo 1<<32,
which could conceivably result in libasound not reloading configuration
when it should (although the inode number space is large enough to make
this failure mode highly unlikely).

---

This is from source code inspection while looking at #223, I haven't seen a genuine user-observable bug result from this.

cc @dos1, @perexg, @bertogg

Request URL   : https://github.com/alsa-project/alsa-lib/pull/231
Patch URL     : https://github.com/alsa-project/alsa-lib/pull/231.patch
Repository URL: https://github.com/alsa-project/alsa-lib
