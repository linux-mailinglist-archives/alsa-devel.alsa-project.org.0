Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E3CE19C868
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Apr 2020 19:55:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3476A167D;
	Thu,  2 Apr 2020 19:54:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3476A167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585850134;
	bh=CJuKWmhp/zZvQEnegkg+45na5Xr3LhbxdErQBUv+Gmw=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NzFtXLCYIgV+6NAldgQ1z+Y23JXeOEyUdV+mnZXrukVnDjxXtmOhDZARQxHcI00mF
	 LsTwfp8gsWf8D6UL6SoqzF27DUs2Q10OjRHPTBeMN3++uJ8EscFJlWAWrkFF2msv1w
	 XifBAHdNn4uNuQTKRlQtrG3TFDMSJ8smApav8SSw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 49154F80088;
	Thu,  2 Apr 2020 19:53:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 195A9F80148; Thu,  2 Apr 2020 19:53:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6E0B1F80088
 for <alsa-devel@alsa-project.org>; Thu,  2 Apr 2020 19:53:46 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 81629A0046;
 Thu,  2 Apr 2020 19:53:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 81629A0046
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1585850023; bh=/dPa2kaVvUap251fDPpAG6ZGlh3gCM2z2dMDZd7NOUM=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=YTqlXDRKRWVRGwOVz8MBkbarZbnmduupboCDVNA2j2C04SL01+4wbiYF4Ppm4c/ec
 JHixf/Bd8UIPPKvcgmWmTPg1jSVIlQwMnKokjB7JOGcfAf40V2xLsSMOUOKaUeZBix
 JL7jzMdfOHW5Uwe9jcrR1NrDOAGZ8nTR+jMPjo74=
Received: from p50.perex-int.cz (unknown [192.168.100.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Thu,  2 Apr 2020 19:53:39 +0200 (CEST)
Subject: Re: [PATCH] ALSA: hda/realtek - Add quirk for Lenovo Carbon X1 8th gen
To: Hans de Goede <hdegoede@redhat.com>, Takashi Iwai <tiwai@suse.com>
References: <20200402174311.238614-1-hdegoede@redhat.com>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <1b7cf275-ffdc-3853-2196-1e60617cce73@perex.cz>
Date: Thu, 2 Apr 2020 19:53:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200402174311.238614-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, stable@vger.kernel.org
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

Dne 02. 04. 20 v 19:43 Hans de Goede napsal(a):
> The audio setup on the Lenovo Carbon X1 8th gen is the same as that on
> the Lenovo Carbon X1 7th gen, as such it needs the same
> ALC285_FIXUP_THINKPAD_HEADSET_JACK quirk.
> 
> This fixes volume control of the speaker not working among other things.
> 
> BugLink: https://bugzilla.redhat.com/show_bug.cgi?id=1820196
> Cc: stable@vger.kernel.org
> Suggested-by: Jaroslav Kysela <perex@perex.cz>

Reviewed-by: Jaroslav Kysela <perex@perex.cz>

> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>   sound/pci/hda/patch_realtek.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
> index 63e1a56f705b..9c3bbf1df93e 100644
> --- a/sound/pci/hda/patch_realtek.c
> +++ b/sound/pci/hda/patch_realtek.c
> @@ -7299,6 +7299,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
>   	SND_PCI_QUIRK(0x17aa, 0x225d, "Thinkpad T480", ALC269_FIXUP_LIMIT_INT_MIC_BOOST),
>   	SND_PCI_QUIRK(0x17aa, 0x2292, "Thinkpad X1 Yoga 7th", ALC285_FIXUP_THINKPAD_HEADSET_JACK),
>   	SND_PCI_QUIRK(0x17aa, 0x2293, "Thinkpad X1 Carbon 7th", ALC285_FIXUP_THINKPAD_HEADSET_JACK),
> +	SND_PCI_QUIRK(0x17aa, 0x22be, "Thinkpad X1 Carbon 8th", ALC285_FIXUP_THINKPAD_HEADSET_JACK),
>   	SND_PCI_QUIRK(0x17aa, 0x30bb, "ThinkCentre AIO", ALC233_FIXUP_LENOVO_LINE2_MIC_HOTKEY),
>   	SND_PCI_QUIRK(0x17aa, 0x30e2, "ThinkCentre AIO", ALC233_FIXUP_LENOVO_LINE2_MIC_HOTKEY),
>   	SND_PCI_QUIRK(0x17aa, 0x310c, "ThinkCentre Station", ALC294_FIXUP_LENOVO_MIC_LOCATION),
> 


-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
