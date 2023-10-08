Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D6687BCBEA
	for <lists+alsa-devel@lfdr.de>; Sun,  8 Oct 2023 05:34:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A638E826;
	Sun,  8 Oct 2023 05:33:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A638E826
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696736041;
	bh=/2FhB+ZKjiAB+M0AUDG2sH0FLb7gMO2QWUaShEtlBFk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=RrUAiChK5i2gKq1r21DlISFacdmGIDh5JZdTg0PZaY5zVYYx8xU04nHAVOQhC24d2
	 M2MjbrLL6NoalplQYFTE23h3IyTvVi9x/8+gS84b6vpYxXE26k7SkzioFqHel+hcPV
	 4+z2174eqAQV/7E1mOF9210uL/OUL7poYs2ZDWdw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C0023F8027B; Sun,  8 Oct 2023 05:33:01 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8D29EF8027B;
	Sun,  8 Oct 2023 05:33:00 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0442BF802BE; Sun,  8 Oct 2023 05:31:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com
 [IPv6:2607:f8b0:4864:20::530])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E2545F8019B
	for <alsa-devel@alsa-project.org>; Sun,  8 Oct 2023 05:30:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E2545F8019B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=HvldsL2Y
Received: by mail-pg1-x530.google.com with SMTP id
 41be03b00d2f7-517ab9a4a13so2569496a12.1
        for <alsa-devel@alsa-project.org>;
 Sat, 07 Oct 2023 20:30:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696735850; x=1697340650;
 darn=alsa-project.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Po8IwO3ZNX4Frjy8MjMqPcYZOoaeDikNFLkcWX7OJPI=;
        b=HvldsL2YrD0ph+9a2s56yBlKbddNaTvz/WrU754s2Qr7Q9Ppi8y3G9izyKIX7/s5vk
         sHkywaz68xpFy5W9Qg/mur9unw+bn6pFdJjHG+Aoydmsww8FLHeR9dj/+bB4VAw+oiap
         40VdhFOSnZqcfd1ASSxSBXkKtnwW3s9cZ7S5/Zfm58Zmv6x7lsHZaNbU9QbiKdAzC7CX
         ixSU36KD5/sO7hZpH0ExI80XNnOmWQoujcEFREbmRRDgQyHRM0KvwZGaAU2u0B2EvfjN
         wi34tyKLxjH/03hBSx2UzgenbpuW5ZXh1l5JX2cnLm4XdX0Hp6L/WV/mLIlCUw7jth7G
         br8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696735850; x=1697340650;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Po8IwO3ZNX4Frjy8MjMqPcYZOoaeDikNFLkcWX7OJPI=;
        b=a0gaCKP+tPpC4YaaHM1yfgwh6MCmQXREgHEZ2wrjkElIz0g+5I3++s104j+95VmeG2
         Dv3xAOO+5fD5heGhYUYTEGuuFlp0QT3wlctrPDwixuUUIWU0Vs98uX4oinNn3/M2UIcH
         fy0cGVnF8LR3w27+eIa3yadz+tpE/VeLIPpHcLYv5XmuKN1/tWSOx0gIKPxJ0+DRhpt0
         koq37R7PpGslEwNlI/IFNsT4Wn+do7o1QZAZMo/b/RiNHv+YStHRIbC0N7dkkxwX2aXi
         UJQizaZFL25N5BcQUeQxNpAB5nDj/LnG1ML+1i/DzltjbACjDnRhxpVvyhIHWx8jI4P4
         ouAQ==
X-Gm-Message-State: AOJu0YweOMslWfdRyjUUcrUe7LKHGVssL3kHm3yfrhocg/Lu2eD7DH3X
	ey+fO8OkmdsV0n0TwCSZFxshwY+UVirtlHl4OVc=
X-Google-Smtp-Source: 
 AGHT+IHu0m1BG7YctYVYzTTaRMvMvVrKlnV6do4IhJbTtREHvtRDSndFewmonfv7LypGWBoeuyRfvI4GrwV0RDkFj1M=
X-Received: by 2002:a05:6a20:6a1a:b0:154:fb34:5f09 with SMTP id
 p26-20020a056a206a1a00b00154fb345f09mr14826314pzk.15.1696735849741; Sat, 07
 Oct 2023 20:30:49 -0700 (PDT)
MIME-Version: 1.0
References: <1695891619-32393-1-git-send-email-shengjiu.wang@nxp.com>
 <1695891619-32393-2-git-send-email-shengjiu.wang@nxp.com>
 <7af54654-d4d5-498e-bd53-78ad54e6d818@sirena.org.uk>
In-Reply-To: <7af54654-d4d5-498e-bd53-78ad54e6d818@sirena.org.uk>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Sun, 8 Oct 2023 11:30:38 +0800
Message-ID: 
 <CAA+D8AOyDD9Wd0pHFW=jwY9FKqY0OA2UMmDRrB_UnSPN4FJSZA@mail.gmail.com>
Subject: Re: [RFC PATCH v5 01/11] ASoC: fsl_asrc: define functions for memory
 to memory usage
To: Mark Brown <broonie@kernel.org>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, hverkuil@xs4all.nl,
 sakari.ailus@iki.fi,
	tfiga@chromium.org, m.szyprowski@samsung.com, mchehab@kernel.org,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Xiubo.Lee@gmail.com, festevam@gmail.com, nicoleotsuka@gmail.com,
	lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
	alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: 63IIAZXBGLTH2QHMZVEA4NFAKZ64SSEF
X-Message-ID-Hash: 63IIAZXBGLTH2QHMZVEA4NFAKZ64SSEF
X-MailFrom: shengjiu.wang@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/63IIAZXBGLTH2QHMZVEA4NFAKZ64SSEF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi

On Mon, Oct 2, 2023 at 11:08=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> On Thu, Sep 28, 2023 at 05:00:09PM +0800, Shengjiu Wang wrote:
>
> > m2m_start_part_one: first part of the start steps
> > m2m_start_part_two: second part of the start steps
> > m2m_stop_part_one: first part of stop steps
> > m2m_stop_part_two: second part of stop steps, optional
>
> The part_one/two naming isn't amazing here.  Looking at the rest of the
> code it looks like this is a prepare/trigger type distinction where the
> first part is configuring things prior to DMA setup and the second part
> is actually starting the transfer.  Perhaps _config()/_start() instead?

Ok, I will use m2m_prepare/m2m_unprepare to replace
m2m_start_part_one/m2m_stop_part_one,  and use m2m_start/m2m_stop
to replace  m2m_start_part_two/m2m_stop_part_two.

Best regards
Wang shengjiu
