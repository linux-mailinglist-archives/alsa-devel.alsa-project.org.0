Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B88D27E0676
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Nov 2023 17:25:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 44A16ED8;
	Fri,  3 Nov 2023 17:25:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 44A16ED8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1699028757;
	bh=GHWL46G8NXkoKAdE2/pXu93JSdaBuXUlUxnrvTJOdOY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=hSGUpmKzEmr5CYaaiOXhLU988YCWp8dF942W29n6BC1ZXH0plQvubHc09wzQFtHeY
	 mLlYp3TcUfbtJ//2CZLPgRhKvx0awyOGlgmALlvVVekrOPcP3KS5umYS4E9DggnXa1
	 Ya1Q9DlXknRG4Ske1iXxAJhytoxOPduvysiTr0MQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 03DEEF80564; Fri,  3 Nov 2023 17:25:06 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5FA8BF8020D;
	Fri,  3 Nov 2023 17:25:06 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D0BB6F8016D; Mon, 30 Oct 2023 21:46:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 14818F80152
	for <alsa-devel@alsa-project.org>; Mon, 30 Oct 2023 21:46:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 14818F80152
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=nDlD/wpW
Received: by mail-oi1-x229.google.com with SMTP id
 5614622812f47-3b2e22f1937so2729974b6e.1
        for <alsa-devel@alsa-project.org>;
 Mon, 30 Oct 2023 13:46:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698698779; x=1699303579;
 darn=alsa-project.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GHWL46G8NXkoKAdE2/pXu93JSdaBuXUlUxnrvTJOdOY=;
        b=nDlD/wpWZ66dp83jF5QAZJv2elp4Z+K1dfMi45qBg+YYwV9pVtMgr8lc8f+KyxcKAN
         HasMh+jEARnRWBUemVGhtMBp6NY1CZntM0fvM3MsLyI6K01g/66YjO81n1MY9hINrteL
         WiWI3djYgcWdEp3Nh2sQZutvB+3SCsvp6Mw7Kxz6UXMmudzLokTM1KNIPywoKImdjSHq
         4VrYPDxYg8dkAqhT7Oqv791or7gxbcr6FH9o4rIKOfO6FARkE7st0bxB1Bz4+06EdLDs
         w26uteMQkfEbKMGcwHuCFuObjPYxdHaiPw6c7PYmmYwmDANyrGIrHCOezEHeEwsHlC/8
         v+RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698698779; x=1699303579;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GHWL46G8NXkoKAdE2/pXu93JSdaBuXUlUxnrvTJOdOY=;
        b=Flse2di5umVv3LL3/JKUK5szUjdm2WJcbZISfjxn4pk/xnH5Z9uWHguLs58O7boJrF
         qRFab6CPc4+bKdNj+5Wzt6OC8rKjiCBRwyvFh8iOvNB8cELNciOPZNzJFP2wrWmHVN+s
         /4elxvYCEGD+fnm8m/hD18tHGHvm146C0Sp6Z5NZng3eL28N1ASthYWZ8oUp1pbb4nps
         oQqhCEcoGe3fd0inKSQ7tlvkvRhfrioTlPdrHr/5HvAJi/uemWtXe83EpYQHUaLNk+uw
         WOuRT3GmS/Qdlbr/SS+Ky21EhRZc4zh5bfzo5kzg46g254mqgXq9tXFlDDLXqSWipNel
         gpXA==
X-Gm-Message-State: AOJu0YxAqAm2w+1Xh+nAlZ/q+fOyBz+W+BPcdmBQj4B3vrSmn8EocNvX
	YEAAZK2gncdbqflSTkCEEQjYNcQNXztUhW9zO4Y=
X-Google-Smtp-Source: 
 AGHT+IH7Dib57XvDiKMu/5BfJ4q/bfY6Uc5iK24QoDCMGMXOqPPDiJXdm5FbY1GzK8H6oKpjuiUed0mr05G7KpFVtas=
X-Received: by 2002:a05:6808:8f6:b0:3ae:511e:179e with SMTP id
 d22-20020a05680808f600b003ae511e179emr10833202oic.54.1698698778622; Mon, 30
 Oct 2023 13:46:18 -0700 (PDT)
MIME-Version: 1.0
References: <20230913053343.119798-1-poseaydone@ya.ru>
 <c36c2c196670a36f32cc776869e91f710c237400.camel@gmail.com>
 <282881698597547@mail.yandex.ru>
In-Reply-To: <282881698597547@mail.yandex.ru>
From: Matthew Pisoni <mmpisoni@gmail.com>
Date: Mon, 30 Oct 2023 15:46:07 -0500
Message-ID: 
 <CAJgVWNfTO_8bcOnbNC4mXdignS5Z8beQUDxjQkQ+R7BfBiVnzQ@mail.gmail.com>
Subject: Re: [PATCH] patch_realtek: Splitting the UX3402 into two separate
 models.
To: =?UTF-8?B?0JDRgNGB0LXQvdC40Lkg0JrQvdGP0LfQtdCy?= <poseaydone@ya.ru>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 "Luke D. Jones" <luke@ljones.dev>,
	Stefan Binding <sbinding@opensource.cirrus.com>,
 Andy Chi <andy.chi@canonical.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
 Matthew Anderson <ruinairas1992@gmail.com>,
	Luka Guzenko <l.guzenko@web.de>, Yuchi Yang <yangyuchi66@gmail.com>,
	Vitaly Rodionov <vitalyr@opensource.cirrus.com>,
 Yang Yingliang <yangyingliang@huawei.com>,
	"alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-MailFrom: mmpisoni@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: OFMWYFMSNA6GM47JGXVG2DHFHNNP4AR7
X-Message-ID-Hash: OFMWYFMSNA6GM47JGXVG2DHFHNNP4AR7
X-Mailman-Approved-At: Fri, 03 Nov 2023 16:25:00 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OFMWYFMSNA6GM47JGXVG2DHFHNNP4AR7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Okay so how would I go about getting the following line added to the
patch_realtek file?

SND_PCI_QUIRK(0x1043, 0x1f62, "ASUS UX7602ZM",
ALC245_FIXUP_CS35L41_SPI_2)

It works on my machine I own that model I would just like it added as
other models have been so I don't need to continue to patch the kernel
module when it's already been effectively fixed for others.
This thread looked like you all were discussing modifications to that
file for this issue so I thought it might be a good place to start.

Thank you!
