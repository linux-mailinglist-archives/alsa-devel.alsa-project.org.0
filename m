Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 254CE1FEE72
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Jun 2020 11:17:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B281B174C;
	Thu, 18 Jun 2020 11:16:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B281B174C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592471862;
	bh=eCCvaSV0xM2kfznJ6JPJ2KgYxnq9DdlSICzpCf03eTI=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OH1WnzewBZICTX6HwOzd0LA+v1EHYgYYenzwup1IMwNBANfuGB801nHoVlqyWCUC4
	 o+NwaQxTAeCKuhn1nio4wcEtrAsNZVSGHrvXLXrFtdhiJgZktcmC/NzDQuOFZ5RNoN
	 utUXBexO91gVvpakGslj3K8m6WLcMISjxEfRfsQo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A959AF80162;
	Thu, 18 Jun 2020 11:16:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3878BF80116; Thu, 18 Jun 2020 11:15:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 67827F80101
 for <alsa-devel@alsa-project.org>; Thu, 18 Jun 2020 11:15:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 67827F80101
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1592471753636013985-webhooks-bot@alsa-project.org>
References: <1592471753636013985-webhooks-bot@alsa-project.org>
Subject: File Plugin seems to drop data when writing to FIFO
Message-Id: <20200618091558.3878BF80116@alsa1.perex.cz>
Date: Thu, 18 Jun 2020 11:15:58 +0200 (CEST)
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

alsa-project/alsa-lib issue #63 was opened from riggiding:

Hi,

we're using the file plugin to pipe data for use in a vu-meter application. This worked well but since updating to 1.1.4.1 the data received is incomplete (tested using sine test tones and Audacity to playback / inspect the data that went through the fifo).
**When writing to a normal file all is fine.**

Also tried using tee, same result.
Any hints or ideas would be great!

**The fifo is created by:**
#! /bin/sh

if [ ! -p "$ALSA_FIFO" ]; then
	# create a fifo for alsa -> vumeter
	mkfifo "$ALSA_FIFO"                                           
	chmod 666 "$ALSA_FIFO"
fi

cat <>"$ALSA_FIFO"

**asound.conf:**

pcm.hiface {
	type hw
	card 0
	device 0
}

pcm.vumeter {
	type rate
	slave {
		pcm "alsaFifo"
		rate 44100
		format "S16_LE"
	}
}

pcm.alsaFifo {
	type file
	slave.pcm "null"
	file "/tmp/alsa-fifo"
}

pcm.alsaFifoTee {
       type empty
       slave.pcm "tee:null,'/tmp/alsa-fifo',raw"
}

pcm.direct {
	type route
	slave.pcm "split_direct"
	ttable.0.0 1
	ttable.1.1 1
	ttable.0.2 1
	ttable.1.3 1
}

pcm.split_direct {
	type multi
	slaves.a.pcm "hiface"
	slaves.a.channels 2
	slaves.b.pcm "vumeter"
	slaves.b.channels 2
	bindings.0.slave a
	bindings.0.channel 0
	bindings.1.slave a
	bindings.1.channel 1
	bindings.2.slave b
	bindings.2.channel 0
	bindings.3.slave b
	bindings.3.channel 1
}

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/63
Repository URL: https://github.com/alsa-project/alsa-lib
