Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 03C4E65FE17
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Jan 2023 10:37:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E9287E2C6;
	Fri,  6 Jan 2023 10:36:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E9287E2C6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672997838;
	bh=+NyFbFwd34DatyY7yZ6dcCeDYbhRJg8RLeAlUsbp1CA=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=urhB/x62SbxP2QmZ5D463kbfxsl4KPvHXQmSrcy30DqK2utU+cDgGYXzRPYldiJ/x
	 s79pCzeDpw1FXtQgtH4epyJWj5Qx7DoOxCK+9Pdt9c8H1Jo1MO0R8cK9fwlDTUJwE5
	 CQYc8z/GcgDo9mVQh6EC+QxGDTUn+7uexFbdiXds=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EEA57F8024E;
	Fri,  6 Jan 2023 10:36:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1CCFFF8024E; Fri,  6 Jan 2023 10:36:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
 RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9FD2BF800C0
 for <alsa-devel@alsa-project.org>; Fri,  6 Jan 2023 10:36:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9FD2BF800C0
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=TVLkgSuY
Received: by mail-wr1-x429.google.com with SMTP id d17so768972wrs.2
 for <alsa-devel@alsa-project.org>; Fri, 06 Jan 2023 01:36:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fcim/GWWe/+q9J0gSv4vTjrEQLLQwPqNkvMOb72MU5U=;
 b=TVLkgSuYpM/xeDlRB1uN1hG9xyD3Iwu9YakAra45VU2v30Vvwa1O2YemiY8mGYE/Xg
 y3hMe5m+Yhzsr1XvGuTjSh/pMObQLxCuyrfmz6KkPNgKjRL7Zrpaq3VtqZzsqfB0jWya
 Ya08Q5HU8uuXMKouX40hnXMzr29Ig6C9CwSnWyrmfGoxqXTPMD/FfKXWxzyRsr5htWMN
 thnhG/KrCnZqCmodCvc4JKIUmW/8KLjZARdOldXntCcslsxJRykfiTRN03YcgZim0fkR
 osPgN/Fu48sk9n+CVqbNP2+F9QuBJIR7VXjYEVNAJsrAGEliRjnmcIPmQMRZsUKrfXCY
 ZAbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fcim/GWWe/+q9J0gSv4vTjrEQLLQwPqNkvMOb72MU5U=;
 b=tEd4iZtVF6OfUSFeqzScd+Sm7YIOYVDX7paw1sQSTdByyxOwcvHFO74IyuO0npQgcW
 o9WpeYuyX/PJJQ/Ol5QEvQALUDieIbZzuwHzClxS/AFYR2YFoXY1aOsFwFPIEa71eCRT
 29LSBg6GowFqnaJG55lRh39isl+kmXY3aTYE+iTJbBJSrB1zkQI2RstwwAcM1v1RrHr9
 LiS7q7qkJ/uIRJc5Ce/I2kJN5bZsvhHnTYK83RYPxio5d8HYVOq5xv90Pw8ylexfNozw
 Fly1MDalg+wHai2r6nzArECxO9a3jhMtqy7ax0YiATJZkBr6fLuVi09m+11aCUX3ouum
 HkVw==
X-Gm-Message-State: AFqh2kq0OEkP/REfZmjeAG0aBgm6wgw1cbudMB1Xtl/AXNAejCl7ki/7
 0F63qS/ju/9aD5OEJhPPBheOTc53G7VcFg==
X-Google-Smtp-Source: AMrXdXvGW9zQPp25GXT7AldUMz+tu1KDOLXVovuEyFHbAEK0hbGZ2dcTSYvhAsgcK/khCR6FdHwv/g==
X-Received: by 2002:a5d:4e83:0:b0:29f:b589:158d with SMTP id
 e3-20020a5d4e83000000b0029fb589158dmr7559543wru.48.1672997770757; 
 Fri, 06 Jan 2023 01:36:10 -0800 (PST)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 f14-20020adff58e000000b00241fea203b6sm624012wro.87.2023.01.06.01.36.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Jan 2023 01:36:10 -0800 (PST)
Date: Fri, 6 Jan 2023 12:35:59 +0300
From: Dan Carpenter <error27@gmail.com>
To: perex@perex.cz
Subject: [bug report] ALSA: usb-audio: Add new quirk FIXED_RATE for JBL
 Quantum810 Wireless
Message-ID: <Y7frf3N/xzvESEsN@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Cc: alsa-devel@alsa-project.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hello Jaroslav Kysela,

The patch fd28941cff1c: "ALSA: usb-audio: Add new quirk FIXED_RATE
for JBL Quantum810 Wireless" from Dec 15, 2022, leads to the
following Smatch static checker warning:

	sound/usb/pcm.c:543 snd_usb_hw_params()
	error: uninitialized symbol 'sync_fixed_rate'.

sound/usb/pcm.c
    471 static int snd_usb_hw_params(struct snd_pcm_substream *substream,
    472                              struct snd_pcm_hw_params *hw_params)
    473 {
    474         struct snd_usb_substream *subs = substream->runtime->private_data;
    475         struct snd_usb_audio *chip = subs->stream->chip;
    476         const struct audioformat *fmt;
    477         const struct audioformat *sync_fmt;
    478         bool fixed_rate, sync_fixed_rate;
    479         int ret;
    480 
    481         ret = snd_media_start_pipeline(subs);
    482         if (ret)
    483                 return ret;
    484 
    485         fixed_rate = snd_usb_pcm_has_fixed_rate(subs);
    486         fmt = find_substream_format(subs, hw_params);
    487         if (!fmt) {
    488                 usb_audio_dbg(chip,
    489                               "cannot find format: format=%s, rate=%d, channels=%d\n",
    490                               snd_pcm_format_name(params_format(hw_params)),
    491                               params_rate(hw_params), params_channels(hw_params));
    492                 ret = -EINVAL;
    493                 goto stop_pipeline;
    494         }
    495 
    496         if (fmt->implicit_fb) {
    497                 sync_fmt = snd_usb_find_implicit_fb_sync_format(chip, fmt,
    498                                                                 hw_params,
    499                                                                 !substream->stream,
    500                                                                 &sync_fixed_rate);

"sync_fixed_rate" is uninitialized when we "Use the original audioformat
as fallback for the shared altset" and find_matching_substream() returns
NULL.

    501                 if (!sync_fmt) {
    502                         usb_audio_dbg(chip,
    503                                       "cannot find sync format: ep=0x%x, iface=%d:%d, format=%s, rate=%d, channels=%d\n",
    504                                       fmt->sync_ep, fmt->sync_iface,
    505                                       fmt->sync_altsetting,
    506                                       snd_pcm_format_name(params_format(hw_params)),
    507                                       params_rate(hw_params), params_channels(hw_params));
    508                         ret = -EINVAL;
    509                         goto stop_pipeline;
    510                 }
    511         } else {
    512                 sync_fmt = fmt;
    513                 sync_fixed_rate = fixed_rate;
    514         }
    515 
    516         ret = snd_usb_lock_shutdown(chip);
    517         if (ret < 0)
    518                 goto stop_pipeline;
    519 
    520         ret = snd_usb_pcm_change_state(subs, UAC3_PD_STATE_D0);
    521         if (ret < 0)
    522                 goto unlock;
    523 
    524         if (subs->data_endpoint) {
    525                 if (snd_usb_endpoint_compatible(chip, subs->data_endpoint,
    526                                                 fmt, hw_params))
    527                         goto unlock;
    528                 if (stop_endpoints(subs, false))
    529                         sync_pending_stops(subs);
    530                 close_endpoints(chip, subs);
    531         }
    532 
    533         subs->data_endpoint = snd_usb_endpoint_open(chip, fmt, hw_params, false, fixed_rate);
    534         if (!subs->data_endpoint) {
    535                 ret = -EINVAL;
    536                 goto unlock;
    537         }
    538 
    539         if (fmt->sync_ep) {
    540                 subs->sync_endpoint = snd_usb_endpoint_open(chip, sync_fmt,
    541                                                             hw_params,
    542                                                             fmt == sync_fmt,
--> 543                                                             sync_fixed_rate);
    544                 if (!subs->sync_endpoint) {
    545                         ret = -EINVAL;
    546                         goto unlock;
    547                 }

regards,
dan carpenter
