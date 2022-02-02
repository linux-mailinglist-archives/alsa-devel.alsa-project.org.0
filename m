Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 47A284A69BC
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Feb 2022 02:57:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C75A71768;
	Wed,  2 Feb 2022 02:56:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C75A71768
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643767046;
	bh=JNto6+8mI18yy7Gp2i8iRzfYRcym2BZWS97hZ0umqfo=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tZhF9h1YDfNeUb2AtnhDqBJ/nd/tm8yj4T7FTnLBZshclzvze5T8qrvkp9XSlk19s
	 gDMvJNqK4XTooCTR6FCvUgmwVXOvkhcjk4ueknwSYi8H7dIlgmF4Ve5Pa+9kDlW0HP
	 qqFDhd5FI5I2/LI+uKKc0/ET/lPafZrWmocn3cMM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 44D50F80089;
	Wed,  2 Feb 2022 02:56:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E52D5F80089; Wed,  2 Feb 2022 02:56:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_NONE autolearn=disabled version=3.4.0
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7FFEDF800F8
 for <alsa-devel@alsa-project.org>; Wed,  2 Feb 2022 02:56:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7FFEDF800F8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="HecS86XN"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="l8QRbBDf"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id CF4625C00A7;
 Tue,  1 Feb 2022 20:56:06 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Tue, 01 Feb 2022 20:56:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; bh=DsQtLq2EQRqTEvy0xI2Efzh+JUoKhM
 R5/1vRFeowxOs=; b=HecS86XNNNnzZW/3DvyGi+JxWGJpbokV/A+GSxwhIvkECy
 AAyurHjUxj108Ud8+qlMOtXCSxbwslkmS/pZYcmr+9EAF4pBxd8NIowzADzb4UTv
 LMPL8Tatt+z1M24zXnx5drNMvPeZAIzxCN28UTsv9Cr5j86oUmTj2/H7cCNXerJ4
 EsahmID8VXkLUQWbSjWrZ2l+osgnWk37TYhy7mE3ii2y5apjlP2SftQ2li3x4A0L
 n9kDxJh157TzLrWNgE129nTnNT+boh2V0r4WbdLwgDuVnsnltSwtBliK8EKseKFs
 i4Jq4Bf9qxNGZCKU6nUqF9rdd5ssZrQLufT2zAug==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=DsQtLq2EQRqTEvy0x
 I2Efzh+JUoKhMR5/1vRFeowxOs=; b=l8QRbBDfm/Th82lUPTxAZsDQXgyYLR1H7
 qhdBvS5biGYSrKHCH+DMD5Zczd6WQncr3YhuiA/4s1Pz+PSl9EGEyI1PsDeGQVKE
 2r4hrSaxg+59h/A7SrdTKU3pJlazFbALCb9je9E3LSPrBIvUm/Xs8u2x46lb10uD
 N+vDok1yOHmFJZwZs8vAY4qUFibq3dLsEtPE/UG3TkuYj8uH2FDeHJlTFbMLrnhy
 OE2/R+J7mvEXOLJORU5LGNY6uLqiagSPl2LQlV9Z+GE0GuLlt3m/f+k1hk67+/XY
 lpyPUTNztHuitryfZ4kqrFUDfm2F2RHqbZY2qORj7SEnHs1JTic+A==
X-ME-Sender: <xms:teT5YUPVgDdw6oSCnnJr_TaIZBUgI2inbvTVPiVkTmDheQNhv55ZuA>
 <xme:teT5Ya8bL13i2e8tQNPRdW1ITkCCwqLChBWigWyiynQ8_qlzr9PZMDM6GBIaiUAfE
 gjlwELSrB5A583xk1I>
X-ME-Received: <xmr:teT5YbRboj46cFh16QSrnxZ3DfCT2wReRavLVFeiFBGtAS28VZeuajzs1vzLmDZ2dAXPKU906DlU5QRZV74-4aXo8yDL_gdZgQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrgeeggdefiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepvfgrkhgrshhh
 ihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
 eqnecuggftrfgrthhtvghrnhephffhgeetveeiudffgfegvedtheeuudevtdevvddtjeeh
 leevvdfhtefhveekteehnecuffhomhgrihhnpegvlhgvmhdrihgunecuvehluhhsthgvrh
 fuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgr
 khgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:tuT5YcsvWHBQ-1zcjCCt52cAVgKUta0szkuIupeR-zFzgQXc1cJEeg>
 <xmx:tuT5Ycd_5GWWpkfRaceMPuf0JOLL4UdqhWGXQIXl7V2EPsGOOk98Zg>
 <xmx:tuT5YQ3OcYuNjubTsQH-Hhy7b4mmQMAOKjEuLI7jqNMXJ4Y1pR4m4A>
 <xmx:tuT5Yb48-C7vrs7iVdcJsVRLT7Tticfoct1y5CLQWj_6FjafOF2k9w>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 1 Feb 2022 20:56:03 -0500 (EST)
Date: Wed, 2 Feb 2022 10:56:01 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] kselftest: alsa: Check for event generation when we
 write to controls
Message-ID: <YfnksdOR5HR0mZi0@workstation>
Mail-Followup-To: Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Shuah Khan <shuah@kernel.org>, alsa-devel@alsa-project.org,
 linux-kselftest@vger.kernel.org
References: <20220201151551.21497-1-broonie@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220201151551.21497-1-broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, Shuah Khan <shuah@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, linux-kselftest@vger.kernel.org
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

Hi Mark,

On Tue, Feb 01, 2022 at 03:15:51PM +0000, Mark Brown wrote:
> Add some coverage of event generation to mixer-test. Rather than doing a
> separate set of writes designed to trigger events we add a step to the
> existing write_and_verify() which checks to see if the value we read back
> from non-volatile controls matches the value before writing and that an
> event is or isn't generated as appropriate. The "tests" for events then
> simply check that no spurious or missing events were detected. This avoids
> needing further logic to generate appropriate values for each control type
> and maximises coverage.
> 
> When checking for events we use a timeout of 0. This relies on the kernel
> generating any event prior to returning to userspace when setting a control.
> That is currently the case and it is difficult to see it changing, if it
> does the test will need to be updated. Using a delay of 0 means that we
> don't slow things down unduly when checking for no event or when events
> fail to be generated.
> 
> We don't check behaviour for volatile controls since we can't tell what
> the behaviour is supposed to be for any given control.
> 
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
>  tools/testing/selftests/alsa/mixer-test.c | 148 +++++++++++++++++++++-
>  1 file changed, 145 insertions(+), 3 deletions(-)
 
I'm still under reviewing your patch, while I have a slight concern
about the evaluation of 'struct snd_ctl_event.data.elem.id.numid'.

> diff --git a/tools/testing/selftests/alsa/mixer-test.c b/tools/testing/selftests/alsa/mixer-test.c
> index 0e88f4f3d802..42cf3b724586 100644
> --- a/tools/testing/selftests/alsa/mixer-test.c
> +++ b/tools/testing/selftests/alsa/mixer-test.c
> ...
> +/*
> + * Block for up to timeout ms for an event, returns a negative value
> + * on error, 0 for no event and 1 for an event.
> + */
> +int wait_for_event(struct ctl_data *ctl, int timeout)
> +{
> ...
> +		/* The ID returned from the event is 1 less than numid */
> +		mask = snd_ctl_event_elem_get_mask(event);
> +		ev_id = snd_ctl_event_elem_get_numid(event);
> +		if (ev_id != ctl->elem + 1) {
> +			ksft_print_msg("Event for unexpected ctl %s\n",
> +				       snd_ctl_event_elem_get_name(event));
> +			continue;
> +		}
> +	} while ((mask & SND_CTL_EVENT_MASK_VALUE) != SND_CTL_EVENT_MASK_VALUE);
> +
> +	return 1;
> +}

As long as I know, the design of ALSA control core just exposes the
numeric identification of a control element issued for notification in
'snd_ctl_event' structure. On the other hand, the above evaluation
expects decremented value against position of queried list structure
has come.

I note that current design of ALSA control core is:
 * 1 is selected for numeric identification of the first element in the
   first element set added to sound card.
 * at removal of element set, the series of assigned numeric identification
   becomes blank (coded as hole).
 * Userspace application can always add/remove element set to the card.
 * the position of element in queried list structure does not
   necessarily corresponds to numeric identification even if decremented
   by 1 due to the hole.

Of cource, I can see the decremented-by-1 comparison covers the most cases
in which developer requires the test (excluding the case of user-defined
control element set), while we can use numid value got from 'id' field of
'ctl_data' structure for the comparison. I think the alternative way has
fewer problems than the decremented-by-1 comparison based on the rough
assumption against the design.


Regards

Takashi Sakamoto
