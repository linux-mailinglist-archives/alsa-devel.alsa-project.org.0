Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AD64145A9A5
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Nov 2021 18:07:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 383591671;
	Tue, 23 Nov 2021 18:06:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 383591671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637687257;
	bh=XrsbRRIwnZIn8rZ67ekSo6riX2dlpSiZdAuV5peL9nw=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=G6IB6MzSHNRGJ3+SWszicm302/owvsbVJx1mGb1/BEKh0nDdhKjxZmjCPYNTsV7+J
	 XCQJwJfa0AIdlixUYyOzOB5+M4POMRFhjCOjtlv9z/wcML2m9Zk4n1DWciQFTjcBLr
	 cxRzl8xRJkJYyOBWBIf7vSupcFDPp/nCdenqalS4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AA56FF80087;
	Tue, 23 Nov 2021 18:06:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A20ABF8049E; Tue, 23 Nov 2021 18:06:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2246DF80154
 for <alsa-devel@alsa-project.org>; Tue, 23 Nov 2021 18:06:10 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id AFDA3A0040;
 Tue, 23 Nov 2021 18:06:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz AFDA3A0040
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1637687169; bh=AwzfWI0E6Fi8aSgKpGM9vQflbSL/BKOc51y2sIoBZRQ=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=biucrvSGWBXjonYxCzKrZyBwdKs+ZnHLAwvayXyOtCwRLK8SC0RH/C1MRw9NkNBWe
 5m9dPi4zcMp3HWWqkn/0rMzJ8DoeO0bS6Qi6CvLiF2AbgYYTQ58RRCNRLA2PmlyaqZ
 BHxGt3gBBBdTSVRkkQKWhEzD+BrFuoWwba9vNyls=
Received: from [192.168.100.98] (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Tue, 23 Nov 2021 18:06:07 +0100 (CET)
Message-ID: <ac0ea3f1-3fd6-75be-e512-e1019064397f@perex.cz>
Date: Tue, 23 Nov 2021 18:06:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] ALSA: led: Use restricted type for iface assignment
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org
References: <20211123170247.2962-1-tiwai@suse.de>
From: Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <20211123170247.2962-1-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 23. 11. 21 18:02, Takashi Iwai wrote:
> Fix a sparse warning that complains about the inconsistent type
> assignment for iface, which is a restricted type of
> snd_ctl_elem_iface_t.
> 
> Fixes: a135dfb5de15 ("ALSA: led control - add sysfs kcontrol LED marking layer")
> Reported-by: kernel test robot <lkp@intel.com>
> Link: https://lore.kernel.org/r/202111201028.xduVYgH5-lkp@intel.com
> Signed-off-by: Takashi Iwai <tiwai@suse.de>

Reviwed-by: Jaroslav Kysela <perex@perex.cz>

Thanks,
	Jaroslav

> ---
>   sound/core/control_led.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/core/control_led.c b/sound/core/control_led.c
> index a95332b2b90b..207828f30983 100644
> --- a/sound/core/control_led.c
> +++ b/sound/core/control_led.c
> @@ -509,7 +509,7 @@ static char *parse_string(char *s, char *val, size_t val_size)
>   	return s;
>   }
>   
> -static char *parse_iface(char *s, unsigned int *val)
> +static char *parse_iface(char *s, snd_ctl_elem_iface_t *val)
>   {
>   	if (!strncasecmp(s, "card", 4))
>   		*val = SNDRV_CTL_ELEM_IFACE_CARD;
> 


-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
