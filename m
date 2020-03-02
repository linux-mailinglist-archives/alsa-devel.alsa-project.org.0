Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 29EA11758A4
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Mar 2020 11:49:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7FB5216B0;
	Mon,  2 Mar 2020 11:48:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7FB5216B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583146168;
	bh=zqXEUu5q7AWEGLTc7soBCHee8ADB4oKrwDY5nWZPVR8=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tDBwec0/5esaQ59iERiT7bKA/mgtxfQ8Dfc6/gexiHNFx1xvQRZ4uJuIZ70WfwOWr
	 OtLOoNGt1bkZb0QlLs0bi27qWENdvA2vCgRY/+48bqpx01EQEGVvx74QRKzFgWH7Gm
	 kBZhMc2huEx+wGMAlWALPQvwE6Bp6UFTaYle07SM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 566AAF801F5;
	Mon,  2 Mar 2020 11:47:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 363E0F801ED; Mon,  2 Mar 2020 11:47:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 42F8EF80131
 for <alsa-devel@alsa-project.org>; Mon,  2 Mar 2020 11:47:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 42F8EF80131
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1583146061636600018-webhooks-bot@alsa-project.org>
References: <1583146061636600018-webhooks-bot@alsa-project.org>
Subject: alsa-gobject: add support for i386 build job to workflow of Github
 Actions
Message-Id: <20200302104745.363E0F801ED@alsa1.perex.cz>
Date: Mon,  2 Mar 2020 11:47:45 +0100 (CET)
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

alsa-project/alsa-gobject pull request #9 was opened from takaswie:

In lxd repository for Ubuntu Cloud Images[1], Ubuntu i386 container
is available for applications of Intel386 ABI.

This commit uses the container to test build for Intel386 ABI in
workflow of Github Actions.

I note that no official Fedora i386 container is in dockerhub
registry[2]. It's needed to find the way to build application for
Intel386 ABI on AMD64 architecture (perhaps multiarch) if we are
going to support it.

[1] https://cloud-images.ubuntu.com/releases/
[2] https://hub.docker.com/_/fedora

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>

Request URL   : https://github.com/alsa-project/alsa-gobject/pull/9
Patch URL     : https://github.com/alsa-project/alsa-gobject/pull/9.patch
Repository URL: https://github.com/alsa-project/alsa-gobject
