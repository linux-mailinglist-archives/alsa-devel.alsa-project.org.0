Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E339156E00
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Feb 2020 04:41:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3E3271678;
	Mon, 10 Feb 2020 04:40:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3E3271678
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581306070;
	bh=0lWGv0VSdHSbGaFGMnozNgX5gsC7iffd3TjMK2me1VA=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pXUkIVl4TCx9KOq2XiNqAVQLdUpuBrILMsnfpO8Cu8X3yDnp43lZnv39fDHaJUCjN
	 1TZXlJ8cq74ju4DOnKpMiaspcxwlXsc6fg+y2PGQHGa9eWokDJRkEH6UNiuMCGpaFR
	 lDBwxvdqa8sRERG6yz2V0IIJ1WHQij2toy5RaG7g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3B716F8014F;
	Mon, 10 Feb 2020 04:39:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DD3D0F80157; Mon, 10 Feb 2020 04:39:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E4E1BF80118
 for <alsa-devel@alsa-project.org>; Mon, 10 Feb 2020 04:39:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E4E1BF80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="oiHZe3Qf"
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5e40d02b0000>; Sun, 09 Feb 2020 19:38:19 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Sun, 09 Feb 2020 19:39:21 -0800
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Sun, 09 Feb 2020 19:39:21 -0800
Received: from [10.24.218.119] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 10 Feb
 2020 03:39:19 +0000
To: Takashi Iwai <tiwai@suse.de>, <alsa-devel@alsa-project.org>
References: <20200206162804.4734-1-tiwai@suse.de>
 <20200206162804.4734-2-tiwai@suse.de>
From: Nikhil Mahale <nmahale@nvidia.com>
Message-ID: <99f02eeb-9dfc-8642-96a5-71cca9b8f4f9@nvidia.com>
Date: Mon, 10 Feb 2020 09:09:16 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200206162804.4734-2-tiwai@suse.de>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1581305899; bh=OwLUQU6bQkcUw8Yx8vcktU5FnZeBnnvNz2MqegAvw+g=;
 h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
 User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
 X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=oiHZe3QfODRYZb1UKgLrja4Sb2MUMOkOUAgBIIkqFku0T+fpR8rKIqjyINqS8XVtd
 fzDyQS4MqaCozsCQ74DWeNEi5zxXTTAVfA3i4Tauut4pPO1POg36jfE5Xftc2xfVnA
 wVg0FdNjSg7J6iFQ06ikOC5k1CxEBAySRXWdDy/Sz1DATKKBvvibPlssu6EEF+40NQ
 8tEssWBtxYn4X+8IdU3hBjL3Mu69IJRHRcs8cDgVcd52QSd4ATFZ9sGQxTF/3qSw8A
 V0i9+5GDiBaV83ZWZsBiimTQXQ6GE5zVnJddFfl6tYQhLgNrw67dRANNM8Ti87dgRT
 bcD8aMRso3GCQ==
Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH 1/4] ALSA: hda/hdmi: Reduce hda_jack_tbl
 lookup at unsol event handling
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

Looks good to me.

Reviewed-by: Nikhil Mahale <nmahale@nvidia.com>

On 2/6/20 9:58 PM, Takashi Iwai wrote:
> External email: Use caution opening links or attachments
> 
> 
> Pass hda_jack_tbl object to hdmi_intrinsic_event() along with res from
> hdmi_unsol_event() so that we can reduce the lookup of the same
> hda_jack_tbl object again.
> 
> Minor code refactoring.
> 
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> ---
>  sound/pci/hda/patch_hdmi.c | 18 +++---------------
>  1 file changed, 3 insertions(+), 15 deletions(-)
> 
> diff --git a/sound/pci/hda/patch_hdmi.c b/sound/pci/hda/patch_hdmi.c
> index 5119a9ae3d8a..c65d16dea08c 100644
> --- a/sound/pci/hda/patch_hdmi.c
> +++ b/sound/pci/hda/patch_hdmi.c
> @@ -779,21 +779,9 @@ static void jack_callback(struct hda_codec *codec,
>         check_presence_and_report(codec, jack->nid, jack->dev_id);
>  }
> 
> -static void hdmi_intrinsic_event(struct hda_codec *codec, unsigned int res)
> +static void hdmi_intrinsic_event(struct hda_codec *codec, unsigned int res,
> +                                struct hda_jack_tbl *jack)
>  {
> -       int tag = res >> AC_UNSOL_RES_TAG_SHIFT;
> -       struct hda_jack_tbl *jack;
> -
> -       if (codec->dp_mst) {
> -               int dev_entry =
> -                       (res & AC_UNSOL_RES_DE) >> AC_UNSOL_RES_DE_SHIFT;
> -
> -               jack = snd_hda_jack_tbl_get_from_tag(codec, tag, dev_entry);
> -       } else {
> -               jack = snd_hda_jack_tbl_get_from_tag(codec, tag, 0);
> -       }
> -       if (!jack)
> -               return;
>         jack->jack_dirty = 1;
> 
>         codec_dbg(codec,
> @@ -853,7 +841,7 @@ static void hdmi_unsol_event(struct hda_codec *codec, unsigned int res)
>         }
> 
>         if (subtag == 0)
> -               hdmi_intrinsic_event(codec, res);
> +               hdmi_intrinsic_event(codec, res, jack);
>         else
>                 hdmi_non_intrinsic_event(codec, res);
>  }
> --
> 2.16.4
> 

-----------------------------------------------------------------------------------
This email message is for the sole use of the intended recipient(s) and may contain
confidential information.  Any unauthorized review, use, disclosure or distribution
is prohibited.  If you are not the intended recipient, please contact the sender by
reply email and destroy all copies of the original message.
-----------------------------------------------------------------------------------
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
