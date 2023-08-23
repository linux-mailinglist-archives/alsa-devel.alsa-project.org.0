Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 05CE1785C6D
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Aug 2023 17:47:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F0CB4832;
	Wed, 23 Aug 2023 17:46:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F0CB4832
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692805619;
	bh=FboKCH10HLktLGJaUMUJBhnad8FHxxHRD53xcdfNACU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Cx9aiKUrJdEkzGaVZWG5+Q1J8PaVmNN93HEf48jVx8VLM12pTUWY0qcB99EK7cVpc
	 vBpNUz/c/VYZuzQXMmp2l0aqAOJ5tDirxA8obQGX2hMegWzYJ26TENAldFkjh+DYud
	 IxpJI25jNE2EkPbHAENnA2M5oOVKj/SnxFLjHaFw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DECE8F800F5; Wed, 23 Aug 2023 17:46:07 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 50342F800F5;
	Wed, 23 Aug 2023 17:46:04 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5296BF80158; Wed, 23 Aug 2023 17:45:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com
 [IPv6:2607:f8b0:4864:20::b31])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4D797F80022
	for <alsa-devel@alsa-project.org>; Wed, 23 Aug 2023 17:45:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4D797F80022
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20221208 header.b=woe0tJB5
Received: by mail-yb1-xb31.google.com with SMTP id
 3f1490d57ef6-d7481bc4d6fso3934444276.2
        for <alsa-devel@alsa-project.org>;
 Wed, 23 Aug 2023 08:45:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1692805521; x=1693410321;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4iKbrG16XTWsUCbJWiS608T9PjV3Jt5yTK3FHBeUP24=;
        b=woe0tJB5ip7dp7CL93K68GRCo0wxXwFKGOUsgTJxm/R31emhVQ+9E5A1lqrFP/C7US
         Me25/PdUnxLgdF0i2mA+BebYouUU91rSsdJz+afSsTRPg8uXCzXXgM4aJKmSVKXyM+LT
         j/I1z9PLMCTRRtt1hJGmOIWD2V1Cmgl3M4YVc0/yL5rHRLqAoUPl+AWfwHt+e/Si5jCG
         j/IfAb05fQT8Aqfb0UXHwoBrVyPo75vjxRNu1RtY16oysdMQZHeP/HsGuFpQMIh/3B2u
         ezaTFMN18yatH9moQD9nbbtwETq4TyQPKh1NMWzlBETCSz0+C0ySAtJ4GOCe7z0BV1jB
         FGpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692805521; x=1693410321;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4iKbrG16XTWsUCbJWiS608T9PjV3Jt5yTK3FHBeUP24=;
        b=FFlTrg5oFRbkW8WAllL4ZHcKVZ53m8v7Cv6SbSpxOocCr276SljeVjaHkbD4nHu6Ms
         zLdeu1Pp3So2YXyxegdLqZzwo1RznjhWAXcdBbpm39x7w/71lRKdvfGCKE/vcxRbLEMG
         byjFKFh8qMyGm3rF6Ous4D1v79fjNnuqL+aS9oNiURXDuQgTLRfCvMQ/seSSmssFPV0l
         4nRZy+mtdK0ZP52BBSnMGHwKRhPIvc0ROF5DM8zBO1mow5m9BSauItRDg8x0x0Yqqohy
         yhzkqv96G7aoysD4wAlujoN4bYeFgCfyw4dK8pt2RrX1gPaA/2SJvKFI7SFg4jh2nZ2B
         Kenw==
X-Gm-Message-State: AOJu0YwKPjb4rteLNFCF6JZyNiAkY7NYUKyq0ShScHcpHT9a4kQ5+bn6
	BlGbl4PrP81B7pOg/KbTwFcsgbWfOdPiTyE7VyKyxw==
X-Google-Smtp-Source: 
 AGHT+IGby702gDui1jmV96AnJZ9nLoHS+SoEbHAh56x6IqrEiZQrO5jwJZucjzv3wNLoQqDHphe+yvFHz/qPdPo1RL8=
X-Received: by 2002:a25:ae01:0:b0:d63:1d3b:9416 with SMTP id
 a1-20020a25ae01000000b00d631d3b9416mr12797135ybj.2.1692805520687; Wed, 23 Aug
 2023 08:45:20 -0700 (PDT)
MIME-Version: 1.0
References: 
 <20230823040755.2217942-1-ajye_huang@compal.corp-partner.google.com>
 <dd6d51b0-cc60-4fb7-932d-1117143d1715@sirena.org.uk>
In-Reply-To: <dd6d51b0-cc60-4fb7-932d-1117143d1715@sirena.org.uk>
From: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
Date: Wed, 23 Aug 2023 23:45:09 +0800
Message-ID: 
 <CALprXBYxrwBW6HLP5MwYhFh1_Skei+pLbXd7yNAEuhLTQJLVPg@mail.gmail.com>
Subject: Re: [PATCH v1] Revert "ASoC: Intel: Add rpl_nau8318_8825 driver"
To: Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
	Yong Zhi <yong.zhi@intel.com>, ye xingchen <ye.xingchen@zte.com.cn>,
	"balamurugan . c" <balamurugan.c@intel.com>,
 Libin Yang <libin.yang@intel.com>,
	Jaroslav Kysela <perex@perex.cz>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>, David Lin <CTLIN0@nuvoton.com>,
	Brent Lu <brent.lu@intel.com>, Takashi Iwai <tiwai@suse.com>,
	Terry Cheong <htcheong@chromium.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Gongjun Song <gongjun.song@intel.com>,
	Arnd Bergmann <arnd@arndb.de>, apoorv <apoorv@intel.com>,
 alsa-devel@alsa-project.org,
	kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: 2IV3D4KSX2KZZXLT4KG4O453IS4SD3FZ
X-Message-ID-Hash: 2IV3D4KSX2KZZXLT4KG4O453IS4SD3FZ
X-MailFrom: ajye_huang@compal.corp-partner.google.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2IV3D4KSX2KZZXLT4KG4O453IS4SD3FZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Aug 23, 2023 at 8:01=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
> 6b8b6892e434 is not applied?
>
> Please submit patches using subject lines reflecting the style for the
> subsystem, this makes it easier for people to identify relevant patches.
> Look at what existing commits in the area you're changing are doing and
> make sure your subject lines visually resemble what they're doing.
> There's no need to resubmit to fix this alone.

Dear Mark,
Please allow me to explain in more detail.
The 6b8b6892e434 should not be applied into file0yZ50U branch of broonie/ci=
.git.
Because the original commit 273bc8bf2227 ("ASoC: Intel: Add
rpl_nau8318_8825 driver") was applied on 2023-08-14.
But two days ago, 6b8b6892e434 tried to commit THE SAME patch again on
2023-08-21, but it just only added a little part content from original
273bc8bf2227.
+static const struct snd_soc_acpi_codecs rpl_nau8318_amp =3D {
+ .num_codecs =3D 1,
+ .codecs =3D {"NVTN2012"}
+};
+
It caused "rpl_nau8318_amp" to be redefined.
This condition only happens at broonie/ci.git's file0yZ50U branch.

Could you check this one again?  thanks.
