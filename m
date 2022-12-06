Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C6718644317
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Dec 2022 13:26:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5580417F5;
	Tue,  6 Dec 2022 13:25:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5580417F5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670329580;
	bh=Zhel367AShSXh2mO9nrfDUKNLZGOArG9Z2AeqVaLZnk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WF73Z+8548V5S/bss3oOyewdxcE5QtV21RA7uT/DCRuX1Y+9X6TQA8W2fBXxuFHAM
	 6xOUgnRS5cNIP3odQV0tgruSSju6g6q7ijsNe/Vu1KdGZsRQkH6f+qfqs7O9muxWMd
	 wLNYnVFp2ObxtCFnHZG4+tNspHt1WeyPz7PJkjaY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 067AEF80121;
	Tue,  6 Dec 2022 13:25:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 855EFF80290; Tue,  6 Dec 2022 13:25:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS,URIBL_ZEN_BLOCKED_OPENDNS autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 60EA9F80121
 for <alsa-devel@alsa-project.org>; Tue,  6 Dec 2022 13:25:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 60EA9F80121
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
 header.i=@linuxfoundation.org header.b="IcPpQFSR"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 655E6616EF;
 Tue,  6 Dec 2022 12:25:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76BE0C433D6;
 Tue,  6 Dec 2022 12:25:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1670329511;
 bh=Zhel367AShSXh2mO9nrfDUKNLZGOArG9Z2AeqVaLZnk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IcPpQFSRjbwvEp6A+iUmGWPoV1QzMAAlZRyW0S3H2tawPpVrXOkFV3rfuPXNMPn8E
 Y14ZtHUn6mi+aAFqsBiJVZucTODmieiacAwty0OrEPOobJzxvUF2KdrxSqHMDiJi/r
 TFqkQWPf0lyh5hA5GpnVKrY52hvRQae4D4rm/wqI=
Date: Tue, 6 Dec 2022 13:25:09 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Dicheng Wang <wangdicheng123@hotmail.com>
Subject: Re: [PATCH v2 -next] ALSA:usb-audio:Add the information of KT0206
 device driven by USB audio
Message-ID: <Y480pd/XynYddrHk@kroah.com>
References: <SG2PR02MB58780ED138433086A3213AE98A1B9@SG2PR02MB5878.apcprd02.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SG2PR02MB58780ED138433086A3213AE98A1B9@SG2PR02MB5878.apcprd02.prod.outlook.com>
Cc: alsa-devel@alsa-project.org, john-linux@pelago.org.uk,
 wangdicheng@kylinos.cn, linux-kernel@vger.kernel.org, sdoregor@sdore.me,
 tiwai@suse.com, stable@vger.kernel.org, hahnjo@hahnjo.de,
 connerknoxpublic@gmail.com
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

On Tue, Dec 06, 2022 at 05:36:37PM +0800, Dicheng Wang wrote:
> From: wangdicheng <wangdicheng@kylinos.cn>
> 
> Cc: stable@vger.kernel.org
> Signed-off-by: wangdicheng <wangdicheng@kylinos.cn>
> ---
> v2:use USB_DEVICE_VENDOR_SPEC() suggested by Takashi Iwai
> 
>  sound/usb/quirks-table.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/sound/usb/quirks-table.h b/sound/usb/quirks-table.h
> index 874fcf245747..271884e35003 100644
> --- a/sound/usb/quirks-table.h
> +++ b/sound/usb/quirks-table.h
> @@ -76,6 +76,8 @@
>  { USB_DEVICE_VENDOR_SPEC(0x041e, 0x3f0a) },
>  /* E-Mu 0204 USB */
>  { USB_DEVICE_VENDOR_SPEC(0x041e, 0x3f19) },
> +/* Ktmicro Usb_audio device */
> +{ USB_DEVICE_VENDOR_SPEC(0x31b2, 0x0011) },
>  
>  /*
>   * Creative Technology, Ltd Live! Cam Sync HD [VF0770]
> -- 
> 2.25.1
> 

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

- Your patch contains warnings and/or errors noticed by the
  scripts/checkpatch.pl tool.

- Your patch is malformed (tabs converted to spaces, linewrapped, etc.)
  and can not be applied.  Please read the file,
  Documentation/email-clients.txt in order to fix this.

- You did not specify a description of why the patch is needed, or
  possibly, any description at all, in the email body.  Please read the
  section entitled "The canonical patch format" in the kernel file,
  Documentation/SubmittingPatches for what is needed in order to
  properly describe the change.

- You did not write a descriptive Subject: for the patch, allowing Greg,
  and everyone else, to know what this patch is all about.  Please read
  the section entitled "The canonical patch format" in the kernel file,
  Documentation/SubmittingPatches for what a proper Subject: line should
  look like.

- It looks like you did not use your "real" name for the patch on either
  the Signed-off-by: line, or the From: line (both of which have to
  match).  Please read the kernel file, Documentation/SubmittingPatches
  for how to do this correctly.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
