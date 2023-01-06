Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BC2065FC46
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Jan 2023 08:52:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B0B404947;
	Fri,  6 Jan 2023 08:51:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B0B404947
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672991564;
	bh=I+KkT0rK/LQYUuUax3rPa8bPEvTqljDS1+83X2hArJY=;
	h=Date:From:To:Subject:In-Reply-To:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:From;
	b=ngAvvxsiaR8ysnp4V0htdD+pCiyGQNcCcw3VAwgAJI1Q4BCM0L+ZoqSRv9N224X8S
	 Tt7NUsBtUsHHaib4NvhdNaeR+zJoHCXSn5vi8WWiC4LnwRrldx75L3wX1+nRbU29qZ
	 v3QkQzbvtUySII7TaYz1UHDjhJQkChFLHNE6ze/8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2A2DFF800C0;
	Fri,  6 Jan 2023 08:51:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 77EDCF802DB; Fri,  6 Jan 2023 08:51:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
 RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no
 autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 56F72F8032D
 for <alsa-devel@alsa-project.org>; Fri,  6 Jan 2023 08:51:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 56F72F8032D
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=h9qSkZ/l
Received: by mail-wm1-x32f.google.com with SMTP id
 p1-20020a05600c1d8100b003d8c9b191e0so534219wms.4
 for <alsa-devel@alsa-project.org>; Thu, 05 Jan 2023 23:51:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
 :to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=y3pRAKha/wzSEcfkkP+wItKC8O2T26cp8rC+a7a/8wE=;
 b=h9qSkZ/lNKRn0GoqXqd51msXoaLrhePp2jwrns+8ZIarLWUXHUwUV7U7LIyPrBy7v0
 v9wQc3vTiWWsrgCRL7y8HGQIHKGe/Jm6pJhOAK6jZckbKoRBQasG3sI6yO8IwdUIy5Ex
 bsErb0FzMDhrZmcqHNsenITTPcBCotVeDqOrCti6GYWann/B8rp8iIkn695yTB0560v8
 IIhH1KMWSqkkc6GPTk39BbA8lTePWJApzDUjpL8LLB3INak3SBgQVZ6y4tDhUpGn58p5
 zmB1C0yNPAh6YwWhVAM7rPsWPrld8ZWG1RIV8YESKDYFlG/Ka7DzlesV6inKaI1BSoQS
 jN4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
 :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=y3pRAKha/wzSEcfkkP+wItKC8O2T26cp8rC+a7a/8wE=;
 b=YfD0OSqrSvSvmMRBK6EvuevJmFizP83ahajz/u2XrvGuC95+R/6awyH7adebKn37T4
 NvEXxryW9WawuNNwI9vuNyBBzgG4Oaiekmw/NxKIP02s8Vaoh5wPazwblAlP4AowQwWt
 Rr/+XlC5Zm+SkRi4yl5ACVy6J/ynQ0B5KIrkD6DylGmmh4TLaGhpmQV6WPdSk7CRI2j/
 6itOcVpi69q+p93X3FmzgbWafOGb0dbwesIPllk5XRPJZYHSV2ZSqQE6zvTZ2mmna0gv
 KbuxXCKiDpa/6oqiIhMa/QFr/ntq9sO8rOfdCHj7fBCS84HNKcR9/3607xnhKjrxuy92
 cjag==
X-Gm-Message-State: AFqh2koLlO6I6W5RUou3nD8IhpReQhxQ2TaV9I6I2nih0zud8NIgde7Y
 tCVdw4yg9/WgqrXgLLGMVlI=
X-Google-Smtp-Source: AMrXdXu6TTTYGLa+SILLMKWwpOWZZYNwmyzupE2o6wzTTk3OqigAVRTAyV6CyW8n+m7PZJRemMcT7w==
X-Received: by 2002:a05:600c:6020:b0:3d1:f0b4:8827 with SMTP id
 az32-20020a05600c602000b003d1f0b48827mr38023700wmb.25.1672991497451; 
 Thu, 05 Jan 2023 23:51:37 -0800 (PST)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 h10-20020a1ccc0a000000b003d237d60318sm780111wmb.2.2023.01.05.23.51.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 23:51:36 -0800 (PST)
Date: Fri, 6 Jan 2023 10:51:30 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Kiseok Jo <kiseok.jo@irondevice.com>,
 Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 3/3] ASOC: sma1303: change the overall contents
Message-ID: <202301060752.Z9ahR5KX-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230104064342.2094-4-kiseok.jo@irondevice.com>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Kiseok Jo <kiseok.jo@irondevice.com>, alsa-devel@alsa-project.org,
 lkp@intel.com, application@irondevice.com, oe-kbuild-all@lists.linux.dev
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi Kiseok,

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kiseok-Jo/ASoC-sma1303-Add-driver-for-Iron-Device-SMA1303-Amp/20230104-150052
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/20230104064342.2094-4-kiseok.jo%40irondevice.com
patch subject: [PATCH 3/3] ASOC: sma1303: change the overall contents
config: ia64-randconfig-m041-20230101
compiler: ia64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>

smatch warnings:
sound/soc/codecs/sma1303.c:257 sma1303_regmap_write() error: uninitialized symbol 'ret'.
sound/soc/codecs/sma1303.c:275 sma1303_regmap_update_bits() error: uninitialized symbol 'ret'.
sound/soc/codecs/sma1303.c:293 sma1303_regmap_read() error: uninitialized symbol 'ret'.
sound/soc/codecs/sma1303.c:684 sma1303_add_component_controls() error: not allocating enough for = 'name' 8 vs 3
	(This should allocate sizeof() not ARRAY_SIZE()).
sound/soc/codecs/sma1303.c:1539 sma1303_i2c_probe() warn: unsigned 'value' is never less than zero.

vim +/ret +257 sound/soc/codecs/sma1303.c

287cf116194f9c Kiseok Jo 2023-01-04  242  static int sma1303_regmap_write(struct sma1303_priv *sma1303,
0b15568ccfb962 Kiseok Jo 2023-01-04  243  				unsigned int reg, unsigned int val)
0b15568ccfb962 Kiseok Jo 2023-01-04  244  {
287cf116194f9c Kiseok Jo 2023-01-04  245  	int ret;
287cf116194f9c Kiseok Jo 2023-01-04  246  	int cnt = sma1303->retry_cnt;
0b15568ccfb962 Kiseok Jo 2023-01-04  247  
287cf116194f9c Kiseok Jo 2023-01-04  248  	while (cnt--) {

The way I look at it, you need three bugs for this to affect real life:

BUG 1: sma1303_regmap_write() is not written robustly (this warning).
BUG 2: sma1303_i2c_probe() allows sma1303->retry_cnt of zero (it does).
BUG 3: The i2c-retry_count is set to zero.  (Probably not but also not
       unimaginable).

So, yeah, let's fix BUG 2 because retry_cnt of zero is bogus.

                if (!of_property_read_u32(np, "i2c-retry_count", &value)) {
-                        if (value > 50 || value < 0) {
+                        if (value > 50 || value <= 0) {
                                sma1303->retry_cnt = SMA1303_I2C_RETRY_COUNT;

And BUG 1 to make the checker happy.

-  	int ret;
+  	int ret = -EINVAL;

287cf116194f9c Kiseok Jo 2023-01-04  249  		ret = regmap_write(sma1303->regmap, reg, val);
0b15568ccfb962 Kiseok Jo 2023-01-04  250  		if (ret < 0) {
287cf116194f9c Kiseok Jo 2023-01-04  251  			dev_err(sma1303->dev, "Failed to write [0x%02X]\n", reg);
287cf116194f9c Kiseok Jo 2023-01-04  252  			if (gCallback.set_i2c_err)
287cf116194f9c Kiseok Jo 2023-01-04  253  				gCallback.set_i2c_err(sma1303->dev, ret);
287cf116194f9c Kiseok Jo 2023-01-04  254  		} else
287cf116194f9c Kiseok Jo 2023-01-04  255  			break;
0b15568ccfb962 Kiseok Jo 2023-01-04  256  	}
0b15568ccfb962 Kiseok Jo 2023-01-04 @257  	return ret;
0b15568ccfb962 Kiseok Jo 2023-01-04  258  }
0b15568ccfb962 Kiseok Jo 2023-01-04  259  
287cf116194f9c Kiseok Jo 2023-01-04  260  static int sma1303_regmap_update_bits(struct sma1303_priv *sma1303,
0b15568ccfb962 Kiseok Jo 2023-01-04  261  		unsigned int reg, unsigned int mask, unsigned int val)
0b15568ccfb962 Kiseok Jo 2023-01-04  262  {
287cf116194f9c Kiseok Jo 2023-01-04  263  	int ret;
287cf116194f9c Kiseok Jo 2023-01-04  264  	int cnt = sma1303->retry_cnt;
0b15568ccfb962 Kiseok Jo 2023-01-04  265  
287cf116194f9c Kiseok Jo 2023-01-04  266  	while (cnt--) {
287cf116194f9c Kiseok Jo 2023-01-04  267  		ret = regmap_update_bits(sma1303->regmap, reg, mask, val);
0b15568ccfb962 Kiseok Jo 2023-01-04  268  		if (ret < 0) {
287cf116194f9c Kiseok Jo 2023-01-04  269  			dev_err(sma1303->dev, "Failed to update [0x%02X]\n", reg);
287cf116194f9c Kiseok Jo 2023-01-04  270  			if (gCallback.set_i2c_err)
287cf116194f9c Kiseok Jo 2023-01-04  271  				gCallback.set_i2c_err(sma1303->dev, ret);
287cf116194f9c Kiseok Jo 2023-01-04  272  		} else
287cf116194f9c Kiseok Jo 2023-01-04  273  			break;
0b15568ccfb962 Kiseok Jo 2023-01-04  274  	}
0b15568ccfb962 Kiseok Jo 2023-01-04 @275  	return ret;
0b15568ccfb962 Kiseok Jo 2023-01-04  276  }
0b15568ccfb962 Kiseok Jo 2023-01-04  277  
287cf116194f9c Kiseok Jo 2023-01-04  278  static int sma1303_regmap_read(struct sma1303_priv *sma1303,
287cf116194f9c Kiseok Jo 2023-01-04  279  		unsigned int reg, unsigned int *val)
0b15568ccfb962 Kiseok Jo 2023-01-04  280  {
287cf116194f9c Kiseok Jo 2023-01-04  281  	int ret;
287cf116194f9c Kiseok Jo 2023-01-04  282  	int cnt = sma1303->retry_cnt;
0b15568ccfb962 Kiseok Jo 2023-01-04  283  
287cf116194f9c Kiseok Jo 2023-01-04  284  	while (cnt--) {
287cf116194f9c Kiseok Jo 2023-01-04  285  		ret = regmap_read(sma1303->regmap, reg, val);
0b15568ccfb962 Kiseok Jo 2023-01-04  286  		if (ret < 0) {
287cf116194f9c Kiseok Jo 2023-01-04  287  			dev_err(sma1303->dev, "Failed to read [0x%02X]\n", reg);
287cf116194f9c Kiseok Jo 2023-01-04  288  			if (gCallback.set_i2c_err)
287cf116194f9c Kiseok Jo 2023-01-04  289  				gCallback.set_i2c_err(sma1303->dev, ret);
287cf116194f9c Kiseok Jo 2023-01-04  290  		} else
287cf116194f9c Kiseok Jo 2023-01-04  291  			break;
0b15568ccfb962 Kiseok Jo 2023-01-04  292  	}
287cf116194f9c Kiseok Jo 2023-01-04 @293  	return ret;
0b15568ccfb962 Kiseok Jo 2023-01-04  294  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

