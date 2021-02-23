Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C4CB322A9F
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Feb 2021 13:35:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D688E167B;
	Tue, 23 Feb 2021 13:34:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D688E167B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614083742;
	bh=4qy9upeCkzlc+NPhqTJu0/2OD2GAnwnNW9jXlNWYLro=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EWS9a4d9OBTpovkzHosIk3ANG37Zz5s92Q6e4IFwsxLg61AhJiz2QwLdvRZD4tVU2
	 9eB+Ns7QMXmNrk/WVW0IiLqAI7JwxWoig2afZdNNofM6B6PXzRmk2MJyTgYtxt+PAE
	 NeNIa8EAzSqco3Z/dsvh81PYbT5+4xSa43vHD7po=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 22A72F8016D;
	Tue, 23 Feb 2021 13:34:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6F57DF8016A; Tue, 23 Feb 2021 13:34:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx1.opensynergy.com (mx1.opensynergy.com [217.66.60.4])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ED88AF80129
 for <alsa-devel@alsa-project.org>; Tue, 23 Feb 2021 13:34:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ED88AF80129
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=opensynergy.com header.i=@opensynergy.com
 header.b="IpBWL1vQ"
Received: from SR-MAILGATE-02.opensynergy.com (localhost.localdomain
 [127.0.0.1])
 by mx1.opensynergy.com (Proxmox) with ESMTP id 901FCA12AF;
 Tue, 23 Feb 2021 13:33:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=opensynergy.com;
 h=cc:cc:content-transfer-encoding:content-type:content-type
 :date:from:from:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to; s=srmailgate02; bh=N7kU7TdyBUb1
 Lf1mi8iPXCBOHmyPhVHN4c/XFIymx08=; b=IpBWL1vQ38MdMKyAxRrulOobVdt1
 nmPiXJk3UYt8mSolimHTpWKMKL0npjTeyj8zk9vzxEnCXUYnzZSJZ7R6AIPigWOR
 DtygCVLtMaYpnZfvV5CWuRgxeImsealE4uZk01MqkD7h0y/ap+DG7TfEPX1KCxS7
 KKE6bw89Mg0pofVToLWP1FRnB5Ppp3az4S66Pj2wwG4OuSR6ZzHAEEQWsAi87UZ9
 YWGqG1lxnW4wsO3BqkhXG9zFDf2m8qhuz5vakehoQZjziBusmMpe0qNF/cI7MNBt
 eBmizFAJmQZW9VcXnw/Hp9oYnr315Kd7rwPcuQaeNGLyOdkqMo3vFPRsBg==
Subject: Re: [virtio-dev] Re: [PATCH v5 0/9] ALSA: add virtio sound driver
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20210222153444.348390-1-anton.yakovlev@opensynergy.com>
 <20210223070839-mutt-send-email-mst@kernel.org>
From: Anton Yakovlev <anton.yakovlev@opensynergy.com>
Message-ID: <bce13fa2-3ee5-0c6c-5761-17f0389c2d7b@opensynergy.com>
Date: Tue, 23 Feb 2021 13:33:57 +0100
MIME-Version: 1.0
In-Reply-To: <20210223070839-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SR-MAIL-02.open-synergy.com (10.26.10.22) To
 SR-MAIL-02.open-synergy.com (10.26.10.22)
Cc: virtio-dev@lists.oasis-open.org, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>, virtualization@lists.linux-foundation.org
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

On 23.02.2021 13:09, Michael S. Tsirkin wrote:
> On Mon, Feb 22, 2021 at 04:34:35PM +0100, Anton Yakovlev wrote:
>> This series implements a driver part of the virtio sound device
>> specification v8 [1].
>>
>> The driver supports PCM playback and capture substreams, jack and
>> channel map controls. A message-based transport is used to write/read
>> PCM frames to/from a device.
>>
>> As a device part was used OpenSynergy proprietary implementation.
>>
>> v5 changes:
>>   - Fixed another bunch of sparse warnings
>>     (replaced virtio_cread() -> virtio_cread_le()), no functional changes.
>> (Sorry, I didn't know how to run sparse locally, now everything should be fixed)
>>
>> [1] https://lists.oasis-open.org/archives/virtio-dev/202003/msg00185.html
> 
> 
> In the future please number patches from 1, not from 2.
> thanks!

But they are numbered automatically by git. Patch #1 is for virtio_ids.h


>>
>> Anton Yakovlev (9):
>>    uapi: virtio_ids: add a sound device type ID from OASIS spec
>>    ALSA: virtio: add virtio sound driver
>>    ALSA: virtio: handling control messages
>>    ALSA: virtio: build PCM devices and substream hardware descriptors
>>    ALSA: virtio: handling control and I/O messages for the PCM device
>>    ALSA: virtio: PCM substream operators
>>    ALSA: virtio: introduce jack support
>>    ALSA: virtio: introduce PCM channel map support
>>    ALSA: virtio: introduce device suspend/resume support
>>
>>   MAINTAINERS                     |   9 +
>>   include/uapi/linux/virtio_ids.h |   1 +
>>   include/uapi/linux/virtio_snd.h | 334 +++++++++++++++++++++
>>   sound/Kconfig                   |   2 +
>>   sound/Makefile                  |   3 +-
>>   sound/virtio/Kconfig            |  10 +
>>   sound/virtio/Makefile           |  13 +
>>   sound/virtio/virtio_card.c      | 462 +++++++++++++++++++++++++++++
>>   sound/virtio/virtio_card.h      | 113 ++++++++
>>   sound/virtio/virtio_chmap.c     | 219 ++++++++++++++
>>   sound/virtio/virtio_ctl_msg.c   | 310 ++++++++++++++++++++
>>   sound/virtio/virtio_ctl_msg.h   |  78 +++++
>>   sound/virtio/virtio_jack.c      | 233 +++++++++++++++
>>   sound/virtio/virtio_pcm.c       | 498 ++++++++++++++++++++++++++++++++
>>   sound/virtio/virtio_pcm.h       | 120 ++++++++
>>   sound/virtio/virtio_pcm_msg.c   | 392 +++++++++++++++++++++++++
>>   sound/virtio/virtio_pcm_ops.c   | 491 +++++++++++++++++++++++++++++++
>>   17 files changed, 3287 insertions(+), 1 deletion(-)
>>   create mode 100644 include/uapi/linux/virtio_snd.h
>>   create mode 100644 sound/virtio/Kconfig
>>   create mode 100644 sound/virtio/Makefile
>>   create mode 100644 sound/virtio/virtio_card.c
>>   create mode 100644 sound/virtio/virtio_card.h
>>   create mode 100644 sound/virtio/virtio_chmap.c
>>   create mode 100644 sound/virtio/virtio_ctl_msg.c
>>   create mode 100644 sound/virtio/virtio_ctl_msg.h
>>   create mode 100644 sound/virtio/virtio_jack.c
>>   create mode 100644 sound/virtio/virtio_pcm.c
>>   create mode 100644 sound/virtio/virtio_pcm.h
>>   create mode 100644 sound/virtio/virtio_pcm_msg.c
>>   create mode 100644 sound/virtio/virtio_pcm_ops.c
>>
>> --
>> 2.30.0
>>
> 
> 
> ---------------------------------------------------------------------
> To unsubscribe, e-mail: virtio-dev-unsubscribe@lists.oasis-open.org
> For additional commands, e-mail: virtio-dev-help@lists.oasis-open.org
> 
> 

-- 
Anton Yakovlev
Senior Software Engineer

OpenSynergy GmbH
Rotherstr. 20, 10245 Berlin

