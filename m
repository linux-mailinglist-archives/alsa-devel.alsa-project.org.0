Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BFE012AD1B
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Dec 2019 15:43:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B049B16FA;
	Thu, 26 Dec 2019 15:42:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B049B16FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1577371404;
	bh=ddfzSiavYBmzJjUdslaVG2E1Ja+KNNncFltByyoiSlo=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fJAQ8t4tcBJRUbs5P6j05NrMw2u1HVHA9k3TFgCJMknbD7fyz0xIMUjrC3xhnIv53
	 GxvQHfeB5pvp4T9fAMVeIp0+ePYJX5iZ0h3iM+fgV81lp65JVzEnJwkmUDQppzUl33
	 VSVJL3cRmbQA3dPgJj8kl+96NcIY7sF1Wr14g61k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EEB09F8014C;
	Thu, 26 Dec 2019 15:41:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5B017F80139; Thu, 26 Dec 2019 15:41:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx1.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CFD27F8012E
 for <alsa-devel@alsa-project.org>; Thu, 26 Dec 2019 15:41:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CFD27F8012E
Received: from [192.168.1.6] (x590e15ff.dyn.telefonica.de [89.14.21.255])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: pmenzel)
 by mx.molgen.mpg.de (Postfix) with ESMTPSA id 8BDD5202254E9;
 Thu, 26 Dec 2019 15:41:34 +0100 (CET)
To: Takashi Iwai <tiwai@suse.de>
References: <6aa4e167-abb0-6a2c-c00e-558aa79d94be@molgen.mpg.de>
 <s5h1rsr769i.wl-tiwai@suse.de>
From: Paul Menzel <pmenzel@molgen.mpg.de>
Message-ID: <91e1ebe8-270e-d62f-844e-2018fe77145e@molgen.mpg.de>
Date: Thu, 26 Dec 2019 15:41:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <s5h1rsr769i.wl-tiwai@suse.de>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.com>,
 LKML <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org
Subject: Re: [alsa-devel] [Regression drm-tip] Internal audio device missing
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Dear Takashi,


Am 26.12.19 um 11:03 schrieb Takashi Iwai:
> On Thu, 26 Dec 2019 10:47:18 +0100, Paul Menzel wrote:

>> With
>>
>>      $ git describe --tags drm-tip/drm-tip
>>      v5.5-rc3-1481-ga20d8cd6901a
>>
>> the internal audio device is not available, and just a dummy device.
>>
>> Running `alsa-info.sh` [1], the messages below are shown with the
>> problematic Linux kernel.
>>
>>      alsactl: get_controls:567: snd_ctl_open error: Sound protocol is
>> not compatible
>>      cat: /tmp/alsa-info.ateDlDjrZX/alsactl.tmp: No such file or directory
> 
> That's an unexpected side-effect of the recent protocol version bump
> in sound.git for-next branch.  It seems that we can't change the minor
> version unless we really want to break something.
> 
> Below is the fix patch.  Please give it a try.

Thank you for the quick reply and fix.

> -- 8< --
> From: Takashi Iwai <tiwai@suse.de>
> Subject: [PATCH] ALSA: control: Fix incompatible protocol error
> 
> The recent change to bump the ALSA control API protocol version from
> 2.0.7 to 2.1.0 caused a regression on user-space; while the user-space
> expects both the major and the minor versions to be identical with the
> supported numbers, we changed the minor number from 0 to 1.
> 
> For recovering from the incompatibility, this patch changes the
> protocol version again to 2.0.8, which is compatible, but yet higher
> than the original number 2.0.7, indicating that the protocol change.
> 
> Fixes: bd3eb4e87eb3 ("ALSA: ctl: bump protocol version up to v2.1.0")
> Reported-by: Paul Menzel <pmenzel@molgen.mpg.de>
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> ---
>   include/uapi/sound/asound.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/uapi/sound/asound.h b/include/uapi/sound/asound.h
> index e36dadaf84ba..30ebb2a42983 100644
> --- a/include/uapi/sound/asound.h
> +++ b/include/uapi/sound/asound.h
> @@ -936,7 +936,7 @@ struct snd_timer_tread {
>    *                                                                          *
>    ****************************************************************************/
>   
> -#define SNDRV_CTL_VERSION		SNDRV_PROTOCOL_VERSION(2, 1, 0)
> +#define SNDRV_CTL_VERSION		SNDRV_PROTOCOL_VERSION(2, 0, 8)
>   
>   struct snd_ctl_card_info {
>   	int card;			/* card number */
> 

Tested-by: Paul Menzel <pmenzel@molgen.mpg.de>

Are there CI systems, which should have caught this problem?

Which user-space component should forward this problem to the user 
(desktop environment displaying a warning)?


Kind regards,

Paul
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
