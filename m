Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AD34B19D720
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Apr 2020 15:05:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2F5C9167D;
	Fri,  3 Apr 2020 15:04:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2F5C9167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585919143;
	bh=/XhEWTQObZtgJTrQVBkscp2e4Yfl8W2qcqQNF4B1WVQ=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YV+6TkYhV2zVwrffujo79iviaI7zQgILRjfZV+yZcsoHCttrbV9LWo7KgodPPiLuB
	 RqVdlc0jxEhm88OTk/ccOya7nDHHOdYf+Q2MEwWnPdyUtrs3MSbtOHq2JHv+DDL/p7
	 6aOexosGCdtLltqyMt/dKl4MSB28PQISsHurXc6s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3FFB1F800E4;
	Fri,  3 Apr 2020 15:04:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7A63DF8014C; Fri,  3 Apr 2020 15:03:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id C1A2EF800E4
 for <alsa-devel@alsa-project.org>; Fri,  3 Apr 2020 15:03:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C1A2EF800E4
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1585919032688257933-webhooks-bot@alsa-project.org>
References: <1585919032688257933-webhooks-bot@alsa-project.org>
Subject: alsa-gobject: add library to operate ALSA Sequencer character device
 without queue feature
Message-Id: <20200403130359.7A63DF8014C@alsa1.perex.cz>
Date: Fri,  3 Apr 2020 15:03:59 +0200 (CEST)
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

alsa-project/alsa-gobject pull request #10 was edited from takaswie:

This request is to add a new library, libalsaseq, to operate ALSA Sequencer
character device.

In design of ALSA Sequencer, one character device is added to Linux system.
Usually a special file, '/dev/snd/seq', is used for the character device.
Userspace applications can operate ALSA Sequencer via the character device.

The library supports functionalities of ALSA Sequencer but without
queue-related ones.

The library includes some GObject-derived object. ALSASeq.UserClient
maintains file descriptor of ALSA Sequencer character device, thus it's
the center of user operation. The other objects represent data structures
in UAPI of ALSA Sequencer.

 * ALSASeqSystemInfo - struct snd_seq_system_info
 * ALSASeqClientInfo - struct snd_seq_client_info
 * ALSASeqClientPool - struct snd_seq_client_pool
 * ALSASeqPortInfo - struct snd_seq_port_info
 * ALSASeqSubscribeData - struct snd_seq_port_subscribe

The library includes some GObject boxed object just to represent data
structures. ALSASeq.Addr is a thin wrapper to struct snd_seq_addr, and
ALSASeq.Tstamp is a thin wrapper to struct snd_seq_timestamp.

For operations without instances of ALSASeq.UserClient, the library
has some global APIs.

ALSA Sequencer has some macros. They're represented as GObject
enumerations and flags.

 * ALSASeq.ClientType - one of NO_CLIENT, USER_CLIENT, KERNEL_CLIENT
 * ALSASeq.FilterAttrFlag - SNDRV_SEQ_FILTER_XXX
 * ALSASeq.PortCapFlag - SNDRV_PORT_CAP_XXX
 * ALSASeq.PortAttrFlag - NDRV_SEQ_PORT_TYPE_XXX
 * ALSASeq.EventType - SNDRV_SEQ_EVENT_XXX
 * ALSASeq.EventTimestampMode - SNDRV_SEQ_TIME_STAMP_XXX
 * ALSASeq.EventTimeMode - SNDRV_SEQ_TIME_MODE_XXX
 * ALSASeq.EventLengthMode - SNDRV_SEQ_EVENT_LENGTH_XXX
 * ALSASeq.EventPriorityMode - SNDRV_SEQ_PRIORITY_XXX
 * ALSASeq.PortSubscribeFlag - SNDRV_SEQ_PORT_SUBS_XXX
 * ALSASeq.QuerySubscribeType - SNDRV_SEQ_QUERY_SUBS_XXX

Some specific values for addressing are also represented by GObject
enumerations and flags.

 * ALSASeq.SpecificAddress - SNDRV_SEQ_ADDRESS_XXX
 * ALSASeq.SpecificClientId - SNDRV_SEQ_CLIENT_XXX
 * ALSASeq.SpecificPortId - SNDRV_SEQ_PORT_SYSTEM_XXX
 * ALSASeq.SpecificQueueId - SNDRV_SEQ_QUEUE_XXX

ALSA Sequencer has many types of event. The library has an GObject
abstract object, ALSASeq.Event. Two objects are derived from it:

 * ALSASeq.EventFixed
 * ALSASeq.EventVariable

The former has some ways to access to the data of event. The data is
represented by GObject boxed object if it's complicated structure:

 * ALSASeq.EventDataConnect - struct snd_seq_connect
 * ALSASeq.EventDataNote - struct snd_seq_ev_note
 * ALSASeq.EventDataCtl - struct snd_seq_ev_ctrl
 * ALSASeq.EventDataResult - struct snd_seq_result
 * ALSASeq.EventDataQueue - struct snd_seq_ev_queue_control

The latter is for events to have variable length of data blob.

ALSASeq.UserClient has 'schedule_event' API to schedule arbitrary
event. It also has 'handle-event' GObject signal for applications
to handle asynchronous event as an instance of ALSASeq.EventFixed or
ALSASeq.EventVariable. To handle the GObject signal, applications
should get GSource from the instance and process GMainContext,
typically by call of GMainLoop.

The library doesn't have support for below structures since they're useless
practically:

 * struct snd_seq_event_bounce
 * struct snd_seq_running_info

In my later work, queue functions will be added.

Request URL   : https://github.com/alsa-project/alsa-gobject/pull/10
Patch URL     : https://github.com/alsa-project/alsa-gobject/pull/10.patch
Repository URL: https://github.com/alsa-project/alsa-gobject
