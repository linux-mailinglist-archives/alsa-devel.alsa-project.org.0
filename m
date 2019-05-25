Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AA582A304
	for <lists+alsa-devel@lfdr.de>; Sat, 25 May 2019 07:47:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8B4F11742;
	Sat, 25 May 2019 07:47:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8B4F11742
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558763275;
	bh=E2WRUcO5HiwpJQsKvTwnA8zMKf5zvvP8G37bOlWCUlg=;
	h=In-Reply-To:References:Date:From:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qtmW6bPFUzU92pfC2EaudJTtpRdcI6azK00phn4dxVdEh7Ck9VhYFenhKK6sjahRW
	 Wq1JVRWB0noQUGUJlsSGs6kKP5j3VAPIADVqjPRkjJkLEHfNam4StJ8hUf/vVk10AM
	 uOlFHdEv0hK/qUD5tVajHx9gmADP3zvoJX2JiSSU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9825CF89670;
	Sat, 25 May 2019 07:46:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 836D3F89674; Sat, 25 May 2019 07:46:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0AC46F80C0F
 for <alsa-devel@alsa-project.org>; Sat, 25 May 2019 07:46:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0AC46F80C0F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="FYaYk+QU"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="UluMDSWF"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 8ADA021C47;
 Sat, 25 May 2019 01:45:58 -0400 (EDT)
Received: from imap5 ([10.202.2.55])
 by compute1.internal (MEProxy); Sat, 25 May 2019 01:45:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=mime-version:message-id:in-reply-to:references:date:from:to
 :cc:subject:content-type; s=fm1; bh=ecZFFYkyGooDDU4UAYrqow9TRzdY
 x/qSE7cRT3BSbyg=; b=FYaYk+QUzqpbiWPmPQlTsOzdVe+BkJJmnRzB6YBtvA5W
 VGcAughE1Wrqj6G+22Mh51eroOvtuGyLSIQqfqgt+KGTErAdT3Hr7SzTwol+aV60
 E4EELKY5l7U3r3oPdbKFxc41q+W29VG7qhXT+6TLXPnTKe+8MlGLOCQBO0/n6A1W
 XZxKBvn0anXOaYzIVdXw2301YItG0So2Yoj8cWrpctdbfOWAYXogMl9LbOk2EdeV
 FYHOgpnwv8ItqbVmUB0L5hiIvd6xXYUudoUdy39g/kWI6zrTAHlx6s7C1F+k7wr8
 4VEL/54uGFMICd0dHgFIxfiMGsegTW1c6dHDv3Mj/w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=ecZFFY
 kyGooDDU4UAYrqow9TRzdYx/qSE7cRT3BSbyg=; b=UluMDSWFlRDvhnaqomfrK/
 BqLOn6spA8HYzQahijYaE8eJFaJqixhMCku9N+w7kaVpGOPeESpo6V3/+Mis+DCL
 ZxsWETXXR0FglxYiIc8iINsLHeFSmgSTgjtNDbx4D445OoI5gDCiiRUNTjpCrLQ8
 dsByVE9HxZppdjjsuE3bhuHNNX9zcF2Ww/8PxKSn59U0uQPBIjJptfbzZ1S2k8LS
 HnInghtcMlUICegs8PGxHjaEHUofIinB5zmItZkkljxIq0ex4+Pv1ZpVImSVwCuz
 Pn1S8i4WrALFbIdPb35JKrau74z68Ynpatl4H/+f0zKVRpSFv9K2xC/OXCsasfAQ
 ==
X-ME-Sender: <xms:ldboXEUydlS3Lw-uhm2A1fAgLV3d64gPlgkDGO2hNotzdH-jE7Fd1g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddruddujedgleelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreerjeenucfhrhhomhepfdfvrghk
 rghshhhiucfurghkrghmohhtohdfuceoohdqthgrkhgrshhhihesshgrkhgrmhhotggthh
 hirdhjpheqnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfrrghrrghmpehmrghi
 lhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjphenucevlhhush
 htvghrufhiiigvpedt
X-ME-Proxy: <xmx:ldboXOkErS0AMw_t33rZoC--JEZSRAdiNT5MfY7q9lLlCNV0IBZZAg>
 <xmx:ldboXGBjKa4mr4UNbv2LiEXyxyOwWQolDkWshQAuxppHGDr4AqP6gg>
 <xmx:ldboXOfYQVvASZZS_nCHLqWv1diztlKxsAaFSGJJIRepsxBHN6LhQQ>
 <xmx:ltboXDavRseUQwZbvgjgEYS3HBkhK6trOfHK9Zc1iEQPBPrqDQbDiQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 8EE445C0095; Sat, 25 May 2019 01:45:57 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.6-553-gc304556-fmstable-20190524v1
Mime-Version: 1.0
Message-Id: <9fe864d1-db6c-4b72-bfa3-3a1c638f1fae@www.fastmail.com>
In-Reply-To: <20190524213351.24594-1-colin.king@canonical.com>
References: <20190524213351.24594-1-colin.king@canonical.com>
Date: Sat, 25 May 2019 14:45:57 +0900
From: "Takashi Sakamoto" <o-takashi@sakamocchi.jp>
To: "Colin King" <colin.king@canonical.com>,
 "Clemens Ladisch" <clemens@ladisch.de>, "Jaroslav Kysela" <perex@perex.cz>,
 "Takashi Iwai" <tiwai@suse.com>, alsa-devel@alsa-project.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [alsa-devel]
 =?utf-8?q?=5BPATCH=5D=5Bnext=5D_ALSA=3A_firewire-lib?=
 =?utf-8?q?=3A_remove_redundant=09assignment_to_cip=5Fheader?=
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi Colin,

On Sat, May 25, 2019, at 06:35, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The assignement to cip_header is redundant as the value never
> read and it is being re-assigned in the if and else paths of
> the following if statement. Clean up the code by removing it.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  sound/firewire/amdtp-stream.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/sound/firewire/amdtp-stream.c 
> b/sound/firewire/amdtp-stream.c
> index 2d9c764061d1..4236955bbf57 100644
> --- a/sound/firewire/amdtp-stream.c
> +++ b/sound/firewire/amdtp-stream.c
> @@ -675,7 +675,6 @@ static int handle_in_packet(struct amdtp_stream *s, 
> unsigned int cycle,
>  		return -EIO;
>  	}
>  
> -	cip_header = ctx_header + 2;
>  	if (!(s->flags & CIP_NO_HEADER)) {
>  		cip_header = &ctx_header[2];
>  		err = check_cip_header(s, cip_header, payload_length,

Thanks for the fix. I've already posted further patch for refactoring
and this was also fixed by a commit 98e3e43b599d ("
ALSA: firewire-lib: refactoring to obsolete IR packet handler").

https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git/commit/?id=98e3e43b599d742c104864c6772a251025ffb52b

Thanks


Takashi Sakamoto
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
