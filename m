Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B6959796EF7
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Sep 2023 04:31:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 513FC74C;
	Thu,  7 Sep 2023 04:30:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 513FC74C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694053859;
	bh=6lDQd9u+UzyXsARoq+HbpAUQtJg46v8w/1vqDqKWR24=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HY1QsizefTJDISScKNYmnbPVTstqdKr3u1tV3emXT3k2G47Oo8fCPK4vEjgR6dIe2
	 F88Cuo+i1QmDGC19yXQ6gsYTjRLfdve6qlLXYChcY7skRMQlyMu4Ptt97SQ6zp5cjj
	 L2xBWO+WraK4spol/iVB0k946Wfcre0DHMIeMKEk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A85FEF80431; Thu,  7 Sep 2023 04:30:08 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 31DE4F8047D;
	Thu,  7 Sep 2023 04:30:08 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 58BBAF80494; Thu,  7 Sep 2023 04:30:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 562A3F80431
	for <alsa-devel@alsa-project.org>; Thu,  7 Sep 2023 04:29:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 562A3F80431
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=Tt0TBOus
Received: by mail-ot1-x334.google.com with SMTP id
 46e09a7af769-6b9a2416b1cso388018a34.2
        for <alsa-devel@alsa-project.org>;
 Wed, 06 Sep 2023 19:29:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694053791; x=1694658591;
 darn=alsa-project.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jXVHSN9UH4yRS9yEiibVU5OrgopEwYQrywWZWB1MiJg=;
        b=Tt0TBOusi3BJaWPmg1LhNga7xmhjHwjCwm7mb4Mzo662W6IxU5nF3iTN32iDFRagil
         TgnlT4qT7X01Vs7/s8WXa3wZat32YW+vbMvU+/l9+uiAlP8nNJX7xMCZ0z9lNh2XAgc0
         1ywkR/gamof47T59arb7q+hsjWHZA0Cfsf7UgBF8WNnjby89NEAUNSOw6qJLo7fFhIMW
         oL1nnGHWWK/+JG9xki/M3olPX7gRNr3wrfTMYCz7I2ETEnIvMX/GrhiLuoE6As4kexiR
         4D04Q5ZvJyAdd+EPztVYFc1t4GmcxiZXZhnNQ/w1vDsSmxv4vO/mrEpXWYo6XP2kAwUh
         rQrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694053791; x=1694658591;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jXVHSN9UH4yRS9yEiibVU5OrgopEwYQrywWZWB1MiJg=;
        b=apFU7Uoh9v8CP403ooLKATxXbuDCYa0FK5f4Ip+uBnk09u8AKEkYMRmVmsPnqlB2Lh
         xFb1Jy0YCfphlaa/QtEn34RBLhim6k8EJd8u55qafKtH/efAPE3uogwoYjZ1nal2M7vw
         a0nzlM5QXgDgu1hWyapIMwP6ULu+yTRoIME56AH5TkYS68auvE7hczeNNjyUFNhow0qH
         +8qCFT3fgueYYppfViCt0HjpV1Rsw1shUSPyY9pWhpLne6Gwka+ZYxL84mOJvidtKVL0
         OFBbDZXdPmQgqsL1kPyoDbpr2GJlAxatvjcWQPq3ZKRrjpoitW/I4PsCF8JoUKBKe7YV
         ju9w==
X-Gm-Message-State: AOJu0YyX/pif5DH+kLd+K80bwLO91OLYN4AwY8qIG55oa3wBWCAlNwEO
	dcPb0TQg8fbsMs6SxoypgYQ=
X-Google-Smtp-Source: 
 AGHT+IF4wgCwuS0FbyDPyPT9pWqQtGo78O11d/UR6tq+pxI1r5JzC97u4kA4pxEFFJwZA55yqfH1oQ==
X-Received: by 2002:a05:6830:14d9:b0:6b9:8357:6150 with SMTP id
 t25-20020a05683014d900b006b983576150mr18467951otq.35.1694053791031;
        Wed, 06 Sep 2023 19:29:51 -0700 (PDT)
Received: from geday ([2804:7f2:8006:99ef:50e4:98e3:42a7:1619])
        by smtp.gmail.com with ESMTPSA id
 l2-20020a05683004a200b006b8c6eb962esm6941477otd.52.2023.09.06.19.29.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Sep 2023 19:29:49 -0700 (PDT)
Date: Wed, 6 Sep 2023 23:29:46 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: Antonio Terceiro <antonio.terceiro@linaro.org>
Cc: Robin Murphy <robin.murphy@arm.com>, Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: snd-cmipci oops during probe on arm64 (current mainline,
 pre-6.6-rc1)
Message-ID: <ZPk1mpbSeK7+eVs2@geday>
References: <ZPelHaX/Lt++kkOm@linaro.org>
 <877cp3esse.wl-tiwai@suse.de>
 <4f335dd2-8043-c60e-cf84-c2b01c4fee12@arm.com>
 <ZPjGuCdmPgqznc5t@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZPjGuCdmPgqznc5t@linaro.org>
Message-ID-Hash: UFU54WQL34NMFL5TTVU6KE4OFGXJ4SDS
X-Message-ID-Hash: UFU54WQL34NMFL5TTVU6KE4OFGXJ4SDS
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UFU54WQL34NMFL5TTVU6KE4OFGXJ4SDS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Sep 06, 2023 at 03:36:40PM -0300, Antonio Terceiro wrote:
> On Wed, Sep 06, 2023 at 01:49:16PM +0100, Robin Murphy wrote:
> > It's blowing up trying to access PCI I/O space, which has apparently ended
> > up in the indirect access mechanism without that being configured correctly.
> > That is definitely an issue down somewhere between the PCI layer and the
> > system firmware. Does the system even have an I/O space window? Some arm64
> > machines don't. I guess we might not have got as far as probing a driver if
> > the I/O BAR couldn't be assigned at all, but either way something's not gone
> > right.
> 
> I'm pretty sure I saw reports of people using PCI GPUs on this machine,
> but I would need to confirm.
> 
> What info would I need to gather from the machine in order to figure
> this out?

Antonio, please see:
https://community.amperecomputing.com/t/amd-gpus-on-the-altra-devkit-and-other-altras-patches-available-now/336/11

You have a quirky PCIe controller it seems. You'll have to go through
the errata and then some.

Good Luck,
Geraldo Nascimento
