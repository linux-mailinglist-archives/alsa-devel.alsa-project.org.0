Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DFD391F1B42
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Jun 2020 16:46:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 850691664;
	Mon,  8 Jun 2020 16:45:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 850691664
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591627609;
	bh=hGAzYI4wu29VX/b/nCBr/8rvlL9SNATpRZpuPzX2bZw=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HQuUvyTNsnP+EnZ3Q3Rc8tnSCKMpTEdv6zlq8f6tDXHHqDGU+yMbUmsoKlbepDZ0Z
	 Dmfuhnuq5pq6eKdkCGstO51uujpXFUICgU9GeNNTI1DW2hGBrf0BYUw3ciOgSqVo28
	 oRarL/vESEkxeefVWz2hO0tsbbpASHjs6JAUFFo4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C94C9F801F7;
	Mon,  8 Jun 2020 16:45:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DF57BF8021C; Mon,  8 Jun 2020 16:45:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 780CCF80125
 for <alsa-devel@alsa-project.org>; Mon,  8 Jun 2020 16:45:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 780CCF80125
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1591627495485512972-webhooks-bot@alsa-project.org>
References: <1591627495485512972-webhooks-bot@alsa-project.org>
Subject: alsa-gobject: seq: introduce container of events
Message-Id: <20200608144504.DF57BF8021C@alsa1.perex.cz>
Date: Mon,  8 Jun 2020 16:45:04 +0200 (CEST)
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

alsa-project/alsa-gobject pull request #25 was opened from takaswie:

Hi,

This patchset adds a new GObject-derived object; ALSASeqEventCntr to obsolete usage of ALSASeqEvent, ALSASeqEventFixed, and ALSASeqEventVariable.

At present, ALSASeqUserClient processes events per each. It brings recursive calls of scheduling API or recursive handling for emitted GObject signal for received events. It's inconvenient in a point of memory usage and signal frequency.

The ALSASeqEventCntr includes a flat memory to represent a batch of events. The object includes many accessor methods to properties of event according to given index number. The object enables applications to handle a batch of events without the recursive calls or the recursive handling.

This patchset obsoletes ALSASeqEvent, thus event structure is not produced itself. Applications can define its own event structure so that it's convenient in a point of chose programming language. It's probable to design collection in the languages with the object.

Request URL   : https://github.com/alsa-project/alsa-gobject/pull/25
Patch URL     : https://github.com/alsa-project/alsa-gobject/pull/25.patch
Repository URL: https://github.com/alsa-project/alsa-gobject
