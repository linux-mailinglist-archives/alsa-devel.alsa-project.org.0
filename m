Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 10948662650
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Jan 2023 13:58:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3FCE19AC8;
	Mon,  9 Jan 2023 13:57:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3FCE19AC8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673269112;
	bh=Vw/UPNXuXSLcDb1ItcfGnpUzVrPsF8gkw9yQXbQxIwo=;
	h=In-Reply-To:References:Date:From:To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TPcwX+1HDNGq+XuNhmXzgqrGT88Z4xz//3Ae9Nr936THaSA0iReXSuAODiyYz0iKk
	 Qg4LB55HxuU6cAKXJgOkMRuxpQArGQc42dtj2SD6Jp0DpPEq1RIt6TfpxHfBWEfBZn
	 0VFI+6EuQ3jLk2qAwvi6pLBnCtBFs554sJlHSm5E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C6407F803DC;
	Mon,  9 Jan 2023 13:57:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 80D33F803DC; Mon,  9 Jan 2023 13:57:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
 SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9CC93F80245
 for <alsa-devel@alsa-project.org>; Mon,  9 Jan 2023 13:57:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9CC93F80245
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key, unprotected) header.d=sakamocchi.jp
 header.i=@sakamocchi.jp header.a=rsa-sha256 header.s=fm3 header.b=dO9jRcZD; 
 dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=nfK5WLh+
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 80AB732007D7
 for <alsa-devel@alsa-project.org>; Mon,  9 Jan 2023 07:57:24 -0500 (EST)
Received: from imap44 ([10.202.2.94])
 by compute5.internal (MEProxy); Mon, 09 Jan 2023 07:57:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm3; t=1673269044; x=1673355444; bh=CaXbIdx7Vw
 jcU9DeguhOMgrM/Z5qhxxsoCihTU58xJo=; b=dO9jRcZDK654x5jBZHeaBMC/E0
 T2ruC/Y2GR/LXOLUCNdSwACUWIl+Zix0huK0XsxffdSDPYz537oSjOpj3TDT4g5b
 ditN2hH5Jd35iAtrOyTzwolcy1oafQz9Zn0e2fUbZjaSzwt3U3KXNOA7w3Otuwg+
 NUOouXqA/FjPZ9j0l9mD7BtNEcGEx1J3UXjbgcZFKuH2EpHz5wYTXnS0RvCjmRtk
 VaaR37IhtMHr5N2Qojd3F+RtFXHFSxV/GHqOugOZ4fxOg+SpzBqN65zoxljxRmbE
 Q+N9fA/vkdm8eMYS2k7aFANyv6q7ZcsVb7L/j01lyX2PjT5PpNQOkeCCLmaw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; t=1673269044; x=1673355444; bh=CaXbIdx7VwjcU9DeguhOMgrM/Z5q
 hxxsoCihTU58xJo=; b=nfK5WLh+mNra5v0e4pbgwNpGH/trOdMsU/SZNQ4jueMp
 FR3SWxveKf90UmygzQl5mtCkqgwdmW06/oFiA907sB+YQFJhbxffwn7KilHaWKQe
 /TuHYm8xSg4SDFnDemSL4ctRiGBjqwUhBPuCDnsBAeHoDj51WWKmXZaEoA/I+NDX
 uogyYIc/nIRufZicM68+P6eeS0INvu81wj9EzH2CxVeTSLaB+LOxuByuV0GlpFO9
 wkYT0RJnj1G4PXZvADZ1U4atP2AU5Y4i4r1XcEnPa8qLpgsODKFprvDIFJUV45Ln
 RYJGpJtDbspfYls/OACvnFiBfmtRjwiOQFS3BdREZQ==
X-ME-Sender: <xms:Mw-8Y4d-4vWCzbYjJ-zOoC2rddBqPqBmFRGGJNhkdEaNVzR3NMnAMA>
 <xme:Mw-8Y6NFhy23VcHER0L5QoAFiiDtOq1sUMDlRuq66LX4ZJa5Qw6skMf14BrLbh3Oq
 xRgUE4bZH2w5sS05v8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrkeeigdegvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhepofgfggfkjghffffhvffutgesthdtre
 dtreertdenucfhrhhomhepfdfvrghkrghshhhiucfurghkrghmohhtohdfuceoohdqthgr
 khgrshhhihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepkeekgf
 dtiefggfehfeeludevfedvveegheffteejgffhjeehffduudeiveevvdeinecuvehluhhs
 thgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhih
 esshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:NA-8Y5hwzW5xGhx5CDFIUr26_xkdSXewSbqoufDkQ1cZYG7bU-6yGQ>
 <xmx:NA-8Y9_spKFMGzT_2a3obUNUK0bye6esSAmDeN6JOgDIDETobmqtHQ>
 <xmx:NA-8Y0v54PsH4AhPHXUXEDkyggtEuuZ60aN4gyEXOibEn639ZayjQQ>
 <xmx:NA-8Yy6Tmw2hWlWkMmutEhxWUyQ4I0OrGrzccOejZvOv9-IZZCHb4A>
Feedback-ID: ie8e14432:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id EDBC136A0075; Mon,  9 Jan 2023 07:57:23 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-1185-g841157300a-fm-20221208.002-g84115730
Mime-Version: 1.0
Message-Id: <634ad52a-4730-4ba2-b996-07494456bbc6@app.fastmail.com>
In-Reply-To: <202301091945513559977@zte.com.cn>
References: <202301091945513559977@zte.com.cn>
Date: Mon, 09 Jan 2023 21:56:52 +0900
From: "Takashi Sakamoto" <o-takashi@sakamocchi.jp>
To: alsa-devel@alsa-project.org
Subject: Re: [PATCH linux-next] ALSA: control-led: use strscpy() to instead of
 strncpy()
Content-Type: text/plain
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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

On Mon, Jan 9, 2023, at 20:45, yang.yang29@zte.com.cn wrote:
> From: Xu Panda <xu.panda@zte.com.cn>
>
> The implementation of strscpy() is more robust and safer.
> That's now the recommended way to copy NUL-terminated strings.
>
> Signed-off-by: Xu Panda <xu.panda@zte.com.cn>
> Signed-off-by: Yang Yang <yang.yang29@zte.com.cn>
> ---
>  sound/core/control_led.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/sound/core/control_led.c b/sound/core/control_led.c
> index f975cc85772b..c88653c205eb 100644
> --- a/sound/core/control_led.c
> +++ b/sound/core/control_led.c
> @@ -534,8 +534,7 @@ static ssize_t set_led_id(struct snd_ctl_led_card 
> *led_card, const char *buf, si
>  	struct snd_ctl_elem_id id;
>  	int err;
>
> -	strncpy(buf2, buf, len);
> -	buf2[len] = '\0';
> +	strncpy(buf2, buf, len + 1);

The patch comment refers to strscpy(), however strncpy() is still used. I wonder
whether it is the intension of this patch. I think any trouble happended.

Anyway I'm for usage of strscpy() as the comment.

>  	memset(&id, 0, sizeof(id));
>  	id.iface = SNDRV_CTL_ELEM_IFACE_MIXER;
>  	s = buf2;
> -- 
> 2.15.2

As another issue, I can see that the local variable, len, can bring buffer overrun
over buf2[256] since it has maximum value between the size of pointer and count
argument. Maricious user space application can attack as long as it has write
permission to the device attributes. I guess kernel stack can be broken by the
attack.

```
532    char buf2[256], *s, *os;
533    size_t len = max(sizeof(s) - 1, count);
...
537    strncpy(buf2, buf, len);
```

I'm already in bed today, so I hope anyone posts fix, or waiting tomorrow.


Regards

Takashi Sakamoto
