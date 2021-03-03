Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 06FAF32BB10
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Mar 2021 22:08:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7CBEE1A9C;
	Wed,  3 Mar 2021 22:07:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7CBEE1A9C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614805723;
	bh=Eg8Fcw8QG8CgLuoj0OrhUyjh5fxlNnT7m68VXU1EPTI=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jPDNin2NjivCGpdFy8WfQpINZt9Sig4P6OeSamHRWpVEaAGQOP7bvt26FE4mnoeFs
	 Dic1czAkqYdAGNNybW86dbJzCHV+4GhTdZREorsTKALI8jjQpiDZfQmgMaCM6DUaSi
	 LHsWeKE4QvdDEBuiSrlPGbA0p6jA2LKXtFe7uHtg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 06542F80257;
	Wed,  3 Mar 2021 22:07:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 734A6F8025E; Wed,  3 Mar 2021 22:07:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id D7F68F80227
 for <alsa-devel@alsa-project.org>; Wed,  3 Mar 2021 22:07:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D7F68F80227
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1614805616283802032-webhooks-bot@alsa-project.org>
References: <1614805616283802032-webhooks-bot@alsa-project.org>
Subject: conf: Remove non-existent SPDIF output on Dell AE515
Message-Id: <20210303210709.734A6F8025E@alsa1.perex.cz>
Date: Wed,  3 Mar 2021 22:07:09 +0100 (CET)
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

alsa-project/alsa-lib pull request #124 was opened from drjhe:

The Dell Professional Sound Bar AE515 shows up in GNOME Settings with a digital output that doesn't physically exist. Add it to the list to suppress this.

Request URL   : https://github.com/alsa-project/alsa-lib/pull/124
Patch URL     : https://github.com/alsa-project/alsa-lib/pull/124.patch
Repository URL: https://github.com/alsa-project/alsa-lib
