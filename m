Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D6ED3B173A
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Jun 2021 11:48:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E2E31166E;
	Wed, 23 Jun 2021 11:47:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E2E31166E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624441729;
	bh=9O0HQqBIlesFwSB3Uujt8nYT7TwFNanA4pWvuA7bD3A=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iiH1wuMrhIsWP2L6uoQyh46iA2GdJUJKbZz/1xVhjbxguRpjEwHoIFHT+9xPXdueF
	 TZGKBG7CtbLumsKmmRdC9j3uLA+w6s5rLOba4RiHHLaLsStYjHvlFbt7IMycUJbBSR
	 o2F39hbvwR7BkuLBYcDm3xVoMvxk5RvE/yJaZZmU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4C46EF800B5;
	Wed, 23 Jun 2021 11:47:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 521AFF8016D; Wed, 23 Jun 2021 11:47:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,UNPARSEABLE_RELAY autolearn=disabled
 version=3.4.0
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9A9F8F800B5
 for <alsa-devel@alsa-project.org>; Wed, 23 Jun 2021 11:47:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9A9F8F800B5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com
 header.b="ogBxUl36"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15N9ZWor021240; Wed, 23 Jun 2021 09:47:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=FA+wKCvEqhPL++IUAHUQdMEuak2t5x5+jh4eWW+pcyg=;
 b=ogBxUl36I7sVZ27nLgITcq3jsMiGbHXYZunKDllpR1LKEQ53uLOd0XtXjg9EAE4KOXBE
 NNoteLvlfB27v4/29NARzeGBrmfHA91xh8UnueK/pPlYpm6MrAMUXKRSGk4sYV6vl9OL
 t9B9PddMhiA0ooVRancKGN4Wy/RpBJY1gs9NrYrRjDoZ26ABWX77ayKYCoHeWKXlOt+i
 mnO4IaUjcVO29E2t5Z0ztGTf7JYt8uwRB8omO2K4XjkN0yVXPNlv201S4oTQjQhqazIq
 JR2Z/f4nwtyIUSgTuGGyV3SxV7K3bFEubHoLvAm0+ehlWR2Dh+ntmzpaaQ2mkkbMHjpM 4A== 
Received: from oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 39aqqvwe8d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 23 Jun 2021 09:47:11 +0000
Received: from userp3030.oracle.com (userp3030.oracle.com [127.0.0.1])
 by pps.podrdrct (8.16.0.36/8.16.0.36) with SMTP id 15N9kv8W182759;
 Wed, 23 Jun 2021 09:47:10 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by userp3030.oracle.com with ESMTP id 3995pxyyju-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 23 Jun 2021 09:47:10 +0000
Received: from userp3030.oracle.com (userp3030.oracle.com [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 15N9l9fU183647;
 Wed, 23 Jun 2021 09:47:09 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by userp3030.oracle.com with ESMTP id 3995pxyyhn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 23 Jun 2021 09:47:09 +0000
Received: from abhmp0017.oracle.com (abhmp0017.oracle.com [141.146.116.23])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 15N9l4r9018569;
 Wed, 23 Jun 2021 09:47:05 GMT
Received: from kadam (/102.222.70.252) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 23 Jun 2021 02:47:04 -0700
Date: Wed, 23 Jun 2021 12:46:55 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH] ASoC: da7219: Fix an out-of-bound read in an error
 handling path
Message-ID: <20210623094655.GB2116@kadam>
References: <4fdde55198294a07f04933f7cef937fcb654c901.1624425670.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4fdde55198294a07f04933f7cef937fcb654c901.1624425670.git.christophe.jaillet@wanadoo.fr>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-ORIG-GUID: KXRfO7fq66-Z4md6qkgM-t4DEuQv-mgZ
X-Proofpoint-GUID: KXRfO7fq66-Z4md6qkgM-t4DEuQv-mgZ
Cc: alsa-devel@alsa-project.org, support.opensource@diasemi.com,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org, tiwai@suse.com, broonie@kernel.org,
 Adam.Thomson.Opensource@diasemi.com
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

On Wed, Jun 23, 2021 at 07:22:45AM +0200, Christophe JAILLET wrote:
> If 'of_clk_add_hw_provider()' fails, the previous 'for' loop will have
> run completely and 'i' is know to be 'DA7219_DAI_NUM_CLKS'.
> 
> In such a case, there will be an out-of-bounds access when using
> 'da7219->dai_clks_lookup[i]' and '&da7219->dai_clks_hw[i]'.
> 
> To avoid that, add a new label, 'err_free_all', which set the expected
> value of 'i' in such a case.
> 
> Fixes: 78013a1cf297 ("ASoC: da7219: Fix clock handling around codec level probe")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>  sound/soc/codecs/da7219.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/soc/codecs/da7219.c b/sound/soc/codecs/da7219.c
> index 13009d08b09a..1e8b491d1fd3 100644
> --- a/sound/soc/codecs/da7219.c
> +++ b/sound/soc/codecs/da7219.c
> @@ -2204,12 +2204,14 @@ static int da7219_register_dai_clks(struct snd_soc_component *component)
>  					     da7219->clk_hw_data);
>  		if (ret) {
>  			dev_err(dev, "Failed to register clock provider\n");
> -			goto err;
> +			goto err_free_all;
>  		}
>  	}
>  
>  	return 0;
>  
> +err_free_all:
> +	i = DA7219_DAI_NUM_CLKS - 1;
>  err:
>  	do {
>  		if (da7219->dai_clks_lookup[i])

This do while statement is wrong and it leads to potentially calling
clk_hw_unregister() on clks that haven't been registered.

I think that calling clk_hw_unregister() on unregistered clocks is
supposed to okay but I found a case where it leads to a WARN_ON()
(Nothing else harmful).  It's in __clk_register() if the alloc_clk()
fails:

	hw->clk = alloc_clk(core, NULL, NULL);
        if (IS_ERR(hw->clk)) {
                ret = PTR_ERR(hw->clk);
                goto fail_create_clk;  // <- forgot to set hw->clk = NULL
        }

The better way to handle errors from loops is to clean up partial
iterations before doing the goto.  So add a clk_hw_unregister() if the
dai_clk_lookup = clkdev_hw_create() assignment fails.  Then use a
while (--i >= 0) loop in the unwind section:

err_free_all:
	i = DA7219_DAI_NUM_CLKS;
err:
	while (--i >= 0) {

regards,
dan carpenter

