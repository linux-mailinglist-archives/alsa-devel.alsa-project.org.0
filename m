Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AAFDB1B3937
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Apr 2020 09:42:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 416D316D9;
	Wed, 22 Apr 2020 09:41:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 416D316D9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587541338;
	bh=hv7Cvw3ii+wH94AG8g1zsniSnLd8IM3rieZj4N+nmVU=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bCsGDSXr5V6xFRVjdPPA3BvEGU5Z/x5qgNBjE9E78KzANmFGbMuNj9OaB0WD4ZmXo
	 thdWU92e71+snyX50ZOiqAshAosC1P8WSIxJ179n26kDs9OdX7mW/Ci4akfkG5vP9v
	 2vmxEqviiBUKrVwlB5B9JU7RHy0eWUlXZn5SRsIA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 47974F80108;
	Wed, 22 Apr 2020 09:40:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A6DAFF801D9; Wed, 22 Apr 2020 09:40:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id F40CFF80108
 for <alsa-devel@alsa-project.org>; Wed, 22 Apr 2020 09:40:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F40CFF80108
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1587541230379802942-webhooks-bot@alsa-project.org>
References: <1587541230379802942-webhooks-bot@alsa-project.org>
Subject: alsa-gobject: seq: some improvements and fixes
Message-Id: <20200422074034.A6DAFF801D9@alsa1.perex.cz>
Date: Wed, 22 Apr 2020 09:40:34 +0200 (CEST)
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

alsa-project/alsa-gobject pull request #18 was opened from takaswie:

In UAPI of ALSA Sequencer, some members in structures are defined as
fixed-sized array. For accessor methods to the members, this patchset
adds changes so that function annotations have 'not a variable length
array type' in their prototype.

In some cases, it's convenient to compare two instance of ALSASeq.Addr.
This patchset adds a new API, 'ALSASeq.Addr.equal()' for this purpose.

Finally, this patchset also adds some improvements and fixes.

Request URL   : https://github.com/alsa-project/alsa-gobject/pull/18
Patch URL     : https://github.com/alsa-project/alsa-gobject/pull/18.patch
Repository URL: https://github.com/alsa-project/alsa-gobject
