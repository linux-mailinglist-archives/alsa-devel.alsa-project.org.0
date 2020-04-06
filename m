Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A58119F06D
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Apr 2020 08:42:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EA6D082E;
	Mon,  6 Apr 2020 08:41:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EA6D082E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586155339;
	bh=uIbFA9ejxH9H0VkIsRjRmeKA2wIvf+Mnm7Gpl5LIXOk=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MM5/u5DIctQdCZ619iiXp9CHDgoOGzn3BHDQ/rWy+h86kTYRDh7W5zOL2j8HnwChJ
	 vnWdOvXC7x4+h8CA4lRdtU60GzAnttKMlDceLyM8HkLHZFqQvBlnEzzHnzexEX6TsB
	 MvkoanhnkyiahOW/8cl4q0wLGvdW5wvXCnqFdEBI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E9E5AF800CC;
	Mon,  6 Apr 2020 08:40:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E0B9BF80143; Mon,  6 Apr 2020 08:40:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 5526BF80140
 for <alsa-devel@alsa-project.org>; Mon,  6 Apr 2020 08:40:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5526BF80140
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1586155230144309998-webhooks-bot@alsa-project.org>
References: <1586155230144309998-webhooks-bot@alsa-project.org>
Subject: alsa-gobject: integrate ALSASeq to handle queue operations
Message-Id: <20200406064034.E0B9BF80143@alsa1.perex.cz>
Date: Mon,  6 Apr 2020 08:40:34 +0200 (CEST)
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

alsa-project/alsa-gobject pull request #14 was opened from takaswie:

In ALSA Sequencer, queue is an important element to dispatch
scheduled events. Without queue, any events are going to be
dispatched immediately and this mode is already supported.

This patchset is to support queue operations and complete
development for ALSASeq.

The information of queue is represented by ALSASeq.QueueInfo
GObject-derived object. Several APIs are added to ALSASeq.UserClient
to maintain lifetime of queue:

 - ALSASeq.UserClient.create_queue()
 - ALSASeq.UserClient.delete_queue()
 - ALSASeq.UserClient.update_queue()

The maintenance of actual queue behaviour can be already done
by scheduling events with ALSASeq.EventDataQueue with
appropriate event type.

The status and tempo of queue to dispatch scheduled events is
repsented by ALSASeq.QueueStatus and ALSASeq.QueueTempo. Some
APIs are added to ALSASeq.UserClient to retrieve them:

 - ALSASeq.UserClient.set_queue_tempo()
 - ALSASeq.UserClient.get_queue_tempo()
 - ALSASeq.UserClient.set_queue_timer()
 - ALSASeq.UserClient.get_queue_timer()

The registered queues can be reserved. Some APIs are added to
ALSASeq.UserClient for the reservation:

 - ALSASeq.UserClient.get_queue_usage()
 - ALSASeq.UserClient.set_queue_usage()

The queue is assigned to an instance of ALSA Timer device,
practically. In this case, global system timer device is used
according to parameters of snd_seq kernel module as a default.
This global system timer is based on Linux timer wheel. The
assignment is represented by subclasses of ALSASeq.QueueTimer
and ALSASeq.QueueTimerALSA is currently available. Two APIs
are added to ALSASeq.UserClient for the assignment:

 - ALSASeq.UserClient.set_queue_timer()
 - ALSASeq.UserClient.get_queue_timer()

Finally, the scheduled events can be removed from the queues. The
batch of target events is represented by ALSASeq.RemoveFilter and
ALSASeq.UserClient.remove_events() is available for the removal.

Request URL   : https://github.com/alsa-project/alsa-gobject/pull/14
Patch URL     : https://github.com/alsa-project/alsa-gobject/pull/14.patch
Repository URL: https://github.com/alsa-project/alsa-gobject
