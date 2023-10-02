Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 094847B9B85
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Oct 2023 09:50:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 196D2E88;
	Thu,  5 Oct 2023 09:50:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 196D2E88
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696492254;
	bh=MoAUP9/vIbdx2m45cz+7SMW6PPunBYM0vpRHYcHPcqM=;
	h=Date:From:Subject:To:Cc:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ANA72M/f1IaCg91DPkIwZ5Jqs18/1xqGO9syqrWe2flNBU+F5O9d+fkLXIwBLAUg4
	 FduhbUH3eDIzKNSY2X2vboAfgyw6nrBkfguIniZEy9O5NltgeH0XuZv7zWMDn1htmS
	 GoEVo6Jh/NFuAWHZlKojrAzwDLkGXw5cBQuDvNec=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C6878F80549; Thu,  5 Oct 2023 09:50:03 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BBC93F80549;
	Thu,  5 Oct 2023 09:50:02 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B3726F80310; Mon,  2 Oct 2023 16:41:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 22E04F801EB
	for <alsa-devel@alsa-project.org>; Mon,  2 Oct 2023 16:40:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 22E04F801EB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=jPJMVfPc
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-406618d0991so27696045e9.2
        for <alsa-devel@alsa-project.org>;
 Mon, 02 Oct 2023 07:40:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696257655; x=1696862455;
 darn=alsa-project.org;
        h=mime-version:references:in-reply-to:message-id:cc:to:subject:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=azI3yMPzAcZmIPttwUHbyoUesdGWRU/mZo7qOrVX4uo=;
        b=jPJMVfPcK1OL0qOzLfC7ueyGp+cy8k1VM6v92Xe0wNsaTdD4YGBlLZKiG86AK1DK/4
         mPr2FJV4LJFzrEp9v7sp5+TjhLSOvutpyMbuPWIWp3Ft5tV0imx0kKHysRlqcOuJ3ZKU
         lRsbHuaSepXIY4QZVMdZicRGuGYyFSL1dMXHj/atDE5PgErgj1WlygBty5c/oRZqyqUH
         GjKiSZgq62kMlPjypD/l2VUaMo/Esd7YLzwQu4OLbm1+BrTfwxfAnlr0bNw2TY1lvzVl
         dPLY9GVFssJUK0P22gDBoEROczRa2EvRAc6f8UKpJk20EzDN+Js7OFI+e1hry/WFPaYw
         FvgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696257655; x=1696862455;
        h=mime-version:references:in-reply-to:message-id:cc:to:subject:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=azI3yMPzAcZmIPttwUHbyoUesdGWRU/mZo7qOrVX4uo=;
        b=lmYZTeZjvyx05HfPz+I22lQTJ32ApEH4wFmbfiUDjozgX4ID58gCujTDE8j9VnO6Uf
         SlS9FTqZ2RkdlQk9WtoWqWPL1XDi2lL0T1VGW/nbs+U/k4FqMZDG/DkLNmZQQoKHIN7j
         PLu0+PP9i/WJdCIMGN58HSX9kpQm22nCHkpn7GkHRXWEVmpgzgjTEnEKY947h5td/n5v
         966Ia0Ot2MrefnOG1C8sE7FMQgrf2SEXn47cGgnhizFtiCSwAnbOmWaUJ+b9/3Rl09xa
         2cR0C3vleBlJSOenNvSEGNniyYtpheUnO4Whcm3BbZei7XYYBLVMfGDCxTUnkeCZ7iVC
         OMsg==
X-Gm-Message-State: AOJu0Yz8JnFKdogDsu3RhTvJuLozxh/JZu0E5lUhD4LPwfcUhqtCKlYn
	o+t8WB6u0QZYKUxcBnPQI5fB9/JaU9yIHg==
X-Google-Smtp-Source: 
 AGHT+IFd6dQCn3B8wzH7CSRqASEUv2KLZebwoQpArOJDfRuQLN2exBUpc3vzblS8nwJVvP4Z+0dbxA==
X-Received: by 2002:a1c:4b18:0:b0:404:7659:ba39 with SMTP id
 y24-20020a1c4b18000000b004047659ba39mr10632000wma.16.1696257654545;
        Mon, 02 Oct 2023 07:40:54 -0700 (PDT)
Received: from yoga ([2001:638:904:ffe5:5742:c50f:bd0:6aa6])
        by smtp.gmail.com with ESMTPSA id
 j17-20020a5d6051000000b00326f0ca3566sm5902303wrt.50.2023.10.02.07.40.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Oct 2023 07:40:54 -0700 (PDT)
Date: Mon, 02 Oct 2023 16:40:47 +0200
From: Sven Frotscher <sven.frotscher@gmail.com>
Subject: Re: [PATCH v4] ASoC: amd: yc: Fix non-functional mic on Lenovo 82YM
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: Linux regressions mailing list <regressions@lists.linux.dev>, Mark Brown
	<broonie@kernel.org>, git@augustwikerfors.se, alsa-devel@alsa-project.org,
	lgirdwood@gmail.com, linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	Takashi Iwai <tiwai@suse.com>
Message-Id: <0SOW1S.YTFHPA95XPTN@gmail.com>
In-Reply-To: <28e38593-4861-4d61-b27d-994328ea4e82@amd.com>
References: <20230927223758.18870-1-sven.frotscher@gmail.com>
	<46560887-0b6e-42ac-96c3-b4dbc1d7cb61@leemhuis.info>
	<4fa7d39d-dc34-4550-97fa-2b089f364cca@sirena.org.uk>
	<0a3feafc-b843-420a-9b04-c835f8210c1a@amd.com>
	<048d9715-9cb2-4bc0-b8b0-5e30a0db54c7@leemhuis.info>
	<28e38593-4861-4d61-b27d-994328ea4e82@amd.com>
X-Mailer: geary/44.1
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
X-MailFrom: sven.frotscher@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: ZWRVC6M76UPHC35SWJ7LDW3L2LETXR6K
X-Message-ID-Hash: ZWRVC6M76UPHC35SWJ7LDW3L2LETXR6K
X-Mailman-Approved-At: Thu, 05 Oct 2023 07:49:59 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZWRVC6M76UPHC35SWJ7LDW3L2LETXR6K/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Am Mo, 2. Okt 2023 um 09:20:04 -05:00:00 schrieb Mario Limonciello 
<mario.limonciello@amd.com>:
> I'm not positive, but the only way we get a full list is from Lenovo.

In order to be totally certain, yes.
But maybe the non-quirk check can be expanded to also cover (some of) 
the affected Lenovo models. As I said, I'm open to provide some 
relevant info from mine if someone tells me what "relevant info" means 
in this case.


