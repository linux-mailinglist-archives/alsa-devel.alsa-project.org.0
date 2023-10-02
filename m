Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 952137B9B7F
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Oct 2023 09:49:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B48C6E79;
	Thu,  5 Oct 2023 09:48:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B48C6E79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696492161;
	bh=XZjaT2G7H5loBXV/SzFKexzf3aG0A0h5znVrajB2nnQ=;
	h=Date:From:Subject:To:Cc:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=RuO9OiMpLifw17Xo4Hqme8bPUM4nKjEfx39QZg6P4Z7jbSQck6pBUPkwAnclWszn+
	 /PwN9JlDaDw68CKUz2XGd2X4ADTPvUO1H8yYWNL+JvpCFGGXh9OFnbPt4nlhdz3Xuu
	 hJci4OH2Ugzvwd6ZqHfNFzqL87v5DtTZRfOBXDvE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 642A6F805B6; Thu,  5 Oct 2023 09:46:59 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 87F05F805AD;
	Thu,  5 Oct 2023 09:46:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 968E9F80310; Mon,  2 Oct 2023 15:00:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3105BF800C1
	for <alsa-devel@alsa-project.org>; Mon,  2 Oct 2023 15:00:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3105BF800C1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=V8urXSZs
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-40572aeb6d0so131128035e9.1
        for <alsa-devel@alsa-project.org>;
 Mon, 02 Oct 2023 06:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696251650; x=1696856450;
 darn=alsa-project.org;
        h=mime-version:references:in-reply-to:message-id:cc:to:subject:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ovbV2eys6IIdOiXHS9kD3zODjwel8FxTC6gNW0c8hfc=;
        b=V8urXSZsG5MgiHKL/SfSZt+MQpLcf7wKXjMuA3W4N/DP8Lo4/W+1kLxwQjOG334i+U
         cZAErlXlOoq5b0VCGx/g3jOn9Ean+XT1T2R1SrwxGTpiJxbkbyazwahnsI46Ddp35ENn
         vP9Zi7X4h3LMiE/Gp9npo8HgjU/GXZt+q2PiDdgGw4TOTtf2BjkjhWiw6BAm+q9oW51Q
         +zJq1dSl+gsBhQsjDTai909sfgbOi02FU8uebFfunSPgpAD5HKP1dqXenXHbMMVtenE/
         6qaVCcZ7evxwn5EjrozsDZD/vUVS9k1GCJTFtJtQuXs1oWAZ10MU5ntENaUa+emk9ABC
         1Muw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696251650; x=1696856450;
        h=mime-version:references:in-reply-to:message-id:cc:to:subject:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ovbV2eys6IIdOiXHS9kD3zODjwel8FxTC6gNW0c8hfc=;
        b=wnSJQCJbjFP9BrfGa5UufkeYgffXHmj0ZDEyd6WGCe6FhFIKW9wY8NVx7aWX5ehuw9
         8qMkl5KfdbJXBYTvse6Y0wVojqqucFcmBGimGuGyeqcy8dSfv4/hY9ucFngSutoTK/fv
         sQTZaq1ASB6fmnccaz4QohfUqDcfLO38gp/VnLNrns/CdfWPhV1wlW58HPBW/1wmqrcx
         1UjInybYoHSvcPIjzSY1rZLFMqxr79jCT8IXk5FILEs8poWNsUKr88K1cVoY5ahRIgyk
         4d3B4awQMR1Amyb1cP5CNso/OzbvpgAdPx/aLK+CzjAvoptIj7BPYWaLH0B0Lr4YDHEL
         Unow==
X-Gm-Message-State: AOJu0YzmW79VRKJXk8FYVqsXozeXZ8xMrz8lIJApzx3xtE+BotrFIe4p
	cZ9/+mO0VWoMd/Fq5pyZoOTx16PF3PEedw==
X-Google-Smtp-Source: 
 AGHT+IGsS0ybABVU0gSlvh634b7lSev/pAic38BOQT0jBO2o4HznWacSqgb/YE8IgpbdE5p0M3B43g==
X-Received: by 2002:a05:6000:18c9:b0:319:62e0:f2fe with SMTP id
 w9-20020a05600018c900b0031962e0f2femr9647539wrq.36.1696251649490;
        Mon, 02 Oct 2023 06:00:49 -0700 (PDT)
Received: from yoga ([2001:638:904:ffe5:5742:c50f:bd0:6aa6])
        by smtp.gmail.com with ESMTPSA id
 e9-20020adfe7c9000000b003197efd1e7bsm14065942wrn.114.2023.10.02.06.00.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Oct 2023 06:00:49 -0700 (PDT)
Date: Mon, 02 Oct 2023 15:00:42 +0200
From: Sven Frotscher <sven.frotscher@gmail.com>
Subject: Re: [PATCH v4] ASoC: amd: yc: Fix non-functional mic on Lenovo 82YM
To: Mark Brown <broonie@kernel.org>
Cc: Linux regressions mailing list <regressions@lists.linux.dev>,
	mario.limonciello@amd.com, git@augustwikerfors.se,
	alsa-devel@alsa-project.org, lgirdwood@gmail.com,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, Takashi Iwai
	<tiwai@suse.com>
Message-Id: <65KW1S.A6C8VBV29YCM@gmail.com>
In-Reply-To: <64c78944-4d62-4eda-b92b-3b415fea3333@sirena.org.uk>
References: <20230927223758.18870-1-sven.frotscher@gmail.com>
	<46560887-0b6e-42ac-96c3-b4dbc1d7cb61@leemhuis.info>
	<4fa7d39d-dc34-4550-97fa-2b089f364cca@sirena.org.uk>
	<541ac45b-8de7-4fa2-85ee-456d34e60aa9@leemhuis.info>
	<64c78944-4d62-4eda-b92b-3b415fea3333@sirena.org.uk>
X-Mailer: geary/44.1
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
X-MailFrom: sven.frotscher@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: Q5GSGFUYKKV7ZTFEOT6HTB3RFY377ACE
X-Message-ID-Hash: Q5GSGFUYKKV7ZTFEOT6HTB3RFY377ACE
X-Mailman-Approved-At: Thu, 05 Oct 2023 07:46:46 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Q5GSGFUYKKV7ZTFEOT6HTB3RFY377ACE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Am Mo, 2. Okt 2023 um 13:54:59 +01:00:00 schrieb Mark Brown 
<broonie@kernel.org>:
> Until someone tests or otherwise provides specific information on a
> given machine we're just guessing about how it's wired up.

What specific information are we talking about here? I have the 82YM in 
front of me and could help investigate.


