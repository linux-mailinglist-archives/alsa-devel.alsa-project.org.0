Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A747A1F2BC6
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Jun 2020 02:22:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4BE9F1671;
	Tue,  9 Jun 2020 02:21:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4BE9F1671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591662123;
	bh=wbjIuYocycVRCMLW6WPb/+e1WFWh2HtNcsHkX7NwpZA=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cH05aXrwDyBt00PhkHe/zpFw9tnaGTNfkse452coJZSma7V7Vlnc9z2Hw0XlSFMmf
	 xu/m0A+nB4Mx3zAaa+v0MYN0HiTyAF297lhd0o+mHGNajOEGAcpVLoGIUCrkIAklnx
	 T4GQFS25KTmrb5ByrytqA7/KSDQwl/ynVmMVxotY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 78A6DF801F7;
	Tue,  9 Jun 2020 02:20:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8DD29F8021C; Tue,  9 Jun 2020 02:20:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 4CCF9F80125
 for <alsa-devel@alsa-project.org>; Tue,  9 Jun 2020 02:20:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4CCF9F80125
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1591662015500811100-webhooks-bot@alsa-project.org>
References: <1591662015500811100-webhooks-bot@alsa-project.org>
Subject: alsa-gobject: doc: hwdep: fix missing content of introduction element
Message-Id: <20200609002020.8DD29F8021C@alsa1.perex.cz>
Date: Tue,  9 Jun 2020 02:20:20 +0200 (CEST)
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

alsa-project/alsa-gobject pull request #26 was opened from takaswie:

A commit eb03ec0340b ("hwdep: fulfill documentation for ALSAHwdep") fulfilled documentation for ALSAHwDep but the content of introduction element is missing.

This patch fixes it.

Request URL   : https://github.com/alsa-project/alsa-gobject/pull/26
Patch URL     : https://github.com/alsa-project/alsa-gobject/pull/26.patch
Repository URL: https://github.com/alsa-project/alsa-gobject
