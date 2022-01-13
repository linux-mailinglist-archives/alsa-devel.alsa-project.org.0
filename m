Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6132C48DA79
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jan 2022 16:09:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F261A1FA5;
	Thu, 13 Jan 2022 16:08:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F261A1FA5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642086581;
	bh=l1B0GvwfXI9a0jdL4HCkxoa2q86vSZZx40ZJNr+iVug=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Bzs/eEEfE9X0YRdqHWwOZ/bUBjuh7KUnTKj5Fp1fOzSxrlmR90Et8BinjJjz2Lfa9
	 4X6TxhTGi59pXbmK3EHZR/kGarRvarFv9QjXC2EGC19Z7uxU8QPLm9OnPYs9OVGw/l
	 cqaK+lBEu8PqeqQw1l3tOY4T64NUk1f/NfWkhdMQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 61E5DF80141;
	Thu, 13 Jan 2022 16:08:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BAD33F8013F; Thu, 13 Jan 2022 16:08:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, NICE_REPLY_A, PRX_BODYSUB_1, SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B0F26F80088
 for <alsa-devel@alsa-project.org>; Thu, 13 Jan 2022 16:08:21 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 4F3D8A0047;
 Thu, 13 Jan 2022 16:08:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 4F3D8A0047
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1642086500; bh=+QnHbpq8pLJP5aQ6nxhltcNh+Xojdhr4JGsBTtuUC+w=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=ab3cOdLBbZFul/VOic0BXXVzDiUWYmTq1h+7GqSLrBpon0GBQAexmUvNNrXN/ngEg
 d2TxEwTn8t15/lhaVflNqDDUQczrUTQDfpIVc04jD7SRUWfauKvosFHry7SsKsoI3e
 FsQFAA8C8UKIsEdaYU741A3vsko6XGVgf2ODMZVM=
Received: from [192.168.100.98] (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Thu, 13 Jan 2022 16:08:17 +0100 (CET)
Message-ID: <1794d3b3-9838-ae90-bb54-79e2b4d14197@perex.cz>
Date: Thu, 13 Jan 2022 16:08:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] ALSA: pcm: accept the OPEN state for snd_pcm_stop()
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>
References: <20220113113130.1961332-1-perex@perex.cz>
 <s5hmtjz7q16.wl-tiwai@suse.de>
 <40388d17-0c5e-5d10-2f8a-ba75e2b7b9c7@perex.cz>
 <s5hk0f37nrq.wl-tiwai@suse.de>
From: Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <s5hk0f37nrq.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Pavel Hofman <pavel.hofman@ivitera.com>,
 ALSA development <alsa-devel@alsa-project.org>
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

On 13. 01. 22 14:45, Takashi Iwai wrote:

>> Also ideally, there may be a check in hw_params, if parameters
>> (buffers) are changed, but the implementation is not so easy. Maybe we
>> can allow OPEN ->
>> PREPARE transition for this case, so the applications may just restart
>> the streaming in the most light way.
> 
> Hmm.  Reading more about those restrictions and requirements, I feel
> that this might be better implemented in the gadget driver side
> locally at first.  Basically we can handle similarly: add a new local
> flag, set it at the stream stop, and return an error at prepare until
> hw_params gets reconfigured.  This might be even smaller changes?

Pavel reported that stop to SETUP is not enough for sox, but it's true that 
the driver may fail in the prepare() callback until the standard stream 
operation is not recovered. I think that sox is trying to recover and it 
succeeds - then the I/O timeout occurs.

Ref: 
https://lore.kernel.org/alsa-devel/9635d70f-dc12-f9ed-29f5-ce34a1d4b112@ivitera.com/

The gadget driver (drivers/usb/gadget/function/u_audio.c) has empty prepare 
callback at the moment.

Pavel, could you try to add the no-stream flag management to the gadget driver 
and return an error in the prepare callback in this case?

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
