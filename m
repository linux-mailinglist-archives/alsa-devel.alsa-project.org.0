Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 486D075650B
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Jul 2023 15:33:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1C541AEA;
	Mon, 17 Jul 2023 15:32:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1C541AEA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689600806;
	bh=2hYQ0Tw0w7193xNuoM73FFWflNMshY0N2gluujKeRMs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=o0Ez6DA43l4dp94wB3ha4BA14uk7Kg1HC/cHPd6M9kZA2NAzQlNrbbLLZmK5qL6+c
	 OTyEO9PzMK6B1aOYVu02ePUde9thORdDqR/f7NlL30l2Q/rSFng9MoPA4iSUIC38IL
	 0IahW5GTr0OEz/xDbA+pk75Iyo4PanX8ytcRn8yg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0FCCCF800D2; Mon, 17 Jul 2023 15:32:09 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 70C88F8032D;
	Mon, 17 Jul 2023 15:32:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B026FF8047D; Mon, 17 Jul 2023 15:32:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com
 [IPv6:2607:f8b0:4864:20::32b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A6CD9F800D2
	for <alsa-devel@alsa-project.org>; Mon, 17 Jul 2023 15:32:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A6CD9F800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=be5tQN6K
Received: by mail-ot1-x32b.google.com with SMTP id
 46e09a7af769-6b9defb366eso122305a34.2
        for <alsa-devel@alsa-project.org>;
 Mon, 17 Jul 2023 06:32:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689600719; x=1692192719;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HT77U7HJK6Ne07wYJYzEak7BW7vkZwxv/+cQcW7DBkk=;
        b=be5tQN6KGAdAfUJmeDhExzBFM8EOh5k/7tzfVJxZKpjczg1JhNoEFgVHZbufXeYg5/
         pzaRs68Lg/91rSyDfucteQrNgPvkEJ9cgon1Onxe6MGhOtkQUqVAh3Y4KpSlZT97jLyD
         UPrj+1HyuobM4E4AlsgOPGHDOwU/xrDlZeJhE7kAF0ji0MTzb5SK8euk4R4d2zQ+ZSSI
         uZmJ5TWsen/rWm06bOBWkUzKDntUn3MzTFC4njFS75EIEHKrzSF/fHklCG8GVHs9ac2j
         Ys7trc5NmCkOUlmZL2d9PH6LZ9zvgOEK/kNGMPJSzoxQbBHlKtw4+1ATu+KUiywNp22Z
         E0Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689600719; x=1692192719;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HT77U7HJK6Ne07wYJYzEak7BW7vkZwxv/+cQcW7DBkk=;
        b=JUvchhix6xhykZtLKyzNGJoOGKTPPY9jw7syC7u5qe8Kikjv8RjJcVrf7kJaiQJaYO
         nkmul9l3O4JBFz12hm9aYgNpxwa0l/sQeP3F+Lh9rphTZoRmHfN88tB1tFA+JIhBnGMm
         x2dc0O2huQBplGY/DRoQmWvqaQa8Izyy7I1FIbvuNx3OGmSAGC9lRzJBiKRvAwdwzI0s
         Pff1l9MZl2iR45/rD53nYt16Wxz4MzvSfR6Xtz2ybUt1TL69aPXhUZRlgT7ZgrY3dHJf
         YOqv67ISdLmrO5QDMhBUDLKTo6VBEAxAJKYBOSg2n7bhv9OG5oqTMDzQ/Pdp+A1hynF8
         RgMw==
X-Gm-Message-State: ABy/qLbHZTYOnl0q+CBdWkvUEjMTxJeyOFD9X3WTP2Wsd+JM89EYBlkS
	jhrsnurTDcMUslUnWPLiWiw=
X-Google-Smtp-Source: 
 APBJJlGHMmNMYTGgeA0Hvxt+cNiOjgAJkMxCjSEqSK46oy7eiHT43tMOmXQSBUsE3Pjvo+1kADQvGQ==
X-Received: by 2002:a05:6808:138a:b0:3a4:2545:1cec with SMTP id
 c10-20020a056808138a00b003a425451cecmr14491390oiw.38.1689600719717;
        Mon, 17 Jul 2023 06:31:59 -0700 (PDT)
Received: from geday ([2804:7f2:8006:9379:516e:42c5:d582:55d9])
        by smtp.gmail.com with ESMTPSA id
 k7-20020a0568080e8700b003a3b321712fsm6821296oil.35.2023.07.17.06.31.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jul 2023 06:31:59 -0700 (PDT)
Date: Mon, 17 Jul 2023 10:31:54 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: Dmitry Vyukov <dvyukov@google.com>
Cc: Takashi Iwai <tiwai@suse.de>,
	syzbot <syzbot+cf8e7fa4eeec59b3d485@syzkaller.appspotmail.com>,
	alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
	perex@perex.cz, syzkaller-bugs@googlegroups.com, tiwai@suse.com,
	syzkaller <syzkaller@googlegroups.com>
Subject: Re: [syzbot] [alsa?] memory leak in snd_seq_create_port
Message-ID: <ZLVCyk17wzowxRo7@geday>
References: <00000000000098ed3a0600965f89@google.com>
 <87v8ekattg.wl-tiwai@suse.de>
 <ZLQ/zKgTGMHy/6Jn@geday>
 <CACT4Y+bXLZf9iAgiLcxo7coNsOCsn_1C26zuvNBa48qLp2Juxg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: 
 <CACT4Y+bXLZf9iAgiLcxo7coNsOCsn_1C26zuvNBa48qLp2Juxg@mail.gmail.com>
Message-ID-Hash: 3G22HKG47VR27KCF752IUBEHTYJ7TWNM
X-Message-ID-Hash: 3G22HKG47VR27KCF752IUBEHTYJ7TWNM
X-MailFrom: geraldogabriel@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3G22HKG47VR27KCF752IUBEHTYJ7TWNM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Jul 17, 2023 at 09:02:07AM +0200, Dmitry Vyukov wrote:
> 
> Hi Geraldo,
> 
> What exactly is cryptic in the report? Is there anything that can be
> done to make it less cryptic?
>

Hi Dmitry,

It's cryptic for a novice only, of course, in the same sense that kernel
stack traces are a pain for a novice do decode. Unfortunately I believe
it's only AI/LLMs that will make it easier to abstract the low-level
details and give a high-level explanation of the bug.

Thanks,
Geraldo Nascimento
