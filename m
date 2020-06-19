Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 94EB520038A
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Jun 2020 10:22:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 391B1167C;
	Fri, 19 Jun 2020 10:21:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 391B1167C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592554920;
	bh=NApRGbKI8Kme4b7OT0wHMNb+xsN+6XkT5feQqmikE5g=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gfOtS0g8EHQJmo/Jymwa0sb1fRrZsNjLbuDPDg586bgzmZGzBtldBIKkbKXRVKYdZ
	 yLiWLhtdzmF9HA5wJg29axOtG2xyZh8ge7liBH9Ee1DBeNKNRkzfFFLq6rQDtJxQUY
	 N0zv1Wy5bs4mnFfPzLfcrwmZmzXV1PXPPKvniijg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 73C9FF80255;
	Fri, 19 Jun 2020 10:20:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EA7DCF80252; Fri, 19 Jun 2020 10:20:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 25815F800EF
 for <alsa-devel@alsa-project.org>; Fri, 19 Jun 2020 10:20:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 25815F800EF
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1592554812258071899-webhooks-bot@alsa-project.org>
References: <1592554812258071899-webhooks-bot@alsa-project.org>
Subject: alsa-gobject: seq: use guint8 for the numerical ID of
 client/port/queue
Message-Id: <20200619082016.EA7DCF80252@alsa1.perex.cz>
Date: Fri, 19 Jun 2020 10:20:16 +0200 (CEST)
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

alsa-project/alsa-gobject pull request #41 was opened from takaswie:

In ALSA Sequencer core, the number of client/port/queue is defined as below per each:

 - SNDRV_SEQ_MAX_CLIENTS (=192)
 - SNDRV_SEQ_MAX_PORTS (=254)
 - SNDRV_SEQ_MAX_QUEUES (=32)

Following to it, in UAPI of Linux sound subsystem, several structures have `unsigned char` type of members:

 - struct snd_seq_addr.client
 - struct snd_seq_addr.port
 - struct snd_seq_event.queue

On the other hand, within the UAPI, 'int' type is also used for the numerical ID of client/port/queue. Following to the 'int' type, current API of ALSASeq includes API with 'gint' or 'guint' type of argument. However, it's better to use 'guint8' with consideration about the range of value.

This patchset declares the arguments to have 'guint8' type.

Request URL   : https://github.com/alsa-project/alsa-gobject/pull/41
Patch URL     : https://github.com/alsa-project/alsa-gobject/pull/41.patch
Repository URL: https://github.com/alsa-project/alsa-gobject
