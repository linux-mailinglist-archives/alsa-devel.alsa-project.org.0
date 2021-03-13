Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 964D6339F56
	for <lists+alsa-devel@lfdr.de>; Sat, 13 Mar 2021 18:06:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2344118F3;
	Sat, 13 Mar 2021 18:05:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2344118F3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615655207;
	bh=FfqF0il6/5ShmIiBqbgahiN3Nq/bHtEbhNCdaR+qEf0=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=edoNaHjyBp2tYR5KegV+ykWlhRykpVmLdS7uJgdmf+3bGQcDACim/J7KJgpWhc5/w
	 Me7OH5SPPf8s35vWqxspmKdNSSZZDcmOCe0nh/dKSYWDAVdYv7wpoeuQHAM4vKHOHq
	 H5zYmNp40MkCLc/iJl9VxAkXIodUe0spv4tZlQtM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7607FF80256;
	Sat, 13 Mar 2021 18:05:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8B8C5F80227; Sat, 13 Mar 2021 18:05:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 05FFDF8012A
 for <alsa-devel@alsa-project.org>; Sat, 13 Mar 2021 18:05:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 05FFDF8012A
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1615655110472681999-webhooks-bot@alsa-project.org>
References: <1615655110472681999-webhooks-bot@alsa-project.org>
Subject: broadwell-rt286, bdw-rt5677: Fix inconsistency in card detection
Message-Id: <20210313170514.8B8C5F80227@alsa1.perex.cz>
Date: Sat, 13 Mar 2021 18:05:14 +0100 (CET)
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

alsa-project/alsa-ucm-conf pull request #85 was edited from dpward:

This conveniently provides a workaround for a bug in kernel 5.10:
https://bugzilla.kernel.org/show_bug.cgi?id=211985

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/85
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/85.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
