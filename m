Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 53B387B3F0C
	for <lists+alsa-devel@lfdr.de>; Sat, 30 Sep 2023 10:11:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C6A36F9A;
	Sat, 30 Sep 2023 10:10:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C6A36F9A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696061504;
	bh=2dOEarMsKlX81EWHpoJ05IznYxQm4OAl8tbGo1cJs0s=;
	h=Date:From:Subject:To:Cc:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=sWAi3lfqemZtN53Cg1CDGTb7KI2Hu0XNZUE3tliPZtKpwzbg1BX9BVocAe1+0etet
	 JODgTeRx+xPdx18LtrMi+fEX7G8X1As/cc3cIkQ/8BVIC2kxKuPLiw7fpP4Cp8hmBS
	 UXH82gKRJW9GS1AdOrBZRFagnlcZT14KjOD0025M=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6AC13F805F8; Sat, 30 Sep 2023 10:07:43 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0FF98F806AE;
	Sat, 30 Sep 2023 10:07:43 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CA964F8016A; Wed, 27 Sep 2023 20:50:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3154AF80130
	for <alsa-devel@alsa-project.org>; Wed, 27 Sep 2023 20:49:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3154AF80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=aDCr+hSI
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4060b623e64so35422395e9.0
        for <alsa-devel@alsa-project.org>;
 Wed, 27 Sep 2023 11:49:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695840597; x=1696445397;
 darn=alsa-project.org;
        h=mime-version:references:in-reply-to:message-id:cc:to:subject:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=R1itOLkylDTQc/2A2yBLCkbYqw9eu/lNAc5CXGwFbJ0=;
        b=aDCr+hSI90yt6AvVV/dgPuIbwsIha+Ho5ywLNgSII6YNa2G4xAXFP9SJzG8kSKs1sk
         cjFwA8WB4RbZ73S0+QiKyG2/hg2ZnsdiTWo5NK+yZ7P8z9+qLs64nFmLb2V3KbgpiJdO
         Ns8/zvZ5p5fy+0p0yjVugvKkeDbAOQrqzX4mkxNKOL4FcGdaieaYFlzMlBGqlT9QSgWp
         6u18y89z4jwc15Vyuh6gj4FH/A6cn1fu66WU9lC7o749cvlks7NhinMpFRB/2X5DclAn
         oKZbK9kMSdkDO+kmyDmratZZEwg/6EDPCdVTJ1qFFmjE9A/O+xfwFEbqtt6mnzhK1BWo
         MQnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695840597; x=1696445397;
        h=mime-version:references:in-reply-to:message-id:cc:to:subject:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R1itOLkylDTQc/2A2yBLCkbYqw9eu/lNAc5CXGwFbJ0=;
        b=cOM7uD2IhSkytKD1d76G/+oolaG1RSdwjVtt17OVSiwIrm+3pw/ufJ31nnjAgkWa/J
         HFll4wc7KN7YP3toyabUEm/WVdlepe3Nq5ys/q3HR9yfJ3NiiJz4QyfhcUWdKqZqHV+2
         Yks9dbUbvzgee2/dLqlxa/Ec7P+LbNqYhUosonw7O99x0VwVo5XYJLBpWCkZPLwghzsG
         FHJBDvt8R+sigh5lXu1PfVq3E4LlwK54VK5JQza0g6Cyo8xDgZXI+BqoLsGFtXLebubP
         9E4eTpTF1RsSvPwDoGJOWIW3FRxM5Rs5kKdvH828W+7kydVFuUZ3tY4wHR/n0NJHahaD
         M2FQ==
X-Gm-Message-State: AOJu0YwsWUu0X4kip9jbat5e/sATn4tU1pPbo0Bu8BUD9R9fxYDFKKtc
	FjZgC5jKke4nuxxeP2UElIM=
X-Google-Smtp-Source: 
 AGHT+IGeFdsdEIFmk8RA4GwxSOTEPxHmjmcwLkojsHT6AEJXOvOw35P8cqeCoxyKpOpJNO67PqbsrQ==
X-Received: by 2002:a05:600c:2044:b0:405:3941:ce2c with SMTP id
 p4-20020a05600c204400b004053941ce2cmr5457597wmg.6.1695840597222;
        Wed, 27 Sep 2023 11:49:57 -0700 (PDT)
Received: from yoga ([2001:638:904:ffe5:5742:c50f:bd0:6aa6])
        by smtp.gmail.com with ESMTPSA id
 p19-20020a05600c1d9300b0040531f5c51asm18515027wms.5.2023.09.27.11.49.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 11:49:56 -0700 (PDT)
Date: Wed, 27 Sep 2023 20:49:50 +0200
From: Sven Frotscher <sven.frotscher@gmail.com>
Subject: Re: [PATCH] ASoC: amd: yc: Fix non-functional mic on Lenovo 82YM
To: August Wikerfors <git@augustwikerfors.se>
Cc: broonie@kernel.org, alsa-devel@alsa-project.org, lgirdwood@gmail.com,
	linux-kernel@vger.kernel.org, mario.limonciello@amd.com,
	regressions@lists.linux.dev
Message-Id: <2ZQN1S.P7M0RX306S1D3@gmail.com>
In-Reply-To: <e8479eff-a5cb-41b0-8bf6-bcc20ccbecfb@augustwikerfors.se>
References: <R5KN1S.18M6QDS4T9PY1@gmail.com>
	<e8479eff-a5cb-41b0-8bf6-bcc20ccbecfb@augustwikerfors.se>
X-Mailer: geary/44.1
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
X-MailFrom: sven.frotscher@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 6KYZ7ZCCSNS4J47L7OV2NF2Z2IQ3TEIO
X-Message-ID-Hash: 6KYZ7ZCCSNS4J47L7OV2NF2Z2IQ3TEIO
X-Mailman-Approved-At: Sat, 30 Sep 2023 08:07:28 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6KYZ7ZCCSNS4J47L7OV2NF2Z2IQ3TEIO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hello,

 > > Signed-off-by: Sven Frotscher <sven.frotscher@gmail.com>
 > Since this fixes a regression caused by commit c008323fe361 which has
 > been backported to stable, please add "Fixes:" and "Cc:" tags above 
the
 > "Signed-off-by:" tag to ensure the fix also gets backported in a 
timely
 > manner [1]:
 >
 > Fixes: c008323fe361 ("ASoC: amd: yc: Fix a non-functional mic on 
Lenovo 82SJ")
 > Cc: stable@vger.kernel.org
I will.

 > > +>..>...>...DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
 > > +>..>...>...DMI_MATCH(DMI_PRODUCT_NAME, "82YM"),
 > Your e-mail client seems to have mangled the leading whitespace here,
 > which will prevent the patch from applying cleanly.
My e-mail client isn't the problem here, but my Vim syntax highlighting
for tabs... I should've noticed that when copy-pasting from test e-mail
to patch e-mail via Vim.

Should I reply to this thread with a [PATCH v2] message or create a new
thread?
Anyway, thank you for pointing out these issues.

Regards,
Sven


