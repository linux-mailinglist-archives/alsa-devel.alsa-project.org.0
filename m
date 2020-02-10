Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EF75156E95
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Feb 2020 06:11:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BBD64167A;
	Mon, 10 Feb 2020 06:10:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BBD64167A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581311461;
	bh=4N/RWZkwJvybnRSvFXxvJm5AIgcGSsLu7Iqsw1GgD5w=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HYw68DYvkJuWR5qx3ZkEcKtr9cMiPjpGa/Ik2hZsmgFmBGdsbc0FbkcDIfVse6LSo
	 EugGX0EqicmIRUARTGMaMxKJJoWVXyKUM3wm66a6CfMigrFe2Dp1dee6RqpZR5lOMf
	 I+tU77benmZ/CbPmja9ECG94Q5NWq6wEEPfDhEts=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 49FC9F80228;
	Mon, 10 Feb 2020 06:09:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D3272F8020B; Mon, 10 Feb 2020 06:09:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 023A6F80157
 for <alsa-devel@alsa-project.org>; Mon, 10 Feb 2020 06:09:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 023A6F80157
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="Uww1OZO8"
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5e40e5370000>; Sun, 09 Feb 2020 21:08:07 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Sun, 09 Feb 2020 21:09:09 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Sun, 09 Feb 2020 21:09:09 -0800
Received: from [10.24.218.119] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 10 Feb
 2020 05:09:08 +0000
To: Takashi Iwai <tiwai@suse.de>, <alsa-devel@alsa-project.org>
References: <20200206162804.4734-1-tiwai@suse.de>
 <20200206162804.4734-4-tiwai@suse.de>
X-Nvconfidentiality: Public
From: Nikhil Mahale <nmahale@nvidia.com>
Message-ID: <cf18ddf9-3c5b-cf5b-103a-fa81ef36072a@nvidia.com>
Date: Mon, 10 Feb 2020 10:39:05 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200206162804.4734-4-tiwai@suse.de>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1581311287; bh=myfot63143fAwz4Op9eLUR++ie7xhsZaoS69UzR0CPo=;
 h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=Uww1OZO8Re7HuV+C1AALeulaW8knp+7KJf9uIy4RbjkMsJ08X8mLkSmaELNXL8sJF
 RlDNPuGsXFXFUfXjD9VswcDoOuJNWoHSinrO96kfRcNG/HiWcXlIc2OH+eoUPqwyrp
 s7GjbjzNuSiEJyVMSQytKzMkRq/IFy1CsbClOn1bo8AFmFGTGe8ytBmq5LgI6iJMgV
 7LHhWR6anR8vx15yUn9ppeDr23UHSejkRKf2FjdaatJct5BPbGd+p4Q1WvSwwaZhnJ
 HLLlyNMPiYI7IHYiNC4quJT7YlIF8p7Qj1T/PMyjun37OgXwoFEMkSIw1cfS93b8gD
 wzFVGIQdWJLZQ==
Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH 3/4] ALSA: hda/hdmi: Move runtime PM resume
 into hdmi_present_sense_via_verbs()
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
> For improving the readability, move the runtime PM handling code from
> hdmi_present_sense() to hdmi_present_sense_via_verbs().  Now
> hdmi_present_sense() became symmetric for both audio-component and
> legacy cases.
> 
> Just a minor code refactoring.
> 
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> ---
>  sound/pci/hda/patch_hdmi.c | 20 +++++++++-----------
>  1 file changed, 9 insertions(+), 11 deletions(-)
> 
> diff --git a/sound/pci/hda/patch_hdmi.c b/sound/pci/hda/patch_hdmi.c
> index 98a8c4f97d6b..437177294d78 100644
> --- a/sound/pci/hda/patch_hdmi.c
> +++ b/sound/pci/hda/patch_hdmi.c
> @@ -1587,6 +1587,11 @@ static void hdmi_present_sense_via_verbs(struct hdmi_spec_per_pin *per_pin,
>          */
>         int present;
>         bool do_repoll = false;
> +       int ret;
> +
> +       ret = snd_hda_power_up_pm(codec);
> +       if (ret < 0 && pm_runtime_suspended(hda_codec_dev(codec)))
> +               goto out;
> 
>         present = snd_hda_jack_pin_sense(codec, pin_nid, dev_id);
> 
> @@ -1620,6 +1625,8 @@ static void hdmi_present_sense_via_verbs(struct hdmi_spec_per_pin *per_pin,
>                 do_update_eld(codec, per_pin, eld);
> 
>         mutex_unlock(&per_pin->lock);
> + out:
> +       snd_hda_power_down_pm(codec);
>  }
> 
>  /* update ELD and jack state via audio component */
> @@ -1657,20 +1664,11 @@ static void sync_eld_via_acomp(struct hda_codec *codec,
>  static void hdmi_present_sense(struct hdmi_spec_per_pin *per_pin, int repoll)
>  {
>         struct hda_codec *codec = per_pin->codec;
> -       int ret;
> 
> -       /* no temporary power up/down needed for component notifier */
> -       if (!codec_has_acomp(codec)) {
> -               ret = snd_hda_power_up_pm(codec);
> -               if (ret < 0 && pm_runtime_suspended(hda_codec_dev(codec))) {
> -                       snd_hda_power_down_pm(codec);
> -                       return;
> -               }
> +       if (!codec_has_acomp(codec))
>                 hdmi_present_sense_via_verbs(per_pin, repoll);
> -               snd_hda_power_down_pm(codec);
> -       } else {
> +       else
>                 sync_eld_via_acomp(codec, per_pin);
> -       }
>  }
> 
>  static void hdmi_repoll_eld(struct work_struct *work)
> --
> 2.16.4
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
