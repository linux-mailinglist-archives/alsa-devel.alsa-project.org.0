Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F68B7E064F
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Nov 2023 17:22:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 965FEE85;
	Fri,  3 Nov 2023 17:21:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 965FEE85
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1699028543;
	bh=ZmopjVX/XnMveCj1kUkjKgN/o2U+0IT7sxlJXjVjVAw=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Gv/UGoqBxdKhDnvLKqnbY5pRrpP158BNfo2noVRthvOt6SMTTNYH8tak6ppmcJ45z
	 y7m66/V5xqPc4pUZHmZVvDSyJLcELCdmss0bdCDH43D2huerqdU0tIrcAFCBZhI1eC
	 cAx1o2DfscPJe23esmhGrLSh7BBjq4+9xMsxQ28g=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C5554F80571; Fri,  3 Nov 2023 17:20:12 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 62BD7F80568;
	Fri,  3 Nov 2023 17:20:12 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 550EEF8019B; Sat, 28 Oct 2023 04:37:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com
 [IPv6:2607:f8b0:4864:20::72d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 42F95F8012B
	for <alsa-devel@alsa-project.org>; Sat, 28 Oct 2023 04:37:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 42F95F8012B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=l61IHzbN
Received: by mail-qk1-x72d.google.com with SMTP id
 af79cd13be357-777745f1541so212197085a.0
        for <alsa-devel@alsa-project.org>;
 Fri, 27 Oct 2023 19:37:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698460659; x=1699065459;
 darn=alsa-project.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ZmopjVX/XnMveCj1kUkjKgN/o2U+0IT7sxlJXjVjVAw=;
        b=l61IHzbNZAyVUa6sIyBHp36pabEl/62mTY60hzAjqJKOD0zllWwsV5+6c9vam0Dd8i
         p2vMyFmxddDxTZrk95RCAgR3LmBPqsJVD/r6zIk2BZywqirGsLzaQKsBoo4Spl/M94my
         pPWAjZMYv+8hYbCSTj7eRzgdhHtkmd+5+wgKnxD5vckD0BftM0x3fYsc+JMDzHcplcps
         0qZBL8waULMHx3l9CxdzLZFUzBJ0tl6Qo5f3wcW6FembNha6ISHS5v4QMyl4/g8HVd47
         WYp/SKR0FBMGQSotmCQwPyRtJhGDGeI4nQbwTnZJI+NhXBryrLbtRoU/dTBK9A5kl4MH
         GLmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698460659; x=1699065459;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZmopjVX/XnMveCj1kUkjKgN/o2U+0IT7sxlJXjVjVAw=;
        b=P7ddKb2qUpDTTXbPLkVgg47kqo2AQo/36KEV3ckVLcB2ZudmOhVCk5PfffgCMWwhgH
         MpKaJqcFgLzlvWUKB54v3t1ixnfGQ8r9LSJFACynhiIqInCk6c0CmQEuQoEdzGxbMm88
         mlfpfBnnhM7kb37IOqc0/yFdVl5AYfRRzc5Fb9a1HO+a1VasRPX0gAzuyOynyg4zs0zW
         JfXtr6/TZ0HWFUtMwbFK0ylS5KJykNrHurrMGFS7m89fs/81C31fZRLkup6g4c732wQk
         iH8HOjYUaDpsBSvydKlyG31C1pP0uxRQZH7u+npFnJsHy3dicCgyUMuiC+ZB3rEJPPn+
         OVvA==
X-Gm-Message-State: AOJu0Yzw+eKkaVA8CJIirRz9gH+J3rXAbBELyyfQz6OfNmW4MKpsKmUN
	J+rwKx228j6kIcp/inzWuFY=
X-Google-Smtp-Source: 
 AGHT+IGuBfFDwAPMsAVNNZLgHnrWCCC8tdDHFKtVJ4SLTJ7Jf3niEnItXEIjYBeSM4CIZdmNToPzxg==
X-Received: by 2002:a05:620a:270c:b0:778:abb7:5cc with SMTP id
 b12-20020a05620a270c00b00778abb705ccmr4111001qkp.25.1698460658984;
        Fri, 27 Oct 2023 19:37:38 -0700 (PDT)
Received: from [10.0.0.218] (162-238-114-46.lightspeed.stlsmo.sbcglobal.net.
 [162.238.114.46])
        by smtp.gmail.com with ESMTPSA id
 bp43-20020a05620a45ab00b0076db1caab16sm1136392qkb.22.2023.10.27.19.37.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Oct 2023 19:37:38 -0700 (PDT)
Message-ID: <c36c2c196670a36f32cc776869e91f710c237400.camel@gmail.com>
Subject: Re: [PATCH] patch_realtek: Splitting the UX3402 into two separate
 models.
From: pizFunk <mmpisoni@gmail.com>
To: poseaydone@ya.ru, Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.com>, "Luke D. Jones" <luke@ljones.dev>, Stefan
 Binding <sbinding@opensource.cirrus.com>, Andy Chi
 <andy.chi@canonical.com>, Shenghao Ding <shenghao-ding@ti.com>, Matthew
 Anderson <ruinairas1992@gmail.com>, Luka Guzenko <l.guzenko@web.de>, Yuchi
 Yang <yangyuchi66@gmail.com>, Vitaly Rodionov
 <vitalyr@opensource.cirrus.com>, Yang Yingliang <yangyingliang@huawei.com>,
  alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Date: Fri, 27 Oct 2023 21:37:36 -0500
In-Reply-To: <20230913053343.119798-1-poseaydone@ya.ru>
References: <20230913053343.119798-1-poseaydone@ya.ru>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.1 
MIME-Version: 1.0
X-MailFrom: mmpisoni@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: QCAWLTU3FVDPHTIY4FL62TW67PPK4U6Z
X-Message-ID-Hash: QCAWLTU3FVDPHTIY4FL62TW67PPK4U6Z
X-Mailman-Approved-At: Fri, 03 Nov 2023 16:20:06 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QCAWLTU3FVDPHTIY4FL62TW67PPK4U6Z/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


How can I get my model number added to the patch_realtek file? It
suffers the same issue as the UX3402 and the line that needs to be
added for my model laptop is:

SND_PCI_QUIRK(0x1043, 0x1f62, "ASUS UX7602",
ALC245_FIXUP_CS35L41_SPI_2)

Since I see you're being more specific here in splitting the model
numbers, technically my full model number is: "UX7602ZM".

Again, when I patch this locally it works for my model number, but as
of yet only the other affected ASUS laptop modedls with my issue have
found their way into the kernel.

Thanks!
