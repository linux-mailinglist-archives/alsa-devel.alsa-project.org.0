Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 679F83B3ABE
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Jun 2021 04:09:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CB0CA1660;
	Fri, 25 Jun 2021 04:08:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CB0CA1660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624586979;
	bh=DNI820eTAB6xYmNz1WkJfTBfSbRxhVXFj0cFpknPe9s=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SrvcLZyUHY/BqKHytfm6O8xndraUzWssBNy6GoG/GINuc8RO7Gc8QoS1xxEvi7vAD
	 hx9jMsWPtSgIo9XpDrz9JQmjE03UcCMB4UKS9FTVHRFRb7DXI2rUvx2XbsxWVnfaEt
	 dDDxZ+V5LHoPoAxkBiZkHydAha2/Fy0YuhgOsIPA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 392B7F801DB;
	Fri, 25 Jun 2021 04:08:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 26C01F801D5; Fri, 25 Jun 2021 04:08:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from m.b4.vu (m.b4.vu [203.16.231.148])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AB16DF8012C
 for <alsa-devel@alsa-project.org>; Fri, 25 Jun 2021 04:07:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AB16DF8012C
Received: by m.b4.vu (Postfix, from userid 1000)
 id 4094561E5F02; Fri, 25 Jun 2021 11:37:48 +0930 (ACST)
Date: Fri, 25 Jun 2021 11:37:48 +0930
From: "Geoffrey D. Bennett" <g@b4.vu>
To: Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH] ALSA: usb-audio: scarlett2: Fix for loop increment in
 scarlett2_usb_get_config
Message-ID: <20210625020748.GA21766@m.b4.vu>
References: <20210624212048.1356136-1-nathan@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210624212048.1356136-1-nathan@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, Nick Desaulniers <ndesaulniers@google.com>,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 clang-built-linux@googlegroups.com
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

On Thu, Jun 24, 2021 at 02:20:48PM -0700, Nathan Chancellor wrote:
> Clang warns:
> 
> sound/usb/mixer_scarlett_gen2.c:1189:32: warning: expression result
> unused [-Wunused-value]
>                         for (i = 0; i < count; i++, (u16 *)buf++)
>                                                     ^      ~~~~~
> 1 warning generated.
> 
> It appears the intention was to cast the void pointer to a u16 pointer
> so that the data could be iterated through like an array of u16 values.
> However, the cast happens after the increment because a cast is an
> rvalue, whereas the post-increment operator only works on lvalues, so
> the loop does not iterate as expected.
> 
> Replace the post-increment shorthand with the full expression so the
> cast can be added in the right place and the look works as expected.

look -> loop

> Fixes: ac34df733d2d ("ALSA: usb-audio: scarlett2: Update get_config to do endian conversion")
> Link: https://github.com/ClangBuiltLinux/linux/issues/1408
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
>  sound/usb/mixer_scarlett_gen2.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/usb/mixer_scarlett_gen2.c b/sound/usb/mixer_scarlett_gen2.c
> index fcba682cd422..c20c7f1ddc50 100644
> --- a/sound/usb/mixer_scarlett_gen2.c
> +++ b/sound/usb/mixer_scarlett_gen2.c
> @@ -1186,7 +1186,7 @@ static int scarlett2_usb_get_config(
>  		if (err < 0)
>  			return err;
>  		if (size == 2)
> -			for (i = 0; i < count; i++, (u16 *)buf++)
> +			for (i = 0; i < count; i++, buf = (u16 *)buf + 1)
>  				*(u16 *)buf = le16_to_cpu(*(__le16 *)buf);
>  		return 0;
>  	}

Thanks Nathan!

FYI: although incorrect, this caused no bug as there is not yet any
case where count > 1.

Acked-by: Geoffrey D. Bennett <g@b4.vu>
