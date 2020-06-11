Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E70871F613E
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Jun 2020 07:25:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 87786166D;
	Thu, 11 Jun 2020 07:24:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 87786166D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591853109;
	bh=fQkaYnUGm2loc9EYAZXFkUSQt/dfoT2hUKtKhucDOyw=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=u6u4T+40iJoSxUUNnpXt3Jt/YCMZa+WNOWe0N8oluKwN4y7Qnwrkd8GinA+juBG2E
	 YmVhGjieDI2mBvl0yzSZwmboTN4jDkWhktJ8h99KatEO04E8rHiUS7t3ZhAnD5NjaO
	 XJtHh87mLD6w5x8evqECIgK2Lmq+J+N+zRum20XE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B4058F800CC;
	Thu, 11 Jun 2020 07:23:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8482FF8028C; Thu, 11 Jun 2020 07:21:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id C640DF800CC
 for <alsa-devel@alsa-project.org>; Thu, 11 Jun 2020 07:20:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C640DF800CC
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1591852848772607088-webhooks-bot@alsa-project.org>
References: <1591852848772607088-webhooks-bot@alsa-project.org>
Subject: alsa-gobject: obsolete abstract class for snd_seq_queue_timer
 structure
Message-Id: <20200611052103.8482FF8028C@alsa1.perex.cz>
Date: Thu, 11 Jun 2020 07:21:03 +0200 (CEST)
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

alsa-project/alsa-gobject pull request #30 was opened from takaswie:

In UAPI of Linux sound subsystem, `snd_seq_queue_timer` structure includes union member.

Current implementation of ALSASeq uses abstract class (ALSASeqQueueTimer) and concrete class (ALSASeqQueueTimerAlsa) to represent variation corresponding to each of union member. However, the design pattern is not convenient for some language bindings.

For example, in Rust language, class-based inheritance is not supported. Gtk-rs project produces mechanism to upcast/downcast between super/sub classes and handles GObject class system. In my opinion, the code to upcast/downcast is a bit complicated to handle derivatives.

This patchset obsoletes usage of abstract class for ALSASeq. The target is ALSASeqQueueTimer. ALSASeqQueueTimerDataAlsa is newly defined to retrieve data for the case of ALSATimer and the inherited ALSASeqQueueTimerAlsa is deleted.

Request URL   : https://github.com/alsa-project/alsa-gobject/pull/30
Patch URL     : https://github.com/alsa-project/alsa-gobject/pull/30.patch
Repository URL: https://github.com/alsa-project/alsa-gobject
