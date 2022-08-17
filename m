Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B3DC75968C6
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Aug 2022 07:45:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 53B0582C;
	Wed, 17 Aug 2022 07:44:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 53B0582C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660715145;
	bh=TJK1HQHESp79FkGOgaGCfeLPZXjBhyd9aEPbEua1N3A=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=M0GCBNTa9is5PFSsnrWggA2kWNSIAegxw6E/BTdh0UNOuvAt4jnowd8FwyrVsMyEp
	 NxpI1nBmk4AOJ0kOmcKnf8xzYrTbqLy4MZbgcdAK8sVUWyWH4Zx3s1B8iAadp62GAn
	 CAgd5bg8WAPyUU5mH8IVXqocRvOQRJSaXPp8WeWs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B8B0AF80088;
	Wed, 17 Aug 2022 07:44:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E7201F8025C; Wed, 17 Aug 2022 07:44:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9E1F3F80088
 for <alsa-devel@alsa-project.org>; Wed, 17 Aug 2022 07:44:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9E1F3F80088
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=flatmax-com.20210112.gappssmtp.com
 header.i=@flatmax-com.20210112.gappssmtp.com header.b="QM4/8vv4"
Received: by mail-pl1-x634.google.com with SMTP id t3so3249489ply.2
 for <alsa-devel@alsa-project.org>; Tue, 16 Aug 2022 22:44:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=flatmax-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=3znbrSjjpvJwytUCGFSSBt6kROH+ezee+opuMaP8YXM=;
 b=QM4/8vv4gJc7BKd4E0KpFd/jkT5JS5MDx2a73/YDZSzUwSXScNudb9Rs8q8wgeBuX1
 zbj1k9PqFDHNSGvsrcpMu66A30mQTYKvVVfyPDpEerG/8/OcUppDwVsQv0NhLYEJjObM
 7bb9JeZ52OFNxj+XCK6r9zVoLlrqmwmn41E3NPv1MAl8iNeNEsBxpFavaq19Qnmwech2
 KGOgrAVlqKSVXAdRV+PZnXIjNelGcihZnl4Y0UUP5iXJX1gQApqmNkU6Pa0dG5G9XXKR
 oEgWV52VWk1OaHITiJzVp5he3ICwDiofFbG/lf8cf5wTWLy4NCcbcb2SrZQ+P+k3i7MX
 Q0gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=3znbrSjjpvJwytUCGFSSBt6kROH+ezee+opuMaP8YXM=;
 b=HlTHm0tq3x9xOyT+D+fbs2G5KGVWA3VNmHnUsFGF3YmAYc78v4nQ3FE3/9Kwz1B3Mk
 QzAc29cESAQOs+O23De5Ay9UaKBrkr3xgxTU8htHNgitnZF0K4D6zF/xLrIQUIGiG7sT
 KIfQkOgWSxJPSFd3dVH8ZzujipSNXLkXZOljqAy9VyR0lqsis3FpJlPz42LioYBxZs6/
 O+A3l9UGPsMnCE/CcO70OcOgwkRNXwsXTIJBEHSyBYCfEykNSxre9ljub3DEnBaJ0cJx
 5ankclMad9B9We28YXCZ+00i0s58S7KWCd/t9Vpuru86AAMVIX0gNmNe1LhhAC9USx+z
 DRNA==
X-Gm-Message-State: ACgBeo02jHMJ1EV+YuMSUhlV6ItlG5MKb0SLlpMXBnhIhI0rJA7cn1FO
 ocUc+KhZQsAZL1CHN/ThZ68yfA==
X-Google-Smtp-Source: AA6agR4bs1aL5MGE/NgKp+m43p6eTohs7NwK08JnwHC/Xg0owMyOXV/oKri9+jtYA8YBskgwxJPebg==
X-Received: by 2002:a17:90b:4b0c:b0:1f4:ffac:699a with SMTP id
 lx12-20020a17090b4b0c00b001f4ffac699amr2091787pjb.145.1660715077630; 
 Tue, 16 Aug 2022 22:44:37 -0700 (PDT)
Received: from ?IPV6:2406:3400:213:70c0:9df6:7e57:88ce:1bea?
 ([2406:3400:213:70c0:9df6:7e57:88ce:1bea])
 by smtp.gmail.com with ESMTPSA id
 o21-20020aa79795000000b0052d8405bcd2sm9451333pfp.163.2022.08.16.22.44.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Aug 2022 22:44:37 -0700 (PDT)
Message-ID: <f8439531-897a-c25a-688b-be01290b006d@flatmax.com>
Date: Wed, 17 Aug 2022 15:44:33 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2] ASoC: codecs: add uspport for the TI SRC4392 codec
Content-Language: en-AU
To: Nathan Chancellor <nathan@kernel.org>
References: <20220808214028.2502801-1-flatmax@flatmax.com>
 <202208090909.Pg0BZGie-lkp@intel.com>
 <YvvbKry5FVFbNdcI@dev-arch.thelio-3990X>
From: Matt Flax <flatmax@flatmax.com>
In-Reply-To: <YvvbKry5FVFbNdcI@dev-arch.thelio-3990X>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, llvm@lists.linux.dev, kbuild-all@lists.01.org,
 kernel test robot <lkp@intel.com>, broonie@kernel.org
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


On 17/8/22 04:00, Nathan Chancellor wrote:

>>     265			/* set the PLL for the digital receiver */
>>     266			switch (src4xxx->mclk_hz) {
>>     267			case 24576000:
>>     268				pj = 0x22;
>>     269				jd = 0x00;
>>     270				d = 0x00;
>>     271				break;
>>     272			case 22579200:
>>     273				pj = 0x22;
>>     274				jd = 0x1b;
>>     275				d = 0xa3;
>>     276				break;
>>   > 277			default:
>>     278				/* don't error out here,
>>     279				 * other parts of the chip are still functional
>>     280				 */
>>     281				dev_info(component->dev,
>>     282					"Couldn't set the RCV PLL as this master clock rate is unknown\n");
> In the final commit, there is a 'break' here. Should it be a 'return 0'
> instead? Or should there be a different fix for these warnings?

The data sheet for the src4392 doesn't list defaults for these registers 
(loaded with pj, jd and d). The actual state of these registers is not 
known until we load them with something, arbitrary or not.

	{  SRC4XXX_RCV_PLL_0F,		0x00  },  /* not spec. in the datasheet */
	{  SRC4XXX_RCV_PLL_10,		0xff  },  /* not spec. in the datasheet */
	{  SRC4XXX_RCV_PLL_11,		0xff  },  /* not spec. in the datasheet */

The state of DIR PLL registers aren't important if the user doesn't 
specify a known mclk frequency.  The implication is that the DIR will 
not function, however that is already implied by the user lacking to 
specify a known mclk frequency.

The other functions on the chip (port A/B I2S, SRC, DIT, etc) will 
behave as per usual, only the DIR will be dysfunctional.


>>     283			}
>>     284			ret = regmap_write(src4xxx->regmap, SRC4XXX_RCV_PLL_0F, pj);
>>     285			if (ret < 0)
>>     286				dev_err(component->dev,
>>     287					"Failed to update PLL register 0x%x\n",
>>     288					SRC4XXX_RCV_PLL_0F);
>>   > 289			ret = regmap_write(src4xxx->regmap, SRC4XXX_RCV_PLL_10, jd);
>>     290			if (ret < 0)
>>     291				dev_err(component->dev,
>>     292					"Failed to update PLL register 0x%x\n",
>>     293					SRC4XXX_RCV_PLL_10);
>>   > 294			ret = regmap_write(src4xxx->regmap, SRC4XXX_RCV_PLL_11, d);
>>     295			if (ret < 0)
>>     296				dev_err(component->dev,
>>     297					"Failed to update PLL register 0x%x\n",
>>     298					SRC4XXX_RCV_PLL_11);
>>     
> Cheers,
> Nathan
