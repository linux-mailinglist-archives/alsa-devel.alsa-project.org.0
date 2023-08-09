Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4503C776ACC
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Aug 2023 23:13:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C562E10E;
	Wed,  9 Aug 2023 23:12:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C562E10E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691615583;
	bh=hWTxk18VwLcsg1A9bm3RJxYQUx8Jmq72kMd0rrcr0tk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=sUg6Taiy6g8hBXInC6k4VB2uqR5htSK87gXZVPegLtJYDPBmwVZS7A1ti8AqoT6+U
	 bz8PQ4nUh8ngusnrMufx8eYroE5w53HxuI7OK0FcXmbdMUJT/YDqH67YTJ4bzMHSeA
	 V+EpkF5ocVdiIRfiUj7IeCANSELoCtirOQae3jpg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 08C8CF801EB; Wed,  9 Aug 2023 23:12:12 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 20F78F80116;
	Wed,  9 Aug 2023 23:12:12 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A868AF80134; Wed,  9 Aug 2023 23:12:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-20.7 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL,
	USER_IN_DEF_SPF_WL shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9B084F800FB
	for <alsa-devel@alsa-project.org>; Wed,  9 Aug 2023 23:11:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9B084F800FB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20221208 header.b=HMdCJ015
Received: by mail-pj1-x1036.google.com with SMTP id
 98e67ed59e1d1-267f8f36a3cso143123a91.2
        for <alsa-devel@alsa-project.org>;
 Wed, 09 Aug 2023 14:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1691615517; x=1692220317;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=430byobd3IgQMde5d/6MrTdrEV3TnIvOaugDKYyvcWw=;
        b=HMdCJ015aZgoTjts2UYzP96x5cwrqoohaqZ/2H82Rj9KZD0sRinz8eRizVLJm+OV7+
         +loeYIvkVUOYksbPkXwVafForGzPZsQZITbkiG1rkUhasV6eyRAx64aWA/1Ri2oRnI8v
         TkrqqWp7eLjVfyF4ONIpUj3qCsQA0rsuAYHni+FtE8tu/Y4w3STY/a6VVuTxqySyjFSC
         UJNe3cllZsqj8cfJX3VICQ/PZLPf48x34VSWgMBCFFdElxEGO+bHK3efPfvuWacy1EMT
         fNwrVhqoKAwasK1xgvyGtOwSWS1qhz5dv3xWr7CSO0Ha45iV5ig+6PGWIvg1x+lI7qeZ
         adXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691615517; x=1692220317;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=430byobd3IgQMde5d/6MrTdrEV3TnIvOaugDKYyvcWw=;
        b=chGRb0tqrzDo8z5TebLaHf/cCRPzfIaGvmSbowdxrhqKBVbQ0q3ezbCjjLFWrFN+As
         8eoOt5XLdALcsCRLNbwhGSNgK1E2VGJWzSGLrvjhsDI8SE+S2O7AtMy5vhG2f3gRwz0W
         T7DoKnBpBP0DglkqOyIB5gEbhvVpe8/ht2lGYqIvMjNq1KuXti/02H8HVjt5GgX2qccf
         aYXsgvs3puljs6euD8FJCxRcjJ9cIZ5sYdwgZHB9lauyG5p2Old//yLLOqHrE8SXIGHN
         1pt5OuDDYbJcYF7go2e0J/NG3bKGdlbm3KM7MLpNB9S0zlKw/BKMq04Ea8Fuw0Pcymy3
         3jqQ==
X-Gm-Message-State: AOJu0YwqDGy+AiyWzNpenEDkaIxJ2a7lVMSOjGzxiiRCQkBXdQ6M1bG7
	VSd5vvzfsYRRmMvIuWCObEYCat2EV4MULEiJAaNRCw==
X-Google-Smtp-Source: 
 AGHT+IGhTChYkYLOzr6kGAmRgqfdeodJUucTbSJL42HDWp5AgE/N5CYsmyGFznOuS+8UobV3frXBtd3L1ByWO1wQDK8=
X-Received: by 2002:a17:90a:c207:b0:267:f7eb:f12e with SMTP id
 e7-20020a17090ac20700b00267f7ebf12emr394924pjt.39.1691615516489; Wed, 09 Aug
 2023 14:11:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230807135207.17708-1-tiwai@suse.de>
 <CAOReqxhV=gfwNpxnEU+ruOx6gjD2BSZbYPJ6+iWzkPCidFmCBA@mail.gmail.com>
 <CAOReqxgCDdXAEyF8pt4dePQ2H_ub=hYczvO1xGpKWAt35z5B2Q@mail.gmail.com>
 <87o7jgfxgj.wl-tiwai@suse.de> <87sf8se471.wl-tiwai@suse.de>
In-Reply-To: <87sf8se471.wl-tiwai@suse.de>
From: Curtis Malainey <cujomalainey@google.com>
Date: Wed, 9 Aug 2023 14:11:45 -0700
Message-ID: 
 <CAOReqxjnWruX20YyUcAjwv8zLourFv4hUKGq9_1FBsXA6Fra9Q@mail.gmail.com>
Subject: Re: [PATCH RFC 0/6] ALSA: Fix UAF with delayed kobj release
To: Takashi Iwai <tiwai@suse.de>
Cc: alsa-devel@alsa-project.org, Curtis Malainey <cujomalainey@chromium.org>,
	Stephen Boyd <swboyd@google.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID-Hash: CJ3DDWFGKTDPPIJHGPCD6PON6PEMLERE
X-Message-ID-Hash: CJ3DDWFGKTDPPIJHGPCD6PON6PEMLERE
X-MailFrom: cujomalainey@google.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CJ3DDWFGKTDPPIJHGPCD6PON6PEMLERE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

>
> And now looking back at kobj code and device code, they do refcount
> parent objects.  Maybe the problem is in our side -- the all devices
> are created with the original real device as the parent, including the
> card_dev, while there are some dependencies among children.  So, if we
> build up a proper tree, pci_dev -> card_dev -> ctl_dev, pcm_dev, etc,
> one of the problems could be solved.  It's more or less similar as
> what I suggested initially (referring card_dev at pcm), while changing
> the parent would make it implicitly.

Yes I think this would be the long term proper way to go, that way
parents just put children and remove their reference, then they
cleanup on their own time making everyone happy. My first patch was a
very lazy attempt that, if we wanted to do the right thing we would
obviously have to split the structs and free functions to operate in
their own release. If you have time feel free to take another swing at
the patches, otherwise I won't be able to start until next week.

Curtis
