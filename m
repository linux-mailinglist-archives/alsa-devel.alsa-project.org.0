Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B29883F5B31
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Aug 2021 11:43:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1C95F86F;
	Tue, 24 Aug 2021 11:42:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1C95F86F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629798176;
	bh=4V8n2AVsr8tAw9mjYxKkOWtnDENnoK2mLl9pYV56+5g=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YD4aDxtzlvBi+qJAahWuZAnsnd+Z69PsYH/tiRN8bNltqY1M/66UiaVA0N6eRV67U
	 Xb4n9YoE5/UXziyIqV95dtos6cqnk+f1WAUKrcQgJ0mEWnKm2orfIX9xaALCugB08c
	 D5U7Og3Qjq/myJnxI1tnyqDXDFpmjdpVELis7iDc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 76990F80087;
	Tue, 24 Aug 2021 11:41:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8F717F80224; Tue, 24 Aug 2021 11:41:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 4223CF80087
 for <alsa-devel@alsa-project.org>; Tue, 24 Aug 2021 11:41:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4223CF80087
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1629798087739185095-webhooks-bot@alsa-project.org>
References: <1629798087739185095-webhooks-bot@alsa-project.org>
Subject: rawmidi: hide the frame structure using a decoder function
Message-Id: <20210824094137.8F717F80224@alsa1.perex.cz>
Date: Tue, 24 Aug 2021 11:41:37 +0200 (CEST)
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

alsa-project/alsa-lib pull request #173 was opened from perexg:

The frame structure should be hidden. Remove it and add
snd_rawmidi_decode_frame0() which returns the timestamp
and the midi chunk pointer to the application.

BugLink: https://github.com/alsa-project/alsa-lib/issues/172

Request URL   : https://github.com/alsa-project/alsa-lib/pull/173
Patch URL     : https://github.com/alsa-project/alsa-lib/pull/173.patch
Repository URL: https://github.com/alsa-project/alsa-lib
