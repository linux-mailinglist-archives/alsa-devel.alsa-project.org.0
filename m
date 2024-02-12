Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 03FA9851D5A
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Feb 2024 19:52:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A13CB1E2;
	Mon, 12 Feb 2024 19:52:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A13CB1E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707763955;
	bh=GTS3knEn3U37SHf/wqemlrktyAqbrDzvlYNJt5L8bzg=;
	h=From:Date:To:Cc:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=MOwUXebjoLFDeBHVAZAb8sg/6NSX5lnpkmFFfK0RlxdM74pa4t1EYzoyNJXb/IUTN
	 r21XDXVPaE/8Oxpa1QMqD1OuHojHRWLr5AEaRSRuZ2xjJYfigSqghy0jgRFFbfqGYG
	 NUnhHFdeC8TP/bYWCTGOgSikcZUxCSYJCUdPVO28=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9845AF805A9; Mon, 12 Feb 2024 19:52:04 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 077B4F805A0;
	Mon, 12 Feb 2024 19:52:04 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EFAD4F80238; Mon, 12 Feb 2024 19:51:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1CB63F800BF
	for <alsa-devel@alsa-project.org>; Mon, 12 Feb 2024 19:51:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1CB63F800BF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=KHVw/Azz
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-1d94323d547so30757325ad.3
        for <alsa-devel@alsa-project.org>;
 Mon, 12 Feb 2024 10:51:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1707763911; x=1708368711;
 darn=alsa-project.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:date:from
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mPGSiRqCPFqmFEWSJFO1d43GTTlaRz0f+e2eVAoQklI=;
        b=KHVw/Azzu5REHXcTdjc9fzmC4f3SWF3QGibq2VB6k0QRJehTkoOBi/jlxyrUrOLnNw
         M+i4jPPAaOvCf8vtjmrG1wKbrwZkTrwakwl+brpDLykul3Xi8wErydfNlQDx+CFgMXE0
         Zx4WRpe8kxN933ha3+m9dSep+hCrOOziMKMoc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707763911; x=1708368711;
        h=content-disposition:mime-version:message-id:subject:cc:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mPGSiRqCPFqmFEWSJFO1d43GTTlaRz0f+e2eVAoQklI=;
        b=TFheY4fLCPhhsbIQBBZFgFgVWZ+VQ8Z5F98DF+5uNoZU1Ghz1/V0/HySYA9C5+UDJ+
         dn5a+0gYATbg1rgxBc3TMZpP2LgsQRH7vi8ENq0T1dWHPjp63Gb8dycWXSM0nTBPxtFj
         nfJCpFj5SM4rck9JOb5VyIC5QLc58q9lguiHX8iubJxmxf8WcmDQ2pom5unfkCOcZc1S
         c3FbAGGGfPBG0kuN1E2P98p99x4wuB/P2eET+kUFYCqAkdl38fWlodwf3qv/qOk4mLGK
         pIrWVmjqBRjF4dfz+SZbTodW0sJx5tW1bQzRkVEdIUqHhm0WtQktODy+LS7+aw2B2pVV
         TBkQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWFw2uW8bHCBLHYL5L18MArtVtQhIadDgtWwxFTDffC4DIkL5c2MEsAjVCPoRxf2nSZq86tqVu4miuCH2M6PjA/pc9gr1mg7cKwAYo=
X-Gm-Message-State: AOJu0YzArMLX9pbYRkRwJztlHNAQ9xxkqGPxAAEspu/Jlxf1X47pd2Wa
	zgkXMijLSPN1Nk1WcCOCKpkqMfmqn9/Hn6XChsyv4AtmtUNHpAfEJ6tiqrgbKa0c7HdV2/ZifV0
	=
X-Google-Smtp-Source: 
 AGHT+IFiP4XqEVFPUe0AQ5sfHfutAVORBuy6ctbchagD56aaWb7k8kuXps4xMsVwiJ9ZHG46ydaEYA==
X-Received: by 2002:a17:902:e5c7:b0:1d9:a647:5579 with SMTP id
 u7-20020a170902e5c700b001d9a6475579mr5817557plf.1.1707763911196;
        Mon, 12 Feb 2024 10:51:51 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWVMXpMNIhotAYcYiqvNVCkUE02lF5spebU9llp4fc83Uutkz2jejMC03XmEIikgbWSldV5H3FNfAtE/6Jgii8cDrbgJCUgH3FC06zl/KgIj9f0r9uzQf62jhBRN7BKOi1tZOnRyWmjtO7PY6+GSekpCARKo/B9UBpkn+azS/Cmmzi9TXICwENuOXYbDsVLW+aNl5BNyMY3j4f4tfwfGghjhJcNsUZ6UbcCDRZwnBmZD5vN27Xpt2chVq15/1Tj6eg7VCkbJz8orDtPaf0/GidfJtGvk+NZZPo9yUI35lJxR138j6xF646MPyb2DcV92qgf2IShUDlLrbaOWviiuXiOzIENe3ZZ1bXgGWRrVUEl1L12s9CLURo4SeY620eR/lcDl2m//IprO4DY6HkY9R14CW6xhIJkrV47ecHxKR84yndQsDXM3NJqMcpiu4M6Y+P8kbk2+ZWg8t1RBE4uXWXtDWTxFaVA9585IKWuec4srYj5WnES1gkpMYxVgbudrRnPzxYH+H7a4hODicJw9+ImmaeqZYgOPYsAmQk=
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id
 u11-20020a170903308b00b001d9fa58f5a4sm675012plc.48.2024.02.12.10.51.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Feb 2024 10:51:50 -0800 (PST)
From: coverity-bot <keescook@chromium.org>
X-Google-Original-From: coverity-bot <keescook+coverity-bot@chromium.org>
Date: Mon, 12 Feb 2024 10:51:50 -0800
To: Anton Yakovlev <anton.yakovlev@opensynergy.com>
Cc: Jason Wang <jasowang@redhat.com>, Takashi Iwai <tiwai@suse.de>,
	Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
	virtualization@lists.linux.dev, Jaroslav Kysela <perex@perex.cz>,
	alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
	Aiswarya Cyriac <aiswarya.cyriac@opensynergy.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	"Gustavo A. R. Silva" <gustavo@embeddedor.com>,
	linux-next@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Coverity: virtsnd_kctl_tlv_op(): Uninitialized variables
Message-ID: <202402121051.B091CCC4B@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID-Hash: B4T5NJKI4J3JNIZQM5PE7IVDF653MQD2
X-Message-ID-Hash: B4T5NJKI4J3JNIZQM5PE7IVDF653MQD2
X-MailFrom: keescook@chromium.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/B4T5NJKI4J3JNIZQM5PE7IVDF653MQD2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hello!

This is an experimental semi-automated report about issues detected by
Coverity from a scan of next-20240212 as part of the linux-next scan project:
https://scan.coverity.com/projects/linux-next-weekly-scan

You're getting this email because you were associated with the identified
lines of code (noted below) that were touched by commits:

  Fri Feb 9 14:01:15 2024 +0100
    d6568e3de42d ("ALSA: virtio: add support for audio controls")

Coverity reported the following:

*** CID 1583619:  Uninitialized variables  (UNINIT)
sound/virtio/virtio_kctl.c:294 in virtsnd_kctl_tlv_op()
288
289     		break;
290     	}
291
292     	kfree(tlv);
293
vvv     CID 1583619:  Uninitialized variables  (UNINIT)
vvv     Using uninitialized value "rc".
294     	return rc;
295     }
296
297     /**
298      * virtsnd_kctl_get_enum_items() - Query items for the ENUMERATED element type.
299      * @snd: VirtIO sound device.

If this is a false positive, please let us know so we can mark it as
such, or teach the Coverity rules to be smarter. If not, please make
sure fixes get into linux-next. :) For patches fixing this, please
include these lines (but double-check the "Fixes" first):

Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
Addresses-Coverity-ID: 1583619 ("Uninitialized variables")
Fixes: d6568e3de42d ("ALSA: virtio: add support for audio controls")

Thanks for your attention!

(Human comment: looks like there's no "default" case in the switch
statement.)

-- 
Coverity-bot
