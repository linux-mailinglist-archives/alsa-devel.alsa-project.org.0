Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B12A4A2B98
	for <lists+alsa-devel@lfdr.de>; Sat, 29 Jan 2022 05:28:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 90AD516F4;
	Sat, 29 Jan 2022 05:27:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 90AD516F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643430522;
	bh=sG16Oj2vxevBR5V+y3+hWLHOd4SsW9mGQkhejf7g0Ig=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Az+h0L413kEd2JcnYAmFgGshPRc9s6ia/wXGhI1T/FTa1pR2S4f9WW4eNc1c1COG3
	 U2/Y+KGMMfRjVDqvxr8V+VyrJEGctT3kB/8g1xYl4fXILervXvWTjliu5rn803k3tE
	 q/2Q7qnq0zP4SURPbK9t7f3GrkqQCoZ4mwiPYkYU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 03220F80212;
	Sat, 29 Jan 2022 05:27:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A8AD7F801F7; Sat, 29 Jan 2022 05:27:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 27805F800E3
 for <alsa-devel@alsa-project.org>; Sat, 29 Jan 2022 05:27:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 27805F800E3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="PA+uL37p"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="QO7JCV5s"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 997495C00DF;
 Fri, 28 Jan 2022 23:27:26 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Fri, 28 Jan 2022 23:27:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=cc:cc:content-transfer-encoding:content-type:date:date:from
 :from:in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; bh=4EYpX6GgDxVk/J
 zF/507Fr3GOZ5PLzUrF7DErfZTS8U=; b=PA+uL37phMlieANMrf2goIrCtkHAHy
 J7dqIDyLo7bZbDQQCcr2J/Mu7kGidq4f0RUTONIuN+SY/mQva55dVei4BMpUsJWy
 vliTmgocVvMQpXYW+mSlhMAhj+2Bky2sHguAFUMrJvCslfzw7Fg2f1mFiJYHoeWn
 QjwAQD0K6OvAf/s7Zc0JC0cXn57/S+zjPdALcIhuiRm4NwDyjeprlkoByBr8Aeik
 QnlqEYl4zbij1Txn/j6zasOJG7Co4JELTrdbZJIw3OIqhUoLawdEwAC9q4XCCZn9
 sXQAQ/26co0WDlQAmJsrysdzwxJwCOijQhIMroBRm3dn1jGD+xXgpT0Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=4EYpX6GgDxVk/JzF/507Fr3GOZ5PLzUrF7DErfZTS
 8U=; b=QO7JCV5s0mTuTAp7DGNJsd/smMWHjn/YCrpi/HcWIhNdT8TSl0Z2cKfN/
 2gKKP9IneoxxOviGLcoRvj+fFzXO9IG2I+pptKxUlOqtDqawpvwwOm68XSQMwTg4
 IxzX32nd/raVDd7DNv0nm62ja0zfatZLmBVv1sqwtzPDu9hnYvcnLNb2ckHwM5/1
 CL2yUBth2QBvidHaEj6iP+QlSWp091lWT5MtrerdYmNVFRitHLhkjK+kQew8ceaU
 VBgKZla1HxSj1OpWM/iWhQTSdwj3AUgFAelUQ1VhpQ9L3aNf5cmoyB1h1QXDwT7c
 SgE89ojUTYzfpgVuH87JD/6dQdxkg==
X-ME-Sender: <xms:LsL0Yf4zeKP-ngJA-w9qgeTI4uclT6LHUiXfKW5Tu4S4vtyOfCY_PA>
 <xme:LsL0YU5zAhOKY39uoLQ8NDpNHPDKBBWkRZ5KLLdLe9Q_QyQusdNrNiVFilJybnhz9
 oZf_03UqTTtUHcjPRA>
X-ME-Received: <xmr:LsL0YWeE6zLU_iJBaFkbWbGHC84jaLTWuvEt8Bm_lcgKiid2jNA0jXapHxSzEjFOGfMrf67ZpsBzQVrS0CQrzoAZQ7Z3uY-Hwg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrfeeigdejudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhepfffhvffukfhfgggtugfgjgesthekro
 dttddtudenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepgfdukeehke
 ffieeuteegteeffefgjeefffejjeevgeegtdegtedvhedtkeeiuedtnecuvehluhhsthgv
 rhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihessh
 grkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:LsL0YQJWE-1nZ0mLx1wblFT8M_zSNuS2eeDfqBZTwmZMVR8W6RguIw>
 <xmx:LsL0YTIvnZKhXI01z78Zp-ug8qYSgdo7V8IA285EoWRZebBkg3mBpA>
 <xmx:LsL0YZygUgTzPOkH9iWDWSdkXXYRn2Ocwn7uGR1_mtTqNYpmlXLtyg>
 <xmx:LsL0YQF3MnGXevZ_tQLpsec1iAT7mpEHwI9EtkzWcOEG5J1m_C9oyA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 28 Jan 2022 23:27:24 -0500 (EST)
Date: Sat, 29 Jan 2022 13:27:22 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Jia-Ju Bai <baijiaju1990@gmail.com>
Subject: Re: [BUG] ALSA: core: possible deadlock involving waiting and
 locking operations
Message-ID: <YfTCKrjpaeKWFglO@workstation>
Mail-Followup-To: Jia-Ju Bai <baijiaju1990@gmail.com>, perex@perex.cz,
 tiwai@suse.com, broonie@kernel.org, alsa-devel@alsa-project.org,
 linux-kernel <linux-kernel@vger.kernel.org>
References: <56766037-972e-9e5b-74c1-88633a72a77f@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <56766037-972e-9e5b-74c1-88633a72a77f@gmail.com>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, alsa-devel@alsa-project.org,
 broonie@kernel.org, tiwai@suse.com
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

Hi,

On Sat, Jan 29, 2022 at 11:33:26AM +0800, Jia-Ju Bai wrote:
> Hello,
> 
> My static analysis tool reports a possible deadlock in the sound driver
> in Linux 5.10:
> 
> snd_card_disconnect_sync()
> � spin_lock_irq(&card->files_lock); --> Line 461 (Lock A)
> � wait_event_lock_irq(card->remove_sleep, ...); --> Line 462 (Wait X)
> � spin_unlock_irq(&card->files_lock); --> Line 465 (Unlock A)
> 
> snd_hwdep_release()
> � mutex_lock(&hw->open_mutex); --> Line 152 (Lock B)
> � mutex_unlock(&hw->open_mutex); --> Line 157 (Unlock B)
> � snd_card_file_remove()
> ��� wake_up_all(&card->remove_sleep); --> Line 976 (Wake X)
> 
> snd_hwdep_open()
> � mutex_lock(&hw->open_mutex); --> Line 95 (Lock B)
> � snd_card_file_add()
> ��� spin_lock(&card->files_lock); --> Line 932 (Lock A)
> ��� spin_unlock(&card->files_lock); --> Line 940 (Unlock A)
> � mutex_unlock(&hw->open_mutex); --> Line 139 (Unlock B)
> 
> When snd_card_disconnect_sync() is executed, "Wait X" is performed by
> holding "Lock A". If snd_hwdep_open() is executed at this time, it holds
> "Lock B" and then waits for acquiring "Lock A". If snd_hwdep_release()
> is executed at this time, it waits for acquiring "Lock B", and thus
> "Wake X" cannot be performed to wake up "Wait X" in
> snd_card_disconnect_sync(), causing a possible deadlock.
> 
> I am not quite sure whether this possible problem is real and how to fix
> it if it is real.
> Any feedback would be appreciated, thanks :)

I'm interested in your report about the deadlock, and seek the cause
of issue. Then I realized that we should take care of the replacement of
file_operation before acquiring spinlock in snd_card_disconnect_sync().

```
snd_card_disconnect_sync()
->snd_card_disconnect()
  ->spin_lock()
  ->list_for_each_entry()
    mfile->file->f_op = snd_shutdown_f_ops
  ->spin_unlock()
->spin_lock_irq()
->wait_event_lock_irq()
->spin_unlock_irq()
```

The implementation of snd_shutdown_f_ops has no value for .open, therefore
snd_hwdep_open() is not called anymore when waiting the event. The mutex
(Lock B) is not acquired in process context of ALSA hwdep application.

The original .release function can be called by snd_disconnect_release()
via replaced snd_shutdown_f_ops. In the case, as you can see, the spinlock
(Lock A) is not acquired.

I think there are no race conditions against Lock A and B in process
context of ALSA hwdep application after card disconnection. But it would
be probable to overlook the other case. I would be glad to receive your
check for the above procedure.


Thanks

Takashi Sakamoto
