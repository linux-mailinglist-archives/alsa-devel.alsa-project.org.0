Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8928152E461
	for <lists+alsa-devel@lfdr.de>; Fri, 20 May 2022 07:36:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 26D271746;
	Fri, 20 May 2022 07:35:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 26D271746
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653025003;
	bh=PY+u9Rsa9B7AvkrCTCMPW93YBisRDq7Qeu1gyyTNuwg=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Y4D3zTZ9R4ZwvrSwXkyjymPVlEYu4seLUYumEYrGKs7/wOYP9MZj95dbZGEQAdWRh
	 8whyooA3Td2DvdN7JQrFDmlaCe0Cf/7RJtl9LA7sI08LZfW89D7SM1OWxLcmqXLD2s
	 UrERAA6p9cAyf9ZWEop8MKaV6MrdSiPGqi+VlRfs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9B77CF80109;
	Fri, 20 May 2022 07:35:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 25087F8019D; Fri, 20 May 2022 07:35:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 37500F80109
 for <alsa-devel@alsa-project.org>; Fri, 20 May 2022 07:35:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 37500F80109
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1653024934504338980-webhooks-bot@alsa-project.org>
References: <1653024934504338980-webhooks-bot@alsa-project.org>
Subject: topology: plugins: nhlt: fix intel dmic mode calculation
Message-Id: <20220520053542.25087F8019D@alsa1.perex.cz>
Date: Fri, 20 May 2022 07:35:42 +0200 (CEST)
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

alsa-project/alsa-utils pull request #148 was opened from juimonen:

Dmic find_modes function was used with same sampling rate for both fifo
a and b parameter calculations. This bug was found in testing two
simultaneous dmic dais in topology. Fix this by introducing a sampling
rate argument for find_modes.

Signed-off-by: Jaska Uimonen <jaska.uimonen@linux.intel.com>

Request URL   : https://github.com/alsa-project/alsa-utils/pull/148
Patch URL     : https://github.com/alsa-project/alsa-utils/pull/148.patch
Repository URL: https://github.com/alsa-project/alsa-utils
