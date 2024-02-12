Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 31F33850E27
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Feb 2024 08:41:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8BBBAE69;
	Mon, 12 Feb 2024 08:41:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8BBBAE69
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707723706;
	bh=9udCnw/6FmOCJOWM7tVo1WPGzEKXicpOX6uGe/Cj4ZQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=M+LPuJdjNEsHTyfloujyRvi/B8MuqhvNAuufw9C0m7UHTznTPWaA1bfUQZUnb1Wy2
	 M4nfIoYLpP5IYBnb5IxK4dFI03buddsHo/3gZaEOWvUsCyjgRHZtWhWK00pVAuDm4U
	 ApYrEG+ll++v/5E3NVeB+7HiSYdsf1ZUzBlyCe4M=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AFEDDF805D6; Mon, 12 Feb 2024 08:41:04 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 465B9F805CA;
	Mon, 12 Feb 2024 08:41:03 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0E6C4F80238; Mon, 12 Feb 2024 08:40:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 500ECF8015B
	for <alsa-devel@alsa-project.org>; Mon, 12 Feb 2024 08:40:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 500ECF8015B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=HRpu1H9D
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2D4B660BA8;
	Mon, 12 Feb 2024 07:40:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54041C433C7;
	Mon, 12 Feb 2024 07:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1707723637;
	bh=9udCnw/6FmOCJOWM7tVo1WPGzEKXicpOX6uGe/Cj4ZQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HRpu1H9DxNXb0tra8nwsAKhTLwYH7fBwvvX5vlwSFi7ACdRMRXjKJgvm3HRkJrxSf
	 mKggMkayL5imKSWKoTcliuTEQUq34Re8Ina/WX7b9cOigNvM+9PZzG77oxbi39wCJs
	 mJn1IoLGv5S9yCE8l3uSooMNX/cU7hzEGliM866g=
Date: Mon, 12 Feb 2024 07:30:14 +0000
From: Greg KH <gregkh@linuxfoundation.org>
To: Yinchuan Guo <guoych37@mail2.sysu.edu.cn>
Cc: linux-kernel@vger.kernel.org, lee.jones@linaro.org,
	james.smart@broadcom.com, dick.kennedy@broadcom.com,
	jejb@linux.ibm.com, martin.petersen@oracle.com,
	jirislaby@kernel.org, lgirdwood@gmail.com, broonie@kernel.org,
	perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org
Subject: Re: [PATCH] sound: drivers: fix typo 'reguest' to 'request'
Message-ID: <2024021201-ivory-unvaried-e836@gregkh>
References: <20240212065014.3696356-1-guoych37@mail2.sysu.edu.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240212065014.3696356-1-guoych37@mail2.sysu.edu.cn>
Message-ID-Hash: HDRWV7G2GHIGJBBXWJOX57YFXIJQDWJZ
X-Message-ID-Hash: HDRWV7G2GHIGJBBXWJOX57YFXIJQDWJZ
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HDRWV7G2GHIGJBBXWJOX57YFXIJQDWJZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Feb 12, 2024 at 02:50:14PM +0800, Yinchuan Guo wrote:
> This patch fixes a widespread spelling mistake of the word "request"
> (incorrectly spelled as "reguest") across multiple files.
> 
> Signed-off-by: Yinchuan Guo <guoych37@mail2.sysu.edu.cn>
> ---
>  drivers/mfd/da9063-irq.c      | 2 +-
>  drivers/scsi/lpfc/lpfc_sli.c  | 2 +-
>  drivers/tty/serial/max310x.c  | 2 +-
>  drivers/tty/serial/sccnxp.c   | 2 +-
>  sound/soc/codecs/rt274.c      | 2 +-
>  sound/soc/codecs/rt286.c      | 2 +-
>  sound/soc/codecs/rt298.c      | 2 +-
>  sound/soc/codecs/rt5514-spi.c | 2 +-
>  sound/soc/codecs/rt5640.c     | 2 +-
>  sound/soc/codecs/rt5645.c     | 2 +-
>  sound/soc/codecs/rt5651.c     | 2 +-
>  sound/soc/codecs/rt5659.c     | 2 +-
>  sound/soc/codecs/rt5663.c     | 2 +-
>  sound/soc/codecs/rt5665.c     | 2 +-
>  sound/soc/codecs/rt5668.c     | 2 +-
>  sound/soc/codecs/rt5682-i2c.c | 2 +-
>  16 files changed, 16 insertions(+), 16 deletions(-)

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- This looks like a new version of a previously submitted patch, but you
  did not list below the --- line any changes from the previous version.
  Please read the section entitled "The canonical patch format" in the
  kernel file, Documentation/process/submitting-patches.rst for what
  needs to be done here to properly describe this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
