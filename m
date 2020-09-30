Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AF6627EF0D
	for <lists+alsa-devel@lfdr.de>; Wed, 30 Sep 2020 18:24:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D47D01840;
	Wed, 30 Sep 2020 18:23:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D47D01840
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601483082;
	bh=hrjBs5hEpG18gMgFc7PREunPDFj0bu2v5cYLZ/K2VTU=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RxaHi5O5Z8z1U5w3Rnn6nYYMTJQBVMa6NjGqe7TB9w75DI+pQahuVZHPTJr5TrMQj
	 Y8lNK1pQQF0m3zAfzmkcTvKmPu6znkgI230sxharAkZUWCVIG9QYq9V6RMvW3q1SmJ
	 GN7YgVr23urUXyo25SYizbP9i+u8EOKCtToa6Wjw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 02403F800AB;
	Wed, 30 Sep 2020 18:23:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AA423F801ED; Wed, 30 Sep 2020 18:22:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 4F135F800AB
 for <alsa-devel@alsa-project.org>; Wed, 30 Sep 2020 18:22:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4F135F800AB
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1601482967600851059-webhooks-bot@alsa-project.org>
References: <1601482967600851059-webhooks-bot@alsa-project.org>
Subject: alsa-info: provide DMI system sku
Message-Id: <20200930162259.AA423F801ED@alsa1.perex.cz>
Date: Wed, 30 Sep 2020 18:22:59 +0200 (CEST)
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

alsa-project/alsa-utils pull request #59 was opened from plbossart:

The system sku is used in SOF machine drivers to set specific quirks,
expose it in alsa-info to help support users. Example on a SoundWire
enabled device:

cat /sys/class/dmi/id/product_sku
0A32
dmidecode -s system-sku-number
0A32

Add a variable and expose the results of both methods.

Note that the dmidecode support is very recent and might not yet be
available in all distros:

http://git.savannah.nongnu.org/cgit/dmidecode.git/commit/?id=d70d5e686148eabe90c89fbf4cdcf5258db5aa05

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

Request URL   : https://github.com/alsa-project/alsa-utils/pull/59
Patch URL     : https://github.com/alsa-project/alsa-utils/pull/59.patch
Repository URL: https://github.com/alsa-project/alsa-utils
