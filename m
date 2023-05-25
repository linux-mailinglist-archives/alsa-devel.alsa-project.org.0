Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AB6257125D2
	for <lists+alsa-devel@lfdr.de>; Fri, 26 May 2023 13:46:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 135A3206;
	Fri, 26 May 2023 13:45:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 135A3206
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685101566;
	bh=vgG8kRbhQf6vPQAWhe7I0iMwxujg2aFZfFNABg8RBnc=;
	h=Date:From:To:Cc:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Ks3klxfNsSdxinZRHUIriiIPYdLkgzhfiaXM9YZ+DH6Aj0Fe3tIwP+9Sn+h4smMt3
	 plI3HkdbhghvxjByO8svqSmVBiWzNVZkzXH24c2ipj9cSaYq6KYnr2/wTLg21uUAh8
	 Zhv7YfTcNcOe+XVS+O7UP/CmxPoKfrULMbd4oaeg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 08788F805D5; Fri, 26 May 2023 13:43:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 486FBF8058C;
	Fri, 26 May 2023 13:43:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2AD83F80007; Thu, 25 May 2023 10:00:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6099EF80007
	for <alsa-devel@alsa-project.org>; Thu, 25 May 2023 10:00:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6099EF80007
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=uOOoGCe2
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-3f606a80d34so2003845e9.0
        for <alsa-devel@alsa-project.org>;
 Thu, 25 May 2023 01:00:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685001615; x=1687593615;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gWA2hFNdK5GzZoFmwlA1f9qkQkbSpHPZqFW4w1b1GmE=;
        b=uOOoGCe2oAUtaYJs9RVWlm/uUC24fSiSeA1cmxT3BdARVgaY2ZJ7sRvMB2lG5nwZbF
         pljLy0ru1y1VwLesFOI4lkJIvTx9MT0KAY6lOq3PPmbmQKmGG09tXzmpwtP1Oucjxvyq
         hC9gI8VjNDxTHf5BnS6ocOultyCzinteysbSmc+I35a+y0/oY/cx1yeGeARpE+8R+2Ax
         sVADBrvQ7UY5YvbNv+RDMqsrxTVH3kYggFlUWFlWn8gOOixIx8CQRMQb+bUMGX2mElBS
         d+ek6ykO+NtF/USLWo7Qt89q8hLhYuH5zzFwm8Fy4aKd3TIzt6dkNvHyzpocKSjzXdYd
         rPzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685001615; x=1687593615;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gWA2hFNdK5GzZoFmwlA1f9qkQkbSpHPZqFW4w1b1GmE=;
        b=V+TKYEwbG1vrUNdAbCRWiG16+yS0pkq+3tNfy8cdBP6IWrk1O+XWn3QQEHMujPnkM6
         ck2dkulmphWh79aUX7g6rVW3bLxyvv5cs0QpOvp78zRO4wuhYgqjIfYj8zhDphYGo56v
         BIyDVJ451Y99Se1RvDtNxy/yo6kzgLyF8ddvnL14OH7FSe8Op1s6FTYxpvC0xz/vGcV1
         OCbmp1EuCcbLJOuN1dFlE4sCNs3T7SmFuiUQalQ4EUBrVrasjM51fo0viQe9KzNNGZm/
         gaIGaIVjpS0+v11KHuAKFbXYfgIygOQvjLgf2k9jomU+oGfKl4Uq6RzZV3HfxoqLOuso
         xbew==
X-Gm-Message-State: AC+VfDz4DUodn/7HJlAnJw2qq40VO7gsdVAkNac86ZksWbey9XeFQ+bP
	gHiUQyyZoYxToiRhOQTmavbdEA==
X-Google-Smtp-Source: 
 ACHHUZ4a55sghU/vdd07TRY1xaEdq0OWOK95Wo0G5S5fGKsV7fJcHSmAAmTEJ8noNZebytP2TaKfWQ==
X-Received: by 2002:a05:600c:c5:b0:3f6:795:6d1a with SMTP id
 u5-20020a05600c00c500b003f607956d1amr1907259wmm.22.1685001614735;
        Thu, 25 May 2023 01:00:14 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id
 k15-20020a05600c0b4f00b003f611b2aedesm1152139wmr.38.2023.05.25.01.00.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 May 2023 01:00:13 -0700 (PDT)
Date: Thu, 25 May 2023 11:00:10 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: tiwai@suse.de
Cc: alsa-devel@alsa-project.org
Subject: [bug report] ALSA: ump: Add legacy raw MIDI support
Message-ID: <0fbc0b27-54b8-4cda-800e-37e7a03fed39@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-MailFrom: dan.carpenter@linaro.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: JEPLHTUBNCJWWNMZT5AB4VCRT2UBJWCH
X-Message-ID-Hash: JEPLHTUBNCJWWNMZT5AB4VCRT2UBJWCH
X-Mailman-Approved-At: Fri, 26 May 2023 11:43:42 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JEPLHTUBNCJWWNMZT5AB4VCRT2UBJWCH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hello Takashi Iwai,

The patch 0b5288f5fe63: "ALSA: ump: Add legacy raw MIDI support" from
May 23, 2023, leads to the following Smatch static checker warning:

	sound/core/ump_convert.c:460 do_convert_to_ump()
	warn: right shifting more than type allows 8 vs 8

sound/core/ump_convert.c
    419 static int do_convert_to_ump(struct snd_ump_endpoint *ump,
    420                              unsigned char group, unsigned char c, u32 *data)
    421 {
    422         /* bytes for 0x80-0xf0 */
    423         static unsigned char cmd_bytes[8] = {
    424                 3, 3, 3, 3, 2, 2, 3, 0
    425         };
    426         /* bytes for 0xf0-0xff */
    427         static unsigned char system_bytes[16] = {
    428                 0, 2, 3, 2, 0, 0, 1, 0, 1, 1, 1, 1, 0, 0, 1, 1
    429         };
    430         struct ump_cvt_to_ump *cvt = &ump->out_cvts[group];
    431         unsigned char bytes;
    432 
    433         if (c == UMP_MIDI1_MSG_SYSEX_START) {
    434                 cvt->in_sysex = 1;
    435                 cvt->len = 0;
    436                 return 0;
    437         }
    438         if (c == UMP_MIDI1_MSG_SYSEX_END) {
    439                 if (!cvt->in_sysex)
    440                         return 0; /* skip */
    441                 return cvt_legacy_sysex_to_ump(cvt, group, data, true);
    442         }
    443 
    444         if ((c & 0xf0) == UMP_MIDI1_MSG_REALTIME) {
    445                 bytes = system_bytes[c & 0x0f];
    446                 if (!bytes)
    447                         return 0; /* skip */
    448                 if (bytes == 1) {
    449                         data[0] = ump_compose(UMP_MSG_TYPE_SYSTEM, group, 0, c);
    450                         return 4;
    451                 }
    452                 cvt->buf[0] = c;
    453                 cvt->len = 1;
    454                 cvt->cmd_bytes = bytes;
    455                 cvt->in_sysex = 0; /* abort SysEx */
    456                 return 0;
    457         }
    458 
    459         if (c & 0x80) {
--> 460                 bytes = cmd_bytes[(c >> 8) & 7];
                                           ^^^^^^
Based on the if statement, it looks like c >> 4 was intended.

    461                 cvt->buf[0] = c;
    462                 cvt->len = 1;
    463                 cvt->cmd_bytes = bytes;
    464                 cvt->in_sysex = 0; /* abort SysEx */
    465                 return 0;
    466         }
    467 
    468         if (cvt->in_sysex) {
    469                 cvt->buf[cvt->len++] = c;
    470                 if (cvt->len == 6)
    471                         return cvt_legacy_sysex_to_ump(cvt, group, data, false);
    472                 return 0;
    473         }
    474 
    475         if (!cvt->len)
    476                 return 0;
    477 
    478         cvt->buf[cvt->len++] = c;
    479         if (cvt->len < cvt->cmd_bytes)
    480                 return 0;
    481         cvt->len = 1;
    482         if ((cvt->buf[0] & 0xf0) == UMP_MIDI1_MSG_REALTIME)
    483                 return cvt_legacy_system_to_ump(cvt, group, data);
    484         return cvt_legacy_cmd_to_ump(ump, cvt, group, data, cvt->cmd_bytes);
    485 }

regards,
dan carpenter
